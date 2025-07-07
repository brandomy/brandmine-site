# Technical Standards

**Find technical answers in <60 seconds**

## Architecture Overview

### "Logic Light" Design Philosophy

Brandmine uses **data-driven configuration** instead of template logic:

```yaml
# _data/component_defaults.yml
cards:
  brand-card:
    show_location: true
    show_sector: true
    tag_limit: 4

# _data/page_sections.yml
brands:
  sections: ["hero", "impact", "content", "contact-cta"]
  hero:
    panel_type: "panel--hero"
    background: "gradient"
```

**Pattern: Configuration over conditionals**
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

## Directory Structure

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
_insights/[lang]/[article-slug].md       # Blog articles (customer-facing)
_journal/[lang]/[article-slug].md        # Internal blog (development journey)
_pages/[lang]/[page-slug].md             # Static pages (about, contact, etc.)
```

## Official Color Standards (NEVER CHANGE)

### Dimension Taxonomy Colors
| Type | Color | CSS Property | Usage |
|------|-------|--------------|-------|
| **Sectors** | Olive Green | `--olive-*` | Industry categories |
| **Markets** | Sky Blue | `--sky-*` | Geographic regions |
| **Attributes** | Orange | `--secondary-*` | Brand qualities |
| **Signals** | Indigo | `--accent-*` | Growth indicators |

### Insight Category Colors (Aligned with Dimensions)
| Category | Color | CSS Property | Business Context |
|----------|-------|--------------|------------------|
| **Brand Spotlight** | Orange | `--secondary-*` | Investment opportunities (same as Attributes) |
| **Founder's Journey** | Purple | `--accent-*` | Leadership excellence (same as Signals) |
| **Location Intelligence** | Sky Blue | `--sky-*` | Geographic intelligence (same as Markets) |
| **Market Momentum** | Olive Green | `--olive-*` | Market trends (same as Sectors) |

**Critical Rule**: Insight categories intentionally use SAME colors as dimension types for visual consistency and semantic alignment.

## CSS File Organization Standards

### Matching CSS Files for Components
**Rule**: Every HTML component must have a matching CSS file for isolation and debugging.

```
_includes/components/cards/brand-card.html
assets/css/components/cards/brand-card.scss

_includes/components/ui/insight-category-new.html
assets/css/components/ui/insight-category.scss

_includes/pages/brands/hero.html
assets/css/pages/brands/hero.scss
```

**Benefits:**
- Easy debugging and style isolation
- Clear ownership of CSS rules
- Prevents cross-component conflicts
- Simplifies maintenance

## Mobile-First Responsive Standards

### Breakpoint Strategy (Always min-width)
```scss
/* Mobile-first base styles (no media query) */
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

**Standard Breakpoints:**
- **Mobile**: Base styles (no media query)
- **Tablet**: `@media (min-width: 768px)`
- **Desktop**: `@media (min-width: 1024px)`

**Never use max-width** - always progressive enhancement with min-width.

## Content Width Standards

### Editorial Content Width Strategy

**700px max-width** for optimal reading experience based on typography research:
- **Line length**: 50-75 characters per line (optimal reading zone)
- **Eye movement**: Reduced fatigue, easier line-to-line tracking
- **Industry standard**: Matches Financial Times, Medium, McKinsey editorial width

### Content Type Guidelines

#### ✅ Use 700px (`--form-max-width`)
**Long-form reading content:**
```scss
.insight-article-content,
.journal-article-content,
.brand-story-content,
.founder-story-content {
  max-width: var(--form-max-width);  /* 700px */
  width: 100%;
  margin: 0 auto;
  text-align: left;
}
```

#### 🔄 Use Mixed Layout (1024px container, 700px narrative)
**Profile pages with cards + narrative:**
```scss
.brand-profile-container,
.founder-profile-container {
  max-width: var(--content-width-lg);  /* 1024px */

  .narrative-section {
    max-width: var(--form-max-width);  /* 700px within */
    margin: 0 auto;
  }
}
```

#### ❌ Use Full Width (1200px)
**Grid layouts and navigation:**
```scss
.discovery-container,
.brands-grid-container,
.home-container {
  max-width: var(--content-width-xl);  /* 1200px */
}
```

### Implementation Pattern

**Simple container approach:**
```scss
/* Editorial content pattern */
.article-content {
  max-width: var(--form-max-width);  /* 700px */
  width: 100%;                       /* Natural scaling */
  margin: 0 auto;                    /* Center container */
  text-align: left;                  /* Left-align content */
  padding: 0 var(--space-4);         /* Mobile padding */

  @media (min-width: 768px) {
    padding: 0 var(--space-6);       /* Enhanced tablet+ padding */
  }
}
```

### Typography Integration

**Use with existing text tokens:**
```scss
h2 { font-size: var(--text-3xl); }    /* 1.875rem = 30px */
p  { font-size: var(--text-base); }   /* 1rem = 16px */
```

**Benefits:**
- **Consistent reading experience** across insights, journal, brand stories
- **Accessibility** with REM-based scaling
- **Performance** with simple responsive logic

### Asset Organization
```
assets/images/brands/[country]/[brand]/  # Brand-specific images
assets/images/[category]/                # Site-wide images
assets/css/components/[type]/            # Component styles
assets/css/pages/[page]/                 # Page-specific styles
```

## Component Patterns

### Image Components

**Unified responsive images:**
```liquid
{% include components/images/brand-image.html
   country="ru" brand="teatime" purpose="hero" image="storefront"
   alt="TeaTime storefront" %}
```

**Generates responsive srcset:**
```html
<img src="assets/images/brands/ru/teatime/teatime-hero-storefront-800w.jpg"
     srcset="assets/images/brands/ru/teatime/teatime-hero-storefront-400w.jpg 400w,
             assets/images/brands/ru/teatime/teatime-hero-storefront-800w.jpg 800w,
             assets/images/brands/ru/teatime/teatime-hero-storefront-1200w.jpg 1200w"
     sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
     alt="TeaTime storefront" loading="lazy">
```

### Card Components

**Mobile-first card system with simple variants:**
```liquid
{% include components/cards/brand-card.html brand=brand %}                    <!-- Standard -->
{% include components/cards/brand-card.html brand=brand variant="featured" %} <!-- Featured -->
{% include components/cards/insight-card.html insight=insight %}              <!-- Standard -->
{% include components/cards/insight-card.html insight=insight variant="tagged" %} <!-- With tags -->
```

**Responsive sizing with design tokens:**
```scss
.card {
  width: var(--card-width-atomic);    /* 345px mobile */
  max-width: 100%;

  @media (min-width: 768px) {
    width: var(--card-width-standard); /* 360px desktop */
  }
}
```

**Design tokens:**
```css
--card-width-atomic: 345px;     /* Mobile base */
--card-width-standard: 360px;   /* Desktop base */
--card-width-featured: 450px;   /* Desktop featured */
--card-width-mini: 345px;       /* Always compact */
```

**Uses component defaults:**
```yaml
# _data/component_defaults.yml
cards:
  brand-card:
    show_location: true    # Default behavior
    show_sector: true      # Configurable
    tag_limit: 4
  insight-card:
    show_tags: false       # Enabled via variant="tagged"
    tag_limit: 3
```

### Translation Helper

**Centralized translations:**
```liquid
{% include helpers/t.html key="brands.hero_title" fallback="Discover Brands" %}
```

**Looks up from:**
```yaml
# _data/translations/en.yml
brands:
  hero_title: "Exceptional Brands from BRICS+ Markets"
```

## Multilingual Architecture

### Language Structure
- **URL pattern**: `/[lang]/[page]/`
- **Content files**: `_[collection]/[lang]/[file].md`
- **Shared logic**: All layouts and includes work across languages

### Language Switching
```liquid
{% comment %} Optimized language selector {% endcomment %}
{% assign language_map = site.data.language_map[page.url] %}
{% for lang_data in language_map %}
  <a href="{{ lang_data.url }}" hreflang="{{ lang_data.lang }}">
    {{ lang_data.name }}
  </a>
{% endfor %}
```

## Performance Optimizations

### Pre-Generated Data

**Language mapping** (eliminates expensive page lookups):
```python
# _scripts/utilities/generate-language-map.py
# Generates _data/language_map.json with pre-computed language switcher data
```

**Navigation cache** (eliminates translation lookups):
```python
# _scripts/utilities/generate-navigation-cache.py
# Generates _data/navigation_cache.json with pre-rendered navigation HTML
```

### Build Optimization Results
- **Before**: 40-42 seconds
- **After**: 12-13 seconds (70% improvement)

## ⚡ Performance Standards (Achieved)

### Build Performance Targets
- **Initial builds**: 21-22 seconds (acceptable for content volume)
- **Incremental builds**: ≤6 seconds (achieved: 5.5 seconds)
- **Development workflow**: Optimized for rapid iteration

### Performance Optimization Hierarchy
1. **Cache regeneration** - Language maps, navigation cache, search data
2. **CSS boundary cleanliness** - No cross-component violations
3. **Incremental build optimization** - Jekyll configuration tuning
4. **Asset optimization** - Responsive images, optimized file sizes

### Performance Maintenance
```bash
# Regular performance optimization
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
_scripts/core/generate-all-json.py

# Performance monitoring
time JEKYLL_ENV=production bundle exec jekyll build
```

## CSS Architecture

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

## 🏷️ Official BEM Namespaces (Proven Standards)

### Founder Card System
**Established Phase 1B - July 2025**

| Component | BEM Namespace | Purpose | Usage |
|-----------|---------------|---------|-------|
| **founder-card.html** | `founder-card__*` | Standard founder profiles | Biographical info, achievements, profile displays |
| **founder-card-featured.html** | `founder-card-featured__*` | Featured founder displays | Homepage carousel, prominent showcases |
| **founder-quote-card.html** | `founder-quote-card__*` | Quote attribution | Founder wisdom, testimonials, insights |

### CSS Boundary Rules (Critical Standards)
**Clean separation of concerns enforced:**

#### Cards Handle (Intrinsic Properties)
- Typography (font-size, font-weight, color)
- Internal spacing (padding within card)
- Colors and backgrounds
- Borders and border-radius
- Internal layout structure

#### Layouts Handle (Extrinsic Properties)
- Positioning between cards (margin, gap)
- Grid and carousel structure
- Page flow and sections
- Responsive container behavior

#### Violation Examples
```scss
/* ❌ VIOLATION - Card file handling layout */
.founder-card {
  margin: var(--space-4); /* Should be in layout CSS */
  grid-column: span 2;    /* Should be in grid CSS */
}

/* ❌ VIOLATION - Layout file handling card internals */
.carousel .founder-card__name {
  font-size: var(--text-sm); /* Should be in card CSS */
}

/* ✅ CORRECT - Clean boundaries */
/* In founder-card.scss */
.founder-card__name {
  font-size: var(--text-xl);
  color: var(--neutral-900);
}

/* In carousel.scss */
.carousel .founder-card {
  flex: 0 0 400px;
  margin-right: var(--space-4);
}
```

### Implementation Standards

**Simple variant pattern (preferred):**
```liquid
{% include components/cards/brand-card.html brand=brand %}                    <!-- Standard -->
{% include components/cards/brand-card.html brand=brand variant="featured" %} <!-- Featured -->
{% include components/cards/insight-card.html insight=insight %}              <!-- Standard -->
{% include components/cards/insight-card.html insight=insight variant="tagged" %} <!-- With tags -->
```

**Creating new variants:**
```liquid
<!-- In card HTML file -->
{% assign variant = include.variant | default: "standard" %}

{% if variant == "featured" %}
  <article class="card card--featured">
    <!-- Featured variant content -->
  </article>
{% elsif variant == "compact" %}
  <article class="card card--compact">
    <!-- Compact variant content -->
  </article>
{% else %}
  <article class="card">
    <!-- Standard variant content -->
  </article>
{% endif %}
```

**Legacy patterns (transitioning away):**
```liquid
<!-- Avoid creating separate component files for variants -->
{% include components/cards/founder-card-featured.html founder=founder %}
{% include components/cards/founder-quote-card.html quote=quote founder=founder %}
```
## Build Performance Guidelines

### File Placement Rules
- **Audit reports**: Place in `_docs/reports/` (excluded from processing)
- **Large documentation**: Keep in `_docs/` to avoid Jekyll processing
- **Development artifacts**: Remove from `assets/` and content directories

### Performance Targets
- **Development builds**: <25 seconds
- **Production builds**: <25 seconds
- **Clean rebuilds**: <30 seconds

### Component Organization
```
assets/css/
├── tokens/           # Design tokens (colors, spacing, typography)
├── base/            # Reset, typography, base elements
├── layout/          # Header, footer, panels, grid
├── components/      # Reusable UI components
├── collections/     # Collection-specific styles
├── pages/           # Page-specific styles
└── manifest/        # Import files (@import statements)
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

## Content Width Standards

### Editorial Content Width Strategy

**700px max-width** for optimal reading experience based on typography research:
- **Line length**: 50-75 characters per line (optimal reading zone)
- **Eye movement**: Reduced fatigue, easier line-to-line tracking
- **Industry standard**: Matches Financial Times, Medium, McKinsey editorial width

### Content Type Guidelines

#### ✅ Use 700px (`--form-max-width`)
**Long-form reading content:**
```scss
.insight-article-content,
.journal-article-content,
.brand-story-content,
.founder-story-content {
  max-width: var(--form-max-width);  /* 700px */
  width: 100%;
  margin: 0 auto;
  text-align: left;
  padding: 0 var(--space-4);

  @media (min-width: 768px) {
    padding: 0 var(--space-6);
  }
}
```

#### 🔄 Use Mixed Layout (1024px container, 700px narrative)
**Profile pages with cards + narrative:**
```scss
.brand-profile-container,
.founder-profile-container {
  max-width: var(--content-width-lg);  /* 1024px */

  .narrative-section {
    max-width: var(--form-max-width);  /* 700px within */
    margin: 0 auto;
  }
}
```

#### ❌ Use Full Width (1200px)
**Grid layouts and navigation:**
```scss
.discovery-container,
.brands-grid-container,
.home-container {
  max-width: var(--content-width-xl);  /* 1200px */
}
```

### Implementation Pattern

**Simple container approach:**
```scss
/* Editorial content pattern */
.article-content {
  max-width: var(--form-max-width);  /* 700px */
  width: 100%;                       /* Natural scaling */
  margin: 0 auto;                    /* Center container */
  text-align: left;                  /* Left-align content */
  padding: 0 var(--space-4);         /* Mobile padding */

  @media (min-width: 768px) {
    padding: 0 var(--space-6);       /* Enhanced tablet+ padding */
  }
}
```

### Typography Integration

**Use with existing text tokens:**
```scss
h2 { font-size: var(--text-3xl); }    /* 1.875rem = 30px */
p  { font-size: var(--text-base); }   /* 1rem = 16px */
```

**Benefits:**
- **Consistent reading experience** across insights, journal, brand stories
- **Accessibility** with REM-based scaling
- **Performance** with simple responsive logic




## Seamless Section Flow Policy (Phase 4: Automated Prevention)

### Policy Statement
**Achievement**: 85% site-wide cleanup (595 → 87 violations)
**Page Consistency**: 100% across all 16 page directories
**Implementation**: margin-bottom → padding-bottom conversion for seamless section flow

All page sections must flow seamlessly without artificial gaps. Components use internal spacing (padding) rather than external spacing (margins) for layout consistency.

### Implementation Standards
```scss
/* ✅ CORRECT - Internal spacing creates seamless flow */
.section-content {
  padding-bottom: var(--space-4);
}

/* ❌ INCORRECT - External spacing creates unwanted gaps */
.section-content {
  margin-bottom: var(--space-4);
}
```

### Validation System
**Automated prevention integrated into pre-commit hooks:**
```bash
# Run section margin validation
_scripts/validation/check_section_margins.sh

# Integrated into pre-commit workflow
_scripts/core/pre-commit_check.sh
```

### Standards Achievement
- ✅ **Phase 1**: Customer-facing pages (100% clean)
- ✅ **Phase 2**: Component architecture improved
- ✅ **Phase 3**: All page types (100% clean across 16 directories)
- ✅ **Phase 4**: Automated prevention system active

### Success Metrics
- **Professional presentation** across all user touchpoints
- **Consistent visual rhythm** site-wide
- **Baseline compliance**: 87 violations (monitored)
- **Automated prevention** prevents regression

### Architecture Benefits
**6x better success rate** on page-level vs component-level cleanup:
- Page sections: Clean architectural boundaries
- Components: Complex interconnected dependencies
- Result: Focus on page-level consistency for maximum impact

## Data Management

### JSON Generation
```python
# Auto-generates search indexes from markdown content
python3 _scripts/data-generation/generate-all-json.py

# Creates:
# _data/brands.json     - All brand data with metadata
# _data/founders.json   - All founder profiles
# _data/insights.json   - All insight articles
```

### Validation Scripts
```bash
# Language consistency
_scripts/validation/check_language_consistency.sh

# YAML validation
_scripts/validation/validate_yaml.sh

# Translation key checking
_scripts/validation/find_translation_keys.py
```

## Taxonomy System

### Four Dimension Types
```yaml
dimensions:
  markets: ["russia", "china", "brazil", "india"]      # Geographic focus
  sectors: ["wine", "natural-beauty", "gourmet-foods"] # Industry categories
  attributes: ["founder-led", "heritage-brand"]        # Brand qualities
  signals: ["export-ready", "rapid-growth"]            # Growth indicators
```

### Dimension Files
```yaml
# _dimensions/en/markets/russia.md
---
name: "Russia"
slug: "russia"
type: "market"
description: "Vast market with rich cultural traditions"
---

Content about Russian market dynamics...
```

### Brand Taxonomy Usage
```yaml
# _brands/en/ru-teatime.md
---
title: "TeaTime"
sectors: ["artisanal-spirits"]
markets: ["russia"]
attributes: ["founder-led", "heritage-brand"]
signals: ["export-ready"]
---
```

## Development Conventions

### File Naming
- **Kebab-case**: `brand-card.html`, `hero-panel.scss`
- **Language prefixes**: `ru-teatime.md`, `zh-dragon-tea.md`
- **Purpose-first images**: `hero-storefront.jpg`, `founder-portrait.jpg`

### Front Matter Standards
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

# SEO
description: "Brief description for meta tags"
featured: false          # Homepage feature flag
---
```

### Include Parameters
```liquid
{% comment %} Always provide required parameters {% endcomment %}
{% include components/cards/brand-card.html
   brand=brand                    # Required: brand object
   show_location=true            # Optional: override default
   class="featured-brand"        # Optional: additional CSS %}

{% comment %} Use meaningful parameter names {% endcomment %}
{% include components/images/brand-image.html
   country="ru"                  # Required: country code
   brand="teatime"              # Required: brand slug
   purpose="hero"               # Required: image purpose
   image="storefront"           # Required: image name
   alt="TeaTime storefront" %}  # Required: accessibility text
```

## Nuclear Fix Registry

**Emergency component fixes using !important overrides:**

- **brand-card--insight**: Complete rebuild due to structural conflicts
  - **Report**: `_archives/reports/2025-07-08_nuclear-fix-brand-card-insight.md`
  - **Status**: ✅ Working, documented, stable
  - **Maintenance**: Avoid modifications, test thoroughly if changes needed

**Nuclear Fix Protocol**: When 3+ incremental fixes fail → nuclear rebuild → document in archives → ship working solution.

---

**Next**: [Troubleshooting Guide →](troubleshooting.md)
