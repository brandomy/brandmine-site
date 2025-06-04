# Technical Reference

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

## Countries Data System

### Two-Tier Architecture

Brandmine implements a **two-tier country data system** optimized for performance and multilingual support:

**Tier 1: Basic Data** (`_data/countries.json`)
- Country names in EN/RU/ZH
- ISO alpha3 codes
- Fast access for common operations
- ~250 countries, minimal data per country

**Tier 2: Detailed Regional Data** (`_data/countries/{region}.json`)
- Complete country information (currency, capital, phone codes, etc.)
- Organized by region: `asia.json`, `europe.json`, `americas.json`, `africa.json`, `oceania.json`, `brics.json`
- Loaded only when detailed data is needed

### Data Structure

**Basic Data Structure** (`countries.json`):
```json
{
  "countries": {
    "th": {
      "name": {"en": "Thailand", "ru": "Таиланд", "zh": "泰国"},
      "alpha3": "THA"
    }
  }
}
```

**Detailed Regional Data Structure** (`asia.json`):
```json
{
  "countries": {
    "th": {
      "name": {"en": "Thailand", "ru": "Таиланд", "zh": "泰国"},
      "alpha3": "THA",
      "numeric": "764",
      "region": "Asia",
      "currency": "THB",
      "capital": {"en": "Bangkok", "ru": "Бангкок", "zh": "曼谷"},
      "continent": {"en": "Asia", "ru": "Азия", "zh": "亚洲"},
      "phone_code": "+66",
      "tld": ".th",
      "emoji": "🇹🇭",
      "primary_language": "th"
    }
  }
}
```

### Usage Patterns

**Direct Basic Access:**
```liquid
{{ site.data.countries_basic.countries.th.name.en }}
<!-- Output: Thailand -->

{{ site.data.countries_basic.countries.th.alpha3 }}
<!-- Output: THA -->
```

**Direct Detailed Access:**
```liquid
{{ site.data.countries.asia.countries.th.currency }}
<!-- Output: THB -->

{{ site.data.countries.asia.countries.th.capital.ru }}
<!-- Output: Бангкок -->
```

**Helper-Based Access** (Recommended):
```liquid
{% comment %} Basic data - fast access {% endcomment %}
{% include helpers/country-lookup.html country_code="th" property="name" %}
<!-- Output: Thailand (auto-detects language) -->

{% comment %} Detailed data - auto-detects regional file {% endcomment %}
{% include helpers/country-lookup.html country_code="th" data_type="detailed" property="currency" %}
<!-- Output: THB -->

{% comment %} Localized detailed data {% endcomment %}
{% include helpers/country-lookup.html country_code="th" data_type="detailed" property="capital" lang="ru" %}
<!-- Output: Бангкок -->
```

### Country Lookup Helper

**File**: `_includes/helpers/country-lookup.html`

**Parameters**:
- `country_code` (required): ISO 2-letter country code
- `data_type`: `"basic"` (default) or `"detailed"`
- `property`: Specific property to return
- `lang`: Language code (`en`, `ru`, `zh`)
- `fallback`: Default value if data not found

**Auto-Detection**: Helper automatically detects which regional file contains the country data.

**Error Handling**: Graceful fallback to English, then to fallback value.

**Performance**: Basic data loads from single file, detailed data loads appropriate regional file only when needed.

### Regional File Organization

| Region | File | Coverage |
|--------|------|----------|
| **Asia** | `asia.json` | Asian countries including Middle East |
| **Europe** | `europe.json` | European countries |
| **Americas** | `americas.json` | North, Central, and South America |
| **Africa** | `africa.json` | African countries |
| **Oceania** | `oceania.json` | Australia, New Zealand, Pacific islands |
| **BRICS** | `brics.json` | BRICS+ member countries with additional trade data |

### Integration with Dimensions

Regional markets added to `_data/dimensions_config.yml`:
```yaml
markets:
  items:
    # Individual countries...
    - slug: americas
      order: 14
    - slug: europe  
      order: 15
    - slug: africa
      order: 16
    - slug: oceania
      order: 17
```

### Performance Characteristics

- **Basic access**: Single JSON parse, ~2KB overhead
- **Detailed access**: Loads appropriate 15-30KB regional file
- **Caching**: Jekyll caches all data files in memory during build
- **Multilingual**: No performance penalty for language switching

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

## Centralized Configuration Files

### Dimensions Configuration (`_data/dimensions_config.yml`)

**Central source for all dimension data**, replacing scattered hardcoded values:

```yaml
dimensions:
  sectors:
    display_name: "Sectors"
    items:
      - slug: wine
        order: 1
      - slug: natural-beauty
        order: 2
  markets:
    display_name: "Markets"  
    items:
      - slug: brazil
        country_code: br
        order: 1
      - slug: russia
        country_code: ru
        order: 2
```

**Benefits:**
- Single source of truth for dimension order and metadata
- Eliminates hardcoded dimension lists in templates
- Automatic dimension discovery and ordering
- Country code mapping for markets

### Search Presets Configuration (`_data/search_presets.yml`)

**Defines search preset buttons** for quick filtering:

```yaml
brands:
  - id: featured
    label_key: "search.presets.featured" 
    filters:
      featured: true
    icon: "star"
  - id: founder-led
    label_key: "search.presets.founder_led"
    filters:
      attributes: ["founder-led"]
    icon: "user"
```

**Features:**
- Translation-driven labels using `label_key`
- Complex filter combinations support
- Icon integration for visual hierarchy
- Extensible for new preset types

### Enhanced Component Defaults (`_data/component_defaults.yml`)

**Comprehensive defaults organized by component type**, eliminating scattered `{% assign param = include.param | default: value %}` patterns:

```yaml
cards:
  brand-card:
    show_location: true
    show_sector: true
    tag_limit: 4
    layout: "vertical"

forms:
  newsletter:
    variant: "default"
    show_privacy_notice: true
    
search:
  search-filter:
    debounce_delay: 300
    max_results: 100
    enable_presets: true
```

**Organization:**
- **Cards**: Entry cards, brand cards, insight cards, founder cards
- **Forms**: Contact forms, newsletter forms, validation settings
- **Navigation**: Pagination, breadcrumbs
- **Search**: Simple search, search filters, results display
- **Images**: Collection images, responsive settings
- **UI**: Social sharing, modals, alerts, loading spinners
- **Dimensions**: Dimension clouds, lists, tags
- **Maps**: Brand maps, zoom levels, clustering

**Key Benefits:**
- Eliminates hardcoded values in templates
- Centralizes component behavior configuration
- Supports null values that defer to translation helpers
- Enables configuration-driven component changes

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