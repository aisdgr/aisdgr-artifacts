---
document: CIS
id: CIS-JWT
version: 1.0.0
stage: Released
status: Informative
owner: Spark Tsai
created: 2025-12-25
updated: 2025-12-25
---

# Conceptual Implementation Specification (CIS)

CIS defines design-level decision structures that describe
how a system interprets conditions and produces outcomes.

CIS does NOT define execution flow.

---

## 0. Change History

| Version | Date       | Author     | Description             |
| ------- | ---------- | ---------- | ----------------------- |
| 1.0.0   | 2025-12-25 | Spark Tsai | Initial JWT CIS example |

---

## 1. Introduction

### 1.1 Purpose

This CIS defines **conceptual, composable decision rules**
for JWT-based authentication and authorization.

It provides a neutral decision model that bridges:
- SRS requirements,
- SDS design responsibilities,
- STS observable behaviors,

without encoding execution order, framework logic, or control flow.

---

### 1.2 Scope

Included:
- Token presence evaluation
- Token structural validity
- Signature integrity validation
- Expiration handling
- Claim consistency checks
- Authorization decision outcomes

Excluded:
- Authentication workflows
- Token issuance procedures
- Transport or storage mechanisms
- Middleware or pipeline sequencing

---

### 1.3 Definitions, Acronyms, Abbreviations

| Term        | Description               |
| ----------- | ------------------------- |
| JWT         | JSON Web Token (RFC 7519) |
| AUTHZ       | Authorization             |
| Well-Formed | Structurally valid JWT    |
| Malformed   | Structurally invalid JWT  |

---

### 1.4 References

- SRS-JWT
- SDS-JWT
- STS-JWT
- RFC 7519 — JSON Web Token
- RFC 6750 — Bearer Token Usage

---

## 2. Conceptual Model Overview

### 2.1 Concept Perspective

JWT validation is modeled as a set of **independent decision fragments**,
each mapping a conceptual condition to a deterministic outcome.

These fragments are:
- Order-independent
- Composable
- Traceable to requirements, design, and tests

---

### 2.2 Concept Boundaries

This CIS:
- **MUST NOT** define execution sequence
- **MUST NOT** imply control flow
- **MUST NOT** bind to implementation technology

---

## 3. Meta Definitions

Meta defines neutral conceptual keys.  
Meta **MUST NOT** encode behavior or logic.

### Meta List

#### AUTHORIZATION_META

- `AUTHZ_DECISION` - `ALLOW | DENY`
- `VALIDATION_RESULT` - `PASS | FAIL`

#### TOKEN_META

- `TOKEN_PRESENCE` - `PRESENT | MISSING`
- `TOKEN_STRUCTURE` - `WELL_FORMED | MALFORMED`
- `TOKEN_SIGNATURE` - `VALID | INVALID`
- `TOKEN_EXPIRATION` - `NOT_EXPIRED | EXPIRED`

#### CLAIM_META

- `CLAIM_ISSUER` - `MATCH | MISMATCH | NOT_CHECKED`
- `CLAIM_AUDIENCE` - `MATCH | MISMATCH | NOT_CHECKED`
- `AUTH_CLAIMS` - `SUFFICIENT | INSUFFICIENT | NOT_CHECKED`

#### ERROR_META

- `ERROR_CATEGORY` -
  - `NONE`
  - `MISSING_TOKEN`
  - `MALFORMED_TOKEN`
  - `INVALID_SIGNATURE`
  - `EXPIRED_TOKEN`
  - `INVALID_CLAIMS`

---

## 4. Rule Specifications

Rules define composable decision fragments.  
Rule order is NOT significant.

---

### JWT-AUTHORIZATION

#### RULE-JWT-AUTHZ-001

**Description**  
Deny authorization when no token is provided.

**Referenced Meta**
- TOKEN_PRESENCE
- AUTHZ_DECISION
- ERROR_CATEGORY

**Condition**
- TOKEN_PRESENCE = MISSING

**Outcome**
- AUTHZ_DECISION = DENY
- ERROR_CATEGORY = MISSING_TOKEN

**Trace**
- STS:STS-JWT:TS-AUTH-004

---

#### RULE-JWT-AUTHZ-002

**Description**  
Deny authorization when the token structure is invalid.

**Referenced Meta**
- TOKEN_STRUCTURE
- AUTHZ_DECISION
- ERROR_CATEGORY

**Condition**
- TOKEN_STRUCTURE = MALFORMED

**Outcome**
- AUTHZ_DECISION = DENY
- ERROR_CATEGORY = MALFORMED_TOKEN

**Trace**
- STS:STS-JWT:TS-AUTH-003

---

#### RULE-JWT-AUTHZ-003

**Description**  
Deny authorization when signature validation fails.

**Referenced Meta**
- TOKEN_SIGNATURE
- AUTHZ_DECISION
- ERROR_CATEGORY

**Condition**
- TOKEN_SIGNATURE = INVALID

**Outcome**
- AUTHZ_DECISION = DENY
- ERROR_CATEGORY = INVALID_SIGNATURE

**Trace**
- SRS:SRS-JWT:FR-002
- SDS:SDS-JWT:SDS-DES-VALIDATOR

---

#### RULE-JWT-AUTHZ-004

**Description**  
Deny authorization when the token is expired.

**Referenced Meta**
- TOKEN_EXPIRATION
- AUTHZ_DECISION
- ERROR_CATEGORY

**Condition**
- TOKEN_EXPIRATION = EXPIRED

**Outcome**
- AUTHZ_DECISION = DENY
- ERROR_CATEGORY = EXPIRED_TOKEN

**Trace**
- SRS:SRS-JWT:BR-001
- STS:STS-JWT:TS-AUTH-002

---

#### RULE-JWT-AUTHZ-005

**Description**  
Deny authorization when issuer claim mismatches.

**Referenced Meta**
- CLAIM_ISSUER
- AUTHZ_DECISION
- ERROR_CATEGORY

**Condition**
- CLAIM_ISSUER = MISMATCH

**Outcome**
- AUTHZ_DECISION = DENY
- ERROR_CATEGORY = INVALID_CLAIMS

**Trace**
- SDS:SDS-JWT:SDS-DES-VALIDATOR

---

#### RULE-JWT-AUTHZ-006

**Description**  
Deny authorization when audience claim mismatches.

**Referenced Meta**
- CLAIM_AUDIENCE
- AUTHZ_DECISION
- ERROR_CATEGORY

**Condition**
- CLAIM_AUDIENCE = MISMATCH

**Outcome**
- AUTHZ_DECISION = DENY
- ERROR_CATEGORY = INVALID_CLAIMS

**Trace**
- SDS:SDS-JWT:SDS-DES-VALIDATOR

---

#### RULE-JWT-AUTHZ-007

**Description**  
Deny authorization when required authorization claims are insufficient.

**Referenced Meta**
- AUTH_CLAIMS
- AUTHZ_DECISION
- ERROR_CATEGORY

**Condition**
- AUTH_CLAIMS = INSUFFICIENT

**Outcome**
- AUTHZ_DECISION = DENY
- ERROR_CATEGORY = INVALID_CLAIMS

**Trace**
- STS:STS-JWT:TS-AUTH-001

---

#### RULE-JWT-AUTHZ-008

**Description**  
Allow authorization when all validation conditions are satisfied.

**Referenced Meta**
- TOKEN_PRESENCE
- TOKEN_STRUCTURE
- TOKEN_SIGNATURE
- TOKEN_EXPIRATION
- CLAIM_ISSUER
- CLAIM_AUDIENCE
- AUTH_CLAIMS
- AUTHZ_DECISION
- ERROR_CATEGORY

**Condition**
- TOKEN_PRESENCE = PRESENT
- TOKEN_STRUCTURE = WELL_FORMED
- TOKEN_SIGNATURE = VALID
- TOKEN_EXPIRATION = NOT_EXPIRED
- CLAIM_ISSUER ≠ MISMATCH
- CLAIM_AUDIENCE ≠ MISMATCH
- AUTH_CLAIMS ≠ INSUFFICIENT

**Outcome**
- AUTHZ_DECISION = ALLOW
- ERROR_CATEGORY = NONE

**Trace**
- STS:STS-JWT:TS-AUTH-001
- SRS:SRS-JWT:FR-002

---

### JWT-VALIDATION-RESULT

#### RULE-JWT-VAL-001

**Description**  
Map authorization approval to validation pass.

**Referenced Meta**
- AUTHZ_DECISION
- VALIDATION_RESULT

**Condition**
- AUTHZ_DECISION = ALLOW

**Outcome**
- VALIDATION_RESULT = PASS

**Trace**
- STS:STS-JWT:TS-AUTH-001

---

#### RULE-JWT-VAL-002

**Description**  
Map authorization denial to validation failure.

**Referenced Meta**
- AUTHZ_DECISION
- VALIDATION_RESULT

**Condition**
- AUTHZ_DECISION = DENY

**Outcome**
- VALIDATION_RESULT = FAIL

**Trace**
- STS:STS-JWT:TS-AUTH-002
- STS:STS-JWT:TS-AUTH-003
- STS:STS-JWT:TS-AUTH-004

---

## Appendix A. Authoring Rules

- CIS **MUST NOT** define execution flow
- Rules define condition-to-outcome only
- Meta **MUST** remain neutral
- Structure **MUST NOT** be altered manually
