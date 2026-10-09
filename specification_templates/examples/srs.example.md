---
id: VSS-EXAMPLE-SRS
document: Identity Service Software Requirements Specification
version: 1.0.0
status: example
author: AISDGR
created: 2026-10-09
updated: 2026-10-09
---

# Software Requirements Specification (SRS)

## Change History

| Version | Date       | Author | Description                    |
| ------- | ---------- | ------ | ------------------------------ |
| 1.0.0   | 2026-10-09 | AISDGR | Initial public example         |

## 1. Introduction

### 1.1 Purpose

Define the requirements for an Identity Service that supports user management,
password-based login, role-based authorization, and short-lived JWT access
tokens.

### 1.2 Scope

The example covers account creation by administrators, login, token refresh,
logout, profile retrieval, role changes, and account suspension. Registration,
social login, multi-factor authentication, and password recovery are excluded.

### 1.3 Definitions

| Term | Meaning |
| ---- | ------- |
| JWT | JSON Web Token used as a signed access credential |
| Access token | Short-lived JWT presented to protected APIs |
| Refresh token | Opaque, rotating credential used to obtain a new token pair |
| RBAC | Role-based access control |

### 1.4 References

- `VSS-EXAMPLE-CAS` — architecture boundaries
- `VSS-EXAMPLE-SDS` — component and data-flow design
- `VSS-EXAMPLE-STS` — acceptance tests

### 1.5 Document Overview

Section 2 defines the product context. Sections 3–6 define functional,
quality, business-rule, and interface requirements.

## 2. Overall Description

### 2.1 Product Perspective

The Identity Service is an HTTP API used by browser and server applications.
It owns credentials, roles, sessions, and token issuance but not application
domain data.

### 2.2 Product Functions

- Authenticate an active user with email and password.
- Issue and rotate access/refresh token pairs.
- Authorize protected operations using roles.
- Let administrators create, list, update, suspend, and reactivate users.
- Revoke sessions when a user logs out, is suspended, or has roles changed.

### 2.3 User Classes

| Class | Capabilities |
| ----- | ------------ |
| User | Login, logout, refresh a session, and read their own profile |
| Administrator | User capabilities plus user and role management |

### 2.4 Operating Environment

HTTPS, a relational database, and a secret-management facility are available.
Clients can store refresh tokens in secure, HTTP-only cookies.

### 2.5 Constraints

Passwords must never be stored or logged in plaintext. JWTs must use asymmetric
signatures and expose a key identifier. All timestamps use UTC.

### 2.6 Assumptions and Dependencies

Email ownership is established outside this example. A trusted gateway
terminates TLS, but the service still validates forwarded-origin configuration.

## 3. Functional Requirements

### 3.1 Authentication

#### SRS-AUTH-001 — Login

Given an active account and correct credentials, the service shall return an
access token and set a rotating refresh-token cookie. Invalid credentials shall
produce one generic authentication error without revealing whether the account
exists.

#### SRS-AUTH-002 — Refresh

The service shall exchange a valid, unused refresh token for a new token pair
and invalidate the submitted refresh token atomically.

#### SRS-AUTH-003 — Logout

The service shall revoke the current refresh-token family. Repeating logout
shall be safe and return the same successful outcome.

### 3.2 User Management

#### SRS-USER-001 — Create user

An administrator shall create a user with a unique normalized email, display
name, initial role set, and temporary password.

#### SRS-USER-002 — Read users

An authenticated user shall read their own profile. An administrator shall
read a paginated user list without password or refresh-token data.

#### SRS-USER-003 — Change roles

An administrator shall replace a user's role set. The change shall revoke all
of that user's existing sessions.

#### SRS-USER-004 — Change account status

An administrator shall suspend or reactivate a user. Suspension shall revoke
all sessions and prevent login and refresh.

## 4. Non-Functional Requirements

#### SRS-PERF-001

The 95th-percentile login response time shall be at most 500 ms under 100
requests per second, excluding external network latency.

#### SRS-SEC-001

Passwords shall be hashed with Argon2id using deployment-configured parameters.
Access tokens shall expire within 15 minutes; refresh tokens within 30 days.

#### SRS-SEC-002

After five failed login attempts within 15 minutes for the same account and
client address, further attempts shall be rate-limited without locking out
unrelated accounts.

#### SRS-REL-001

Refresh-token rotation and revocation shall be transactional so that a token
cannot be successfully consumed twice.

#### SRS-MAINT-001

Security-relevant events shall use stable event names and correlation IDs,
without credentials or full tokens.

## 5. Business Rules

#### SRS-BR-001

Supported roles are `user` and `admin`. Every active account has at least the
`user` role, and the last active administrator cannot remove their own `admin`
role or suspend their own account.

## 6. Interface Requirements

### 6.1 API Interfaces

| Method | Path | Access | Purpose |
| ------ | ---- | ------ | ------- |
| POST | `/v1/auth/login` | Public | Authenticate and issue token pair |
| POST | `/v1/auth/refresh` | Refresh cookie | Rotate token pair |
| POST | `/v1/auth/logout` | Authenticated | Revoke current session family |
| GET | `/v1/users/me` | Authenticated | Read own profile |
| POST | `/v1/users` | Admin | Create user |
| GET | `/v1/users` | Admin | List users |
| PUT | `/v1/users/{id}/roles` | Admin | Replace role set |
| PUT | `/v1/users/{id}/status` | Admin | Suspend or reactivate user |

Errors use `application/problem+json` with `type`, `title`, `status`, `code`,
and `correlation_id` fields.

### 6.2 Data Interfaces

The service owns `users`, `user_roles`, and `refresh_sessions`. User IDs are
UUIDs. Email uniqueness is enforced on the normalized value. Refresh tokens
are stored only as cryptographic hashes.
