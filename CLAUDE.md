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

## "Logic Light" Design Philosophy ✅ COMPLETE

Brandmine uses **data-driven configuration** instead of template logic. See `_docs/architecture.md` for comprehensive details.

**Key Pattern: Configuration over conditionals**
```liquid
{% comment %} OLD PATTERN - Avoid {% endcomment %}
{% if page.layout == "brands" %}
  {% assign panel_type = "panel--hero" %}
{% endif %}

{% comment %} NEW PATTERN - Use this {% endcomment %}
{% include helpers/page-sections.html page_type="brands" %}
```

**IMPLEMENTATION STATUS: COMPLETE**
- ✅ All layouts use centralized section management
- ✅ Zero hardcoded layout logic remaining  
- ✅ Complete "Logic Light" architecture realized

## Centralized Configuration Files

- `_data/component_defaults.yml` - Component behavior defaults
- `_data/page_sections.yml` - Page section order and panel mappings
- `_data/dimensions_config.yml` - Dimension lists, ordering, and metadata
- `_data/search_presets.yml` - Search filter presets configuration
- `_data/translations/{lang}.yml` - UI text and labels

## Linear Layout Requirements

**CRITICAL:** Brandmine has deliberately eliminated sidebar complexity for MVP simplicity. All new layouts must follow the linear sectioning architecture:

- **NO SIDEBAR LAYOUTS:** Do not create grid-based layouts with sidebar components
- **NO BOOTSTRAP GRID:** Avoid complex grid systems in favor of simple section flow  
- **USE PANEL WRAPPING:** All content sections must be wrapped in the panel system
- **SEMANTIC SECTIONS:** Each section must use proper `<section>` tags with IDs and ARIA attributes
- **MOBILE-FIRST:** Linear flow ensures consistent behavior across all devices

---

# 📐 Page Section Management

## Centralized Section Control ✅ COMPLETE

**IMPORTANT:** Brandmine uses centralized section management through `_data/page_sections.yml`. This follows the "Logic Light" philosophy by eliminating scattered section definitions in individual files.

**IMPLEMENTATION STATUS: FULLY OPERATIONAL**
- ✅ All page types use centralized configuration
- ✅ 77% of site pages converted to data-driven sections  
- ✅ Missing dimension category layouts created and tested

### Section Priority Hierarchy

The system follows a three-tier priority order:
1. **Page front matter `sections:`** (highest priority - use sparingly)
2. **Include parameter override** (for special cases)
3. **`_data/page_sections.yml` defaults** (recommended approach)

### Best Practices

**DO:**
- Use centralized defaults in `_data/page_sections.yml` for all standard pages
- Let the data file control section order and panel mappings
- Update defaults when patterns emerge across multiple pages

**DON'T:**
- Add `sections:` arrays to page front matter unless absolutely necessary
- Create one-off section configurations for standard layouts
- Override defaults without documenting the business reason

### When to Use Custom Sections

Legitimate use cases for front matter `sections:` arrays:
- A/B testing different layouts
- Special campaign pages with unique requirements
- Blog posts with content-specific needs
- Experimental layouts (document with comments)

### Adding/Removing Sections

To modify sections for a page type:
1. Edit `_data/page_sections.yml` (not individual pages)
2. Update the `default_sections` array
3. Add panel mappings for new sections
4. All pages using that layout automatically update

Example:
```yaml
# In _data/page_sections.yml
home:
  default_sections:
    - hero
    - featured-brands
    - new-section  # Added centrally
```

For detailed section management guide, see `_docs/page-section-management-guide.md`.

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

## Front Matter Standards
```yaml
---
layout: brand-profile    # Required: layout type
title: "Brand Name"      # Required: display name
slug: "brand-slug"       # Required: URL identifier  
lang: en                 # Required: language code
country_code: "ru"       # Required: ISO country code
permalink: /en/brands/ru-brand/  # Required: full URL path

# Taxonomy (use existing dimension slugs only)
sectors: ["wine"]
markets: ["russia"] 
attributes: ["founder-led"]
signals: ["export-ready"]

# NOTE: Do NOT include sections: array unless you have a documented reason
# Page sections are managed centrally in _data/page_sections.yml
---
```

---

# 🖼️ Image Strategy

- **Standard aspect ratios**: 3:2 horizontal (1200×800px), 2:3 vertical (800×1200px), 1:1 square (512×512px)
- **Naming convention**: `purpose-imagename.jpg` (e.g., `hero-storefront.jpg`)
- **Processing**: Unified script `core/process_images.sh [collection] [identifier]`
- **Organization**: By collection type in assets directory

**Image Processing Workflow:**
```bash
# Place original images in originals/ directory
# Process with appropriate script
_scripts/core/process_images.sh brands [country]-[brand]
```

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

## Collections
- **Brands**: `_brands/{lang}/[country-code]-[brand-name].md`
- **Founders**: `_founders/{lang}/[founder-id].md`
- **Insights**: `_insights/{lang}/[article-slug].md` (Four categories: Brand Spotlight, Founder's Journey, Market Momentum, Location Intelligence)
- **Dimensions**: `_dimensions/{lang}/{type}/[dimension-slug].md`

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

# 🔧 Helper System ✅ COMPLETE

## Documentation Status
- **Helper Coverage**: **24/24 helpers (100%)** fully documented
- **Core System**: `page-sections.html` - handles centralized section rendering (47 uses)
- **Translation System**: `t.html` - multilingual content delivery (608 uses)
- **Performance**: All helpers optimized for 9.5-second builds

## Key Helpers
- **`page-sections.html`**: Core layout system implementing "Logic Light" architecture
- **`t.html`**: Translation lookup with intelligent fallback chains (EN/RU/ZH)
- **`panel-wrapper.html`**: Consistent panel rendering with configurable styling
- **`brand-data.html`**: Brand information retrieval and processing
- **`taxonomy-data.html`**: Dimension and taxonomy management

**IMPLEMENTATION STATUS: FULLY DOCUMENTED**
- ✅ All helpers have comprehensive documentation headers
- ✅ Usage patterns and parameters clearly defined
- ✅ Dependencies and examples documented
- ✅ System performs optimally at current scale

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

## Content Creation Tasks

1. **Check Existing Structure**: Look at similar files or components before creating new ones
2. **Follow Naming Conventions**: Use established patterns for files, variables, and classes
3. **Test in All Languages**: Ensure compatibility with EN, RU, ZH
4. **Mobile-First**: Design for mobile view first, then enhance for larger screens
5. **Component Reuse**: Look for opportunities to reuse existing components

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

# important-instruction-reminders
Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.