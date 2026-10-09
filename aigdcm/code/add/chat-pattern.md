# Chat Execution Contract — add / code

This chat pattern defines how an AI executes
**production code creation**
based strictly on a provided XIM.

This document is an **execution adapter**.
It does NOT define rules, constraints, or policies.

---

## INPUT

### Execution Contract

- XIM:
  - {{XIM_PATH}}

The XIM is the **single source of truth** for:
- execution intent
- user-provided inputs
- output artifact definition

---

## EXECUTION CONTEXT

- Execution type: **add / code**
- The AI MUST execute strictly according to the provided XIM.
- The AI MUST NOT consult any files
  other than those declared in XIM **User File Injection**.

System-level rules, constraints, and standards
are enforced externally by the runtime
and are **out of scope** for this document.

---

## CONTENT SOURCE BOUNDARY

- Implementation intent MUST be derived ONLY from:
  - User File Injection declared in XIM
    (e.g. STS, SRS, SDS, CAS, CIS, API specifications)
  - direct human-provided text in XIM DETAIL

- Missing specification types
  (e.g. absent SDS or CAS)
  are a **valid state**
  unless execution is blocked externally.

The AI MUST NOT:
- infer new requirements
- expand specification scope
- redesign architecture
- reinterpret test intent

---

## IMPLEMENTATION SCOPE

- Generate **production code only**.
- Implementation MUST be the **minimum necessary**
  to satisfy the declared user inputs.
- Every implemented behavior MUST be traceable
  to at least one user-provided input.

The AI MUST NOT:
- modify existing test code
- introduce new features
- refactor unrelated components
- alter public interfaces
  unless explicitly required by user inputs

---

## TEST RELATIONSHIP

- Existing test cases are **authoritative**.
- If tests fail due to ambiguity or conflict:
  - STOP execution
  - report the ambiguity
  - do NOT guess or compensate

---

## ARTIFACT BOUNDARY

- Code MUST be written only to the artifact path
  declared in XIM.
- No additional files or directories
  may be created beyond the declared artifact scope.

---

## OUTPUT RULES

- Output ONLY the final production code.
- Do NOT include explanations,
  reasoning steps, annotations,
  or references to system rules.

---

## CANONICAL STATEMENT

This execution guarantees **traceability to user inputs only**.

Correctness, quality, performance,
and long-term maintainability
are governed by human review.
