#!/bin/bash

# Setup log directory and timestamped log file
LOG_DIR="_docs/pre_commit_checks"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="${LOG_DIR}/pre_commit_check_${TIMESTAMP}.log"

mkdir -p "$LOG_DIR"

echo "🔍 Running Brandmine pre-commit checks..." | tee "$LOG_FILE"
echo "Timestamp: $(date)" | tee -a "$LOG_FILE"
echo "==========================================" | tee -a "$LOG_FILE"

# === 0. Run build optimizations
echo "🚀 Running build optimizations..." | tee -a "$LOG_FILE"
if command -v python3 >/dev/null 2>&1; then
  if [ -f "_scripts/utilities/generate-language-map.py" ]; then
    python3 _scripts/utilities/generate-language-map.py > /dev/null 2>&1
    echo "✓ Language navigation map updated" | tee -a "$LOG_FILE"
  fi
  if [ -f "_scripts/utilities/generate-navigation-cache.py" ]; then
    python3 _scripts/utilities/generate-navigation-cache.py > /dev/null 2>&1
    echo "✓ Navigation cache updated" | tee -a "$LOG_FILE"
  fi
else
  echo "⚠️ Python3 not found - skipping optimizations" | tee -a "$LOG_FILE"
fi

# === 1. Check for unbalanced Liquid tags
echo "🧪 Checking Liquid syntax..." | tee -a "$LOG_FILE"
LIQUID_ISSUES=$(grep -r "{%.*[^%]}%}" _includes/ _layouts/ pages/)

if [[ -z "$LIQUID_ISSUES" ]]; then
  echo "✓ No unbalanced Liquid tags found" | tee -a "$LOG_FILE"
else
  echo "⚠️ Possible unbalanced Liquid tags detected:" | tee -a "$LOG_FILE"
  echo "$LIQUID_ISSUES" | tee -a "$LOG_FILE"
fi
echo "📝 Report: Liquid tag check complete – $( [[ -z "$LIQUID_ISSUES" ]] && echo 'no issues found' || echo 'issues detected' )" | tee -a "$LOG_FILE"

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
echo "📝 Report: Malformed endif tag check complete – $( [[ -z "$LIQUID_ENDIF_ISSUES" ]] && echo 'no issues found' || echo 'issues detected' )" | tee -a "$LOG_FILE"

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
echo "📝 Report: Comment tag balance check – ${COMMENT_OPENS} open / ${COMMENT_CLOSES} close" | tee -a "$LOG_FILE"

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
echo "📝 Report: SCSS double brace check – $( [[ -z "$SCSS_ISSUES" ]] && echo 'no issues found' || echo 'issues detected' )" | tee -a "$LOG_FILE"

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
echo "📝 Report: Include file existence check – $( [[ $MISSING_INCLUDES -eq 0 ]] && echo 'all includes found' || echo 'missing includes detected' )" | tee -a "$LOG_FILE"

# === 5. Validate all YAML files in _data/ and collections
echo "" | tee -a "$LOG_FILE"
echo "📄 Validating YAML files in _data/, _founders/, _brands/, _insights/, _dimensions/..." | tee -a "$LOG_FILE"

YAML_DIRS="_data _founders _brands _insights _dimensions"
YAML_FILES=$(find $YAML_DIRS -type f \( -name "*.yml" -o -name "*.yaml" \))

YAML_ERROR=0

for file in $YAML_FILES; do
  if ruby -ryaml -e "YAML.load_file('$file')" >/dev/null 2>&1; then
    echo "✓ $file is valid" | tee -a "$LOG_FILE"
  else
    echo "❌ $file has YAML syntax errors" | tee -a "$LOG_FILE"
    YAML_ERROR=1
  fi
done

YAML_ERROR=0

for file in $YAML_FILES; do
  if ruby -ryaml -e "YAML.load_file('$file')" >/dev/null 2>&1; then
    echo "✓ $file is valid" | tee -a "$LOG_FILE"
  else
    echo "❌ $file has YAML syntax errors" | tee -a "$LOG_FILE"
    YAML_ERROR=1
  fi
done
echo "📝 Report: YAML validation check – $( [[ $YAML_ERROR -eq 0 ]] && echo 'all valid' || echo 'errors found' )" | tee -a "$LOG_FILE"

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
echo "📝 Report: Self-referencing include check – $( [[ -z "$SELF_REFERENCES" ]] && echo 'none found' || echo 'self-includes detected' )" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "🖼️ Checking for broken image paths in markdown and HTML files..." | tee -a "$LOG_FILE"
BROKEN_IMAGES=$(grep -rEo '!\[.*\]\(([^)]+)\)|<img [^>]*src="([^"]+)"' . | grep -oE 'assets/images/[^") ]+' | sort -u | while read -r img; do
  if [[ ! -f "$img" ]]; then
    echo "❌ Missing image file: $img"
  fi
done)
if [[ -z "$BROKEN_IMAGES" ]]; then
  echo "✓ No broken image paths detected" | tee -a "$LOG_FILE"
else
  echo "$BROKEN_IMAGES" | tee -a "$LOG_FILE"
fi

echo "" | tee -a "$LOG_FILE"
echo "📁 Checking for empty or missing SCSS files in assets/css/components/ and pages/..." | tee -a "$LOG_FILE"
find assets/css/components/ assets/css/pages/ -name "*.scss" | while read -r file; do
  if [[ ! -s "$file" ]]; then
    echo "⚠️ Empty or missing SCSS file: $file" | tee -a "$LOG_FILE"
  fi
done

echo "" | tee -a "$LOG_FILE"
echo "🧹 Checking for unused include files in _includes/..." | tee -a "$LOG_FILE"
USED_INCLUDES=$(grep -r "{% include " . --include="*.html" | sed -E 's/.*{% include ([^ }]+).*/\1/' | sort -u)
for f in $(find _includes -type f -name "*.html"); do
  BASE=$(basename "$f")
  echo "$USED_INCLUDES" | grep -q "$BASE" || echo "⚠️ Possibly unused include: $f" | tee -a "$LOG_FILE"
done

# === Check for section arrays in content files (should not exist)
echo "" | tee -a "$LOG_FILE"
echo "🚫 Checking for section arrays in content files..." | tee -a "$LOG_FILE"
SECTION_ARRAYS_FOUND=$(find _brands _founders _insights _dimensions -name "*.md" -exec grep -l "^sections:" {} \; 2>/dev/null)
if [[ -z "$SECTION_ARRAYS_FOUND" ]]; then
  echo "✅ No section arrays found in content files (correct - using centralized configuration)" | tee -a "$LOG_FILE"
else
  echo "❌ Found sections: arrays in content files (should use _data/page_sections.yml instead):" | tee -a "$LOG_FILE"
  echo "$SECTION_ARRAYS_FOUND" | tee -a "$LOG_FILE"
  SECTION_ARRAY_ERROR=1
fi
echo "📝 Report: Section array check – $( [[ -z "$SECTION_ARRAYS_FOUND" ]] && echo 'no arrays found (correct)' || echo 'arrays found (should be centralized)' )" | tee -a "$LOG_FILE"

# === 10. Check for category naming consistency (prevent insight display issues)
echo "" | tee -a "$LOG_FILE"
echo "🏷️ Checking insight category naming consistency..." | tee -a "$LOG_FILE"

# Check for hyphenated categories in insight files (should use underscores)
HYPHENATED_CATEGORIES=$(find _insights -name "*.md" -exec grep -H "category.*-" {} \; 2>/dev/null)
# Check for consistent category usage across all templates
TEMPLATE_CATEGORY_USAGE=$(find _includes -name "*.html" -exec grep -H 'where.*category.*-' {} \; 2>/dev/null)

CATEGORY_ERROR=0
if [[ -n "$HYPHENATED_CATEGORIES" ]]; then
  echo "⚠️ Found hyphenated categories in insight files (should use underscores):" | tee -a "$LOG_FILE"
  echo "$HYPHENATED_CATEGORIES" | tee -a "$LOG_FILE"
  echo "💡 Fix: Use underscores instead (e.g., 'founders_journey' not 'founders-journey')" | tee -a "$LOG_FILE"
  CATEGORY_ERROR=1
fi

if [[ -n "$TEMPLATE_CATEGORY_USAGE" ]]; then
  echo "⚠️ Found hyphenated category filtering in templates:" | tee -a "$LOG_FILE"
  echo "$TEMPLATE_CATEGORY_USAGE" | tee -a "$LOG_FILE"
  echo "💡 Fix: Update template filters to use underscores to match insight files" | tee -a "$LOG_FILE"
  CATEGORY_ERROR=1
fi

if [[ $CATEGORY_ERROR -eq 0 ]]; then
  echo "✅ Category naming is consistent across insight files and templates" | tee -a "$LOG_FILE"
fi

echo "📝 Report: Category naming check – $( [[ $CATEGORY_ERROR -eq 0 ]] && echo 'consistent naming' || echo 'inconsistencies found' )" | tee -a "$LOG_FILE"

# === Final Summary
echo "" | tee -a "$LOG_FILE"
if [[ $YAML_ERROR -eq 0 && $MISSING_INCLUDES -eq 0 && -z "$SECTION_ARRAYS_FOUND" && $CATEGORY_ERROR -eq 0 ]]; then
  echo "✅ All checks passed successfully" | tee -a "$LOG_FILE"
else
  echo "⚠️ Some checks failed - review the log for details" | tee -a "$LOG_FILE"
fi

echo "" | tee -a "$LOG_FILE"
echo "✅ Pre-commit check complete." | tee -a "$LOG_FILE"
echo "==========================================" | tee -a "$LOG_FILE"
echo "📄 Log saved to: $LOG_FILE"

# Exit with error code if issues were found
if [[ $YAML_ERROR -ne 0 || $MISSING_INCLUDES -ne 0 || -n "$SECTION_ARRAYS_FOUND" || $CATEGORY_ERROR -ne 0 ]]; then
  exit 1
else
  exit 0
fi
