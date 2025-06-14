# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

# 🧭 Project Overview

**Brandmine** is a multilingual, mobile-first Jekyll website showcasing narrative-rich consumer brands from BRICS+ countries, emphasizing founder stories and multidimensional discovery.

## Business Mission

To illuminate exceptional founder-led brands from BRICS+ countries, connecting them globally with partners and capital they need to grow beyond borders.

The site supports three languages (English, Russian, Chinese), dimension-based discovery (market, sector, attribute, signal), and MapLibre integration for interactive maps.

---

# 🗂 Key Architecture

```
_brands/{lang}/           — Brand profiles
_founders/{lang}/         — Founder profiles  
_dimensions/{lang}/{type}/ — Taxonomy definitions
_data/                    — Configuration and translations
_includes/                — Reusable components
_layouts/                 — Page templates
_insights/{lang}/         — Blog content
pages/{lang}/             — Main pages
assets/                   — CSS, JS, images
_scripts/                 — Automation tools
```

See `_docs/technical-reference.md` for complete directory structure.

---

# 🏷️ Dimensions System

Dimensions are Markdown files in `_dimensions/{lang}/{type}/` defining the taxonomy:

**Valid dimension types:**
- `markets` — Geographic regions (brazil, russia, china, etc.)
- `sectors` — Industries (wine, natural-beauty, artisanal-spirits, etc.)  
- `attributes` — Brand qualities (founder-led, heritage-brand, etc.)
- `signals` — Growth indicators (export-ready, franchise-ready, etc.)

Brands reference dimensions in front matter:
```yaml
---
title: "TeaTime"
sectors: ["artisanal-spirits"]
markets: ["russia"]
attributes: ["founder-led"]
signals: ["export-ready"]
---
```

**CRITICAL RULES:**
- Use only the four approved dimension types
- Reference existing dimension slugs found in `_dimensions/{lang}/{type}/`
- No new dimension types without architectural review

---

# 📁 Data-Driven Architecture

Brandmine uses **configuration over conditionals** - centralized data files control behavior instead of template logic.

**Key Pattern:**
```liquid
{% comment %} Avoid conditional logic {% endcomment %}
{% if page.layout == "brands" %}
  {% assign panel_type = "panel--hero" %}
{% endif %}

{% comment %} Use centralized configuration {% endcomment %}
{% include helpers/page-sections.html page_type="brands" %}
```

## Centralized Configuration

- `_data/page_sections.yml` - Section control for all content types
- `_data/component_defaults.yml` - Component behavior defaults  
- `_data/dimensions_config.yml` - Dimension ordering and metadata
- `_data/translations/{lang}.yml` - UI text and labels

## Linear Layout Requirements

**All layouts use simple section flow - NO SIDEBARS:**
- Use panel wrapping for all content sections
- Semantic `<section>` tags with IDs and ARIA attributes
- Mobile-first linear flow ensures consistency

---

# 🌐 Multilingual Logic

All content exists in language-specific subfolders (`/en/`, `/ru/`, `/zh/`) with dynamic data loading based on `page.lang`.

**Translation Helper Pattern:**
```liquid
{% include helpers/t.html key="brands.hero_title" fallback="Discover Brands" %}
```

Language switcher and permalinks automatically respect language prefixing.

---

# 🎨 Essential Patterns

## File Naming
- **Files**: `kebab-case.html`, `kebab-case.scss`
- **Content**: `[country-code]-[brand-name].md` (e.g., `ru-teatime.md`)
- **Images**: `purpose-description.jpg` (e.g., `hero-storefront.jpg`)
- **Collections**: Brands, founders, insights, dimensions in language-specific folders

## Front Matter Standards
```yaml
---
layout: brand-profile    # Required: layout type
title: "Brand Name"      # Required: display name
ref: "xx-brand-slug"     # Required: global identifier
lang: en                 # Required: language code
country_code: "ru"       # Required: ISO country code
permalink: /en/brands/ru-brand/  # Required: full URL path

# Semantic image structure (all content types)
images:
  hero:
    name: "descriptive-name"
    alt: "Alt text description"
    ext: "jpg"

# Taxonomy (existing slugs only)
sectors: ["wine"]
markets: ["russia"]
attributes: ["founder-led"]
signals: ["export-ready"]
---
```

## CSS Standards
- **Design tokens**: Use CSS custom properties from `assets/css/tokens/tokens.scss`
- **BEM methodology**: `.block__element--modifier` pattern
- **Color system**: Primary teal, secondary orange, dimension-specific colors
- **Typography**: Language-specific font stacks (PT fonts, Noto for Chinese)

See `_docs/technical-reference.md` for complete patterns.

---

# 🖼️ Image Strategy

**Semantic Structure (Universal Pattern):**
```yaml
images:
  hero:
    name: "descriptive-name"
    alt: "Accessibility description"
    ext: "jpg"
```

**Standard Ratios:** 3:2 horizontal, 2:3 vertical, 1:1 square

**Processing:** `_scripts/core/process_images.sh [collection] [identifier]`

See `_docs/images.md` for complete workflows and `_docs/colors.md` for visual standards.

---

# 💻 Quick Development

## Quick Development

### Core Commands
```bash
# Development server with live reload
bundle exec jekyll serve --livereload

# Production build (target: 12-13 seconds)
JEKYLL_ENV=production bundle exec jekyll build

# Complete validation suite
_scripts/core/pre-commit_check.sh

# Image processing (unified script)
_scripts/core/process_images.sh [collection] [identifier]
```

### Data Management
```bash
# Update all search indexes and JSON data
_scripts/core/generate-all-json.py

# Language consistency validation
_scripts/validation/language_consistency_checker.py

# Performance optimization utilities
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
```

See `_docs/daily-workflows.md` for step-by-step content creation processes.

---

# 📊 Content Collections

All collections follow identical architectural patterns with complete trilingual support:

**Content Types:**
- **Insights:** `_insights/{lang}/[article-slug].md` - Blog articles in 4 categories (Brand Spotlight, Founder's Journey, Market Momentum, Location Intelligence)
- **Brands:** `_brands/{lang}/[country-code]-[brand-name].md` - Brand profiles with business intelligence
- **Founders:** `_founders/{lang}/[founder-id].md` - Founder narratives and achievements
- **Dimensions:** `_dimensions/{lang}/{type}/[dimension-slug].md` - Taxonomy definitions for discovery

**Current Content Inventory:**
- **7 brands** across Russian and Brazilian markets
- **4 founders** with complete multilingual profiles  
- **4 insight articles** covering market analysis and founder stories
- **125+ dimension definitions** supporting discovery taxonomy

**Universal Implementation Patterns:**
- Centralized section control via `_data/page_sections.yml`
- Semantic image structure using `images:` front matter object
- Clean YAML without embedded logic
- Automated JSON generation for search functionality

---

# 🧠 Claude Development Guidelines

## Content Creation
1. **Follow existing patterns** - Check similar files before creating new ones
2. **Use centralized configuration** - Avoid hardcoded values in templates
3. **Test all languages** - Ensure compatibility with EN/RU/ZH
4. **Mobile-first approach** - Design for mobile, enhance for larger screens

## Key Principles
- **No section arrays in front matter** - Use centralized control
- **Semantic image structure** - All content uses `images:` pattern
- **Component reuse** - Look for existing components before creating new ones
- **Clean templates** - Data only in front matter, logic in includes

## Validation Workflow
```bash
# Before any commit
_scripts/core/pre-commit_check.sh

# Performance check (target: ~12-13s)
time JEKYLL_ENV=production bundle exec jekyll build
```

---

# 📚 Documentation Reference

**Complete technical details:**
- `_docs/technical-reference.md` - Architecture patterns, CSS organization, component systems
- `_docs/daily-workflows.md` - Step-by-step content creation and maintenance
- `_docs/images.md` - Image processing and visual style standards
- `_docs/colors.md` - Color palette and usage guidelines

**Quick setup:**
- `_docs/setup-guide.md` - Environment setup and first steps
- `_docs/troubleshooting.md` - Common issues and solutions

---

# important-instruction-reminders
Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.