#!/bin/bash
# convert-to-jpg.sh

# This script converts all PNG files in the current directory to JPG format
# using ImageMagick. It creates a new folder called "jpg_output" to store the
# converted JPG files. The script uses the `magick` command from ImageMagick
# to perform the conversion. The converted JPG files are optimized with
# specific options to reduce file size while maintaining quality.
# Usage: Run this script in a terminal in the directory containing PNG files.
# Make sure to have ImageMagick installed on your system.
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