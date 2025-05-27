# Breadcrumbs-Hero Seamless Connection Method

## Overview
Method for removing whitespace between breadcrumbs and hero panel sections to create a seamless visual connection. Used in `insights.html` and `insight-category.html` layouts.

## Three-Part Implementation

### 1. Breadcrumbs Outside Panel System
Breadcrumbs are handled as a separate section outside the main panel wrapper:

```html
<!-- Handle breadcrumbs separately outside panel system -->
{% if sections_to_render contains "breadcrumbs" %}
  <section class="insights-section--breadcrumbs">
    {% include pages/insights/breadcrumbs.html %}
  </section>
{% endif %}

<!-- All other sections use panel system -->
<div class="panel panel--light">
  <div class="panel__content">
    {% for section in sections_to_render %}
      {% unless section == "breadcrumbs" %}
        <!-- Other sections here -->
      {% endunless %}
    {% endfor %}
  </div>
</div>
```

### 2. Breadcrumbs CSS Styling
Full-width breadcrumbs section with teal background, centered content wrapper, and styled links:

```scss
.insights-section--breadcrumbs {
  margin: 0;
  margin-left: calc(-50vw + 50%);     // Full width effect
  margin-right: calc(-50vw + 50%);
  padding: 8px 0;                     // Minimal padding
  background-color: var(--primary-50); // Light teal
  border-bottom: none;                // KEY: Remove bottom border
  
  .insights-breadcrumbs-wrapper {
    max-width: 1200px;               // Centered content container
    margin: 0 auto;
    padding: 0 16px;
  }
  
  .insights-breadcrumbs {
    .back-link {
      display: inline-flex;
      align-items: center;
      gap: var(--space-1);
      color: var(--primary-600);      // Teal link color
      text-decoration: none;
      font-size: var(--text-sm);
      font-weight: var(--font-medium);
      transition: color 0.2s ease;
      
      &:hover {
        color: var(--primary-700);    // Darker teal on hover
        text-decoration: underline;
      }
    }
  }
}
```

### 3. Hero Section CSS Adjustments
Remove all top spacing from hero section to connect with breadcrumbs:

```scss
.insights-section--hero {
  margin-top: 0;           // Remove top margin
  border-top: none;        // Remove top border
  
  .panel {
    border: none;
    border-top: none;
    margin-top: 0;
    padding-top: var(--space-16); // Maintain internal padding
  }
}

// Remove top padding from main panel wrapper (use child selector for specificity)
> .panel--light {
  padding-top: 0;
}
```

## Key Principle
**Breadcrumbs as Separate Full-Width Section**: Breadcrumbs are treated as an independent full-width element that visually "connects" to the hero by removing all borders/margins between them. The hero section removes its top spacing to create one seamless visual block from teal breadcrumbs into the hero content.

## Files Using This Pattern
- `_layouts/insights.html`
- `_layouts/insight-category.html`
- `assets/css/pages/insights/breadcrumbs.scss`
- `assets/css/pages/insights-category/breadcrumbs.scss`

## Visual Result
Creates a seamless transition from the light teal breadcrumbs bar directly into the hero section content with no visual gap or border separation.