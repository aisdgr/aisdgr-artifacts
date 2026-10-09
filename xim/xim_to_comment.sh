#!/usr/bin/env bash
# -------------------------------------------------
# XIM → Git Commit Message Converter
#
# Purpose:
#   Convert xim.md into a structured git commit message.
#
# Commit subject format:
#   <type>(<target>): [<xim-id>] <purpose>
#
# Example:
#   feat(doc): [xim-auth-001] 修改 config.yaml 路徑
#
# XIM ID rules:
# - XIM ID MUST be read from `xim.md`
# - Defined under section: ## XIM ID
# - MUST NOT be generated or inferred
#
# Commit body structure:
#   DETAIL
#   INTENT
#   SCOPE
#   FILE (User File Injection only)
#
# Notes:
# - System Auto Injection is intentionally hidden
# - Markdown separators (---) are stripped
# -------------------------------------------------

set -e

# ---------- help ----------
show_help() {
  cat <<'EOF'
XIM → Git Commit Message Converter

USAGE:
  ./xim_to_comment.sh <xim-file.md>

DESCRIPTION:
  Generate a git commit message from a XIM (Execution Intent Manifest).

EOF
}

# ---------- argument handling ----------
if [[ $# -eq 0 ]]; then
  show_help
  exit 0
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  show_help
  exit 0
fi

XIM_FILE="$1"

if [[ ! -f "$XIM_FILE" ]]; then
  echo "❌ XIM file not found: $XIM_FILE" >&2
  exit 1
fi

# ---------- helpers ----------
trim() {
  sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

parse_enum_block() {
  local block="$1"
  awk -v block="$block" '
    $0 ~ "^- " block "$" {found=1; next}
    found && $0 ~ /^ *- / {
      gsub(/^ *- */, "", $0)
      print
      exit
    }
  ' "$XIM_FILE" | trim
}

parse_section() {
  local header="$1"
  awk -v h="## $header" '
    $0 == h {in_sec=1; next}
    /^## / {in_sec=0}
    in_sec {print}
  ' "$XIM_FILE" \
  | sed '/^[[:space:]]*$/d' \
  | sed '/^[[:space:]]*---[[:space:]]*$/d'
}

# ---------- extract XIM ID ----------
XIM_ID=$(awk '/^## XIM ID/ {getline; print; exit}' "$XIM_FILE" | trim)

if [[ -z "$XIM_ID" ]]; then
  echo "❌ Missing XIM ID (## XIM ID) in $XIM_FILE" >&2
  exit 1
fi

# ---------- extract PURPOSE ----------
PURPOSE=$(awk '/^## PURPOSE/ {getline; print; exit}' "$XIM_FILE" | trim)

if [[ -z "$PURPOSE" ]]; then
  PURPOSE="(no purpose)"
fi

# ---------- extract INTENT ----------
TYPE_RAW=$(parse_enum_block "TYPE")
TARGET_RAW=$(parse_enum_block "TARGET")
LANGUAGE_RAW=$(parse_enum_block "LANGUAGE")

# ---------- map to git commit type ----------
case "$TYPE_RAW" in
  add|change) GIT_TYPE="feat" ;;
  fix)        GIT_TYPE="fix" ;;
  refactor)   GIT_TYPE="refactor" ;;
  docs)       GIT_TYPE="docs" ;;
  *)          GIT_TYPE="feat" ;;
esac

# ---------- map to git scope ----------
case "$TARGET_RAW" in
  doc|docs) GIT_SCOPE="doc" ;;
  test)     GIT_SCOPE="test" ;;
  code)     GIT_SCOPE="" ;;
  *)        GIT_SCOPE="" ;;
esac

# ---------- build subject ----------
if [[ -n "$GIT_SCOPE" ]]; then
  SUBJECT="${GIT_TYPE}(${GIT_SCOPE}): [${XIM_ID}] ${PURPOSE}"
else
  SUBJECT="${GIT_TYPE}: [${XIM_ID}] ${PURPOSE}"
fi

# ---------- extract body sections ----------
DETAIL=$(parse_section "DETAIL")
SCOPE=$(parse_section "SCOPE")

USER_FILES=$(awk '
  /^### User File Injection/ {in_user=1; next}
  /^## / {in_user=0}
  in_user && /^- / {print}
' "$XIM_FILE")

# ---------- output ----------
echo "$SUBJECT"
echo

# DETAIL
echo "DETAIL"
if [[ -n "$DETAIL" ]]; then
  echo "$DETAIL"
else
  echo "(none)"
fi
echo

# INTENT
echo "INTENT"
echo "- TYPE: ${TYPE_RAW:-N/A}"
echo "- TARGET: ${TARGET_RAW:-N/A}"
echo "- LANGUAGE: ${LANGUAGE_RAW:-N/A}"
echo

# SCOPE
echo "SCOPE"
if [[ -n "$SCOPE" ]]; then
  echo "$SCOPE"
else
  echo "(none)"
fi
echo

# FILE (User File Injection only)
echo "FILE"
if [[ -n "$USER_FILES" ]]; then
  echo "$USER_FILES"
else
  echo "(none)"
fi
