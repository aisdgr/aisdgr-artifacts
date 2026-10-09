# Chat Execution Contract — generate / cis (AIDDM)

This chat pattern defines how an AI executes
**CIS (Coding Implementation Specification) generation**
under the AIDDM methodology,
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

- This execution generates a **CIS document**.
- The AI MUST operate strictly according to the provided XIM.
- The AI MUST NOT consult any file
  not declared in XIM **User File Injection**.
- System Auto Injection files
  (templates, execution policies, generation policies, standards)
  are assumed to be injected by the runtime
  and MUST NOT be referenced explicitly.

---

## CONTENT SOURCE RULES

- Coding specification content MUST be derived ONLY from:
  - User File Injection declared in XIM
    (e.g. SRS, SDS, STS, IM, design notes, decisions)
  - direct human-provided text in XIM DETAIL

- Absence of user inputs is a **valid and acceptable state**.

You MUST NOT:
- infer missing implementation details
- fabricate constraints or rules
- normalize, optimize, or “correct” specifications
- resolve ambiguity without explicit human input

Semantic correctness and intent clarity
are **human responsibilities**.

---

## CODING SPECIFICATION SCOPE RULES

- CIS defines **coding-level rules, constraints, and obligations**.
- CIS MAY include:
  - coding conventions
  - interface contracts
  - error-handling rules
  - security or compliance constraints
- CIS MUST NOT include:
  - business requirements
  - architectural design decisions
  - algorithms or control flow
  - concrete implementation code

All statements MUST be framed as
**rules or constraints**, not implementations.

---

## STRUCTURAL RULES

- Document structure, section hierarchy,
  and field definitions
  are dictated exclusively by:
  - the injected CIS template
  - the injected execution policy

You MUST NOT:
- redefine document structure
- rename sections
- add, remove, or reorder mandatory sections

---

## EXECUTABILITY & OMISSION RULES

- Sections marked as non-executable
  by execution policy MUST NOT be generated.
- Executable sections MUST be generated structurally,
  even if content is empty or incomplete,
  unless omission is explicitly allowed
  by execution policy.

You MUST NOT skip generation
to avoid producing empty or partial content.

---

## LANGUAGE RULES

- Section titles, headings, field names,
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

- missing user inputs
- incomplete semantic information
- unclear or disputed implementation intent

---

## OUTPUT RULES

- Write the generated CIS document
  to the artifact path declared in XIM.
- Output ONLY the final CIS document content.
- Do NOT include explanations, annotations,
  reasoning steps, or policy descriptions.

---

## CANONICAL STATEMENT

This execution guarantees **structural validity** only.

Coding correctness, completeness,
and real-world applicability
are governed by human review.
