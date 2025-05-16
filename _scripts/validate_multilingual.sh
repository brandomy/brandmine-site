#!/bin/bash
# validate_multilingual.sh - Check multilingual consistency

# Check for missing translations
echo "Checking missing translations..."
for key in $(grep -r "site.data.translations" --include="*.html" . | awk -F"[" '{print $2}' | awk -F"]" '{print $1}' | sort | uniq); do
  for lang in en ru zh; do
    if ! grep -q "$key" _data/translations/$lang.yml; then
      echo "Missing translation: $key in $lang.yml"
    fi
  done
done

# Check for consistent permalinks
echo "Checking permalink consistency..."
for file in $(find _brands/en -name "*.md"); do
  slug=$(basename $file .md)
  ru_file="_brands/ru/$slug.md"
  zh_file="_brands/zh/$slug.md"

  if [ ! -f "$ru_file" ]; then
    echo "Missing Russian translation for $slug"
  fi

  if [ ! -f "$zh_file" ]; then
    echo "Missing Chinese translation for $slug"
  fi
done

echo "Validation complete."
