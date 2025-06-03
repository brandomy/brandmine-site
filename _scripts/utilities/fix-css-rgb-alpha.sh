#!/bin/bash
# fix-css-rgb-alpha.sh
# Converts unsupported rgb(R G B / A%) to rgba(R, G, B, A)
# Required for compatibility with Jekyll's Sass converter (SassC 1.5.2)

echo "🔍 Scanning for rgb(...) / alpha syntax..."
find assets/css -type f -name '*.scss' | while read -r file; do
  echo "🛠 Fixing $file"

  # This sed command rewrites: rgb(255 255 255 / 50%) → rgba(255, 255, 255, 0.5)
  sed -i '' -E '
    s/rgb\(([0-9]+)[ ]+([0-9]+)[ ]+([0-9]+)[ ]*\/[ ]*([0-9]+)%\)/rgba(\1, \2, \3, 0.\4)/g
  ' "$file"
done

echo "✅ All rgb(R G B / A%) fixed to rgba(R, G, B, A)"
