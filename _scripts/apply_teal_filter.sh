#!/bin/bash
# apply_teal_filter.sh - Apply a subtle Brandmine teal filter to portrait photos
# Usage: ./apply_teal_filter.sh input_directory output_directory

# Default directories
INPUT_DIR="${1:-./originals}"
OUTPUT_DIR="${2:-./processed}"

# Check if output directory exists, create if not
if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
  echo "Created output directory: $OUTPUT_DIR"
fi

# Count files for progress tracking
total_files=$(find "$INPUT_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | wc -l)
processed=0

# Process each image file
find "$INPUT_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | while read file; do
  # Get just the filename
  filename=$(basename "$file")
  
  # Create output path
  output_path="$OUTPUT_DIR/$filename"
  
  # Apply the teal filter
  magick "$file" \
    -fill "#38B2AC" -colorize 12% \
    -modulate 100,100,97 \
    "$output_path"
  
  # Update progress counter
  processed=$((processed + 1))
  echo "[$processed/$total_files] Applied teal filter to: $filename"
done

echo "Complete! All $processed images processed with Brandmine teal filter."
echo "Results saved in: $OUTPUT_DIR"