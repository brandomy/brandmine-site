#!/bin/bash
#
# process_brand_images.sh
#
# This script resizes and processes brand images for the Brandmine Jekyll site.
# It organizes output images by country, brand, purpose, and size, ensuring optimized
# assets are generated for different responsive breakpoints.
#
# Key Features:
# - Supports selective processing of a single brand or all brands.
# - Preserves transparency for PNG files.
# - Handles portrait and landscape images appropriately.
# - Generates multiple sizes (400w, 800w, 1200w) for responsive usage.
#
# Usage:
#     bash process_brand_images.sh [optional_country_code] [optional_brand_name]
#
# Author: Randal Eastman

# Base directory for all brand images
BASE_DIR="assets/images/brands"

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Process specific country and brand, all brands in a country, or all brands
if [ -n "$1" ] && [ -n "$2" ]; then
    # Process specific country/brand
    COUNTRIES=("$1")
    BRANDS=("$2")
    echo "Processing brand: $2 in country: $1"
elif [ -n "$1" ]; then
    # Process all brands in a specific country
    COUNTRIES=("$1")
    # Get all brand directories in the specified country
    BRANDS=()
    for DIR in "$BASE_DIR/$1"/*/; do
        if [ -d "$DIR" ]; then
            BRAND=$(basename "$DIR")
            BRANDS+=("$BRAND")
        fi
    done
    echo "Processing all brands in country $1: ${BRANDS[*]}"
else
    # Process all countries and all brands
    COUNTRIES=()
    for COUNTRY_DIR in "$BASE_DIR"/*/; do
        if [ -d "$COUNTRY_DIR" ]; then
            COUNTRY=$(basename "$COUNTRY_DIR")
            COUNTRIES+=("$COUNTRY")
        fi
    done
    echo "Processing all brands in all countries: ${COUNTRIES[*]}"
fi

# Process each country
for COUNTRY in "${COUNTRIES[@]}"; do
    COUNTRY_DIR="$BASE_DIR/$COUNTRY"
    
    # Skip if country directory doesn't exist
    if [ ! -d "$COUNTRY_DIR" ]; then
        echo "Country directory $COUNTRY_DIR not found, skipping."
        continue
    fi
    
    # If processing all countries, get brands for this country
    if [ -z "$2" ] && [ -z "$1" ]; then
        BRANDS=()
        for DIR in "$COUNTRY_DIR"/*/; do
            if [ -d "$DIR" ]; then
                BRAND=$(basename "$DIR")
                BRANDS+=("$BRAND")
            fi
        done
    fi
    
    # Process each brand in this country
    for BRAND in "${BRANDS[@]}"; do
        BRAND_DIR="$COUNTRY_DIR/$BRAND"
        ORIGINALS_DIR="$BRAND_DIR/originals"
        
        # Skip if originals directory doesn't exist
        if [ ! -d "$ORIGINALS_DIR" ]; then
            echo "No originals directory found for $COUNTRY/$BRAND, skipping."
            continue
        fi
        
        echo "Processing brand: $COUNTRY/$BRAND"
        
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
            
            # Check if it's a portrait image
            if [[ "$PURPOSE" == "portrait" ]]; then
                RESIZE_OPT="-resize x${SIZE}"  # Resize by height for portraits
            else
                RESIZE_OPT="-resize ${SIZE}x"  # Resize by width for landscapes
            fi
            
            # Create each size
            for SIZE in 400 800 1200; do
                OUTPUT_FILENAME="${BRAND}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
                echo "    Creating $OUTPUT_FILENAME..."
                
                if [[ "$EXT" == "png" ]]; then
                    # For PNG, preserve transparency
                    magick "$IMG" $RESIZE_OPT "$BRAND_DIR/$OUTPUT_FILENAME"
                else
                    # For JPG and other formats, optimize with quality setting
                    magick "$IMG" $RESIZE_OPT -quality 85 "$BRAND_DIR/$OUTPUT_FILENAME"
                fi
            done
        done
    done
done

echo "All images have been processed!"