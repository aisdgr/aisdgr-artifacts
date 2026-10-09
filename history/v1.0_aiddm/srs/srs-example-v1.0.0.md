---
document: SRS
id: SRS-SAMPLE-JWT
version: 1.0.0
stage: Draft
status: Sample
owner: AIDDM Core Team
created: 2025-12-13
updated: 2025-12-13
related:
  - SAS-SAMPLE-JWT
  - SDS-SAMPLE-JWT
  - STS-SAMPLE-JWT
  - SCS-SAMPLE-JWT
---

# Software Requirements Specification (SRS) — Sample: JWT Authentication

## Documentation Sensitivity Notice (Normative)

In an AI-driven development lifecycle, documentation is no longer a passive descriptive artifact.

Once documentation becomes structured, traceable, and sufficiently complete to drive automated code generation, testing, or verification, it constitutes **executable knowledge**.

As a result, **document leakage carries risks comparable to source code exposure**, even in the absence of direct access to implementation artifacts.

This sample is intentionally scoped to an industry-standard topic (JWT authentication) and does not disclose proprietary system logic.

---

## 0. Change History

| Version | Date       | Author | Description    |
| ------- | ---------- | ------ | -------------- |
| 1.0.0   | 2025-12-13 | <Name> | Initial sample |

---

## 1. Introduction

### 1.1 Purpose
This SRS sample demonstrates an AIDDM-compliant structure for specifying JWT-based authentication and authorization behavior for a generic HTTP service.

### 1.2 Scope
In scope:
- Validating JWT access tokens for protected endpoints
- Enforcing authorization based on claims (roles/scopes)
- Returning standardized authentication/authorization errors
- Basic audit logging of authentication outcomes (non-sensitive)

Out of scope:
- UI/UX flows (login pages, consent screens)
- Proprietary policy engines or tenant-specific business rules
- Key management implementation details (KMS vendor specifics)
- Advanced risk scoring, anomaly detection, or fraud models

### 1.3 Definitions, Acronyms, and Abbreviations

| Term               | Description                              |
| ------------------ | ---------------------------------------- |
| JWT                | JSON Web Token                           |
| JWS                | JSON Web Signature                       |
| JWK                | JSON Web Key                             |
| JWKS               | JWK Set (public keys endpoint)           |
| Issuer (`iss`)     | Token issuer claim                       |
| Audience (`aud`)   | Intended recipient claim                 |
| Expiration (`exp`) | Token expiry timestamp                   |
| Scope              | Permission string used for authorization |

### 1.4 References
- RFC 7519 (JSON Web Token)
- RFC 7517 (JSON Web Key)
- RFC 7515 (JSON Web Signature)
- Organization security policy (if applicable)

### 1.5 Document Overview
Section 3 defines functional requirements for JWT validation and authorization.  
Section 4 defines non-functional requirements such as security, performance, and auditability.  
Section 9 defines traceability expectations.

### 1.6 Documentation as Executable Knowledge (Normative)
This document follows the AIDDM principle that structured specifications can become executable knowledge when used with AI-assisted tooling. Handling and sharing MUST comply with the organization’s sensitivity classification and access control policies.

---

## 2. Overall Description

### 2.1 Product Perspective
The service exposes HTTP APIs. Some endpoints are protected and require valid JWTs. The service may integrate with an external identity provider (IdP) that issues JWTs and publishes public keys via JWKS.

### 2.2 Product Functions
- Validate JWTs for protected endpoints
- Authorize requests based on claims (role/scope)
- Provide consistent error responses for auth failures
- Log authentication outcomes for audit purposes

### 2.3 User Classes and Characteristics

| User Role            | Description                                                 |
| -------------------- | ----------------------------------------------------------- |
| API Client Developer | Integrates with protected endpoints and handles auth errors |
| Service Developer    | Implements middleware, config, and observability            |
| Security Engineer    | Defines validation rules and monitors auth events           |
| QA Engineer          | Verifies expected behaviors via test cases                  |

### 2.4 Operating Environment
- HTTP service runtime (language/framework unspecified)
- Network connectivity to IdP/JWKS endpoint (optional caching)
- Centralized logging/metrics backend (optional)

### 2.5 Design and Implementation Constraints
- Must support standard JWT validation rules (`iss`, `aud`, `exp`, signature)
- Must not log sensitive token contents
- Must follow organization-approved cryptography primitives

### 2.6 Assumptions and Dependencies
- IdP provides JWTs signed with supported algorithms
- Public keys are available via JWKS or equivalent distribution
- Time synchronization is maintained within acceptable drift limits

---

## 3. Functional Requirements

### 3.1 Module: Token Validation

#### FR-JWT-001

##### title
Require JWT for Protected Endpoints

##### description
For any endpoint classified as protected, the service **MUST** require an access token provided via the `Authorization: Bearer <token>` header. Requests without an access token **MUST** be rejected.

##### rationale
Ensures protected resources are not accessible without authentication.

##### acceptance_criteria
- A request to a protected endpoint without an `Authorization` header returns `401 Unauthorized`.
- The response includes an error body indicating missing credentials.
- A request to an unprotected endpoint does not require a token.

---

#### FR-JWT-002

##### title
Validate Token Signature

##### description
The service **MUST** validate the JWT signature using trusted public keys. Tokens with invalid signatures **MUST** be rejected.

##### rationale
Prevents token forgery and impersonation.

##### acceptance_criteria
- A token with a modified payload or signature returns `401 Unauthorized`.
- A token signed by an unknown key identifier (kid) returns `401 Unauthorized`.
- The service does not attempt authorization checks if signature validation fails.

---

#### FR-JWT-003

##### title
Validate Standard Claims (iss, aud, exp, nbf)

##### description
The service **MUST** validate standard claims:
- `iss` (issuer) MUST match an allowlist.
- `aud` (audience) MUST match the configured audience.
- `exp` (expiration) MUST be in the future at the time of validation.
- `nbf` (not before), when present, MUST not be in the future beyond allowed clock skew.

##### rationale
Ensures tokens are issued by trusted parties, intended for this service, and time-valid.

##### acceptance_criteria
- A token with an untrusted `iss` returns `401 Unauthorized`.
- A token with a mismatched `aud` returns `401 Unauthorized`.
- An expired token returns `401 Unauthorized`.
- A token with `nbf` in the future returns `401 Unauthorized` (considering allowed skew).

---

#### FR-JWT-004

##### title
Handle Unsupported Algorithms

##### description
The service **MUST** reject tokens using unsupported or disallowed signing algorithms.

##### rationale
Prevents downgrade or insecure algorithm attacks.

##### acceptance_criteria
- A token signed with a disallowed algorithm returns `401 Unauthorized`.
- The error response does not reveal sensitive validation internals.

---

### 3.2 Module: Authorization

#### FR-JWT-005

##### title
Enforce Scope-Based Authorization

##### description
For endpoints that declare required scopes, the service **MUST** verify that the token contains the required scope(s). If required scopes are missing, the request **MUST** be rejected.

##### rationale
Implements least-privilege access control.

##### acceptance_criteria
- A valid token without required scopes returns `403 Forbidden`.
- A valid token with required scopes returns `200 OK` (or the endpoint’s success status).
- Scope evaluation is deterministic and consistent across requests.

---

#### FR-JWT-006

##### title
Enforce Role-Based Authorization

##### description
For endpoints that declare required roles, the service **MUST** verify that the token contains at least one acceptable role. If not, the request **MUST** be rejected.

##### rationale
Supports role-based access control (RBAC) patterns.

##### acceptance_criteria
- A valid token without required roles returns `403 Forbidden`.
- A valid token with required roles returns success.
- Role matching rules (case sensitivity, mapping) are consistently applied.

---

### 3.3 Module: Error Handling

#### FR-JWT-007

##### title
Standardize Authentication Error Responses

##### description
The service **MUST** return standardized error responses for authentication failures (`401`) and authorization failures (`403`). Responses **MUST NOT** include sensitive token contents or detailed validation internals.

##### rationale
Improves client interoperability and reduces information leakage risk.

##### acceptance_criteria
- `401` responses include a machine-readable error code and message.
- `403` responses include a machine-readable error code and message.
- Responses never include the raw token or decoded claims.

---

### 3.4 Module: Audit Logging

#### FR-JWT-008

##### title
Record Authentication and Authorization Outcomes

##### description
The service **MUST** record audit events for authentication and authorization outcomes for protected endpoints. Audit logs **MUST NOT** store full tokens or sensitive claim values.

##### rationale
Provides traceability for security monitoring and incident response.

##### acceptance_criteria
- Each protected request results in an audit event with outcome (success/fail) and timestamp.
- Audit events contain request correlation identifiers (if available).
- Logs do not contain the raw token value.

---

## 4. Non-Functional Requirements

### 4.1 Performance

#### NFR-PERF-001

##### title
Authentication Overhead Bound

##### description
JWT validation for protected endpoints SHOULD meet a performance target to minimize overhead.

##### acceptance_criteria
- JWT validation completes within a defined threshold at p90 under nominal load (threshold defined by the project).

---

### 4.2 Security

#### NFR-SEC-001

##### title
No Sensitive Token Data in Logs

##### description
The service **MUST NOT** log raw tokens or sensitive claims.

##### acceptance_criteria
- Logs never contain the full `Authorization` header value.
- Sensitive claims (e.g., identifiers) are either excluded or irreversibly masked.

---

#### NFR-SEC-002

##### title
Secure Defaults for Validation Rules

##### description
Validation rules **MUST** default to secure settings (deny-by-default) and require explicit configuration to relax constraints.

##### acceptance_criteria
- Unknown issuers/audiences are rejected by default.
- Unsupported algorithms are rejected by default.

---

### 4.3 Reliability

#### NFR-REL-001

##### title
Graceful Degradation on Key Retrieval Failure

##### description
If external key retrieval fails, the service SHOULD behave predictably and securely.

##### acceptance_criteria
- Validation failures due to missing keys result in `401 Unauthorized`.
- The service emits a non-sensitive operational alert/event.

---

### 4.4 Maintainability

#### NFR-MAIN-001

##### title
Configurable Validation Parameters

##### description
Issuer allowlist, audience, allowed algorithms, and clock skew MUST be configurable.

##### acceptance_criteria
- Configuration can be updated without code changes (mechanism unspecified).
- Misconfiguration results in clear startup/runtime errors without exposing secrets.

---

## 5. Business Rules

### 5.1 Module: Policy

#### BR-001

##### description
Protected endpoints MUST be explicitly declared; unlisted endpoints are treated as unprotected by default unless the service is configured for global protection.

##### acceptance_criteria
- A protected/unprotected classification exists for each endpoint or route group.
- The classification is deterministic and testable.

---

## 6. User Interface Requirements (Optional)
Not applicable.

---

## 7. External Interface Requirements

### 7.1 API Interfaces

#### EXR-API-001

##### description
The service consumes JWTs from the `Authorization: Bearer <token>` header for protected endpoints.

##### acceptance_criteria
- The service rejects malformed `Authorization` headers with `401 Unauthorized`.
- The service accepts properly formatted Bearer tokens.

---

### 7.2 Data Interfaces

#### EXR-DATA-001

##### description
The service consumes public keys from a JWKS endpoint or equivalent trusted source.

##### acceptance_criteria
- Key material is treated as trusted only from configured sources.
- Retrieval failures are handled according to NFR-REL-001.

---

## 8. System Constraints

#### CON-001

##### description
This sample MUST remain implementation-agnostic and MUST NOT prescribe specific libraries, vendors, or internal architectures.

---

## 9. Traceability Policy

- Every **FR MUST trace to SDS**
- Every **FR MUST be verifiable by STS**
- Trace completeness **MUST** be enforced by automated checks (e.g., `adk check`)
- Missing or broken trace links **FAIL AIDDM compliance**

---

## 10. Heading & Meta-Model Rules (Normative)

### 10.1 Heading Hierarchy

| Markdown | Meaning                     |
| -------- | --------------------------- |
| `#`      | Document Title              |
| `##`     | Section                     |
| `###`    | Requirement Group / Module  |
| `####`   | Requirement Item (Trace ID) |
| `#####`  | Requirement Field           |

### 10.2 Mandatory Requirement Fields

Each requirement item **MUST** include all of the following fields:

- `title`
- `description`
- `rationale`
- `acceptance_criteria`

---

## 11. Appendix

### 11.1 Notes
This sample is designed to demonstrate structure, granularity, and acceptance criteria style for AIDDM-compliant SRS documents.
