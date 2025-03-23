#!/bin/bash
# Process all image categories
# Place in scripts/process_all_images.sh

# Process brand images
echo "Processing brand images..."
./scripts/resize_images.sh

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
    
    # Process each subcategory
    for SUBCAT_DIR in "$CATEGORY_DIR"/*/; do
        SUBCAT=$(basename "$SUBCAT_DIR")
        ORIGINALS_DIR="$SUBCAT_DIR/originals"
        
        # Skip if originals directory doesn't exist
        if [ ! -d "$ORIGINALS_DIR" ]; then
            continue
        fi
        
        echo "  Processing subcategory: $SUBCAT"
        
        # Process each original image
        for IMG in "$ORIGINALS_DIR"/*.{jpg,jpeg,png}; do
            # Skip if no files match the pattern
            [ -e "$IMG" ] || continue
            
            # Extract the filename without extension
            FILENAME=$(basename "$IMG")
            NAME="${FILENAME%.*}"
            EXT="${FILENAME##*.}"
            
            # Extract purpose if present in filename
            if [[ "$NAME" == *-* ]]; then
                PURPOSE=$(echo "$NAME" | cut -d- -f1)
                IMAGE=$(echo "$NAME" | cut -d- -f2-)
            else
                PURPOSE="general"
                IMAGE="$NAME"
            fi
            
            echo "    Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"
            
            # Create each size
            for SIZE in 400 800 1200; do
                OUTPUT_FILENAME="${CATEGORY}-${SUBCAT}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
                echo "      Creating $OUTPUT_FILENAME..."
                convert "$IMG" -resize "${SIZE}x" -quality 85 "$SUBCAT_DIR/$OUTPUT_FILENAME"
            done
        done
    done
done

echo "All image categories have been processed!"