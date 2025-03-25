#!/bin/bash

# Directory listing script for Jekyll projects
OUTPUT_FILE="directory_structure.txt"

echo "Generating Jekyll directory structure..."

# Generate the directory tree, excluding common build directories and temp files
find . -type d -not -path "*/\.*" -not -path "*/_site*" -not -path "*/node_modules*" -not -path "*/vendor*" | sort > "$OUTPUT_FILE"

# Add file counts for key directories
echo -e "\nDirectory Statistics:" >> "$OUTPUT_FILE"
echo "Total directories: $(grep -c "." "$OUTPUT_FILE")" >> "$OUTPUT_FILE"
echo "Brand files: $(find ./_brands -type f -name "*.md" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "Insight files: $(find ./_insights -type f -name "*.md" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "Tag files: $(find ./_tags -type f -name "*.md" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"
echo "Page files: $(find ./pages -type f -name "*.md" 2>/dev/null | wc -l)" >> "$OUTPUT_FILE"

echo "Directory structure saved to $OUTPUT_FILE"