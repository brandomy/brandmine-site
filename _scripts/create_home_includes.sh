#!/bin/bash

# Define base includes directory
BASE_DIR="_includes/home"

# Create directory if it doesn't exist
mkdir -p "$BASE_DIR"

# Declare an array of file names
FILES=(
  "hero.html"
  "impact-statement.html"
  "discovery-dimensions.html"
  "how-it-works.html"
  "testimonials.html"
  "featured-brands.html"
  "lead-capture.html"
  "location-intelligence.html"
  "founder-focus.html"
  "brand-owners.html"
  "latest-insights.html"
  "final-cta.html"
)

# Create each file with a placeholder comment
for FILE in "${FILES[@]}"; do
  FILE_PATH="$BASE_DIR/$FILE"
  if [ ! -f "$FILE_PATH" ]; then
    echo "<!-- $FILE component placeholder -->" > "$FILE_PATH"
    echo "✅ Created: $FILE_PATH"
  else
    echo "⚠️  Skipped (already exists): $FILE_PATH"
  fi
done
