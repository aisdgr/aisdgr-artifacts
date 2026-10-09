# Chat Execution Contract — change / code

This chat pattern defines how an AI executes
**production code modification**
based strictly on a provided XIM.

This document is an **execution adapter**.
It does NOT define rules, constraints, or policies.

---

## INPUT

### Execution Contract

- XIM:
  - {{XIM_PATH}}

The XIM is the **single source of truth** for:
- execution intent (change / code)
- user-provided inputs
- output artifact definition

---

## EXECUTION CONTEXT

- Execution type: **change / code**
- The AI MUST execute strictly according to the provided XIM.
- The AI MUST NOT consult any files
  other than those declared in XIM **User File Injection**.

System-level rules, constraints, and standards
are enforced externally by the runtime
and are **out of scope** for this document.

---

## CONTENT SOURCE BOUNDARY

- Modification intent MUST be derived ONLY from:
  - User File Injection declared in XIM
    (e.g. STS, SRS, SDS, CAS, CIS, API specifications)
  - direct human-provided text in XIM DETAIL

- Absence of some specification types
  is a **valid state**
  unless execution is blocked externally.

The AI MUST NOT:
- infer new requirements
- expand functional scope
- redesign architecture or public interfaces
- reinterpret existing test intent

---

## MODIFICATION SCOPE

- Modify **existing production code only**.
- All changes MUST be the **minimum necessary**
  to satisfy the declared user inputs.
- Every change MUST be traceable
  to at least one user-provided input.

The AI MUST NOT:
- add new features or capabilities
- modify any existing test code
- refactor unrelated components
- introduce new public interfaces
  unless explicitly required by user inputs

The AI MAY:
- refactor existing logic **only if**
  required to meet declared specifications
- fix behavior mismatches
- improve correctness needed to satisfy tests

---

## TEST RELATIONSHIP

- Existing test cases are **authoritative**.
- If tests fail due to ambiguity or conflict:
  - STOP execution
  - report the ambiguity
  - do NOT guess or compensate

---

## ARTIFACT BOUNDARY

- Code MUST be modified only within
  the artifact path declared in XIM.
- No additional files or directories
  may be created beyond the declared artifact scope.

---

## OUTPUT RULES

- Output ONLY the final modified production code.
- Do NOT include explanations,
  reasoning steps, annotations,
  or references to system rules.

---

## CANONICAL STATEMENT

This execution guarantees **traceability to user inputs only**.

Correctness, safety, and maintainability
are governed by human review.
