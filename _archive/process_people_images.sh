#!/bin/bash
#
# process_people_images.sh
#
# This script processes people/team member images for the Brandmine Jekyll site.
# It generates responsive versions of all people images with appropriate
# sizing for portraits and team photos.
#
# Key Features:
# - Optimized for portrait-orientation photos
# - Higher quality preservation for faces
# - Generates multiple sizes (400w, 800w, 1200w) for responsive usage
# - Validates aspect ratios for consistency
#
# Usage:
#     ./_scripts/process_people_images.sh
#     ./_scripts/process_people_images.sh team
#
#     # The second form restricts processing to only the 'team' subfolder inside assets/images/people
#
# Author: Randal Eastman

# Base directory for people images
BASE_DIR="assets/images/people"

# Allow optional arguments to limit processing to specific subfolders
if [ "$#" -gt 0 ]; then
  TARGET_SUBFOLDERS=("$@")
else
  TARGET_SUBFOLDERS=("*")
fi

# Define texture path
TEXTURE="assets/images/textures/fabric_weave_light.jpg"

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

for SUB in "${TARGET_SUBFOLDERS[@]}"; do
  find "$BASE_DIR/$SUB" -type d -name originals | while read -r ORIGINALS_DIR; do
      OUTPUT_DIR="$(dirname "$ORIGINALS_DIR")"
      mkdir -p "$OUTPUT_DIR"
      echo "Processing people images in: $ORIGINALS_DIR → $OUTPUT_DIR"

      for IMG in "$ORIGINALS_DIR"/*.{jpg,jpeg,png}; do
          [ -e "$IMG" ] || continue

          FILENAME=$(basename "$IMG")
          NAME="${FILENAME%.*}"
          EXT="${FILENAME##*.}"

          IMAGE="$NAME"

          echo "  Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"

          DIMENSIONS=$(identify -format "%w %h" "$IMG")
          WIDTH=$(echo $DIMENSIONS | cut -d' ' -f1)
          HEIGHT=$(echo $DIMENSIONS | cut -d' ' -f2)
          RATIO=$(bc -l <<< "$WIDTH/$HEIGHT")

          if [[ "$PURPOSE" == "portrait" || "$IMAGE" == "portrait" || "$NAME" == portrait-* ]]; then
              EXPECTED_RATIO=0.67
              TOLERANCE=0.1
              DIFF=$(bc -l <<< "($RATIO - $EXPECTED_RATIO)^2 < $TOLERANCE^2")

              if [[ "$DIFF" != "1" ]]; then
                  echo "    WARNING: $FILENAME has unusual proportions for a portrait image."
                  echo "    Expected aspect ratio around 2:3 (0.67), actual: $RATIO"
                  echo "    For best results, portraits should be 800×1200px."
              fi
          else
              if [[ $(bc -l <<< "$RATIO < 1") == "1" ]]; then
                  echo "    WARNING: $FILENAME appears to be portrait-oriented but doesn't use portrait naming."
                  echo "    Consider renaming with 'portrait-' prefix for better handling."
              fi
          fi

          # Temporary styled output
          TEMP_STYLED="${OUTPUT_DIR}/${NAME}-styled-temp.${EXT}"

          # Apply teal + texture overlay
          magick "$IMG" \
            -fill "#38B2AC" -colorize 20% \
            -modulate 100,90,102 \
            \( "$TEXTURE" -resize "$(identify -format "%wx%h!" "$IMG")" \) \
            -compose softlight -composite \
            "$TEMP_STYLED"

          for SIZE in 400 800 1200; do
              OUTPUT_FILENAME="${NAME}-${SIZE}w.${EXT}"
              echo "    Creating $OUTPUT_FILENAME..."

              if [[ "$EXT" == "png" ]]; then
                  magick "$TEMP_STYLED" -resize "x$SIZE" "$OUTPUT_DIR/$OUTPUT_FILENAME"
              else
                  magick "$TEMP_STYLED" -resize "x$SIZE" -quality 90 "$OUTPUT_DIR/$OUTPUT_FILENAME"
              fi
          done

          # Remove temp file
          rm "$TEMP_STYLED"
      done
  done
done

echo "All people images have been processed!"
