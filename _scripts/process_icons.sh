#!/bin/bash
#
# process_icons.sh
#
# This script processes taxonomy icons for the Brandmine Jekyll site
# following the taxonomy-icon-implementation.md structure.
#
# Key Features:
# - Processes dimension icons (sectors, attributes, signals, markets)
# - Processes insights category icons
# - Maintains the taxonomy directory structure
# - Generates multiple sizes (24px, 48px, 128px)
# - Optimizes icons with high quality preservation
#
# Usage:
#     bash process_icons.sh [optional_system]
#     Examples:
#     - For all icons: bash process_icons.sh
#     - For dimension icons only: bash process_icons.sh dimensions
#     - For insights icons only: bash process_icons.sh insights
#
# Author: Randal Eastman

# Base directory for icons
BASE_DIR="assets/images/icons"

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

echo "Scanning for all 'originals' icon folders under $BASE_DIR..."

# Find all `originals` directories and process PNG icons within them
find "$BASE_DIR" -type d -name originals | while read -r SOURCE_DIR; do
    echo "Processing folder: $SOURCE_DIR"

    # Determine output base path (parent of 'originals')
    OUTPUT_BASE="$(dirname "$SOURCE_DIR")"

    # Create size output folders
    for SIZE in 24 48 128; do
        mkdir -p "$OUTPUT_BASE/$SIZE"
    done

    # Process each PNG in the originals folder
    for ICON in "$SOURCE_DIR"/*.png; do
        [ -e "$ICON" ] || continue

        FILENAME=$(basename "$ICON")
        NAME="${FILENAME%.*}"

        echo "  Processing $FILENAME"

        # Check dimensions for warnings
        DIMENSIONS=$(identify -format "%w %h" "$ICON")
        WIDTH=$(echo $DIMENSIONS | cut -d' ' -f1)
        HEIGHT=$(echo $DIMENSIONS | cut -d' ' -f2)
        RATIO=$(bc -l <<< "$WIDTH/$HEIGHT")
        DIFF=$(bc -l <<< "($RATIO - 1.0)^2 < 0.05^2")
        if [[ "$DIFF" != "1" ]]; then
            echo "    WARNING: $FILENAME has non-square dimensions: ${WIDTH}x${HEIGHT}"
        fi

        # Resize for each target size
        for SIZE in 24 48 128; do
            OUTPUT_FILE="$OUTPUT_BASE/$SIZE/$NAME.png"
            echo "    Creating ${SIZE}×${SIZE}: $OUTPUT_FILE"
            magick "$ICON" -resize ${SIZE}x${SIZE} -quality 100 "$OUTPUT_FILE"
        done
    done
done

echo "All PNG icon processing complete!"