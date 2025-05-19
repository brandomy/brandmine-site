#!/bin/bash

echo "🔍 Searching for outdated includes in site files..."
echo ""

# Declare associative array
declare -A includes
includes["includes/pages/discover/attributes-grid.html"]="includes/pages/discover/all-attributes-grid.html"
includes["includes/pages/discover/markets-grid.html"]="includes/pages/discover/all-markets-grid.html"
includes["includes/pages/discover/sectors-grid.html"]="includes/pages/discover/all-sectors-grid.html"
includes["includes/pages/discover/signals-grid.html"]="includes/pages/discover/all-signals-grid.html"

# Search for each old include reference
for old in "${!includes[@]}"; do
  echo "🔎 Checking for: $old"
  grep -r --include="*.html" "$old" . || echo "✅ No references found for $old"
  echo ""
done

echo "✅ Done searching."
