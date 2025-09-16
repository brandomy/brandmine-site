# Technical Standards and Reference Guide

**Complete architecture patterns, visual standards, and implementation guidelines**

---

## 🏗️ "Logic Light" Architecture

### Core Philosophy
Brandmine uses **data-driven configuration** instead of template logic:

```yaml
# _data/component_defaults.yml
cards:
  universal-card:
    brand:
      show_location: true
      show_sector: true
      tag_limit: 4
    insight:
      show_category_border: true
      show_icon_badge: true

# _data/page_sections.yml
brands:
  sections: ["breadcrumbs", "identity", "founder-narrative", "content", "business-intelligence", "location-intelligence", "connections"]
  identity:
    panel_type: "panel--hero"
    background: "gradient"
```

### Pattern: Configuration Over Conditionals
```liquid
{% comment %} OLD PATTERN - Avoid {% endcomment %}
{% if page.layout == "brands" %}
  {% assign panel_type = "panel--hero" %}
{% else %}
  {% assign panel_type = "panel--light" %}
{% endif %}

{% comment %} NEW PATTERN - Use this {% endcomment %}
{% include helpers/page-sections.html page_type="brands" %}
```

### Linear Layout System
**NO SIDEBARS** - All layouts use simple section flow:

```html
<section class="brands-section brands-section--hero"
         id="brands-section-hero"
         aria-labelledby="heading-hero">
  <div class="panel panel--hero">
    <div class="panel__content">
      {% include pages/brands/hero.html %}
    </div>
  </div>
</section>
```

---

## 📁 Directory Structure

### Core Architecture
```
_includes/pages/[page]/[section].html    # Page sections
_layouts/[page-type].html                # Page templates
_data/page_sections.yml                  # Section configuration
_data/component_defaults.yml             # Component defaults
_data/translations/[lang].yml            # UI text
```

### Content Collections
```
_brands/[lang]/[country]-[brand].md      # Brand profiles
_founders/[lang]/[founder-id].md         # Founder profiles
_dimensions/[lang]/[type]/[slug].md      # Taxonomy definitions
_insights/[lang]/[article-slug].md       # Blog articles
```

### Asset Organization
```
assets/images/[collection]/[identifier]/ # Content-specific images
assets/images/[category]/                # Site-wide images
assets/css/components/[type]/            # Component styles
assets/css/pages/[page]/                 # Page-specific styles
```

---

## 🃏 Universal Card System

### Primary Component
**Universal Card Architecture**: Single sophisticated component handles all content types

```liquid
{% include components/cards/universal-card.html
   item=content_object
   type="brand"
   variant="standard"
   context="grid"
   config_set="universal-card" %}
```

### Supported Content Types
1. **Brand Cards**: Metric overlays, logo corners, split footers, founder quotes
2. **Insight Cards**: Category borders, badges, two-tier tags, reading times
3. **Founder Cards**: Portrait focus, generation badges, skill clouds, wisdom quotes
4. **Testimonial Cards**: Quote emphasis, impact grids, profile integration
5. **Case Study Cards**: Large metrics, professional styling, timelines
6. **Dimension Cards**: Icon systems, color coding, count indicators

---

## 🎨 Visual Style Framework

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

---

## 🎨 Color System

### Brand Identity Colors

#### Primary Teal
- **Purpose:** Main brand color, navigation, primary actions
- **Key Colors:** `--primary-400` (#38B2AC) brand color, `--primary-700` dark text
- **Usage:** Headers, buttons, links, brand elements

#### Secondary Orange
- **Purpose:** Accent color, call-to-action elements
- **Key Colors:** `--secondary-500` (#F97316) accent, `--secondary-800` dark text
- **Usage:** Secondary buttons, highlights, urgent elements

### Discovery Dimensions Color System

| Type | Color | CSS Property | Light BG | Dark Text |
|------|-------|--------------|----------|-----------|
| **Sectors** | Olive Green | `--olive-*` | `--olive-100` | `--olive-800` |
| **Markets** | Sky Blue | `--sky-*` | `--sky-100` | `--sky-800` |
| **Attributes** | Secondary Orange | `--secondary-*` | `--secondary-100` | `--secondary-800` |
| **Signals** | Accent Indigo | `--accent-*` | `--accent-100` | `--accent-800` |

### Design Token Requirements
- **Always use CSS custom properties:** `var(--primary-500)`
- **Never hardcode colors:** No hex values (#38B2AC) in CSS
- **Exceptions:** Social media brand colors only

---

## 🎯 CSS Architecture

### Layer Structure and Loading Order

CSS is organized in layers, loaded in specific order to maintain cascade:

1. **Tokens Layer**: Fundamental design variables (colors, typography)
2. **Base Layer**: Core styles for HTML elements
3. **Layout Layer**: Structural components (panels, grids)
4. **Component Layer**: Reusable UI elements
5. **Page Layer**: Page-specific styles that override components

### BEM Methodology
```scss
// Block
.brand-card { }

// Element
.brand-card__title { }
.brand-card__meta { }

// Modifier
.brand-card--featured { }
.brand-card--compact { }
```

### CSS Custom Properties
```scss
:root {
  --primary-500: #3b82f6;
  --space-4: 1rem;
  --text-base: 1rem;
  --radius-md: 0.375rem;
}

.button {
  background: var(--primary-500);
  padding: var(--space-4);
  font-size: var(--text-base);
  border-radius: var(--radius-md);
}
```

---

## 🌐 Multilingual Architecture

### Language Structure
- **URL pattern**: `/[lang]/[page]/`
- **Content files**: `_[collection]/[lang]/[file].md`
- **Shared logic**: All layouts and includes work across languages

### Language Switching
```liquid
{% assign language_map = site.data.language_map[page.url] %}
{% for lang_data in language_map %}
  <a href="{{ lang_data.url }}" hreflang="{{ lang_data.lang }}">
    {{ lang_data.name }}
  </a>
{% endfor %}
```

---

## 📏 Naming Standards

### File Naming
**Use kebab-case for ALL web files:**
```bash
# Correct ✅
hero-section.html
brand-card.scss
market-analysis.md
founder-portrait.jpg

# Incorrect ❌
hero_section.html
brandCard.scss
marketAnalysis.md
founder_portrait.jpg
```

### Front Matter Standards
```yaml
---
layout: brand-profile    # Required: layout type
title: "Brand Name"      # Required: display name
ref: "xx-brand-slug"     # Required: global identifier
lang: en                 # Required: language code
country_code: "ru"       # Required: ISO country code
permalink: /en/brands/ru-brand/  # Required: full URL path

# Taxonomy (use existing dimension slugs only)
sectors: ["wine"]
markets: ["russia"]
attributes: ["founder-led"]
signals: ["export-ready"]

# SEO
description: "Brief description for meta tags"
featured: false          # Homepage feature flag
---
```

---

## ⚡ Performance Optimizations

### Pre-Generated Data
```python
# Language mapping (eliminates expensive page lookups)
_scripts/utilities/generate-language-map.py

# Navigation cache (eliminates translation lookups)
_scripts/utilities/generate-navigation-cache.py
```

### Build Performance Guidelines
- **File placement**: Large docs in `_docs/` (excluded from processing)
- **Performance targets**: <15 seconds production builds
- **Clean rebuilds**: <30 seconds

---

## 🔧 Technical Development Workflow

### Build Commands and Validation
```bash
# Development server with live reload
bundle exec jekyll serve --livereload

# Production build with timing
time JEKYLL_ENV=production bundle exec jekyll build

# Complete validation suite
_scripts/core/pre-commit_check.sh

# Jekyll health check
bundle exec jekyll doctor
```

---

**Cross-References:**
- **Workflows**: See `_templates/tutorials/workflows/` for implementation procedures
- **Troubleshooting**: See `_templates/tutorials/troubleshooting/` for issue resolution
- **Master Navigation**: See [brandmine-guide.md](brandmine-guide.md) for complete documentation overview