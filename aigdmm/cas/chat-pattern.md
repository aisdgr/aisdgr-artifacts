# Chat Execution Contract: generate_cas

This document defines how a human operator invokes  
the `generate_cas` execution in a controlled and repeatable manner.

It does **NOT** define document structure, architectural correctness,  
or AI internal behavior rules.

---

## Execution Parameters (User Configurable)

### Authoritative Input Files

The following files are provided as authoritative inputs.  
The user MAY adjust this list per execution.

- {{TEMPLATE_FILE}}            # CAS structural template (English, fixed)
- {{EXECUTION_POLICY_FILE}}    # CAS document execution policy
- {{GENERATE_POLICY_FILE}}     # AI generation validity contract for CAS

Optional authoritative specification inputs MAY be provided:

- {{SRS_FILE}}                 # Upstream requirement constraints (optional)
- {{SDS_FILE}}                 # Upstream design constraints (optional)

Optional human-authored inputs MAY be provided:

- {{IM_FILES[]}}               # Informal Memo(s), free-form, human-authored
                               # (e.g. architecture notes, meeting records,
                               #  constraint discussions, draft ideas)

No other files may be consulted.

---

## Output Configuration

- Output file: {{OUTPUT_FILE}}     # e.g. docs/spec/CAS.md
- Output language: {{OUTPUT_LANG}} # e.g. en-US | zh-TW | ja-JP

---

## Invocation Rules

- This invocation generates a **Coding Architecture Specification (CAS)**.
- The purpose is to produce a **structurally valid and reviewable CAS document**.
- Document structure, section hierarchy, identifiers, and placeholders  
  are taken exclusively from the CAS template file.

This invocation MUST NOT redefine, reinterpret,  
or override template structure.

---

## Content Source Rules

Architectural constraint content MAY be derived from:

- upstream requirements (SRS), if provided,
- upstream design descriptions (SDS), if provided,
- human-authored informal memos (IM),
- direct human-provided text at invocation time.

Absence of SRS, SDS, or IM input is a **valid and acceptable state**.

When no external input is provided,  
you MUST still generate a **structurally complete CAS document**  
that satisfies the CAS template and generation policy.

You MUST NOT block generation due to missing architectural intent.

---

## Architectural Scope Rules

- CAS defines **architectural boundaries, constraints, and invariants**.
- CAS MUST NOT include:
  - business requirements,
  - feature definitions,
  - algorithms or control flow,
  - implementation or code-level details.

Architectural statements SHOULD remain abstract, conservative,  
and explicitly framed as constraints.

---

## Executability and Omission Rules

- Sections marked as non-executable by the execution policy  
  MUST NOT be generated.
- Executable sections MUST be generated even if no human input exists,
  unless explicitly permitted to be omitted by the execution policy
  (e.g. `render_policy.omit_section_if_empty`).

You MUST NOT fabricate content solely to increase perceived completeness.

---

## Language Rules

- Section titles, headings, identifiers, and placeholders  
  MUST remain exactly as defined in the CAS template file.
- Section body content MUST be written in the language  
  specified by `{{OUTPUT_LANG}}`.

Do NOT mix languages within a single section.

---

## Conflict and Stop Conditions

You MUST stop execution and report instead of guessing if:

- Required structural elements are missing from the CAS template.
- Execution policy or generate policy constraints would be violated.
- CAS structure cannot be satisfied syntactically.

You MUST NOT stop execution due to:

- missing SRS or SDS,
- missing IM files,
- lack of domain knowledge,
- uncertainty about architectural correctness.

---

## Output Rules

- Write the generated document to `{{OUTPUT_FILE}}`.
- Output **ONLY** the final CAS document content.
- Do NOT include explanations, annotations, reasoning,
  or policy descriptions.

---

## Canonical Reminder

This execution guarantees **structural validity** of CAS.

Architectural correctness, feasibility, and appropriateness  
are the responsibility of human reviewers.
