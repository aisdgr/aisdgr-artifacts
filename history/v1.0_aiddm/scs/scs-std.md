---
document: SCS
id: SCS-STD
version: 1.1.0
stage: Stable
status: Approved
scope:
  - language: generic
  - level: core
---

# Software Coding Standard — Core (STD)

## 1. Purpose

This document defines the **minimum, non-negotiable coding standards**
for all AIDDM-related projects.

These standards apply to:
- Any programming language
- Any SDK, service, or tool
- Any AI-generated or human-written code

---

## 2. Standard Items

### SCS-STD-001 — Explicit error handling

#### description
All code must handle error conditions explicitly.
Silent failures, swallowed exceptions, or ambiguous return values
must not be treated as normal control flow.

#### applies_to
- element: code_path
- error_handling: required

#### role
- AI
- Human

#### intent
Make failures explicit and diagnosable.

#### severity
MUST

---

### SCS-STD-002 — Deterministic behavior

#### description
Given the same inputs, program behavior and outputs must be consistent.
Core logic must not rely on randomness, implicit state,
or unstable ordering.

#### applies_to
- behavior: deterministic
- randomness: forbidden_unless_seeded

#### role
- AI
- Human

#### intent
Ensure reproducible execution.

#### severity
MUST

---

### SCS-STD-003 — Sensitive data logging

#### description
Logs must not expose sensitive information,
including secrets, tokens, personal data,
or internal confidential values.

#### applies_to
- logging: enabled
- data_classification: sensitive_excluded

#### role
- AI
- Human

#### intent
Prevent sensitive data leakage via logs.

#### severity
MUST

---

### SCS-STD-004 — Readability and self-description

#### description
Source code should be readable and self-describing,
allowing maintainers to understand intent and behavior
without relying on external context.

#### applies_to
- element: source_code
- readability: required

#### role
- Human

#### intent
Improve long-term maintainability.

#### severity
SHOULD