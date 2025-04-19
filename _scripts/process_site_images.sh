#!/bin/bash
# process_site_images.sh - Process all non-brand images for the Brandmine site
# This script processes images in categories like people, site, pages, posts, and sectors
# Creating responsive versions at multiple resolutions for optimal web performance

# Define image categories to process
CATEGORIES=("people" "site" "pages" "posts" "sectors")

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

echo "All site images have been processed!"