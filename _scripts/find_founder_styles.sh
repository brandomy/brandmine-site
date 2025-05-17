#!/bin/bash

# Define search patterns
PATTERNS=(
  "founder-focus"
  "founder-focus-carousel"
  "founder-card"
  ".founder"
)

# Define directories to search
DIRS=(
  "assets/css"
  "_includes"
  "_layouts"
)

echo "====== Searching for Founder Focus Styling ======"
echo ""

# Function to search for pattern in specified directories
search_pattern() {
  local pattern=$1
  echo "🔍 Searching for: $pattern"
  echo "-----------------------------------------"

  for dir in "${DIRS[@]}"; do
    echo "In directory: $dir"
    # Using grep to search for the pattern recursively
    grep -r --include="*.css" --include="*.scss" --include="*.html" "$pattern" "$dir" | sort | head -n 20
    echo ""
  done

  echo ""
}

# Search for each pattern
for pattern in "${PATTERNS[@]}"; do
  search_pattern "$pattern"
done

echo "====== Additional Component Check ======"
echo ""
echo "🔍 Checking if founder-focus component exists:"
if [ -f "_includes/pages/home/founder-focus.html" ]; then
  echo "✅ Found: _includes/pages/home/founder-focus.html"
else
  echo "❌ Not found: _includes/pages/home/founder-focus.html"
  echo "Looking for alternative locations..."
  find _includes -name "founder-focus.html" -o -name "*founder*" | grep -v "_site"
fi

echo ""
echo "🔍 Checking related component CSS:"
find assets/css/components -name "*founder*" -o -name "*card*" | grep -v "_site"

echo ""
echo "=========================================="
echo "Scan complete. Check results above for founder-focus styling locations."
