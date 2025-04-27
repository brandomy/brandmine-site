#!/bin/bash
#
# check_language_consistency.sh
#
# This script checks for language consistency across the Brandmine Jekyll site.
# It verifies that each content page has corresponding versions in English, Russian, and Chinese,
# helping maintain a fully localized and professional site structure.
#
# Key Features:
# - Scans all Markdown and HTML files in the 'pages' directory.
# - Detects missing language versions based on folder structure.
# - Generates a CSV report highlighting inconsistencies.
# - Provides a quick console summary for immediate feedback.
#
# Usage:
#     bash check_language_consistency.sh
#
# Author: Randal Eastman


echo "Checking language consistency across your site..."

# Get all unique paths (excluding language prefix)
echo "Analyzing directory structure..."

# Find all HTML files and extract their paths without language prefix
find pages -name "*.md" -o -name "*.html" | while read file; do
  # Extract language from path (assuming pages/LANG/...)
  lang=$(echo $file | cut -d'/' -f2)
  
  # Extract the rest of the path
  path_suffix=$(echo $file | cut -d'/' -f3-)
  
  # Skip if empty
  if [ -z "$path_suffix" ]; then
    continue
  fi
  
  echo "$path_suffix,$lang"
done | sort > temp_paths.csv

# Process the results
echo "Checking for inconsistencies..."
echo "Path,Missing Languages" > inconsistencies.csv

# Get unique paths
cut -d',' -f1 temp_paths.csv | sort | uniq > unique_paths.txt

# Check each unique path
while read path; do
  # Get languages available for this path
  langs=$(grep "^$path," temp_paths.csv | cut -d',' -f2 | sort | tr '\n' ' ')
  
  # Check if all languages are present
  missing=""
  for l in "en" "ru" "zh"; do
    if [[ ! $langs =~ $l ]]; then
      missing="$missing $l"
    fi
  done
  
  # Report missing languages
  if [ ! -z "$missing" ]; then
    echo "$path,$missing" >> inconsistencies.csv
  fi
done < unique_paths.txt

# Show results
if [ $(wc -l < inconsistencies.csv) -gt 1 ]; then
  echo "Found inconsistencies. Check inconsistencies.csv for details."
  echo "Paths missing language versions:"
  tail -n +2 inconsistencies.csv | head -n 10
  
  if [ $(wc -l < inconsistencies.csv) -gt 11 ]; then
    echo "... and more. See the CSV file for complete results."
  fi
else
  echo "✅ All paths are consistent across languages"
fi

# Clean up
rm temp_paths.csv unique_paths.txt