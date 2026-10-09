---
id: VSS-EXAMPLE-CSS
document: Identity Service Coding Structure Specification
version: 1.0.0
status: example
author: AISDGR
created: 2026-10-09
updated: 2026-10-09
---

# Coding Structure Specification (CSS)

## Change History

| Version | Date       | Author | Description            |
| ------- | ---------- | ------ | ---------------------- |
| 1.0.0   | 2026-10-09 | AISDGR | Initial public example |

## 1. Introduction

### 1.1 Purpose

Define one concrete source-tree structure that satisfies `VSS-EXAMPLE-CAS`.

### 1.2 Scope

This example names packages, classes, functions, and files, without prescribing
a programming language or framework.

### 1.3 Definitions

| Term | Meaning |
| ---- | ------- |
| Port | Application-owned interface implemented by an adapter |
| Handler | HTTP-facing adapter that validates transport input |

### 1.4 References

- `VSS-EXAMPLE-CAS`
- `VSS-EXAMPLE-SDS`

### 1.5 Document Overview

Section 2 describes structural responsibility; section 3 enumerates elements.

## 2. Structure Overview

### 2.1 Structural Context

The source tree has `domain`, `application`, `ports`, `adapters`, and
`bootstrap` roots. Tests mirror these roots and keep acceptance fixtures under
`tests/acceptance`.

### 2.2 Structural Responsibilities

Domain owns invariants, application owns workflows, ports define dependencies,
adapters translate technology-specific data, and bootstrap performs wiring.

### 2.3 Structural Hierarchy

```text
src/
  domain/{user,session}
  application/{auth,users}
  ports/{repositories,security,time}
  adapters/{http,persistence,security}
  bootstrap/
tests/{unit,integration,acceptance}/
```

## 3. Structural Elements

### 3.1 Packages

#### CSS-PKG-DOMAIN

Path: `src/domain`. Contains `User`, `RoleSet`, `AccountStatus`, and
`RefreshSession` with no adapter imports.

#### CSS-PKG-APPLICATION

Path: `src/application`. Contains use cases grouped under `auth` and `users`.
It imports domain types and interfaces from `ports` only.

#### CSS-PKG-ADAPTERS

Path: `src/adapters`. Contains HTTP handlers, repository implementations,
password hashing, JWT signing, and refresh-token generation.

### 3.2 Classes

#### CSS-CLS-LOGIN-SERVICE

`LoginService` coordinates rate limiting, user lookup, password verification,
session creation, and token issuance. It has no HTTP or SQL types.

#### CSS-CLS-USER-ADMIN-SERVICE

`UserAdminService` creates users, replaces roles, changes status, and invokes
session revocation within an application transaction.

#### CSS-CLS-JWT-TOKEN-SERVICE

`JwtTokenService` implements the token port and is the only class permitted to
construct or parse JWT claims.

### 3.3 Functions

#### CSS-FN-NORMALIZE-EMAIL

`normalizeEmail(value)` trims surrounding whitespace and applies the selected
case normalization consistently before lookup or uniqueness checks.

#### CSS-FN-REQUIRE-ROLE

`requireRole(principal, role)` returns an authorization decision and never
mutates the principal.

#### CSS-FN-REDACT-AUTH

`redactAuthFields(event)` removes password, authorization header, cookie, and
token values before structured logging.

### 3.4 Files

| ID | Path | Responsibility |
| -- | ---- | -------------- |
| CSS-FILE-LOGIN | `src/application/auth/login_service.*` | Login orchestration |
| CSS-FILE-REFRESH | `src/application/auth/refresh_service.*` | Rotation and replay handling |
| CSS-FILE-USERS | `src/application/users/user_admin_service.*` | User administration |
| CSS-FILE-JWT | `src/adapters/security/jwt_token_service.*` | JWT signing and verification |
| CSS-FILE-HTTP | `src/adapters/http/routes.*` | Route-to-handler registration |
| CSS-FILE-WIRING | `src/bootstrap/container.*` | Configuration and dependency wiring |
