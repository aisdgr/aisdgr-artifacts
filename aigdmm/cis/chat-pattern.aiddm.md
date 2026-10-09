# Chat Execution Contract: generate_cis (AIDDM)

This document defines how a human operator invokes
the `generate_cis` execution under the **AIDDM methodology**
in a controlled and repeatable manner.

It does NOT define document structure
or AI behavior rules.

Those are defined in the template
and policy artifacts.

---

## Execution Parameters (User Configurable)

### Authoritative Input Files

The following files are provided as authoritative inputs.
The user MAY adjust this list per execution.

- {{TEMPLATE_FILE}}           # Structural template (English, fixed)
- {{EXECUTION_POLICY_FILE}}   # Execution and rendering policy
- {{GENERATE_POLICY_FILE}}    # AI execution contract

Optional authoritative specification inputs MAY be provided:

- {{SRS_FILE}}                # Upstream requirement constraints (recommended)
- {{SDS_FILE}}                # Upstream design constraints (optional)
- {{STS_FILE}}                # Upstream test constraints (optional)

Optional human-authored inputs MAY be provided:

- {{IM_FILES[]}}                 # Informal Memo(s), free-form, human-authored
                                 # (e.g. design notes, decisions, drafts)

No other files may be consulted.

---

## Output Configuration

- Output file: {{OUTPUT_FILE}}   # e.g. docs/spec/CIS
- Output language: {{OUTPUT_LANG}}  # e.g. zh-TW | en-US | ja-JP

---

## Invocation Rules

- This invocation supplies **coding specification content values only**.
- Document structure, section hierarchy, and field definitions
  are taken exclusively from the CIS template file.
- This invocation MUST NOT redefine, reinterpret,
  or override template structure.

Generation MUST proceed even if
semantic input is incomplete or missing.

---

## Content Source Rules

- Coding specification content MAY be provided through:
  - explicitly supplied specification documents,
  - human-authored informal memos (IM),
  - direct human-provided text at invocation time.

- Absence of content for any section or field
  is a valid and acceptable state.

You MUST NOT infer, fabricate, normalize,
or correct missing semantics.

Semantic correctness is a **human responsibility**.

---

## Executability and Omission Rules

- Sections marked as non-executable by the execution policy
  MUST NOT be generated.
- Executable sections MUST be generated structurally,
  even if content is empty or incomplete,
  unless omission is explicitly allowed
  by the execution policy.

You MUST NOT skip generation
to avoid producing empty or partial content.

---

## Language Rules

- Section titles, headings, field names, and placeholders
  MUST remain exactly as defined in the CIS template file.
- Section body content MUST be written in the language
  specified by {{OUTPUT_LANG}}.

Do NOT mix languages within a single section.

---

## Conflict and Stop Conditions

You MUST stop execution and report instead of guessing if:

- Required template files are missing.
- The template structure is malformed or inconsistent.
- Execution policy or generate policy constraints
  would be violated structurally.

You MUST NOT stop execution due to:

- missing human input,
- incomplete semantic information,
- unclear or disputed design intent.

---

## Output Rules

- Write the generated document to `{{OUTPUT_FILE}}`.
- Output ONLY the final CIS document content.
- Do NOT include explanations, annotations, or reasoning.

---

## Canonical Rule

If the command is **generate**, and the template exists,
a CIS document MUST be produced.

Human governance and correction
occur **after generation**, not before.
