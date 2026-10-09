# Chat Execution Contract: generate_sds

This document defines how a human operator invokes
the `generate_sds` execution in a controlled manner.

It does NOT define document structure or AI behavior rules.

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

Optional human-authored inputs MAY be provided:

- {{IM_FILES[]}}              # Informal Memo(s), free-form, human-authored
                              # (e.g. meeting notes, draft scenarios)

No other files may be consulted.

---

## Output Configuration

- Output file: {{OUTPUT_FILE}}     # e.g. docs/spec/SDS.md
- Output language: {{OUTPUT_LANG}} # e.g. zh-TW | en-US | ja-JP

---

## Invocation Rules

- This invocation supplies **design content values only**.
- Document structure, section hierarchy, and field definitions
  are taken exclusively from the SDS template file.
- This invocation MUST NOT redefine, reinterpret,
  or override template structure.

---

## Content Source Rules

- Design content MAY be provided through:
  - the goal file,
  - explicitly supplied design descriptions,
  - human-authored informal memos (IM),
  - direct human-provided text at invocation time.

- Absence of design input for a section or field
  is a valid and acceptable state.

You MUST NOT infer, fabricate, normalize,
or complete missing design content.

---

## Executability and Omission Rules

- Sections marked as non-executable by the execution policy
  MUST NOT be generated.
- Executable sections with no valid design input
  MAY be omitted entirely if permitted by the execution policy
  (e.g. `render_policy.omit_section_if_empty`).

You MUST NOT generate placeholder or filler content
to force section presence.

---

## Language Rules

- Section titles, headings, field names, and placeholders
  MUST remain exactly as defined in the SDS template file.
- Section body content MUST be written in the language
  specified by `{{OUTPUT_LANG}}`.

Do NOT mix languages within a single section.

---

## Conflict and Stop Conditions

You MUST stop execution and report instead of guessing if:

- Required structural elements are missing.
- Provided design inputs conflict with each other.
- Required fields cannot be populated without inference.
- Execution policy or generate policy constraints
  would be violated.

---

## Output Rules

- Write the generated document to `{{OUTPUT_FILE}}`.
- Output ONLY the final SDS document content.
- Do NOT include explanations, annotations, or reasoning.
