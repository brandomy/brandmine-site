#!/bin/bash
# debug_jekyll.sh
# Usage: ./debug_jekyll.sh

echo "=== Jekyll Debug Script ==="
echo "Checking Ruby version..."
ruby -v

echo "Checking Jekyll version..."
bundle exec jekyll -v

echo "Checking for CSS syntax errors..."
npx stylelint "assets/css/**/*.css"

echo "Checking for missing include files..."
grep -r "include " --include="*.html" . | awk -F: '{print $2}' | sed 's/.*include //' | sed 's/ .*//' | sed 's/["'"'"']//g' | sort | uniq > includes_referenced.txt

find _includes -type f | sort > includes_actual.txt

echo "Files referenced but not found:"
grep -v -f includes_actual.txt includes_referenced.txt

echo "Performing test build..."
bundle exec jekyll build --safe

echo "Debug complete."
