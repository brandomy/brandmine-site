# Brand Profile Creation Tutorial

**Complete guide to creating rich brand profiles in the Brandmine system**

---

## 🎯 Overview

Brand profiles are the core content type in Brandmine, showcasing narrative-rich consumer brands from BRICS+ countries. The system uses a hybrid architecture that supports both curated YAML profiles with rich content and basic JSON-only profiles for simple listings.

### "Logic Light" Architecture
Brand profiles exemplify Brandmine's data-driven "Logic Light" philosophy:
- **Configuration over conditionals** using `_data/page_sections.yml`
- **Centralized component defaults** via `_data/component_defaults.yml`
- **Section-based rendering** through `helpers/page-sections.html`
- **Linear layout requirements** eliminating sidebar complexity
- **Consistent behavior patterns** across all content types

### Architecture Highlights
- **Data-driven sections** with configurable layouts
- **Semantic image structure** with responsive processing
- **Multilingual support** across EN/RU/ZH
- **Taxonomy integration** with four dimension types
- **Linear sectioning** optimized for mobile-first design

---

## 🏗️ Brand Profile Architecture

### Data Sources
Brand profiles pull from two potential sources:
1. **Curated YAML files** - Rich markdown content with full section support
2. **JSON index** - Basic brand information for simple listings

### Page Structure
```
Layout: brand-profile.html → helpers/page-sections.html → pages/brand/[section].html
```

### Available Sections
- `breadcrumbs` - Navigation context
- `identity` - Brand name, logo, description, taxonomy tags
- `founder-narrative` - Founder information with profile links
- `content` - Rich markdown content area
- `business-intelligence` - Growth signals, export readiness, partnerships
- `location-intelligence` - Geographic context and mapping
- `connections` - Related brands and insights

---

## 📝 Step-by-Step Tutorial: Creating "Brazilian Guaraná Artisans"

### Step 1: Generate Template Files

```bash
# Use the brand template generator
python3 _scripts/content-creation/generate_brand_template.py

# When prompted:
# Template type: brand
# Market code: br
# Brand name: guarana-artisans
```

This creates files in all three languages:
- `_brands/en/br-guarana-artisans.md`
- `_brands/ru/br-guarana-artisans.md`
- `_brands/zh/br-guarana-artisans.md`

### Step 2: Configure Brand Front Matter

Edit each language file with this structure:

**File: `_brands/en/br-guarana-artisans.md`**
```yaml
---
layout: brand-profile
ref: br-guarana-artisans
title: "Guaraná Artisans"
description: "Premium guaraná beverages crafted using traditional Amazonian methods"
lang: en
permalink: /en/brands/br-guarana-artisans/

# === SECTIONS ===
# Section order controlled by _data/page_sections.yml based on layout type
# No sections: array needed in front matter - uses centralized configuration

# Available sections for this content type:
# - breadcrumbs, identity, founder-narrative, content, business-intelligence, location-intelligence, connections

# Core taxonomy (required)
markets: ["brazil"]
sectors: ["artisanal-spirits", "gourmet-foods"]
attributes: ["founder-led", "heritage-brand", "sustainability-pioneer"]
signals: ["export-ready", "rapid-growth"]

# Location (required - flattened structure)
latitude: -3.1190
longitude: -60.0217
city: "Manaus"
region: "Amazonas"
country: "br"

# Founder information
founder:
  name: "Carlos Silva"
  position: "Founder & Master Blender"
  story: "Third-generation guaraná farmer turned premium beverage artisan"
  generation: "3rd Generation"
  founder_led: true

# Business details
founding_year: 2015
website: "https://guaranaartisans.com"
employees: 24
annual_revenue: 2800000

# Images (semantic structure - context-aware naming)
images:
  logo:
    name: "color"     # Brand identity: color, mono, white
    ext: "png"
  hero:
    name: "farmland"  # Context-aware: farmland, workshop, lobby, ceremony
    ext: "jpg"
  founder:
    name: "portrait"  # Generic: portrait (standardized across all content)
    ext: "jpg"

# Contact information
contact:
  email: "carlos@guaranaartisans.com"
  phone: "+55 92 3234-5678"

# Social media (flattened structure)
social_instagram: "@guaranaartisans"
social_facebook: "guaranaartisansbr"
social_linkedin: "company/guarana-artisans"

# Certifications
certifications:
  - name: "Organic Brazil Certification"
    year: 2017
  - name: "Fair Trade Certified"
    year: 2018

# Recognition
awards:
  - title: "Best Amazonian Beverage"
    organization: "Brazil Food Awards"
    year: 2022

# Export markets
export_markets: ["usa", "canada", "germany", "japan"]

# Product lines
product_lines:
  - name: "Traditional Guaraná"
    description: "Classic preparation using ancestral methods"
  - name: "Amazonian Blend"
    description: "Premium blend with açaí and caju"
---

# Guaraná Artisans: Preserving Amazonian Tradition

Founded in the heart of the Amazon rainforest, Guaraná Artisans represents the perfect harmony between ancient indigenous wisdom and modern sustainable business practices.

## Our Story

Carlos Silva inherited more than just a guaraná farm from his grandfather – he inherited a legacy of traditional knowledge spanning three generations. What began as a small family operation in Manaus has evolved into Brazil's premier artisanal guaraná beverage company.

## Traditional Methods, Modern Quality

Our guaraná fruits are still hand-harvested using traditional methods passed down through generations of indigenous communities. Each batch undergoes our proprietary fermentation process that enhances the natural caffeine content while developing the distinctive nutty, fruity flavor profile that makes our beverages unique.

## Sustainability Commitment

- **Direct trade relationships** with 15 indigenous communities
- **Rainforest conservation** through sustainable harvesting
- **Carbon-neutral production** using solar energy
- **Biodegradable packaging** from renewable materials

## Export Success

Our products are now available in premium health food stores across North America, Europe, and Asia, introducing the world to authentic Amazonian guaraná culture.
```

**File: `_brands/ru/br-guarana-artisans.md`**
```yaml
---
layout: brand-profile
ref: br-guarana-artisans
title: "Гуарана Ремесленники"
description: "Премиальные напитки из гуараны, изготовленные по традиционным амазонским методам"
lang: ru
permalink: /ru/brands/br-guarana-artisans/

# [Same structure as EN, with Russian translations]
markets: ["brazil"]
sectors: ["artisanal-spirits", "gourmet-foods"]
attributes: ["founder-led", "heritage-brand", "sustainability-pioneer"]
signals: ["export-ready", "rapid-growth"]

latitude: -3.1190
longitude: -60.0217
city: "Манаус"
region: "Амазонас"
country: "br"

founder:
  name: "Карлос Силва"
  position: "Основатель и мастер-блендер"
  story: "Фермер гуараны в третьем поколении, ставший ремесленником премиальных напитков"
  generation: "3-е поколение"
  founder_led: true

# [Rest of fields same as EN with Russian content]
---

# Гуарана Ремесленники: Сохранение Амазонских Традиций

[Russian content translation...]
```

**File: `_brands/zh/br-guarana-artisans.md`**
```yaml
---
layout: brand-profile
ref: br-guarana-artisans
title: "瓜拉那工匠"
description: "采用传统亚马逊方法制作的优质瓜拉那饮料"
lang: zh
permalink: /zh/brands/br-guarana-artisans/

# [Same structure with Chinese translations]
markets: ["brazil"]
sectors: ["artisanal-spirits", "gourmet-foods"]
attributes: ["founder-led", "heritage-brand", "sustainability-pioneer"]
signals: ["export-ready", "rapid-growth"]

latitude: -3.1190
longitude: -60.0217
city: "马瑙斯"
region: "亚马逊州"
country: "br"

founder:
  name: "卡洛斯·席尔瓦"
  position: "创始人兼首席调配师"
  story: "第三代瓜拉那农民转变为优质饮料工匠"
  generation: "第三代"
  founder_led: true

# [Rest of fields with Chinese content]
---

# 瓜拉那工匠：传承亚马逊传统

[Chinese content translation...]
```

### Step 3: Set Up Image Structure

Create image directories:
```bash
mkdir -p assets/images/brands/br/guarana-artisans/originals/
```

Add source images following Brandmine standards:
- `logo-color.png` - 1:1 square (512×512px), PNG with transparency
- `hero-farmland.jpg` - 3:2 aspect ratio (1200×800px), JPG (context-aware naming)
- `founder-portrait.jpg` - 2:3 aspect ratio (800×1200px), JPG (generic naming)

### Step 4: Process Images

```bash
# Process all brand images with responsive versions
_scripts/core/process_images.sh brands br-guarana-artisans
```

This generates:
- `logo-color-400w.png`, `logo-color-800w.png`
- `hero-farmland-400w.jpg`, `hero-farmland-800w.jpg`, `hero-farmland-1200w.jpg`
- `founder-portrait-400w.jpg`, `founder-portrait-800w.jpg`, `founder-portrait-1200w.jpg`

### Step 5: Update Search Index

```bash
# Generate updated brands JSON index
python3 _scripts/core/generate-all-json.py
```

This updates `_data/brands.json` with your new brand data.

---

## 🎛️ Section Control Guide

### Core Sections (Always Include)
- `breadcrumbs` - Navigation context
- `identity` - Brand hero with logo, name, taxonomy

### Content Sections
- `founder-narrative` - Founder information and story
- `content` - Main markdown content area

### Intelligence Sections
- `business-intelligence` - Growth signals, partnerships, export data
- `location-intelligence` - Geographic context, mapping

### Relationship Sections
- `connections` - Related brands and insights

### Section Order Best Practices
**Section order is automatically controlled by `_data/page_sections.yml` for the `brand-profile` layout type:**

1. **breadcrumbs** - Always first (navigation context)
2. **identity** - Brand hero (name, logo, taxonomy)
3. **founder-narrative** - Founder story and links
4. **content** - Main markdown content area
5. **business-intelligence** - Growth signals and export data
6. **location-intelligence** - Geographic context and mapping
7. **connections** - Related brands and insights

**No configuration needed** - the system automatically renders sections in optimal order for mobile-first design.

---

## 🏗️ Architecture Note: "Logic Light" Section Control

Brandmine uses a sophisticated **centralized section control system** that eliminates complexity while maintaining full configurability:

### How It Works
- **Section order** is controlled by `_data/page_sections.yml` based on your layout type
- **Component behavior** is configured in `_data/component_defaults.yml`
- **No template logic** required in individual content files
- **Consistent rendering** across all content types

### Benefits
- **70% faster builds** (reduced from 40+ seconds to 12-13 seconds)
- **Zero section configuration** needed in front matter
- **Consistent behavior** across all content types
- **Easy maintenance** - change section order globally in one file
- **Mobile-first guarantee** - linear flow ensures consistent mobile behavior

### Performance Achievements
The "Logic Light" architecture delivers measurable benefits:

- **Build Time**: 70% reduction (from 40+ seconds to 12-13 seconds)
- **Template Complexity**: 90% reduction in conditional logic
- **Maintenance Overhead**: Centralized configuration eliminates scattered section management
- **Mobile Consistency**: Linear layout ensures optimal mobile behavior without responsive complexity
- **Developer Experience**: Content creators focus on content, not configuration

**Real-World Impact**: These optimizations enable rapid content creation while maintaining sophisticated functionality across three languages and multiple content types.

### What This Means for Content Creators
You don't need to specify `sections:` arrays in your front matter. Simply use the correct layout type, and the system automatically renders the appropriate sections in the optimal order.

---

## 📋 Required Front Matter Fields

### Essential Fields
```yaml
layout: brand-profile     # Required: layout type
ref: br-brand-slug       # Required: global brand ID
title: "Brand Name"      # Required: display name
description: "Brief description"  # Required: meta description
lang: en                 # Required: language code
permalink: /en/brands/br-brand-slug/  # Required: full URL

# Core taxonomy (at least one market and sector required)
markets: ["brazil"]
sectors: ["gourmet-foods"]
attributes: ["founder-led"]  # Optional
signals: ["export-ready"]   # Optional

# Location (required - flattened structure)
latitude: -22.6569
longitude: -45.8558
city: "City Name"
region: "State/Province"
country: "br"
```

### Optional Enhancement Fields
```yaml
# Founder information
founder:
  name: "Founder Name"
  position: "Title"
  story: "Brief founder story"
  generation: "1st Generation"
  founder_led: true

# Business details
founding_year: 2015
website: "https://brand.com"
employees: 24
annual_revenue: 2800000

# Images (semantic structure - context-aware naming)
images:
  logo:
    name: "color"     # Brand identity: color, mono, white
    ext: "png"
  hero:
    name: "farmland"  # Context-aware: farmland, workshop, lobby, ceremony, distillery
    ext: "jpg"
  founder:
    name: "portrait"  # Generic: portrait (standardized across all content)
    ext: "jpg"

# Contact & social (flattened structure)
contact:
  email: "info@brand.com"
  phone: "+55 11 1234-5678"

social_instagram: "@brandname"
social_facebook: "brandpage"
social_linkedin: "company/brand"

# Achievements
certifications:
  - name: "Organic Certification"
    year: 2020

awards:
  - title: "Best Product Award"
    organization: "Industry Awards"
    year: 2022

# Export data
export_markets: ["usa", "germany", "japan"]

# Product information
product_lines:
  - name: "Product Line Name"
    description: "Product description"
```

---

## 🖼️ Image Standards & Processing

### Image Types & Specifications

**Logo Images**
- **Aspect ratio**: 1:1 square
- **Source size**: 512×512px minimum
- **Format**: PNG with transparency
- **Naming**: `logo-color.png`, `logo-mono.png`
- **Usage**: Brand identity, cards, headers

**Hero Images**
- **Aspect ratio**: 3:2 horizontal
- **Source size**: 1200×800px minimum
- **Format**: JPG
- **Style**: Textured Minimalism (TM)
- **Naming**: `hero-[context-aware-description].jpg` (e.g., farmland, workshop, lobby, ceremony)
- **Usage**: Page headers, featured displays

**Founder Portraits**
- **Aspect ratio**: 2:3 vertical
- **Source size**: 800×1200px minimum
- **Format**: JPG
- **Style**: Natural photography with teal filter
- **Naming**: `founder-portrait.jpg`
- **Usage**: Founder narrative sections

### Image Processing Workflow

1. **Place originals** in `assets/images/brands/[country]/[brand]/originals/`
2. **Run processing script**: `_scripts/core/process_images.sh brands [country]-[brand]`
3. **Verify outputs** in brand directory with responsive versions

### Visual Style Guidelines

- **Textured Minimalism (TM)**: Hero images, brand storytelling
- **Natural Photography + Teal Filter**: Founder portraits, team photos
- **Consistent branding**: All images follow Brandmine aesthetic standards

### Image Naming Standardization

**Context-Aware Naming Strategy**: Use semantic descriptions that focus on the scene/content rather than location-specific details:

**✅ Good Examples:**
- `hero: name: "farmland"` (describes the scene)
- `hero: name: "workshop"` (describes the setting)
- `hero: name: "lobby"` (describes the space)
- `hero: name: "ceremony"` (describes the activity)

**❌ Avoid Location-Specific Names:**
- `hero: name: "krasnodar-vineyard"` (too location-specific)
- `hero: name: "moscow-spice-market"` (redundant with directory context)
- `hero: name: "paraty-view"` (location already implied)

**Cross-Language Consistency**: All three language versions (EN/RU/ZH) must use identical image names:
```yaml
# _brands/en/br-brand.md
hero: name: "farmland"

# _brands/ru/br-brand.md  
hero: name: "farmland"  # ✅ Same name

# _brands/zh/br-brand.md
hero: name: "farmland"  # ✅ Same name
```

---

## 🌐 Multilingual Implementation

### Language File Structure
```
_brands/
├── en/br-guarana-artisans.md
├── ru/br-guarana-artisans.md
└── zh/br-guarana-artisans.md
```

### Translation Requirements
- **Identical structure** across all languages
- **Same taxonomy** (dimension slugs don't translate)
- **Localized content** (title, description, markdown content)
- **Consistent permalinks** with language prefixes

### Language Switching
- Uses `ref` field to link language versions
- Automatic language detection in navigation
- Fallback support for missing translations

---

## 🔍 Taxonomy & Dimensions

### Four Dimension Types
- **Markets**: Geographic focus (brazil, china, russia, etc.)
- **Sectors**: Industry categories (wine, natural-beauty, gourmet-foods, etc.)
- **Attributes**: Brand qualities (founder-led, heritage-brand, etc.)
- **Signals**: Growth indicators (export-ready, rapid-growth, etc.)

### Taxonomy Rules
- **At least one market** and **one sector** required
- **Use existing dimension slugs** only
- **Validate against** `_dimensions/{lang}/{type}/` files
- **Color coding**: Markets=blue, Sectors=olive, Attributes=orange, Signals=purple

### Adding New Dimensions
If you need dimensions that don't exist:
1. Create dimension files in all languages
2. Add to `_data/dimensions_config.yml`
3. Add translations to `_data/translations/{lang}.yml`
4. Follow dimension creation workflow in `daily-workflows.md`

---

## 🧪 Testing & Validation

### Build and Test
```bash
# Start development server
bundle exec jekyll serve --livereload

# Test URLs
# EN: http://localhost:4000/en/brands/br-guarana-artisans/
# RU: http://localhost:4000/ru/brands/br-guarana-artisans/
# ZH: http://localhost:4000/zh/brands/br-guarana-artisans/
```

### Validation Checks
```bash
# Validate YAML syntax
_scripts/validation/validate_yaml.sh

# Check language consistency
_scripts/validation/language_consistency_checker.py

# Run full validation suite
_scripts/core/pre-commit_check.sh

# Verify search index generation
python3 _scripts/core/generate-all-json.py
```

### Quality Checklist
- [ ] All three language files created
- [ ] Front matter validates successfully
- [ ] Required taxonomy dimensions exist
- [ ] Images processed and responsive
- [ ] **Image names identical across all languages**
- [ ] **Hero names use context-aware patterns (farmland, workshop, lobby)**
- [ ] **Founder images use generic "portrait" naming**
- [ ] Content renders correctly in all sections
- [ ] Navigation and breadcrumbs work
- [ ] Brand appears in search index
- [ ] Related founder profiles link correctly

### Image Standardization Validation
```bash
# Check cross-language image consistency
grep -A 6 "images:" _brands/en/brand-slug.md _brands/ru/brand-slug.md _brands/zh/brand-slug.md

# Verify context-aware naming (should show farmland, workshop, etc.)
grep -r "hero:" _brands/en/ | grep "name:"

# Ensure no location-specific names remain
grep -r "krasnodar\|moscow\|paraty" _brands/*/
```

---

## 🚀 Advanced Features

### Founder Integration
Link to founder profiles using consistent naming:
```yaml
# Brand file
founder:
  name: "Carlos Silva"
  
# Corresponding founder file should exist:
# _founders/en/br-carlos-silva.md
```

### Business Intelligence Data
```yaml
# Export performance
export_markets: ["usa", "canada", "germany", "japan"]
export_percentage: 35

# Growth metrics
annual_growth_rate: 23
market_share: 8.5

# Investment status
funding_rounds:
  - type: "Seed"
    amount: 500000
    year: 2020
  - type: "Series A"
    amount: 2000000
    year: 2022
```

### Related Brand Connections
```yaml
# Strategic partnerships
partnerships:
  - brand: "br-sustainable-packaging"
    type: "Supply Chain"
  - brand: "usa-natural-distributors"
    type: "Distribution"

# Brand family relationships
brand_family:
  parent_company: "Amazonian Beverages Group"
  sister_brands: ["br-acai-masters", "br-cupuacu-craft"]
```

### Custom Section Content
Override default sections by creating:
- `_includes/pages/brand/identity-br-guarana-artisans.html` for custom identity section
- `_includes/pages/brand/content-featured.html` for featured brand content style

### Component Defaults Integration
```liquid
{% comment %} Components use centralized defaults from _data/component_defaults.yml {% endcomment %}
{% capture default_show_founder %}{% include helpers/component-defaults.html component="cards.brand-card" param="show_founder" fallback=true %}{% endcapture %}
{% assign show_founder = include.show_founder | default: default_show_founder %}
```

---

## 📋 Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| Images not displaying | Check file paths and run image processing script |
| Taxonomy validation errors | Verify dimension slugs exist in `_dimensions/` |
| Section not rendering | Check section name in front matter and ensure include exists |
| Language switching broken | Verify `ref` field is identical across language files |
| Search index missing brand | Run `generate-all-json.py` script |

### Architecture Validation Commands
```bash
# Verify no legacy section arrays (should return 0)
grep -r "sections:" _brands/ | wc -l

# Check image standardization (should return 0)
grep -r "founder_portrait:" _brands/ | wc -l

# Verify centralized section control
cat _data/page_sections.yml | grep -A 10 "brand-profile:"

# Cross-language image consistency check
grep -A 6 "images:" _brands/en/brand-slug.md _brands/ru/brand-slug.md _brands/zh/brand-slug.md
```

### Performance Validation
```bash
# Test build performance (target: 12-13 seconds)
time JEKYLL_ENV=production bundle exec jekyll build

# If slow, check optimization files exist:
ls _data/language_map.json _data/navigation_cache.json
```

### Debug Commands
```bash
# Check Jekyll syntax
bundle exec jekyll doctor

# Verify file structure
find _brands/ -name "*.md" | head -10

# Test image paths
ls assets/images/brands/br/guarana-artisans/

# Validate dimension references
grep -r "artisanal-spirits" _dimensions/en/sectors/
```

---

## 📚 Reference Files

### Key Templates
- **Brand template**: `_templates/brands/brand_profile.md`
- **Layout**: `_layouts/brand-profile.html`
- **Sections**: `_includes/pages/brand/[section].html`

### Configuration Files
- **Page sections**: `_data/page_sections.yml`
- **Component defaults**: `_data/component_defaults.yml`
- **Dimensions config**: `_data/dimensions_config.yml`

### Scripts
- **Template generator**: `_scripts/content-creation/generate_brand_template.py`
- **Image processing**: `_scripts/core/process_images.sh`
- **JSON generation**: `_scripts/core/generate-all-json.py`

This comprehensive tutorial provides everything needed to create professional brand profiles that leverage Brandmine's data-driven architecture while maintaining consistency across languages and visual standards.