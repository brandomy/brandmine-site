---
layout: styleguide
title: Spacing System
description: Brandmine's spacing system ensures consistent rhythm and proportion throughout the interface.
permalink: /en/styleguide/foundations/spacing/
lang: en
ref: styleguide-foundations-spacing
---

## Spacing Overview

Our spacing system uses a consistent scale based on 4px increments, providing harmony and rhythm across the interface. These standardized spacing values help maintain proportional relationships between elements and create a cohesive visual language.

## Spacing Scale

Our spacing scale follows a progression that provides appropriate options for different contexts, from tight component spacing to generous page sections.

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: center;">
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-1); width: var(--space-1);"></div>
      </div>
      <div><code>--space-1</code> (0.25rem / 4px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-2); width: var(--space-2);"></div>
      </div>
      <div><code>--space-2</code> (0.5rem / 8px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-3); width: var(--space-3);"></div>
      </div>
      <div><code>--space-3</code> (0.75rem / 12px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-4); width: var(--space-4);"></div>
      </div>
      <div><code>--space-4</code> (1rem / 16px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-6); width: var(--space-6);"></div>
      </div>
      <div><code>--space-6</code> (1.5rem / 24px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-8); width: var(--space-8);"></div>
      </div>
      <div><code>--space-8</code> (2rem / 32px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-10); width: var(--space-10);"></div>
      </div>
      <div><code>--space-10</code> (2.5rem / 40px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-12); width: var(--space-12);"></div>
      </div>
      <div><code>--space-12</code> (3rem / 48px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-16); width: var(--space-16);"></div>
      </div>
      <div><code>--space-16</code> (4rem / 64px)</div>
      
      <div>
        <div style="background-color: var(--primary-200); height: var(--space-20); width: var(--space-20);"></div>
      </div>
      <div><code>--space-20</code> (5rem / 80px)</div>
    </div>
  </div>
</div>

## Spacing Applications

### Margin and Padding

Spacing variables can be used for both margin and padding properties:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="border: 1px solid var(--neutral-300); border-radius: 4px; overflow: hidden; margin-bottom: var(--space-4);">
      <div class="element-with-standard-padding" style="padding: var(--space-4); background-color: var(--primary-100);">
        Element with standard padding (var(--space-4))
      </div>
    </div>
    <div style="border: 1px solid var(--neutral-300); border-radius: 4px; overflow: hidden;">
      <div class="element-with-larger-padding" style="padding: var(--space-8); background-color: var(--primary-100);">
        Element with larger padding (var(--space-8))
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.element-with-standard-padding {
  padding: var(--space-4); /* 1rem / 16px */
}

.element-with-larger-padding {
  padding: var(--space-8); /* 2rem / 32px */
}</code></pre>
  </div>
</div>

### Element Spacing

Create consistent spacing between elements using margin:

<div class="example-wrapper">
  <div class="example-preview">
    <div class="element-stack" style="display: flex; flex-direction: column; gap: var(--space-4);">
      <div style="padding: var(--space-3); background-color: var(--primary-100); border-radius: 4px;">First element</div>
      <div style="padding: var(--space-3); background-color: var(--primary-100); border-radius: 4px;">Second element</div>
      <div style="padding: var(--space-3); background-color: var(--primary-100); border-radius: 4px;">Third element</div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.element-stack {
  display: flex;
  flex-direction: column;
  gap: var(--space-4); /* Modern gap property */
}

/* Alternative using margin for wider browser support */
.element-stack > * + * {
  margin-top: var(--space-4);
}</code></pre>
  </div>
</div>

### Section Spacing

For larger layout sections, use the bigger spacing values:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="border: 1px dashed var(--neutral-400); margin-bottom: var(--space-8);">
      <div class="section" style="padding: var(--space-12); background-color: var(--primary-100); text-align: center;">
        Standard Section (var(--space-12) padding)
      </div>
    </div>
    <div style="border: 1px dashed var(--neutral-400);">
      <div class="hero-section" style="padding: var(--space-16); background-color: var(--primary-200); text-align: center;">
        Hero Section (var(--space-16) padding)
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.section {
  padding: var(--space-12); /* 3rem / 48px */
  margin-bottom: var(--space-12);
}

.hero-section {
  padding: var(--space-16); /* 4rem / 64px */
}</code></pre>
  </div>
</div>

## Common Spacing Patterns

### Card Component

<div class="example-wrapper">
  <div class="example-preview">
    <div class="card" style="border: 1px solid var(--neutral-300); border-radius: 0.5rem; overflow: hidden; max-width: 300px;">
      <div class="card-image" style="height: 160px; background-color: var(--primary-400);"></div>
      <div class="card-content" style="padding: var(--space-4);">
        <h3 class="card-title" style="margin-top: 0; margin-bottom: var(--space-2);">Card Title</h3>
        <p class="card-description" style="margin-top: 0; margin-bottom: var(--space-4);">This is a sample card description with proper spacing applied.</p>
        <button style="background-color: var(--primary-500); color: white; border: none; padding: var(--space-2) var(--space-4); border-radius: 4px;">Action</button>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.card {
  border: 1px solid var(--neutral-300);
  border-radius: 0.5rem;
  overflow: hidden;
}

.card-image {
  height: 160px;
}

.card-content {
  padding: var(--space-4);
}

.card-title {
  margin-top: 0;
  margin-bottom: var(--space-2);
}

.card-description {
  margin-top: 0;
  margin-bottom: var(--space-4);
}</code></pre>
  </div>
</div>

### Form Elements

<div class="example-wrapper">
  <div class="example-preview">
    <div style="max-width: 400px;">
      <div class="form-group" style="margin-bottom: var(--space-4);">
        <label class="form-label" style="display: block; margin-bottom: var(--space-2); font-weight: 600;">Name</label>
        <input type="text" class="form-input" style="width: 100%; padding: var(--space-2); border: 1px solid var(--neutral-300); border-radius: 0.25rem;" placeholder="Enter your name">
      </div>
      
      <div class="form-group spaced" style="margin-bottom: var(--space-6);">
        <label class="form-label" style="display: block; margin-bottom: var(--space-2); font-weight: 600;">Message</label>
        <textarea class="form-textarea" style="width: 100%; padding: var(--space-2); border: 1px solid var(--neutral-300); border-radius: 0.25rem;" rows="3" placeholder="Enter your message"></textarea>
      </div>
      
      <button style="background-color: var(--primary-500); color: white; border: none; padding: var(--space-2) var(--space-4); border-radius: 4px;">Submit</button>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.form-group {
  margin-bottom: var(--space-4);
}

.form-group.spaced {
  margin-bottom: var(--space-6);
}

.form-label {
  display: block;
  margin-bottom: var(--space-2);
  font-weight: 600;
}

.form-input,
.form-textarea {
  width: 100%;
  padding: var(--space-2);
  border: 1px solid var(--neutral-300);
  border-radius: 0.25rem;
}</code></pre>
  </div>
</div>

## Implementation Guidelines

### Using CSS Variables

Always use the spacing variables instead of hardcoding pixel or rem values:

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">/* Preferred approach */
.element {
  padding: var(--space-4);
  margin-bottom: var(--space-6);
}

/* Avoid this approach */
.element {
  padding: 16px;
  margin-bottom: 24px;
}</code></pre>
  </div>
</div>

### Responsive Adjustments

You can adjust spacing based on screen size:

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.section {
  padding: var(--space-4);
}

@media (min-width: 768px) {
  .section {
    padding: var(--space-8);
  }
}

@media (min-width: 1024px) {
  .section {
    padding: var(--space-12);
  }
}</code></pre>
  </div>
</div>

### Combining Spacing Variables

For more precise control, you can combine different spacing values for each side:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: flex; flex-direction: column; gap: var(--space-4);">
      <div style="background-color: var(--primary-100); padding: var(--space-4) var(--space-6); border-radius: 4px;">
        Asymmetric padding: var(--space-4) vertical, var(--space-6) horizontal
      </div>
      <div style="background-color: var(--primary-100); padding: var(--space-4) var(--space-6) var(--space-8) var(--space-2); border-radius: 4px;">
        Complex padding: var(--space-4) top, var(--space-6) right, var(--space-8) bottom, var(--space-2) left
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.asymmetric-element {
  padding: var(--space-4) var(--space-6);  /* Vertical | Horizontal */
}

.complex-element {
  padding: var(--space-4) var(--space-6) var(--space-8) var(--space-2);  /* Top | Right | Bottom | Left */
}</code></pre>
  </div>
</div>

## Best Practices

1. **Be consistent** - Use the spacing scale consistently rather than arbitrary values
2. **Follow the scale** - Avoid creating custom spacing that falls outside the defined scale
3. **Consider content density** - Use smaller spacing values for dense UIs, larger ones for more open layouts
4. **Create rhythm** - Maintain consistent vertical rhythm with predictable spacing between sections
5. **Use appropriate scale** - Match spacing to the visual weight and importance of elements