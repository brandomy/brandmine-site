#!/bin/bash

# Setup log directory and timestamped log file
LOG_DIR="_docs/pre_commit_checks"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="${LOG_DIR}/pre_commit_check_${TIMESTAMP}.log"

mkdir -p "$LOG_DIR"

echo "🔍 Running Brandmine pre-commit checks..." | tee "$LOG_FILE"
echo "Timestamp: $(date)" | tee -a "$LOG_FILE"
echo "==========================================" | tee -a "$LOG_FILE"

# === 1. Check for unbalanced Liquid tags
echo "🧪 Checking Liquid syntax..." | tee -a "$LOG_FILE"
LIQUID_ISSUES=$(grep -r "{%.*[^%]}%}" _includes/ _layouts/ pages/)

if [[ -z "$LIQUID_ISSUES" ]]; then
  echo "✓ No unbalanced Liquid tags found" | tee -a "$LOG_FILE"
else
  echo "⚠️ Possible unbalanced Liquid tags detected:" | tee -a "$LOG_FILE"
  echo "$LIQUID_ISSUES" | tee -a "$LOG_FILE"
fi

# === 2. Check for malformed endif tags
echo "" | tee -a "$LOG_FILE"
echo "🌊 Checking for malformed Liquid tags..." | tee -a "$LOG_FILE"

# Check for endif followed by />
LIQUID_ENDIF_ISSUES=$(grep -r "{% endif />" --include="*.html" . )
if [[ -z "$LIQUID_ENDIF_ISSUES" ]]; then
  echo "✓ No malformed endif tags found" | tee -a "$LOG_FILE"
else
  echo "⚠️ Found malformed endif tags:" | tee -a "$LOG_FILE"
  echo "$LIQUID_ENDIF_ISSUES" | tee -a "$LOG_FILE"
fi

# Check for unclosed comment tags
echo "Checking for unbalanced comment tags..." | tee -a "$LOG_FILE"
COMMENT_OPENS=$(grep -r -c "{% comment %}" --include="*.html" .)
COMMENT_CLOSES=$(grep -r -c "{% endcomment %}" --include="*.html" .)
if [ "$COMMENT_OPENS" = "$COMMENT_CLOSES" ]; then
  echo "✓ Comment tags are balanced (${COMMENT_OPENS} open, ${COMMENT_CLOSES} close)" | tee -a "$LOG_FILE"
else
  echo "⚠️ Unbalanced comment tags! (${COMMENT_OPENS} open, ${COMMENT_CLOSES} close)" | tee -a "$LOG_FILE"
  echo "Files with potentially unclosed comment tags:" | tee -a "$LOG_FILE"
  grep -r -l "{% comment %}" --include="*.html" . | xargs grep -L "{% endcomment %}" | tee -a "$LOG_FILE"
fi

# === 3. Check SCSS for suspicious '}}' (excluding Liquid)
echo "" | tee -a "$LOG_FILE"
echo "🧵 Checking SCSS for double closing braces (}})..." | tee -a "$LOG_FILE"
SCSS_ISSUES=$(grep -rn "}}" assets/css/ --include="*.scss" | grep -v '{{' | grep -v '{%')

if [[ -z "$SCSS_ISSUES" ]]; then
  echo "✓ No SCSS double brace issues found" | tee -a "$LOG_FILE"
else
  echo "⚠️ Found suspicious double closing braces in SCSS files:" | tee -a "$LOG_FILE"
  echo "$SCSS_ISSUES" | tee -a "$LOG_FILE"
fi

# === 4. Check for missing include files
echo "" | tee -a "$LOG_FILE"
echo "🧩 Checking for potentially missing include files..." | tee -a "$LOG_FILE"

# Extract all include paths and filter out variable includes
grep -r "{% include " --include="*.html" . | grep -v "{{"  > /tmp/includes_temp.txt

MISSING_INCLUDES=0
while IFS= read -r line; do
  # Extract the include path from the line
  include_path=$(echo "$line" | sed -E 's/.*{% include ([^ }]+).*/\1/')

  # Skip if path contains variables
  if [[ "$include_path" == *"{{"* || "$include_path" == *"}}"* ]]; then
    continue
  fi

  # Check if file exists
  if [[ ! -f "_includes/$include_path" ]]; then
    echo "⚠️ Missing include file: $include_path (from: $line)" | tee -a "$LOG_FILE"
    MISSING_INCLUDES=1
  fi
done < /tmp/includes_temp.txt

rm /tmp/includes_temp.txt

if [[ $MISSING_INCLUDES -eq 0 ]]; then
  echo "✓ All included files appear to exist" | tee -a "$LOG_FILE"
fi

# === 5. Validate all YAML files in _data/
echo "" | tee -a "$LOG_FILE"
echo "📄 Validating YAML files in _data/..." | tee -a "$LOG_FILE"
YAML_FILES=$(find _data -type f -name "*.yml")

YAML_ERROR=0

for file in $YAML_FILES; do
  if ruby -ryaml -e "YAML.load_file('$file')" >/dev/null 2>&1; then
    echo "✓ $file is valid" | tee -a "$LOG_FILE"
  else
    echo "❌ $file has YAML syntax errors" | tee -a "$LOG_FILE"
    YAML_ERROR=1
  fi
done

# === 6. Check for potential self-referencing includes
echo "" | tee -a "$LOG_FILE"
echo "🔄 Checking for potential self-referencing includes..." | tee -a "$LOG_FILE"

SELF_REFERENCES=$(grep -r "{% include .*\.html" --include="*.html" . | while read -r line; do
  file_path=$(echo "$line" | cut -d ':' -f 1)
  include_path=$(echo "$line" | sed -E 's/.*{% include ([^ }]+).*/\1/' | tr -d ' ')

  # Get base file name without path
  file_base=$(basename "$file_path")
  include_base=$(basename "$include_path")

  # Compare base filenames
  if [[ "$file_base" == "$include_base" ]]; then
    echo "$file_path includes itself: $include_path"
  fi
done)

if [[ -z "$SELF_REFERENCES" ]]; then
  echo "✓ No self-referencing includes found" | tee -a "$LOG_FILE"
else
  echo "⚠️ Potential self-referencing includes detected:" | tee -a "$LOG_FILE"
  echo "$SELF_REFERENCES" | tee -a "$LOG_FILE"
fi

# === Final Summary
echo "" | tee -a "$LOG_FILE"
if [[ $YAML_ERROR -eq 0 && $MISSING_INCLUDES -eq 0 ]]; then
  echo "✅ All checks passed successfully" | tee -a "$LOG_FILE"
else
  echo "⚠️ Some checks failed - review the log for details" | tee -a "$LOG_FILE"
fi

echo "" | tee -a "$LOG_FILE"
echo "✅ Pre-commit check complete." | tee -a "$LOG_FILE"
echo "==========================================" | tee -a "$LOG_FILE"
echo "📄 Log saved to: $LOG_FILE"

# Exit with error code if issues were found
if [[ $YAML_ERROR -ne 0 || $MISSING_INCLUDES -ne 0 ]]; then
  exit 1
else
  exit 0
fi
