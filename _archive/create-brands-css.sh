#!/bin/bash

# Create the target directory
mkdir -p assets/css/components/brands

# Define the list of SCSS files to create
files=(
  "contact-info"
  "founder-info"
  "generation-display"
  "meta-item"
  "recognition-section"
  "related-brands-list"
  "related-insights"
  "social-icon"
  "social-media-icons"
  "tag-list"
)

# Create each .scss file
for file in "${files[@]}"; do
  touch "assets/css/components/brands/_${file}.scss"
done


echo "✅ All brand SCSS component files created in assets/css/components/brands/"
