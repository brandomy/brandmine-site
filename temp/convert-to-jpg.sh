#!/bin/bash

# Batch convert all PNGs in the current folder to optimized JPGs
# Requirements: imagemagick installed (`brew install imagemagick`)

# try "magick" instead of "convert" if you get an error

mkdir -p jpg_output

for img in *.png; do
  base=$(basename "$img" .png)
  magick "$img" -strip -interlace Plane -quality 85 "jpg_output/$base.jpg"
  # convert "$img" -strip -interlace Plane -quality 85 "jpg_output/$base.jpg"
  echo "Converted $img → jpg_output/$base.jpg"
done

echo "✅ All PNGs converted to JPGs in the jpg_output folder."