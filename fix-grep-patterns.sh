#!/bin/bash

# Fix grep patterns with invalid character ranges in the site summary script
# This addresses the macOS BSD grep compatibility issues

# The script to fix
SCRIPT="_scripts/enhanced-site-summary-advanced.sh"

# Ensure we have a backup
cp "$SCRIPT" "${SCRIPT}.bak"
echo "Backup created at ${SCRIPT}.bak"

# Fix character classes with escaped hyphens - these cause "invalid character range" errors
# Replace [a-z\-] with [a-z-] (move hyphen to end, no escape)
sed -i '' 's/\[a-z\\-\]/[a-z-]/g' "$SCRIPT"
sed -i '' 's/\[a-zA-Z0-9_\\-\]/[a-zA-Z0-9_-]/g' "$SCRIPT"
sed -i '' 's/\[a-z\]\[a-z\\-\]\*/[a-z][a-z-]*/g' "$SCRIPT"

# Fix other potential character class issues
sed -i '' 's/\[\([^]]*\)\\-\([^]]*\)\]/[\1-\2]/g' "$SCRIPT"

# Fix in-place sed commands for macOS compatibility
sed -i '' 's/sed -i \([^'\''"]\)/sed -i '\'''\'' \1/g' "$SCRIPT"

echo "Fixes applied to $SCRIPT"
echo "Try running the script now with: ./_scripts/enhanced-site-summary-advanced.sh"
