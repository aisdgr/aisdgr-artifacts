---
id: VSS-EXAMPLE-SDS
document: Identity Service Software Design Specification
version: 1.0.0
status: example
author: AISDGR
created: 2026-10-09
updated: 2026-10-09
---

# Software Design Specification (SDS)

## Documentation Sensitivity Notice

This is a fictional public example. It contains no production endpoints,
credentials, signing keys, user data, or undisclosed system details.

## Change History

| Version | Date       | Author | Description            |
| ------- | ---------- | ------ | ---------------------- |
| 1.0.0   | 2026-10-09 | AISDGR | Initial public example |

## 1. Purpose & Scope

### 1.1 Purpose

Describe a project-specific design for the example Identity Service.

### 1.2 Scope

The design covers HTTP request handling, users, password authentication, JWT
access tokens, rotating refresh sessions, persistence, and audit events.

## 2. Design Overview

#### SDS-OVERVIEW-001

The service is a stateless HTTP process except for user and refresh-session
records stored in a relational database. Access tokens are verified locally;
refresh and administrative operations consult current database state.

Primary boundaries are HTTP adapters, application services, domain policies,
repository adapters, and security adapters. This design implements
`VSS-EXAMPLE-SRS` within `VSS-EXAMPLE-CAS` constraints.

## 3. Design Components

### 3.1 Authentication

#### SDS-COMP-LOGIN

The login handler validates transport shape and calls `LoginService`.
`LoginService` normalizes email, checks rate limits, loads the user, verifies
the password, creates a refresh-session family, and requests a signed JWT.

#### SDS-COMP-REFRESH

`RefreshService` hashes the presented opaque token and locks the matching
session row. It rejects expired or revoked sessions, detects reuse of consumed
tokens, and atomically stores the successor before returning it.

#### SDS-COMP-JWT

`JwtTokenService` signs access tokens with the active private key and verifies
algorithm, key ID, signature, issuer, audience, and time claims. A key provider
supplies the active signing key and verification set.

### 3.2 User Management

#### SDS-COMP-USERS

`UserAdminService` enforces last-administrator rules, hashes temporary
passwords, changes roles/status, and requests session revocation. Read models
exclude credential fields by construction.

## 4. Interaction & Data Flow

#### SDS-FLOW-LOGIN

1. Client sends email and password over HTTPS.
2. HTTP adapter validates the request and calls `LoginService`.
3. User repository returns an authentication projection.
4. Password verifier checks the stored Argon2id hash.
5. Session repository stores the hashed refresh token in a new family.
6. Token service signs a 15-minute JWT.
7. Adapter returns the JWT and a secure, HTTP-only refresh cookie.

#### SDS-FLOW-REFRESH

1. Adapter extracts the refresh cookie and calls `RefreshService`.
2. Repository locks and validates the matching token record.
3. Service marks it consumed and inserts its successor in one transaction.
4. Token service creates a new access token; adapter replaces the cookie.
5. Reuse of the old token revokes the family and emits a replay event.

#### SDS-FLOW-ROLE-CHANGE

The administrator request is authorized, the last-admin invariant is checked,
roles are replaced, and all sessions for the affected user are revoked in one
transaction. Existing access tokens expire naturally within 15 minutes; admin
endpoints additionally resolve current roles before mutation.

## 5. Interfaces & Adapters

#### SDS-INT-HTTP

JSON endpoints follow the paths in `VSS-EXAMPLE-SRS`. Validation failures and
domain errors are mapped to stable `application/problem+json` codes.

#### SDS-INT-DATABASE

Tables are `users`, `user_roles`, and `refresh_sessions`. Foreign keys enforce
ownership; unique indexes protect normalized email and refresh-token hash.

#### SDS-INT-KEYS

The key provider loads active key metadata from injected secret configuration.
Private key material is never returned by application interfaces or logs.

## 6. Cross-Cutting Concerns

#### SDS-XCUT-SECURITY

Input size limits, rate limits, least-privilege database access, secret
redaction, and dependency scanning apply across components. Audit events record
actor ID when known, target ID, outcome, event type, and correlation ID.

#### SDS-XCUT-OBSERVABILITY

Metrics include request duration, login outcome counts, refresh replay counts,
and database errors. Labels exclude email, user ID, token, and client address.

## 7. Error Handling Strategy

#### SDS-ERR-001

Adapters translate typed application errors to HTTP status and stable codes.
Unexpected errors become `INTERNAL_ERROR`; details are logged with a
correlation ID but not returned. Transaction failures roll back all security
state changes.

## 8. Deployment & Operational Design

#### SDS-OPS-001

Multiple identical instances run behind an HTTPS gateway. Database migrations
run as a separate release step. Signing-key rotation publishes the new public
key before activation and retains old verification keys for at least the
maximum access-token lifetime.

## Appendix A. Traceability

Component and flow IDs trace to SRS requirement IDs and STS test IDs by
explicit references; absence of a reference does not imply coverage.

## Appendix B. Authoring Constraints

This example uses stable IDs and separates design decisions from requirements
and tests.

## Appendix C. Notes

Production deployments should select concrete algorithms and parameters using
their current threat model and security policy.
