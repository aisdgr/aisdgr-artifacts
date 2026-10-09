# Chat Execution Contract — change / test

This chat pattern defines how an AI executes
**test code modification**
based strictly on a provided XIM.

This document is an **execution adapter**.
It does NOT define rules, constraints, or policies.

---

## INPUT

### Execution Contract

- XIM:
  - {{XIM_PATH}}

The XIM is the **single source of truth** for:
- execution intent (change / test)
- user-provided inputs
- output artifact definition

---

## EXECUTION CONTEXT

- Execution type: **change / test**
- The AI MUST execute strictly according to the provided XIM.
- The AI MUST NOT consult any files
  other than those declared in XIM **User File Injection**.

System-level rules, constraints, and standards
are enforced externally by the runtime
and are **out of scope** for this document.

---

## CONTENT SOURCE BOUNDARY

- Test modification intent MUST be derived ONLY from:
  - User File Injection declared in XIM
    (e.g. STS, SRS, SDS, CAS, CIS, API specifications)
  - direct human-provided text in XIM DETAIL

- Absence of some specification types
  is a **valid state**
  unless execution is blocked externally.

The AI MUST NOT:
- infer new behaviors
- expand validation scope
- redefine expected outcomes
- reinterpret production intent

---

## MODIFICATION SCOPE

- Modify **existing test code only**.
- All changes MUST be the **minimum necessary**
  to align tests with the declared user inputs.
- Every modification MUST be traceable
  to at least one user-provided input.

The AI MUST NOT:
- change any production source code
- introduce new test cases or new coverage areas
- refactor unrelated test components
- add assertions for undeclared behavior

The AI MAY:
- update assertions to match specifications
- correct outdated or incorrect test logic
- refine tests **within the existing validation scope**

---

## RELATIONSHIP TO PRODUCTION CODE

- Production code is treated as **read-only context**.
- Tests MUST NOT depend on undocumented behavior.
- If tests conflict with specifications or intent:
  - STOP execution
  - report the conflict
  - do NOT guess or compensate

---

## ARTIFACT BOUNDARY

- Test code MUST be modified only
  within the artifact path declared in XIM.
- No additional files or directories
  may be created beyond the declared artifact scope.

---

## OUTPUT RULES

- Output ONLY the final modified test code.
- Do NOT include explanations,
  reasoning steps, annotations,
  or references to system rules.

---

## CANONICAL STATEMENT

This execution guarantees **traceability to user inputs only**.

Test adequacy, scope alignment,
and long-term maintainability
are governed by human review.
