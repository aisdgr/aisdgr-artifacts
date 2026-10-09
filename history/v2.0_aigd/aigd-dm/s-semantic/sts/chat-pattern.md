# Chat Execution Contract — generate / sts

This chat pattern defines how an AI executes
**STS (Software Test Specification) generation**
based strictly on a provided XIM.

This document does NOT define:
- file paths
- templates
- execution policies
- generation policies
- output configuration

All such parameters MUST be declared in XIM
and injected by the runtime.

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

## EXECUTION RULES

- This execution generates an **STS document**.
- The AI MUST operate strictly according to the provided XIM.
- The AI MUST NOT consult any file
  not declared in XIM **User File Injection**.
- System Auto Injection files
  (templates, execution policies, generation policies, standards)
  are assumed to be injected by the runtime
  and MUST NOT be referenced explicitly.

---

## CONTENT SOURCE RULES

- Test specification content MUST be derived ONLY from:
  - User File Injection declared in XIM
    (e.g. SRS, SDS, IM, acceptance notes, meeting records)
  - direct human-provided text in XIM DETAIL

- Absence of user inputs is a **valid state**.
- You MUST NOT:
  - infer missing test cases
  - fabricate scenarios or assertions
  - normalize, optimize, or “complete” test coverage

Test adequacy and coverage
are **human responsibilities**.

---

## STRUCTURAL RULES

- Document structure, section hierarchy,
  and field definitions are dictated exclusively by:
  - the injected STS template
  - the injected execution policy

You MUST NOT:
- redefine document structure
- rename sections
- add, remove, or reorder mandatory sections

---

## EXECUTABILITY & OMISSION RULES

- Sections marked as non-executable
  by execution policy MUST NOT be generated.
- Executable sections with no valid test input:
  - MUST be omitted
    if permitted by execution policy
  - MUST NOT contain placeholder or filler content

---

## LANGUAGE RULES

- Section titles, headings, and identifiers
  MUST remain exactly as defined in the template.
- Section body content MUST be written in:
  - the language declared in XIM ARTIFACT

Do NOT mix languages within a section.

---

## STOP CONDITIONS

You MUST stop execution and report instead of guessing if:

- The XIM is missing or malformed
- Required User Inputs declared in XIM are unavailable
- Structural constraints from injected policies
  cannot be satisfied

You MUST NOT stop execution due to:

- missing optional user inputs
- lack of domain knowledge
- uncertainty about test completeness or optimality

---

## OUTPUT RULES

- Write the generated STS document
  to the artifact path declared in XIM.
- Output ONLY the final STS document content.
- Do NOT include explanations, annotations,
  reasoning steps, or policy descriptions.

---

## CANONICAL STATEMENT

This execution guarantees **structural validity** only.

Test completeness, adequacy,
and risk coverage
are governed by human review.
