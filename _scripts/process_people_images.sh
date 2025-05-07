#!/bin/bash
#
# process_people_images.sh
#
# This script processes people/team member images for the Brandmine Jekyll site.
# It generates responsive versions of all people images with appropriate
# sizing for portraits and team photos.
#
# Key Features:
# - Optimized for portrait-orientation photos
# - Higher quality preservation for faces
# - Generates multiple sizes (400w, 800w, 1200w) for responsive usage
# - Validates aspect ratios for consistency
#
# Usage:
#     bash process_people_images.sh
#
# Author: Randal Eastman

# Base directory for people images
BASE_DIR="assets/images/people"
ORIGINALS_DIR="$BASE_DIR/originals"

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Skip if originals directory doesn't exist
if [ ! -d "$ORIGINALS_DIR" ]; then
    echo "  No originals directory found for people images, skipping."
    exit 1
fi

echo "Processing people images..."

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
    
    # Improved portrait detection to match brand images script
    # Check if it's a portrait orientation (through purpose, image name, or both)
    if [[ "$PURPOSE" == "portrait" || "$PURPOSE" == "team" || "$IMAGE" == "portrait" ]]; then
        # Check aspect ratio for portrait images (should be 2:3)
        EXPECTED_RATIO=0.67  # 2:3 ratio
        TOLERANCE=0.1
        DIFF=$(bc -l <<< "($RATIO - $EXPECTED_RATIO)^2 < $TOLERANCE^2")
        
        if [[ "$DIFF" != "1" ]]; then
            echo "    WARNING: $FILENAME has unusual proportions for a portrait image."
            echo "    Expected aspect ratio around 2:3 (0.67), actual: $RATIO"
            echo "    For best results, portraits should be 800×1200px."
        fi
    else
        # For non-portrait images, check if they're using the expected ratio anyway
        if [[ $(bc -l <<< "$RATIO < 1") == "1" ]]; then
            echo "    WARNING: $FILENAME appears to be portrait-oriented but doesn't use portrait naming."
            echo "    Consider renaming with 'portrait-' or 'team-' prefix for better handling."
        fi
    fi
    
    # Create each size - resize by height for portraits (which should be all people images)
    for SIZE in 400 800 1200; do
        OUTPUT_FILENAME="people-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
        echo "    Creating $OUTPUT_FILENAME..."
        
        if [[ "$EXT" == "png" ]]; then
            # For PNG, preserve transparency
            magick "$IMG" -resize "x$SIZE" "$BASE_DIR/$OUTPUT_FILENAME"
        else
            # For JPG and other formats, optimize with higher quality for faces
            magick "$IMG" -resize "x$SIZE" -quality 90 "$BASE_DIR/$OUTPUT_FILENAME"
        fi
    done
done

echo "All people images have been processed!"