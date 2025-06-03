#!/bin/bash
# process_images.sh - Unified image processor for Brandmine

# Usage:
#   ./process_images.sh [collection] [slug]
#   ./process_images.sh brands ru-teatime
#   ./process_images.sh founders br-eduardo-santos
#   ./process_images.sh all

COLLECTION=$1
SLUG=$2

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Process function
process_images() {
    local base_dir=$1

    find "$base_dir" -path "*/originals/*" -type f \( -name "*.jpg" -o -name "*.png" \) | while read -r img; do
        dir=$(dirname "$(dirname "$img")")
        filename=$(basename "$img")
        name="${filename%.*}"
        ext="${filename##*.}"

        # Get dimensions
        dimensions=$(identify -format "%w %h" "$img")
        width=$(echo $dimensions | cut -d' ' -f1)
        height=$(echo $dimensions | cut -d' ' -f2)

        # Determine orientation and quality
        if [ $height -gt $width ]; then
            orientation="portrait"
            quality=90
        else
            orientation="landscape"
            quality=85
        fi

        # Process each size
        for size in 400 800 1200; do
            output="$dir/${name}-${size}w.$ext"

            if [ "$orientation" = "portrait" ]; then
                # For portrait, scale by height
                if [ $size -le $height ]; then
                    magick "$img" -resize "x${size}" -quality $quality "$output"
                    echo "Created: $output (portrait)"
                else
                    cp "$img" "$output"
                    echo "Copied: $output (original size)"
                fi
            else
                # For landscape, scale by width
                if [ $size -le $width ]; then
                    magick "$img" -resize "${size}x" -quality $quality "$output"
                    echo "Created: $output (landscape)"
                else
                    cp "$img" "$output"
                    echo "Copied: $output (original size)"
                fi
            fi
        done
    done
}

# Main logic
if [ "$COLLECTION" = "all" ]; then
    echo "Processing all collections..."
    process_images "assets/images"
elif [ -n "$SLUG" ]; then
    echo "Processing $COLLECTION/$SLUG..."
    process_images "assets/images/$COLLECTION/$SLUG"
elif [ -n "$COLLECTION" ]; then
    echo "Processing $COLLECTION collection..."
    process_images "assets/images/$COLLECTION"
else
    echo "Usage: $0 [collection] [slug]"
    echo "       $0 all"
    exit 1
fi

echo "Processing complete!"
