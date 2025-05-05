# Brandmine Insights Templates

This directory contains templates for creating insight articles across four categories. These templates ensure consistent structure and proper taxonomy usage throughout the Brandmine platform.

## Front Matter Structure

The templates now clearly separate fields that must remain in English (metadata and taxonomy) from those that should be translated. The metadata section follows a logical grouping for better organization.

### YAML Front Matter Organization

```yaml
---
# ============================================================================
# METADATA SECTION - DO NOT TRANSLATE THESE FIELDS
# Keep these fields exactly as shown, in English, for all language versions
# ============================================================================

# Core layout and category
layout: insight                    # Always "insight"
category: "brand-spotlight"        # Must match insights/en.yml

# Language and routing
lang: en                           # Language code
permalink: /en/insights/ru/article/# Language code in URL only
ref: article-slug                  # Language switcher reference

# Content metadata
country_code: "ru"                 # Market focus code
date: YYYY-MM-DD                   # Publication date
reading_time: 7                    # Number only

# Display flags
featured: false                    # Boolean value
premium: false                     # Boolean value

# Taxonomy - All exact slugs from dimensions/en.yml (DO NOT TRANSLATE)
sectors: [wine, gourmet-foods]     # Exact slugs only
markets: [russia, china]           # Exact slugs only
attributes: [founder-led]          # Exact slugs only
signals: [export-ready]            # Exact slugs only
brands: [brand-slug]               # Exact slugs only

# Images - Same for all language versions (DO NOT TRANSLATE)
images:
  hero: "/assets/images/insights/ru/article-slug/originals/hero.jpg"
  founder_portrait: "/assets/images/insights/ru/article-slug/originals/founder-portrait.jpg"
  logo: "/assets/images/insights/ru/article-slug/originals/logo.jpg"

# ============================================================================
# TRANSLATABLE SECTION - TRANSLATE THESE FIELDS FOR EACH LANGUAGE
# Only these fields should be translated when creating RU/ZH versions
# ============================================================================
title: "Article Title in Target Language"
author: "author_name"              # Key for translation lookup
excerpt: "Article excerpt..."      # Translate this content
---
```

## Available Templates

### 1. Brand Spotlight (insight-brand-spotlight.md)
- **Purpose**: In-depth profiles of noteworthy BRICS+ brands gaining international momentum
- **Typical Length**: 1,500 words
- **Reading Time**: 7 minutes
- **Focus**: Brand story, differentiation, and market positioning

### 2. Founders Journey (insight-founders-journey.md)
- **Purpose**: Personal stories behind the brands and the visionaries who created them
- **Typical Length**: 2,000 words
- **Reading Time**: 8 minutes
- **Focus**: Founder narrative, key decisions, challenges, and vision

### 3. Location Intelligence (insight-location-intelligence.md)
- **Purpose**: Geographical insights and regional context that shape brand development
- **Typical Length**: 1,800 words
- **Reading Time**: 6 minutes
- **Focus**: Geographic analysis, regional clustering, spatial opportunities

### 4. Market Momentum (insight-market-momentum.md)
- **Purpose**: Notable achievements, milestones, and expansion moments for BRICS+ brands
- **Typical Length**: 1,200 words
- **Reading Time**: 7 minutes
- **Focus**: Market trends, growth metrics, future trajectory

## Translation Workflow

### Fields That Must Remain in English
1. **Layout identifier**: Always `layout: insight`
2. **Category identifier**: Must match exactly as listed in `_data/insights/en.yml`
3. **Taxonomy fields**: All slugs (sectors, markets, attributes, signals, brands)
4. **Technical metadata**: featured, premium, reading_time, country_code, date
5. **Language switcher reference**: `ref` field
6. **Image paths**: Same for all languages

### Fields to Translate
1. **Title**: Translate to target language
2. **Author**: Uses translation key (see below)
3. **Excerpt**: Translate content

### Author Name Translation Approach

Authors are now stored as a single key in the front matter. The actual display name is handled through the translation files:

**In article front matter:**
```yaml
author: "randal_eastman"  # Use key for lookup
```

**In translation files:**
- `_data/translations/en.yml`: `authors.randal_eastman: "Randal Eastman"`
- `_data/translations/ru.yml`: `authors.randal_eastman: "Рэндал Истман"`  
- `_data/translations/zh.yml`: `authors.randal_eastman: "兰达尔·伊斯特曼"`

**In layout template:**
```liquid
{{ site.data.translations[page.lang].authors[page.author] }}
```

## Directory Structure

Articles should be organized by language and then market:
```
_insights/
├── en/
│   ├── ru/
│   │   ├── article-slug-1.md
│   │   └── article-slug-2.md
│   ├── cn/
│   └── br/
├── ru/
└── zh/
```

## Image Organization

Images follow the same pattern as brand profiles:
```
assets/images/insights/[market]/[article-slug]/originals/
├── hero-[description].jpg
├── founder-portrait-[name].jpg (optional)
└── logo-[brand-name].jpg (optional)
```

**Image Naming Convention:**
- Format: `purpose-description.jpg`
- Examples:
  - `hero-teatime-moscow-headquarters.jpg`
  - `founder-portrait-alexei-sokolov.jpg`
  - `logo-sibirskaya-premium-edition.jpg`

## Front Matter Requirements

### Required Fields:
- `layout`: Always "insight"
- `title`: Article title (translated)
- `category`: Must match insights/en.yml id
- `country_code`: Two-letter code (not translated)
- `date`: Publication date (not translated)
- `author`: Author key for translation lookup
- `excerpt`: Brief summary (translated)
- `permalink`: Article URL path
- `lang`: Article language
- `reading_time`: Estimated minutes
- `ref`: For language switcher

### Taxonomy Fields (All Optional):
- `sectors`: Array of sector slugs from dimensions/en.yml
- `markets`: Array of market slugs from dimensions/en.yml
- `attributes`: Array of attribute slugs from dimensions/en.yml
- `signals`: Array of signal slugs from dimensions/en.yml
- `brands`: Array of brand slugs

**IMPORTANT**: Use exact slugs from the data files - no variations!

## Processing Images

After placing original images in the appropriate folder:
```bash
./_scripts/process_site_images.sh
```

## Category Values

Use these exact category values (kebab-case):
- `brand-spotlight`
- `founders-journey`
- `location-intelligence`
- `market-momentum`

## Slug Reference Chart

**Sectors** (from dimensions/en.yml):
- `artisan-confectionery`, `artisanal-spirits`, `fashion-accessories`, `fermented-dairy`, `gourmet-foods`, `halal-foods`, `honey-bee-products`, `hotels-resorts`, `jewelry-watches`, `mineral-waters`, `natural-beauty`, `natural-supplements`, `artisan-ceramics`, `cured-meats`, `specialty-cheeses`, `wine`

**Markets**:
- `brazil`, `china`, `egypt`, `ethiopia`, `india`, `indonesia`, `iran`, `russia`, `south-africa`, `uae`

**Attributes**:
- `artisanal-excellence`, `cultural-bridge`, `founder-led`, `heritage-brand`, `innovation-leader`, `premium-positioning`, `regional-icon`, `sustainability-pioneer`

**Signals**:
- `export-ready`, `franchise-ready`, `investment-ready`, `rapid-growth`

## Best Practices

1. **Always use exact slugs** from data files to prevent errors
2. **Include descriptive image names** for better asset management
3. **Follow content structure** in templates for consistency
4. **Add translations incrementally** - write in English first
5. **Test articles** before publishing
6. **Keep excerpts concise** (1-2 sentences) for better card display
7. **Use proper metadata grouping** for easier template navigation

## Common Errors to Avoid

1. ❌ Translating metadata fields (country_code, date, reading_time)
2. ❌ Translating taxonomy slugs
3. ❌ Using multiple author fields in different languages
4. ❌ Creating new category values not in insights/en.yml
5. ❌ Mixing up taxonomy slugs
6. ❌ Forgetting to process images
7. ❌ Using placeholder values in required fields
8. ❌ Changing image paths for different languages

## Translation Workflow

1. Create English version first
2. Add Russian version with same `ref` value
3. Add Chinese version with same `ref` value
4. Ensure all versions are in correct language directories

## File Naming

Article files should use descriptive slugs that indicate content:
- `7-spices-spotlight.md` (not `article1.md`)
- `teatime-founders-journey.md` (not `founder-story.md`)
- `siberian-honey-corridor.md` (not `location-analysis.md`)

## Support

For questions about these templates, consult:
- CLAUDE.md for site architecture
- _data/dimensions/en.yml for taxonomy reference
- _data/insights/en.yml for category reference
- Component documentation for display includes