#!/bin/bash
# Project-wide resize_images.sh
# Place this script in your project root

# Base directory for all brand images
BASE_DIR="assets/images/brands"

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Process a specific brand, or all brands if none specified
if [ -n "$1" ]; then
    BRANDS=("$1")
    echo "Processing brand: $1"
else
    # Get all brand directories
    BRANDS=()
    for DIR in "$BASE_DIR"/*/; do
        BRAND=$(basename "$DIR")
        BRANDS+=("$BRAND")
    done
    echo "Processing all brands: ${BRANDS[*]}"
fi

# Process each brand
for BRAND in "${BRANDS[@]}"; do
    BRAND_DIR="$BASE_DIR/$BRAND"
    ORIGINALS_DIR="$BRAND_DIR/originals"
    
    # Skip if originals directory doesn't exist
    if [ ! -d "$ORIGINALS_DIR" ]; then
        echo "No originals directory found for $BRAND, skipping."
        continue
    fi
    
    echo "Processing brand: $BRAND"
    
    # Process each original image
    for IMG in "$ORIGINALS_DIR"/*.{jpg,jpeg,png}; do
        # Skip if no files match the pattern
        [ -e "$IMG" ] || continue
        
        # Extract the filename without extension
        FILENAME=$(basename "$IMG")
        NAME="${FILENAME%.*}"
        EXT="${FILENAME##*.}"
        
        # Extract purpose if present in filename (format: purpose-name.jpg)
        if [[ "$NAME" == *-* ]]; then
            PURPOSE=$(echo "$NAME" | cut -d- -f1)
            IMAGE=$(echo "$NAME" | cut -d- -f2-)
        else
            PURPOSE="general"
            IMAGE="$NAME"
        fi
        
        echo "  Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"
        
        # Create each size
        for SIZE in 400 800 1200; do
            # Updated output filename format to keep purpose-image order consistent
            OUTPUT_FILENAME="${BRAND}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
            echo "    Creating $OUTPUT_FILENAME..."
            convert "$IMG" -resize "${SIZE}x" -quality 85 "$BRAND_DIR/$OUTPUT_FILENAME"
        done
    done
done

echo "All images have been processed!"