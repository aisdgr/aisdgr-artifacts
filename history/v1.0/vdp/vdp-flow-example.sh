#!/bin/bash
set -e

VERSION_BRANCH="${1:-v1.1.0}"

echo "=== VDP PIPELINE START ==="
echo "Target branch: ${VERSION_BRANCH}"

# 0) Ensure we're on the target branch
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [ "${CURRENT_BRANCH}" != "${VERSION_BRANCH}" ]; then
  echo "Switching branch: ${CURRENT_BRANCH} -> ${VERSION_BRANCH}"
  git checkout "${VERSION_BRANCH}"
fi

mkdir -p docs reports

VDP_FILE="docs/VDP.md"
DIFF_FILE="reports/VDP_baseline_diff.txt"

# Helper: extract baseline_commit from VDP front-matter (very lightweight)
extract_baseline_commit() {
  # Looks for a line like: baseline_commit: abc1234
  # Returns empty if not found.
  if [ ! -f "${VDP_FILE}" ]; then
    echo ""
    return
  fi
  grep -E '^baseline_commit:\s*[0-9a-fA-F]+' "${VDP_FILE}" | head -n 1 | awk '{print $2}'
}

# Helper: upsert baseline_commit in VDP front-matter
upsert_baseline_commit() {
  local NEW_COMMIT="$1"

  if [ ! -f "${VDP_FILE}" ]; then
    return
  fi

  # If baseline_commit exists, replace it; otherwise insert into the first front-matter block.
  if grep -qE '^baseline_commit:\s*[0-9a-fA-F]+' "${VDP_FILE}"; then
    # Replace existing baseline_commit
    sed -i.bak -E "s/^baseline_commit:\s*[0-9a-fA-F]+/baseline_commit: ${NEW_COMMIT}/" "${VDP_FILE}"
    rm -f "${VDP_FILE}.bak"
  else
    # Insert after first '---' (front-matter start). If no front-matter, prepend minimal.
    if head -n 1 "${VDP_FILE}" | grep -q '^---'; then
      awk -v new_commit="${NEW_COMMIT}" '
        NR==1 {print; next}
        NR==2 {print "baseline_commit: " new_commit; print; next}
        {print}
      ' "${VDP_FILE}" > "${VDP_FILE}.tmp" && mv "${VDP_FILE}.tmp" "${VDP_FILE}"
    else
      {
        echo "---"
        echo "version_branch: ${VERSION_BRANCH}"
        echo "baseline_commit: ${NEW_COMMIT}"
        echo "---"
        cat "${VDP_FILE}"
      } > "${VDP_FILE}.tmp" && mv "${VDP_FILE}.tmp" "${VDP_FILE}"
    fi
  fi
}

BASELINE_COMMIT="$(extract_baseline_commit)"
HEAD_COMMIT="$(git rev-parse HEAD)"

# Baseline files (one per artifact on this version branch)
BASELINE_SRS="docs/SRS.md"
BASELINE_SAS="docs/SAS.md"
BASELINE_SDS="docs/SDS.md"
BASELINE_STS="docs/STS.md"

# Minimal guard: baseline docs should exist on this branch before creating VDP
for f in "${BASELINE_SRS}" "${BASELINE_SAS}" "${BASELINE_SDS}" "${BASELINE_STS}"; do
  if [ ! -f "$f" ]; then
    echo "Missing baseline document: $f"
    echo "VDP requires baseline documents committed on ${VERSION_BRANCH}."
    exit 1
  fi
done

if [ -z "${BASELINE_COMMIT}" ] || [ ! -f "${VDP_FILE}" ]; then
  echo "[INIT] No baseline found (no VDP or no baseline_commit). Generate VDP init."

  adk prompt run patterns/vdp/vdp_init.yaml \
    --input version_branch="${VERSION_BRANCH}" \
    --input baseline_srs="${BASELINE_SRS}" \
    --input baseline_sas="${BASELINE_SAS}" \
    --input baseline_sds="${BASELINE_SDS}" \
    --input baseline_sts="${BASELINE_STS}" \
    --output "${VDP_FILE}"

  # Set baseline_commit to current HEAD after init
  upsert_baseline_commit "${HEAD_COMMIT}"

else
  echo "[UPDATE] baseline_commit found: ${BASELINE_COMMIT}"
  echo "Generating baseline diff: ${BASELINE_COMMIT}..${HEAD_COMMIT}"

  # Produce a diff summary (docs only) for the model to update plan scope
  git diff "${BASELINE_COMMIT}..${HEAD_COMMIT}" -- docs/ > "${DIFF_FILE}" || true

  adk prompt run patterns/vdp/vdp_update.yaml \
    --input version_branch="${VERSION_BRANCH}" \
    --input vdp="${VDP_FILE}" \
    --input baseline_srs="${BASELINE_SRS}" \
    --input baseline_sas="${BASELINE_SAS}" \
    --input baseline_sds="${BASELINE_SDS}" \
    --input baseline_sts="${BASELINE_STS}" \
    --input baseline_diff="${DIFF_FILE}" \
    --output "${VDP_FILE}"

  # Move baseline_commit forward to current HEAD after update
  upsert_baseline_commit "${HEAD_COMMIT}"
fi

echo "=== VDP PIPELINE DONE ==="
echo "VDP: ${VDP_FILE}"
