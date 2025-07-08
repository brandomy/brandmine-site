#!/bin/bash
# =============================================================================
# process_images.sh - Unified Image Processor for Brandmine
# =============================================================================
#
# PURPOSE:
#   Automatically generates responsive images (400w, 800w, 1200w) from originals
#   with collection identifier prefix for organized asset management
#
# HOW IT WORKS:
#   1. Finds original images in "originals" subdirectories
#   2. Extracts collection slug from directory path structure
#   3. Generates 3 responsive sizes with optimized quality settings
#   4. Adds collection prefix to prevent filename conflicts
#
# DIRECTORY STRUCTURE EXPECTED:
#   assets/images/[collection]/[slug]/originals/[image-file]
#
#   Examples:
#   - assets/images/brands/ru-teatime/originals/hero-storefront.jpg
#   - assets/images/dimensions/sectors/originals/hero-vineyard.jpg
#   - assets/images/founders/br-eduardo/originals/portrait-formal.jpg
#
# OUTPUT FORMAT:
#   Generated files: [slug]-[original-name]-[size]w.[ext]
#
#   Examples:
#   - ru-teatime-hero-storefront-400w.jpg
#   - sectors-hero-vineyard-800w.jpg
#   - br-eduardo-portrait-formal-1200w.jpg
#
# QUALITY OPTIMIZATION:
#   - Portrait images (height > width): 90% quality (better for faces)
#   - Landscape images (width >= height): 85% quality (smaller file sizes)
#
# =============================================================================

# Command line arguments
COLLECTION=$1  # Collection name (brands, founders, insights, dimensions, etc.)
SLUG=$2        # Specific slug/identifier within collection (optional)

# =============================================================================
# DEPENDENCY CHECK
# =============================================================================
# Verify ImageMagick is installed (required for image processing)
if ! command -v magick &> /dev/null; then
    echo "❌ ERROR: ImageMagick not found."
    echo ""
    echo "Please install ImageMagick first:"
    echo "  macOS: brew install imagemagick"
    echo "  Ubuntu: sudo apt install imagemagick"
    echo "  Windows: Download from https://imagemagick.org/"
    exit 1
fi

# =============================================================================
# CORE PROCESSING FUNCTION
# =============================================================================
# Processes all images found in originals subdirectories within base_dir
process_images() {
    local base_dir=$1
    local processed_count=0

    echo "🔍 Scanning for images in: $base_dir"
    echo ""

    # Find all JPG and PNG files in "originals" subdirectories
    find "$base_dir" -path "*/originals/*" -type f \( -name "*.jpg" -o -name "*.png" \) | while read -r img; do
        # Extract directory structure information
        dir=$(dirname "$(dirname "$img")")  # Parent of originals directory
        filename=$(basename "$img")          # Just the filename
        name="${filename%.*}"               # Filename without extension
        ext="${filename##*.}"               # Just the extension

        # Extract collection slug from directory path
        # For path like: assets/images/brands/ru-teatime/originals/hero.jpg
        # This extracts: ru-teatime
        collection_slug=$(basename "$dir")

        echo "📷 Processing: $filename for collection '$collection_slug'"

        # Get original image dimensions using ImageMagick
        dimensions=$(identify -format "%w %h" "$img")
        width=$(echo $dimensions | cut -d' ' -f1)
        height=$(echo $dimensions | cut -d' ' -f2)

        # Determine image orientation and set appropriate quality
        if [ $height -gt $width ]; then
            orientation="portrait"
            quality=90  # Higher quality for portraits (faces, people)
            echo "   📐 Orientation: Portrait (${width}x${height}) - Quality: ${quality}%"
        else
            orientation="landscape"
            quality=85  # Standard quality for landscapes (smaller files)
            echo "   📐 Orientation: Landscape (${width}x${height}) - Quality: ${quality}%"
        fi

        # Generate responsive images for each target size
        for size in 400 800 1200; do
            # Build output filename with collection prefix
            # Format: [collection-slug]-[original-name]-[size]w.[extension]
            output="$dir/${collection_slug}-${name}-${size}w.$ext"

            if [ "$orientation" = "portrait" ]; then
                # For portrait images, scale by height to maintain aspect ratio
                if [ $size -le $height ]; then
                    # Only resize if target size is smaller than original
                    magick "$img" -resize "x${size}" -quality $quality "$output"
                    echo "   ✅ Created: $(basename "$output") (resized by height)"
                else
                    # Copy original if target size is larger
                    cp "$img" "$output"
                    echo "   📋 Copied: $(basename "$output") (kept original size)"
                fi
            else
                # For landscape images, scale by width to maintain aspect ratio
                if [ $size -le $width ]; then
                    # Only resize if target size is smaller than original
                    magick "$img" -resize "${size}x" -quality $quality "$output"
                    echo "   ✅ Created: $(basename "$output") (resized by width)"
                else
                    # Copy original if target size is larger
                    cp "$img" "$output"
                    echo "   📋 Copied: $(basename "$output") (kept original size)"
                fi
            fi
        done
        echo ""
        processed_count=$((processed_count + 1))
    done
}

# =============================================================================
# SPECIFIC COLLECTION/SLUG PROCESSOR
# =============================================================================
# Processes images for a specific collection and slug combination
process_specific() {
    local collection=$1
    local slug=$2
    local target_dir="assets/images/$collection/$slug"

    echo "🎯 Processing specific target: $collection/$slug"
    echo ""

    # Verify target directory exists
    if [ ! -d "$target_dir" ]; then
        echo "❌ ERROR: Directory not found: $target_dir"
        echo ""
        echo "Please check that the collection and slug are correct."
        echo "Expected structure: assets/images/[collection]/[slug]/originals/"
        exit 1
    fi

    # Check if originals directory exists
    if [ ! -d "$target_dir/originals" ]; then
        echo "⚠️  WARNING: No 'originals' directory found in $target_dir"
        echo ""
        echo "Please create: $target_dir/originals/"
        echo "And place your source images there."
        exit 1
    fi

    echo "📁 Target directory: $target_dir"
    process_images "$target_dir"
}

# =============================================================================
# MAIN EXECUTION LOGIC
# =============================================================================

echo "🚀 Brandmine Image Processor"
echo "=================================="
echo ""

# Process based on command line arguments
case "$COLLECTION" in
    "all")
        echo "🌐 Processing ALL collections..."
        echo ""
        process_images "assets/images"
        ;;

    # Supported collections
    "brands"|"founders"|"insights"|"case-studies"|"journal"|"pages"|"people"|"dimensions")
        if [ -n "$SLUG" ]; then
            # Process specific collection/slug combination
            process_specific "$COLLECTION" "$SLUG"
        else
            # Process entire collection
            echo "📚 Processing entire '$COLLECTION' collection..."
            echo ""

            # Verify collection directory exists
            if [ ! -d "assets/images/$COLLECTION" ]; then
                echo "❌ ERROR: Collection directory not found: assets/images/$COLLECTION"
                exit 1
            fi

            process_images "assets/images/$COLLECTION"
        fi
        ;;

    # Invalid or missing arguments
    *)
        echo "📖 USAGE INSTRUCTIONS"
        echo "====================="
        echo ""
        echo "Syntax:"
        echo "  $0 [collection] [slug]     # Process specific item"
        echo "  $0 [collection]            # Process entire collection"
        echo "  $0 all                     # Process everything"
        echo ""
        echo "📁 Supported Collections:"
        echo "  brands, founders, insights, case-studies, journal, pages, people, dimensions"
        echo ""
        echo "💡 Examples:"
        echo "  $0 brands ru-teatime                    # Process specific brand"
        echo "  $0 founders br-eduardo-santos           # Process specific founder"
        echo "  $0 insights ru-russian-wine-renaissance # Process specific insight"
        echo "  $0 dimensions sectors                   # Process dimensions sectors"
        echo "  $0 brands                               # Process all brands"
        echo "  $0 dimensions                           # Process all dimensions"
        echo "  $0 all                                  # Process everything"
        echo ""
        echo "📋 Requirements:"
        echo "  • ImageMagick must be installed"
        echo "  • Images must be in 'originals' subdirectories"
        echo "  • Supported formats: JPG, PNG"
        echo ""
        echo "📤 Output:"
        echo "  • Generates 3 sizes: 400w, 800w, 1200w"
        echo "  • Format: [slug]-[original-name]-[size]w.[ext]"
        echo "  • Example: ru-teatime-hero-storefront-400w.jpg"
        exit 1
        ;;
esac

# =============================================================================
# COMPLETION SUMMARY
# =============================================================================

echo ""
echo "🎉 Processing Complete!"
echo "======================="
echo ""
echo "📋 Generated File Format:"
echo "   [collection-slug]-[original-name]-[size]w.[extension]"
echo ""
echo "💡 Generated Files Include:"
echo "   • 400w version (mobile-optimized)"
echo "   • 800w version (tablet-optimized)"
echo "   • 1200w version (desktop-optimized)"
echo ""
echo "📍 Files Location:"
echo "   Same directory as originals (parent of 'originals' folder)"
echo ""
echo "🔧 Next Steps:"
echo "   • Verify images display correctly on your site"
echo "   • Consider running validation: _scripts/core/pre-commit_check.sh"
echo "   • Commit changes to git when satisfied"
