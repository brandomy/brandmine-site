# CLAUDE.md

Master project guide for Claude Code collaboration on Brandmine.

---

# 🧭 Project Overview

**Brandmine** is a multilingual Jekyll site showcasing exceptional founder-led brands from the Global South with founder stories and dimension-based discovery.

**Architecture**: Three languages (EN/RU/ZH), static Jekyll site, GitHub Pages deployment, Jekyll 3.9.5.

---

# 🗂 Key Structure

```
_brands/{lang}/           — Brand profiles (customer-facing)
_founders/{lang}/         — Founder profiles (customer-facing)
_dimensions/{lang}/{type}/ — Taxonomy (markets, sectors, attributes, signals)
_insights/{lang}/         — Blog content (customer-facing insights)
_journal/{lang}/          — Internal blog (development journey)
_pages/{lang}/            — Static pages (about, contact, etc.)
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

# 🎨 Official Color System (NEVER CHANGE)

Brand Colours
| **Primary Brand** | Teal | `--primary-*` | `#38B2AC` |
| **Secondary** | Orange | `--secondary-*` | `#F97316` |
| **Accent** | Indigo | `--accent-*` | `#6366F1` |


## Dimension Colors
| Type | Color | CSS Property | HEX Code |
|------|-------|--------------|----------|
| **Sectors** | Olive Green | `--olive-*` | `#A3B763` |
| **Markets** | Sky Blue | `--sky-*` | `#0EA5E9` |
| **Attributes** | Orange | `--secondary-*` | `#F97316` |
| **Signals** | Indigo | `--accent-*` | `#6366F1` |


## Insight Category Colors (Aligned with Dimensions)
| Category | Color | CSS Property | HEX Code |
|----------|-------|--------------|----------|
| **Brand Spotlight** | Orange | `--secondary-*` | `#F97316` |
| **Founder's Journey** | Indigo | `--accent-*` | `#6366F1` |
| **Location Intelligence** | Sky Blue | `--sky-*` | `#0EA5E9` |
| **Market Momentum** | Olive Green | `--olive-*` | `#A3B763` |

**Critical Rule**: Insight categories use SAME colors as dimension types for consistency.

---

# 🎯 BEM-Compliant Panel System

**IMPORTANT**: Use BEM classes for new development. Legacy classes still work.

## Panel Types Available
```scss
/* Hero panels */
.panel--hero                    /* Navigation pages */
.panel--hero-subtle             /* Profile pages */
.panel--hero-split              /* Side-by-side layout */
.panel--hero-card               /* Card-based layout */

/* Color panels */
.panel--light                   /* White background */
.panel--secondary-soft          /* Light orange */
.panel--accent-soft             /* Light purple */
.panel--neutral-soft            /* Light gray */
.panel--sky-soft                /* Light blue */
.panel--olive-soft              /* Light green */
```

## BEM Usage for New Development
```html
<!-- ✅ CORRECT: BEM-compliant -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary--hero">Title</h1>
    <p class="panel__subtitle--hero">Subtitle</p>
  </div>
</div>

<div class="panel panel--secondary-soft">
  <div class="panel__content--secondary-soft">
    <h2 class="panel__heading-secondary--secondary-soft">Section</h2>
    <p class="panel__lead-text--secondary-soft">Content</p>
  </div>
</div>

<!-- ❌ LEGACY: Still works but not preferred for new development -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary">Title</h1>
  </div>
</div>
```

---

# 🏗️ Architecture Principles

## "Logic Light" Philosophy
**3-layer architecture: Configuration → Processing → Styling**

```yaml
# _data/page_sections.yml - Configuration layer
brand-profile:
  panel_mappings:
    identity:
      type: panel--hero-subtle  # Drives styling automatically

# _data/component_defaults.yml - Component behavior
cards:
  brand-card:
    show_location: true
    tag_limit: 4
```

**Pattern: Use page-sections helper (processes configuration)**
```liquid
{% include helpers/page-sections.html page_type="brands" %}
```

**Flow**: `page_sections.yml` → `page-sections.html` → `panel-types.scss` → Beautiful UI

## Mobile-First Responsive Design
**Always use min-width breakpoints:**
```scss
/* Mobile-first base styles */
.component {
  width: 100%;
}

/* Tablet and up */
@media (min-width: 768px) {
  .component {
    width: var(--card-width-standard);
  }
}

/* Desktop and up */
@media (min-width: 1024px) {
  .component {
    width: var(--card-width-featured);
  }
}
```

**Never use max-width** - always progressive enhancement.

## Card System
**Single components with simple variants:**
```liquid
{% include components/cards/brand-card.html brand=brand %}                    <!-- Standard -->
{% include components/cards/brand-card.html brand=brand variant="featured" %} <!-- Featured -->
{% include components/cards/insight-card.html insight=insight variant="compact" %} <!-- Compact -->
```

## Tagline Component
**Accessible tagline with Global South messaging:**
```liquid
{% include components/tagline.html variant="short" %}   <!-- Footer/mobile -->
{% include components/tagline.html variant="full" %}    <!-- Hero sections -->
{% include components/tagline.html variant="short" show_emoji=false %} <!-- Print/formal -->
```

**Translation Structure:**
```yaml
footer:
  tagline_full: "🔆 Illuminating and Elevating Exceptional Founder-led Brands from the Global South"
  tagline_short: "🔆 Where Global South brands gain global recognition"
  tagline_emoji_label: "Sun emoji"  # For screen readers
```

**Accessibility Features:**
- Emoji with `aria-label` and `role="img"`
- Proper screen reader support
- Mobile-first responsive typography
- BEM CSS methodology

---

# 💻 Essential Commands

```bash
# Development (Jekyll 3.9.5 - no --livereload)
bundle exec jekyll serve

# Production build
JEKYLL_ENV=production bundle exec jekyll build

# Validation
_scripts/core/pre-commit_check.sh

# Image processing
_scripts/core/process_images.sh [collection] [identifier]
```

---

# 📚 Documentation Reference

**Complete details**: See `_docs/technical-standards.md` for comprehensive technical documentation.

**4-document system**:
- `_docs/brandmine-guide.md` - Master navigation
- `_docs/setup-and-workflows.md` - Complete workflows
- `_docs/technical-standards.md` - Architecture patterns
- `_docs/troubleshooting-and-tools.md` - Problem resolution

---

# ⚠️ Critical Rules for Claude Code

## NEVER DO
- Create new dimension types (only: markets, sectors, attributes, signals)
- Change insight category colors (use exact colors specified above)
- Use max-width media queries (always min-width)
- Create separate component files for variants (use variant logic)
- Use non-BEM classes for new panel development

## ALWAYS DO
- Use Jekyll 3.9.5 compatible commands (no --livereload)
- Create matching CSS files for HTML components
- Use mobile-first approach with min-width
- Use BEM-compliant panel classes for new development
- Prefer editing existing files over creating new ones
- Use official color system for insight categories

## CSS Organization
```
_includes/components/cards/brand-card.html
assets/css/components/cards/brand-card.scss
```
**Rule**: Every HTML component gets a matching CSS file.

## Content Width Standards
- **Editorial content**: 700px (`--form-max-width`)
- **Profile pages**: Mixed layout (1024px + 700px sections)
- **Grid layouts**: Full width (1200px)

---

**For complete technical details, architectural patterns, and implementation guidelines, see `_docs/technical-standards.md`**
