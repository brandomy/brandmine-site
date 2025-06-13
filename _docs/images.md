# Images Guide

*Last updated: June 2025*

Complete guide for adding, processing, and implementing images across the Brandmine platform using the current Jekyll-based image system.

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

**Flexible Pattern (supports both generic and descriptive naming):**
```
purpose-[descriptive-name]-[size]w.extension
```

**Standard Purposes:**
- `hero` - Main banner images
- `portrait` - Founder portraits  
- `headshot` - Smaller founder images
- `logo` - Brand logos
- `gallery` - Additional brand imagery

**Examples:**
```
# Generic naming (fallback support)
hero-400w.jpg
logo-800w.png
portrait-1200w.jpg

# Descriptive naming (preferred)
hero-storefront-400w.jpg
hero-moscow-spice-market-800w.jpg
logo-color-400w.png
portrait-portrait-1200w.jpg
```

**Automatic Processing:**
Originals are stored without size suffix and automatically processed into responsive versions:
```
Original: hero-storefront.jpg
Generated: hero-storefront-400w.jpg
          hero-storefront-800w.jpg
          hero-storefront-1200w.jpg
```

## Directory Structure

```
assets/images/
├── brands/{brand-id}/       # Brand-specific images
│   ├── originals/           # Source images
│   ├── hero-*-400w.jpg     # Processed responsive versions
│   ├── logo-*-800w.png     # Auto-generated from originals
│   └── portrait-*-1200w.jpg
├── founders/{founder-id}/   # Founder-specific images
│   ├── originals/
│   ├── portrait-*-400w.jpg
│   └── headshot-*-800w.jpg
├── insights/{insight-id}/   # Article images
│   ├── originals/
│   └── hero-*-400w.jpg
├── dimensions/{type}/       # Dimension category images
│   ├── markets/
│   ├── sectors/
│   ├── attributes/
│   └── signals/
├── placeholders/           # Fallback images
└── site/                  # Site-wide assets
    ├── logos/
    ├── textures/
    └── pages/
```

## Processing Workflow

### 1. Prepare Images
- Optimize file size (<300KB for standard images)
- Apply appropriate visual style
- Use correct aspect ratio: 3:2 horizontal, 2:3 vertical
- Save in high quality as originals

### 2. Place in Originals Directory
**Brand images:**
```
assets/images/brands/{brand-id}/originals/
```
**Examples:**
- `hero-storefront.jpg`
- `logo-color.png`
- `founder-portrait.jpg`

**Founder images:**
```
assets/images/founders/{founder-id}/originals/
```

**Insight images:**
```
assets/images/insights/{insight-id}/originals/
```

### 3. Process with Unified Script

**Single collection:**
```bash
_scripts/core/process_images.sh brands ru-teatime
_scripts/core/process_images.sh founders br-eduardo-santos
_scripts/core/process_images.sh insights ru-seven-spices-spotlight
```

**Entire collection:**
```bash
_scripts/core/process_images.sh brands
_scripts/core/process_images.sh founders
```

**Process everything:**
```bash
_scripts/core/process_images.sh all
```

**Automatic Generation:**
- Creates 3 responsive sizes: 400w, 800w, 1200w
- Optimizes quality: 90% for portraits, 85% for landscapes
- Scales by height for portraits, width for landscapes
- Preserves original aspect ratios

**Output Example:**
```
Input:  assets/images/brands/ru-teatime/originals/hero-storefront.jpg
Output: assets/images/brands/ru-teatime/hero-storefront-400w.jpg
        assets/images/brands/ru-teatime/hero-storefront-800w.jpg
        assets/images/brands/ru-teatime/hero-storefront-1200w.jpg
```

## Implementation

### Primary Component: collection-image.html
**Universal responsive image component with intelligent fallback:**
```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   name="storefront"
   alt="TeaTime storefront in Moscow" %}
```

**Parameters:**
- `collection` (required): "brands", "founders", "insights", etc.
- `slug` (required): Unique identifier (e.g., "ru-teatime")
- `purpose` (required): "hero", "logo", "portrait", "headshot"
- `name` (optional): Descriptive name for specific images
- `alt` (required): Accessibility description
- `aspect` (optional): "landscape", "portrait", "square"
- `class` (optional): Additional CSS classes
- `loading` (optional): "lazy" (default) or "eager"

### Brand-Specific Helper
**Simplified brand image helper with hardcoded mappings:**
```liquid
{% include helpers/brand-image.html
   brand_id="ru-teatime"
   image_type="hero"
   alt="TeaTime storefront" %}
```

**Supported image_type values:**
- `hero` - Brand hero images
- `logo` - Brand logos
- `portrait` - Founder portraits (delegates to founders collection)

### Founder Images
```liquid
{% include components/images/collection-image.html
   collection="founders"
   slug="ru-alexei-sokolov"
   purpose="portrait"
   aspect="portrait"
   alt="Alexei Sokolov portrait" %}
```

### Hero Images (Full-width)
```liquid
{% include components/images/hero-image.html
   path="/assets/images/site/pages/home/hero"
   alt="Brandmine homepage hero" %}
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

## Collection-Optimized Alt Text System

Brandmine uses a collection-specific approach optimized for each content type's unique requirements, improving accessibility and maintainability.

### Collection-Specific Strategies

**Brands/Founders: Enhanced Unified Structure**
- Perfect for fixed schema (logo + hero for brands, portrait + headshot for founders)
- Alt text stored directly in front matter for centralized management
- Intelligent fallback system for missing alt text

**Insights: Specialized Flexible Structure** 
- Perfect for variable schema (hero + 1-10+ additional images of various types)
- Specialized image arrays for different image types
- Auto-builds paths with baked-in insights directory structure

### Front Matter Configuration

#### Brand Front Matter (Enhanced Unified Structure)
```yaml
images:
  logo:
    name: "color"        # → logo-color-400w.png
    ext: "png"
    alt: "TeaTime logo featuring elegant Cyrillic lettering with ornate teapot design in traditional Russian style"
  hero:
    name: "storefront"   # → hero-storefront-400w.jpg
    ext: "jpg"
    alt: "TeaTime's flagship tearoom in Moscow's historic Arbat district with large windows showcasing traditional Russian tea service setup and warm ambient lighting"
  founder:
    name: "portrait"     # → founder-portrait-400w.jpg  
    ext: "jpg"
    alt: "Alexei Sokolov, founder of TeaTime, preparing traditional Russian tea ceremony with antique brass samovar in elegant tearoom setting"
```

#### Founder Front Matter (Enhanced Unified Structure)
```yaml
portrait_image: true  # Flag indicating portrait image exists
images:
  portrait:
    name: "portrait"     # → founder-portrait-400w.jpg
    ext: "jpg"
    alt: "Alexei Sokolov, founder of TeaTime, preparing traditional Russian tea ceremony with antique brass samovar while wearing traditional Russian vest in elegant tearoom setting"
  headshot:
    name: "headshot"     # Optional: → founder-headshot-400w.jpg
    ext: "jpg"
    alt: "Professional headshot of Alexei Sokolov against neutral background, wearing business attire with confident expression"
```

#### Insight Front Matter (Specialized Flexible Structure)
```yaml
# Hero image (always present)
hero_image: "hero-moscow-market"
hero_alt: "Bustling Moscow spice market with colorful displays of traditional Russian spices and Seven Spices branded products prominently featured"

# Gallery images (flexible array)
gallery_images:
  - name: "gallery-spice-preparation"
    alt: "Maria Kuznetsova carefully measuring traditional spice blends in Seven Spices workshop"
  - name: "gallery-storefront"
    alt: "Seven Spices flagship location in Moscow's historic district with traditional architecture"

# Optional specialized images
infographic: "growth-chart"
infographic_alt: "Seven Spices revenue growth chart showing 300% increase from 2020-2024"

founder_portrait: "maria-portrait"
founder_portrait_alt: "Maria Kuznetsova, founder of Seven Spices, in traditional Russian dress holding signature spice blend"
```

### Alt Text Quality Guidelines

#### For Brand Images
**Heroes:** Location/setting + architectural elements + brand visibility + cultural context
**Logos:** Visual design + text/language + colors + cultural/symbolic elements

#### For Founder Images  
**Portraits:** Name + role + clothing/traditional elements + setting + props + expressions

#### For Insight Images
**Heroes:** Scene/location + brand elements + cultural/market context + people/activities
**Gallery:** Specific activity/process + people involved + cultural significance
**Infographics:** Data type + key findings + visual elements + context

### Template Components

#### Collection Image Component (Enhanced)
```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   alt="Override alt text if needed" %}
```

**Features:**
- Auto-detects alt text from front matter
- Intelligent fallback system
- Supports all collection types
- Responsive sizing optimization

#### Insight Image Component (Specialized)
```liquid
{% include components/images/insight-image.html
   slug="ru-seven-spices-spotlight"
   type="hero" %}

{% include components/images/insight-image.html
   slug="ru-seven-spices-spotlight"
   type="gallery"
   index=0 %}

{% include components/images/insight-image.html
   slug="ru-seven-spices-spotlight"
   type="infographic" %}
```

**Features:**
- Baked-in path building for insights
- Flexible image array handling
- Automatic responsive sizing
- Eager loading for heroes, lazy for others
```

### Founder Front Matter
```yaml
portrait_image: true  # Flag indicating portrait exists
images:
  portrait:
    name: "portrait"     # → portrait-portrait-400w.jpg
    ext: "jpg"
  headshot:
    name: "headshot"     # → headshot-headshot-400w.jpg
    ext: "jpg"
```

### Insight Front Matter (Direct Paths)
```yaml
hero_image: "/assets/images/insights/ru-seven-spices-spotlight/hero-moscow-spice-market.jpg"
founder_portrait: "/assets/images/insights/ru-seven-spices-spotlight/founder-portrait-marina-petrova.jpg"
logo: "/assets/images/insights/ru-seven-spices-spotlight/logo-seven-spices.png"
```

## Intelligent Fallback System

The system attempts multiple image sources in this order:

1. **Descriptive naming** (if `name` provided): `hero-storefront-400w.jpg`
2. **Generic naming** (fallback): `hero-400w.jpg`
3. **Placeholder image**: `/assets/images/placeholders/brands-hero-400w.jpg`

This ensures images always display, even if specific files are missing.

## Troubleshooting

**Image not showing:**
- Check if original exists in `originals/` directory
- Run processing script: `_scripts/core/process_images.sh collection slug`
- Verify front matter configuration matches expected structure
- Check browser console for 404 errors

**Processing issues:**
- Ensure ImageMagick is installed: `magick -version`
- Check original file dimensions and format
- Review script output for error messages
- Verify directory permissions

**Template errors:**
- Confirm all required parameters are provided
- Check parameter spelling and case sensitivity
- Verify collection and slug values match directory structure
- Test with placeholder fallback enabled

## System Features

### Responsive Image Generation
- **Automatic Processing**: Single script generates 3 optimized sizes (400w, 800w, 1200w)
- **Smart Scaling**: Portrait images scale by height, landscape by width
- **Quality Optimization**: 90% for portraits, 85% for landscapes
- **Format Detection**: Auto-detects PNG for logos, JPG for photography

### Intelligent Fallback System
- **Descriptive → Generic → Placeholder**: Graceful degradation prevents broken images
- **Collection-Aware**: Different placeholders for different content types
- **JavaScript Fallback**: `onerror` handlers for seamless fallback switching

### Performance Features
- **Mobile-First Responsive**: Proper `sizes` attributes for optimal loading
- **Lazy Loading**: Default lazy loading with eager option for above-fold content
- **Optimized File Sizes**: 17-26KB for mobile versions
- **No JavaScript Dependencies**: Pure HTML `<img>` with `srcset`

### Developer Experience
- **Template Components**: Universal `collection-image.html` handles 90% of use cases
- **Brand Helper**: Simplified `brand-image.html` with hardcoded mappings
- **Clear Documentation**: Self-documenting component parameters
- **Error Prevention**: Comprehensive fallback system prevents broken layouts

## Quick Start Workflow

### Adding a New Brand
1. **Place originals** in `assets/images/brands/{brand-id}/originals/`:
   - `hero-storefront.jpg` (landscape, 3:2 ratio)
   - `logo-color.png` (square or landscape)
   - `founder-portrait.jpg` (portrait, 2:3 ratio)

2. **Process images**:
   ```bash
   _scripts/core/process_images.sh brands {brand-id}
   ```

3. **Configure front matter**:
   ```yaml
   images:
     logo:
       name: "color"
       ext: "png"
     hero:
       name: "storefront"  # Matches filename
       ext: "jpg"
   ```

4. **Use in templates**:
   ```liquid
   {% include helpers/brand-image.html 
      brand_id="{brand-id}" 
      image_type="hero" %}
   ```

### Adding a New Founder
1. **Place originals** in `assets/images/founders/{founder-id}/originals/`:
   - `portrait.jpg` (portrait, 2:3 ratio)
   - `headshot.jpg` (optional, smaller portrait)

2. **Process**: `_scripts/core/process_images.sh founders {founder-id}`

3. **Configure front matter**:
   ```yaml
   portrait_image: true
   images:
     portrait:
       name: "portrait"
       ext: "jpg"
   ```

## Quality Control Checklist

### Before Processing
- [ ] Correct aspect ratio (3:2 horizontal, 2:3 vertical)
- [ ] High quality source image (>1200px on long side)
- [ ] Appropriate visual style applied
- [ ] File size optimized for web (<300KB)
- [ ] Descriptive filename chosen

### After Processing
- [ ] All 3 responsive sizes generated (400w, 800w, 1200w)
- [ ] Images display correctly in browser
- [ ] Mobile sizes load efficiently
- [ ] Alt text is descriptive and accessible
- [ ] Front matter configuration matches file structure

### Template Integration
- [ ] Correct component parameters used
- [ ] Fallback system working (test with missing files)
- [ ] Loading performance acceptable
- [ ] Images display at all breakpoints
- [ ] No broken image icons visible
