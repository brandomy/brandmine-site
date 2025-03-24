---
layout: styleguide
title: Buttons
description: Standard button components for user interactions across Brandmine
permalink: /en/styleguide/components/buttons/
lang: en
---

## Buttons Overview

Our button system provides consistent, accessible interaction elements across the Brandmine platform. We use a limited set of button styles to maintain visual consistency while clearly communicating the hierarchy of actions to users.

## Button Types

### Primary Button

Primary buttons are used for the main action in a section or form. They use our primary teal color to draw attention and establish visual hierarchy.

<div class="example">
  <div class="example-preview">
    <a href="#" class="btn-primary">Primary Button</a>
  </div>
  
  <div class="example-code">
```html
<a href="#" class="btn-primary">Primary Button</a>
```
  </div>
</div>

### Secondary Button

Secondary buttons are used for alternative actions that are important but not the primary focus. They use our secondary orange color.

<div class="example">
  <div class="example-preview">
    <a href="#" class="btn-secondary">Secondary Button</a>
  </div>
  
  <div class="example-code">
```html
<a href="#" class="btn-secondary">Secondary Button</a>
```
  </div>
</div>

### CTA Button

Call-to-action buttons are used for high-emphasis actions, typically in hero sections or promotional areas. They use a white background with our primary color for text.

<div class="example">
  <div class="example-preview" style="background: linear-gradient(to right, var(--primary-500), var(--primary-700)); padding: 2rem;">
    <a href="#" class="cta-button">Call to Action</a>
  </div>
  
  <div class="example-code">
```html
<a href="#" class="cta-button">Call to Action</a>
```
  </div>
</div>

## Button States

### Hover States

All buttons include hover effects to provide visual feedback to users.

<div class="example">
  <div class="example-preview">
    <p><strong>Hover over the buttons to see their hover states:</strong></p>
    <a href="#" class="btn-primary" style="margin-right: 1rem;">Primary Button</a>
    <a href="#" class="btn-secondary" style="margin-right: 1rem;">Secondary Button</a>
    <div style="background: linear-gradient(to right, var(--primary-500), var(--primary-700)); padding: 1rem; display: inline-block; margin-top: 1rem;">
      <a href="#" class="cta-button">Call to Action</a>
    </div>
  </div>
</div>

## Button Sizes

Our buttons maintain a consistent size for most use cases, with slight adjustments for mobile devices.

<div class="example">
  <div class="example-preview">
    <p><strong>Desktop sizing:</strong></p>
    <a href="#" class="btn-primary">Primary Button</a>
  </div>
</div>

## Implementation Guidelines

### Usage Recommendations

1. **Use primary buttons** for the main action on a page or in a section
2. **Use secondary buttons** for alternative actions or options
3. **Use CTA buttons** in hero panels, feature highlights, or promotional sections
4. **Maintain hierarchy** by using only one primary button per section
5. **Use clear, concise text** that describes the action (e.g., "Learn More" instead of "Click Here")

### Accessibility Considerations

1. Ensure sufficient color contrast (our buttons meet WCAG AA standards)
2. Use appropriate semantic elements (`<button>` for actions, `<a>` for navigation)
3. Include hover and focus states for keyboard navigation
4. Keep button text clear and actionable

### Code Implementation

Button styles are defined in `assets/css/components/buttons.css` and use CSS variables for consistent colors and spacing.

#### HTML Structure

```html
<!-- Primary button -->
<a href="#" class="btn-primary">Button Text</a>

<!-- Secondary button -->
<a href="#" class="btn-secondary">Button Text</a>

<!-- CTA button -->
<a href="#" class="cta-button">Button Text</a>
```

#### Using Buttons in Forms

For form submission or JavaScript-triggered actions, use the `<button>` element:

```html
<button type="submit" class="btn-primary">Submit</button>
```