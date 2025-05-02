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
├── icons/                      # Dimension taxonomy icons
│   ├── dimensions/             # Organized by dimension type
│   │   ├── sectors/            # Sector-specific icons
│   │   ├── attributes/         # Attribute-specific icons
│   │   ├── signals/            # Signal-specific icons
│   │   └── markets/            # Market-specific icons
│   └── insights/               # Insights category icons
├── people/                     # Non-brand team members and staff
├── insights/                   # Insight article images
└── site/                       # Site-wide UI elements
    ├── ui/                     # UI components
    ├── icons/                  # General UI icons
    └── layout/                 # Layout elements
```

## Naming Conventions

All original images follow the purpose-first naming pattern:

```
purpose-descriptivename.extension
```

### Standard Purpose Identifiers

| Purpose | Usage | Examples |
|---------|-------|----------|
| `hero` | Main banner images | `hero-storefront.jpg`, `hero-overview.jpg` |
| `founder` | Founder portraits | `founder-portrait.jpg`, `founder-informal.jpg` |
| `team` | Group or staff photos | `team-leadership.jpg`, `team-production.jpg` |
| `gallery` | Image collections | `gallery-product.jpg`, `gallery-interior.jpg` |
| `logo` | Brand logos | `logo-color.png`, `logo-dark.png` |
| `product` | Product imagery | `product-teapot.jpg`, `product-lineup.jpg` |
| `location` | Place imagery | `location-vineyard.jpg`, `location-factory.jpg` |
| `certificate` | Certifications | `certificate-organic.jpg` |
| `testimonial` | Customer/partner testimonials | `testimonial-georgie-yam.jpg` |
| `icon` | UI and taxonomy icons | `icon-export-ready.png`, `icon-wine.svg` |

### Processed Images

Processed images are automatically generated with this naming pattern:

```
[brand-name]-[purpose]-[descriptivename]-[width]w.extension
```

**Input vs Output Examples:**

*Input:* `assets/images/brands/ru/teatime/originals/hero-storefront.jpg`  
*Outputs:*
- `assets/images/brands/ru/teatime/teatime-hero-storefront-400w.jpg`
- `assets/images/brands/ru/teatime/teatime-hero-storefront-800w.jpg`
- `assets/images/brands/ru/teatime/teatime-hero-storefront-1200w.jpg`

*Input:* `assets/images/sectors/originals/hero-wine.jpg`  
*Outputs:*
- `assets/images/sectors/sectors-hero-wine-400w.jpg`
- `assets/images/sectors/sectors-hero-wine-800w.jpg`
- `assets/images/sectors/sectors-hero-wine-1200w.jpg`

## Standard Dimensions

| Image Type | Aspect Ratio | Recommended Size | Generated Sizes |
|------------|--------------|------------------|-----------------|
| Hero Images | 3:2 | 1200×800px | 400w, 800w, 1200w |
| Gallery Images | 3:2 | 1200×800px | 400w, 800w, 1200w |
| Founder/People Portraits | 2:3 | 800×1200px | 400w, 800w, 1200w |
| Logos | - | 400px width | 200w, 400w |
| Thumbnails | 1:1 | 400×400px | 200w, 400w |
| Icons | 1:1 | 512×512px | 24px, 48px, 128px |

## Visual Style Framework

Brandmine employs four distinct visual styles to create meaningful differentiation across content types:

1. **Textured Minimalism**: Primary style for brand narrative content
   - Subtle paper textures, gentle shadows, sophisticated aesthetic
   - Muted pastel version for interior content and founder portraits
   - Used for: Hero images, founder portraits, insight articles
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
   - Follow naming conventions (`purpose-descriptivename.ext`)
   - Ensure proper dimensions and aspect ratio (3:2 horizontal, 2:3 vertical)
   - Optimize file size before adding

2. **Convert PNG to JPG if Needed**
   - For large illustration PNGs (>300KB), use the conversion script:
   - `./_scripts/convert-to-jpg.sh`

3. **Process with Scripts**
   - For brand images: `./_scripts/process_brand_images.sh [country-code] [brand-name]`
   - For site images: `./_scripts/process_site_images.sh [optional_category]`
   - For people images: `./_scripts/process_people_images.sh`
   - For icons: `./_scripts/process_icons.sh [optional_system]` (dimensions or insights)

4. **Using in Templates**
   - For brand images:
     ```liquid
     {% include components/images/brand-image.html 
        country="ru"
        brand="teatime" 
        image="storefront" 
        purpose="hero"
        alt="TeaTime storefront in Moscow" %}
     ```
   
   - For site images:
     ```liquid
     {% include components/images/site-image.html 
        category="sectors"
        image="wine" 
        purpose="hero"
        alt="Wine sector overview" %}
     ```
     
   - For taxonomy icons:
     ```liquid
     {% include components/taxonomy-icon.html 
        system="dimensions" 
        type="sectors" 
        name="wine" %}
     ```

## File Format Guidelines

- **JPG**: Use for photographs and most illustrations
  - Quality setting: 85% (90% for portraits)
  - Target file size: <300KB for full-size images

- **PNG**: Use for logos, icons, and images requiring transparency
  - For illustrations, consider JPG conversion if file size >300KB
  - Use for source icons at 512×512px

- **SVG**: Use for icons and simple graphics where possible
  - Place in `_includes/components/icons/` directory
  - Ensure proper viewBox attribute setting
  - Example SVG with proper viewBox:
    ```xml
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
      <!-- Icon content here -->
    </svg>
    ```

## Special Case: Team & Testimonial Photography

For Brandmine team members and testimonial providers, we use natural, professional photography rather than stylized illustrations:

- **Professional Portraits**: Clean, consistent photography with neutral backgrounds
- **Consistent Format**: 2:3 portrait orientation (800×1200px)
- **Minimal Editing**: Professional color correction and basic retouching only
- **Brand Filter**: Apply a subtle teal (#38B2AC) filter at 12% opacity

### Batch Processing Script

For applying the brand filter to multiple team photos, use the `apply_teal_filter.sh` script:

```bash
./_scripts/apply_teal_filter.sh input_directory/ output_directory/
```

This applies a consistent brand filter to all portrait images in the input directory.

## Taxonomy Icons Implementation

For dimension taxonomy icons (sectors, attributes, signals, markets) and insight category icons, we use a dedicated system:

- **Icon Format**: PNG with transparent background
- **Source Size**: 512×512 pixels
- **Output Sizes**: 24px, 48px, 128px for responsive usage
- **Style**: Flat, minimalist design with clean lines and dimension-specific color schemes:
  - Sectors: Olive/Green (#A3B763)
  - Attributes: Orange/Secondary (#F97316)
  - Signals: Purple/Accent (#6366F1)
  - Markets: Blue/Sky (#0EA5E9)
  - Insights: Teal (#38B2AC)

See `docs/design/taxonomy-icon-implementation.md` for the complete implementation guide.

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

5. **Icons not displaying correctly**
   - Verify SVG has proper viewBox attribute
   - Check PNG transparency is preserved
   - Ensure the correct dimension-specific classes are applied

For additional help, contact the development team.