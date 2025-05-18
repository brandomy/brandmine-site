#!/bin/bash

echo "🔍 Searching for HTML files with 'taxonomy' in the filename..."

find . -type f -name "*taxonomy*.html" | while read -r file; do
  echo "📄 Found: $file"
done

echo "✅ Search complete."
