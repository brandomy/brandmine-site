# New Market Addition Checklist

This checklist covers all files and locations that need to be updated when adding a new market to the Brandmine website.

## ✅ Data Files

### 1. Core Market Data
- [ ] **`_data/markets.json`** - Add market entry with all required fields:
  - `id`: kebab-case identifier (e.g., "malaysia")
  - `type`: "country" | "bloc" | "special"
  - `name`: Translations in en/ru/zh
  - `country_codes`: Array of ISO country codes
  - `short_description`: Translations in en/ru/zh
  - `population`: Population number
  - `gdp_total`: GDP in USD
  - `gdp_growth_rate`: Growth rate percentage
  - `icon`: Path to market icon (initially empty)
  - `hero_image`: Path to hero image (initially empty)

### 2. Countries Data
- [ ] **`_data/countries.json`** - Add country entry:
  - Country code mapping
  - Country name translations
  - Ensure consistency with markets.json

### 3. Market-Country Mapping
- [ ] **`_data/market-country-map.json`** - Add mapping between market and countries

## ✅ Dimension Files

### 4. Market Dimension Pages
Create market dimension files in all languages:
- [ ] **`_dimensions/en/markets/[market-id].md`**
- [ ] **`_dimensions/ru/markets/[market-id].md`**
- [ ] **`_dimensions/zh/markets/[market-id].md`**

Each file needs:
```yaml
---
layout: dimension
type: market
ref: [market-id]
title: "[Market Name]"
name: "[Market Name]"
lang: [language]
permalink: /[lang]/discover/markets/[market-id]/
description: "Market description in appropriate language"
---
```

### 5. Market-Sector Data
Create market-sector mapping files:
- [ ] **`_data/market-sectors/en/[market-id].yml`**
- [ ] **`_data/market-sectors/ru/[market-id].yml`**
- [ ] **`_data/market-sectors/zh/[market-id].yml`**

## ✅ Visual Assets

### 6. Icons
- [ ] **Market icon**: `assets/images/icons/dimensions/markets/[market-id].png`
  - 512x512px PNG format
  - Consistent with other market icons
  - Clear, recognizable symbol

### 7. Hero Images
- [ ] **Market hero image**: `assets/images/dimensions/markets/[market-id].jpg`
  - 1200x800px (3:2 aspect ratio)
  - Apply appropriate visual style (Textured Minimalism for country-specific)
  - Processed with `process_images.sh` for responsive variants

### 8. Flags (if needed)
- [ ] **Flag assets**: `assets/images/icons/flags/[country-code].svg`
  - SVG format for scalability
  - Consistent styling with existing flags

## ✅ Translation Updates

### 9. Navigation Data
Update navigation files if market should appear in menus:
- [ ] **`_data/navigation/en.yml`**
- [ ] **`_data/navigation/ru.yml`**
- [ ] **`_data/navigation/zh.yml`**

### 10. Translation Strings
Add market-specific translations:
- [ ] **`_data/translations/en.yml`** - Add market name and descriptions
- [ ] **`_data/translations/ru.yml`** - Add market name and descriptions
- [ ] **`_data/translations/zh.yml`** - Add market name and descriptions

## ✅ Image Processing

### 11. Process Market Images
Run image processing scripts:
- [ ] **Process market hero image**:
  ```bash
  ./_scripts/process_images.sh dimensions markets/[market-id]
  ```

- [ ] **Add image attributions**:
  ```bash
  ./_scripts/add_image_attribution.py dimensions markets/[market-id]
  ```

## ✅ Content Creation

### 12. Market-Specific Content
- [ ] **Create market page content** in all three languages
- [ ] **Add market description** and unique selling points
- [ ] **Include key statistics** and economic data
- [ ] **Add cultural context** and business environment details

### 13. Sector Mapping
- [ ] **Map relevant sectors** to the new market
- [ ] **Update sector priorities** for the market
- [ ] **Create market-sector combinations** in YAML files

## ✅ Discovery Integration

### 14. Discovery Dimensions Grid
- [ ] **Update discovery component** if market should appear in featured tags
- [ ] **Check discovery navigation** to ensure proper categorization

### 15. Search and Filtering
- [ ] **Verify search functionality** includes new market
- [ ] **Test filter components** can handle new market
- [ ] **Update advanced search** if market-specific filters needed

## ✅ Site Generation

### 16. Jekyll Collections
- [ ] **Regenerate site** to ensure all pages are created
- [ ] **Check permalink structure** for new market pages
- [ ] **Verify cross-links** between market and related content

### 17. Search Index
- [ ] **Update search indices**:
  ```bash
  python3 _scripts/generate_search_index.py
  ```

## ✅ Testing & Validation

### 18. Content Validation
- [ ] **Test all language versions** of market pages
- [ ] **Verify responsive images** load correctly
- [ ] **Check internal links** and navigation
- [ ] **Validate market-sector relationships**

### 19. Visual Consistency
- [ ] **Ensure visual styling** matches other markets
- [ ] **Test color coding** and taxonomy consistency
- [ ] **Verify icon display** in all contexts

### 20. Performance Check
- [ ] **Test page load times** for new market pages
- [ ] **Verify image optimization** is working
- [ ] **Check mobile responsiveness**

## 🛠️ Commands Summary

Key commands to run when adding a new market:

```bash
# Image processing
./_scripts/process_images.sh dimensions markets/[market-id]

# Add image attributions
./_scripts/add_image_attribution.py dimensions markets/[market-id]

# Regenerate search index
python3 _scripts/generate_search_index.py

# Build site
bundle exec jekyll build

# Test locally
bundle exec jekyll serve
```

## 📋 Market Example: Malaysia

For Malaysia specifically:
- **ID**: `malaysia`
- **Country Code**: `my`
- **Files needed**: 
  - `_dimensions/*/markets/malaysia.md` (3 languages)
  - `_data/market-sectors/*/malaysia.yml` (3 languages)
  - `assets/images/dimensions/markets/malaysia.jpg`
  - `assets/images/icons/dimensions/markets/malaysia.png`

---

**Note**: This checklist ensures comprehensive integration of new markets into the Brandmine ecosystem while maintaining consistency across all languages and components.