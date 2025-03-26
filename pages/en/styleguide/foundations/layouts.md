---
layout: styleguide
title: Layout System
description: Brandmine's layout system provides flexible, responsive structures for organizing content.
permalink: /en/styleguide/foundations/layouts/
lang: en
---

## Layout Overview

Our layout system uses a flexible grid and consistent panel structures to organize content clearly and consistently. This approach ensures proper content hierarchy, responsive behavior, and a cohesive user experience across the site.

## Grid System

Our grid system provides a foundation for creating consistent, responsive layouts throughout the site.

### Basic Grid Layout

The grid uses a 12-column system that adapts to different screen sizes, with a standard gap between columns.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="grid-container grid-container--12">
  <div class="col-span-12">Full width</div>
  <div class="col-span-6">Half width</div>
  <div class="col-span-6">Half width</div>
  <div class="col-span-4">One third</div>
  <div class="col-span-4">One third</div>
  <div class="col-span-4">One third</div>
  <div class="col-span-3">One quarter</div>
  <div class="col-span-3">One quarter</div>
  <div class="col-span-3">One quarter</div>
  <div class="col-span-3">One quarter</div>
</div>' %}

### Column Span Utilities

Use these classes to control how many columns an element spans:

<div class="example-preview">
  <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: center;">
    <code>.col-span-1</code>
    <div>Element spans 1 column (1/12 width)</div>
    
    <code>.col-span-2</code>
    <div>Element spans 2 columns (1/6 width)</div>
    
    <code>.col-span-3</code>
    <div>Element spans 3 columns (1/4 width)</div>
    
    <code>.col-span-4</code>
    <div>Element spans 4 columns (1/3 width)</div>
    
    <code>.col-span-6</code>
    <div>Element spans 6 columns (1/2 width)</div>
    
    <code>.col-span-12</code>
    <div>Element spans 12 columns (full width)</div>
  </div>
</div>

### Responsive Behavior

The grid automatically adjusts to a single column layout on smaller screens (below 768px), ensuring content remains readable on mobile devices.

{% include styleguide/code-example.html language="css" preview=true
code='/* Responsive breakpoints */
@media screen and (max-width: 768px) {
    .grid-container--12 {
        grid-template-columns: 1fr;
    }
    
    .col-span-1,
    .col-span-2,
    .col-span-3,
    .col-span-4,
    .col-span-6 {
        grid-column: span 12; /* Full width on mobile */
    }
}' %}

## Panel Layouts

Panels are our primary layout components, providing consistent full-width sections that help organize content and create visual rhythm throughout the site.

### Full-Width Panel

The full-width panel extends edge-to-edge across the viewport, with content constrained to a maximum width and centered within the panel.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel light-panel">
  <div class="panel-content">
    <!-- Your content here -->
    <h2>Section Heading</h2>
    <p>Section content goes here...</p>
  </div>
</div>' %}

### Panel with Image Layout

The panel with image layout creates a two-column grid that places content alongside an image, adjusting to a single column on smaller screens.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel light-panel">
  <div class="panel-content">
    <div class="panel-with-image">
      <div class="content-area">
        <h2>Section Heading</h2>
        <p>Content description goes here...</p>
        <a href="#" class="btn-primary">Call to Action</a>
      </div>
      <div class="image-area">
        <img src="/path/to/image.jpg" alt="Description" class="panel-image">
      </div>
    </div>
  </div>
</div>' %}

## Panel Variants

Our panel system includes several variants for different content purposes and visual emphasis.

### Light Panel

The default panel style with a white background, suitable for most content sections.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h2>Section Title</h2>
    <p>Panel content goes here...</p>
  </div>
</div>' %}

### Problem Panel

Used for sections that identify challenges or pain points, with a subtle orange pattern background.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel problem-panel">
  <div class="panel-content">
    <h2>The Challenge</h2>
    <p>Description of the problems being addressed...</p>
  </div>
</div>' %}

### Solution Panel

Highlights solutions or benefits with a subtle teal pattern background.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel solution-panel">
  <div class="panel-content">
    <h2>Our Solution</h2>
    <p>Description of the solutions provided...</p>
  </div>
</div>' %}

### Perspective Panel

Used for insights or analysis sections with a subtle indigo pattern background.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel perspective-panel">
  <div class="panel-content">
    <h2>Our Perspective</h2>
    <p>Analysis and insights go here...</p>
  </div>
</div>' %}

### Call-to-Action Panel

High-emphasis section with a gradient background for prompting user action.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel cta-panel">
  <div class="panel-content centered">
    <h2>Ready to Get Started?</h2>
    <p class="lead-text">Join thousands of brands discovering new opportunities.</p>
    <a href="/signup/" class="cta-button">Start Now</a>
  </div>
</div>' %}

### Text Panel

Optimized for content-heavy sections with a narrower content area for improved readability.

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel light-panel text-panel">
  <div class="panel-content">
    <h2>Article Title</h2>
    <p>Long-form content optimized for reading...</p>
    <p>Additional paragraphs with improved readability...</p>
  </div>
</div>' %}

## Typography in Panels

Panel layouts include specific typography styles to maintain consistency across different sections.

### Headings

Panel headings are centered by default with appropriate spacing:

{% include styleguide/code-example.html language="css" preview=true
code='.full-width-panel h2 {
  font-size: 2.25rem;
  margin-bottom: var(--space-6);  /* 1.5rem */
  margin-top: 0;
  text-align: center;
  color: inherit;
}' %}

### Lead Text

Emphasized introductory text with larger font size:

{% include styleguide/code-example.html language="html" preview=true
code='<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h2>Section Title</h2>
    <p class="lead-text">Introductory text that highlights key points...</p>
    <p>Regular content follows...</p>
  </div>
</div>' %}

## Responsive Behavior

All layout components are fully responsive, adapting to different screen sizes:

### Desktop (1200px+)
- Full-width panels with content constrained to 1200px max-width
- Two-column grid for panels with images
- Standard typography sizing

### Tablet (768px - 992px)
- Reduced heading sizes
- Maintained two-column grid with less spacing
- Adjusted padding values

### Mobile (<768px)
- Single-column layout with stacked content
- Further reduced heading sizes
- Minimal horizontal padding
- Optimized vertical spacing

<div class="example-preview">
  <div style="display: flex; justify-content: space-between; gap: var(--space-4); text-align: center; font-size: 0.875rem;">
    <div>
      <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); height: 200px; width: 300px; margin-bottom: var(--space-2); display: flex; flex-direction: column;">
        <div style="background-color: var(--neutral-200); padding: var(--space-2); margin-bottom: var(--space-2);">Header</div>
        <div style="display: flex; flex-grow: 1; gap: var(--space-2);">
          <div style="background-color: var(--primary-100); width: 50%; padding: var(--space-2);">Content</div>
          <div style="background-color: var(--secondary-100); width: 50%; padding: var(--space-2);">Image</div>
        </div>
      </div>
      <div>Desktop Layout</div>
    </div>
    
    <div>
      <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); height: 200px; width: 150px; margin-bottom: var(--space-2); display: flex; flex-direction: column;">
        <div style="background-color: var(--neutral-200); padding: var(--space-2); margin-bottom: var(--space-2);">Header</div>
        <div style="display: flex; flex-direction: column; flex-grow: 1; gap: var(--space-2);">
          <div style="background-color: var(--primary-100); height: 50%; padding: var(--space-2);">Content</div>
          <div style="background-color: var(--secondary-100); height: 50%; padding: var(--space-2);">Image</div>
        </div>
      </div>
      <div>Mobile Layout</div>
    </div>
  </div>
</div>

## Implementation Guidelines

### Grid Usage

When implementing grid layouts:

1. **Container first**: Always start with a `.grid-container` element
2. **Define columns**: Add the `.grid-container--12` class for a 12-column grid
3. **Assign span**: Give each child element an appropriate `.col-span-*` class
4. **Remember responsiveness**: The grid automatically stacks on mobile devices
5. **Max-width**: The grid respects the `--grid-max-width` (1200px) for consistent layout

```html
<div class="grid-container grid-container--12">
  <div class="col-span-8">Main content (2/3 width)</div>
  <div class="col-span-4">Sidebar content (1/3 width)</div>
</div>
```

### Using Panel Layouts

The key to using panels effectively is selecting the appropriate panel type for your content:

1. **Light Panels**: Use for standard content sections
2. **Problem Panels**: Use when describing challenges or issues
3. **Solution Panels**: Use when presenting solutions or benefits
4. **Perspective Panels**: Use for analysis or insight sections
5. **CTA Panels**: Use for high-emphasis call-to-action sections
6. **Text Panels**: Use for content-heavy, text-focused sections

### Panel Structure

Always maintain the proper nesting structure for panels:

```html
<div class="full-width-panel [panel-variant]">
  <div class="panel-content">
    <!-- Panel content goes here -->
  </div>
</div>
```

### Best Practices

1. **Maintain visual rhythm**: Alternate panel styles to create visual interest
2. **Use appropriate spacing**: Follow the spacing guidelines within panels
3. **Respect content hierarchy**: Use headings and lead text appropriately
4. **Consider responsive behavior**: Test layouts across different screen sizes
5. **Use semantic markup**: Ensure proper heading levels and structure
6. **Optimize readability**: Use text panels for content-heavy sections
