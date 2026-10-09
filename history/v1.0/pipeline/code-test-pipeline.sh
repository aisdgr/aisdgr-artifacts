#!/bin/bash
set -euo pipefail

# ------------------------------------------------------------
# code_test_pipeline.sh
# Responsibility: Execute tests and record execution facts.
# - MUST NOT generate code
# - MUST NOT generate tests
# - MUST NOT generate TR
# - MUST NOT commit
# Outputs:
#   - reports/test_output.log
#   - reports/test_result.json
# Exit code:
#   - 0: tests passed
#   - non-zero: tests failed or execution error
# ------------------------------------------------------------

TEST_CMD_DEFAULT="pytest -q"
TEST_CMD="${TEST_CMD:-$TEST_CMD_DEFAULT}"   # allow override via env var
REPORT_DIR="${REPORT_DIR:-reports}"
LOG_FILE="${LOG_FILE:-$REPORT_DIR/test_output.log}"
RESULT_FILE="${RESULT_FILE:-$REPORT_DIR/test_result.json}"

mkdir -p "$REPORT_DIR"

timestamp_utc() {
  # ISO 8601 UTC time
  date -u +"%Y-%m-%dT%H:%M:%SZ"
}

escape_json() {
  # very small JSON string escaper for logs (quotes/backslashes/newlines)
  python - <<'PY'
import json,sys
s=sys.stdin.read()
print(json.dumps(s))
PY
}

echo "=== CODE TEST PIPELINE START ==="
echo "Time(UTC): $(timestamp_utc)"
echo "Test command: ${TEST_CMD}"
echo "Log: ${LOG_FILE}"
echo "Result: ${RESULT_FILE}"
echo

START_TIME="$(timestamp_utc)"

# Execute tests and capture output + exit code (do NOT stop on failure here)
set +e
# Use bash -lc so TEST_CMD can be a complex command string with pipes etc.
bash -lc "${TEST_CMD}" >"${LOG_FILE}" 2>&1
EXIT_CODE=$?
set -e

END_TIME="$(timestamp_utc)"

# Collect basic stats if pytest is used and tests folder exists (best effort)
TOTAL_TESTS=""
FAILED_TESTS=""
PASSED_TESTS=""
SKIPPED_TESTS=""

# Parse common pytest summary line patterns (best effort, non-fatal)
if grep -qE "==.* in [0-9.]+s" "${LOG_FILE}"; then
  # Examples:
  # "3 passed in 0.12s"
  # "1 failed, 2 passed in 0.20s"
  # "2 skipped, 5 passed in 0.30s"
  SUMMARY_LINE="$(grep -E "([0-9]+ (passed|failed|skipped|xfailed|xpassed))(, [0-9]+ (passed|failed|skipped|xfailed|xpassed))* in [0-9.]+s" "${LOG_FILE}" | tail -n 1 || true)"

  if [ -n "${SUMMARY_LINE}" ]; then
    PASSED_TESTS="$(echo "${SUMMARY_LINE}" | grep -oE "[0-9]+ passed" | awk '{print $1}' || true)"
    FAILED_TESTS="$(echo "${SUMMARY_LINE}" | grep -oE "[0-9]+ failed" | awk '{print $1}' || true)"
    SKIPPED_TESTS="$(echo "${SUMMARY_LINE}" | grep -oE "[0-9]+ skipped" | awk '{print $1}' || true)"
    # compute total if any fields exist
    if [ -n "${PASSED_TESTS}${FAILED_TESTS}${SKIPPED_TESTS}" ]; then
      TOTAL_TESTS="$(python - <<PY
p=int("${PASSED_TESTS:-0}" or 0)
f=int("${FAILED_TESTS:-0}" or 0)
s=int("${SKIPPED_TESTS:-0}" or 0)
print(p+f+s)
PY
)"
    fi
  fi
fi

STATUS="failed"
if [ "${EXIT_CODE}" -eq 0 ]; then
  STATUS="passed"
fi

# Build JSON result file (machine-readable facts)
LOG_JSON="$(cat "${LOG_FILE}" | escape_json)"

cat > "${RESULT_FILE}" <<JSON
{
  "pipeline": "code-test",
  "started_at_utc": "${START_TIME}",
  "ended_at_utc": "${END_TIME}",
  "test_command": "$(python - <<PY
import json
print(json.dumps("${TEST_CMD}")[1:-1])
PY
)",
  "status": "${STATUS}",
  "exit_code": ${EXIT_CODE},
  "stats": {
    "total": ${TOTAL_TESTS:-null},
    "passed": ${PASSED_TESTS:-null},
    "failed": ${FAILED_TESTS:-null},
    "skipped": ${SKIPPED_TESTS:-null}
  },
  "artifacts": {
    "log_file": "${LOG_FILE}",
    "result_file": "${RESULT_FILE}"
  },
  "log_text": ${LOG_JSON}
}
JSON

echo "=== CODE TEST PIPELINE DONE ==="
echo "Status: ${STATUS} (exit_code=${EXIT_CODE})"
echo "Wrote: ${LOG_FILE}"
echo "Wrote: ${RESULT_FILE}"

# Exit with actual test exit code (truth)
exit "${EXIT_CODE}"
