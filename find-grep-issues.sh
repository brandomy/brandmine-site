#!/bin/bash

# Create a temporary copy of the site summary script
cp _scripts/enhanced-site-summary-advanced.sh _scripts/temp-debug.sh

# Make it executable
chmod +x _scripts/temp-debug.sh

# Add debugging to the start of the script
sed -i '' '9i\\
# Debug function for grep commands\\
_grep() {\\
  echo "Running grep: $@" >/dev/tty\\
  grep "$@" || {\\
    echo "FAILED: grep $@" >/dev/tty\\
    return 1\\
  }\\
}\\
' _scripts/temp-debug.sh

# Replace grep calls with the debug function
sed -i '' 's/grep -/\\_grep -/g' _scripts/temp-debug.sh 
sed -i '' 's/| grep /| \\_grep /g' _scripts/temp-debug.sh
sed -i '' 's/[^_]grep "/\\_grep "/g' _scripts/temp-debug.sh

echo "Debug script created at _scripts/temp-debug.sh"
echo "Run it with: ./_scripts/temp-debug.sh"
echo "It will display each grep command as it runs and highlight failures"