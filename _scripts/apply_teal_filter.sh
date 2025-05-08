#!/bin/bash
# apply_teal_filter.sh - Recursively apply a subtle Brandmine teal filter to people portraits
# Usage: ./apply_teal_filter.sh [base_dir]
# Default base_dir is ./assets/images/people

BASE_DIR="${1:-./assets/images/people}"
echo "Starting Brandmine teal filter application from: $BASE_DIR"

# Find all `originals` directories under the base directory
find "$BASE_DIR" -type d -name originals | while read -r SOURCE_DIR; do
  echo "Processing directory: $SOURCE_DIR"

  # Determine output path: replace /originals with /filtered
  OUTPUT_DIR="${SOURCE_DIR/originals/filtered}"
  mkdir -p "$OUTPUT_DIR"

  # Count files
  FILES=("$SOURCE_DIR"/*.{jpg,jpeg,png})
  COUNT=$(find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | wc -l)
  processed=0

  # Apply filter to each image
  find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read file; do
    filename=$(basename "$file")
    output_path="$OUTPUT_DIR/$filename"

    # Apply the teal filter
    magick "$file" \
      -fill "#38B2AC" -colorize 12% \
      -modulate 100,90,102 \
      "$output_path"

    processed=$((processed + 1))
    echo "  [$processed/$COUNT] Filter applied to: $filename"
  done

  echo "Finished processing $SOURCE_DIR → $OUTPUT_DIR"
done

echo "✅ Teal filter application complete across all people originals."