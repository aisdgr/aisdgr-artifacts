---
id: VSS-EXAMPLE-CAS
document: Identity Service Coding Architecture Specification
version: 1.0.0
status: example
author: AISDGR
created: 2026-10-09
updated: 2026-10-09
---

# Coding Architecture Specification (CAS)

## Change History

| Version | Date       | Author | Description            |
| ------- | ---------- | ------ | ---------------------- |
| 1.0.0   | 2026-10-09 | AISDGR | Initial public example |

## 1. Introduction

### 1.1 Purpose

Define enforceable code boundaries for the Identity Service described by
`VSS-EXAMPLE-SRS`.

### 1.2 Scope

This specification covers authentication, JWT issuance, session revocation,
user management, persistence, and HTTP delivery.

### 1.3 Definitions

| Term | Meaning |
| ---- | ------- |
| Domain | Business entities and policies without infrastructure dependencies |
| Application | Use cases coordinating domain operations and ports |
| Adapter | HTTP, database, cryptography, and token implementations |

### 1.4 References

- `VSS-EXAMPLE-SRS`
- `VSS-EXAMPLE-SDS`
- `VSS-EXAMPLE-CSS`

### 1.5 Document Overview

Sections 2–5 define layers, modules, constraints, and permitted interfaces.

## 2. Architectural Context

### 2.1 Context Overview

API clients call one deployable Identity Service. The service accesses its own
relational database and signing keys supplied by a secret manager.

### 2.2 Architectural Principles

- Dependency direction points inward toward domain and application code.
- Authentication and authorization decisions are separate operations.
- Token parsing never substitutes for current account-status checks on
  administrator operations.
- Credential and signing-key representations do not cross public interfaces.

### 2.3 Architectural Layers

| Layer | Responsibility | May depend on |
| ----- | -------------- | ------------- |
| Domain | User, role, and session policies | Standard library only |
| Application | Login and user-management use cases | Domain and declared ports |
| Adapters | HTTP, persistence, hashing, JWT, clock | Application ports and domain |
| Bootstrap | Configuration and dependency wiring | All layers |

## 3. Module Structure

### 3.1 Authentication

#### CAS-MOD-AUTH

Owns login, refresh, logout, password verification, and token issuance use
cases. It may call user/session repositories and crypto/token ports. It shall
not implement HTTP serialization or SQL.

### 3.2 User Management

#### CAS-MOD-USERS

Owns profile lookup, user creation, role replacement, and status changes. It
may request session revocation after security-sensitive updates.

### 3.3 Security Adapters

#### CAS-MOD-SECURITY

Implements Argon2id hashing, JWT signing/verification, opaque refresh-token
generation, and sensitive-value redaction. No other module may use crypto
libraries directly.

### 3.4 Persistence

#### CAS-MOD-PERSISTENCE

Implements repository ports and transaction boundaries. Database records are
mapped to domain types before crossing this module boundary.

## 4. Architectural Constraints

### 4.1 Design Constraints

- HTTP handlers call application use cases, never repositories directly.
- Domain code has no framework, database, JWT, or web imports.
- Role and status changes revoke sessions in the same transaction as the
  account update.
- Errors cross layers as typed codes, not framework exceptions.

### 4.2 Technology Constraints

- JWT access tokens use an asymmetric algorithm and include `kid`, `iss`,
  `aud`, `sub`, `iat`, `exp`, `jti`, and `roles`.
- Refresh tokens remain opaque and are persisted only as hashes.
- Runtime secrets come from injected configuration, never source files.

### 4.3 Integration Constraints

The database and secret manager are the only required external integrations.
Calls to either must be bounded by timeouts. Key rotation must allow old public
keys to remain available until all corresponding access tokens expire.

## 5. Interface Architecture

#### CAS-INT-USER-REPOSITORY

Provides `findById`, `findByNormalizedEmail`, `create`, `replaceRoles`, and
`changeStatus`; it never returns password hashes in profile projections.

#### CAS-INT-SESSION-REPOSITORY

Provides atomic `createFamily`, `rotate`, `revokeFamily`, and `revokeAllForUser`
operations.

#### CAS-INT-TOKEN-SERVICE

Issues and verifies access tokens and generates opaque refresh tokens. The
interface accepts domain claims rather than HTTP request objects.
