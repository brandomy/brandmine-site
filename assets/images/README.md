## Updated `README.md`:


# Brandmine Images

*Last updated: May 14, 2025*

This directory contains all image assets used across the Brandmine platform. This README explains the organization system, naming conventions, and the unified image processing workflow.

## Directory Structure

```
assets/images/
├── brands/                     # Brand-specific imagery
│   └── [slug]/                 # Each brand uses full slug (e.g., ru-teatime)
│       ├── originals/          # Original high-resolution files
│       └── [responsive images] # Generated responsive images
├── founders/                   # Dedicated founder collection
│   └── [slug]/                 # Founder identifier
├── people/                     # Non-brand people
│   ├── team/                   # Team members
│   │   └── [slug]/
│   └── testimonials/           # Testimonial providers
│       └── [slug]/
├── sectors/                    # Sector dimension images
│   └── [slug]/
├── markets/                    # Market dimension images
│   └── [slug]/
├── attributes/                 # Attribute dimension images
│   └── [slug]/
├── signals/                    # Signal dimension images
│   └── [slug]/
├── insights/                   # Insight article images
│   └── [slug]/
└── site/                       # Site-wide elements
    ├── ui/                     # UI components
    ├── icons/                  # General icons
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
| `portrait` | General portraits | `portrait-professional.jpg`, `portrait-casual.jpg` |
| `founder` | Founder-specific portraits | `founder-portrait.jpg` |
| `headshot` | Small portraits for teams/testimonials | `headshot-formal.jpg` |
| `gallery` | Image collections | `gallery-product.jpg`, `gallery-interior.jpg` |
| `logo` | Brand logos | `logo-color.png`, `logo-dark.png` |
| `product` | Product imagery | `product-teapot.jpg`, `product-lineup.jpg` |
| `thumbnail` | Preview images | `thumbnail-article.jpg` |
| `feature` | Featured content images | `feature-announcement.jpg` |
| `icon` | UI and taxonomy icons | `icon-export-ready.png` |

### Processed Images

Processed images are automatically generated with this naming pattern:

```
[purpose]-[descriptivename]-[width]w.extension
```

**Examples:**
- Original: `hero-storefront.jpg`
- Outputs: `hero-storefront-400w.jpg`, `hero-storefront-800w.jpg`, `hero-storefront-1200w.jpg`

## Standard Dimensions

| Image Type | Aspect Ratio | Recommended Size | Generated Sizes |
|------------|--------------|------------------|-----------------|
| Hero Images | 3:2 | 1200×800px | 400w, 800w, 1200w |
| Portraits | 2:3 | 800×1200px | 400w, 800w, 1200w |
| Square Images | 1:1 | 1200×1200px | 400w, 800w, 1200w |
| Logos | Variable | 400px width | 400w, 800w, 1200w |
| Icons | 1:1 | 512×512px | 400w, 800w, 1200w |

## Unified Image Processing

All images are now processed with a single script that handles all collections:

### Basic Usage:
```bash
# Process specific collection and slug
./_scripts/process_images.sh brands ru-teatime

# Process entire collection
./_scripts/process_images.sh sectors

# Process all images
./_scripts/process_images.sh all
```

### Processing Features:
- Automatically detects image orientation (portrait vs landscape)
- Applies appropriate quality settings (90% for portraits, 85% for landscapes)
- Portrait images scale by height to avoid oversizing
- Landscape images scale by width
- Preserves originals if they're smaller than target size

## Using Images in Templates

All images now use the unified `collection-image.html` component:

### Basic Usage:
```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   alt="Alt text here" %}
```

### Complete Example with All Parameters:
```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   name="storefront"
   aspect="landscape"
   ext="jpg"
   loading="eager"
   class="hero-image"
   alt="TeaTime storefront in Moscow" %}
```

### Common Patterns:

#### Brand Images:
```liquid
<!-- Hero image -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   name="storefront"
   alt="TeaTime storefront" %}

<!-- Founder portrait -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="founder"
   aspect="portrait"
   alt="TeaTime founder" %}

<!-- Logo -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="logo"
   aspect="square"
   ext="png"
   alt="TeaTime logo" %}
```

#### People Images:
```liquid
<!-- Team member -->
{% include components/images/collection-image.html
   collection="people"
   category="team"
   slug="olya-eastman"
   purpose="headshot"
   aspect="square"
   alt="Olya Eastman" %}

<!-- Testimonial -->
{% include components/images/collection-image.html
   collection="people"
   category="testimonials"
   slug="georgie-yam"
   purpose="portrait"
   aspect="portrait"
   alt="Georgie Yam" %}
```

#### Sector Images:
```liquid
{% include components/images/collection-image.html
   collection="sectors"
   slug="wine"
   purpose="hero"
   alt="Wine sector overview" %}
```

## Mobile-First Image Handling

The unified component includes mobile-first responsive handling:

### Automatic Sizing by Purpose:
- **Hero images**: 100vw on mobile → 50vw on desktop
- **Portraits**: 50vw on mobile → 33vw on desktop
- **Thumbnails**: 45vw on mobile → fixed 250px on desktop
- **Logos**: Fixed small sizes across all breakpoints

### Loading Priorities:
```liquid
<!-- Above-the-fold images -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   loading="eager"
   alt="Hero image" %}

<!-- Below-the-fold images (default) -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="gallery"
   alt="Gallery image" %}
```

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

## Image Attribution

For third-party images (e.g., Unsplash photos):
1. Track attribution in `_data/image_attributions.yml`
2. Add attribution data using `./_scripts/add_image_attribution.py`
3. Display attribution with `{% include components/images/image-attribution.html filename="filename.jpg" %}`

## Best Practices

1. **Use Full Slugs**: Always use complete slugs (e.g., `ru-teatime` not just `teatime`)
2. **Specify Aspect Ratio**: Include `aspect` parameter for better responsive handling
3. **Consider Loading Priority**: Use `loading="eager"` for critical above-the-fold images
4. **Proper Alt Text**: Always provide meaningful alt text for accessibility
5. **File Organization**: Keep originals in the `originals/` subdirectory

## Troubleshooting

Common issues and solutions:

1. **Images not appearing**
   - Check collection and slug parameters match directory structure
   - Verify the purpose-name combination exists
   - Ensure proper case sensitivity

2. **Wrong responsive behavior**
   - Add appropriate `aspect` parameter
   - Check if `purpose` matches intended use
   - Verify generated sizes exist

3. **Processing errors**
   - Ensure originals are in correct directory
   - Check naming follows `purpose-name` pattern
   - Run script with correct collection/slug parameters

4. **Performance issues**
   - Use appropriate `loading` attribute
   - Ensure images are properly sized before processing
   - Consider image optimization before adding to repository

For additional help, see the development journal entries or contact the development team.
