# STS Update Pattern

Goal:
Update STS according to approved changes
from SRS / SAS / SDS.

Constraints:
- Update content only
- Do NOT validate inside prompt
- CAR is generated ONLY after external validation

Input:
- approved_change.txt
- SRS.md
- SAS.md
- SDS.md
- STS.md

Output:
- STS.md
