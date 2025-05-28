# Brand Profile Templates Usage Guide

This directory contains templates for creating comprehensive brand profiles with multilingual support and automated JSON generation.

## Available Template

- `brand_profile.md` - Comprehensive brand profile template with full feature set

## Template Overview

The brand profile template uses a **hybrid approach** that combines:
- **Human-friendly YAML** front matter for easy editing
- **Auto-generation capabilities** for JSON exports (Airtable compatibility)
- **Linear layout architecture** with modular sections
- **Multilingual support** for English, Russian, and Chinese
- **Semantic image handling** with responsive generation

## Using the Template

### 1. Basic Setup
Copy the template and replace core placeholders:

```
xx-brandslug → actual brand slug (e.g., "ru-teatime")
Brand Name → actual brand name
YYYY → founding year
https://example.com → actual website
```

### 2. Section Control
The template uses a `sections` array to control page layout:

```yaml
sections:
  - breadcrumbs           # Navigation breadcrumbs
  - hero                  # Brand hero panel
  - identity              # Brand logo, basic info
  - founder-narrative     # Founder story and journey
  - brand-story          # About the brand
  - product              # Product range and offerings
  - market-presence      # Market position and distribution
  - location-intelligence # Map and geographic context
  - growth-signals       # Business signals and opportunities
  - connections          # Related brands and insights
```

**Toggle sections on/off** by commenting out or removing lines from the array.

### 3. File Placement
Save completed files to:
```
_brands/en/[brand-slug].md
```

Examples:
- `_brands/en/ru-teatime.md`
- `_brands/en/br-serra-verde.md`
- `_brands/en/in-spice-masters.md`

### 4. Image Organization
Brand images follow a semantic structure:

```yaml
images:
  logo:
    name: "color"     # Becomes logo-color-400w.png
    ext: "png"
  hero:
    name: "storefront"  # Becomes hero-storefront-400w.jpg
    ext: "jpg"
  founder:
    name: "portrait"    # Becomes founder-portrait-400w.jpg
    ext: "jpg"
```

**Image files should be placed in**:
```
assets/images/brands/[brand-slug]/
├── logo-color.png
├── hero-storefront.jpg
├── founder-portrait.jpg
└── [additional images]
```

## Required Front Matter Fields

### Core Information
```yaml
layout: brand-profile
ref: xx-brandslug  # Global brand ID
title: "Brand Name"
lang: en
permalink: /en/brands/xx-brandslug/
```

### Taxonomy (Must Use Valid Slugs)
```yaml
sectors: ["gourmet-foods"]       # Must match _dimensions/en/sectors/
markets: ["brazil"]              # Must match _dimensions/en/markets/
attributes: ["founder-led"]      # Must match _dimensions/en/attributes/
signals: ["export-ready"]       # Must match _dimensions/en/signals/
```

**Valid taxonomy slugs can be found in**:
- `_dimensions/en/sectors/` for sector options
- `_dimensions/en/markets/` for market options  
- `_dimensions/en/attributes/` for attribute options
- `_dimensions/en/signals/` for signal options

### Location Information
```yaml
location:
  lat: -22.6569        # Decimal latitude
  lng: -45.8558        # Decimal longitude
  city: "City Name"
  region: "State/Province"  # Optional
  country: "br"        # ISO 3166-1 alpha-2 code
```

### Founder Information
```yaml
founders:
  - id: "xx-founder-slug"  # Links to founder profile
    name: "Founder Name"   # Human-readable name
    role: "CEO & Founder"  # Optional role
founder_led: true          # Boolean flag
```

## JSON Generation

### Automatic Export
When `generate_json: true` is set, brand data will be included in automated JSON exports:

```bash
python3 _scripts/generate_search_index.py
```

This generates:
- `_data/brands.json` - Complete brand index for search and filtering
- `assets/data/brands.json` - Public API endpoint

### Sample Data Flag
Use `sample_data: true` for test brands that should not appear in production exports.

## Content Guidelines

### Brand Story Content
Write 4-6 paragraphs covering:

1. **Opening Hook** (100-150 words)
   - What makes this brand unique?
   - Key achievement or positioning statement

2. **Founding Story** (150-200 words)
   - How the brand was created
   - Founder's motivation and vision
   - Early challenges and breakthroughs

3. **Product Excellence** (150-200 words)
   - What products/services they offer
   - Quality standards and unique features
   - Production methods or innovation

4. **Market Impact** (100-150 words)
   - Market position and recognition
   - Growth metrics or expansion
   - Customer testimonials or awards

5. **Future Vision** (100-150 words)
   - Expansion plans or new initiatives
   - Industry leadership role
   - Long-term goals

### Writing Standards
- **Clear, engaging language** accessible to international readers
- **Specific examples and metrics** rather than generic claims
- **Cultural context** for international understanding
- **Forward-looking perspective** emphasizing growth potential
- **SEO-friendly** with natural keyword integration

## Timeline & Milestones

Document key brand moments:

```yaml
timeline:
  - year: 1986
    event: "Company founded in São Paulo"
  - year: 2010
    event: "First international export to USA"
  - year: 2020
    event: "Achieved organic certification"
  - year: 2024
    event: "Opened second production facility"
```

## Business Information

### Export Readiness
```yaml
export_ready: true
export_markets: ["us", "ca", "de"]  # ISO country codes
distribution_models:
  - "direct-export"
  - "distributors"
  - "e-commerce"
```

### Certifications
```yaml
certifications:
  - name: "Organic Certification"
    year: 2017
    authority: "IFOAM"  # Optional
  - name: "Fair Trade Certified"
    year: 2019
    authority: "Fair Trade USA"
```

## Image Processing

After creating a brand profile, process images with:

```bash
./_scripts/process_images.sh brands [brand-slug]
```

This generates:
- Multiple responsive sizes (400w, 800w, 1200w, 1600w)
- Optimized file compression
- WebP format alternatives (if supported)

Add image attributions:
```bash
./_scripts/add_image_attribution.py brands [brand-slug]
```

## Multilingual Implementation

### Translation Structure
The template includes placeholders for translations:

```yaml
translations:
  ru:
    title: "Название на русском"
    description: "Описание на русском"
  zh:
    title: "中文品牌名"
    description: "中文描述"
```

### Creating Language Versions
1. Copy English version to language-specific folders:
   ```
   _brands/ru/[brand-slug].md
   _brands/zh/[brand-slug].md
   ```

2. Update `lang` and `permalink` fields:
   ```yaml
   lang: ru
   permalink: /ru/brands/[brand-slug]/
   ```

3. Translate content while keeping front matter structure identical

## Quality Assurance

### Pre-Publishing Checklist
- [ ] Replace all `xx-` placeholders with actual values
- [ ] Verify all taxonomy slugs exist in `_dimensions/` folders
- [ ] Confirm location coordinates are accurate
- [ ] Test that founder slug matches existing founder profile
- [ ] Ensure all required images are processed and optimized
- [ ] Validate front matter YAML syntax
- [ ] Check that permalink follows correct pattern
- [ ] Verify content meets length guidelines (800-1200 words)
- [ ] Proofread for grammar and clarity
- [ ] Test page generation locally

### Validation Commands
```bash
# Check YAML syntax
./_scripts/validate_yaml.sh

# Verify multilingual consistency
./_scripts/check_language_consistency.sh

# Test local generation
bundle exec jekyll serve
```

## Advanced Features

### Custom Sections
Override default sections for unique brand needs:

```yaml
sections:
  - breadcrumbs
  - hero
  - identity
  - custom-section-name
  - connections
```

Ensure corresponding include exists at:
`_includes/pages/brand/custom-section-name.html`

### Additional Front Matter
Add custom fields for specific brand requirements:

```yaml
special_recognition:
  - "UNESCO World Heritage Supplier"
  - "Government Export Champion"
  
sustainability_metrics:
  carbon_neutral: true
  renewable_energy: 85
  waste_reduction: 70
```

Access in templates with `{{ page.special_recognition }}` or `{{ page.sustainability_metrics }}`.

### Gallery Management
Add multiple images for brand galleries:

```yaml
gallery:
  - name: "production-facility"
    ext: "jpg"
    caption: "Modern production facility"
  - name: "product-range"
    ext: "jpg"
    caption: "Complete product range"
  - name: "team-photo"
    ext: "jpg"
    caption: "Our dedicated team"
```

## Integration Points

### Founder Profiles
- Brand `founders` array must match existing founder profile `ref` values
- Founder profiles will automatically show associated brands
- Ensures bidirectional linking between brands and founders

### Dimension Pages
- Brand taxonomy tags automatically appear on relevant dimension pages
- Dimension pages show related brands based on taxonomy matching
- Maintains consistent cross-referencing throughout site

### Search & Discovery
- All brand data feeds into site-wide search functionality
- Filtering system uses taxonomy fields for multi-dimensional discovery
- Map integration uses location coordinates for geographic visualization

---

*This template follows the "logic-light" architecture and linear layout system established for the Brandmine site. All brands use semantic sectioning without sidebar complexity for MVP simplicity and scalability.*