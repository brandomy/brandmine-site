#!/bin/bash
# Simplified image processing script

# Process brand images
echo "Processing brand images..."
./_scripts/resize_images.sh

# Define additional image categories
CATEGORIES=("site" "pages" "posts" "people" "sectors")

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
    }
    
    # Process each original image
    for IMG in "$ORIGINALS_DIR"/*.{jpg,jpeg,png}; do
        # Skip if no files match the pattern
        [ -e "$IMG" ] || continue
        
        # Extract the filename without extension
        FILENAME=$(basename "$IMG")
        NAME="${FILENAME%.*}"
        EXT="${FILENAME##*.}"
        
        # For people images, assume purpose is "profile"
        # You can add more specific logic here later if needed
        if [ "$CATEGORY" == "people" ]; then
            PURPOSE="profile"
            IMAGE="$NAME"
        else
            # Extract purpose if present in filename
            if [[ "$NAME" == *-* ]]; then
                PURPOSE=$(echo "$NAME" | cut -d- -f1)
                IMAGE=$(echo "$NAME" | cut -d- -f2-)
            else
                PURPOSE="general"
                IMAGE="$NAME"
            fi
        fi
        
        echo "  Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"
        
        # Create each size
        for SIZE in 400 800 1200; do
            OUTPUT_FILENAME="${CATEGORY}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
            echo "    Creating $OUTPUT_FILENAME..."
            magick convert "$IMG" -resize "${SIZE}x" -quality 85 "$CATEGORY_DIR/$OUTPUT_FILENAME"
        done
    done
done

echo "All image categories have been processed!"