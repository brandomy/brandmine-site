# Brand Profile Creation Tutorial - Strategic Content Edition

**Complete guide to creating conversion-optimized brand profiles that showcase BRICS+ brand potential**

---

## 🎯 Overview

Brand profiles are the core content type in Brandmine, showcasing narrative-rich consumer brands from BRICS+ countries. The system has been enhanced with strategic content fields that transform profiles from data displays into conversion tools that answer "Why should I care?" while positioning emerging markets as opportunities, not risks.

### Strategic Enhancement Goals
- **Lead with compelling value propositions** that immediately communicate brand value
- **Showcase founder credibility** through achievements and personal stories
- **Highlight business scale** with metrics and market context
- **Position BRICS+ markets** as legitimate, high-potential opportunities
- **Build trust through specificity** using concrete achievements and data

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

# Section control (customize as needed)
sections:
  - breadcrumbs
  - identity
  - founder-narrative
  - content
  - business-intelligence
  - location-intelligence
  - connections

# Core taxonomy (required)
markets: ["brazil"]
sectors: ["artisanal-spirits", "gourmet-foods"]
attributes: ["founder-led", "heritage-brand", "sustainability-pioneer"]
signals: ["export-ready", "rapid-growth"]

# 🎯 STRATEGIC CONTENT (New Requirements for Enhanced Cards)
value_proposition: "Brazil's premier guaraná artisan bringing 100-year Amazon family traditions to premium global beverage markets"
founder_display_name: "Carlos Silva"
founder_role: "Founder & Master Blender"

# 📊 Business Credibility (Key Metric)
key_metric:
  label: "International Markets"
  value: "12 Countries"
  period: "Since 2019"

# 🏆 Enhanced Credibility Signals
breakthrough_moment: "First Brazilian guaraná brand to achieve international organic certification"
credibility_signals:
  - "100-year family heritage"
  - "Amazon sustainability certified"
  - "Export quality standards"

# Location (required)
location:
  lat: -3.1190
  lng: -60.0217
  city: "Manaus"
  region: "Amazonas"
  country: "br"

# Enhanced founder information
founder:
  name: "Carlos Silva"
  position: "Founder & Master Blender"
  story: "Third-generation guaraná farmer turned premium beverage artisan"
  generation: "3rd Generation"
  founder_led: true

# Business details (enhanced for credibility)
founding_year: 2015
website: "https://guaranaartisans.com"
employees: 24
annual_revenue: 2800000
export_markets: ["us", "de", "fr", "jp", "ca", "au", "se", "dk", "no", "fi", "nl", "be"]
certifications: ["Organic", "Fair Trade", "Amazon Stewardship"]

# Images (semantic structure)
images:
  logo:
    name: "color"
    ext: "png"
  hero:
    name: "production"
    ext: "jpg"
  founder:
    name: "portrait"
    ext: "jpg"

# Contact information
contact:
  email: "carlos@guaranaartisans.com"
  phone: "+55 92 3234-5678"

# Social media
social:
  instagram: "@guaranaartisans"
  facebook: "guaranaartisansbr"
  linkedin: "company/guarana-artisans"

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

location:
  lat: -3.1190
  lng: -60.0217
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

location:
  lat: -3.1190
  lng: -60.0217
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
- `hero-production.jpg` - 3:2 aspect ratio (1200×800px), JPG
- `founder-portrait.jpg` - 2:3 aspect ratio (800×1200px), JPG

### Step 4: Process Images

```bash
# Process all brand images with responsive versions
_scripts/core/process_images.sh brands br-guarana-artisans
```

This generates:
- `logo-color-400w.png`, `logo-color-800w.png`
- `hero-production-400w.jpg`, `hero-production-800w.jpg`, `hero-production-1200w.jpg`
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
```yaml
sections:
  - breadcrumbs           # Always first
  - identity             # Brand hero
  - founder-narrative    # Founder story
  - content              # Main content
  - business-intelligence # Growth data
  - location-intelligence # Geographic context
  - connections          # Related content
```

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

# Location (required)
location:
  lat: -22.6569
  lng: -45.8558
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

# Images (semantic structure)
images:
  logo:
    name: "color"
    ext: "png"
  hero:
    name: "storefront"
    ext: "jpg"
  founder:
    name: "portrait"
    ext: "jpg"

# Contact & social
contact:
  email: "info@brand.com"
  phone: "+55 11 1234-5678"

social:
  instagram: "@brandname"
  facebook: "brandpage"
  linkedin: "company/brand"

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
- **Naming**: `hero-[description].jpg`
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
- [ ] Content renders correctly in all sections
- [ ] Navigation and breadcrumbs work
- [ ] Brand appears in search index
- [ ] Related founder profiles link correctly

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