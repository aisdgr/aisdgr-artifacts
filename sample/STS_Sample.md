---
document: STS
id: STS-SAMPLE-JWT
version: 1.0.0
stage: Draft
status: Sample
owner: AIDDM Core Team
created: 2025-12-13
updated: 2025-12-13
related:
  - SRS-SAMPLE-JWT
  - SAS-SAMPLE-JWT
  - SDS-SAMPLE-JWT
---

# System Test Specification (STS) — Sample: JWT Authentication

## Documentation Sensitivity Notice (Normative)

This document is a **sample** System Test Specification provided to
demonstrate AIDDM-compliant, behavior-driven test documentation.

It **inherits the normative assumptions defined in SRS, SAS, and SDS**.

The STS defines externally observable system behaviors and acceptance
conditions. When processed by AI-assisted tooling, this document may
be used to generate automated tests.

Accordingly:

- This document SHOULD be treated as a protected quality artifact.
- Sample STS documents MUST avoid revealing internal design or
  implementation strategies.
- This document focuses strictly on observable behavior at the
  system boundary.

---

## Human Readership & Usage (Normative)

This STS is intentionally written so that it can be **read and used
independently**, without requiring access to SRS, SAS, or SDS.

It is intended for:

- Engineers practicing **TDD, BDD, or ATDD**
- **QA and FAE** roles responsible for verification and acceptance
- Stakeholders validating delivery against expected behavior

The document defines **what the system does and how success is
determined**, not how the system is implemented.

---

## 0. Change History

| Version | Date       | Author | Description    |
| ------- | ---------- | ------ | -------------- |
| 1.0.0   | 2025-12-13 | <Name> | Initial sample |

---

## 1. Purpose & Scope

### 1.1 Purpose
This document specifies **externally observable behaviors and acceptance
conditions** for JWT-based authentication and authorization.

### 1.2 Scope
In scope:
- Authentication and authorization behavior at protected endpoints
- Observable error responses and outcomes

Out of scope:
- Token generation and identity provider behavior
- Internal validation logic or cryptographic implementation

---

## 2. Test Items

### Authentication — Token Presence & Validity

#### ID: STS-JWT-001

##### description
Verify that protected endpoints require a JWT access token.

##### prerequisites
- The system is running.
- A protected endpoint is available.

##### test steps
1. Send a request to a protected endpoint **without** an Authorization header.

##### expected result
- The request is rejected.
- The system responds with **401 Unauthorized**.

##### trace
- FR-JWT-001

---

#### ID: STS-JWT-002

##### description
Verify that requests with an invalid JWT are rejected.

##### prerequisites
- The system is running.
- A protected endpoint is available.

##### test steps
1. Send a request to a protected endpoint with a malformed or invalid JWT.

##### expected result
- The request is rejected.
- The system responds with **401 Unauthorized**.

##### trace
- FR-JWT-002
- FR-JWT-004

---

#### ID: STS-JWT-003

##### description
Verify that expired JWTs are rejected.

##### prerequisites
- The system is running.
- An expired JWT is available.

##### test steps
1. Send a request to a protected endpoint using an expired JWT.

##### expected result
- The request is rejected.
- The system responds with **401 Unauthorized**.

##### trace
- FR-JWT-003

---

### Authorization — Scope & Role Enforcement

#### ID: STS-JWT-004

##### description
Verify that access is denied when required scopes are missing.

##### prerequisites
- The system is running.
- A protected endpoint requires a specific scope.
- A valid JWT **without** the required scope is available.

##### test steps
1. Send a request to the protected endpoint using the valid JWT.

##### expected result
- The request is rejected.
- The system responds with **403 Forbidden**.

##### trace
- FR-JWT-005

---

#### ID: STS-JWT-005

##### description
Verify that access is granted when required scopes are present.

##### prerequisites
- The system is running.
- A protected endpoint requires a specific scope.
- A valid JWT **with** the required scope is available.

##### test steps
1. Send a request to the protected endpoint using the valid JWT.

##### expected result
- The request is accepted.
- The system responds with a **successful status code**.

##### trace
- FR-JWT-005

---

#### ID: STS-JWT-006

##### description
Verify that access is denied when required roles are missing.

##### prerequisites
- The system is running.
- A protected endpoint requires a specific role.
- A valid JWT **without** the required role is available.

##### test steps
1. Send a request to the protected endpoint using the valid JWT.

##### expected result
- The request is rejected.
- The system responds with **403 Forbidden**.

##### trace
- FR-JWT-006

---

### Error Handling & Observability

#### ID: STS-JWT-007

##### description
Verify that authentication and authorization errors do not expose
sensitive token information.

##### prerequisites
- The system is running.
- A protected endpoint is available.

##### test steps
1. Trigger an authentication or authorization failure.
2. Inspect the error response.

##### expected result
- The error response does **not** include the JWT value.
- The error response does **not** expose internal validation details.

##### trace
- FR-JWT-007
- NFR-SEC-001

---

#### ID: STS-JWT-008

##### description
Verify that authentication outcomes are recorded for audit purposes.

##### prerequisites
- The system is running.
- Audit logging is enabled.

##### test steps
1. Send a request to a protected endpoint that succeeds or fails authentication.

##### expected result
- An audit record is created for the request outcome.
- The audit record does **not** contain the raw JWT.

##### trace
- FR-JWT-008

---

## 3. Traceability Policy

- Each test item traces to at least one SRS requirement.
- No test item introduces new functional requirements.
- All authentication and authorization requirements are verifiable
  through STS items.

---

## 4. Heading & Meta-Model Rules (Normative)

### 4.1 Heading Hierarchy

| Markdown | Meaning                |
| -------- | ---------------------- |
| `#`      | Document Title         |
| `##`     | Section                |
| `###`    | Test Area / Capability |
| `####`   | Test Item ID           |
| `#####`  | Test Field             |

---

## 5. Notes

This STS sample is intentionally written as a **standalone, behavior-driven
verification document**, suitable for TDD/BDD workflows, QA validation,
and customer-facing acceptance without exposing internal system design.
