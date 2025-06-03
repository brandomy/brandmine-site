# Images Guide

*Last updated: December 2024*

Complete guide for adding, processing, and implementing images across the Brandmine platform.

## Visual Style Framework

Brandmine uses four distinct visual styles to create clear information hierarchy:

### 1. Textured Minimalism
**Primary style for narrative content**
- Subtle textures with gentle shadows
- Clean, simplified forms
- 4-5 color palette with thoughtful contrast
- **Standard:** Brand heroes, insight headers, market-specific sectors
- **Muted Pastel:** Secondary content within articles/profiles

### 2. Flat Color Minimalism
**For dimension visualization and UI**
- Bold geometric shapes, no textures
- 3-4 flat colors maximum
- Strong simplification and abstraction
- **Usage:** Sector (olive), market (sky blue), attribute (orange), signal (indigo) cards

### 3. Geometric Minimalism
**For data visualization and mapping**
- Simple shapes with minimal depth
- Light shadows for subtle dimensionality
- Structured, precise compositions
- **Usage:** Maps, data visualizations, relationship diagrams

### 4. Natural Photography
**For team and testimonials only**
- Professional, high-quality photography
- Clean neutral backgrounds
- Subtle brand filter (12% teal overlay)
- **Usage:** Team members, testimonial providers

## File Standards

### Aspect Ratios
- **Standard content:** 3:2 horizontal (1200×800px)
- **Portraits:** 2:3 vertical (800×1200px)
- **Icons:** 1:1 square (512×512px source)

### Naming Convention
```
purpose-descriptivename.extension
```

**Standard Purposes:**
- `hero` - Main banner images
- `founder` - Founder portraits
- `team` - Team member portraits
- `gallery` - Image collections
- `logo` - Brand logos
- `product` - Product imagery
- `location` - Place imagery
- `icon` - UI and taxonomy icons

**Examples:**
```
hero-storefront.jpg
founder-portrait.jpg
team-member.jpg
logo-color.png
icon-export-ready.svg
```

## Directory Structure

```
assets/images/
├── brands/[country-code]/[brand-name]/
│   ├── originals/           # Original files
│   └── [responsive images]  # Generated versions
├── people/originals/        # Team/testimonial photos
├── sectors/originals/       # Sector imagery
├── markets/originals/       # Market imagery
├── insights/originals/      # Article imagery
└── icons/
    ├── originals/           # PNG icons
    └── dimensions/          # Taxonomy icons
```

## Processing Workflow

### 1. Prepare Images
- Optimize file size (<300KB for standard, <200KB for dimensions)
- Apply appropriate visual style before saving to originals/
- Use correct aspect ratio and format

### 2. Place in Directory
**Brand images:**
```
assets/images/brands/[country-code]/[brand-name]/originals/
```

**Site images:**
```
assets/images/[category]/originals/
```

### 3. Process with Scripts

**Brand images:**
```bash
./_scripts/process_brand_images.sh [country-code] [brand-name]
```

**Site images:**
```bash
./_scripts/process_site_images.sh [category]
```

**Team photos (apply teal filter):**
```bash
./_scripts/apply_teal_filter.sh originals/ processed/
```

**Generated output example:**
```
Input:  hero-storefront.jpg
Output: teatime-hero-storefront-400w.jpg
        teatime-hero-storefront-800w.jpg
        teatime-hero-storefront-1200w.jpg
```

## Implementation

### Brand Images
```liquid
{% include components/images/brand-image.html
   country="ru"
   brand="teatime"
   purpose="hero"
   image="storefront"
   alt="TeaTime storefront in Moscow" %}
```

### Site Images
```liquid
{% include components/images/site-image.html
   category="sectors"
   purpose="hero"
   image="wine"
   alt="Wine sector overview" %}
```

### SVG Icons
```liquid
{% include components/icons/export-ready.svg %}
```

## Style-Specific Guidelines

### Creating Textured Minimalism
```
Create a textured minimalist illustration for [subject]. 3:2 aspect ratio.
Use subtle [texture type] textures and gentle shadows. Incorporate stylized
[elements] in balanced composition. Color palette: [primary] with [accent]
accents. Style should be [qualities] with clean lines and simplified forms.
No text in image.
```

### Creating Flat Color Minimalism
```
Create flat color minimalist illustration for [subject]. 3:2 aspect ratio.
Bold geometric shapes, no textures or gradients. [Number] abstract elements
suggesting [concept]. Primary color: [color] with max 3-4 total colors.
White space as design element. No shadows, highlights, or textures.
Modern, clean style. No text.
```

### Team Photography Requirements
- Clean, neutral backgrounds
- Soft, even lighting
- Shoulders-up framing
- Minimal editing, natural color grading
- Apply 12% teal filter after processing

## File Format Guidelines

| Style | Format | Max Size | Quality |
|-------|--------|----------|---------|
| Textured Minimalism | JPG | 300KB | 85% |
| Flat Color | JPG | 200KB | 85% |
| Geometric | JPG | 200KB | 85% |
| Team Photos | JPG | 300KB | 90% |
| Simple Icons | SVG | 20KB | - |
| Complex Icons | PNG | 100KB | - |

## Color Palettes by Content Type

**Dimensions:**
- Sectors: Olive green (#A3B763)
- Markets: Sky blue (#0EA5E9)
- Attributes: Orange (#F97316)
- Signals: Indigo (#6366F1)

**Insights Categories:**
- Brand Spotlights: Deep blue with amber/gold
- Founder's Journeys: Terracotta with cream/olive
- Location Intelligence: Deep blue with gray/green
- Market Momentum: Cream with burgundy-to-teal gradient

## Troubleshooting

**Image not showing:**
- Verify file exists in expected location
- Check processing script completed successfully
- Confirm parameter spelling in includes

**Wrong size/proportions:**
- Ensure original has correct aspect ratio
- Re-run processing after fixing originals
- Check script output for warnings

**Performance issues:**
- Optimize originals before processing
- Verify responsive include usage
- Check network tab for loading speed

## Quality Control Checklist

- [ ] Correct visual style for content type
- [ ] Appropriate color palette
- [ ] Correct aspect ratio (3:2 or 2:3)
- [ ] No text elements
- [ ] File size optimized
- [ ] Purpose-first naming convention
- [ ] Descriptive alt text
- [ ] Correct directory placement
- [ ] Processed with appropriate script
- [ ] Displays correctly at all sizes
