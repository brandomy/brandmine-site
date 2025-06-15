# Images Guide

*Last updated: June 16, 2025*

Complete guide for adding, processing, and implementing images across the Brandmine platform following the standardized unified image system.

## Visual Style Framework

Brandmine uses four distinct visual styles to create clear information hierarchy:

### 1. Textured Minimalism
**Primary style for narrative content**
- Subtle textures with gentle shadows
- Clean, simplified forms
- 4-5 color palette with thoughtful contrast
- **Usage:** Brand heroes, insight headers, market-specific sectors

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

### Context-Aware Naming Convention

**STANDARDIZED PATTERN:** `purpose-context.extension`

**Key Principle:** Directory provides context, filename describes content only

```bash
# Correct ✅ - Context-aware naming
hero-storefront.jpg        # Scene only (not "teatime-storefront-moscow")
logo-color.png            # Variant only (not "teatime-logo-color")
founder-formal.jpg         # Context only (not "alexei-sokolov-formal")

# Incorrect ❌ - Old patterns with redundancy
hero-teatime-storefront-moscow.jpg
logo-teatime-brand.png
founder-alexei-sokolov-portrait.jpg
```

**Standard Purposes:**
- `hero` - Main banner images
- `logo` - Brand logos
- `founder` - Founder portraits (renamed from "portrait")
- `headshot` - Secondary founder images

**Context Descriptors:**
- **Heroes:** Scene/location (`storefront`, `vineyard`, `workshop`, `ceremony`, `market`, `farmland`)
- **Logos:** Variant (`color`, `mono`, `white`, `brand`)
- **Founders:** Context/role (`formal`, `traditional`, `working`, `business`, `professional`, `outdoor`)

## Directory Structure

```
assets/images/
├── brands/{brand-id}/       # Brand-specific images
│   ├── originals/           # Source images
│   │   ├── hero-storefront.jpg
│   │   ├── logo-color.png
│   │   └── founder-formal.jpg
│   ├── {brand-id}-hero-storefront-400w.jpg    # Auto-generated responsive
│   ├── {brand-id}-hero-storefront-800w.jpg
│   ├── {brand-id}-hero-storefront-1200w.jpg
│   ├── {brand-id}-logo-color-400w.png
│   └── {brand-id}-founder-formal-400w.jpg
├── founders/{founder-id}/   # Founder-specific images
│   ├── originals/
│   │   ├── portrait-formal.jpg
│   │   └── headshot-business.jpg
│   ├── {founder-id}-portrait-formal-400w.jpg
│   └── {founder-id}-headshot-business-800w.jpg
├── insights/{insight-id}/   # Article images
│   ├── originals/
│   │   ├── hero-vineyard.jpg
│   │   ├── founder-portrait.jpg
│   │   └── logo-brand.png
│   ├── {insight-id}-hero-vineyard-400w.jpg
│   └── {insight-id}-founder-portrait-400w.jpg
└── placeholders/           # Fallback images
    ├── brands-hero-400w.jpg
    ├── founders-portrait-400w.jpg
    └── insights-hero-400w.jpg
```

## Unified Processing Workflow

### 1. Prepare Images
- Optimize file size (<300KB for standard images)
- Apply appropriate visual style
- Use correct aspect ratio: 3:2 horizontal, 2:3 vertical
- Follow context-aware naming pattern

### 2. Place in Originals Directory
**Following standardized naming:**
```bash
# Brand images
assets/images/brands/{brand-id}/originals/
├── hero-storefront.jpg      # Scene only
├── logo-color.png          # Variant only
└── founder-formal.jpg      # Context only

# Founder images
assets/images/founders/{founder-id}/originals/
├── portrait-formal.jpg     # Context/role only
└── headshot-business.jpg   # Context/role only

# Insight images
assets/images/insights/{insight-id}/originals/
├── hero-vineyard.jpg       # Scene only
├── founder-portrait.jpg    # Generic descriptor
└── logo-brand.png         # Variant only
```

### 3. Process with Unified Script

**Single collection:**
```bash
_scripts/core/process_images.sh brands ru-teatime
_scripts/core/process_images.sh founders ru-alexei-sokolov
_scripts/core/process_images.sh insights ru-russian-wine-renaissance
```

**Entire collection:**
```bash
_scripts/core/process_images.sh brands
_scripts/core/process_images.sh founders
_scripts/core/process_images.sh insights
```

**Automatic Generation:**
- Creates 3 responsive sizes: 400w, 800w, 1200w
- Optimizes quality: 90% for portraits, 85% for landscapes
- Adds collection identifier prefix to prevent conflicts
- Preserves original aspect ratios

**Output Example:**
```
Input:  assets/images/brands/ru-teatime/originals/hero-storefront.jpg
Output: assets/images/brands/ru-teatime/ru-teatime-hero-storefront-400w.jpg
        assets/images/brands/ru-teatime/ru-teatime-hero-storefront-800w.jpg
        assets/images/brands/ru-teatime/ru-teatime-hero-storefront-1200w.jpg
```

## Standardized Front Matter Structure

### Brand Front Matter
```yaml
# === IMAGES (Standardized semantic structure) ===
images:
  hero:
    name: "storefront"     # Context-aware: scene only
    alt: "TeaTime's flagship tearoom in Moscow's historic Arbat district"
    ext: "jpg"
  logo:
    name: "color"          # Context-aware: variant only
    alt: "TeaTime logo featuring elegant Cyrillic lettering"
    ext: "png"
  founder:                 # Standardized key (not founder_portrait)
    name: "formal"         # Context-aware: role only
    alt: "Alexei Sokolov, founder of TeaTime"
    ext: "jpg"
```

### Founder Front Matter
```yaml
# === IMAGES (Standardized semantic structure) ===
portrait_image: true
images:
  portrait:
    name: "formal"         # Context-aware: role/setting
    alt: "Alexei Sokolov preparing traditional Russian tea ceremony"
    ext: "jpg"
  headshot:
    name: "business"       # Context-aware: style/setting
    alt: "Professional headshot of Alexei Sokolov"
    ext: "jpg"
```

### Insight Front Matter
```yaml
# === IMAGES (Standardized semantic structure) ===
images:
  hero:
    name: "vineyard"       # Context-aware: scene only (not "krasnodar-vineyard")
    alt: "Russian vineyards in Krasnodar region showing modern viticulture"
    ext: "jpg"
  founder:                 # Standardized key (not founder_portrait)
    name: "portrait"       # Generic descriptor (not person name)
    alt: "Anna Kuznetsova, founder of Krasnodar Wines"
    ext: "jpg"
  logo:
    name: "brand"          # Context-aware: variant only
    alt: "Russian wine logo"
    ext: "png"
```

## Unified Image System Implementation

### Primary Component: collection-image.html
**Universal component handling all image types:**
```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   name="storefront"
   alt="TeaTime storefront in Moscow" %}
```

**All card components now use this unified system:**
- `insight-card.html`
- `founder-card.html`
- `featured-founder-card.html`
- `tagged-insight-card.html`
- `simple-insight-card.html`
- `brand-card.html` (via brand-image.html helper)

### Intelligent Fallback System
The system attempts multiple sources in this order:

1. **Specific naming**: `ru-teatime-hero-storefront-400w.jpg`
2. **Generic naming**: `ru-teatime-hero-400w.jpg`
3. **Placeholder**: `/assets/images/placeholders/brands-hero-400w.jpg`

This ensures images always display, even during file renames or missing images.

## Migration from Legacy Patterns

### Old vs New Naming
```yaml
# OLD PATTERNS ❌ (removed during standardization)
hero:
  name: "teatime-storefront-moscow"     # Location redundancy
founder_portrait:                       # Inconsistent key
  name: "alexei-sokolov-formal"        # Person-specific name

# NEW STANDARD ✅ (current implementation)
hero:
  name: "storefront"                   # Scene only
founder:                               # Standardized key
  name: "formal"                       # Context only
```

### Processing Pipeline Updates
- **Legacy files**: Automatically handled by fallback system
- **New content**: Must follow context-aware naming pattern
- **Responsive generation**: Unified script handles all collections
- **Cross-language consistency**: Identical image names across EN/RU/ZH

## Content Creator Guidelines

### Quick Start Workflow

#### Adding a New Brand
1. **Place originals** in `assets/images/brands/{brand-id}/originals/`:
   ```bash
   hero-storefront.jpg        # Scene description only
   logo-color.png            # Variant description only
   founder-formal.jpg        # Role/context only
   ```

2. **Process images**:
   ```bash
   _scripts/core/process_images.sh brands {brand-id}
   ```

3. **Configure front matter**:
   ```yaml
   images:
     hero:
       name: "storefront"    # Matches filename minus purpose
       alt: "Descriptive alt text"
       ext: "jpg"
     logo:
       name: "color"
       alt: "Brand logo description"
       ext: "png"
     founder:
       name: "formal"
       alt: "Founder description"
       ext: "jpg"
   ```

#### Adding a New Founder
1. **Place originals** in `assets/images/founders/{founder-id}/originals/`:
   ```bash
   portrait-formal.jpg       # Context/role description
   headshot-business.jpg     # Style/setting description
   ```

2. **Process**: `_scripts/core/process_images.sh founders {founder-id}`

3. **Configure front matter**:
   ```yaml
   portrait_image: true
   images:
     portrait:
       name: "formal"        # Context description only
       alt: "Founder portrait description"
       ext: "jpg"
     headshot:
       name: "business"      # Style description only
       alt: "Founder headshot description"
       ext: "jpg"
   ```

#### Adding an Insight Article
1. **Place originals** in `assets/images/insights/{insight-id}/originals/`:
   ```bash
   hero-vineyard.jpg         # Scene only (not location-specific)
   founder-portrait.jpg      # Generic descriptor (not person name)
   logo-brand.png           # Variant only
   ```

2. **Process**: `_scripts/core/process_images.sh insights {insight-id}`

3. **Configure front matter**:
   ```yaml
   images:
     hero:
       name: "vineyard"      # Scene description only
       alt: "Scene description"
       ext: "jpg"
     founder:                # Use "founder" key (not "founder_portrait")
       name: "portrait"      # Generic descriptor
       alt: "Founder description"
       ext: "jpg"
   ```

## System Architecture Benefits

### ✅ Unified Implementation
- **All components** use `collection-image.html` system
- **Consistent behavior** across all content types
- **Single source of truth** for image handling
- **Automatic responsive** image generation

### ✅ Context-Aware Naming
- **Directory provides context** - no redundancy needed
- **Semantic descriptions** - clear purpose and meaning
- **Scalable pattern** - works for unlimited content
- **Predictable structure** - easy for content creators

### ✅ Cross-Language Consistency
- **Identical image names** across EN/RU/ZH versions
- **Shared physical files** - efficient storage
- **Consistent front matter** - reliable language switching
- **Universal processing** - same workflow for all languages

### ✅ Maintenance Benefits
- **No hardcoded mappings** - front matter drives configuration
- **Automatic fallbacks** - resilient to missing files
- **Clear patterns** - easy to train new content creators
- **Future-proof** - adapts to new content without code changes

## File Format Guidelines

| Style | Format | Max Size | Quality |
|-------|--------|----------|---------|
| Textured Minimalism | JPG | 300KB | 85% |
| Flat Color | JPG | 200KB | 85% |
| Geometric | JPG | 200KB | 85% |
| Team Photos | JPG | 300KB | 90% |
| Simple Icons | SVG | 20KB | - |
| Complex Icons | PNG | 100KB | - |

## Troubleshooting

**Image not showing:**
- Check if original exists in `originals/` directory with correct naming
- Run processing script: `_scripts/core/process_images.sh collection slug`
- Verify front matter `name` matches filename (minus purpose prefix)
- Check browser console for 404 errors

**Front matter issues:**
- Use `founder:` key (not `founder_portrait:`)
- Use context-aware names (`"formal"` not `"alexei-sokolov-formal"`)
- Ensure identical names across EN/RU/ZH versions
- Follow `purpose: name: "description"` pattern

**Processing issues:**
- Ensure ImageMagick is installed: `magick -version`
- Check original file dimensions and format
- Verify directory structure matches expected pattern
- Review script output for error messages

## Quality Control Checklist

### ✅ Before Processing
- [ ] Context-aware naming pattern followed
- [ ] Correct aspect ratio (3:2 horizontal, 2:3 vertical)
- [ ] High quality source image (>1200px on long side)
- [ ] File size optimized for web (<300KB)
- [ ] Descriptive filename without redundancy

### ✅ After Processing
- [ ] All 3 responsive sizes generated (400w, 800w, 1200w)
- [ ] Front matter matches processed filenames
- [ ] Images display correctly across all breakpoints
- [ ] Alt text is descriptive and accessible
- [ ] Cross-language versions have identical image names

### ✅ System Integration
- [ ] Components use `collection-image.html` system
- [ ] Fallback system working (test with missing files)
- [ ] Loading performance acceptable
- [ ] No broken image icons visible
- [ ] Language switching maintains image consistency
