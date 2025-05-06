# Brandmine Brand Templates

This directory contains templates for creating brand profiles at different levels of detail. All templates follow a standardized front matter structure with clear separation between metadata and translatable content.

## Templates

- **brand-core.md**: Absolute minimum required fields (rapid entry)
- **brand-lite.md**: Basic profile with essential sections (standard profiles)
- **brand-full.md**: Comprehensive profile with all possible fields (featured brands)

## Template Comparison

| Feature | Core | Lite | Full |
|---------|------|------|------|
| Basic Information | ✓ | ✓ | ✓ |
| Founder Basic Info | ✓ | ✓ | ✓ |
| Location Basic | ✓ | ✓ | ✓ |
| Taxonomy | Basic | Enhanced | Complete |
| Timeline | - | Basic (3 events) | Extended (5+ events) |
| Social Media | - | ✓ | ✓ |
| Certifications | - | ✓ | ✓ |
| Gallery | - | - | ✓ |
| International | - | Basic | Extended |
| Partnerships | - | - | ✓ |
| Content Sections | 3 | 4 | 7+ |

## Front Matter Structure

Each template uses a consistent structure:

```yaml
---
# ============================================================================
# METADATA SECTION - DO NOT TRANSLATE THESE FIELDS
# Keep these fields exactly as shown, in English, for all language versions
# ============================================================================

# Non-translatable fields (taxonomy, technical information, paths)
# ...

# ============================================================================
# TRANSLATABLE SECTION - TRANSLATE THESE FIELDS FOR EACH LANGUAGE
# Only these fields should be translated when creating RU/ZH versions
# ============================================================================

# Translatable fields (brand name, descriptions, etc.)
# ...
---
```

This clear separation reduces translation errors by explicitly identifying which fields should remain in English across all language versions and which should be localized.

## Required Fields by Template

### Core Template Required Fields
- `layout`, `ref`, `country_code`, `lang`, `permalink`
- `sectors`, `markets`
- `title`, `description`
- `founding_year`, `website`
- `founder.name`, `founder.founder_led`
- `location.country_code`, `location.city`, `location.coordinates`
- `logo`, `hero_image`
- `featured`, `featured_level`

### Lite Template Additional Requirements
- `slogan`
- `founder.story`, `founder.generation`
- `timeline` (at least one milestone)
- At least one `social_media` entry

### Full Template Additional Requirements
- `gallery` (at least 3 images)
- `international` information
- `partnerships` (if seeking investment)
- Extended taxonomy with `subsectors`, `attributes`, `signals`

## Directory Structure

Brand profiles should be organized by language:

```
_brands/
├── en/
│   ├── ru/
│   │   ├── brand-slug-1.md
│   │   └── brand-slug-2.md
│   ├── cn/
│   └── br/
├── ru/
│   ├── ru/
│   ├── cn/
└── zh/
    ├── ru/
    ├── cn/
```

## Usage

1. Copy the appropriate template to `_brands/en/your-brand-name.md`
2. Fill in the required information
3. Process images with `./_scripts/process_brand_images.sh country_code your-brand-name`
4. Test the brand page
5. For translations:
   - Copy the file to `_brands/ru/` or `_brands/zh/`
   - Update `lang` field and `permalink`
   - Translate ONLY the fields in the "TRANSLATABLE SECTION"
   - Keep all fields in the "METADATA SECTION" exactly as in English version

## Key Changes to Note

1. **title** is now used instead of "brand_name" which I mistakenly changed
2. **Founder name** is now a translatable field
3. **Location city and region** are translatable while coordinates remain in metadata
4. **Timeline events, certification names, and gallery captions** are all translatable

## Template Selection Guide

- Use **Core** when only minimal information is available
- Use **Lite** for standard non-featured brands
- Use **Full** for featured brands or when extensive information is available

Brands can be progressively enhanced by starting with the Core template and later upgrading to Lite or Full as more information becomes available.

## Translation Example

### Original English YAML:
```yaml
# METADATA SECTION
sectors: [hotels-resorts]
# ...

# TRANSLATABLE SECTION
title: "Mountain Retreat"
description: "Luxury mountain resort with traditional architecture and modern amenities."
founder:
  name: "John Smith"
location:
  region: "Altai Mountains"
  city: "Belokurikha"
```

### Russian Translation:
```yaml
# METADATA SECTION
sectors: [hotels-resorts]  # Keep unchanged
# ...

# TRANSLATABLE SECTION
title: "Горный Приют"
description: "Роскошный горный курорт с традиционной архитектурой и современными удобствами."
founder:
  name: "Джон Смит"
location:
  region: "Алтайские горы"
  city: "Белокуриха"
```

## Image Organization

Brand images are stored in the following structure:

```
assets/images/brands/[country_code]/[brand-slug]/originals/
├── logo-color.png
├── hero-main.jpg
├── founder-portrait.jpg
├── gallery-image1.jpg
├── gallery-image2.jpg
└── gallery-image3.jpg
```

### Image Naming Convention
- Format: `purpose-description.ext`
- Examples:
  - `logo-color.png` - Brand logo with color
  - `hero-storefront.jpg` - Hero image of storefront
  - `founder-portrait.jpg` - Portrait of founder
  - `gallery-product-line.jpg` - Gallery image of product line

### Processing Images

After placing original images in the appropriate folder:

```bash
# For basic brand images
./_scripts/process_brand_images.sh ru teatime

# For additional assets
./_scripts/process_brand_images.sh ru teatime --add-gallery
```

## Slug Reference Chart

### Sectors
- `artisan-confectionery`, `artisanal-spirits`, `fashion-accessories`, `fermented-dairy`, `gourmet-foods`, `halal-foods`, `honey-bee-products`, `hotels-resorts`, `jewelry-watches`, `mineral-waters`, `natural-beauty`, `natural-supplements`, `artisan-ceramics`, `cured-meats`, `specialty-cheeses`, `wine`

### Markets
- `brazil`, `china`, `egypt`, `ethiopia`, `india`, `indonesia`, `iran`, `russia`, `south-africa`, `uae`

### Attributes
- `artisanal-excellence`, `cultural-bridge`, `founder-led`, `heritage-brand`, `innovation-leader`, `premium-positioning`, `regional-icon`, `sustainability-pioneer`

### Signals
- `export-ready`, `franchise-ready`, `investment-ready`, `rapid-growth`

### Distribution Models
- `direct-export`, `distributors`, `e-commerce`, `franchise`, `joint-venture`

## Founder Information Guidelines

The founder section can be documented at different levels:

### Core Template (Basic)
```yaml
founder:
  name: "Founder Name"  # Translatable
  founder_led: true     # Boolean, not translatable
```

### Lite Template (Extended)
```yaml
founder:
  name: "Founder Name"            # Translatable
  story: "Brief founder summary"  # Translatable
  generation: "first"             # first/second/transition, not translatable
  transition_status: "active"     # Not translatable
  founder_led: true               # Not translatable
  deceased: false                 # Not translatable
```

### Full Template (Complete)
Add further details in the markdown content section, including multiple paragraphs on the founder's journey, philosophy, and ongoing involvement with the brand.

## Content Section Guidelines

All templates should include at minimum:

1. **About [BRAND NAME]** - General brand overview
2. **Founder's Journey** - Founder story, however brief
3. **Market Presence** - Information about the brand's market position

Lite and Full templates should add:

4. **Product Range** - Overview of main product lines or services

Full templates should also include:

5. **Certifications & Recognition** - Awards and certifications
6. **International Presence** - Global distribution and strategy
7. **Location Intelligence** - Geographic context and analysis
8. **Gallery** - Visual showcase of brand imagery

## File Naming Conventions

Brand files should use descriptive slugs that indicate the brand:
- `teatime.md` (not `brand1.md`)
- `mountain-retreat.md` (not `hotel-brand.md`)
- `sibirskaya-vodka.md` (not `russian-spirits.md`)

## Cross-References with Other Content Types

Brands can be referenced in other content types:

1. **In Insights**: Using the `brands: [brand-slug]` front matter
2. **In Dimensions**: Tag pages can list brands within a dimension
3. **Related Brands**: Using the `related_brands: [brand1, brand2]` front matter

## Best Practices

1. **Always use exact slugs** from data files to prevent errors
2. **Include descriptive image names** for better asset management
3. **Follow content section structure** for consistency
4. **Add translations incrementally** - write in English first
5. **Test profiles** before publishing
6. **Keep descriptions concise** (1-2 sentences) for better card display
7. **Use proper metadata grouping** for easier template navigation
8. **Regular upgrades**: Start with Core template and upgrade as more information becomes available

## Common Errors to Avoid

1. ❌ Translating taxonomy slugs (sectors, attributes, signals)
2. ❌ Translating image paths or URLs
3. ❌ Translating years in timeline or certifications
4. ❌ Translating country codes or coordinates
5. ❌ Changing `ref` field (needed for language switcher)
6. ❌ Changing `featured` or `featured_level` values
7. ❌ Using spaces in file names or image paths
8. ❌ Creating non-standard sections in markdown content
9. ❌ Missing required fields for the chosen template level
10. ❌ Inconsistent brand description across language versions

## Translation Workflow

1. Create English version first
2. Process images for the brand
3. Add Russian version with same `ref` value
4. Add Chinese version with same `ref` value
5. Ensure all versions are in correct language directories
6. Test language switching functionality

## Support

For questions about these templates, consult:
- CLAUDE.md for site architecture
- _data/dimensions/en.yml for taxonomy reference
- _data/translations/*.yml for label translations
- Component documentation for display includes
