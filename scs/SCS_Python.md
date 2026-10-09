---
document: SCS
id: SCS-PYTHON
version: 1.1.0
stage: Stable
status: Active
owner: AIDDM / Community
scope:
  - language: python
  - level: language
applies_with:
  - SCS_STD.md
---

# Software Coding Standard — Python

## 1. Role & Positioning (Normative)

This document defines **Python-specific coding standards**
within the AIDDM SCS framework.

It represents **Language Layer Standards**
and MUST be applied together with `SCS_STD.md`.

---

## 2. Language Baseline

This standard aligns with:
- PEP 8 — Style Guide for Python Code
- PEP 257 — Docstring Conventions

These references define syntax and formatting baselines
and are not restated here.

---

## 3. Standard Items

### SCS-PY-001 — Explicitness over cleverness

#### description
Python code should favor explicit, readable constructs
over compact or clever expressions that obscure intent.

#### applies_to
- language: python
- construct: expression
- readability: explicit

#### role
- AI
- Human

#### intent
Favor explicit Python constructs.

#### severity
MUST

---

### SCS-PY-002 — Explicit exception handling

#### description
Exceptions must be handled explicitly.
Broad exception handling (e.g., bare `except`)
should be avoided unless fully justified.

#### applies_to
- language: python
- construct: exception_handling
- handler: explicit_only

#### role
- AI
- Human

#### intent
Prevent hidden control flow masking.

#### severity
MUST

---

### SCS-PY-003 — Typed data structures

#### description
Data-only structures such as DTOs, Results, Reports, or Models
should be explicitly typed and immutable where practical.

#### applies_to
- language: python
- element: class
- purpose: data_container
- mutability: immutable_preferred

#### role
- AI
- Human

#### intent
Promote safe and predictable data structures.

#### severity
SHOULD

---

### SCS-PY-004 — Boundary input validation

#### description
External inputs (e.g., CLI arguments or API requests)
should be validated and typed at system boundaries.

#### applies_to
- language: python
- input_boundary: external
- validation: required

#### role
- AI
- Human

#### intent
Ensure correctness of external inputs.

#### severity
SHOULD

---

### SCS-PY-005 — Deterministic core logic

#### description
Core logic should avoid hidden state,
non-deterministic behavior, or side effects
that are not explicitly expressed.

#### applies_to
- language: python
- behavior: deterministic
- side_effects: explicit_only

#### role
- AI
- Human

#### intent
Maintain predictable Python execution.

#### severity
MUST
