# VDP Update Pattern

Goal:
Update an existing Version Development Plan (VDP) for a target version branch
based on the latest baseline documents and the baseline diff since last VDP baseline.

Baseline Rule:
- Use ONLY the baseline documents on the target version branch:
  - docs/SRS.md
  - docs/SAS.md
  - docs/SDS.md
  - docs/STS.md
- Update VDP by reflecting:
  - baseline changes (diff)
  - outstanding work not yet completed (if tracked in VDP)

Constraints:
- Planning only (no validation)
- Do NOT generate CAR
- Do NOT generate TR

Input:
- Version branch name
- Existing docs/VDP.md
- Baseline documents (SRS/SAS/SDS/STS)
- Baseline diff (text file) between last baseline_commit and current HEAD

Output:
- docs/VDP.md (updated)
