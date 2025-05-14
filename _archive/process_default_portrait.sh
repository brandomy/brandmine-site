#!/bin/bash

# Process the default founder portrait SVG into multiple sizes for responsive images
# Sizes: 400w, 800w, 1200w

SOURCE_SVG="./assets/images/site/default-founder-portrait.svg"
OUTPUT_DIR="./assets/images/site"

# Check if source SVG exists
if [ ! -f "$SOURCE_SVG" ]; then
  echo "Source SVG not found: $SOURCE_SVG"
  exit 1
fi

# Create sizes
echo "Processing default founder portrait to multiple sizes..."

# 400px width
convert -background none -density 300 "$SOURCE_SVG" -resize 400x400 "$OUTPUT_DIR/default-founder-portrait-400w.jpg"

# 800px width
convert -background none -density 300 "$SOURCE_SVG" -resize 800x800 "$OUTPUT_DIR/default-founder-portrait-800w.jpg"

# 1200px width
convert -background none -density 300 "$SOURCE_SVG" -resize 1200x1200 "$OUTPUT_DIR/default-founder-portrait-1200w.jpg"

echo "Default founder portrait images generated successfully:"
ls -la "$OUTPUT_DIR/default-founder-portrait-"*

# Make images browser-friendly
echo "Optimizing images for web..."
find "$OUTPUT_DIR" -name "default-founder-portrait-*.jpg" -exec jpegoptim --max=85 {} \;

echo "Done"