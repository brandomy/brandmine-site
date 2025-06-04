# Brandmine "Logic Light" Architecture Audit Report

## Executive Summary

This audit identifies opportunities to further reduce template logic and improve the "logic light" architecture of the Brandmine Jekyll site. The analysis reveals that while significant progress has been made with centralized configuration, there remain substantial opportunities to eliminate hardcoded values, complex conditionals, and scattered patterns.

## High Priority Issues

### 1. Hardcoded Dimension Lists in Search Filter
**File/Location**: `_includes/components/search/search-filter.html`
- Lines 89-96: Hardcoded sectors list
- Lines 104-130: Complex case statement for market mapping
- Lines 138-144: Hardcoded attributes list
- Lines 152-157: Hardcoded signals list

**Current Pattern**:
```liquid
{% assign sectors = "wine,natural-beauty,gourmet-foods,artisanal-spirits,hotels-resorts,artisan-ceramics,artisan-confectionery,cured-meats,fashion-accessories,fermented-dairy,halal-foods,honey-bee-products,jewelry-watches,mineral-waters,natural-supplements,specialty-cheeses" | split: "," %}
```

**Suggested Improvement**:
Create `_data/dimensions_config.yml`:
```yaml
dimensions:
  sectors:
    items:
      - slug: wine
        order: 1
      - slug: natural-beauty
        order: 2
      # ... etc
  markets:
    items:
      - slug: brazil
        country_code: br
        order: 1
      # ... etc
```

Then in template:
```liquid
{% assign sectors = site.data.dimensions_config.dimensions.sectors.items %}
{% for sector_item in sectors %}
  <input type="checkbox" name="sector" value="{{ sector_item.slug }}">
{% endfor %}
```

**Impact Assessment**: High - Eliminates 80+ lines of hardcoded logic
**Implementation Effort**: Easy - Create data file and update template

### 2. Complex Body Class Logic in Default Layout
**File/Location**: `_layouts/default.html`
- Lines 88-100: Nested case statements for body classes

**Current Pattern**:
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

**Suggested Improvement**:
Create helper `_includes/helpers/body-class.html`:
```liquid
{% assign body_class_map = site.data.page_sections %}
{% if body_class_map[page.ref] %}
  {{ body_class_map[page.ref].body_class | default: page.ref | append: '-page' }}
{% elsif page.layout %}
  {{ page.layout | append: '-page' }}
{% else %}
  default-page
{% endif %}
```

**Impact Assessment**: Medium - Removes nested logic from layout
**Implementation Effort**: Easy - Create helper and update layout

### 3. Complex Section Routing in page-sections.html
**File/Location**: `_includes/helpers/page-sections.html`
- Lines 70-154: Extensive conditional logic for section routing

**Current Pattern**:
Multiple nested if/elsif blocks handling special cases for each page type.

**Suggested Improvement**:
Extend `_data/page_sections.yml` with section routing configuration:
```yaml
brands:
  section_routes:
    content:
      include: "pages/brands/content.html"
    hero:
      include: "pages/brands/hero.html"
    filter-interface:
      include: "pages/brands/filter-interface.html"
```

**Impact Assessment**: High - Reduces 80+ lines of conditional logic
**Implementation Effort**: Moderate - Requires data structure redesign

## Medium Priority Issues

### 4. Missing Component Defaults
**File/Location**: `_data/component_defaults.yml`

Many components still use hardcoded defaults instead of centralized configuration.

**Components Missing**:
- All dimension components
- Map components
- Search components
- Form validation rules

**Suggested Improvement**:
Expand `component_defaults.yml` comprehensively:
```yaml
dimensions:
  dimension-cloud:
    max_tags: 20
    min_font_size: 14
    max_font_size: 24
  dimension-list:
    show_description: true
    layout: vertical

search:
  search-filter:
    debounce_delay: 300
    min_query_length: 3
    
forms:
  validation:
    email_pattern: "^[^@]+@[^@]+\\.[^@]+$"
    required_message: "This field is required"
```

**Impact Assessment**: Medium - Centralizes scattered defaults
**Implementation Effort**: Easy - Update data file

### 5. Translation Key Construction Patterns
**File/Location**: Multiple components

Complex string concatenation for building translation keys appears throughout.

**Current Pattern**:
```liquid
{% assign attribute_key = 'dimensions.attributes.' | append: dimension.slug | append: '.name' %}
```

**Suggested Improvement**:
Create `_includes/helpers/translation-key-builder.html`:
```liquid
{% comment %}
Parameters:
- base: Base key path
- parts: Array of key parts
- separator: Key separator (default: ".")
{% endcomment %}
{% assign separator = include.separator | default: "." %}
{% assign key = include.base %}
{% for part in include.parts %}
  {% assign key = key | append: separator | append: part %}
{% endfor %}
{{ key }}
```

**Impact Assessment**: Medium - Reduces repetition across components
**Implementation Effort**: Easy - Create helper

## Low Priority Issues

### 6. Hardcoded Presets in Search Filter
**File/Location**: `_includes/components/search/search-filter.html`
- Lines 42-59: Case statement for preset buttons

**Suggested Improvement**:
Create `_data/search_presets.yml`:
```yaml
brands:
  - id: featured
    label: "Featured"
    filters:
      featured: true
  - id: founder-led
    label: "Founder Led"
    filters:
      attributes: ["founder-led"]
```

**Impact Assessment**: Low - Improves maintainability
**Implementation Effort**: Easy

### 7. Navigation Enhancement
**File/Location**: `_data/navigation/*.yml`

Current navigation files are too simple and could include more metadata for better flexibility.

**Suggested Improvement**:
```yaml
- id: home
  name_key: "nav.home"
  link: "/en/"
  icon: "home"
  show_in_mobile: true
  show_in_footer: false
  order: 1
```

**Impact Assessment**: Low - Future flexibility
**Implementation Effort**: Easy

## Summary of Recommendations

### Immediate Actions (High Impact, Easy Implementation)
1. **Create `_data/dimensions_config.yml`** - Eliminate all hardcoded dimension lists
2. **Create body-class helper** - Remove nested case logic from default layout
3. **Expand `component_defaults.yml`** - Add missing component configurations

### Short-term Actions (Medium Impact, Moderate Effort)
1. **Refactor `page-sections.html`** - Move routing logic to configuration
2. **Create translation-key-builder helper** - Standardize key construction
3. **Create `_data/search_presets.yml`** - Make search presets data-driven

### Long-term Actions (Future Improvements)
1. **Enhance navigation structure** - Add metadata for advanced features
2. **Create comprehensive icon mapping** - Centralize icon usage
3. **Build form validation configuration** - Data-driven validation rules

## Expected Outcomes

Implementing these recommendations will:
- **Reduce template complexity by 30-40%**
- **Eliminate 200+ lines of hardcoded logic**
- **Centralize configuration in 5-6 new data files**
- **Create 3-4 new helper includes for common patterns**
- **Improve build performance** through reduced template processing
- **Enhance maintainability** through consistent patterns

## Implementation Priority

Focus on changes that:
1. Remove the most hardcoded values (dimensions lists)
2. Eliminate complex conditional logic (body classes, section routing)
3. Create reusable patterns (helpers for common operations)
4. Centralize scattered configuration (component defaults)

These improvements align perfectly with Brandmine's "logic light" philosophy: configuration over conditionals, data-driven behavior, and minimal template complexity.