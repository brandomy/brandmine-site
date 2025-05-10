#!/bin/bash
# apply_teal_fabric_style.sh
# Description: Apply teal colorization + fabric texture overlay directly to people portraits.
#
# Usage: ./apply_teal_fabric_style.sh [base_dir]
# Example: ./apply_teal_fabric_style.sh ./assets/images/people/team

BASE_DIR="${1:-./assets/images/people}"
TEXTURE="./assets/images/textures/fabric_weave_light.jpg"

echo "Starting full styling (teal + texture) from: $BASE_DIR"
echo "Using texture overlay: $TEXTURE"

# Find all 'originals' folders
find "$BASE_DIR" -type d -name originals | while read -r SOURCE_DIR; do
  OUTPUT_DIR="${SOURCE_DIR/originals/styled}"
  mkdir -p "$OUTPUT_DIR"
  echo "Processing images in: $SOURCE_DIR → $OUTPUT_DIR"

  for FILE in "$SOURCE_DIR"/*.{jpg,jpeg,png}; do
    [ -e "$FILE" ] || continue
    FILENAME=$(basename "$FILE")
    OUTPUT_FILE="$OUTPUT_DIR/$FILENAME"

    # Apply teal filter and then fabric texture overlay
    magick "$FILE" \
      -modulate 100,90,102 \
      \( "$TEXTURE" -resize "$(identify -format "%wx%h!" "$FILE")" \) \
      -compose softlight -composite \
      "$OUTPUT_FILE"

    echo "  Styled: $OUTPUT_FILE"
  done
done

echo "✅ Teal + texture overlay complete."
