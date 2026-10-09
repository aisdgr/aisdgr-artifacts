#!/bin/bash
set -e

# --------------------------------------------------
# 1. Init SAS (only if not exists)
# --------------------------------------------------
adk prompt run patterns/sas/sas_init.yaml \
    --input srs=docs/SRS.md \
    --output docs/SAS.md

# --------------------------------------------------
# 2. Impact analysis
# --------------------------------------------------
adk prompt run patterns/sas/sas_impact.yaml \
  --input approved_change=approved_change.txt \
  --input srs=docs/SRS.md \
  --input sas=docs/SAS.md \
  --output reports/SAS_impact.md

# --------------------------------------------------
# 3. Update SAS
# --------------------------------------------------
adk prompt run patterns/sas/sas_update.yaml \
  --input approved_change=approved_change.txt \
  --input srs=docs/SRS.md \
  --input sas=docs/SAS.md \
  --output docs/SAS.md

adk check docs/SAS.md --output reports/SAS_check.md
adk audit docs/SAS.md --output reports/SAS_audit.md

adk prompt run patterns/sas/sas_generate_car.yaml \
  --input approved_change=approved_change.txt \
  --input sas=docs/SAS.md \
  --input check_report=reports/SAS_check.md \
  --input audit_report=reports/SAS_audit.md \
  --output reports/SAS_CAR.md
