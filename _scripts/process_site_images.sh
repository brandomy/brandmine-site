#!/bin/bash
#
# process_site_images.sh
#
# This script processes all non-brand images for the Brandmine Jekyll site.
# It covers categories like people, site assets, pages, posts, and tags,
# creating responsive versions at multiple resolutions to optimize web performance.
#
# Key Features:
# - Processes multiple non-brand image categories systematically.
# - Detects missing category folders and skips gracefully.
# - Resizes images into 400w, 800w, and 1200w versions.
# - Standardizes naming conventions for easy asset management.
#
# Usage:
#     bash process_site_images.sh
#
# Author: Randal Eastman


# Define image categories to process
CATEGORIES=("site" "pages" "insights" "tags" "sectors" "signals" "markets" "attributes")

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
        echo "  No originals directory found for $CATEGORY, skipping."
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
        
        # Set purpose based on category or filename pattern
        if [ "$CATEGORY" == "people" ]; then
            # People images are typically headshots/profile pictures
            PURPOSE="profile"
            IMAGE="$NAME"
        else
            # For other categories, extract purpose if present in filename (format: purpose-name.jpg)
            if [[ "$NAME" == *-* ]]; then
                PURPOSE=$(echo "$NAME" | cut -d- -f1)
                IMAGE=$(echo "$NAME" | cut -d- -f2-)
            else
                PURPOSE="general"
                IMAGE="$NAME"
            fi
        fi
        
        echo "  Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"
        
        # Create each responsive size
        for SIZE in 400 800 1200; do
            OUTPUT_FILENAME="${CATEGORY}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
            echo "    Creating $OUTPUT_FILENAME..."
            magick "$IMG" -resize "${SIZE}x" -quality 85 "$CATEGORY_DIR/$OUTPUT_FILENAME"
        done
    done
done

echo "All site images have been processed!"#!/bin/bash
#
# process_site_images.sh
#
# This script processes all non-brand images for the Brandmine Jekyll site.
# It covers categories like site assets, pages, posts, and tags,
# creating responsive versions at multiple resolutions to optimize web performance.
#
# Key Features:
# - Processes multiple non-brand image categories systematically.
# - Preserves transparency for PNG files.
# - Handles portrait and landscape images appropriately.
# - Standardizes naming conventions for easy asset management.
#
# Usage:
#     bash process_site_images.sh
#
# Author: Randal Eastman

# Define image categories to process
CATEGORIES=("site" "pages" "insights" "tags" "sectors" "signals" "markets" "attributes")

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
        echo "  No originals directory found for $CATEGORY, skipping."
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
        
        # Set purpose based on category or filename pattern
        if [ "$CATEGORY" == "people" ]; then
            # People images are typically headshots/profile pictures
            PURPOSE="portrait"
            IMAGE="$NAME"
        else
            # For other categories, extract purpose if present in filename (format: purpose-name.jpg)
            if [[ "$NAME" == *-* ]]; then
                PURPOSE=$(echo "$NAME" | cut -d- -f1)
                IMAGE=$(echo "$NAME" | cut -d- -f2-)
            else
                PURPOSE="general"
                IMAGE="$NAME"
            fi
        fi
        
        echo "  Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"
        
        # Check if it's a portrait image
        if [[ "$PURPOSE" == "portrait" ]]; then
            RESIZE_OPT="-resize x${SIZE}"  # Resize by height for portraits
        else
            RESIZE_OPT="-resize ${SIZE}x"  # Resize by width for landscapes
        fi
        
        # Create each responsive size
        for SIZE in 400 800 1200; do
            OUTPUT_FILENAME="${CATEGORY}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
            echo "    Creating $OUTPUT_FILENAME..."
            
            if [[ "$EXT" == "png" ]]; then
                # For PNG, preserve transparency
                magick "$IMG" $RESIZE_OPT "$CATEGORY_DIR/$OUTPUT_FILENAME"
            else
                # For JPG and other formats, optimize with quality setting
                magick "$IMG" $RESIZE_OPT -quality 85 "$CATEGORY_DIR/$OUTPUT_FILENAME"
            fi
        done
    done
done

echo "All site images have been processed!"