#!/bin/bash
#
# process_people_images.sh
#
# This script resizes and processes profile images for the Brandmine Jekyll site.
# It focuses on non-brand image categories, such as people, and generates optimized
# assets for responsive breakpoints.
#
# Key Features:
# - Processes "people" category images stored in structured folders.
# - Preserves transparency for PNG files.
# - Handles portrait images appropriately for 2:3 aspect ratio.
# - Maintains a consistent naming convention for easy asset management.
#
# Usage:
#     bash process_people_images.sh
#
# Author: Randal Eastman

# Define image categories
CATEGORIES=("people")

# Process each category
for CATEGORY in "${CATEGORIES[@]}"; do
    CATEGORY_DIR="assets/images/$CATEGORY"
    
    # Skip if category doesn't exist
    if [ ! -d "$CATEGORY_DIR" ]; then
        echo "Category directory $CATEGORY_DIR not found, skipping."
        continue
    fi
    
    echo "Processing category: $CATEGORY"
    
    ORIGINALS_DIR="$CATEGORY_DIR/originals"
    
    # Skip if originals directory doesn't exist
    if [ ! -d "$ORIGINALS_DIR" ]; then
        echo "  No originals directory found, skipping."
        continue
    fi
    
    # Process each original image
    for IMG in "$ORIGINALS_DIR"/*.{jpg,jpeg,png}; do
        # Skip if no files match the pattern
        [ -e "$IMG" ] || continue
        
        # Extract the filename without extension
        FILENAME=$(basename "$IMG")
        NAME="${FILENAME%.*}"
        EXT="${FILENAME##*.}"
        
        # For people images, use "portrait" as the purpose
        PURPOSE="portrait"
        IMAGE="$NAME"
        
        echo "  Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"
        
        # Create each size
        for SIZE in 400 800 1200; do
            OUTPUT_FILENAME="${CATEGORY}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
            echo "    Creating $OUTPUT_FILENAME..."
            
            if [[ "$EXT" == "png" ]]; then
                # For PNG, preserve transparency
                # Resize by height for portraits
                magick "$IMG" -resize "x${SIZE}" "$CATEGORY_DIR/$OUTPUT_FILENAME"
            else
                # For JPG and other formats, optimize with quality setting
                # Resize by height for portraits
                magick "$IMG" -resize "x${SIZE}" -quality 85 "$CATEGORY_DIR/$OUTPUT_FILENAME"
            fi
        done
    done
done

echo "All image categories have been processed!"