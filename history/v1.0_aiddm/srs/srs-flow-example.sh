#!/bin/bash
set -e
# --------------------------------------------------
# 1. Initialize SRS (once per project)
# --------------------------------------------------
adk prompt run patterns/srs/srs_init.yaml \
    --input goal=goal.md \
    --output docs/SRS.md

# --------------------------------------------------
# 2. Analyze impact (no modification, no responsibility)
# --------------------------------------------------
adk prompt run patterns/srs/srs_impact.yaml \
  --input change_request=change.txt \
  --input srs=docs/SRS.md \
  --output reports/SRS_impact.md

# --------------------------------------------------
# 3. Update SRS (Producer action, no verification)
# --------------------------------------------------
adk prompt run patterns/srs/srs_update.yaml \
  --input change_request=approved_change.txt \
  --input srs=docs/SRS.md \
  --output docs/SRS.md

adk check docs/SRS.md --output reports/SRS_check.md
adk audit docs/SRS.md --output reports/SRS_audit.md

adk prompt run patterns/srs/srs_generate_car.yaml \
  --input change_request=approved_change.txt \
  --input srs=docs/SRS.md \
  --input check_report=reports/SRS_check.md \
  --input audit_report=reports/SRS_audit.md \
  --output reports/SRS_CAR.md
