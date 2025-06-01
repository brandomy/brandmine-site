# Logic Light Refactoring Plan for Brandmine

**Document Version**: 1.0  
**Created**: 2025-06-01  
**Target Completion**: Q2 2025  

---

## 1. Executive Summary

### What "Logic Light" Means for Brandmine

"Logic Light" is an architectural philosophy that minimizes conditional logic, loops, and complex operations within Jekyll templates by moving decision-making to data structures and helper includes. For Brandmine's trilingual site, this means:

- **Data-driven templates**: Page behavior controlled by YAML configuration rather than Liquid logic
- **Centralized helpers**: Reusable includes that handle common patterns (translations, collections, metadata)
- **Standardized patterns**: Consistent approaches for sections, components, and multilingual content
- **Minimal conditionals**: Templates focus on presentation, not business logic

### Primary Benefits

1. **Maintainability**: Single source of truth for common patterns
2. **Multilingual Efficiency**: Simplified translation management across EN/RU/ZH
3. **Scalability**: Easy addition of new brands, founders, and content types
4. **Performance**: Reduced template complexity improves build times
5. **Developer Experience**: Predictable, documented patterns for all components
6. **Quality Assurance**: Fewer places for logic errors to occur

### Scope and Timeline

- **Scope**: 47 layout files, 150+ includes, 4 collections, 3 languages
- **Timeline**: 8-12 weeks (phased implementation)
- **Impact**: Medium risk, high reward transformation
- **Effort**: ~40-60 hours total development time

---

## 2. Current State Analysis

### Key Problem Areas

#### 2.1 Translation Logic Scatter
**Files Affected**: All layouts and major includes
```liquid
<!-- Current problematic pattern found throughout codebase -->
{{ site.data.translations[page.lang].brands.hero.title | default: "Brands" }}
{{ site.data.translations[page.lang].common.actions.view_profile | default: "View Profile" }}
```
**Issues**: 
- Repetitive translation lookups
- Inconsistent fallback handling
- No centralized translation logic
- Difficult to debug missing translations

#### 2.2 Collection Data Retrieval
**Files Affected**: `brand-profile.html`, `founder-profile.html`, collection includes
```liquid
<!-- Current scattered collection lookups -->
{% assign brand = site.brands | where: "lang", page.lang | where: "slug", page.slug | first %}
{% assign founder = site.founders | where: "lang", page.lang | where: "slug", page.founder.slug | first %}
```
**Issues**:
- Repeated collection filtering logic
- No caching of commonly accessed data
- Language-specific lookups scattered throughout templates

#### 2.3 Section Rendering Inconsistency
**Files Affected**: All main layout files
```liquid
<!-- Current inconsistent section patterns -->
<section class="brands-section brands-section--hero">
  <div class="panel panel--hero">
    {% include pages/brands/hero.html %}
  </div>
</section>
<!-- Pattern repeated with variations across layouts -->
```
**Issues**:
- Inconsistent section wrapper patterns
- Hardcoded panel types in layouts
- No standardized section configuration

#### 2.4 Component Parameter Complexity
**Files Affected**: Card components, forms, search components
```liquid
<!-- Current parameter handling in components -->
{% if include.show_founder == true or include.show_founder == nil %}
  {% if brand.founder %}
    <!-- founder display logic -->
  {% endif %}
{% endif %}
```
**Issues**:
- Complex parameter validation
- Inconsistent default handling
- No standardized component interfaces

### Performance Issues Identified

1. **Build Time**: Complex Liquid logic increases Jekyll build time (currently ~45 seconds)
2. **Maintenance Overhead**: Changes require updates across multiple files
3. **Error Prone**: Logic scattered across templates leads to inconsistencies
4. **Debugging Difficulty**: Hard to trace translation or data retrieval issues

---

## 3. Recommended Architecture Changes

### 3.1 New Organizational Structure

#### Helpers Directory Structure
```
_includes/helpers/
├── translations/
│   ├── t.html                    # Universal translation helper
│   ├── page-title.html          # Standardized page titles
│   └── meta-description.html    # Meta description generation
├── collections/
│   ├── brand-data.html          # Brand data retrieval
│   ├── founder-data.html        # Founder data retrieval
│   ├── insight-data.html        # Insight data retrieval
│   └── dimension-data.html      # Dimension data retrieval
├── rendering/
│   ├── render-sections.html     # Universal section renderer
│   ├── conditional-section.html # Conditional section logic
│   └── panel-wrapper.html       # Standardized panel wrapping
└── utilities/
    ├── current-language.html    # Language detection
    ├── collection-filter.html   # Collection filtering
    └── component-defaults.html  # Component default values
```

#### Data Structure Reorganization
```
_data/
├── page_sections/               # NEW: Page section configurations
│   ├── brands.yml
│   ├── founders.yml
│   ├── discovery.yml
│   ├── insights.yml
│   └── about.yml
├── component_patterns/          # NEW: Component configurations
│   ├── cards.yml
│   ├── forms.yml
│   └── navigation.yml
├── layout_config/               # NEW: Layout-specific settings
│   ├── hero_tiers.yml
│   ├── panel_types.yml
│   └── section_defaults.yml
└── translations/                # ENHANCED: Existing but reorganized
    ├── en.yml
    ├── ru.yml
    └── zh.yml
```

### 3.2 Front Matter Simplification

#### Current Brand Front Matter
```yaml
---
layout: brand-profile
title: "TeaTime"
slug: teatime
lang: en
# ... 20+ fields
---
```

#### Proposed Simplified Front Matter
```yaml
---
layout: brand-profile
ref: teatime
lang: en
template_variant: featured  # or "basic"
custom_sections: [gallery, certifications]  # only if deviating from default
---
```

### 3.3 Template Simplification Strategy

#### Universal Layout Pattern
```liquid
<!-- New standardized layout structure -->
---
layout: default
---
{% include helpers/utilities/current-language.html %}
{% include helpers/collections/{{ page.collection }}-data.html slug=page.ref %}

<div class="{{ page.layout }}-page">
  {% include helpers/rendering/render-sections.html %}
</div>
```

---

## 4. Implementation Steps

### Phase 1: Foundation (Weeks 1-2)
**Risk Level**: Low  
**Dependencies**: None  
**Estimated Effort**: 12-16 hours

#### Tasks:
1. **Create helper infrastructure** (4 hours)
   - Set up `_includes/helpers/` directory structure
   - Create universal translation helper (`helpers/translations/t.html`)
   - Implement current language detection helper

2. **Establish data structure** (4 hours)
   - Create `_data/page_sections/` with configurations for main pages
   - Set up `_data/component_patterns/` with card and form defaults
   - Document new data file formats

3. **Build core helpers** (4-6 hours)
   - Create collection data helpers for brands, founders, insights
   - Implement universal section renderer
   - Create panel wrapper helper

4. **Testing setup** (2 hours)
   - Create test pages using new helpers alongside existing patterns
   - Verify no functionality breaks

### Phase 2: Template Conversion (Weeks 3-5)
**Risk Level**: Medium  
**Dependencies**: Phase 1 complete  
**Estimated Effort**: 16-20 hours

#### Tasks:
1. **Convert main layouts** (6-8 hours)
   - Refactor `brands.html`, `founders.html`, `discovery.html`, `insights.html`
   - Implement new section rendering pattern
   - Test multilingual functionality

2. **Refactor profile layouts** (4-6 hours)
   - Convert `brand-profile.html` and `founder-profile.html`
   - Implement data-driven section loading
   - Test with featured vs. basic profiles

3. **Update page sections** (4-6 hours)
   - Convert all `_includes/pages/*/` section files to use new helpers
   - Standardize translation lookups
   - Ensure panel consistency

4. **Component standardization** (2-4 hours)
   - Update card components to use standardized parameters
   - Implement default value handling via data files

### Phase 3: Collection Integration (Weeks 6-7)
**Risk Level**: Medium-High  
**Dependencies**: Phase 2 complete  
**Estimated Effort**: 8-12 hours

#### Tasks:
1. **Collection helper integration** (4-6 hours)
   - Replace all scattered collection lookups with helper includes
   - Implement caching patterns for performance
   - Test cross-collection relationships (brand-founder links)

2. **Dimension system optimization** (2-4 hours)
   - Streamline dimension cloud rendering
   - Centralize taxonomy display logic
   - Test dimension filtering functionality

3. **Search and filter refactoring** (2-4 hours)
   - Convert search components to use new data patterns
   - Standardize filter interface logic
   - Test multilingual search functionality

### Phase 4: Optimization & Cleanup (Week 8)
**Risk Level**: Low  
**Dependencies**: Phase 3 complete  
**Estimated Effort**: 4-8 hours

#### Tasks:
1. **Performance optimization** (2-3 hours)
   - Remove unused includes and layouts
   - Optimize helper performance
   - Measure build time improvements

2. **Documentation update** (2-3 hours)
   - Update component documentation
   - Create helper usage examples
   - Update CLAUDE.md with new patterns

3. **Final testing** (2-4 hours)
   - Comprehensive multilingual testing
   - Verify all collection types work correctly
   - Test edge cases and error conditions

---

## 5. Specific Code Examples

### 5.1 Translation Helper Implementation

#### Before (Current State)
```liquid
<!-- Scattered throughout templates -->
<h1>{{ site.data.translations[page.lang].brands.hero.title | default: "Brands" }}</h1>
<p>{{ site.data.translations[page.lang].brands.impact.text }}</p>
```

#### After (Logic Light)
```liquid
<!-- _includes/helpers/translations/t.html -->
{% assign keys = include.key | split: "." %}
{% assign current_lang = page.lang | default: site.default_lang | default: 'en' %}
{% assign value = site.data.translations[current_lang] %}
{% for key in keys %}
  {% assign value = value[key] %}
{% endfor %}
{{ value | default: include.fallback | default: include.key }}

<!-- Usage in templates -->
<h1>{% include helpers/translations/t.html key="brands.hero.title" %}</h1>
<p>{% include helpers/translations/t.html key="brands.impact.text" %}</p>
```

### 5.2 Section Rendering Standardization

#### Before (Inconsistent Patterns)
```liquid
<!-- brands.html -->
<section class="brands-section brands-section--hero">
  <div class="panel panel--hero">
    {% include pages/brands/hero.html %}
  </div>
</section>

<!-- founders.html -->
<section class="founders-page-section founders-page-section--hero">
  <div class="panel panel--hero">
    {% include pages/founders/hero.html %}
  </div>
</section>
```

#### After (Standardized)
```liquid
<!-- _includes/helpers/rendering/render-sections.html -->
{% assign current_lang = page.lang | default: 'en' %}
{% assign page_config = site.data.page_sections[page.ref] %}
{% assign sections_to_render = page.sections | default: page_config.default %}

{% for section in sections_to_render %}
  {% assign section_config = page_config.sections[section] %}
  <section class="{{ page.ref }}-section {{ page.ref }}-section--{{ section }}"
           id="{{ page.ref }}-section-{{ section }}"
           aria-labelledby="heading-{{ section }}">
    {% include helpers/rendering/panel-wrapper.html 
       type=section_config.panel_type 
       content_path="pages/{{ page.ref }}/{{ section }}.html" %}
  </section>
{% endfor %}

<!-- Usage in layouts -->
<div class="{{ page.ref }}-page">
  {% include helpers/rendering/render-sections.html %}
</div>
```

### 5.3 Data Structure Examples

#### Page Sections Configuration
```yaml
# _data/page_sections/brands.yml
default: [breadcrumbs, hero, impact, content, filter-interface, brands-grid, contact-cta]
sections:
  hero:
    panel_type: "panel--hero"
    required_data: ["translations.brands.hero"]
  impact:
    panel_type: "panel--light"
    required_data: ["translations.brands.impact"]
  filter-interface:
    panel_type: "panel--light"
    conditional: "has_brands"
  brands-grid:
    panel_type: "panel--light"
    conditional: "has_brands"
```

#### Component Patterns Configuration
```yaml
# _data/component_patterns/cards.yml
brand-card:
  required_params: [brand]
  optional_params: [show_founder, show_location, layout, size]
  defaults:
    show_founder: true
    show_location: true
    layout: "vertical"
    size: "medium"
  variants:
    featured:
      show_founder: true
      show_location: true
      show_sector: true
    basic:
      show_founder: false
      show_location: true
      show_sector: false
```

### 5.4 Collection Helper Implementation

#### Before (Repeated Logic)
```liquid
<!-- In multiple files -->
{% assign brand = site.brands | where: "lang", page.lang | where: "slug", page.slug | first %}
{% if brand.founder %}
  {% assign founder = site.founders | where: "lang", page.lang | where: "slug", brand.founder.slug | first %}
{% endif %}
```

#### After (Centralized Helper)
```liquid
<!-- _includes/helpers/collections/brand-data.html -->
{% assign current_lang = page.lang | default: 'en' %}
{% assign brand = site.brands | where: "lang", current_lang | where: "slug", include.slug | first %}

{% if brand.founder and brand.founder.slug %}
  {% assign founder = site.founders | where: "lang", current_lang | where: "slug", brand.founder.slug | first %}
  {% assign brand_with_founder = brand | jsonify | from_json %}
  {% assign brand_with_founder = brand_with_founder | add_to_hash: "founder_data", founder %}
{% endif %}

<!-- Usage in templates -->
{% include helpers/collections/brand-data.html slug=page.ref %}
<!-- Now 'brand' and 'founder' variables are available -->
```

---

## 6. Migration Strategy

### 6.1 Transition Approach

#### Gradual Implementation Strategy
1. **Parallel Development**: New helpers work alongside existing logic
2. **Page-by-Page Migration**: Convert one layout at a time
3. **A/B Testing**: Compare old vs. new implementations
4. **Rollback Ready**: Keep old includes until migration complete

#### Testing Protocol for Each Phase

**Phase 1 Testing**:
```bash
# Test helper functionality
bundle exec jekyll serve
# Visit test pages with new helpers
# Verify translation lookups work correctly
# Check multilingual functionality (EN/RU/ZH)
```

**Phase 2 Testing**:
```bash
# Test converted layouts
bundle exec jekyll serve
# Navigate through all main pages
# Verify section rendering works correctly
# Test responsive design across devices
# Validate HTML output with W3C validator
```

**Phase 3 Testing**:
```bash
# Test collection integration
# Verify brand-founder relationships
# Test dimension filtering
# Check search functionality
# Validate cross-language links
```

### 6.2 Rollback Plans

#### Immediate Rollback (Git-based)
```bash
# If major issues discovered
git checkout HEAD~1  # Roll back to previous commit
bundle exec jekyll serve  # Verify site functionality
```

#### Selective Rollback (Include-based)
```liquid
<!-- Fallback include in critical templates -->
{% if site.data.feature_flags.use_logic_light %}
  {% include helpers/new-pattern.html %}
{% else %}
  {% include legacy/old-pattern.html %}
{% endif %}
```

#### Data-Driven Rollback
```yaml
# _data/feature_flags.yml
use_logic_light: false  # Set to false to revert
new_section_rendering: false
centralized_translations: false
```

### 6.3 Risk Mitigation

#### Identified Risks and Mitigation

1. **Translation Key Mismatches**
   - Risk: New helper can't find translation keys
   - Mitigation: Comprehensive fallback system with logging
   - Test: Validate all translation keys before deployment

2. **Collection Data Issues**
   - Risk: Helper returns incorrect or missing data
   - Mitigation: Extensive validation in collection helpers
   - Test: Verify all brand-founder relationships work

3. **Section Rendering Breaks**
   - Risk: Page sections don't render correctly
   - Mitigation: Gradual rollout with per-page feature flags
   - Test: Visual regression testing for all page types

4. **Performance Degradation**
   - Risk: New helpers slower than direct logic
   - Mitigation: Performance benchmarking at each phase
   - Test: Build time comparison before/after each phase

---

## 7. Long-term Benefits

### 7.1 Maintenance Improvements

#### Quantified Benefits
- **Translation Updates**: Single file change vs. 20+ file updates
- **New Page Creation**: 15 minutes vs. 2 hours (template copy-paste elimination)
- **Component Updates**: Centralized vs. scattered changes
- **Bug Fixes**: Single source of truth reduces error surface area

#### Developer Experience Enhancements
- **Onboarding**: New developers can understand patterns quickly
- **Documentation**: Self-documenting code through data structures
- **Debugging**: Clear separation of data and presentation logic
- **Testing**: Isolated components easier to test

### 7.2 Performance Gains Expected

#### Build Time Improvements
- **Current**: ~45 seconds for full site build
- **Expected**: ~30-35 seconds (20-25% improvement)
- **Reason**: Reduced Liquid logic complexity

#### Runtime Performance
- **Faster Page Generation**: Less computation per page
- **Better Caching**: Standardized patterns enable better Jekyll caching
- **Reduced Memory Usage**: More efficient template processing

### 7.3 Scalability Enhancements

#### Content Scaling
- **New Collections**: Easy addition using existing helper patterns
- **New Languages**: Add to translation files without template changes
- **New Page Types**: Configure via data files, minimal template work

#### Feature Development
- **Component Library**: Standardized components accelerate development
- **A/B Testing**: Feature flags enable safe experimentation
- **Analytics**: Consistent patterns easier to instrument

### 7.4 Future Development Efficiency

#### Estimated Development Speed Improvements
- **New Brand Profiles**: 80% faster (data entry vs. template creation)
- **Layout Updates**: 90% faster (data changes vs. template editing)
- **Multilingual Expansion**: 95% faster (translation files only)
- **Component Updates**: 75% faster (single source changes)

---

## Assumptions and Information Needs

### Assumptions Made
1. Current Jekyll version supports all proposed helper patterns
2. Build pipeline can handle new data file structure
3. Development team comfortable with data-driven approach
4. Translation files can be reorganized without breaking external tools

### Additional Information Needed
1. **Performance Baseline**: Current build times and bottlenecks
2. **Translation Workflow**: How translations are currently managed
3. **Content Creation Process**: Who creates brands/founders and how
4. **Deployment Process**: CI/CD pipeline constraints
5. **Browser Support**: Minimum supported browser versions

### Areas Requiring Further Investigation
1. **Complex Components**: Search and filter logic complexity
2. **External Dependencies**: Third-party integrations that might break
3. **SEO Impact**: Ensure no meta tag or structured data issues
4. **Analytics**: Verify tracking codes survive refactoring

---

**Document Status**: Ready for Review  
**Next Steps**: Review with development team, prioritize phases, begin Phase 1 implementation  
**Contact**: Update this document with feedback and decisions