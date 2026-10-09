# Chat Execution Contract — generate / cas

This chat pattern defines how an AI executes
**CAS (Coding Architecture Specification) generation**
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

- This execution generates a **CAS document**.
- The AI MUST operate strictly according to the provided XIM.
- The AI MUST NOT consult any file
  not declared in XIM **User File Injection**.
- System Auto Injection files
  (templates, execution policies, generation policies, standards)
  are assumed to be injected by the runtime
  and MUST NOT be referenced explicitly.

---

## CONTENT SOURCE RULES

- Architectural constraint content MUST be derived ONLY from:
  - User File Injection declared in XIM
    (e.g. SRS, SDS, IM, meeting records, architecture notes)
  - direct human-provided text in XIM DETAIL

- Absence of user inputs is a **valid state**.
- You MUST NOT:
  - invent architectural intent
  - infer missing constraints
  - translate requirements into design or code
  - fabricate structure or rationale

Architectural intent and correctness
are **human responsibilities**.

---

## ARCHITECTURAL SCOPE RULES

- CAS defines **architectural boundaries, constraints, and invariants**.
- CAS MUST NOT include:
  - business requirements
  - feature definitions
  - algorithms or control flow
  - implementation or code-level details

All statements MUST be framed as
**constraints or architectural rules**, not solutions.

---

## STRUCTURAL RULES

- Document structure, section hierarchy,
  identifiers, and placeholders
  are dictated exclusively by:
  - the injected CAS template
  - the injected execution policy

You MUST NOT:
- redefine document structure
- rename sections
- add, remove, or reorder mandatory sections

---

## EXECUTABILITY & OMISSION RULES

- Sections marked as non-executable
  by execution policy MUST NOT be generated.
- Executable sections with no valid architectural input:
  - MUST be generated structurally
    if required by execution policy
  - MUST be omitted
    only if explicitly permitted
  - MUST NOT contain fabricated or speculative content

You MUST NOT fabricate content
solely to increase perceived completeness.

---

## LANGUAGE RULES

- Section titles, headings, identifiers,
  and placeholders MUST remain exactly
  as defined in the template.
- Section body content MUST be written in:
  - the language declared in XIM ARTIFACT

Do NOT mix languages within a section.

---

## STOP CONDITIONS

You MUST stop execution and report instead of guessing if:

- The XIM is missing or malformed
- Structural constraints from injected policies
  cannot be satisfied
- Template structure is inconsistent or invalid

You MUST NOT stop execution due to:

- missing SRS, SDS, or IM inputs
- lack of domain knowledge
- uncertainty about architectural optimality

---

## OUTPUT RULES

- Write the generated CAS document
  to the artifact path declared in XIM.
- Output ONLY the final CAS document content.
- Do NOT include explanations, annotations,
  reasoning steps, or policy descriptions.

---

## CANONICAL STATEMENT

This execution guarantees **structural validity** only.

Architectural correctness, feasibility,
and long-term suitability
are governed by human review.
