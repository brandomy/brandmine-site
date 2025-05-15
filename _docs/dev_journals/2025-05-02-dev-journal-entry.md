# Development Journal: Team Photo Standardization
**Date:** 2025-05-02  
**Topic:** Standardizing team/testimonial photography with brand filter

## 1. Problem Statement

We needed to establish a clear approach for team and testimonial photography that differentiates it from our brand imagery while maintaining visual consistency with our overall design system. Specifically, we needed to:

- Determine whether to use natural photography or stylized illustrations for team members and testimonials
- Create a consistent visual approach that feels professional but distinctly "Brandmine"
- Document the approach in both our Image Style Guide and README.md
- Implement a practical solution for applying consistent styling to multiple photos

## 2. Approach

We decided to use natural photography for team and testimonial images (rather than the stylized illustrations used for brand content) but with a subtle brand filter to create visual cohesion with our design system. Our approach:

1. Document this as a fourth visual style in our Image Style Guide: "Natural Photography with Brand Filter"
2. Update the README.md to include this approach in the special cases section
3. Create a batch processing script using ImageMagick to apply a consistent teal brand filter
4. Test the filter to find the right balance between brand identity and natural appearance
5. Apply to all team and testimonial photos to ensure consistency

## 3. Implementation Details

### Style Definition in Image Style Guide

Added a fourth visual style to our framework:
```markdown
## 4. Natural Photography with Brand Filter

Used exclusively for team members and testimonial providers, creating a professional and authentic impression while maintaining brand consistency.

### Characteristics
- Professional, high-quality photography
- Clean, neutral backgrounds with consistent lighting
- Subtle brand-colored filter overlay (10-15% opacity teal)
- Consistent framing and composition
- Professional but approachable aesthetic
```

### Batch Processing Script

Created an ImageMagick script to apply the filter consistently:
```bash
#!/bin/bash
# apply_teal_filter.sh - Apply a subtle Brandmine teal filter to portrait photos

# Default directories
INPUT_DIR="${1:-./originals}"
OUTPUT_DIR="${2:-./processed}"

# Check if output directory exists, create if not
if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
  echo "Created output directory: $OUTPUT_DIR"
fi

# Count files for progress tracking
total_files=$(find "$INPUT_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | wc -l)
processed=0

# Process each image file
find "$INPUT_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | while read file; do
  # Get just the filename
  filename=$(basename "$file")
  
  # Create output path
  output_path="$OUTPUT_DIR/$filename"
  
  # Apply the teal filter
  magick "$file" \
    -fill "#38B2AC" -colorize 12% \
    -modulate 100,100,97 \
    "$output_path"
  
  # Update progress counter
  processed=$((processed + 1))
  echo "[$processed/$total_files] Applied teal filter to: $filename"
done

echo "Complete! All $processed images processed with Brandmine teal filter."
```

The script applies:
1. A teal (#38B2AC) color filter at 12% opacity
2. A slight cooling of white balance (modulate 100,100,97) for a more cohesive look

## 4. Decisions Made

| Decision | Rationale |
|----------|-----------|
| Use natural photography for team/testimonials | Creates authenticity and trust that stylized illustrations would not provide |
| Apply subtle brand filter (12% teal) | Creates visual connection to Brandmine brand without overpowering the natural photo |
| Add slight cooling to white balance | Reinforces the teal brand direction while looking natural |
| Document as a fourth distinct visual style | Helps maintain separation between brand imagery and people imagery |
| Create batch processing script | Ensures consistency across all team photos regardless of source |
| Store script in `_scripts/` | Follows our pattern of storing automation scripts in a dedicated directory |

## 5. Resources

1. **Documentation Updates**:
   - Added "Natural Photography with Brand Filter" section to the Image Style Guide
   - Added "Special Case: Team & Testimonial Photography" section to the README.md
   - Added batch processing script to both documents

2. **Script Created**:
   - `_scripts/apply_teal_filter.sh` - For batch processing team photos

3. **Visual Style Defined**:
   - Teal (#38B2AC) at 12% opacity
   - Cooling adjustment (modulate 100,100,97)
   - 2:3 portrait orientation (800×1200px)

## 6. Insights & Learning

1. **Visual Style Balance**: Creating a brand-consistent look for team photography requires a delicate balance - too much filtering looks artificial, too little loses the brand connection. The 12% opacity with slight cooling strikes this balance well.

2. **Script-Based Consistency**: Using a script rather than manual photo editing ensures perfect consistency across all team photos, regardless of lighting conditions in the original photos.

3. **Fourth Style Necessity**: Originally we had three visual styles (Textured Minimalism, Flat Color Minimalism, Geometric Minimalism), but realized human-centered content needed its own distinct approach - hence the fourth style.

4. **Dual Documentation Approach**: Having both a technical README.md and a design-focused Image Style Guide ensures both developers and designers have clear guidance appropriate to their needs.

5. **ImageMagick Syntax Evolution**: We discovered that newer versions of ImageMagick use `magick` without `convert`, requiring us to update our script syntax accordingly.

## 7. Next Actions

1. **Process Existing Photos**:
   - Apply the teal filter to all existing team and testimonial photos
   - Ensure all photos are stored in the correct directory structure

2. **Update Photo Guidelines**:
   - Share the new guidelines with the team for future photo submissions
   - Create a visual reference showing the before/after effect of the filter

3. **Integrate with Build Process**:
   - Consider integrating the filter script into the site build process
   - Add a check to verify all team photos have been processed

4. **Add Filter Example**:
   - Create a visual example showing before/after for the Image Style Guide
   - Add to design system documentation

5. **Test Browsers**:
   - Verify the filter looks consistent across different browsers/devices
   - Check that the subtle teal effect is visible on various displays
