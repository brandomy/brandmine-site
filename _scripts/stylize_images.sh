#!/bin/bash
#
# stylize_images.sh
#
# This script applies Brandmine's visual styling to images using ImageMagick, transforming
# regular photos into Brandmine's two distinct visual styles:
# 1. Textured Minimalism (standard) - For hero images
# 2. Muted Pastel Textured Minimalism - For interior content and founder portraits
#
# Key Features:
# - Applies paper texture overlays to create a consistent visual style
# - Adds subtle shadows and depth
# - Adjusts colors to match Brandmine's aesthetic
# - Provides two distinct style options: standard and muted pastel
#
# Usage:
#     bash stylize_images.sh [input_file] [output_file] [style]
#     - style: "standard" or "muted" (default: standard)
#
# Examples:
#     bash stylize_images.sh input.jpg output.jpg standard
#     bash stylize_images.sh input.jpg output.jpg muted
#
# Requirements:
#     - ImageMagick must be installed
#     - Texture files must exist in assets/images/textures/
#
# Author: Randal Eastman

# Check for required arguments
if [ $# -lt 2 ]; then
    echo "Usage: bash stylize_images.sh [input_file] [output_file] [style]"
    echo "  style: standard or muted (default: standard)"
    exit 1
fi

# Assign arguments to variables
INPUT_FILE="$1"
OUTPUT_FILE="$2"
STYLE="${3:-standard}"  # Default to standard if not specified

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Define texture directory
TEXTURE_DIR="assets/images/textures"

# Check if texture directory exists
if [ ! -d "$TEXTURE_DIR" ]; then
    echo "Creating texture directory..."
    mkdir -p "$TEXTURE_DIR"
fi

# Define texture files
PAPER_TEXTURE="$TEXTURE_DIR/paper_texture.jpg"
SHADOW_OVERLAY="$TEXTURE_DIR/subtle_shadow.png"

# Check if texture files exist, download if not
if [ ! -f "$PAPER_TEXTURE" ]; then
    echo "Paper texture not found. Please place a suitable texture at $PAPER_TEXTURE"
    echo "You can find suitable textures at sites like Unsplash or create your own."
    exit 1
fi

if [ ! -f "$SHADOW_OVERLAY" ]; then
    echo "Shadow overlay not found. Please place a suitable overlay at $SHADOW_OVERLAY"
    echo "You can create this as a transparent PNG with subtle shadow areas."
    exit 1
fi

# Get image dimensions
DIMENSIONS=$(identify -format "%w %h" "$INPUT_FILE")
WIDTH=$(echo $DIMENSIONS | cut -d' ' -f1)
HEIGHT=$(echo $DIMENSIONS | cut -d' ' -f2)

echo "Processing image: $INPUT_FILE"
echo "Output will be saved as: $OUTPUT_FILE"
echo "Applying '$STYLE' style..."

# Apply appropriate styling based on style parameter
if [ "$STYLE" = "standard" ]; then
    # Standard Textured Minimalism (for hero images)
    # 1. Increase contrast and saturation slightly
    # 2. Apply paper texture overlay at low opacity
    # 3. Add subtle shadow overlay
    # 4. Enhance edges for clean lines
    
    magick "$INPUT_FILE" \
        -modulate 100,115,100 \  # Increase saturation by 15%
        -contrast \
        \( "$PAPER_TEXTURE" -resize ${WIDTH}x${HEIGHT}! \) \
        -compose overlay -define compose:args=20 -composite \
        \( "$SHADOW_OVERLAY" -resize ${WIDTH}x${HEIGHT}! \) \
        -compose multiply -define compose:args=30 -composite \
        -unsharp 0x0.5+0.5+0.008 \
        "$OUTPUT_FILE"
        
    echo "Applied standard Textured Minimalism style"
    
elif [ "$STYLE" = "muted" ]; then
    # Muted Pastel Textured Minimalism (for founder/interior content)
    # 1. Reduce saturation and lighten the image
    # 2. Apply paper texture at higher opacity for more texture
    # 3. Add very subtle shadow
    # 4. Apply subtle pastel toning
    
    magick "$INPUT_FILE" \
        -modulate 105,85,100 \  # Lighten by 5%, reduce saturation by 15%
        \( "$PAPER_TEXTURE" -resize ${WIDTH}x${HEIGHT}! \) \
        -compose overlay -define compose:args=35 -composite \
        \( "$SHADOW_OVERLAY" -resize ${WIDTH}x${HEIGHT}! \) \
        -compose multiply -define compose:args=15 -composite \
        -unsharp 0x0.3+0.3+0.005 \
        -fill "#f7efe3" -colorize 10 \  # Add subtle warm pastel toning
        "$OUTPUT_FILE"
        
    echo "Applied muted Pastel Textured Minimalism style"
    
else
    echo "Unknown style: $STYLE"
    echo "Available styles: standard, muted"
    exit 1
fi

echo "Stylization complete!"
echo "Output saved to: $OUTPUT_FILE"