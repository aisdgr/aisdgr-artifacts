#!/usr/bin/env bash
set -e

TES_FILE="$1"

if [ -z "$TES_FILE" ] || [ ! -f "$TES_FILE" ]; then
  echo "Usage: $0 <tes-file.md>"
  exit 1
fi

# --------------------------------------------------
# helpers
# --------------------------------------------------

trim() {
  sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

# Extract a whole section (keeps original formatting)
extract_section() {
  local section="$1"
  awk -v section="$section" '
    $0 ~ "^##[[:space:]]+" section "$" {flag=1; print; next}
    /^## / {if (flag) exit}
    flag {print}
  ' "$TES_FILE"
}

# Extract first nested value under "- KEY"
extract_nested_value() {
  local key="$1"
  awk -v key="$key" '
    $0 ~ "^-[[:space:]]*" key "$" {
      while (getline) {
        if ($0 ~ /^[[:space:]]+- /) {
          gsub(/^[[:space:]]+- /, "", $0)
          print
          exit
        }
      }
    }
  ' "$TES_FILE" | trim
}

# Extract TES ID
TES_ID=$(awk '
  /^## ID/ {flag=1; next}
  /^## / {flag=0}
  flag && NF {print; exit}
' "$TES_FILE" | trim | tr '[:upper:]' '[:lower:]')

# Extract TYPE
TYPE_RAW=$(extract_nested_value "TYPE" | tr '[:upper:]' '[:lower:]')

case "$TYPE_RAW" in
  add|change) GIT_TYPE="chore" ;;
  fix)        GIT_TYPE="fix" ;;
  refactor)   GIT_TYPE="refactor" ;;
  *)          GIT_TYPE="chore" ;;
esac

# Extract GOAL (first non-empty line only)
GOAL_LINE=$(awk '
  /^## GOAL/ {flag=1; next}
  /^## / {flag=0}
  flag && NF {print; exit}
' "$TES_FILE" | trim)

# Extract DESCRIPTION (full text, no header)
DESCRIPTION=$(awk '
  /^## DESCRIPTION/ {flag=1; next}
  /^## / {flag=0}
  flag {print}
' "$TES_FILE" | trim)

# Sections to project
EXECUTION_SECTION=$(extract_section "EXECUTION MODE / TYPE")
BOUNDARY_SECTION=$(extract_section "BOUNDARY")

# Extract FILES (raw)
FILES=$(awk '
  /^- DOC:/ {print}
' "$TES_FILE")

# --------------------------------------------------
# build commit message
# --------------------------------------------------

SUBJECT="$GIT_TYPE(doc): [$TES_ID] $GOAL_LINE"

BODY="DESCRIPTION
$DESCRIPTION

## GOAL
$GOAL_LINE

$EXECUTION_SECTION

$BOUNDARY_SECTION

FILES
$FILES"

# --------------------------------------------------
# output
# --------------------------------------------------

echo "$SUBJECT"
echo
echo "$BODY"
