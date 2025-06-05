# Component Addition Workflow Template

**Systematic guide for adding new components to Brandmine with 100% architecture compliance**

---

## 🎯 Overview

This workflow ensures new components integrate seamlessly with Brandmine's "Logic Light" architecture, maintaining centralized configuration and consistent behavior patterns. Based on successful implementation of the founder quote card system.

### "Logic Light" Architecture Principles
- **Configuration over conditionals** - Use `_data/component_defaults.yml` instead of hard-coded values
- **Centralized parameter handling** - Leverage `helpers/component-defaults.html` pattern
- **BEM CSS methodology** - Block Element Modifier naming conventions
- **Linear layout compliance** - Mobile-first, no sidebar complexity
- **Multilingual support** - Consistent behavior across EN/RU/ZH

---

## 🏗️ Pre-Implementation Planning

### 1. Component Design Specification

Before coding, define:

**Component Purpose & Scope**
```yaml
component_name: "feature-highlight-card"
category: "cards"  # cards, forms, navigation, etc.
purpose: "Display featured content with optional call-to-action"
contexts: ["homepage features", "service highlights", "product showcases"]
```

**Parameter Requirements**
```yaml
parameters:
  required:
    - title: "Display heading"
    - content: "Main content area"
  optional:
    - icon: "Optional icon display"
    - cta_text: "Call-to-action button text"
    - cta_url: "Call-to-action link"
    - style: "Visual variant (default, featured, minimal)"
```

**Behavioral Variants**
```yaml
styles:
  - default: "Standard appearance"
  - featured: "Highlighted with accent colors"
  - minimal: "Reduced visual emphasis"
layout_options:
  - horizontal: "Side-by-side icon and content"
  - vertical: "Stacked layout"
  - compact: "Condensed spacing"
```

### 2. Architecture Integration Research

**Review Existing Patterns**
```bash
# Examine similar components
ls _includes/components/cards/
grep -r "component-defaults" _includes/components/cards/

# Check CSS organization
ls assets/css/components/cards/
```

**Identify Configuration Needs**
- Which parameters need centralized defaults?
- How does it integrate with existing page sections?
- What translation keys are required?

---

## 📝 Step-by-Step Implementation

### Step 1: Create Component HTML Include

**File: `_includes/components/cards/feature-highlight-card.html`**

```liquid
{% comment %}
  Component: cards/feature-highlight-card.html
  Purpose: Display featured content with optional call-to-action and icon
  
  Parameters:
  - title: Display heading (required)
  - content: Main content area (required)
  - icon: Optional icon identifier (optional)
  - cta_text: Call-to-action button text (optional)
  - cta_url: Call-to-action link (optional)
  - style: Visual variant - default, featured, minimal (optional)
  - layout: Layout option - horizontal, vertical, compact (optional)
  
  Usage Examples:
  {% include components/cards/feature-highlight-card.html 
     title="Premium Service" 
     content="Comprehensive support for growing brands" 
     icon="star" 
     cta_text="Learn More" 
     cta_url="/services/" %}
  
  {% include components/cards/feature-highlight-card.html 
     title="Export Ready" 
     content="Streamlined international expansion" 
     style="featured" 
     layout="horizontal" %}
  
  Design Philosophy:
  - Uses centralized defaults from _data/component_defaults.yml
  - Follows BEM naming conventions for CSS classes
  - Maintains consistent parameter patterns across card components
  - Supports multilingual content through translation helpers
{% endcomment %}

{% comment %} Get centralized defaults {% endcomment %}
{% capture default_style %}{% include helpers/component-defaults.html component="cards.feature-highlight-card" param="style" fallback="default" %}{% endcapture %}
{% capture default_layout %}{% include helpers/component-defaults.html component="cards.feature-highlight-card" param="layout" fallback="vertical" %}{% endcapture %}
{% capture default_show_icon %}{% include helpers/component-defaults.html component="cards.feature-highlight-card" param="show_icon" fallback=true %}{% endcapture %}
{% capture default_show_cta %}{% include helpers/component-defaults.html component="cards.feature-highlight-card" param="show_cta" fallback=true %}{% endcapture %}

{% comment %} Apply parameter hierarchy: include param → defaults → fallback {% endcomment %}
{% assign style = include.style | default: default_style %}
{% assign layout = include.layout | default: default_layout %}
{% assign show_icon = include.show_icon | default: default_show_icon %}
{% assign show_cta = include.show_cta | default: default_show_cta %}

{% comment %} Required parameters {% endcomment %}
{% assign title = include.title %}
{% assign content = include.content %}

{% comment %} Optional parameters {% endcomment %}
{% assign icon = include.icon %}
{% assign cta_text = include.cta_text %}
{% assign cta_url = include.cta_url %}

{% comment %} Build CSS classes using BEM methodology {% endcomment %}
{% assign card_classes = "feature-highlight-card" %}
{% assign card_classes = card_classes | append: " feature-highlight-card--" | append: style %}
{% assign card_classes = card_classes | append: " feature-highlight-card--" | append: layout %}

{% if include.additional_classes %}
  {% assign card_classes = card_classes | append: " " | append: include.additional_classes %}
{% endif %}

{% comment %} Component output {% endcomment %}
<div class="{{ card_classes }}">
  
  {% if show_icon and icon %}
    <div class="feature-highlight-card__icon">
      {% include components/icons/icon.html name=icon %}
    </div>
  {% endif %}
  
  <div class="feature-highlight-card__content">
    {% if title %}
      <h3 class="feature-highlight-card__title">{{ title }}</h3>
    {% endif %}
    
    {% if content %}
      <div class="feature-highlight-card__description">
        {{ content }}
      </div>
    {% endif %}
    
    {% if show_cta and cta_text and cta_url %}
      <div class="feature-highlight-card__action">
        <a href="{{ cta_url }}" class="feature-highlight-card__cta">
          {{ cta_text }}
        </a>
      </div>
    {% endif %}
  </div>
  
</div>
```

### Step 2: Create CSS Styles

**File: `assets/css/components/cards/feature-highlight-card.scss`**

```scss
// Component: feature-highlight-card.scss
// Purpose: Styles for feature highlight card component
// Architecture: BEM methodology with design tokens

.feature-highlight-card {
  // Base styles using design tokens
  margin: var(--space-6) 0;
  padding: var(--space-6);
  background-color: var(--neutral-50);
  border-radius: var(--radius-md);
  transition: var(--transition-base);
  
  // Hover state
  &:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-lg);
  }
  
  // Icon element
  &__icon {
    margin-bottom: var(--space-4);
    color: var(--primary-600);
    
    svg {
      width: var(--space-12);
      height: var(--space-12);
    }
  }
  
  // Content wrapper
  &__content {
    flex: 1;
  }
  
  // Title element
  &__title {
    margin: 0 0 var(--space-3) 0;
    font-family: var(--font-heading);
    font-size: var(--text-xl);
    font-weight: var(--font-semibold);
    color: var(--neutral-900);
    line-height: var(--leading-tight);
  }
  
  // Description element
  &__description {
    margin-bottom: var(--space-4);
    color: var(--neutral-700);
    line-height: var(--leading-relaxed);
  }
  
  // Action wrapper
  &__action {
    margin-top: var(--space-4);
  }
  
  // Call-to-action button
  &__cta {
    display: inline-flex;
    align-items: center;
    padding: var(--space-2) var(--space-4);
    background-color: var(--primary-600);
    color: var(--white);
    text-decoration: none;
    border-radius: var(--radius-sm);
    font-weight: var(--font-medium);
    transition: var(--transition-base);
    
    &:hover {
      background-color: var(--primary-700);
      transform: translateY(-1px);
    }
    
    &:focus {
      outline: none;
      box-shadow: 0 0 0 3px var(--primary-200);
    }
  }
  
  // Style modifiers
  &--featured {
    background: linear-gradient(135deg, var(--primary-50), var(--accent-50));
    border: 2px solid var(--primary-200);
    
    .feature-highlight-card__title {
      color: var(--primary-900);
    }
    
    .feature-highlight-card__icon {
      color: var(--primary-700);
    }
  }
  
  &--minimal {
    padding: var(--space-4);
    background-color: transparent;
    border: 1px solid var(--neutral-200);
    
    &:hover {
      transform: none;
      border-color: var(--primary-300);
      box-shadow: none;
    }
  }
  
  // Layout modifiers
  &--horizontal {
    display: flex;
    align-items: flex-start;
    gap: var(--space-4);
    
    .feature-highlight-card__icon {
      margin-bottom: 0;
      flex-shrink: 0;
    }
  }
  
  &--compact {
    padding: var(--space-4);
    margin: var(--space-4) 0;
    
    .feature-highlight-card__title {
      font-size: var(--text-lg);
      margin-bottom: var(--space-2);
    }
    
    .feature-highlight-card__description {
      margin-bottom: var(--space-3);
    }
  }
}

// Responsive design
@media (max-width: 768px) {
  .feature-highlight-card {
    &--horizontal {
      flex-direction: column;
      
      .feature-highlight-card__icon {
        margin-bottom: var(--space-3);
      }
    }
  }
}

// Dark mode support (if implemented)
@media (prefers-color-scheme: dark) {
  .feature-highlight-card {
    background-color: var(--neutral-800);
    
    &__title {
      color: var(--neutral-100);
    }
    
    &__description {
      color: var(--neutral-300);
    }
    
    &--minimal {
      border-color: var(--neutral-700);
      
      &:hover {
        border-color: var(--primary-600);
      }
    }
  }
}
```

### Step 3: Update CSS Imports

**File: `assets/css/components/cards/_index.scss`**

```scss
// Card Components Index
// Import all card component styles

@import "brand-card";
@import "founder-card";
@import "insight-card";
@import "hero-brand-card";
@import "featured-brand-card";
@import "featured-founder-card";
@import "featured-insight-card";
@import "founder-quote-card";
@import "related-brand-card";
@import "simple-insight-card";
@import "tagged-insight-card";
@import "team-member-card";
@import "testimonial-card";
@import "author-card";
@import "dimension-card";
@import "entry-card";
@import "feature-highlight-card";  // ADD THIS LINE
```

### Step 4: Add Component Defaults Configuration

**File: `_data/component_defaults.yml`** (Add to cards section)

```yaml
  # Feature Highlight Card
  feature-highlight-card:
    style: "default"
    layout: "vertical"
    show_icon: true
    show_cta: true
    icon_size: "large"
    cta_style: "primary"
```

### Step 5: Add Translation Keys

**File: `_data/translations/en.yml`**

```yaml
components:
  feature_highlight_card:
    default_cta: "Learn More"
    read_more: "Read More"
    get_started: "Get Started"
```

**File: `_data/translations/ru.yml`**

```yaml
components:
  feature_highlight_card:
    default_cta: "Узнать больше"
    read_more: "Читать далее"
    get_started: "Начать"
```

**File: `_data/translations/zh.yml`**

```yaml
components:
  feature_highlight_card:
    default_cta: "了解更多"
    read_more: "阅读更多"
    get_started: "开始使用"
```

---

## 🧪 Testing & Validation

### Step 6: Build and Component Testing

```bash
# Start development server
bundle exec jekyll serve --livereload

# Test component rendering
# Create test page: pages/en/dev/component-test.md
```

**Test Page: `pages/en/dev/component-test.md`**

```yaml
---
layout: simple
title: "Feature Highlight Card Testing"
permalink: /en/dev/component-test/
---

# Feature Highlight Card Testing

## Default Style
{% include components/cards/feature-highlight-card.html 
   title="Default Card" 
   content="This is the default styling and behavior." 
   icon="star" 
   cta_text="Learn More" 
   cta_url="#" %}

## Featured Style
{% include components/cards/feature-highlight-card.html 
   title="Featured Card" 
   content="This card uses the featured styling variant." 
   icon="trophy" 
   style="featured" 
   cta_text="Get Started" 
   cta_url="#" %}

## Horizontal Layout
{% include components/cards/feature-highlight-card.html 
   title="Horizontal Layout" 
   content="Side-by-side icon and content layout." 
   icon="globe" 
   layout="horizontal" 
   cta_text="Explore" 
   cta_url="#" %}

## Minimal Style
{% include components/cards/feature-highlight-card.html 
   title="Minimal Card" 
   content="Reduced visual emphasis for subtle integration." 
   style="minimal" 
   cta_text="View Details" 
   cta_url="#" %}

## No Icon, No CTA
{% include components/cards/feature-highlight-card.html 
   title="Content Only" 
   content="Just title and content, no additional elements." 
   show_icon=false 
   show_cta=false %}
```

### Step 7: Validation Checklist

**Architecture Compliance**
- [ ] Uses `helpers/component-defaults.html` for all configurable parameters
- [ ] No hard-coded default values in component code
- [ ] Follows BEM CSS naming conventions
- [ ] Uses design tokens for all spacing, colors, typography
- [ ] Includes comprehensive component documentation

**Functionality Testing**
- [ ] All parameter combinations work correctly
- [ ] Default behavior loads from `_data/component_defaults.yml`
- [ ] Override parameters function properly
- [ ] Translation helpers work in all languages
- [ ] Responsive design functions on mobile devices

**Integration Testing**
- [ ] Component works within existing page sections
- [ ] CSS imports correctly without conflicts
- [ ] Build process completes without errors
- [ ] Component appears in style guide if applicable

**Multilingual Verification**
- [ ] Translation keys exist in all language files (EN/RU/ZH)
- [ ] Component renders correctly in all languages
- [ ] Text content respects language-specific typography
- [ ] RTL languages supported if applicable

### Step 8: Performance Validation

```bash
# Run build with performance monitoring
time JEKYLL_ENV=production bundle exec jekyll build

# Check CSS file size impact
ls -la _site/assets/css/

# Validate CSS syntax
stylelint assets/css/components/cards/feature-highlight-card.scss

# Run full validation suite
_scripts/core/pre-commit_check.sh
```

---

## 📋 Quality Standards Checklist

### Code Quality
- [ ] **BEM methodology**: Block__element--modifier naming
- [ ] **Design tokens**: No hard-coded values
- [ ] **Semantic HTML**: Proper element usage and ARIA attributes
- [ ] **Performance**: Minimal CSS specificity, efficient selectors
- [ ] **Documentation**: Comprehensive component comments

### Architecture Compliance
- [ ] **Centralized configuration**: All defaults in YAML
- [ ] **Parameter hierarchy**: Include → defaults → fallback
- [ ] **Translation support**: All user-facing text translatable
- [ ] **Error handling**: Graceful degradation for missing parameters
- [ ] **Consistent patterns**: Matches existing component structure

### Integration Standards
- [ ] **Page sections**: Works with `helpers/page-sections.html`
- [ ] **Panel wrapper**: Compatible with panel system
- [ ] **Mobile-first**: Responsive design principles
- [ ] **Accessibility**: WCAG 2.1 AA compliance
- [ ] **Cross-browser**: Works in all supported browsers

---

## 🚀 Advanced Implementation Patterns

### Dynamic Parameter Loading

```liquid
{% comment %} Advanced: Load parameters from page or site data {% endcomment %}
{% if page.component_config.feature_highlight_card %}
  {% assign config = page.component_config.feature_highlight_card %}
{% elsif site.data.page_defaults[page.layout].components.feature_highlight_card %}
  {% assign config = site.data.page_defaults[page.layout].components.feature_highlight_card %}
{% endif %}

{% if config %}
  {% assign style = include.style | default: config.style %}
  {% assign layout = include.layout | default: config.layout %}
{% endif %}
```

### Conditional Content Rendering

```liquid
{% comment %} Content-aware rendering {% endcomment %}
{% if include.content contains "**" %}
  {% comment %} Render markdown content {% endcomment %}
  <div class="feature-highlight-card__description">
    {{ include.content | markdownify }}
  </div>
{% else %}
  {% comment %} Render plain text content {% endcomment %}
  <div class="feature-highlight-card__description">
    {{ include.content }}
  </div>
{% endif %}
```

### Schema Integration

```liquid
{% comment %} JSON-LD structured data {% endcomment %}
{% if include.schema %}
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "{{ include.schema.type | default: 'Thing' }}",
  "name": "{{ title }}",
  "description": "{{ content | strip_html | truncate: 160 }}"
}
</script>
{% endif %}
```

---

## 📚 Reference Examples

### Founder Quote Card Implementation

Our founder quote card provides the perfect reference for this workflow:

**Component Structure**: `_includes/components/cards/founder-quote-card.html`
- Centralized defaults integration ✅
- BEM CSS methodology ✅  
- Comprehensive documentation ✅
- Multiple style variants ✅

**CSS Implementation**: `assets/css/components/cards/founder-quote-card.scss`
- Design token usage ✅
- Responsive design ✅
- Style modifiers ✅
- Dark mode support ✅

**Configuration**: `_data/component_defaults.yml`
```yaml
founder-quote-card:
  style: "inline"
  show_context: true
  show_attribution: true
  show_type_badge: true
```

### Other Reference Components

**Simple Components**: `testimonial-card.html`, `team-member-card.html`
**Complex Components**: `brand-card.html`, `hero-brand-card.html`
**Form Components**: `newsletter-form.html`, `contact-form.html`

---

## 🔧 Troubleshooting Guide

### Common Issues

| Problem | Symptom | Solution |
|---------|---------|----------|
| Component not rendering | Blank space where component should appear | Check file path and syntax |
| Default values not working | Hard-coded fallbacks always used | Verify `_data/component_defaults.yml` path |
| CSS not loading | Unstyled component appearance | Check `_index.scss` import |
| Build errors | Jekyll fails to compile | Validate liquid syntax and YAML |
| Responsive issues | Layout breaks on mobile | Test CSS media queries |

### Debug Commands

```bash
# Check component file exists
ls _includes/components/cards/feature-highlight-card.html

# Verify CSS import
grep "feature-highlight-card" assets/css/components/cards/_index.scss

# Test YAML syntax
_scripts/validation/validate_yaml.sh

# Check liquid syntax
bundle exec jekyll build --verbose

# Validate component defaults
python3 -c "import yaml; print(yaml.safe_load(open('_data/component_defaults.yml')))"
```

### Performance Issues

```bash
# Measure build time impact
time bundle exec jekyll build

# Check CSS file size
du -h _site/assets/css/main.css

# Analyze component usage
grep -r "feature-highlight-card" _includes/ _layouts/
```

---

## 📈 Success Metrics

### Architecture Compliance Score

- **100%**: Full centralized configuration, no hard-coded values
- **90-99%**: Minor hard-coded fallbacks, mostly compliant
- **80-89%**: Some centralized config, needs improvement
- **<80%**: Significant architecture violations, requires refactoring

### Quality Indicators

✅ **Excellent**
- BEM naming throughout
- Design tokens for all values
- Comprehensive documentation
- Full multilingual support
- Responsive design

⚠️ **Needs Improvement**
- Inconsistent naming
- Some hard-coded values
- Minimal documentation
- Limited language support

❌ **Architecture Violations**
- No centralized configuration
- Hard-coded styles and behavior
- No documentation
- Single language only

---

## 📖 Additional Resources

### Documentation Files
- **Architecture guide**: `_docs/architecture.md`
- **Technical reference**: `_docs/technical-reference.md`
- **Daily workflows**: `_docs/daily-workflows.md`
- **Component patterns**: `_docs/component-patterns.md`

### Example Components
- **Card components**: `_includes/components/cards/`
- **Form components**: `_includes/components/forms/`
- **Navigation components**: `_includes/components/navigation/`

### Configuration Files
- **Component defaults**: `_data/component_defaults.yml`
- **Page sections**: `_data/page_sections.yml`
- **Translations**: `_data/translations/{lang}.yml`

### Scripts and Tools
- **Image processing**: `_scripts/core/process_images.sh`
- **Validation suite**: `_scripts/core/pre-commit_check.sh`
- **JSON generation**: `_scripts/core/generate-all-json.py`

This workflow template ensures consistent, high-quality component development that maintains Brandmine's architecture standards and delivers reliable, maintainable code across all languages and device types.