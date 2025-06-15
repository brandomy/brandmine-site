# Data-Driven Section Architecture Cheat Sheet

This guide explains how to use Brandmine's new "Logic Light" architecture for building maintainable, configuration-driven pages.

## 🎯 Architecture Overview

The new architecture follows the principle: **"Data-driven over conditional logic"**

Instead of hardcoded if/else statements and scattered defaults, everything is configured through centralized YAML files and helper includes.

## 📁 Core Components

### 1. Single Source of Truth for Component Defaults
**File:** `_data/component_defaults.yml`

Configure all component behavior without touching code:

```yaml
cards:
  entry-card:
    show_author: true
    show_date: true
    excerpt_words: 25
    tag_limit: 3
    
  brand-card:
    show_location: true
    show_sector: true
    tag_limit: 4

forms:
  newsletter:
    variant: "default"
    show_name: false
    show_privacy_notice: true
```

**Usage in components:**
```liquid
{% comment %} OLD PATTERN - Avoid {% endcomment %}
{% assign show_author = include.show_author | default: true %}
{% assign excerpt_words = include.excerpt_words | default: 25 %}

{% comment %} NEW PATTERN - Use this {% endcomment %}
{% capture default_show_author %}{% include helpers/component-defaults.html component="cards.entry-card" param="show_author" fallback=true %}{% endcapture %}
{% assign show_author = include.show_author | default: default_show_author %}
```

### 2. Centralized Section Configuration
**File:** `_data/page_sections.yml`

Define page sections and their panel types once:

```yaml
brands:
  default_sections:
    - breadcrumbs
    - hero
    - impact
    - content
    - filter-interface
    - featured-brands
    - latest-brands
    - contact-cta

  panel_mappings:
    hero:
      type: panel--hero
    impact:
      type: panel--primary
      additional_classes: panel--impact
    featured-brands:
      type: panel--amber-soft
    contact-cta:
      type: panel--cta
      content_classes: panel--centered
```

### 3. Consistent Translation Pattern
**Helper:** `_includes/helpers/t.html`

Standardized multilingual text access:

```liquid
{% comment %} OLD PATTERN - Avoid {% endcomment %}
{% assign t = site.data.translations[current_lang].brands %}
{{ t.view_profile | default: "View Profile" }}

{% comment %} NEW PATTERN - Use this {% endcomment %}
{% include helpers/t.html key="brands.view_profile" fallback="View Profile" %}
```

### 4. Universal Section Rendering
**Helper:** `_includes/helpers/page-sections.html`

Data-driven page layout system:

```liquid
{% comment %} OLD PATTERN - Avoid {% endcomment %}
{% unless page.sections %}
  {% assign sections_to_render = "hero,content,cta" | split: "," %}
{% else %}
  {% assign sections_to_render = page.sections %}
{% endunless %}
{% for section in sections_to_render %}
  {% case section %}
    {% when "hero" %}
      {% assign panel_type = "panel--hero" %}
    {% else %}
      {% assign panel_type = "panel--light" %}
  {% endcase %}
  <section>
    <div class="panel {{ panel_type }}">
      {% include pages/{{ section }}.html %}
    </div>
  </section>
{% endfor %}

{% comment %} NEW PATTERN - Use this {% endcomment %}
{% include helpers/page-sections.html page_type="brands" content=page_content %}
```

## 🚀 Practical Usage Guide

### Creating a New Page Type

**1. Add sections configuration:**
```yaml
# _data/page_sections.yml
my_new_page:
  default_sections:
    - hero
    - content
    - features
    - contact-cta
  
  panel_mappings:
    hero:
      type: panel--hero
    content:
      type: panel--light
    features:
      type: panel--amber-soft
    contact-cta:
      type: panel--cta
```

**2. Create minimal layout:**
```liquid
<!-- _layouts/my-new-page.html -->
---
layout: default
---
<div class="my-new-page">
  {% include helpers/page-sections.html page_type="my_new_page" %}
</div>
```

**3. Create section includes:**
```
_includes/pages/my_new_page/
├── hero.html
├── content.html
├── features.html
└── contact-cta.html
```

**That's it!** No hardcoded logic needed.

### Adding a New Component

**1. Define defaults:**
```yaml
# _data/component_defaults.yml
cards:
  my-card:
    show_image: true
    show_tags: true
    layout: "vertical"
```

**2. Use in component:**
```liquid
<!-- _includes/components/cards/my-card.html -->
{% capture default_show_image %}{% include helpers/component-defaults.html component="cards.my-card" param="show_image" fallback=true %}{% endcapture %}
{% assign show_image = include.show_image | default: default_show_image %}

{% if show_image %}
  <!-- render image -->
{% endif %}
```

### Updating Component Behavior

**Change defaults without touching code:**
```yaml
# _data/component_defaults.yml
cards:
  entry-card:
    excerpt_words: 30  # Changed from 25
    show_tags: false   # Changed from true
```

All entry cards instantly adopt new behavior.

### Customizing Page Sections

**Override in page front matter:**
```yaml
---
layout: brands
sections:
  - hero
  - content
  - custom-section
  - contact-cta
---
```

Or change globally in `page_sections.yml`.

## 📊 Benefits Achieved

### Auto-Generated Content
- **Standardized patterns:** New content inherits proper styling
- **Consistent behavior:** All components follow same defaults
- **Minimal configuration:** Only specify what's different

### New Page Types
- **5-line layouts:** Just include the page-sections helper
- **No hardcoded logic:** Everything configured in YAML
- **Instant panel styling:** Panel mappings handled automatically

### Configurable Components
- **No code changes:** Modify behavior through YAML
- **Site-wide updates:** Change defaults globally
- **Consistent overrides:** Same pattern everywhere

### Simplified Translation Management
- **Single helper pattern:** `{% include helpers/t.html %}`
- **Automatic fallbacks:** Graceful degradation
- **Centralized keys:** All translations in one place

## 🎯 Key Principles

1. **Data-driven over conditional logic**
   - Use YAML configuration instead of if/else statements
   - Centralize decisions in data files

2. **Helper patterns over direct access**
   - Use `helpers/t.html` instead of direct translation access
   - Use `helpers/component-defaults.html` for consistent defaults

3. **Single source of truth over duplication**
   - One configuration file per concern
   - No scattered default values

4. **Configuration over hardcoding**
   - Change behavior through YAML edits
   - Avoid code changes for simple modifications

## 🔧 Quick Reference

**Component defaults:** `_data/component_defaults.yml`
**Page sections:** `_data/page_sections.yml`
**Translations:** `{% include helpers/t.html key="path.to.key" fallback="Default" %}`
**Page rendering:** `{% include helpers/page-sections.html page_type="page_name" %}`

This architecture enables rapid development, easy maintenance, and consistent patterns across the entire Brandmine site.