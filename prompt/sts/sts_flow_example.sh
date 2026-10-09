#!/bin/bash
set -e
# --------------------------------------------------
# 1. Init STS (only once)
# --------------------------------------------------
adk prompt run patterns/sts/sts_init.yaml \
    --input srs=docs/SRS.md \
    --input sas=docs/SAS.md \
    --input sds=docs/SDS.md \
    --output docs/STS.md

# --------------------------------------------------
# 2. Impact analysis
# --------------------------------------------------
adk prompt run patterns/sts/sts_impact.yaml \
  --input approved_change=approved_change.txt \
  --input srs=docs/SRS.md \
  --input sas=docs/SAS.md \
  --input sds=docs/SDS.md \
  --input sts=docs/STS.md \
  --output reports/STS_impact.md

# --------------------------------------------------
# 3. Update STS
# --------------------------------------------------
adk prompt run patterns/sts/sts_update.yaml \
  --input approved_change=approved_change.txt \
  --input srs=docs/SRS.md \
  --input sas=docs/SAS.md \
  --input sds=docs/SDS.md \
  --input sts=docs/STS.md \
  --output docs/STS.md

adk check docs/STS.md --output reports/STS_check.md
adk audit docs/STS.md --output reports/STS_audit.md

adk prompt run patterns/sts/sts_generate_car.yaml \
  --input approved_change=approved_change.txt \
  --input sts=docs/STS.md \
  --input check_report=reports/STS_check.md \
  --input audit_report=reports/STS_audit.md \
  --output reports/STS_CAR.md
