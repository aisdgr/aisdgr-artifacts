---
id: VSS-EXAMPLE-CIS
document: Identity Service Conceptual Implementation Specification
version: 1.0.0
status: example
author: AISDGR
created: 2026-10-09
updated: 2026-10-09
---

# Conceptual Implementation Specification (CIS)

## Change History

| Version | Date       | Author | Description            |
| ------- | ---------- | ------ | ---------------------- |
| 1.0.0   | 2026-10-09 | AISDGR | Initial public example |

## 1. Introduction

### 1.1 Purpose

Describe technology-neutral decision structures for login, JWT authorization,
refresh rotation, and user administration.

### 1.2 Scope

The decisions implement `SRS-AUTH-001` through `SRS-USER-004`. Concrete
algorithms, libraries, database syntax, and HTTP framework behavior are outside
this conceptual specification.

### 1.3 Definitions

| Term | Meaning |
| ---- | ------- |
| Principal | Authenticated identity and claims derived from an access token |
| Token family | Chain of refresh tokens originating from one login |
| Replay | Reuse of a refresh token that has already been rotated |

### 1.4 References

- `VSS-EXAMPLE-SRS`
- `VSS-EXAMPLE-CAS`
- `VSS-EXAMPLE-STS`

### 1.5 Document Overview

Section 2 establishes common concepts; section 3 defines decisions and
observable outcomes.

## 2. Conceptual Model Overview

### 2.1 Conceptual Context

Credentials establish identity only during login. Access tokens carry a
short-lived principal. Refresh tokens maintain a revocable session independently
of access-token lifetime.

### 2.2 Conceptual Approach

Every request is evaluated in this order: establish credential validity,
resolve current security state when required, evaluate authorization, perform
one state transition, and emit an auditable outcome.

### 2.3 Conceptual Patterns

- Fail closed when token claims, account state, or required role is invalid.
- Return generic public authentication failures while recording specific,
  non-sensitive audit reasons.
- Treat refresh rotation as compare-and-replace.
- Revoke all sessions after role or status changes.

## 3. Decision Structure

#### CIS-DEC-LOGIN

Inputs: normalized email, password, client address, and current time.

1. If the rate limit is exceeded, return `AUTH_RATE_LIMITED`.
2. If no active user matches or the password is incorrect, record a failed
   attempt and return `AUTH_INVALID_CREDENTIALS`.
3. Otherwise create a token family, issue a short-lived access token and one
   refresh token, then record `LOGIN_SUCCEEDED`.

This decision traces to `SRS-AUTH-001`, `SRS-SEC-001`, and `SRS-SEC-002`.

#### CIS-DEC-REFRESH

Inputs: presented refresh token, client context, and current time.

1. If the token is unknown, expired, or belongs to an inactive user, return
   `AUTH_INVALID_REFRESH`.
2. If the token was previously consumed, revoke its entire family, record
   `REFRESH_REPLAY_DETECTED`, and return `AUTH_INVALID_REFRESH`.
3. Otherwise atomically mark it consumed, create its successor, and issue a
   new access token.

This decision traces to `SRS-AUTH-002` and `SRS-REL-001`.

#### CIS-DEC-AUTHORIZE

Inputs: verified principal, required roles, and optional current user state.

1. Missing or invalid credentials yield `AUTH_REQUIRED`.
2. An expired token yields `TOKEN_EXPIRED`.
3. A suspended or missing current user yields `ACCOUNT_INACTIVE`.
4. Missing required roles yield `ACCESS_DENIED`.
5. Otherwise the operation is permitted.

#### CIS-DEC-CHANGE-ROLES

Only an administrator may replace roles. The resulting role set must contain
`user`. Removing `admin` from the last active administrator is rejected with
`LAST_ADMIN_REQUIRED`. On success, roles are replaced and all user sessions
are revoked atomically.

#### CIS-DEC-CHANGE-STATUS

Only an administrator may change status. Self-suspension by the last active
administrator is rejected. Suspension changes status and revokes all sessions
atomically; reactivation does not restore revoked sessions.
