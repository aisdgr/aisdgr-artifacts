## Execution Parameters (User Configurable)

### Authoritative Input Files

The following files are provided as authoritative inputs.
The user MAY adjust this list per execution.

- {{GOAL_FILE}}               # Primary source of requirement intent
- {{TEMPLATE_FILE}}           # Structural template (English, fixed)
- {{EXECUTION_POLICY_FILE}}   # Execution and rendering policy
- {{GENERATE_POLICY_FILE}}    # AI execution contract

No other files may be consulted.

---

### Output Configuration

- Output file: {{OUTPUT_FILE}}     # e.g. docs/spec/SRS.md
- Output language: {{OUTPUT_LANG}} # e.g. zh-TW | en-US | ja-JP

---

## Invocation Rules

- This invocation supplies **content values only**.
- Document structure, section hierarchy, and field definitions
  are taken exclusively from the template file.
- This invocation MUST NOT redefine, reinterpret,
  or override template structure.

---

## Content Source Rules

- Requirement content MAY be provided through:
  - the goal file,
  - explicitly supplied structured inputs,
  - direct human-provided text at invocation time.

- Absence of input for a section or field is a valid state.

You MUST NOT infer, fabricate, normalize,
or complete missing content.

---

## Executability and Omission Rules

- Sections marked as non-executable by the execution policy
  MUST NOT be generated.
- Executable sections with no valid input MAY be omitted entirely
  if permitted by the execution policy
  (e.g. `render_policy.omit_if_empty`).

You MUST NOT generate placeholder or filler content
to force section presence.

---

## Language Rules

- Section titles, headings, field names, and placeholders
  MUST remain exactly as defined in the template file.
- Section body content MUST be written in the language
  specified by `{{OUTPUT_LANG}}`.

Do NOT mix languages within a single section.

---

## Conflict and Stop Conditions

You MUST stop execution and report instead of guessing if:

- Required structural elements are missing.
- Provided inputs conflict with each other.
- Required fields cannot be populated without inference.
- Execution policy constraints would be violated.

---

## Output Rules

- Write the generated document to `{{OUTPUT_FILE}}`.
- Output ONLY the final document content.
- Do NOT include explanations, annotations, or reasoning.
