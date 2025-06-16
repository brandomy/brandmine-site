#!/bin/bash
# process_images.sh - Unified image processor for Brandmine
# Generates responsive images with collection identifier prefix

# Usage:
#   ./process_images.sh [collection] [slug]
#   ./process_images.sh brands ru-teatime
#   ./process_images.sh founders br-eduardo-santos
#   ./process_images.sh case-studies perfect-diary
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

        # Extract collection slug from directory path
        # Path structure: assets/images/collection/slug/originals/file
        collection_slug=$(basename "$dir")

        echo "Processing: $filename for $collection_slug"

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

        # Process each size with collection prefix
        for size in 400 800 1200; do
            # Add collection slug prefix to generated files
            output="$dir/${collection_slug}-${name}-${size}w.$ext"

            if [ "$orientation" = "portrait" ]; then
                # For portrait, scale by height
                if [ $size -le $height ]; then
                    magick "$img" -resize "x${size}" -quality $quality "$output"
                    echo "Created: $(basename "$output") (portrait)"
                else
                    cp "$img" "$output"
                    echo "Copied: $(basename "$output") (original size)"
                fi
            else
                # For landscape, scale by width
                if [ $size -le $width ]; then
                    magick "$img" -resize "${size}x" -quality $quality "$output"
                    echo "Created: $(basename "$output") (landscape)"
                else
                    cp "$img" "$output"
                    echo "Copied: $(basename "$output") (original size)"
                fi
            fi
        done
        echo ""
    done
}

# Process specific collection/slug function
process_specific() {
    local collection=$1
    local slug=$2
    local target_dir="assets/images/$collection/$slug"

    if [ ! -d "$target_dir" ]; then
        echo "Directory not found: $target_dir"
        exit 1
    fi

    echo "Processing $collection/$slug..."
    process_images "$target_dir"
}

# Main logic
case "$COLLECTION" in
    "all")
        echo "Processing all collections..."
        process_images "assets/images"
        ;;
    "brands"|"founders"|"insights"|"case-studies"|"journal")
        if [ -n "$SLUG" ]; then
            process_specific "$COLLECTION" "$SLUG"
        else
            echo "Processing entire $COLLECTION collection..."
            process_images "assets/images/$COLLECTION"
        fi
        ;;
    *)
        echo "Usage: $0 [collection] [slug]"
        echo "       $0 all"
        echo ""
        echo "Collections: brands, founders, insights, case-studies, journal"
        echo "Examples:"
        echo "  $0 brands ru-teatime"
        echo "  $0 founders br-eduardo-santos"
        echo "  $0 insights ru-russian-wine-renaissance"
        echo "  $0 case-studies perfect-diary"
        echo "  $0 journal china-brand-storytelling"
        echo "  $0 brands (process entire brands collection)"
        echo "  $0 all (process everything)"
        exit 1
        ;;
esac

echo "Processing complete!"
echo ""
echo "Generated files will have format: [slug]-[original-name]-[size]w.[ext]"
echo "Examples:"
echo "  ru-teatime-hero-storefront-400w.jpg"
echo "  perfect-diary-hero-cosmetics-400w.jpg"
echo "  china-brand-storytelling-hero-400w.jpg"
