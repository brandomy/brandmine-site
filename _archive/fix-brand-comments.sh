#!/bin/bash

echo "🔍 Scanning for comment headers using 'components/brand/'..."

find _includes/components/brands/ -type f -name "*.html" | while read -r file; do
  if grep -q "_includes/components/brand/" "$file"; then
    echo "✏️  Fixing comment in: $file"
    sed -i '' 's|_includes/components/brand/|_includes/components/brands/|g' "$file"
  fi
done

echo "✅ All comment paths updated to use 'components/brands/'"
