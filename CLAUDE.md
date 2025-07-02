# CLAUDE.md

Master project guide for Claude Code collaboration on Brandmine.

---

# 🧭 Project Overview

**Brandmine** is a multilingual Jekyll site showcasing BRICS+ consumer brands with founder stories and dimension-based discovery.

## Business Mission
Illuminate exceptional founder-led brands from BRICS+ countries, connecting them globally with partners and capital for growth.

**Architecture**: Three languages (EN/RU/ZH), static Jekyll site, GitHub Pages deployment.

---

# 🗂 Key Structure

```
_brands/{lang}/           — Brand profiles
_founders/{lang}/         — Founder profiles
_dimensions/{lang}/{type}/ — Taxonomy (markets, sectors, attributes, signals)
_insights/{lang}/         — Blog content
_data/                    — Configuration and translations
_includes/                — Reusable components
assets/                   — CSS, JS, images
```

---

# 🏷️ Dimensions System

**Four dimension types** (never create new types):
- `markets` — Geographic regions (brazil, russia, china)
- `sectors` — Industries (wine, natural-beauty, artisanal-spirits)
- `attributes` — Brand qualities (founder-led, heritage-brand)
- `signals` — Growth indicators (export-ready, franchise-ready)

**Brand taxonomy usage:**
```yaml
sectors: ["wine"]
markets: ["russia"]
attributes: ["founder-led"]
signals: ["export-ready"]
```

---

# 🎴 Proven Component System (Phase 1B Complete)

**Founder card architecture established:**
```liquid
{% include components/cards/founder-card.html founder=founder variant="standard" %}
{% include components/cards/founder-card-featured.html founder=founder %}
{% include components/cards/founder-quote-card.html quote=quote founder=founder style="hero" %}
```

**BEM namespaces standardized:**
- `founder-card__*` - Standard biographical profiles
- `founder-card-featured__*` - Homepage carousel/featured displays  
- `founder-quote-card__*` - Quote attribution cards

**CSS boundary rules enforced:**
- Cards handle: typography, spacing, colors, internal layout
- Layouts handle: positioning, margins, grid/carousel structure
- Zero cross-component violations maintained

**Configuration-driven behavior** via `_data/component_defaults.yml`.

---

# 📁 Data-Driven Architecture

**Core principle**: Configuration over conditionals.

**Current pattern:**
```liquid
{% include helpers/page-sections.html page_type="brands" %}
```

**Centralized configuration:**
- `_data/page_sections.yml` - Section control
- `_data/component_defaults.yml` - Component behavior
- `_data/translations/{lang}.yml` - UI text

---

# 🎨 Essential Standards

## File Naming
- **Files**: `kebab-case.html`, `kebab-case.scss`
- **Content**: `[country-code]-[brand-name].md`
- **Images**: `purpose-description.jpg`

## Front Matter
```yaml
---
layout: brand-profile
title: "Brand Name"
ref: "xx-brand-slug"
lang: en
country_code: "ru"
permalink: /en/brands/ru-brand/

# Semantic image structure
images:
  hero:
    name: "storefront"
    alt: "Description"
    ext: "jpg"

# Taxonomy (existing slugs only)
sectors: ["wine"]
markets: ["russia"]
---
```

## Color System
| Type | Color | CSS Property |
|------|-------|--------------|
| **Sectors** | Olive Green | `--olive-*` |
| **Markets** | Sky Blue | `--sky-*` |
| **Attributes** | Orange | `--secondary-*` |
| **Signals** | Indigo | `--accent-*` |

---

# 💻 Essential Commands

```bash
# Development
bundle exec jekyll serve --livereload

# Production build (achieved: 21s initial, 5.5s incremental)
JEKYLL_ENV=production bundle exec jekyll build

# Validation
_scripts/core/pre-commit_check.sh

# Image processing
_scripts/core/process_images.sh [collection] [identifier]

# Performance optimization
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
```

---

# 📚 Documentation Architecture

**4-document system** (find anything in 30 seconds):
- `_docs/brandmine-guide.md` - Master navigation hub
- `_docs/setup-and-workflows.md` - Complete workflows
- `_docs/technical-standards.md` - Architecture patterns and standards
- `_docs/troubleshooting-and-tools.md` - Problem resolution

**Operational guides**: `_templates/tutorials/` for step-by-step workflows.

---

# 🎯 Proven Development Principles

1. **Clean BEM architecture** - Separate namespaces for distinct components
2. **CSS boundary compliance** - Cards vs layouts separation enforced
3. **Systematic implementation** - Audit → Plan → Execute → Validate methodology
4. **Performance-conscious** - Maintain incremental build efficiency
5. **Documentation-driven** - Standards codified for team development

## Validation Workflow
```bash
# Before commits
_scripts/core/pre-commit_check.sh

# Verify universal card usage
find _includes/components/cards/ -name "*-card.html" | wc -l  # Should show MVP cards
```

---

# important-instruction-reminders
- Do what has been asked; nothing more, nothing less
- NEVER create files unless absolutely necessary
- ALWAYS prefer editing existing files over creating new ones
- NEVER proactively create documentation files unless explicitly requested
