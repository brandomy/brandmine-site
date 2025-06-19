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
_insights/[lang]/[article-slug].md       # Blog articles
```

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

**Configurable cards:**
```liquid
{% include components/cards/brand-card.html
   brand=brand show_location=true show_sector=false %}
```

**Uses component defaults:**
```yaml
# _data/component_defaults.yml
cards:
  brand-card:
    show_location: true    # Default behavior
    show_sector: true      # Overridden by include
    tag_limit: 4
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

---

**Next**: [Troubleshooting Guide →](troubleshooting.md)
