#!/bin/bash

echo "🔍 Scanning for {% include components/brand/... %} includes..."

# Find and replace in all relevant files
grep -rl "{% include components/brand/" . \
  | grep -E '\.html$|\.md$|\.liquid$' \
  | while read -r file; do
    echo "🔧 Updating: $file"
    sed -i '' 's/{% include components\/brand\//{% include components\/brands\//g' "$file"
done

echo "✅ All references to 'components/brand/' have been updated to 'components/brands/'"
