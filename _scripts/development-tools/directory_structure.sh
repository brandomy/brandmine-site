
#!/bin/bash
#
# directory_structure.sh
#
# This script generates a comprehensive directory and file listing for the Brandmine Jekyll project.
# It outputs a clear directory tree, counts key file types, and provides structured breakdowns
# for assets such as CSS components, layouts, pages, and tokens.
#
# Key Features:
# - Excludes build artifacts and temporary files from the listing.
# - Provides total counts for directories and important file categories.
# - Organizes CSS files by type for easier maintenance and auditing.
# - Outputs everything neatly into a single directory_structure.txt file.
#
# Usage:
#     bash directory_structure.sh
#
# Author: Randal Eastman

# Directory listing script for Jekyll projects
OUTPUT_FILE="directory_structure.txt"

echo "Generating Jekyll directory structure..."

# Generate the directory tree, excluding common build directories and temp files
echo "Directory Structure:" > "$OUTPUT_FILE"
echo "===================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# List directories and files, but exclude common build directories and temp files
find . -not -path "*/\.*" -not -path "*/_site*" -not -path "*/node_modules*" -not -path "*/vendor*" | sort >> "$OUTPUT_FILE"

# Add file counts for key directories
echo -e "\nDirectory Statistics:" >> "$OUTPUT_FILE"
echo "===================" >> "$OUTPUT_FILE"
echo "Total directories: $(find . -type d -not -path "*/\.*" -not -path "*/_site*" -not -path "*/node_modules*" -not -path "*/vendor*" | wc -l)" >> "$OUTPUT_FILE"
echo "Total files: $(find . -type f -not -path "*/\.*" -not -path "*/_site*" -not -path "*/node_modules*" -not -path "*/vendor*" | wc -l)" >> "$OUTPUT_FILE"
echo "Brand files: $(find ./_brands -type f -name "*.md" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "Insight files: $(find ./_insights -type f -name "*.md" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "Tag files: $(find ./_tags -type f -name "*.md" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "Page files: $(find ./pages -type f -name "*.md" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "CSS files: $(find ./assets/css -type f -name "*.css" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "JavaScript files: $(find ./assets/js -type f -name "*.js" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"

# Add specific breakdown of CSS components
echo -e "\nCSS Component Files:" >> "$OUTPUT_FILE"
echo "===================" >> "$OUTPUT_FILE"
find ./assets/css/components -type f -name "*.css" 2>/dev/null | sort >> "$OUTPUT_FILE"

echo -e "\nCSS Layout Files:" >> "$OUTPUT_FILE"
echo "===================" >> "$OUTPUT_FILE"
find ./assets/css/layout -type f -name "*.css" 2>/dev/null | sort >> "$OUTPUT_FILE"

echo -e "\nCSS Pages Files:" >> "$OUTPUT_FILE"
echo "===================" >> "$OUTPUT_FILE"
find ./assets/css/pages -type f -name "*.css" 2>/dev/null | sort >> "$OUTPUT_FILE"

echo -e "\nCSS Token Files:" >> "$OUTPUT_FILE"
echo "===================" >> "$OUTPUT_FILE"
find ./assets/css/tokens -type f -name "*.css" 2>/dev/null | sort >> "$OUTPUT_FILE"

echo "Directory structure saved to $OUTPUT_FILE"