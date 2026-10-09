# TES — Analysis Contract

## TES INPUT

- TES file path: {{TES_FILE_PATH}}

---

## ANALYSIS OUTPUT

- Analysis report path: {{ANALYSIS_REPORT_PATH}}

---

## RULES

### ID: TES-ANL-001

**description:**

Analysis MUST operate in analysis-only mode and MUST NOT execute any task.

### ID: TES-ANL-002

**description:**

Analysis MUST NOT modify source code, documents, configuration, or any runtime artifact.

### ID: TES-ANL-003

**description:**

Analysis MUST treat the TES document as the single authoritative source of intent, scope, and boundary.

### ID: TES-ANL-004

**description:**

Analysis MUST stop immediately if the TES document is missing, invalid, or incomplete.

### ID: TES-ANL-005

**description:**

Analysis MUST produce an analysis report for every valid TES input.

### ID: TES-ANL-006

**description:**

Analysis MUST NOT reveal internal governance mechanisms or enforcement logic in its output.

---

## MODE

- ANALYSIS_ONLY  
- READ_ONLY  
- USER_FACING  
