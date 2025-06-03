#!/usr/bin/env bash
set -euo pipefail

# Script to validate all YAML files under _data/ and write results to _docs/pre_commit_checks/
OUTPUT_DIR="_docs/pre_commit_checks"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$OUTPUT_DIR/pre_commit_yaml_check_${TIMESTAMP}.log"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

echo "YAML validation started at $(date)" > "$LOG_FILE"

ERRORS=0
for file in $(find _data -type f \( -name '*.yml' -o -name '*.yaml' \)); do
  # Attempt to load the file with Ruby's YAML parser
  ERR_MSG=$(ruby -ryaml -e "YAML.load_file('$file')" 2>&1) || {
    echo "[ERR] $file: $ERR_MSG" >> "$LOG_FILE"
    ERRORS=1
    continue
  }
  echo "[OK]  $file" >> "$LOG_FILE"
done

if [ "$ERRORS" -eq 0 ]; then
  echo "All YAML files are valid." >> "$LOG_FILE"
else
  echo "Some YAML files have errors." >> "$LOG_FILE"
  exit 1
fi