# Brandmine Brand Creation Cheat Sheet

*Last updated: May 2, 2025*

## 1. Choose Template Type

### Core Template
- **When to use**: Quick entry with minimal information
- **Path**: `_templates/brands/brand-core.md`
- **Time required**: ~5 minutes

### Lite Template
- **When to use**: Standard non-featured brands with moderate information
- **Path**: `_templates/brands/brand-lite.md`
- **Time required**: ~15 minutes

### Full Template
- **When to use**: Featured brands with comprehensive information
- **Path**: `_templates/brands/brand-full.md`
- **Time required**: ~30-60 minutes

## 2. Create Brand Files

### English Version (Required)
1. Copy template to: `_brands/en/[brand-slug].md`
2. Update front matter and content

### Russian Version (Optional)
1. Copy template to: `_brands/ru/[brand-slug].md`
2. Translate content 
3. Update `lang: ru` in front matter
4. Update permalink to `/ru/brands/[country_code]/[brand-slug]/`

### Chinese Version (Optional)
1. Copy template to: `_brands/zh/[brand-slug].md`
2. Translate content
3. Update `lang: zh` in front matter
4. Update permalink to `/zh/brands/[country_code]/[brand-slug]/`

## 3. Required Front Matter Fields

```yaml
# Always include these (all templates)
layout: brand
title: "Brand Name"
slug: brand-slug
ref: brand-slug
country_code: "xx"  # Two-letter code: ru, cn, in, br, za
lang: en
permalink: /en/brands/ru/teatime/  # HARDCODE the actual values

# Core categorization
sectors: [primary-sector]  # Use kebab-case dimension slugs
markets: [country-code]  # Use kebab-case dimension slugs
attributes: [attribute1, attribute2]  # Optional for core template
signals: [signal1, signal2]  # Optional for core template

# Basic essentials
description: "Brief description (1-2 sentences)."
founding_year: YYYY
website: "https://example.com"

# Founder information
founder:
  name: "Founder Name"
  founder_led: true

# Location
location:
  country_code: "xx"  # Two-letter country code
  city: "City Name"
  coordinates: [longitude, latitude]

# Content status
featured: false
featured_level: 0  # 0=basic, 1=map marker, 2=full profile
location_intelligence: false
```

## 4. Prepare & Process Images

### Create Image Directory
```bash
mkdir -p assets/images/brands/[country_code]/[brand-slug]/originals
```

### Prepare Required Images
1. **Logo**: 400×400px PNG with transparency
   - Name: `logo-color.png`
2. **Hero**: 1200×800px JPG 
   - Name: `hero-main.jpg`
3. **Founder**: 800×1200px JPG (portrait orientation)
   - Name: `founder-portrait.jpg`

### Process Images
```bash
./_scripts/process_brand_images.sh [country_code] [brand-slug]
```

## 5. Update Front Matter Image Paths

Use hardcoded paths for reliability:

```yaml
logo: "/assets/images/brands/ru/teatime/originals/logo-color.png"
hero_image: "/assets/images/brands/ru/teatime/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/ru/teatime/originals/founder-portrait.jpg"
```

## 6. Required Content Sections

### Core Template
```markdown
## About [Brand Name]
Brief description of the brand, history, offerings.

## Founder's Journey
Brief founder information here.

## Market Presence
The brand operates locally in its home region.
```

### Lite/Full Templates
Additional sections:
```markdown
## Product Range
Overview of main product lines.

## Market Presence
Regional distribution information.

## Certifications & Recognition (Full only)
Major awards and certifications.

## International Presence (Full only)
Global distribution and strategy.
```

## 7. Testing

1. Start local server: `bundle exec jekyll serve`
2. Visit brand page: `http://localhost:4000/en/brands/[country_code]/[brand-slug]/`
3. Check for:
   - All images loading correctly
   - All front matter rendering properly
   - Content sections displaying appropriately
   - No build errors

## 8. Example Quick Workflow (Core)

1. Copy `_templates/brands/brand-core.md` to `_brands/en/teatime.md`
2. Update minimum fields:
   ```yaml
   title: "TeaTime"
   slug: teatime
   country_code: "ru"
   permalink: /en/brands/ru/teatime/ # Hardcoded
   sectors: [gourmet-foods]  # Using kebab-case
   markets: [russia]  # Using kebab-case
   description: "Premium artisanal tea brand from Moscow."
   founding_year: 1998
   website: "https://teatime.ru"
   founder:
     name: "Alexei Sokolov"
     founder_led: true
   location:
     country_code: "ru"
     city: "Moscow"
     coordinates: [37.6173, 55.7558]
   logo: "/assets/images/brands/ru/teatime/originals/logo-color.png"
   hero_image: "/assets/images/brands/ru/teatime/originals/hero-main.jpg"
   founder_portrait: "/assets/images/brands/ru/teatime/originals/founder-portrait.jpg"
   ```
3. Add 3 basic content sections
4. Prepare and process images
5. Test brand page

## 9. Testing Dynamic Permalinks (Optional)

To test if Jekyll handles dynamic fields in permalinks correctly:

1. Create a test file: `_brands/en/test-dynamic.md`
2. Include dynamic permalink:
   ```yaml
   ---
   layout: brand
   title: "Test Dynamic"
   slug: test-dynamic
   country_code: "test"
   lang: en
   permalink: /en/brands/{{ page.country_code }}/{{ page.slug }}/
   ---
   Test content
   ```
3. Build site: `bundle exec jekyll build`
4. Check if `/en/brands/test/test-dynamic/index.html` exists in `_site` directory
5. If the file exists with correct path, dynamic permalinks work; if not, continue using hardcoded paths