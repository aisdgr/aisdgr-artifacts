#!/bin/bash
set -e

# --------------------------------------------------
# 1. Init SDS (only once)
# --------------------------------------------------
adk prompt run patterns/sds/sds_init.yaml \
    --input srs=docs/SRS.md \
    --input sas=docs/SAS.md \
    --output docs/SDS.md

# --------------------------------------------------
# 2. Impact analysis
# --------------------------------------------------
adk prompt run patterns/sds/sds_impact.yaml \
  --input approved_change=approved_change.txt \
  --input srs=docs/SRS.md \
  --input sas=docs/SAS.md \
  --input sds=docs/SDS.md \
  --output reports/SDS_impact.md

# --------------------------------------------------
# 3. Update SDS
# --------------------------------------------------
adk prompt run patterns/sds/sds_update.yaml \
  --input approved_change=approved_change.txt \
  --input srs=docs/SRS.md \
  --input sas=docs/SAS.md \
  --input sds=docs/SDS.md \
  --output docs/SDS.md

adk check docs/SDS.md --output reports/SDS_check.md
adk audit docs/SDS.md --output reports/SDS_audit.md

adk prompt run patterns/sds/sds_generate_car.yaml \
  --input approved_change=approved_change.txt \
  --input sds=docs/SDS.md \
  --input check_report=reports/SDS_check.md \
  --input audit_report=reports/SDS_audit.md \
  --output reports/SDS_CAR.md
