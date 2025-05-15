# Brandmine Images

*Last updated: May 2, 2025*

This directory contains all image assets used across the Brandmine platform. This README explains the organization system, naming conventions, and image processing workflow.

## Directory Structure

```
assets/images/
├── brands/                     # Brand-specific imagery
│   └── [country-code]/         # Organized by country code (e.g., ru, in, cn)
│       └── [brand-name]/       # Each brand has its own directory
│           ├── originals/      # Original high-resolution files 
│           └── [responsive images]  # Generated responsive images
├── sectors/                    # Sector dimension images
├── markets/                    # Market dimension images
├── attributes/                 # Attribute dimension images
├── signals/                    # Signal dimension images
├── people/                     # Non-brand team members and staff
├── insights/                   # Insight article images
└── site/                       # Site-wide UI elements
    ├── ui/                     # UI components
    ├── icons/                  # Icon sets
    └── layout/                 # Layout elements
```

## Naming Conventions

All original images follow the purpose-first naming pattern:

```
purpose-descriptive-name.extension
```

### Standard Purpose Identifiers

| Purpose | Usage | Examples |
|---------|-------|----------|
| `logo` | Brand logos | `logo-color.png`, `logo-dark.png` |
| `hero` | Main banner images | `hero-storefront.jpg`, `hero-overview.jpg` |
| `founder` | Founder portraits | `founder-portrait.jpg`, `founder-informal.jpg` |
| `team` | Group or staff photos | `team-leadership.jpg`, `team-production.jpg` |
| `gallery` | Image collections | `gallery-product.jpg`, `gallery-interior.jpg` |
| `product` | Product imagery | `product-teapot.jpg`, `product-lineup.jpg` |
| `location` | Place imagery | `location-vineyard.jpg`, `location-factory.jpg` |
| `certificate` | Certifications | `certificate-organic.jpg` |
| `testimonial` | Customer/partner testimonials | `testimonial-georgie-yam.jpg` |

### Processed Images

Processed images are automatically generated with this naming pattern:

```
[country-code]-[brand-name]-[purpose]-[descriptive-name]-[width]w.extension
```

Example:
```
ru-teatime-hero-storefront-800w.jpg
```

## Standard Dimensions

| Image Type | Aspect Ratio | Recommended Size | Generated Sizes |
|------------|--------------|------------------|-----------------|
| Hero Images | 3:2 | 1200×800px | 400w, 800w, 1200w |
| Gallery Images | 3:2 | 1200×800px | 400w, 800w, 1200w |
| Founder/People Portraits | 2:3 | 800×1200px | 400w, 800w, 1200w |
| Logos | - | 400px width | 200w, 400w |
| Thumbnails | 1:1 | 400×400px | 200w, 400w |
| Icons | - | 512×512px | Scaled as needed |

## Visual Style Framework

Brandmine employs three distinct visual styles to create meaningful differentiation across content types:

1. **Textured Minimalism**: Primary style for brand narrative content
   - Subtle paper textures, gentle shadows, sophisticated aesthetic
   - Muted pastel version for interior content and founder portraits
   - Used for: Hero images, founder profiles, insight articles
   - All brand photographs are stylized using this approach, never raw photos

2. **Flat Color Minimalism**: For dimension and UI elements
   - Bold geometric shapes, no textures/gradients, limited color palette
   - Used for: Sector/market/attribute cards, navigation, mobile elements

3. **Geometric Minimalism**: For data visualization and structural elements
   - Simple shapes with minimal depth, subtle shadows, structured composition
   - Used for: Maps, charts, relationship diagrams

4. **Natural Photography**: For team and testimonial content
   - Professional, natural photography (not stylized)
   - Clean, neutral backgrounds with consistent lighting
   - Used exclusively for: Brandmine team portraits, testimonial providers

See `docs/design/image-style-guide.md` for detailed style specifications and examples.

## Image Processing Workflow

1. **Prepare Original Images**
   - Place in the appropriate `originals/` directory
   - Follow naming conventions (`purpose-name.ext`)
   - Ensure proper dimensions and aspect ratio (3:2 horizontal, 2:3 vertical)
   - Optimize file size before adding

2. **Convert PNG to JPG if Needed**
   - For large illustration PNGs (>300KB), use the conversion script:
   - `./_scripts/convert-to-jpg.sh`

3. **Process with Scripts**
   - For brand images: `./_scripts/process_brand_images.sh [country-code] [brand-name]`
   - For site images: `./_scripts/process_site_images.sh`
   - For people images: `./_scripts/process_people_images.sh`

4. **Using in Templates**
   - Use the appropriate include:
     ```liquid
     {% include components/images/brand-image.html 
        country="in"
        brand="brand-name" 
        image="descriptive-name" 
        purpose="purpose" 
        alt="Descriptive alt text" %}
     ```

## File Format Guidelines

- **JPG**: Use for photographs and most illustrations
  - Quality setting: 85%
  - Target file size: <300KB for full-size images

- **PNG**: Use for logos, icons, and images requiring transparency
  - For illustrations, consider JPG conversion if file size >300KB
  - Use for source icons at 512×512px

- **SVG**: Use for icons and simple graphics where possible
  - Minify before adding to repository
  - Ensure proper viewBox settings

## Special Case: Team & Testimonial Photography

For Brandmine team members and testimonial providers, we use natural, professional photography rather than stylized illustrations:

- **Professional Portraits**: Clean, consistent photography with neutral backgrounds
- **Consistent Format**: 2:3 portrait orientation (800×1200px)
- **Minimal Editing**: Professional color correction and basic retouching only
- **Brand Filter**: Apply a subtle teal (#38B2AC) filter at 12% opacity
- **Example Path**: `/assets/images/people/team-georgie-brandmine.jpg`

### Batch Processing Script

For applying the brand filter to multiple team photos at once:

```bash
#!/bin/bash
# apply_teal_filter.sh - Apply a subtle Brandmine teal filter to portrait photos
# Usage: ./apply_teal_filter.sh input_directory output_directory

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
echo "Results saved in: $OUTPUT_DIR"
```

Save this script as `_scripts/apply_teal_filter.sh` and make it executable with `chmod +x _scripts/apply_teal_filter.sh`.

## Image Attribution

For third-party images (e.g., Unsplash photos):
1. Track attribution in `_data/image_attributions.yml`
2. Add attribution data using `./_scripts/add_image_attribution.py`
3. Display attribution with `{% include components/images/image-attribution.html filename="filename.jpg" %}`

## Best Practices

1. **Accessibility**
   - Always provide meaningful alt text
   - Do not embed text in images
   - Maintain sufficient color contrast

2. **Performance**
   - Compress images before adding to repository
   - Use appropriate dimensions (don't scale down large images with CSS)
   - Consider lazy loading for below-the-fold images

3. **Consistency**
   - Follow established naming conventions
   - Use the appropriate visual style for each content type
   - Maintain consistent aspect ratios

4. **Multilingual Support**
   - Avoid text in images (use HTML/CSS instead)
   - Consider cultural appropriateness across languages

## Troubleshooting

Common issues and solutions:

1. **Images not appearing**
   - Check file path and case sensitivity
   - Verify the file exists in the repository
   - Check for proper extension

2. **Responsive images not generating**
   - Ensure original is in the correct `originals/` folder
   - Check naming pattern follows conventions
   - Run the appropriate processing script

3. **Incorrect dimensions**
   - Verify original matches recommended dimensions
   - Check aspect ratio of original image
   - Re-run processing scripts after correction

4. **PNG file size too large**
   - Use `./_scripts/convert-to-jpg.sh` to convert to JPG
   - Ensure quality set to 85% for good balance
   - Consider using image optimization tools before adding

For additional help, contact the development team.
