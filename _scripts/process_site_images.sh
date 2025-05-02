#!/bin/bash
#
# process_site_images.sh
#
# This script processes site-wide images for the Brandmine Jekyll site,
# including sector, market, attribute, and signal images, as well as
# general site elements. It generates responsive versions at multiple
# sizes for optimal loading.
#
# Key Features:
# - Can process all categories or a single specified category
# - Validates appropriate aspect ratios
# - Handles different image purposes appropriately
# - Generates multiple sizes (400w, 800w, 1200w) for responsive usage
#
# Usage:
#     bash process_site_images.sh [optional_category]
#
# Author: Randal Eastman

# Base directory for site images
BASE_DIR="assets/images"

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Define categories to process
if [ -n "$1" ]; then
    # Process specific category
    CATEGORIES=("$1")
    echo "Processing category: $1"
else
    # Process all standard categories
    CATEGORIES=("sectors" "markets" "attributes" "signals" "insights" "site" "icons")
    echo "Processing all categories"
fi

# Process each category
for CATEGORY in "${CATEGORIES[@]}"; do
    CATEGORY_DIR="$BASE_DIR/$CATEGORY"
    ORIGINALS_DIR="$CATEGORY_DIR/originals"
    
    # Skip if category directory doesn't exist
    if [ ! -d "$CATEGORY_DIR" ]; then
        echo "Category directory $CATEGORY_DIR not found, skipping."
        continue
    fi
    
    # Skip if originals directory doesn't exist
    if [ ! -d "$ORIGINALS_DIR" ]; then
        echo "  No originals directory found for $CATEGORY, skipping."
        continue
    fi
    
    echo "Processing category: $CATEGORY"
    
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
        
        # Get image dimensions and check proportions
        DIMENSIONS=$(identify -format "%w %h" "$IMG")
        WIDTH=$(echo $DIMENSIONS | cut -d' ' -f1)
        HEIGHT=$(echo $DIMENSIONS | cut -d' ' -f2)
        RATIO=$(bc -l <<< "$WIDTH/$HEIGHT")
        
        # Set resize and quality options based on purpose and category
        if [[ "$CATEGORY" == "icons" || "$PURPOSE" == "icon" ]]; then
            # For icons, use higher quality and maintain aspect ratio
            RESIZE_OPT="-resize "
            QUALITY_OPT="-quality 95"
            
            # Check if it's a square image (expect 1:1 ratio for icons)
            EXPECTED_RATIO=1.0  # 1:1 ratio
            TOLERANCE=0.05
            DIFF=$(bc -l <<< "($RATIO - $EXPECTED_RATIO)^2 < $TOLERANCE^2")
            
            if [[ "$DIFF" != "1" ]]; then
                echo "    WARNING: $FILENAME has unusual proportions for an icon."
                echo "    Expected aspect ratio 1:1 (1.0), actual: $RATIO"
            fi
        elif [[ "$PURPOSE" == "portrait" || "$PURPOSE" == "profile" ]]; then
            # For portraits, resize by height
            RESIZE_OPT="-resize x"
            QUALITY_OPT="-quality 90"
            
            # Check if it's a portrait image (expect 2:3 ratio)
            EXPECTED_RATIO=0.67  # 2:3 ratio
            TOLERANCE=0.1
            DIFF=$(bc -l <<< "($RATIO - $EXPECTED_RATIO)^2 < $TOLERANCE^2")
            
            if [[ "$DIFF" != "1" ]]; then
                echo "    WARNING: $FILENAME has unusual proportions for a portrait image."
                echo "    Expected aspect ratio around 2:3 (0.67), actual: $RATIO"
            fi
        else
            # For standard images, resize by width
            RESIZE_OPT="-resize "
            QUALITY_OPT="-quality 85"
            
            # Check if it's a standard image (expect 3:2 ratio)
            EXPECTED_RATIO=1.5  # 3:2 ratio
            TOLERANCE=0.2
            DIFF=$(bc -l <<< "($RATIO - $EXPECTED_RATIO)^2 < $TOLERANCE^2")
            
            if [[ "$DIFF" != "1" ]]; then
                echo "    WARNING: $FILENAME has unusual proportions for a standard image."
                echo "    Expected aspect ratio around 3:2 (1.5), actual: $RATIO"
            fi
        fi
        
        # Create each size
        for SIZE in 400 800 1200; do
            OUTPUT_FILENAME="${CATEGORY}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
            echo "    Creating $OUTPUT_FILENAME..."
            
            if [[ "$EXT" == "png" ]]; then
                # For PNG, preserve transparency
                if [[ "$CATEGORY" == "icons" || "$PURPOSE" == "icon" ]]; then
                    # For icons, resize to exact size
                    magick "$IMG" ${RESIZE_OPT}${SIZE} "$CATEGORY_DIR/$OUTPUT_FILENAME"
                elif [[ "$PURPOSE" == "portrait" || "$PURPOSE" == "profile" ]]; then
                    # For portraits, resize by height
                    magick "$IMG" ${RESIZE_OPT}${SIZE} "$CATEGORY_DIR/$OUTPUT_FILENAME"
                else
                    # For standard images, resize by width
                    magick "$IMG" ${RESIZE_OPT}${SIZE} "$CATEGORY_DIR/$OUTPUT_FILENAME"
                fi
            else
                # For JPG and other formats, optimize with appropriate quality
                if [[ "$CATEGORY" == "icons" || "$PURPOSE" == "icon" ]]; then
                    # For icons, resize to exact size with high quality
                    magick "$IMG" ${RESIZE_OPT}${SIZE} ${QUALITY_OPT} "$CATEGORY_DIR/$OUTPUT_FILENAME"
                elif [[ "$PURPOSE" == "portrait" || "$PURPOSE" == "profile" ]]; then
                    # For portraits, resize by height with higher quality
                    magick "$IMG" ${RESIZE_OPT}${SIZE} ${QUALITY_OPT} "$CATEGORY_DIR/$OUTPUT_FILENAME"
                else
                    # For standard images, resize by width with standard quality
                    magick "$IMG" ${RESIZE_OPT}${SIZE} ${QUALITY_OPT} "$CATEGORY_DIR/$OUTPUT_FILENAME"
                fi
            fi
        done
    done
done

echo "All site images have been processed!"