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

# 🎴 Mobile-First Card System (Phase 1B Complete)

## Universal Card Architecture

**Single-component with variants pattern established:**
```liquid
{% raw %}{% include components/cards/brand-card.html brand=brand %}                      <!-- Standard -->
{% include components/cards/brand-card.html brand=brand variant="featured" %}   <!-- Featured -->
{% include components/cards/insight-card.html insight=insight %}                <!-- Standard (1A) -->
{% include components/cards/insight-card.html insight=insight variant="tagged" %} <!-- With tags (1B) -->
{% include components/cards/insight-card.html insight=insight variant="featured" %} <!-- Premium (1C) -->{% endraw %}
```

**Mobile-first responsive tokens:**
```css
--card-width-atomic: 345px;     /* Mobile base */
--card-width-standard: 360px;   /* Desktop base */
--card-width-featured: 450px;   /* Desktop featured */
--card-width-mini: 345px;       /* Always compact */
```

**BEM namespaces standardized:**
- `brand-card__*` - Brand profile cards with taxonomy tags
- `insight-card__*` - Article/content cards with category badges
- `founder-card__*` - Biographical profile cards

**Simple variant implementation:**
- One HTML file per card type with `{% raw %}{% if variant == "name" %}{% endraw %}` blocks
- Shared CSS classes: `.card__tag--sector`, `.card__tag--market`
- No complex scoping or specificity conflicts
- Easy to extend with new variants

**CSS boundary rules enforced:**
- Cards handle: typography, spacing, colors, internal layout, responsive sizing
- Layouts handle: positioning, margins, grid/carousel structure
- Zero cross-component violations maintained

**Configuration-driven behavior** via `_data/component_defaults.yml`.

---

# 📁 Data-Driven Architecture

**Core principle**: Configuration over conditionals.

**Current pattern:**
```liquid
{% raw %}{% include helpers/page-sections.html page_type="brands" %}{% endraw %}
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

## Card Sizing System
**Mobile-first responsive design with design tokens:**

| Token | Mobile (345px) | Desktop (768px+) | Purpose |
|-------|----------------|------------------|---------|
| `--card-width-atomic` | 345px | 345px | Base mobile size |
| `--card-width-standard` | 345px | 360px | Standard cards |
| `--card-width-featured` | 345px | 450px | Featured/hero cards |
| `--card-width-mini` | 345px | 345px | Always compact |

**Implementation:**
```scss
.card {
  width: var(--card-width-atomic);    /* 345px mobile */
  max-width: 100%;
  
  @media (min-width: 768px) {
    width: var(--card-width-standard); /* 360px desktop */
  }
}
```

## Dimension Color System
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

1. **Mobile-first responsive design** - 345px → 360px card sizing with design tokens
2. **Simple variant architecture** - Single component files with `{% raw %}{% if variant %}{% endraw %}` logic  
3. **Clean BEM architecture** - Separate namespaces for distinct components
4. **CSS boundary compliance** - Cards vs layouts separation enforced
5. **Systematic implementation** - Audit → Plan → Execute → Validate methodology
6. **Performance-conscious** - Maintain incremental build efficiency
7. **Documentation-driven** - Standards codified for team development

## Card Development Workflow
```liquid
# Create new card variant (example)
# 1. Add variant logic to existing card HTML:
{% raw %}{% if variant == "compact" %}
  <!-- Compact variant HTML -->
{% else %}
  <!-- Standard variant HTML -->  
{% endif %}{% endraw %}
```

```scss
# 2. Add variant CSS classes:
.card--compact { /* variant-specific styles */ }
```

```liquid
# 3. Test variants:
variant="standard"  # Default
variant="featured"  # Enhanced
variant="tagged"    # With taxonomy tags
variant="compact"   # Minimal display
```

## Validation Workflow
```bash
# Before commits
_scripts/core/pre-commit_check.sh

# Verify card system consistency
grep -r "variant=" _includes/components/cards/  # Check variant usage
find _includes/components/cards/ -name "*-card.html" | wc -l  # Should show clean card count
```

---

# important-instruction-reminders
- Do what has been asked; nothing more, nothing less
- NEVER create files unless absolutely necessary
- ALWAYS prefer editing existing files over creating new ones
- NEVER proactively create documentation files unless explicitly requested
