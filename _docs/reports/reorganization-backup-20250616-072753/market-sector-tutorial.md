# Market-Sector Page Creation Tutorial

**Complete guide to creating market-sector intersection pages like "Mongolia Natural-Beauty"**

---

## 🎯 Overview

Market-sector pages showcase brands at the intersection of specific markets and sectors (e.g., Russian Wine, Brazilian Artisanal Spirits, Mongolia Natural-Beauty). They use a data-driven system that combines:

### "Logic Light" Architecture
Market-sector pages exemplify Brandmine's data-driven "Logic Light" philosophy:
- **Pure JSON data source** with no template conditionals
- **Section configuration** via `_data/page_sections.yml`
- **Centralized rendering** through `helpers/page-sections.html`
- **Consistent behavior patterns** across all market-sector combinations
- **Linear layout compliance** with panel wrapper system

### System Components
1. **Structured data** from `market_sector_map.json`
2. **Linear sectioning** with configurable sections
3. **Multilingual support** across EN/RU/ZH
4. **Dynamic content rendering** based on market + sector combination

---

## 🏗️ Architecture Understanding

### Data Source
Market-sector pages pull content from `_data/market_sector_map.json`, not individual markdown files. The markdown files only contain front matter - all content comes from the JSON data.

### Page Structure
```
Layout: market-sector.html → helpers/page-sections.html → pages/market-sector/[section].html
```

### Available Sections
- `breadcrumbs` - Navigation breadcrumbs
- `hero` - Title and subtitle display
- `hero-image` - Large hero image (optional)
- `overview` - Main content and description
- `statistics` - Key stats and metrics
- `regions` - Geographic breakdown
- `featured-brands` - Highlighted brand profiles
- `all-brands` - Complete brand listings
- `related-brands` - Associated brand profiles
- `cross-navigation` - Links to related market-sectors

---

## 📝 Step-by-Step Tutorial: Creating "Mongolia Natural-Beauty"

### Step 1: Add Data to JSON Structure

Edit `_data/market_sector_map.json` and add this entry to the array:

```json
{
  "display": true,
  "featured": false,
  "market": "mongolia",
  "sector": "natural-beauty",
  "trademark_classes": [3, 5, 35],
  "translations": {
    "en": {
      "title": "Mongolian Natural Beauty Industry",
      "subtitle": "Ancient Herbal Traditions Meet Modern Wellness",
      "description": "Mongolia's natural beauty sector combines ancient herbal knowledge with modern wellness trends, featuring traditional ingredients like sea buckthorn, milk thistle, and yak milk in contemporary formulations.",
      "short_description": "Mongolian natural beauty brands rooted in ancient herbal traditions and nomadic wellness practices.",
      "full_content": "# Traditional Mongolian Beauty Wisdom\n\nMongolia's natural beauty industry draws from centuries of nomadic herbal knowledge, featuring ingredients like:\n\n## Key Traditional Ingredients\n- **Sea Buckthorn**: Rich in vitamins and antioxidants\n- **Yak Milk**: Natural moisturizing properties\n- **Mongolian Herbs**: Traditional healing plants\n- **Mineral Springs**: Natural therapeutic waters\n\n## Market Characteristics\nThe Mongolian natural beauty sector represents an emerging opportunity at the intersection of traditional knowledge and modern wellness trends."
    },
    "ru": {
      "title": "Индустрия натуральной красоты Монголии",
      "subtitle": "Древние травяные традиции встречают современное благополучие",
      "description": "Сектор натуральной красоты Монголии сочетает древние знания о травах с современными тенденциями оздоровления.",
      "short_description": "Монгольские бренды натуральной красоты, основанные на древних травяных традициях.",
      "full_content": "# Традиционная монгольская мудрость красоты\n\nИндустрия натуральной красоты Монголии основывается на многовековых знаниях кочевых народов о травах."
    },
    "zh": {
      "title": "蒙古天然美容行业",
      "subtitle": "古老草药传统与现代健康的结合",
      "description": "蒙古的天然美容行业将古老的草药知识与现代健康趋势相结合。",
      "short_description": "根植于古老草药传统和游牧健康实践的蒙古天然美容品牌。",
      "full_content": "# 传统蒙古美容智慧\n\n蒙古的天然美容行业汲取了几个世纪的游牧草药知识。"
    }
  },
  "popularity_rank": 12,
  "established_year": 1990,
  "hero_image": "/assets/images/market-sectors/mongolia/natural-beauty/hero.jpg",
  "key_stats": [
    {
      "label": "Market Growth",
      "value": "18% annually",
      "icon": "chart-line"
    },
    {
      "label": "Traditional Ingredients",
      "value": "50+ documented herbs",
      "icon": "leaf"
    },
    {
      "label": "Export Potential",
      "value": "$12 million estimated",
      "icon": "globe"
    }
  ],
  "annual_production": 2500000,
  "highlights": [
    "Sea buckthorn-based skincare formulations",
    "Yak milk moisturizing products", 
    "Traditional herbal wellness blends"
  ],
  "regions": [
    {
      "name": "Ulaanbaatar",
      "description": "Primary manufacturing and research hub"
    },
    {
      "name": "Uvs Province", 
      "description": "Sea buckthorn cultivation center"
    },
    {
      "name": "Arkhangai",
      "description": "Traditional herbal gathering region"
    }
  ],
  "opportunities": [
    "Growing international demand for natural ingredients",
    "Unique positioning in wellness tourism",
    "Sustainable harvesting practices appeal"
  ],
  "challenges": [
    "Limited processing infrastructure",
    "International certification requirements",
    "Seasonal ingredient availability"
  ]
}
```

### Step 2: Create Page Files

Create these files in **all three language directories**:

**File: `pages/en/discover/markets/mongolia/sectors/natural-beauty.md`**
```yaml
---
layout: market-sector
title: "Mongolian Natural Beauty Industry"
subtitle: "Ancient Herbal Traditions Meet Modern Wellness"
permalink: /en/discover/markets/mongolia/sectors/natural-beauty/
lang: en
market: "mongolia"
sector: "natural-beauty"
ref: mongolia-natural-beauty
display: true
featured: false
hero_image: "/assets/images/market-sectors/mongolia/natural-beauty/hero.jpg"
sections:
  - breadcrumbs
  - hero
  - hero-image
  - overview
  - statistics
  - regions
  - related-brands
  - cross-navigation
---
```

**File: `pages/ru/discover/markets/mongolia/sectors/natural-beauty.md`**
```yaml
---
layout: market-sector
title: "Индустрия натуральной красоты Монголии"
subtitle: "Древние травяные традиции встречают современное благополучие"
permalink: /ru/discover/markets/mongolia/sectors/natural-beauty/
lang: ru
market: "mongolia"
sector: "natural-beauty"
ref: mongolia-natural-beauty
display: true
featured: false
hero_image: "/assets/images/market-sectors/mongolia/natural-beauty/hero.jpg"
sections:
  - breadcrumbs
  - hero
  - hero-image
  - overview
  - statistics
  - regions
  - related-brands
  - cross-navigation
---
```

**File: `pages/zh/discover/markets/mongolia/sectors/natural-beauty.md`**
```yaml
---
layout: market-sector
title: "蒙古天然美容行业"
subtitle: "古老草药传统与现代健康的结合"
permalink: /zh/discover/markets/mongolia/sectors/natural-beauty/
lang: zh
market: "mongolia"
sector: "natural-beauty"
ref: mongolia-natural-beauty
display: true
featured: false
hero_image: "/assets/images/market-sectors/mongolia/natural-beauty/hero.jpg"
sections:
  - breadcrumbs
  - hero
  - hero-image
  - overview
  - statistics
  - regions
  - related-brands
  - cross-navigation
---
```

### Step 3: Create Supporting Directory Structure

```bash
# Create image directories
mkdir -p assets/images/market-sectors/mongolia/natural-beauty/

# Create supporting data directory (if needed)
mkdir -p _data/market-sectors/mongolia/
```

### Step 4: Add Hero Image

Create or source a hero image following Brandmine visual standards:
- **Aspect ratio**: 3:2 (1200×800px)
- **Style**: Textured Minimalism (TM) 
- **Content**: Mongolian landscape with natural beauty elements
- **Naming**: `hero.jpg` (market-sector pages use simple naming)
- **File**: `assets/images/market-sectors/mongolia/natural-beauty/hero.jpg`

Process with:
```bash
_scripts/core/process_images.sh market-sectors mongolia-natural-beauty
```

### Step 5: Add Supporting YAML Data (Optional)

Create `_data/market-sectors/mongolia/natural-beauty.yml`:
```yaml
# Additional detailed data for Mongolia natural-beauty sector
overview:
  total_brands: 23
  established_brands: 8
  emerging_brands: 15
  
key_players:
  - name: "Gobi Desert Botanicals"
    founded: 2018
    specialization: "Sea buckthorn skincare"
  - name: "Nomad Natural"
    founded: 2020
    specialization: "Yak milk cosmetics"
    
export_markets:
  - country: "China"
    percentage: 45
  - country: "Russia" 
    percentage: 30
  - country: "South Korea"
    percentage: 15
```

---

## 🎛️ Section Control Guide

### Core Sections (Always Include)
- `breadcrumbs` - Navigation context
- `hero` - Title and subtitle
- `overview` - Main content from JSON

### Optional Sections
- `hero-image` - Include only if you have a hero image
- `statistics` - Shows key_stats from JSON data
- `regions` - Geographic breakdown
- `featured-brands` - Highlighted brands (requires brands with matching market+sector)
- `all-brands` - Complete brand listing
- `related-brands` - Associated brands
- `cross-navigation` - Links to related market-sectors

### Section Order Best Practices
```yaml
sections:
  - breadcrumbs       # Always first
  - hero             # Page title/subtitle
  - hero-image       # If available
  - overview         # Main content
  - statistics       # Key metrics
  - regions          # Geographic info
  - featured-brands  # Or all-brands
  - cross-navigation # Always last
```

---

## 🔍 How Sections Work

### Hero Section
- Pulls `title` and `subtitle` from JSON translations
- Uses `market-sector__title` and `market-sector__subtitle` CSS classes

### Overview Section  
- Renders `full_content` from JSON translations through markdownify
- Displays optional image if specified in JSON

### Statistics Section
- Iterates through `key_stats` array from JSON
- Shows label, value, and icon for each stat

### Regions Section
- Displays `regions` array from JSON
- Shows name and description for each region

---

## 🧪 Testing Your Implementation

### 1. Build and Serve
```bash
bundle exec jekyll serve --livereload
```

### 2. Test URLs
- EN: `http://localhost:4000/en/discover/markets/mongolia/sectors/natural-beauty/`
- RU: `http://localhost:4000/ru/discover/markets/mongolia/sectors/natural-beauty/`
- ZH: `http://localhost:4000/zh/discover/markets/mongolia/sectors/natural-beauty/`

### 3. Validation Checks
```bash
# Check YAML syntax
_scripts/validation/validate_yaml.sh

# Verify language consistency
_scripts/validation/language_consistency_checker.py

# Run full validation
_scripts/core/pre-commit_check.sh
```

---

## 🚀 Advanced Customization

### Adding Brands to Market-Sector

To show brands on your market-sector page, create brand files with matching taxonomy:

```yaml
# _brands/en/mn-gobi-botanicals.md
---
layout: brand-profile
title: "Gobi Desert Botanicals"
markets: ["mongolia"]          # Must match your market
sectors: ["natural-beauty"]    # Must match your sector
attributes: ["founder-led", "heritage-brand"]

# Images (follow brand standardization)
images:
  logo:
    name: "color"
    ext: "png"
  hero:
    name: "workshop"    # Context-aware naming
    ext: "jpg"
  founder:
    name: "portrait"    # Generic naming
    ext: "jpg"
---
```

### Custom Section Content

You can override section content by creating custom includes:
- Custom overview: Create `_includes/pages/market-sector/overview-mongolia-natural-beauty.html`
- The system will use the specific file if it exists, otherwise fallback to generic

### Adding New Statistics

Expand the `key_stats` array in your JSON entry:
```json
"key_stats": [
  {
    "label": "Organic Certification",
    "value": "78% of producers", 
    "icon": "certificate"
  }
]
```

---

## 📋 Checklist: Mongolia Natural-Beauty

- [ ] Added JSON entry to `market_sector_map.json`
- [ ] Created EN page file with correct front matter
- [ ] Created RU page file with translations  
- [ ] Created ZH page file with translations
- [ ] Created hero image in correct directory
- [ ] Processed images with script
- [ ] Tested all language URLs
- [ ] Verified sections render correctly
- [ ] Validated YAML syntax
- [ ] Ran pre-commit checks

---

## 🎯 Quick Reference

### Key Files
- **Data**: `_data/market_sector_map.json`
- **Layout**: `_layouts/market-sector.html`
- **Sections**: `_includes/pages/market-sector/[section].html`
- **Template**: `_templates/market-sector.md`

### Required Front Matter
```yaml
layout: market-sector
market: "mongolia"           # Must match JSON
sector: "natural-beauty"     # Must match JSON  
lang: en                     # Language code
permalink: /en/discover/markets/mongolia/sectors/natural-beauty/
```

### JSON Structure Requirements
- `market` and `sector` fields must match page front matter
- `translations` object must include all three languages
- `display: true` to make page visible

This tutorial provides everything needed to create sophisticated market-sector intersection pages that leverage Brandmine's data-driven architecture while maintaining consistency across languages and visual standards.