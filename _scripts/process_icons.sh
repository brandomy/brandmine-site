#!/bin/bash
#
# process_icons.sh
#
# This script processes taxonomy icons for the Brandmine Jekyll site
# following the taxonomy-icon-implementation.md structure.
#
# Key Features:
# - Processes dimension icons (sectors, attributes, signals, markets)
# - Processes insights category icons
# - Maintains the taxonomy directory structure
# - Generates multiple sizes (24px, 48px, 128px)
# - Optimizes icons with high quality preservation
#
# Usage:
#     bash process_icons.sh [optional_system]
#     Examples:
#     - For all icons: bash process_icons.sh
#     - For dimension icons only: bash process_icons.sh dimensions
#     - For insights icons only: bash process_icons.sh insights
#
# Author: Randal Eastman

# Base directory for icons
BASE_DIR="assets/images/icons"

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Determine which icon systems to process
if [ -n "$1" ]; then
    # Process specific system
    SYSTEMS=("$1")
    echo "Processing icon system: $1"
else
    # Process all systems
    SYSTEMS=("dimensions" "insights")
    echo "Processing all icon systems"
fi

# Process each icon system
for SYSTEM in "${SYSTEMS[@]}"; do
    echo "Processing $SYSTEM icons..."
    
    if [ "$SYSTEM" == "dimensions" ]; then
        # Process dimension icons
        DIMENSION_TYPES=("sectors" "attributes" "signals" "markets")
        
        for TYPE in "${DIMENSION_TYPES[@]}"; do
            # Set source directory
            SOURCE_DIR="$BASE_DIR/$SYSTEM/$TYPE"
            
            # Skip if source directory doesn't exist
            if [ ! -d "$SOURCE_DIR" ]; then
                echo "  Directory $SOURCE_DIR not found, skipping."
                continue
            fi
            
            echo "  Processing $TYPE dimension icons..."
            
            # Create output size directories if they don't exist
            mkdir -p "$SOURCE_DIR/24"
            mkdir -p "$SOURCE_DIR/48"
            mkdir -p "$SOURCE_DIR/128"
            
            # Process each icon in this dimension type
            for ICON in "$SOURCE_DIR"/*.png; do
                # Skip if no files match the pattern
                [ -e "$ICON" ] || continue
                
                # Extract the filename without extension
                FILENAME=$(basename "$ICON")
                NAME="${FILENAME%.*}"
                
                echo "    Processing icon: $FILENAME"
                
                # Get image dimensions and check proportions
                DIMENSIONS=$(identify -format "%w %h" "$ICON")
                WIDTH=$(echo $DIMENSIONS | cut -d' ' -f1)
                HEIGHT=$(echo $DIMENSIONS | cut -d' ' -f2)
                RATIO=$(bc -l <<< "$WIDTH/$HEIGHT")
                
                # Check if it's a square image (expect 1:1 ratio for icons)
                EXPECTED_RATIO=1.0  # 1:1 ratio
                TOLERANCE=0.05
                DIFF=$(bc -l <<< "($RATIO - $EXPECTED_RATIO)^2 < $TOLERANCE^2")
                
                if [[ "$DIFF" != "1" ]]; then
                    echo "      WARNING: $FILENAME has unusual proportions for an icon."
                    echo "      Expected aspect ratio 1:1 (1.0), actual: $RATIO"
                    echo "      Icons should be square for best results."
                fi
                
                # Create each standard icon size
                for SIZE in 24 48 128; do
                    # Output with size-specific directory
                    OUTPUT_FILENAME="$SOURCE_DIR/$SIZE/$NAME.png"
                    echo "      Creating $SIZE×$SIZE icon: $NAME.png"
                    
                    # Use high quality resizing to maintain sharpness
                    magick "$ICON" -resize ${SIZE}x${SIZE} -quality 100 "$OUTPUT_FILENAME"
                done
            done
        done
    elif [ "$SYSTEM" == "insights" ]; then
        # Process insights category icons
        SOURCE_DIR="$BASE_DIR/$SYSTEM"
        
        # Skip if source directory doesn't exist
        if [ ! -d "$SOURCE_DIR" ]; then
            echo "  Directory $SOURCE_DIR not found, skipping."
            continue
        }
        
        echo "  Processing insights category icons..."
        
        # Create output size directories if they don't exist
        mkdir -p "$SOURCE_DIR/24"
        mkdir -p "$SOURCE_DIR/48"
        mkdir -p "$SOURCE_DIR/128"
        
        # Process each insights category icon
        for ICON in "$SOURCE_DIR"/*.png; do
            # Skip if no files match the pattern
            [ -e "$ICON" ] || continue
            
            # Extract the filename without extension
            FILENAME=$(basename "$ICON")
            NAME="${FILENAME%.*}"
            
            echo "    Processing icon: $FILENAME"
            
            # Get image dimensions and check proportions
            DIMENSIONS=$(identify -format "%w %h" "$ICON")
            WIDTH=$(echo $DIMENSIONS | cut -d' ' -f1)
            HEIGHT=$(echo $DIMENSIONS | cut -d' ' -f2)
            RATIO=$(bc -l <<< "$WIDTH/$HEIGHT")
            
            # Check if it's a square image (expect 1:1 ratio for icons)
            EXPECTED_RATIO=1.0  # 1:1 ratio
            TOLERANCE=0.05
            DIFF=$(bc -l <<< "($RATIO - $EXPECTED_RATIO)^2 < $TOLERANCE^2")
            
            if [[ "$DIFF" != "1" ]]; then
                echo "      WARNING: $FILENAME has unusual proportions for an icon."
                echo "      Expected aspect ratio 1:1 (1.0), actual: $RATIO"
                echo "      Icons should be square for best results."
            fi
            
            # Create each standard icon size
            for SIZE in 24 48 128; do
                # Output with size-specific directory
                OUTPUT_FILENAME="$SOURCE_DIR/$SIZE/$NAME.png"
                echo "      Creating $SIZE×$SIZE icon: $NAME.png"
                
                # Use high quality resizing to maintain sharpness
                magick "$ICON" -resize ${SIZE}x${SIZE} -quality 100 "$OUTPUT_FILENAME"
            done
        done
    fi
done

echo "All icon processing complete!"