# Malaysia Integration - Outstanding Items

Based on our new market checklist, here are the outstanding items needed to fully integrate Malaysia into the Brandmine platform:

## ✅ Already Complete
- [x] **`_data/markets.json`** - Malaysia entry exists with full data

## 🔲 Outstanding Items

### 1. Dimension Files (3 files needed)
- [ ] **`_dimensions/en/markets/malaysia.md`**
- [ ] **`_dimensions/ru/markets/malaysia.md`**
- [ ] **`_dimensions/zh/markets/malaysia.md`**

### 2. Market-Sector Data (3 files needed)
- [ ] **`_data/market-sectors/en/malaysia.yml`**
- [ ] **`_data/market-sectors/ru/malaysia.yml`**
- [ ] **`_data/market-sectors/zh/malaysia.yml`**

### 3. Visual Assets (2 images needed)
- [ ] **Market hero image**: `assets/images/dimensions/markets/malaysia.jpg` (1200x800px)
- [ ] **Market icon**: `assets/images/icons/dimensions/markets/malaysia.png` (512x512px)

### 4. Image Processing
- [ ] Process market hero image with responsive variants
- [ ] Add image attributions

## 🎨 Image Prompts (Following Brandmine Style Guide)

### Malaysia Market Hero Image
**Style**: Flat Color Minimalism (for market dimension pages)
**Specifications**: 1200x800px (3:2 aspect ratio), JPG format, <200KB

**Prompt**:
```
Create a flat color minimalist illustration representing Malaysia as a market. 3:2 aspect ratio, horizontal composition. Use bold, simple geometric shapes with clean edges and zero textures or gradients. Include 2-3 abstract elements that suggest Malaysia without being literal - perhaps simplified twin towers silhouette, geometric patterns inspired by Malaysian architecture, and abstract cultural fusion elements. The color palette should focus on sky blue (#0EA5E9) as the primary color with limited accent colors (golden yellow and deep red from Malaysian heritage, maximum 3-4 total colors). White space should be used intentionally as part of the composition. All elements should be flat with no shadows, highlights, or textures. The style should be modern, clean, and suitable for market dimension visualization. Do not include any text in the image.
```

### Malaysia Market Icon
**Style**: Flat Color Minimalism (for UI/dimension visualization)
**Specifications**: 512x512px PNG, <100KB

**Prompt**:
```
Create a flat color minimalist icon representing Malaysia as a market. 1:1 aspect ratio, square format. Use bold, simple geometric shapes with clean edges and zero textures or gradients. Include 1-2 abstract elements that suggest Malaysia without being literal - perhaps a simplified architectural element or cultural symbol rendered in clean geometric forms. The color palette should focus on sky blue (#0EA5E9) as the primary color (matching our markets taxonomy) with minimal accent colors (maximum 2-3 total colors). White space should be used intentionally as part of the composition. All elements should be flat with no shadows, highlights, or textures. The style should be modern, clean, and suitable for UI/dimension visualization at small sizes (down to 24x24px). Do not include any text in the image.
```

## 📝 Content Templates

### Malaysia Dimension File Template
```yaml
---
layout: dimension
type: market
ref: malaysia
title: "Malaysia"
name: "Malaysia"
lang: en
permalink: /en/discover/markets/malaysia/
description: "A rising Southeast Asian market known for cultural diversity, manufacturing, and regional trade leadership."
---

# Malaysia: Southeast Asia's Cultural and Economic Hub

Malaysia represents one of Southeast Asia's most dynamic emerging markets, combining rich cultural diversity with strong economic fundamentals and strategic regional positioning.

## Market Overview

With a population of 33 million and a GDP of $440 billion, Malaysia offers a unique blend of developed infrastructure and emerging market opportunities. The country's multicultural society—combining Malay, Chinese, and Indian influences—creates a sophisticated consumer base with diverse preferences and strong purchasing power.

## Economic Landscape

Malaysia's economy is built on:
- **Manufacturing excellence** in electronics, automotive, and textiles
- **Resource wealth** in palm oil, petroleum, and natural gas
- **Financial services** as a regional Islamic finance hub
- **Tourism** leveraging natural beauty and cultural heritage

## Business Environment

The Malaysian market offers several advantages for brand development:
- **Strategic location** at the heart of ASEAN trade routes
- **Multilingual workforce** (Malay, English, Chinese, Tamil)
- **Government support** for innovation and entrepreneurship
- **Growing middle class** with increasing disposable income

## Cultural Context

Malaysia's multicultural heritage creates unique opportunities for brands that can navigate and celebrate diversity. The fusion of traditional values with modern aspirations makes it an ideal testing ground for brands seeking to understand complex Asian consumer preferences.
```

### Malaysia Market-Sector Template (YAML)
```yaml
# Malaysia Market Sectors
# Key sectors for brand development and consumer focus

priority_sectors:
  - halal-foods
  - natural-beauty
  - fashion-accessories
  - specialty-foods

emerging_sectors:
  - hotels-resorts
  - artisan-crafts
  - natural-supplements

traditional_strengths:
  - palm-oil-products
  - electronics-manufacturing
  - textiles

cultural_specializations:
  - muslim-lifestyle-products
  - multicultural-fusion-foods
  - traditional-crafts
```

## 🛠️ Commands to Run

After creating the files and images:

```bash
# Process the hero image
./_scripts/process_images.sh dimensions markets/malaysia

# Add image attributions
./_scripts/add_image_attribution.py dimensions markets/malaysia

# Regenerate search index
python3 _scripts/generate_search_index.py

# Build and test
bundle exec jekyll build
bundle exec jekyll serve
```

## 🎯 Priority Order

1. **Create dimension files** (enables basic Malaysia page functionality)
2. **Generate hero image** (provides visual identity)
3. **Generate icon** (enables UI integration)
4. **Create market-sector mappings** (provides sector relationships)
5. **Process images** (creates responsive variants)
6. **Test integration** (verify all components work)

## 📋 File Creation Checklist

### Dimension Files
- [ ] Create English version with full content
- [ ] Translate to Russian with cultural context
- [ ] Translate to Chinese with market focus
- [ ] Ensure consistent permalinks across languages

### Market-Sector Files
- [ ] Research Malaysia's key sectors
- [ ] Map to existing Brandmine sector taxonomy
- [ ] Create priority rankings
- [ ] Include cultural specializations

### Visual Assets
- [ ] Generate hero image following textured minimalism style
- [ ] Generate icon following flat color minimalism style
- [ ] Optimize file sizes (<300KB for hero, <100KB for icon)
- [ ] Test display across different screen sizes

---

**Total Estimated Time**: 2-3 hours for full integration
**Key Dependencies**: Image generation, content translation, testing