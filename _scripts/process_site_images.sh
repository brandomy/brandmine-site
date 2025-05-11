#!/bin/bash
# ============================================================================
# Consolidated Image Processor for Brandmine
# ----------------------------------------------------------------------------
# - Scans all target folders for JPGs and PNGs under any /originals/ directory
# - Validates ImageMagick availability
# - Detects image orientation (landscape vs portrait)
# - Generates 400w, 800w, 1200w responsive images in the same folder
# - Skips processing if output files already exist
# ============================================================================

# Author: Randal Eastman

# USAGE EXAMPLES:
#
# 1. Process all image categories:
#    ./_scripts/process_site_images.sh
#
# 2. Process only specific categories:
#    ./_scripts/process_site_images.sh brands sectors
#
# 3. Force regeneration of images even if they exist:
#    ./_scripts/process_site_images.sh --force
#
# 4. Process specific categories with forced regeneration:
#    ./_scripts/process_site_images.sh brands sectors --force
#
# NOTE: Categories in this script are top-level directories under assets/images:
#       brands, insights, attributes, markets, markets-sectors, sectors, signals, pages, site

# Check if ImageMagick's `convert` is available
command -v convert >/dev/null 2>&1 || {
  echo >&2 "ImageMagick is required but not installed. Aborting."
  exit 1
}

# Define top-level folders to scan

# Initialize flag to control forced regeneration
FORCE_REGEN=false

# Parse positional args and --force flag
TARGET_DIRS=()
for arg in "$@"; do
  if [[ "$arg" == "--force" ]]; then
    FORCE_REGEN=true
  else
    TARGET_DIRS+=("$arg")
  fi
done

# Default to full list if none specified
if [ ${#TARGET_DIRS[@]} -eq 0 ]; then
  TARGET_DIRS=("brands" "insights" "attributes" "markets" "markets-sectors" "sectors" "signals" "pages" "site")
fi

# Define widths for responsive images
WIDTHS=(400 800 1200)

echo "🚀 Starting consolidated image processing..."

for SECTION in "${TARGET_DIRS[@]}"; do
  DIR="assets/images/$SECTION"

  if [ ! -d "$DIR" ]; then
    echo "⚠️  Directory not found: $DIR"
    continue
  fi

  echo "🔍 Scanning $DIR for images under /originals/..."

  # Process JPG files
  find "$DIR" -type f -path "*/originals/*.jpg" | while read -r ORIGINAL; do
    # Get dimensions
    DIMENSIONS=$(identify -format "%w %h" "$ORIGINAL")
    WIDTH=$(echo "$DIMENSIONS" | awk '{print $1}')
    HEIGHT=$(echo "$DIMENSIONS" | awk '{print $2}')

    # Determine orientation
    if (( HEIGHT > WIDTH )); then
      ORIENTATION="portrait"
    else
      ORIENTATION="landscape"
    fi

    echo "🖼️  $ORIGINAL — $ORIENTATION (${WIDTH}×${HEIGHT})"

    # Parse filename and directory
    ORIGINALS_DIR=$(dirname "$ORIGINAL")
    PARENT_DIR=$(dirname "$ORIGINALS_DIR")
    BASENAME=$(basename "$ORIGINAL" .jpg)

    # Create each responsive version
    for SIZE in "${WIDTHS[@]}"; do
      OUTPUT="$PARENT_DIR/${BASENAME}-${SIZE}w.jpg"

      if [ -f "$OUTPUT" ] && [ "$FORCE_REGEN" = false ]; then
        echo "    ⏭️  Skipping existing $OUTPUT"
        continue
      fi

      echo "    📐 Creating $SIZE-width version: $OUTPUT"

      # Resize based on orientation
      if [ "$ORIENTATION" = "portrait" ]; then
        convert "$ORIGINAL" -resize "x${SIZE}" "$OUTPUT"
      else
        convert "$ORIGINAL" -resize "${SIZE}x" "$OUTPUT"
      fi
    done

    echo "✅ Finished processing $BASENAME.jpg"
    echo ""
  done

  # Process PNG files
  find "$DIR" -type f -path "*/originals/*.png" | while read -r ORIGINAL; do
    # Get dimensions
    DIMENSIONS=$(identify -format "%w %h" "$ORIGINAL")
    WIDTH=$(echo "$DIMENSIONS" | awk '{print $1}')
    HEIGHT=$(echo "$DIMENSIONS" | awk '{print $2}')

    # Determine orientation
    if (( HEIGHT > WIDTH )); then
      ORIENTATION="portrait"
    else
      ORIENTATION="landscape"
    fi

    echo "🖼️  $ORIGINAL — $ORIENTATION (${WIDTH}×${HEIGHT})"

    # Parse filename and directory
    ORIGINALS_DIR=$(dirname "$ORIGINAL")
    PARENT_DIR=$(dirname "$ORIGINALS_DIR")
    BASENAME=$(basename "$ORIGINAL" .png)

    # Create each responsive version
    for SIZE in "${WIDTHS[@]}"; do
      OUTPUT="$PARENT_DIR/${BASENAME}-${SIZE}w.png"

      if [ -f "$OUTPUT" ] && [ "$FORCE_REGEN" = false ]; then
        echo "    ⏭️  Skipping existing $OUTPUT"
        continue
      fi

      echo "    📐 Creating $SIZE-width version: $OUTPUT"

      # Resize based on orientation
      if [ "$ORIENTATION" = "portrait" ]; then
        convert "$ORIGINAL" -resize "x${SIZE}" "$OUTPUT"
      else
        convert "$ORIGINAL" -resize "${SIZE}x" "$OUTPUT"
      fi
    done

    echo "✅ Finished processing $BASENAME.png"
    echo ""
  done
done

echo "🎉 All images processed successfully."
