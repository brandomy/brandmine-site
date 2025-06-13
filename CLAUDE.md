# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

# 🧭 Project Overview

**Brandmine** is a multilingual, mobile-first website built with **Jekyll** (using the Minima theme via GitHub Pages) that showcases narrative-rich consumer brands from BRICS+ countries. It emphasizes founder stories, multidimensional tagging, and interactive discovery.

## Business Mission

✨ **To illuminate and elevate exceptional founder-led brands from the BRICS+ countries, breaking through language, cultural, and political barriers to amplify their stories globally and proactively connect them with the people, partners, and capital they need to grow beyond their borders.**

The purpose of this site is to serve as the MVP for Brandmine where we curate a select small percentage of the brands and founders in our database.

The site supports:
- **Three languages**: English (`en`), Russian (`ru`), Chinese (`zh`)
- A **dimension-based discovery model** (market, sector, attribute, signal)
- Custom includes for maps, dimension clouds, related brand logic, and language switching
- Integration with MapLibre for interactive maps

---

# 🗂 Folder Structure

```
_brands/{lang}/       — One Markdown file per brand
_founders/{lang}/     — One Markdown file per founder
_dimensions/{lang}/{type}/  — Dimension definition files per type (markets, sectors, attributes, signals)
_data/                — YAML/JSON data (translations, navigation, social, market_sectors, etc.)
_includes/            — Reusable partials (components, layout, pages, helpers)
_layouts/             — Jekyll layouts (default, brand, sector, dimension, etc.)
_insights/{lang}/     — Insight article content
pages/{lang}/         — Main content pages (about, brands, discovery, etc.)
assets/               — CSS, JS, fonts, images
_docs/                — Project documentation and guidelines
_templates/{type}/    — Markdown and HTML templates for scaffolding
_scripts/             — CLI scripts organized by function (validation, image processing, etc.)
_exports/             — Exported artifacts (search index, reports)
_site/                — Generated site output (Jekyll build directory)
_config.yml           — Site config, collections, language routing
index.html            — Entry point redirect to /en/index.html
```

---

# 🏷️ Dimensions System

Dimensions are stored as Markdown files in `_dimensions/{lang}/{type}/`. Each file contains:
- A front matter section with name, slug, type, and optionally description
- Content describing the dimension in more detail

**Valid dimension types** include (slugs match filenames in `_dimensions/{lang}/{type}/`):
- `markets` — e.g. brazil, china, egypt, ethiopia, india, indonesia, iran, malaysia, mongolia, russia, south-africa, uae
- `sectors` — e.g. artisan-ceramics, artisan-confectionery, artisanal-spirits, cured-meats
- `attributes` — e.g. artisanal-excellence, cultural-bridge, founder-led, heritage-brand, innovation-leader, premium-positioning, regional-icon, sustainability-pioneer
- `signals` — e.g. export-ready, franchise-ready, investment-ready, rapid-growth

You can review the full set of valid slugs in the corresponding `_dimensions/{lang}/{type}/` directories.

Brands reference dimensions in front matter like this:

```yaml
---
title: ru-BioGlow
ref: ru-bioglow
lang: en
sector: natural-beauty
dimensions: [organic, india, founder-led]
---
```

**CRITICAL TAXONOMY RULES:**
- Do **not create new dimension types**. Always use the four approved ones.
- Dimension filtering occurs on `/brands`, and dimension exploration happens via `/discover`
- Dimensions are defined as individual Markdown files and referenced in brand front matter using the correct slug

---

# 📁 Architecture Overview

## Unified Data-Driven Architecture - FULLY IMPLEMENTED

Brandmine has achieved **complete data-driven configuration** across ALL content types. See `_docs/architecture.md` for comprehensive details.

**Key Achievement: 100% Architectural Consistency**
- **ALL content types** (insights, brands, founders, pages) use centralized section control
- **ALL images** use semantic structure via collection-image system
- **ALL layouts** follow consistent "Logic Light" patterns
- **NO front matter section arrays** - everything centralized in _data/page_sections.yml

**Achieved Pattern: Configuration over conditionals - FULLY IMPLEMENTED**
```liquid
{% comment %} OLD PATTERN - Eliminated {% endcomment %}
{% if page.layout == "brands" %}
  {% assign panel_type = "panel--hero" %}
{% endif %}

{% comment %} UNIVERSAL PATTERN - Used everywhere {% endcomment %}
{% include helpers/page-sections.html page_type="brands" %}
```

## Centralized Configuration Files - FULLY IMPLEMENTED

- `_data/page_sections.yml` - **Universal section control** for ALL content types (insights, brands, founders, pages)
- `_data/component_defaults.yml` - Component behavior defaults across all collections
- `_data/dimensions_config.yml` - Dimension lists, ordering, and metadata
- `_data/search_presets.yml` - Search filter presets configuration
- `_data/translations/{lang}.yml` - UI text and labels

**Architecture Achievement:** 100% consistency - no content type exceptions

## Linear Layout Requirements

**CRITICAL:** Brandmine has deliberately eliminated sidebar complexity for MVP simplicity. All new layouts must follow the linear sectioning architecture:

- **NO SIDEBAR LAYOUTS:** Do not create grid-based layouts with sidebar components
- **NO BOOTSTRAP GRID:** Avoid complex grid systems in favor of simple section flow  
- **USE PANEL WRAPPING:** All content sections must be wrapped in the panel system
- **SEMANTIC SECTIONS:** Each section must use proper `<section>` tags with IDs and ARIA attributes
- **MOBILE-FIRST:** Linear flow ensures consistent behavior across all devices

---

# 🌐 Multilingual Logic

- **All content exists in language-specific subfolders**: `/en/`, `/ru/`, `/zh/`
- `_data/translations/{lang}.yml` stores UI labels and common text strings
- `_data/navigation/{lang}.yml` configures nav structure per language
- Layouts and includes dynamically pull from `_data/` based on `page.lang`
- Language switcher and all permalinks respect language prefixing

**Translation Helper Pattern (use this):**
```liquid
{% include helpers/t.html key="about.perspective_title" fallback="Our Unique Perspective" %}
```

---

# 🎨 Code Style Guidelines

## File Naming Conventions
- **Files**: `kebab-case.html`, `kebab-case.css`
- **Variables**: camelCase for JavaScript, kebab-case for CSS
- **Classes**: BEM format `.block__element--modifier`
- **Content Files**: `[country-code]-[brand-name].md` (e.g., `ru-teatime.md`)

## CSS Organization
- Mobile-first and responsive, using **BEM** naming and CSS custom properties
- Styles organized under `/assets/css/`: `tokens/`, `base/`, `layout/`, `components/`, `pages/`, `manifest/`
- CSS component structure mirrors includes organization
- See `_docs/technical-reference.md` for detailed patterns

## HTML Standards
- Semantic HTML5 with BEM class structure
- `id`s used for JS targeting, ARIA attributes for accessibility
- Use includes for reusable components
- Keep language-specific content in the appropriate language subfolder

## Front Matter Standards - Unified Pattern
```yaml
---
layout: brand-profile    # Required: layout type
title: "Brand Name"      # Required: display name
ref: "xx-brand-slug"    # Required: global identifier
lang: en                 # Required: language code
country_code: "ru"       # Required: ISO country code
permalink: /en/brands/ru-brand/  # Required: full URL path

# Semantic image structure (ALL content types)
images:
  hero:
    name: "descriptive-name"
    alt: "Alt text description"
    ext: "jpg"
  logo:
    name: "brand-logo"
    alt: "Brand logo"
    ext: "png"

# Taxonomy (use existing dimension slugs only)
sectors: ["wine"]
markets: ["russia"] 
attributes: ["founder-led"]
signals: ["export-ready"]

# NO sections: array - ALL sections controlled centrally
---
```

---

# 🖼️ Image Strategy - Unified Semantic System

- **Standard aspect ratios**: 3:2 horizontal (1200×800px), 2:3 vertical (800×1200px), 1:1 square (512×512px)
- **Naming convention**: `purpose-imagename.jpg` (e.g., `hero-storefront.jpg`)
- **Processing**: Unified script `core/process_images.sh [collection] [identifier]`
- **Organization**: By collection type in assets directory

**Universal Image Structure (ALL content types):**
```yaml
images:
  hero:
    name: "descriptive-name"  # e.g., "moscow-market", "founder-workshop"
    alt: "Descriptive alt text for accessibility"
    ext: "jpg"
  logo:
    name: "logo-name"
    alt: "Logo description"
    ext: "png"
```

**Image Processing Workflow:**
```bash
# Place original images in originals/ directory
# Process with appropriate script
_scripts/core/process_images.sh brands [country]-[brand]
```

**Key Achievement:** 100% semantic image implementation across all content types

See `_docs/images.md` for comprehensive image guide and `_docs/colors.md` for visual style standards.

---

# 💻 Development Workflow

## Quick Commands
```bash
# Development server
bundle exec jekyll serve --livereload

# Production build  
JEKYLL_ENV=production bundle exec jekyll build

# Pre-commit validation
_scripts/core/pre-commit_check.sh
```

## Content Creation
For step-by-step workflows, see `_docs/daily-workflows.md`:
- Adding brands, founders, dimensions, insights
- Image processing and optimization
- Translation management
- Testing and validation

## Core Scripts
- `core/generate-all-json.py` - Generate all JSON data files
- `validation/language_consistency_checker.py` - Check content exists in all languages
- `utilities/generate-language-map.py` - Generate language switcher optimization

---

# 📊 Data Management

## Collections - Unified Architecture

**ALL collections follow identical patterns:**

- **Section Control:** Centralized via `_data/page_sections.yml`
- **Image System:** Semantic structure using `collection-image.html`
- **Front Matter:** Clean, consistent YAML without embedded logic
- **Multilingual:** Same structure across EN/RU/ZH

**Content Types:**
- **Insights**: `_insights/{lang}/[article-slug].md` - Four categories: Brand Spotlight, Founder's Journey, Market Momentum, Location Intelligence
- **Brands**: `_brands/{lang}/[country-code]-[brand-name].md` - Brand profiles with business intelligence
- **Founders**: `_founders/{lang}/[founder-id].md` - Founder narratives and achievements
- **Dimensions**: `_dimensions/{lang}/{type}/[dimension-slug].md` - Taxonomy definitions

**Key Achievement:** All collections use identical architectural patterns

## Search Index Automation
```bash
# Auto-generates search indexes from markdown collections
python3 _scripts/core/generate-all-json.py
```

## Blog Features
- **Insights Platform**: Full blog functionality with featured articles, pagination, RSS feeds
- **Founders' Journal**: Personal blog documenting the Brandmine journey
- **Multilingual Support**: Full functionality across EN/RU/ZH languages

---

# 🔧 Technical References

For detailed technical information, consult these specialized documentation files:

- **`_docs/architecture.md`** - "Logic Light" patterns, data-driven architecture, component systems
- **`_docs/technical-reference.md`** - CSS architecture, component patterns, countries data system, performance optimizations
- **`_docs/daily-workflows.md`** - Step-by-step content creation, image processing, testing workflows
- **`_docs/setup-guide.md`** - Environment setup and quick start
- **`_docs/troubleshooting.md`** - Common issues and solutions

---

# 🧠 Claude Development Guidelines

## Content Creation - Unified Approach

**ALL content types follow identical patterns:**

1. **No Section Arrays in Front Matter** - ALL content uses centralized section control
2. **Semantic Image Structure** - ALL content uses `images:` object pattern
3. **Clean YAML** - Front matter contains data only, no embedded logic
4. **Consistent Testing** - Same validation applies to all content types
5. **Component Reuse** - Look for opportunities to reuse existing components

**Template Pattern (Universal):**
```yaml
---
layout: [content-type]
ref: xx-content-slug
title: "Content Title"
lang: en
permalink: /en/[collection]/xx-content-slug/

# Semantic image structure (universal pattern)
images:
  hero:
    name: "descriptive-name"
    alt: "Descriptive alt text"
    ext: "jpg"

# NO sections: array - controlled centrally
---
```

## Brand Profile Creation
```bash
# Use template generator
python3 _scripts/content-creation/generate_brand_template.py ru teatime

# Process images
_scripts/core/process_images.sh brands ru-teatime

# Update search indexes
_scripts/core/generate-all-json.py
```

## Validation & Testing
```bash
# Run full validation suite before commits
_scripts/core/pre-commit_check.sh

# Test build performance (should be ~12-13s)
time JEKYLL_ENV=production bundle exec jekyll build
```

---

# 🎯 Architecture Achievement: Complete Data-Driven Implementation

## Unified Consistency Achieved

Brandmine has achieved **100% architectural consistency** across all content types:

### Section Control ✅
- **Insights:** Centralized via `_data/page_sections.yml`
- **Brands:** Centralized via `_data/page_sections.yml`  
- **Founders:** Centralized via `_data/page_sections.yml`
- **Pages:** Centralized via `_data/page_sections.yml`

### Image System ✅
- **Insights:** Semantic structure via `collection-image.html`
- **Brands:** Semantic structure via `collection-image.html`
- **Founders:** Semantic structure via `collection-image.html`

### Data-Driven Configuration ✅
- **ALL content types** use centralized configuration
- **NO embedded logic** in front matter
- **NO content-type exceptions** to architectural patterns

## Benefits Realized

1. **Simplified Development** - One pattern to learn and maintain
2. **Faster Content Creation** - Consistent templates across all types
3. **Reduced Complexity** - No special cases or exceptions
4. **Enhanced Maintainability** - Single source of truth for all logic
5. **Improved Performance** - Unified, optimized processing

## Technical Excellence Metrics

- **Architecture Consistency:** 100%
- **Content Types Using Centralized Sections:** 4/4
- **Content Types Using Semantic Images:** 3/3
- **Front Matter Section Arrays:** 0 (eliminated)
- **Hardcoded Image Paths:** 0 (eliminated)

---

# important-instruction-reminders
Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.