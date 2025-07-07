# CLAUDE.md

Master project guide for Claude Code collaboration on Brandmine.

---

# 🧭 Project Overview

**Brandmine** is a multilingual Jekyll site showcasing BRICS+ consumer brands with founder stories and dimension-based discovery.

## Business Mission
Illuminate exceptional founder-led brands from BRICS+ countries, connecting them globally with partners and capital for growth.

**Architecture**: Three languages (EN/RU/ZH), static Jekyll site, GitHub Pages deployment, Jekyll 3.9.5.

---

# 🗂 Key Structure

```
_brands/{lang}/           — Brand profiles (customer-facing)
_founders/{lang}/         — Founder profiles (customer-facing)
_dimensions/{lang}/{type}/ — Taxonomy (markets, sectors, attributes, signals)
_insights/{lang}/         — Blog content (customer-facing insights)
_journal/{lang}/          — Internal blog (inward-looking, development journey)
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

# 🎨 Brandmine Color System (OFFICIAL STANDARDS)

## Dimension Colors (Taxonomy)
| Type | Color | CSS Property | Usage |
|------|-------|--------------|-------|
| **Sectors** | Olive Green | `--olive-*` | Industry categories |
| **Markets** | Sky Blue | `--sky-*` | Geographic regions |
| **Attributes** | Orange | `--secondary-*` | Brand qualities |
| **Signals** | Indigo | `--accent-*` | Growth indicators |

## Insight Category Colors (NEVER CHANGE)
| Category | Color | CSS Property | Business Context |
|----------|-------|--------------|------------------|
| **Brand Spotlight** | Orange | `--secondary-*` | Investment opportunities |
| **Founder's Journey** | Purple | `--accent-*` | Leadership excellence |
| **Location Intelligence** | Sky Blue | `--sky-*` | Geographic intelligence |
| **Market Momentum** | Olive Green | `--olive-*` | Market trends |

**Critical Rule**: Insight categories use SAME colors as dimension types for consistency:
- Brand Spotlight = Attributes (both about brand qualities)
- Founder's Journey = Signals (both about growth/leadership)
- Location Intelligence = Markets (both geographic)
- Market Momentum = Sectors (both about industries/trends)

---

# 🏗️ Architecture Principles

## "Logic Light" Philosophy
**Data-driven configuration over template conditionals:**

```yaml
# _data/page_sections.yml - Controls all page structure
brands:
  sections: ["hero", "impact", "content", "contact-cta"]
  hero:
    panel_type: "panel--hero"
    background: "gradient"

# _data/component_defaults.yml - Controls component behavior
cards:
  brand-card:
    show_location: true
    tag_limit: 4
```

## Separation of Concerns
**Clean boundaries between layers:**

### Cards Handle (Intrinsic Properties)
- Typography, colors, internal spacing
- Internal layout structure
- Component-specific behavior

### Layouts Handle (Extrinsic Properties)
- Positioning, margins, grid structure
- Page flow and sections
- Responsive container behavior

### Data Handles (Configuration)
- Content structure via `page_sections.yml`
- Component behavior via `component_defaults.yml`
- Translations via `translations/{lang}.yml`

### CSS File Organization
**Matching CSS files for components:**
```
_includes/components/cards/brand-card.html
assets/css/components/cards/brand-card.scss

_includes/components/ui/insight-category-new.html
assets/css/components/ui/insight-category.scss

_includes/pages/brands/hero.html
assets/css/pages/brands/hero.scss
```

**Benefits:**
- Easy debugging and isolation of styles
- Clear ownership of CSS rules
- Prevents cross-component style conflicts
- Simplifies maintenance and updates

## Clean Card Minimalism
**Single-component with simple variants:**
```liquid
{% raw %}{% include components/cards/brand-card.html brand=brand %}                    <!-- Standard -->
{% include components/cards/brand-card.html brand=brand variant="featured" %} <!-- Enhanced -->
{% include components/cards/brand-card.html brand=brand variant="related" %}  <!-- Minimal -->{% endraw %}
```

**No separate component files per variant** - uses `{% raw %}{% if variant %}{% endraw %}` logic within single files.

## Mobile-First Responsive Design
**Breakpoint strategy (always min-width):**
```scss
/* Mobile-first base styles */
.component {
  width: 100%;
  padding: var(--space-4);
}

/* Tablet and up */
@media (min-width: 768px) {
  .component {
    width: var(--card-width-standard);
    padding: var(--space-6);
  }
}

/* Desktop and up */
@media (min-width: 1024px) {
  .component {
    width: var(--card-width-featured);
  }
}
```

**Standard breakpoints (mobile-first with min-width):**
- **Mobile**: Base styles (no media query)
- **Tablet**: `@media (min-width: 768px)`
- **Desktop**: `@media (min-width: 1024px)`

---

# 🎴 Card System (Phase 1C Complete) ✅

## Card Variants Available
```liquid
{% raw %}{% include components/cards/brand-card.html brand=brand %}                      <!-- Standard -->
{% include components/cards/brand-card.html brand=brand variant="featured" %}   <!-- Featured -->
{% include components/cards/brand-card.html brand=brand variant="related" %}    <!-- Related (NEW) -->
{% include components/cards/insight-card.html insight=insight %}                <!-- Standard -->
{% include components/cards/insight-card.html insight=insight variant="tagged" %} <!-- With tags -->
{% include components/cards/insight-card.html insight=insight variant="featured" %} <!-- Premium -->
{% include components/cards/insight-card.html insight=insight variant="compact" %} <!-- Compact (NEW) -->{% endraw %}
```

## Mobile-First Card Sizing
**Responsive tokens with mobile-first approach:**
```css
--card-width-atomic: 345px;         /* Mobile base */
--card-width-standard: 360px;       /* Tablet+ base */
--card-width-featured: 450px;       /* Desktop featured */
--card-width-featured-lg: 480px;    /* Large desktop */
--card-width-mini: 345px;           /* Always compact */
```

**Implementation pattern:**
```scss
.card {
  width: var(--card-width-atomic);    /* 345px mobile-first */
  max-width: 100%;

  @media (min-width: 768px) {
    width: var(--card-width-standard); /* 360px tablet+ */
  }

  @media (min-width: 1024px) {
    width: var(--card-width-featured); /* 450px desktop */
  }
}
```

## Insight Category System (Complete) ✅
**Standardized UI component:**
```liquid
{% raw %}{% include components/ui/insight-category-new.html category="brand-spotlight" %}
{% include components/ui/insight-category-new.html category="founders-journey" %}
{% include components/ui/insight-category-new.html category="location-intelligence" %}
{% include components/ui/insight-category-new.html category="market-momentum" %}{% endraw %}
```

---

# 📝 Insights Discovery Architecture (Complete) ✅

## Three-Tier System
**Clean separation with consistent naming and Hero Card integration**

### **Tier 1: Insights Hub**
```liquid
{% raw %}_layouts/insights.html → _includes/pages/insights/
Purpose: Main navigation landing page
URL: /en/insights/
Components: Hero, category navigation, featured content, latest carousel
Hero Style: Hero Card approach{% endraw %}
```

### **Tier 2: Category Rollups**
```liquid
{% raw %}_layouts/insights-category.html → _includes/pages/insights-category/
Purpose: Category-specific insight listings (4 categories)
URLs: /en/insights/categories/{category}/
Components: Hero, insights grid, contact CTA
Hero Style: Hero Card with category-specific colors{% endraw %}
```

### **Tier 3: Individual Articles**
```liquid
{% raw %}_layouts/insight-article.html → _includes/pages/insight-article/
Purpose: Individual insight articles (trilingual)
URLs: /en/insights/{article-slug}/
Components: Hero, content, taxonomy, brand-info, related content
Hero Style: Hero Card (implemented){% endraw %}
```

## Naming Convention Standard
**PLURAL/SINGULAR Logic Pattern:**

| Context | Naming Pattern | Example | Rationale |
|---------|---------------|---------|-----------|
| **Collections** | `insights-*` | `insights-category.html` | Multiple insights per context |
| **Individual Items** | `insight-*` | `insight-article.html` | Single insight item |
| **Hub/Landing** | `insights` | `insights.html` | Multiple insights overview |

## Architecture Benefits
- **Clean Separation**: Each tier serves distinct purpose
- **Component Reuse**: Leverages established card components
- **Consistent Styling**: Hero Card approach across all tiers
- **Maintainable**: Clear naming eliminates confusion
- **Scalable**: Easy to add new categories or article types

## Implementation Status
- ✅ **Legacy Cleanup**: Removed 18 duplicate files, fixed broken paths
- ✅ **Naming Consistency**: Optimal PLURAL/SINGULAR pattern established
- ✅ **Hero Card Ready**: Tier 3 complete, Tiers 1-2 ready for styling
- ✅ **Build Performance**: <5 seconds maintained with clean architecture

## Integration with Card System
```liquid
{% raw %}<!-- Category pages use insight-card components -->
{% include components/cards/insight-card.html insight=insight variant="standard" %}

<!-- Individual articles use Hero Card approach -->
<!-- Implemented in insight-article/hero.html -->{% endraw %}
```

## Color System Integration
**Category-specific branding using official standards:**
- **Brand Spotlight**: Orange (`--secondary-*`)
- **Founder's Journey**: Indigo (`--accent-*`)
- **Location Intelligence**: Sky Blue (`--sky-*`)
- **Market Momentum**: Olive Green (`--olive-*`)

---

# 📝 Content Width Standards (Editorial Typography System)

## Editorial Content Philosophy
**700px max-width strategy** based on typography research for optimal reading experience:
- **Line length**: 50-75 characters per line (optimal comprehension zone)
- **Eye movement**: Reduced fatigue, easier line-to-line tracking
- **Industry alignment**: Matches Financial Times, Medium, McKinsey editorial standards

## Content Type Implementation

### ✅ Use 700px (`--form-max-width`) - Long-form Reading
**Editorial content requiring optimal reading experience:**
```scss
.insight-article-content,
.journal-article-content,
.brand-story-content,
.founder-story-content {
  max-width: var(--form-max-width);  /* 700px */
  width: 100%;                       /* Natural scaling */
  margin: 0 auto;                    /* Center container */
  text-align: left;                  /* Left-align content */
  padding: 0 var(--space-4);         /* Mobile padding */

  @media (min-width: 768px) {
    padding: 0 var(--space-6);       /* Enhanced padding */
  }
}
```

### 🔄 Use Mixed Layout - Profile Pages
**Wide container (1024px) with constrained narrative sections (700px):**
```scss
.brand-profile-container,
.founder-profile-container {
  max-width: var(--content-width-lg);  /* 1024px for cards + data */

  .narrative-section,
  .story-section {
    max-width: var(--form-max-width);  /* 700px for reading */
    margin: 0 auto;
  }
}
```

### ❌ Use Full Width - Grid Layouts
**Discovery, navigation, and grid displays:**
```scss
.discovery-container,
.brands-grid-container,
.insights-hub-container {
  max-width: var(--content-width-xl);  /* 1200px for grids */
}
```

## Typography Integration with Content Width

### REM-Based Typography System
**Using existing design tokens for accessibility:**
```scss
/* Editorial typography with existing tokens */
h1 { font-size: var(--text-4xl); }    /* 2.25rem = 36px */
h2 { font-size: var(--text-3xl); }    /* 1.875rem = 30px */
h3 { font-size: var(--text-xl); }     /* 1.25rem = 20px */
p  { font-size: var(--text-base); }   /* 1rem = 16px */
```

### Container Width Tokens
**Using existing layout tokens:**
```scss
--form-max-width: 700px;           /* Editorial reading width */
--content-width-lg: 1024px;        /* Mixed content pages */
--content-width-xl: 1200px;        /* Grid/navigation pages */
```

## Implementation Benefits
- **Consistent reading experience** across insights, journal, brand narratives
- **Accessibility compliance** with REM-based scaling respecting user preferences
- **Performance optimization** with simple responsive logic (no complex breakpoints)
- **Maintainable architecture** using established design token system

---

# 📖 Content Collections

## Customer-Facing Content
- **`_brands/`** - Brand profiles for partners/investors
- **`_founders/`** - Founder stories and achievements
- **`_insights/`** - Market analysis, business intelligence
- **`_pages/`** - About, contact, service pages

## Internal Content
- **`_journal/`** - Development journey, internal blog
- **Purpose**: Document technical decisions, learning process
- **Audience**: Internal team, future developers
- **Structure**: Same trilingual pattern as other collections

---

# 📖 Insight Article Architecture (Phase 2 Complete) ✅

**Section improvements:**
- ❌ Removed social sharing (poor engagement)
- ✅ Taxonomy uses proven tag-cloud 1C design with proper colors
- ✅ Brand-info uses featured brand-card variant
- ✅ Related sections use new card variants ("related", "compact")
- ✅ 7 optimized sections (down from 8)
- ✅ Insight categories use standardized color system

---

# 📁 Data-Driven Architecture

**Core principle**: Configuration over conditionals.

**Current pattern:**
```liquid
{% raw %}{% include helpers/page-sections.html page_type="brands" %}{% endraw %}
```

**Centralized configuration:**
- `_data/page_sections.yml` - Section control and panel types
- `_data/component_defaults.yml` - Component behavior defaults
- `_data/translations/{lang}.yml` - UI text and navigation

---

# 💻 Essential Commands

```bash
# Development (Jekyll 3.9.5 - GitHub Pages compatible)
bundle exec jekyll serve
# Note: --livereload not available in Jekyll 3.9.5

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

1. **"Logic Light" architecture** - Data-driven configuration over template logic
2. **Separation of concerns** - Clean boundaries between cards, layouts, and data
3. **Clean card minimalism** - Single components with simple variant logic
4. **Mobile-first responsive design** - 345px → 360px → 450px progressive enhancement
5. **Simple variant architecture** - Single component files with `{% raw %}{% if variant %}{% endraw %}` logic
6. **Clean BEM architecture** - Separate namespaces for distinct components
7. **Consistent color system** - Insight categories align with dimension colors
8. **Systematic implementation** - Audit → Plan → Execute → Validate methodology
9. **Performance-conscious** - Maintain incremental build efficiency
10. **Documentation-driven** - Standards codified for team development

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
# 2. Add variant CSS classes in matching CSS file:
# _includes/components/cards/brand-card.html
# assets/css/components/cards/brand-card.scss

.card--compact {
  width: var(--card-width-atomic); /* 345px mobile */

  @media (min-width: 768px) {
    width: calc(var(--card-width-standard) * 0.8); /* Smaller on desktop */
  }
}
```

## Validation Workflow
```bash
# Before commits
_scripts/core/pre-commit_check.sh

# Verify separation of concerns
grep -r "margin.*card" assets/css/components/cards/  # Should be empty
grep -r "\.card.*grid" assets/css/layout/  # Layout handles positioning

# Verify color consistency
grep -r "insight.*category" assets/css/  # Check color usage

# Check CSS file organization
find _includes/components -name "*.html" | while read html; do
  css_path="assets/css/components/$(basename "$(dirname "$html")")/$(basename "$html" .html).scss"
  [ -f "$css_path" ] || echo "Missing CSS file: $css_path"
done
```

---

# important-instruction-reminders
- Do what has been asked; nothing more, nothing less
- NEVER create files unless absolutely necessary
- ALWAYS prefer editing existing files over creating new ones
- NEVER proactively create documentation files unless explicitly requested
- ALWAYS use the official color system defined above for insight categories
- NEVER make up new colors for insight categories - use the 4 defined colors only
- ALWAYS use mobile-first CSS approach with min-width media queries (never max-width)
- ALWAYS create matching CSS files for HTML includes (e.g., brand-card.html → brand-card.scss)
- USE Jekyll 3.9.5 compatible commands (no --livereload flag)
