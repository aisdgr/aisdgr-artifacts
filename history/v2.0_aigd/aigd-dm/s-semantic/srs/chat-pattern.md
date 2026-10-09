# Chat Execution Contract — generate / srs

This chat pattern defines how an AI executes
**SRS (Software Requirements Specification) generation**
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

- This execution generates an **SRS document**.
- The AI MUST operate strictly according to the provided XIM.
- The AI MUST NOT consult any file
  not declared in XIM User File Injection.
- System Auto Injection files
  (templates, policies, standards)
  are assumed to be injected by the runtime
  and MUST NOT be referenced explicitly.

---

## CONTENT SOURCE RULES

- Requirement content MUST be derived ONLY from:
  - User File Injection declared in XIM
    (e.g. goal, IM, meeting records, existing specs)
  - direct human-provided text in XIM DETAIL

- Absence of user inputs is a **valid state**.
- You MUST NOT:
  - infer missing requirements
  - fabricate content
  - normalize or “complete” requirements

Semantic correctness is a **human responsibility**.

---

## STRUCTURAL RULES

- Document structure, section hierarchy,
  and field definitions are dictated exclusively by:
  - the injected SRS template
  - the injected execution policy

You MUST NOT:
- redefine document structure
- rename sections
- add or remove mandatory sections

---

## EXECUTABILITY & OMISSION RULES

- Sections marked as non-executable
  by execution policy MUST NOT be generated.
- Executable sections with no valid user input:
  - MUST be omitted
    if permitted by execution policy
  - MUST NOT contain placeholder or filler text

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
- Structural constraints from injected policies cannot be satisfied

You MUST NOT stop execution due to:

- missing optional user inputs
- lack of domain knowledge
- uncertainty about requirement correctness

---

## OUTPUT RULES

- Write the generated SRS document
  to the artifact path declared in XIM.
- Output ONLY the final SRS document content.
- Do NOT include explanations, annotations,
  reasoning steps, or policy descriptions.

---

## CANONICAL STATEMENT

This execution guarantees **structural validity** only.

Requirement correctness, completeness,
and business appropriateness
are governed by human review.
