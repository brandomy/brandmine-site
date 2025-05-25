---
layout: styleguide
title: Layout System
description: Brandmine's layout system provides flexible, responsive structures for organizing content.
permalink: /en/styleguide/foundations/layouts/
lang: en
ref: styleguide-foundations-layouts
---

## Layout Overview

Our layout system uses a flexible grid and consistent panel structures to organize content clearly and consistently. This approach ensures proper content hierarchy, responsive behavior, and a cohesive user experience across the site.

## Grid System

Our grid system provides a foundation for creating consistent, responsive layouts throughout the site.

### Basic Grid Layout

The grid uses a 12-column system that adapts to different screen sizes, with a standard gap between columns.

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: repeat(12, 1fr); gap: 0.5rem; width: 100%;">
      <div style="grid-column: span 12; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">Full width</div>
      
      <div style="grid-column: span 6; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">Half width</div>
      <div style="grid-column: span 6; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">Half width</div>
      
      <div style="grid-column: span 4; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">One third</div>
      <div style="grid-column: span 4; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">One third</div>
      <div style="grid-column: span 4; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">One third</div>
      
      <div style="grid-column: span 3; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">One quarter</div>
      <div style="grid-column: span 3; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">One quarter</div>
      <div style="grid-column: span 3; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">One quarter</div>
      <div style="grid-column: span 3; background-color: var(--primary-100); padding: 0.5rem; border-radius: 0.25rem;">One quarter</div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="grid-container grid-container--12"&gt;
  &lt;div class="col-span-12"&gt;Full width&lt;/div&gt;
  &lt;div class="col-span-6"&gt;Half width&lt;/div&gt;
  &lt;div class="col-span-6"&gt;Half width&lt;/div&gt;
  &lt;div class="col-span-4"&gt;One third&lt;/div&gt;
  &lt;div class="col-span-4"&gt;One third&lt;/div&gt;
  &lt;div class="col-span-4"&gt;One third&lt;/div&gt;
  &lt;div class="col-span-3"&gt;One quarter&lt;/div&gt;
  &lt;div class="col-span-3"&gt;One quarter&lt;/div&gt;
  &lt;div class="col-span-3"&gt;One quarter&lt;/div&gt;
  &lt;div class="col-span-3"&gt;One quarter&lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

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

<div class="example-wrapper">
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
        <div style="color: var(--neutral-500); font-size: 0.75rem;">1200px+</div>
      </div>
      
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); height: 200px; width: 200px; margin-bottom: var(--space-2); display: flex; flex-direction: column;">
          <div style="background-color: var(--neutral-200); padding: var(--space-2); margin-bottom: var(--space-2);">Header</div>
          <div style="display: flex; flex-grow: 1; gap: var(--space-2);">
            <div style="background-color: var(--primary-100); width: 50%; padding: var(--space-2); font-size: 0.75rem;">Content</div>
            <div style="background-color: var(--secondary-100); width: 50%; padding: var(--space-2); font-size: 0.75rem;">Image</div>
          </div>
        </div>
        <div>Tablet Layout</div>
        <div style="color: var(--neutral-500); font-size: 0.75rem;">768px - 992px</div>
      </div>
      
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); height: 200px; width: 120px; margin-bottom: var(--space-2); display: flex; flex-direction: column;">
          <div style="background-color: var(--neutral-200); padding: var(--space-2); margin-bottom: var(--space-2);">Header</div>
          <div style="display: flex; flex-direction: column; flex-grow: 1; gap: var(--space-2);">
            <div style="background-color: var(--primary-100); height: 40%; padding: var(--space-2); font-size: 0.75rem;">Content</div>
            <div style="background-color: var(--secondary-100); height: 60%; padding: var(--space-2); font-size: 0.75rem;">Image</div>
          </div>
        </div>
        <div>Mobile Layout</div>
        <div style="color: var(--neutral-500); font-size: 0.75rem;">< 768px</div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">/* Responsive breakpoints */
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
}</code></pre>
  </div>
</div>

## Panel Layouts

Panels are our primary layout components, providing consistent full-width sections that help organize content and create visual rhythm throughout the site.

### Full-Width Panel

The full-width panel extends edge-to-edge across the viewport, with content constrained to a maximum width and centered within the panel.

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel light-panel" style="background-color: var(--neutral-50); padding: 2rem; border: 1px solid var(--neutral-200);">
      <div class="panel-content" style="max-width: 800px; margin: 0 auto;">
        <h2 style="text-align: center; color: var(--neutral-700); margin-bottom: 1rem;">Section Heading</h2>
        <p style="color: var(--neutral-600);">Section content goes here...</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel light-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;!-- Your content here --&gt;
    &lt;h2&gt;Section Heading&lt;/h2&gt;
    &lt;p&gt;Section content goes here...&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

### Panel with Image Layout

The panel with image layout creates a two-column grid that places content alongside an image, adjusting to a single column on smaller screens.

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel light-panel" style="background-color: var(--neutral-50); padding: 2rem; border: 1px solid var(--neutral-200);">
      <div class="panel-content" style="max-width: 800px; margin: 0 auto;">
        <div class="panel-with-image" style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
          <div class="content-area">
            <h2 style="color: var(--secondary-600);">Section Heading</h2>
            <p style="color: var(--neutral-600);">Content description goes here...</p>
            <a href="#" class="btn-primary" style="display: inline-block; background-color: var(--primary-500); color: white; padding: 0.5rem 1rem; border-radius: 0.25rem; text-decoration: none; margin-top: 1rem;">Call to Action</a>
          </div>
          <div class="image-area" style="background-color: var(--neutral-200); display: flex; align-items: center; justify-content: center; min-height: 200px; border-radius: 0.25rem;">
            <span style="color: var(--neutral-500);">Image Placeholder</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel light-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;div class="panel-with-image"&gt;
      &lt;div class="content-area"&gt;
        &lt;h2&gt;Section Heading&lt;/h2&gt;
        &lt;p&gt;Content description goes here...&lt;/p&gt;
        &lt;a href="#" class="btn-primary"&gt;Call to Action&lt;/a&gt;
      &lt;/div&gt;
      &lt;div class="image-area"&gt;
        &lt;img src="/path/to/image.jpg" alt="Description" class="panel-image"&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Panel Variants

Our panel system includes several variants for different content purposes and visual emphasis.

### Light Panel

The default panel style with a white background, suitable for most content sections.

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel light-panel" style="background-color: var(--neutral-50); padding: 2rem; border: 1px solid var(--neutral-200);">
      <div class="panel-content" style="max-width: 800px; margin: 0 auto;">
        <h2 style="text-align: center; color: var(--neutral-700); margin-bottom: 1rem;">Section Title</h2>
        <p style="color: var(--neutral-600);">Panel content goes here...</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel light-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Section Title&lt;/h2&gt;
    &lt;p&gt;Panel content goes here...&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

### Problem Panel

Used for sections that identify challenges or pain points, with a subtle orange pattern background.

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel problem-panel" style="background-color: var(--secondary-50); padding: 2rem; border: 1px solid var(--secondary-200);">
      <div class="panel-content" style="max-width: 800px; margin: 0 auto;">
        <h2 style="text-align: center; color: var(--secondary-700); margin-bottom: 1rem;">The Challenge</h2>
        <p style="color: var(--secondary-800);">Description of the problems being addressed...</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel problem-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;The Challenge&lt;/h2&gt;
    &lt;p&gt;Description of the problems being addressed...&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

### Solution Panel

Highlights solutions or benefits with a subtle teal pattern background.

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel solution-panel" style="background-color: var(--primary-50); padding: 2rem; border: 1px solid var(--primary-200);">
      <div class="panel-content" style="max-width: 800px; margin: 0 auto;">
        <h2 style="text-align: center; color: var(--primary-700); margin-bottom: 1rem;">Our Solution</h2>
        <p style="color: var(--primary-800);">Description of the solutions provided...</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel solution-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Our Solution&lt;/h2&gt;
    &lt;p&gt;Description of the solutions provided...&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

### Perspective Panel

Used for insights or analysis sections with a subtle indigo pattern background.

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel perspective-panel" style="background-color: var(--accent-50); padding: 2rem; border: 1px solid var(--accent-200);">
      <div class="panel-content" style="max-width: 800px; margin: 0 auto;">
        <h2 style="text-align: center; color: var(--accent-700); margin-bottom: 1rem;">Our Perspective</h2>
        <p style="color: var(--accent-800);">Analysis and insights go here...</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel perspective-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Our Perspective&lt;/h2&gt;
    &lt;p&gt;Analysis and insights go here...&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

### Call-to-Action Panel

High-emphasis section with a gradient background for prompting user action.

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel cta-panel" style="background: linear-gradient(135deg, var(--primary-500), var(--primary-700)); padding: 3rem 2rem; color: white;">
      <div class="panel-content centered" style="max-width: 800px; margin: 0 auto; text-align: center;">
        <h2 style="color: white; margin-bottom: 1rem;">Ready to Get Started?</h2>
        <p class="lead-text" style="color: white; font-size: 1.125rem; margin-bottom: 1.5rem;">Join thousands of brands discovering new opportunities.</p>
        <a href="/signup/" class="cta-button" style="display: inline-block; background-color: white; color: var(--primary-700); padding: 0.75rem 1.5rem; border-radius: 0.25rem; text-decoration: none; font-weight: bold;">Start Now</a>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel cta-panel"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h2&gt;Ready to Get Started?&lt;/h2&gt;
    &lt;p class="lead-text"&gt;Join thousands of brands discovering new opportunities.&lt;/p&gt;
    &lt;a href="/signup/" class="cta-button"&gt;Start Now&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

### Text Panel

Optimized for content-heavy sections with a narrower content area for improved readability.

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel light-panel text-panel" style="background-color: var(--neutral-50); padding: 2rem; border: 1px solid var(--neutral-200);">
      <div class="panel-content" style="max-width: 650px; margin: 0 auto;">
        <h2 style="text-align: center; color: var(--neutral-700); margin-bottom: 1rem;">Article Title</h2>
        <p style="color: var(--neutral-700); line-height: 1.6; margin-bottom: 1rem;">Long-form content optimized for reading. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras at hendrerit nunc. Ut nec nunc vulputate, tempus velit in, aliquam nibh.</p>
        <p style="color: var(--neutral-700); line-height: 1.6;">Additional paragraphs with improved readability. Mauris eu turpis leo. Nulla facilisi. Sed vel tincidunt odio. Morbi a arcu sit amet sem convallis mollis.</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel light-panel text-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Article Title&lt;/h2&gt;
    &lt;p&gt;Long-form content optimized for reading...&lt;/p&gt;
    &lt;p&gt;Additional paragraphs with improved readability...&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Typography in Panels

Panel layouts include specific typography styles to maintain consistency across different sections.

### Headings

Panel headings are centered by default with appropriate spacing:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="padding: 1.5rem; background-color: var(--neutral-100); border-radius: 0.25rem;">
      <h2 style="font-size: 2.25rem; margin-bottom: 1.5rem; margin-top: 0; text-align: center; color: var(--neutral-700);">Panel Heading Example</h2>
      <p style="color: var(--neutral-600);">Content follows after appropriate spacing...</p>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.full-width-panel h2 {
  font-size: 2.25rem;
  margin-bottom: var(--space-6);  /* 1.5rem */
  margin-top: 0;
  text-align: center;
  color: inherit;
}</code></pre>
  </div>
</div>

### Lead Text

Emphasized introductory text with larger font size:

<div class="example-wrapper">
  <div class="example-preview">
    <div class="full-width-panel light-panel" style="background-color: var(--neutral-50); padding: 2rem; border: 1px solid var(--neutral-200);">
      <div class="panel-content" style="max-width: 800px; margin: 0 auto;">
        <h2 style="text-align: center; color: var(--neutral-700); margin-bottom: 1rem;">Section Title</h2>
        <p class="lead-text" style="font-size: 1.125rem; color: var(--neutral-600); margin-bottom: 1.5rem; text-align: center;">Introductory text that highlights key points...</p>
        <p style="color: var(--neutral-600);">Regular content follows...</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel light-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Section Title&lt;/h2&gt;
    &lt;p class="lead-text"&gt;Introductory text that highlights key points...&lt;/p&gt;
    &lt;p&gt;Regular content follows...&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

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
      <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); height: 200px; width: 240px; margin-bottom: var(--space-2); display: flex; flex-direction: column;">
        <div style="background-color: var(--neutral-200); padding: var(--space-2); margin-bottom: var(--space-2);">Header</div>
        <div style="display: flex; flex-grow: 1; gap: var(--space-2);">
          <div style="background-color: var(--primary-100); width: 50%; padding: var(--space-2);">Content</div>
          <div style="background-color: var(--secondary-100); width: 50%; padding: var(--space-2);">Image</div>
        </div>
      </div>
      <div>Desktop Layout</div>
      <div style="color: var(--neutral-500); font-size: 0.75rem;">1200px+</div>
    </div>
    
    <div>
      <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); height: 200px; width: 180px; margin-bottom: var(--space-2); display: flex; flex-direction: column;">
        <div style="background-color: var(--neutral-200); padding: var(--space-2); margin-bottom: var(--space-2);">Header</div>
        <div style="display: flex; flex-grow: 1; gap: var(--space-2);">
          <div style="background-color: var(--primary-100); width: 50%; padding: var(--space-2); font-size: 0.75rem;">Content</div>
          <div style="background-color: var(--secondary-100); width: 50%; padding: var(--space-2); font-size: 0.75rem;">Image</div>
        </div>
      </div>
      <div>Tablet Layout</div>
      <div style="color: var(--neutral-500); font-size: 0.75rem;">768px - 992px</div>
    </div>
    
    <div>
      <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); height: 200px; width: 120px; margin-bottom: var(--space-2); display: flex; flex-direction: column;">
        <div style="background-color: var(--neutral-200); padding: var(--space-2); margin-bottom: var(--space-2);">Header</div>
        <div style="display: flex; flex-direction: column; flex-grow: 1; gap: var(--space-2);">
          <div style="background-color: var(--primary-100); height: 40%; padding: var(--space-2); font-size: 0.75rem;">Content</div>
          <div style="background-color: var(--secondary-100); height: 60%; padding: var(--space-2); font-size: 0.75rem;">Image</div>
        </div>
      </div>
      <div>Mobile Layout</div>
      <div style="color: var(--neutral-500); font-size: 0.75rem;">< 768px</div>
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