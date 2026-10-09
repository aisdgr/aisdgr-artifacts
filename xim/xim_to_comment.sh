#!/usr/bin/env bash
# ----------------------------------------
# XIM → Git Commit Message Converter
#
# Version: 1.3.1
# Author : AIDDM / XIM
#
# CHANGELOG
# ----------
# v1.3.1
# - Strip markdown section separators (---) from commit body
#
# v1.3.0
# - Commit body follows xim-template structure
# - Include DETAIL / INTENT / SCOPE / FILE
# - FILE section shows User File Injection only
# - System Auto Injection remains hidden
#
# v1.2.1
# - Hide System Auto Injection (confidential)
# - Include User File Injection as commit context
# ----------------------------------------

set -e

# ---------- help ----------
show_help() {
  cat <<'EOF'
XIM → Git Commit Message Converter (v1.3.1)

USAGE:
  ./xim_to_comment.sh <xim-file.md>

DESCRIPTION:
  Convert a XIM (Execution Intent Manifest)
  into a structured Git commit message.

Commit body structure:
  DETAIL
  INTENT
  SCOPE
  FILE (User File Injection only)
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

# ---------- extract subject ----------
PURPOSE=$(awk '/^## PURPOSE/ {getline; print; exit}' "$XIM_FILE" | trim)

TYPE_RAW=$(parse_enum_block "TYPE")
TARGET_RAW=$(parse_enum_block "TARGET")
LANGUAGE_RAW=$(parse_enum_block "LANGUAGE")

case "$TYPE_RAW" in
  add|change) GIT_TYPE="feat" ;;
  fix)        GIT_TYPE="fix" ;;
  refactor)   GIT_TYPE="refactor" ;;
  *)          GIT_TYPE="feat" ;;
esac

case "$TARGET_RAW" in
  test) GIT_SCOPE="test" ;;
  doc)  GIT_SCOPE="doc" ;;
  code) GIT_SCOPE="" ;;
  *)    GIT_SCOPE="" ;;
esac

if [[ -n "$GIT_SCOPE" ]]; then
  SUBJECT="${GIT_TYPE}(${GIT_SCOPE}): ${PURPOSE}"
else
  SUBJECT="${GIT_TYPE}: ${PURPOSE}"
fi

# ---------- extract body ----------
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
if [[ -n "$USER_FILES" ]]; then
echo "FILE"
  echo "$USER_FILES"
fi
