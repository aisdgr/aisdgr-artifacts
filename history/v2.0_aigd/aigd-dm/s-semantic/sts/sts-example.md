---
document: STS
id: STS-JWT
version: 1.0.0
stage: Released
status: Informative
owner: Spark Tsai
created: 2025-12-20
updated: 2025-12-20
---

# Software Test Specification (STS)

> This document specifies **verifiable authentication and authorization behaviors**
> based on JSON Web Token (JWT) usage.
>
> It is written as a test-first, behavior-oriented specification
> and does not assume prior existence of SRS or SDS documents.

---

## 0. Change History

| Version | Date       | Author     | Description         |
| ------- | ---------- | ---------- | ------------------- |
| 1.0.0   | 2025-12-20 | Spark Tsai | Initial STS example |

---

## 1. Introduction

### 1.1 Purpose

This STS defines observable system behaviors related to
JWT-based authentication and authorization.

### 1.2 Scope

This document covers:
- token validity handling,
- access control decisions,
- error behavior for invalid or expired tokens.

### 1.3 Definitions, Acronyms, Abbreviations

| Term | Description    |
| ---- | -------------- |
| JWT  | JSON Web Token |

### 1.4 References

- RFC 7519 — JSON Web Token (JWT)

### 1.5 Document Overview

Section 2 describes the overall test perspective.
Section 3 defines concrete, verifiable behavior specifications.

---

## 2. Overall Test Description

### 2.1 Test Perspective

Testing focuses on externally observable authorization outcomes
from the perspective of a client interacting with a protected system.

### 2.2 Test Scope and Coverage

The following behaviors are covered:
- valid token acceptance,
- expired token rejection,
- malformed token handling,
- missing token handling.

### 2.3 Test Roles and Responsibilities

- Client: initiates requests with or without tokens
- System: evaluates token validity and authorization outcome

### 2.4 Test Environment Assumptions

- Tokens are issued by a trusted authority.
- System clock is consistent within acceptable tolerance.

### 2.5 Test Constraints

- No assumptions are made about token storage or transmission mechanism.
- No assumptions are made about underlying frameworks or libraries.

### 2.6 Assumptions and Dependencies

- Token structure conforms to JWT standard.
- Authorization decisions are deterministic.

---

## 3. Test Specifications

### 3.1 Test Area: AUTH

#### TS-AUTH-001

**DESCRIPTION**  
Verify that access is granted when a valid JWT is presented.

**GIVEN / PREREQUISITES**  
- A JWT that is correctly signed
- The token is not expired
- The token contains required authorization claims

**WHEN / TEST_STEPS**  
- The client attempts to access a protected resource
  while presenting the JWT

**THEN / EXPECTED_RESULT**  
- The system authorizes the request
- Access to the protected resource is granted

---

#### TS-AUTH-002

**DESCRIPTION**  
Verify that access is denied when an expired JWT is presented.

**GIVEN / PREREQUISITES**  
- A JWT that was valid but is now expired

**WHEN / TEST_STEPS**  
- The client attempts to access a protected resource
  while presenting the expired JWT

**THEN / EXPECTED_RESULT**  
- The system rejects the request
- Access to the protected resource is denied

---

#### TS-AUTH-003

**DESCRIPTION**  
Verify that access is denied when a malformed JWT is presented.

**GIVEN / PREREQUISITES**  
- A token that does not conform to JWT structure

**WHEN / TEST_STEPS**  
- The client attempts to access a protected resource
  while presenting the malformed token

**THEN / EXPECTED_RESULT**  
- The system rejects the request
- Access to the protected resource is denied

---

#### TS-AUTH-004

**DESCRIPTION**  
Verify that access is denied when no JWT is presented.

**GIVEN / PREREQUISITES**  
- No authentication token is provided

**WHEN / TEST_STEPS**  
- The client attempts to access a protected resource
  without presenting any token

**THEN / EXPECTED_RESULT**  
- The system rejects the request
- Access to the protected resource is denied

---

## Appendix A. Traceability Policy (Informative)

Traceability to upstream requirement or design documents
may be added if such documents exist.

This STS does not require upstream documents to be valid.

---

## Appendix B. Authoring and Structural Constraints (Informative)

This document follows the canonical STS template defined
under AIGDMM.

---

## Appendix C. Methodology Compatibility Notes (Informative)

This STS is compatible with:
- Behavior-Driven Development (BDD)
- Test-Driven Development (TDD)
- Acceptance Test–Driven Development (ATDD)

---

## Appendix D. Notes

This document is provided as an example only.
