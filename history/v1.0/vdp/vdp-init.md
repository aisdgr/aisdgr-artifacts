# VDP Init Pattern

Goal:
Generate an initial Version Development Plan (VDP) for a target version branch.
VDP is a version-level execution plan that schedules the scope of:
- Code work
- Test implementation work
- Test execution work (Run Test)

Baseline Rule:
- Use ONLY the baseline documents on the target version branch:
  - docs/SRS.md
  - docs/SAS.md
  - docs/SDS.md
  - docs/STS.md
- Do NOT use multiple CARs as required inputs.

Constraints:
- Planning only (no validation)
- Do NOT generate CAR
- Do NOT generate TR
- Do NOT assume implementation exists

Input:
- Version branch name (e.g., v1.1.0)
- Baseline documents (SRS/SAS/SDS/STS)

Output:
- docs/VDP.md
