# Brandmine Logic Light Implementation Guide

## Objective
Implement all recommendations from the Logic Light Architecture Audit to eliminate hardcoded values, reduce template complexity by 30-40%, and centralize configuration in data files. Upon completion, update documentation to reflect the new architecture patterns.

## Implementation Plan

### Phase 1: Data Structure Creation

#### 1.1 Create `_data/dimensions_config.yml`
Replace all hardcoded dimension lists with centralized configuration:

```yaml
dimensions:
  sectors:
    display_name: "Sectors"
    items:
      - slug: wine
        order: 1
      - slug: natural-beauty
        order: 2
      - slug: gourmet-foods
        order: 3
      - slug: artisanal-spirits
        order: 4
      - slug: hotels-resorts
        order: 5
      - slug: artisan-ceramics
        order: 6
      - slug: artisan-confectionery
        order: 7
      - slug: cured-meats
        order: 8
      - slug: fashion-accessories
        order: 9
      - slug: fermented-dairy
        order: 10
      - slug: halal-foods
        order: 11
      - slug: honey-bee-products
        order: 12
      - slug: jewelry-watches
        order: 13
      - slug: mineral-waters
        order: 14
      - slug: natural-supplements
        order: 15
      - slug: specialty-cheeses
        order: 16

  markets:
    display_name: "Markets"
    items:
      - slug: brazil
        country_code: br
        order: 1
      - slug: russia
        country_code: ru
        order: 2
      - slug: india
        country_code: in
        order: 3
      - slug: china
        country_code: cn
        order: 4
      - slug: south-africa
        country_code: za
        order: 5
      - slug: iran
        country_code: ir
        order: 6
      - slug: egypt
        country_code: eg
        order: 7
      - slug: ethiopia
        country_code: et
        order: 8
      - slug: uae
        country_code: ae
        order: 9
      - slug: indonesia
        country_code: id
        order: 10
      - slug: mongolia
        country_code: mn
        order: 11
      - slug: malaysia
        country_code: my
        order: 12

  attributes:
    display_name: "Attributes"
    items:
      - slug: founder-led
        order: 1
      - slug: heritage-brand
        order: 2
      - slug: artisanal-excellence
        order: 3
      - slug: sustainability-pioneer
        order: 4
      - slug: innovation-leader
        order: 5
      - slug: cultural-bridge
        order: 6
      - slug: premium-positioning
        order: 7
      - slug: regional-icon
        order: 8

  signals:
    display_name: "Signals"
    items:
      - slug: export-ready
        order: 1
      - slug: franchise-ready
        order: 2
      - slug: investment-ready
        order: 3
      - slug: rapid-growth
        order: 4
```

#### 1.2 Create `_data/search_presets.yml`
Replace hardcoded search presets:

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
  - id: export-ready
    label_key: "search.presets.export_ready"
    filters:
      signals: ["export-ready"]
    icon: "globe"
  - id: heritage
    label_key: "search.presets.heritage"
    filters:
      attributes: ["heritage-brand"]
    icon: "clock"
```

#### 1.3 Expand `_data/component_defaults.yml`
Add comprehensive component configuration:

```yaml
# Existing entries remain unchanged, add these new sections:

dimensions:
  dimension-cloud:
    max_tags: 20
    min_font_size: 14
    max_font_size: 24
    show_count: true
    layout: cloud
  dimension-list:
    show_description: true
    layout: vertical
    max_items: 50
    show_empty: false
  dimension-tag:
    show_icon: true
    style: pill
    clickable: true

search:
  search-filter:
    debounce_delay: 300
    min_query_length: 3
    max_results: 100
    show_count: true
    enable_presets: true
  search-results:
    items_per_page: 12
    layout: grid
    show_pagination: true

cards:
  brand-card:
    show_location: true
    show_sector: true
    show_attributes: true
    tag_limit: 4
    image_aspect_ratio: "3:2"
  founder-card:
    show_company: true
    show_location: true
    show_generation: true
    image_aspect_ratio: "2:3"
  insight-card:
    show_author: true
    show_date: true
    show_category: true
    excerpt_words: 25

forms:
  validation:
    email_pattern: "^[^@]+@[^@]+\\.[^@]+$"
    required_message_key: "forms.validation.required"
    email_message_key: "forms.validation.email"
    min_length_message_key: "forms.validation.min_length"
  contact-form:
    enable_validation: true
    show_labels: true
    required_fields: ["name", "email", "message"]
  newsletter-form:
    enable_validation: true
    placeholder_key: "forms.newsletter.placeholder"
    button_key: "forms.newsletter.submit"

maps:
  brand-map:
    zoom_level: 6
    cluster_radius: 50
    show_popup: true
    popup_fields: ["name", "sector", "location"]
```

### Phase 2: Helper Creation

#### 2.1 Create `_includes/helpers/body-class.html`
Replace complex body class logic:

```liquid
{% comment %}
Generate appropriate body class for current page
Uses page_sections configuration for consistent class naming
{% endcomment %}

{% assign page_config = site.data.page_sections[page.ref] %}
{% if page_config and page_config.body_class %}
  {{ page_config.body_class }}
{% elsif page.ref %}
  {{ page.ref | append: '-page' }}
{% elsif page.layout %}
  {{ page.layout | append: '-page' }}
{% else %}
  default-page
{% endif %}
```

#### 2.2 Create `_includes/helpers/translation-key-builder.html`
Standardize translation key construction:

```liquid
{% comment %}
Build translation keys dynamically
Parameters:
- base: Base key path (required)
- parts: Array or string of key parts (optional)
- separator: Key separator (default: ".")

Usage:
{% capture key %}{% include helpers/translation-key-builder.html base="dimensions" parts=parts_array %}{% endcapture %}
{% endcomment %}

{% assign separator = include.separator | default: "." %}
{% assign key = include.base %}

{% if include.parts %}
  {% if include.parts.size %}
    {% comment %}Array of parts{% endcomment %}
    {% for part in include.parts %}
      {% assign key = key | append: separator | append: part %}
    {% endfor %}
  {% else %}
    {% comment %}Single part{% endcomment %}
    {% assign key = key | append: separator | append: include.parts %}
  {% endif %}
{% endif %}

{{ key }}
```

#### 2.3 Create `_includes/helpers/dimension-data.html`
Centralize dimension data access:

```liquid
{% comment %}
Get dimension configuration data
Parameters:
- type: Dimension type (sectors, markets, attributes, signals)
- sorted: Whether to sort by order (default: true)

Usage:
{% include helpers/dimension-data.html type="sectors" %}
{% assign sectors_data = dimension_items %}
{% endcomment %}

{% assign sorted = include.sorted | default: true %}
{% assign dimension_config = site.data.dimensions_config.dimensions[include.type] %}

{% if dimension_config %}
  {% if sorted %}
    {% assign dimension_items = dimension_config.items | sort: 'order' %}
  {% else %}
    {% assign dimension_items = dimension_config.items %}
  {% endif %}
  {% assign dimension_display_name = dimension_config.display_name %}
{% else %}
  {% assign dimension_items = empty %}
  {% assign dimension_display_name = include.type | capitalize %}
{% endif %}
```

### Phase 3: Template Updates

#### 3.1 Update `_layouts/default.html`
Replace complex body class logic:

**Find this section (around lines 88-100):**
```liquid
<body class="{% case page.ref %}
  {% when 'home' %}home-page
  {% when 'about' %}about-page
  {% when 'brands' %}brands-page
  {% when 'founders' %}founders-page
  {% when 'discovery' %}discovery-page
  {% when 'insights' %}insights-page
  {% else %}
    {% case page.layout %}
      {% when 'insight-article' %}insight-article-page
      {% else %}default-page
    {% endcase %}
  {% endcase %}">
```

**Replace with:**
```liquid
<body class="{% include helpers/body-class.html %}">
```

#### 3.2 Update `_includes/components/search/search-filter.html`
Replace all hardcoded dimension lists:

**Find and replace the sectors section (around lines 89-96):**
```liquid
{% comment %}OLD: Remove this entire hardcoded array{% endcomment %}
{% assign sectors = "wine,natural-beauty,gourmet-foods..." | split: "," %}

{% comment %}NEW: Use centralized configuration{% endcomment %}
{% include helpers/dimension-data.html type="sectors" %}
{% assign sectors = dimension_items %}
```

**Find and replace the markets section (around lines 104-130):**
```liquid
{% comment %}OLD: Remove the complex case statement for markets{% endcomment %}

{% comment %}NEW: Use centralized configuration{% endcomment %}
{% include helpers/dimension-data.html type="markets" %}
{% assign markets = dimension_items %}
```

**Find and replace the attributes section (around lines 138-144):**
```liquid
{% comment %}OLD: Remove hardcoded attributes{% endcomment %}

{% comment %}NEW: Use centralized configuration{% endcomment %}
{% include helpers/dimension-data.html type="attributes" %}
{% assign attributes = dimension_items %}
```

**Find and replace the signals section (around lines 152-157):**
```liquid
{% comment %}OLD: Remove hardcoded signals{% endcomment %}

{% comment %}NEW: Use centralized configuration{% endcomment %}
{% include helpers/dimension-data.html type="signals" %}
{% assign signals = dimension_items %}
```

**Find and replace the presets section (around lines 42-59):**
```liquid
{% comment %}OLD: Remove hardcoded presets{% endcomment %}

{% comment %}NEW: Use data-driven presets{% endcomment %}
{% assign search_presets = site.data.search_presets.brands %}
{% for preset in search_presets %}
  <button type="button" 
          class="preset-btn" 
          data-preset="{{ preset.id }}"
          data-filters='{{ preset.filters | jsonify }}'>
    {% include helpers/t.html key=preset.label_key fallback=preset.id %}
  </button>
{% endfor %}
```

#### 3.3 Update `_data/page_sections.yml`
Add body class configuration:

```yaml
# Add body_class to each page configuration
home:
  sections: ["hero", "featured-brands", "discovery-preview", "insights-preview", "contact-cta"]
  body_class: "home-page"
  hero:
    panel_type: "panel--hero"

brands:
  sections: ["breadcrumbs", "hero", "impact", "filter-interface", "content", "contact-cta"]
  body_class: "brands-page"
  hero:
    panel_type: "panel--hero"

founders:
  sections: ["breadcrumbs", "hero", "impact", "filter-interface", "content", "contact-cta"]
  body_class: "founders-page"
  hero:
    panel_type: "panel--hero"

discovery:
  sections: ["breadcrumbs", "hero", "impact", "dimensions-grid", "contact-cta"]
  body_class: "discovery-page"
  hero:
    panel_type: "panel--hero"

insights:
  sections: ["breadcrumbs", "hero", "impact", "categories", "content", "contact-cta"]
  body_class: "insights-page"
  hero:
    panel_type: "panel--hero"

# Add layout-based configurations
brand-profile:
  body_class: "brand-profile-page"

founder-profile:
  body_class: "founder-profile-page"

insight-article:
  body_class: "insight-article-page"

dimension:
  body_class: "dimension-page"
```

### Phase 4: Translation Updates

#### 4.1 Add search preset translations to `_data/translations/{lang}.yml`

**For English (`_data/translations/en.yml`):**
```yaml
search:
  presets:
    featured: "Featured"
    founder_led: "Founder Led"
    export_ready: "Export Ready"
    heritage: "Heritage"

forms:
  validation:
    required: "This field is required"
    email: "Please enter a valid email address"
    min_length: "Minimum length not met"
  newsletter:
    placeholder: "Enter your email"
    submit: "Subscribe"
```

**For Russian (`_data/translations/ru.yml`):**
```yaml
search:
  presets:
    featured: "Рекомендуемые"
    founder_led: "Основатель"
    export_ready: "Готовы к экспорту"
    heritage: "Наследие"

forms:
  validation:
    required: "Это поле обязательно"
    email: "Введите корректный email"
    min_length: "Минимальная длина не достигнута"
  newsletter:
    placeholder: "Введите ваш email"
    submit: "Подписаться"
```

**For Chinese (`_data/translations/zh.yml`):**
```yaml
search:
  presets:
    featured: "精选"
    founder_led: "创始人主导"
    export_ready: "出口就绪"
    heritage: "传统品牌"

forms:
  validation:
    required: "此字段为必填项"
    email: "请输入有效的电子邮箱"
    min_length: "未达到最小长度"
  newsletter:
    placeholder: "输入您的邮箱"
    submit: "订阅"
```

### Phase 5: Advanced Helper Updates

#### 5.1 Update `_includes/helpers/component-defaults.html`
Enhance to work with new component_defaults.yml structure:

```liquid
{% comment %}
Get component default value with enhanced path support
Parameters:
- component: Component path (e.g., "cards.brand-card" or "dimensions.dimension-cloud")
- param: Parameter name
- fallback: Fallback value if not found

Usage:
{% capture default_value %}{% include helpers/component-defaults.html component="cards.brand-card" param="show_location" fallback=true %}{% endcapture %}
{% endcomment %}

{% assign path_parts = include.component | split: "." %}
{% assign config = site.data.component_defaults %}

{% for part in path_parts %}
  {% assign config = config[part] %}
  {% unless config %}
    {% break %}
  {% endunless %}
{% endfor %}

{% if config and config[include.param] %}
  {{ config[include.param] }}
{% else %}
  {{ include.fallback }}
{% endif %}
```

### Phase 6: Testing and Validation

#### 6.1 Test all changes
Run these commands to verify implementation:

```bash
# Test build
bundle exec jekyll build

# Check for broken links or missing files
bundle exec jekyll doctor

# Test language consistency
_scripts/validation/check_language_consistency.sh

# Verify search functionality still works
# Test all dimension filters
# Test search presets
# Verify no JavaScript errors in browser console
```

#### 6.2 Performance validation
```bash
# Time the build to ensure no performance regression
time JEKYLL_ENV=production bundle exec jekyll build

# Should still be around 12-13 seconds
```

### Phase 7: Documentation Updates

#### 7.1 Update `CLAUDE.md`
Add these new sections and update existing ones:

**In the "Logic Light" Approach section, add:**
```markdown
### Centralized Dimension Configuration
All dimension data is now managed through `_data/dimensions_config.yml`:
- Eliminates hardcoded dimension lists throughout templates
- Provides consistent ordering and metadata
- Enables easy addition of new dimensions

### Enhanced Component Defaults
The `_data/component_defaults.yml` now includes comprehensive configuration for:
- Dimension display components
- Search and filter components  
- Card display components
- Form validation and behavior
- Map integration settings

### Translation Key Standardization
New helper `translation-key-builder.html` provides consistent key construction:
```liquid
{% capture key %}{% include helpers/translation-key-builder.html base="dimensions" parts=dimension_parts %}{% endcapture %}
```

### Body Class Generation
Centralized body class logic eliminates complex conditionals in layouts:
```liquid
<body class="{% include helpers/body-class.html %}">
```
```

#### 7.2 Update `_docs/technical-reference.md`
Add section on new data structures:

```markdown
## Centralized Configuration Files

### Dimension Configuration (`_data/dimensions_config.yml`)
Central source for all dimension data including:
- Complete dimension lists with ordering
- Country code mappings for markets
- Display names and metadata

### Search Configuration (`_data/search_presets.yml`) 
Defines search preset buttons with:
- Filter configurations
- Translation keys
- Icon assignments

### Enhanced Component Defaults (`_data/component_defaults.yml`)
Comprehensive default values for all components organized by:
- Component type (dimensions, search, cards, forms, maps)
- Specific component within type
- Parameter-level defaults with fallbacks
```

#### 7.3 Update `_docs/daily-workflows.md`
Update the "Adding a New Dimension" section:

```markdown
### Adding a New Dimension

**1. Add to dimensions configuration:**
```bash
# Edit _data/dimensions_config.yml
# Add new dimension to appropriate type section
# Assign order number and metadata
```

**2. Create dimension files in all languages:**
```bash
# Create in _dimensions/en/[type]/[new-dimension].md
# Create in _dimensions/ru/[type]/[new-dimension].md  
# Create in _dimensions/zh/[type]/[new-dimension].md
```

**3. Add translations:**
```bash
# Add to _data/translations/en.yml
# Add to _data/translations/ru.yml
# Add to _data/translations/zh.yml
```

**4. No template updates needed** - new dimension will automatically appear in search filters and dimension clouds.
```

## Success Criteria

After implementation, verify:

1. **Zero hardcoded dimension lists** remain in templates
2. **Search filter functionality** works identically to before
3. **Build time** remains 12-13 seconds (no performance regression)
4. **All language switching** continues to work properly
5. **Component defaults** are consistently applied across all components
6. **New dimensions** can be added through data files only (no template changes)

## Completion Checklist

- [ ] Created `_data/dimensions_config.yml` with all dimension data
- [ ] Created `_data/search_presets.yml` with preset configurations
- [ ] Expanded `_data/component_defaults.yml` with comprehensive defaults
- [ ] Created `_includes/helpers/body-class.html` helper
- [ ] Created `_includes/helpers/translation-key-builder.html` helper
- [ ] Created `_includes/helpers/dimension-data.html` helper
- [ ] Updated `_layouts/default.html` to use body-class helper
- [ ] Updated `_includes/components/search/search-filter.html` to use dimension data
- [ ] Updated `_data/page_sections.yml` with body class configuration
- [ ] Added translation keys for search presets to all language files
- [ ] Enhanced `_includes/helpers/component-defaults.html` for new structure
- [ ] Tested build and functionality
- [ ] Updated `CLAUDE.md` documentation
- [ ] Updated `_docs/technical-reference.md` documentation  
- [ ] Updated `_docs/daily-workflows.md` documentation

This implementation will eliminate 200+ lines of hardcoded logic, reduce template complexity by 30-40%, and create a more maintainable, data-driven architecture that aligns perfectly with Brandmine's "logic light" philosophy.