---
id: VSS-EXAMPLE-STS
document: Identity Service Software Test Specification
version: 1.0.0
status: example
author: AISDGR
created: 2026-10-09
updated: 2026-10-09
---

# Software Test Specification (STS)

## Change History

| Version | Date       | Author | Description            |
| ------- | ---------- | ------ | ---------------------- |
| 1.0.0   | 2026-10-09 | AISDGR | Initial public example |

## 1. Introduction

### 1.1 Purpose

Define observable acceptance tests for the example Identity Service.

### 1.2 Scope

Tests cover login, JWT authorization, refresh rotation, logout, user creation,
role changes, suspension, and sensitive-data handling.

### 1.3 Definitions

| Term | Meaning |
| ---- | ------- |
| System under test | Deployed Identity Service with isolated database and keys |
| Token A/B | Sequential refresh tokens in one token family |

### 1.4 References

- `VSS-EXAMPLE-SRS`
- `VSS-EXAMPLE-CIS`
- `VSS-EXAMPLE-SDS`

### 1.5 Document Overview

Section 2 defines the environment; section 3 specifies tests and traceability.

## 2. Overall Test Description

### 2.1 Test Perspective

Acceptance tests use only public HTTP interfaces and observable audit events.
Focused integration tests may inspect persistence constraints.

### 2.2 Test Scope and Coverage

Every functional requirement in sections 3 and 5 of the SRS has at least one
test below. Load-test execution for `SRS-PERF-001` is specified separately.

### 2.3 Roles and Responsibilities

The test runner owns fixtures and assertions. The system owns its database,
clock abstraction, signing keys, and audit sink.

### 2.4 Environment Assumptions

Tests use HTTPS, a clean database, a fixed clock, one active signing key, and
seeded active `admin@example.test` and `user@example.test` accounts.

### 2.5 Constraints

Fixtures contain synthetic `.test` addresses only. Logs captured by the test
must be treated as sensitive until redaction assertions pass.

### 2.6 Dependencies

Database migrations and the test signing key must be installed before tests.

## 3. Test Specifications

### 3.1 Authentication

#### STS-AUTH-001 — Successful login

- Traces to: `SRS-AUTH-001`, `SRS-SEC-001`
- Given: an active user with a known password
- When: valid credentials are posted to `/v1/auth/login`
- Then: status is 200; the response has a signed access JWT with the expected
  issuer, audience, subject, roles, and expiry no later than 15 minutes; a
  secure, HTTP-only refresh cookie is set.

#### STS-AUTH-002 — Generic invalid-credential response

- Traces to: `SRS-AUTH-001`
- Given: one request for an unknown email and one for a known email with the
  wrong password
- When: both login requests are submitted
- Then: public status, code, and message are identical; neither response
  reveals account existence.

#### STS-AUTH-003 — Refresh rotation and replay

- Traces to: `SRS-AUTH-002`, `SRS-REL-001`
- Given: token A from a successful login
- When: A is refreshed successfully, producing B, and A is submitted again
- Then: reuse of A fails, the family is revoked, and subsequent use of B fails.

#### STS-AUTH-004 — Logout idempotency

- Traces to: `SRS-AUTH-003`
- Given: an authenticated session
- When: logout is called twice and its refresh token is then used
- Then: both logout calls succeed and refresh is rejected.

#### STS-AUTH-005 — Login rate limit

- Traces to: `SRS-SEC-002`
- Given: five failed attempts for one account and client address in 15 minutes
- When: a sixth attempt is made
- Then: it is rate-limited, while a valid login for a different account from a
  different address remains available.

### 3.2 User Management

#### STS-USER-001 — Administrator creates user

- Traces to: `SRS-USER-001`
- Given: an administrator token and a unique mixed-case email
- When: a user is created
- Then: status is 201; subsequent lookup uses the normalized email; response
  and logs contain neither plaintext password nor password hash.

#### STS-USER-002 — User access boundaries

- Traces to: `SRS-USER-002`
- Given: a normal user and an administrator
- When: each requests their profile and the user list
- Then: both can read their own profile; only the administrator can list users;
  no result contains credential or refresh-token fields.

#### STS-USER-003 — Role change revokes sessions

- Traces to: `SRS-USER-003`, `SRS-BR-001`
- Given: an administrator changes an active user's roles
- When: the old refresh token is used
- Then: refresh fails and a later login receives the new role claims.

#### STS-USER-004 — Suspension

- Traces to: `SRS-USER-004`
- Given: an active user with a session
- When: an administrator suspends the user
- Then: refresh and new login fail; reactivation allows a new login but does
  not restore the old session.

#### STS-USER-005 — Last administrator protection

- Traces to: `SRS-BR-001`
- Given: exactly one active administrator
- When: that administrator removes their own admin role or suspends themself
- Then: both requests fail with `LAST_ADMIN_REQUIRED` and state is unchanged.

### 3.3 Security and Operations

#### STS-SEC-001 — Sensitive-data redaction

- Traces to: `SRS-MAINT-001`
- Given: successful and failed login, refresh, and administrative requests
- When: structured logs and audit events are inspected
- Then: correlation and event IDs exist, but passwords, authorization headers,
  cookies, complete JWTs, refresh tokens, and password hashes do not.

#### STS-PERF-001 — Login latency

- Traces to: `SRS-PERF-001`
- Given: production-equivalent hashing parameters and 100 login requests per
  second for 15 minutes after warm-up
- When: service-side latency is measured
- Then: the 95th percentile is at most 500 ms and no successful response is
  misclassified as an error.

## Appendix A. Traceability Policy

Trace links identify intended coverage and must be reviewed when either the SRS
or this STS changes.

## Appendix B. Authoring Constraints

Each test has a stable ID, explicit precondition, action, observable result,
and at least one requirement reference.

## Appendix C. Methodology Compatibility

The cases may be automated with any framework that preserves the stated public
observations and isolation.

## Appendix D. Notes

Cryptographic penetration testing and disaster recovery exercises are outside
this compact example.
