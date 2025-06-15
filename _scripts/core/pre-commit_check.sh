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

# === 7. Check for broken image paths
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

# === 8. Check for empty SCSS files
echo "" | tee -a "$LOG_FILE"
echo "📁 Checking for empty or missing SCSS files in assets/css/components/ and pages/..." | tee -a "$LOG_FILE"
find assets/css/components/ assets/css/pages/ -name "*.scss" | while read -r file; do
  if [[ ! -s "$file" ]]; then
    echo "⚠️ Empty or missing SCSS file: $file" | tee -a "$LOG_FILE"
  fi
done

# === 9. Check for unused includes
echo "" | tee -a "$LOG_FILE"
echo "🧹 Checking for unused include files in _includes/..." | tee -a "$LOG_FILE"
USED_INCLUDES=$(grep -r "{% include " . --include="*.html" | sed -E 's/.*{% include ([^ }]+).*/\1/' | sort -u)
for f in $(find _includes -type f -name "*.html"); do
  BASE=$(basename "$f")
  echo "$USED_INCLUDES" | grep -q "$BASE" || echo "⚠️ Possibly unused include: $f" | tee -a "$LOG_FILE"
done

# === 10. Check for section arrays in content files (should not exist)
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

# === 11. Check for category naming consistency (prevent insight display issues)
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

# === 12. Image Naming Standard Validation ===
echo "" | tee -a "$LOG_FILE"
echo "🖼️ Validating image naming standards..." | tee -a "$LOG_FILE"

IMAGE_NAMING_ERROR=0

# Check for legacy front matter keys (founder_portrait should be founder)
echo "Checking for legacy front matter keys..." | tee -a "$LOG_FILE"
LEGACY_KEYS=$(find _brands _founders _insights -name "*.md" -exec grep -l "founder_portrait:" {} \; 2>/dev/null)
if [[ -n "$LEGACY_KEYS" ]]; then
  echo "❌ Found legacy 'founder_portrait:' keys (should be 'founder:'):" | tee -a "$LOG_FILE"
  echo "$LEGACY_KEYS" | tee -a "$LOG_FILE"
  echo "💡 Fix: Change 'founder_portrait:' to 'founder:' in front matter" | tee -a "$LOG_FILE"
  IMAGE_NAMING_ERROR=1
else
  echo "✅ No legacy front matter keys found" | tee -a "$LOG_FILE"
fi

# Check for location redundancy in image names
echo "Checking for location redundancy in image names..." | tee -a "$LOG_FILE"
LOCATION_REDUNDANCY=$(find _brands _founders _insights -name "*.md" -exec grep -H 'name: ".*-.*-.*"' {} \; 2>/dev/null | grep -E '(moscow|krasnodar|siberian|teatime|spices)')
if [[ -n "$LOCATION_REDUNDANCY" ]]; then
  echo "❌ Found location redundancy in image names:" | tee -a "$LOG_FILE"
  echo "$LOCATION_REDUNDANCY" | tee -a "$LOG_FILE"
  echo "💡 Fix: Use context-aware naming (e.g., 'market' not 'moscow-spice-market')" | tee -a "$LOG_FILE"
  IMAGE_NAMING_ERROR=1
else
  echo "✅ No location redundancy detected in image names" | tee -a "$LOG_FILE"
fi

# Check for person-specific naming in generic contexts
echo "Checking for person-specific naming in images..." | tee -a "$LOG_FILE"
PERSON_SPECIFIC=$(find _insights -name "*.md" -exec grep -H 'founder:.*name: ".*-.*"' {} \; 2>/dev/null | grep -v 'name: "portrait"')
if [[ -n "$PERSON_SPECIFIC" ]]; then
  echo "❌ Found person-specific naming in founder images:" | tee -a "$LOG_FILE"
  echo "$PERSON_SPECIFIC" | tee -a "$LOG_FILE"
  echo "💡 Fix: Use generic 'portrait' for insights founder images" | tee -a "$LOG_FILE"
  IMAGE_NAMING_ERROR=1
else
  echo "✅ No person-specific naming found in generic contexts" | tee -a "$LOG_FILE"
fi

# Check cross-language consistency for image names
echo "Checking cross-language image name consistency..." | tee -a "$LOG_FILE"
CONSISTENCY_ISSUES=""

# Get all content items that exist in multiple languages
for en_file in $(find _brands/en _founders/en _insights/en -name "*.md" 2>/dev/null); do
  # Extract the base filename
  base_file=$(basename "$en_file")

  # Check if RU and ZH versions exist
  ru_file="${en_file/\/en\//\/ru\/}"
  zh_file="${en_file/\/en\//\/zh\/}"

  if [[ -f "$ru_file" && -f "$zh_file" ]]; then
    # Extract image names from all three files
    en_images=$(grep -E 'name: "[^"]*"' "$en_file" 2>/dev/null | sort)
    ru_images=$(grep -E 'name: "[^"]*"' "$ru_file" 2>/dev/null | sort)
    zh_images=$(grep -E 'name: "[^"]*"' "$zh_file" 2>/dev/null | sort)

    # Compare image names across languages
    if [[ "$en_images" != "$ru_images" || "$en_images" != "$zh_images" ]]; then
      CONSISTENCY_ISSUES="$CONSISTENCY_ISSUES\n❌ Inconsistent image names in: $base_file"
      CONSISTENCY_ISSUES="$CONSISTENCY_ISSUES\n   EN: $en_images"
      CONSISTENCY_ISSUES="$CONSISTENCY_ISSUES\n   RU: $ru_images"
      CONSISTENCY_ISSUES="$CONSISTENCY_ISSUES\n   ZH: $zh_images"
      IMAGE_NAMING_ERROR=1
    fi
  fi
done

if [[ -n "$CONSISTENCY_ISSUES" ]]; then
  echo "❌ Cross-language image name inconsistencies found:" | tee -a "$LOG_FILE"
  echo -e "$CONSISTENCY_ISSUES" | tee -a "$LOG_FILE"
  echo "💡 Fix: Ensure identical image names across EN/RU/ZH versions" | tee -a "$LOG_FILE"
else
  echo "✅ Cross-language image names are consistent" | tee -a "$LOG_FILE"
fi

# Check for missing corresponding image files in originals
echo "Checking for missing original image files..." | tee -a "$LOG_FILE"
MISSING_ORIGINALS=""

# Check brands
for brand_file in $(find _brands/en -name "*.md" 2>/dev/null); do
  brand_slug=$(basename "$brand_file" .md)
  brand_dir="assets/images/brands/${brand_slug}/originals"

  if [[ -d "$brand_dir" ]]; then
    # Extract image names from front matter
    image_names=$(grep -A2 -E '^\s*(hero|logo|founder):' "$brand_file" | grep 'name:' | sed 's/.*name: "\([^"]*\)".*/\1/')
    purposes=$(grep -E '^\s*(hero|logo|founder):' "$brand_file" | sed 's/://g' | tr -d ' ')

    # Check if corresponding original files exist
    while IFS= read -r purpose && IFS= read -r name <&3; do
      if [[ -n "$purpose" && -n "$name" ]]; then
        expected_file="${brand_dir}/${purpose}-${name}.jpg"
        png_file="${brand_dir}/${purpose}-${name}.png"

        if [[ ! -f "$expected_file" && ! -f "$png_file" ]]; then
          MISSING_ORIGINALS="$MISSING_ORIGINALS\n❌ Missing: $expected_file (or .png)"
          IMAGE_NAMING_ERROR=1
        fi
      fi
    done <<< "$purposes" 3<<< "$image_names"
  fi
done

if [[ -n "$MISSING_ORIGINALS" ]]; then
  echo "❌ Missing original image files:" | tee -a "$LOG_FILE"
  echo -e "$MISSING_ORIGINALS" | tee -a "$LOG_FILE"
  echo "💡 Fix: Add missing files to originals/ directories or update front matter" | tee -a "$LOG_FILE"
else
  echo "✅ All referenced images have corresponding original files" | tee -a "$LOG_FILE"
fi

echo "📝 Report: Image naming validation – $( [[ $IMAGE_NAMING_ERROR -eq 0 ]] && echo 'all standards followed' || echo 'violations found' )" | tee -a "$LOG_FILE"

# === Final Summary
echo "" | tee -a "$LOG_FILE"
if [[ $YAML_ERROR -eq 0 && $MISSING_INCLUDES -eq 0 && -z "$SECTION_ARRAYS_FOUND" && $CATEGORY_ERROR -eq 0 && $IMAGE_NAMING_ERROR -eq 0 ]]; then
  echo "✅ All checks passed successfully" | tee -a "$LOG_FILE"
else
  echo "⚠️ Some checks failed - review the log for details" | tee -a "$LOG_FILE"
fi

echo "" | tee -a "$LOG_FILE"
echo "✅ Pre-commit check complete." | tee -a "$LOG_FILE"
echo "==========================================" | tee -a "$LOG_FILE"
echo "📄 Log saved to: $LOG_FILE"

# Exit with error code if issues were found
if [[ $YAML_ERROR -ne 0 || $MISSING_INCLUDES -ne 0 || -n "$SECTION_ARRAYS_FOUND" || $CATEGORY_ERROR -ne 0 || $IMAGE_NAMING_ERROR -ne 0 ]]; then
  exit 1
else
  exit 0
fi
