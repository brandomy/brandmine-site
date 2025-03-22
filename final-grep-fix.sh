#!/bin/bash

# Final comprehensive fix for enhanced-site-summary-advanced.sh
SCRIPT="_scripts/enhanced-site-summary-advanced.sh"

# Create backup
cp "$SCRIPT" "${SCRIPT}.final_backup"
echo "Backup created at ${SCRIPT}.final_backup"

# Fix the most common problematic pattern: grep -n "^[a-z][a-z\-]*:"
sed -i '' 's/\[a-z\]\[a-z\\-\]\*:/[a-z][a-z-]*:/g' "$SCRIPT"

# Fix other potential character class issues with escaped hyphens
sed -i '' 's/\[a-z\\-\]/[a-z-]/g' "$SCRIPT"
sed -i '' 's/\[A-Za-z0-9\\-\]/[A-Za-z0-9-]/g' "$SCRIPT"
sed -i '' 's/\[a-zA-Z0-9_\\-\]/[a-zA-Z0-9_-]/g' "$SCRIPT"

# Fix grep pattern on line 477 (commonly problematic)
sed -i '' '477s/grep -n "^  \[a-z\]\[a-z\\-\]\*:"/grep -n "^  [a-z][a-z-]*:"/g' "$SCRIPT"

# Fix the tag_name extraction pattern on line 479
sed -i '' '479s/\\-/\-/g' "$SCRIPT"

# Fix any remaining problematic patterns
sed -i '' 's/\\-\]\*/\-]*/g' "$SCRIPT"
sed -i '' 's/\[^a-z\\-\]/[^a-z-]/g' "$SCRIPT"

# Fix grep option spacing
sed -i '' 's/grep -A\([0-9]\)/grep -A \1/g' "$SCRIPT"
sed -i '' 's/grep -B\([0-9]\)/grep -B \1/g' "$SCRIPT"
sed -i '' 's/grep -C\([0-9]\)/grep -C \1/g' "$SCRIPT"

# Fix sed in-place edits for macOS
sed -i '' 's/sed -i \([^'\''"][^;]*\)/sed -i '\'''\'' \1/g' "$SCRIPT"

echo "Final fixes applied to $SCRIPT"
echo "Try running: ./_scripts/enhanced-site-summary-advanced.sh"