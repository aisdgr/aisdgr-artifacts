# Chat Execution Contract — add / test

This chat pattern defines how an AI executes
**test code creation**
based strictly on a provided XIM.

This document is an **execution adapter**.
It does NOT define rules, constraints, or policies.

---

## INPUT

### Execution Contract

- XIM:
  - {{XIM_PATH}}

The XIM is the **single source of truth** for:
- execution intent (add / test)
- user-provided inputs
- output artifact definition

---

## EXECUTION CONTEXT

- Execution type: **add / test**
- The AI MUST execute strictly according to the provided XIM.
- The AI MUST NOT consult any files
  other than those declared in XIM **User File Injection**.

System-level rules, constraints, and standards
are enforced externally by the runtime
and are **out of scope** for this document.

---

## CONTENT SOURCE BOUNDARY

- Test intent MUST be derived ONLY from:
  - User File Injection declared in XIM
    (e.g. STS, SRS, SDS, acceptance notes, IM)
  - direct human-provided text in XIM DETAIL

- Absence of some specification types
  is a **valid state**
  unless execution is blocked externally.

The AI MUST NOT:
- infer new requirements
- expand functional scope
- redesign behavior or interfaces
- reinterpret existing test intent

---

## TEST SCOPE

- Generate **test code only**.
- Tests MUST validate behaviors
  explicitly described in user-provided inputs.
- Every test case MUST be traceable
  to at least one user-provided input.

The AI MUST NOT:
- modify any existing production source code
- introduce tests for undeclared features
- refactor unrelated test code
- add coverage based on speculation

---

## RELATIONSHIP TO PRODUCTION CODE

- Production code is treated as **read-only context**.
- Tests MUST NOT rely on
  undocumented behavior or side effects.
- If test intent conflicts with existing behavior:
  - STOP execution
  - report the conflict
  - do NOT guess or compensate

---

## ARTIFACT BOUNDARY

- Test code MUST be written only
  to the artifact path declared in XIM.
- No additional files or directories
  may be created beyond the declared artifact scope.

---

## OUTPUT RULES

- Output ONLY the final test code.
- Do NOT include explanations,
  reasoning steps, annotations,
  or references to system rules.

---

## CANONICAL STATEMENT

This execution guarantees **traceability to user inputs only**.

Test completeness, coverage,
and testing strategy quality
are governed by human review.
