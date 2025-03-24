---
layout: styleguide
title: Cards
description: Brandmine's card components provide consistent containers for various types of content.
permalink: /en/styleguide/components/cards/
lang: en
---

## Cards Overview

Our cards system provides flexible containers for content with consistent styling. Cards help organize information, create visual hierarchy, and maintain a cohesive look across the platform. We offer several card variations to accommodate different content needs and contexts.

## Basic Card

The standard card provides a subtle container with a light background, border, and shadow:

<div class="example">
  <div class="example-preview">
    <div class="card" style="background-color: var(--neutral-100); padding: var(--space-4); border-radius: 0.25rem; border: 1px solid var(--neutral-200); box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); max-width: 400px;">
      <h3 style="margin-top: 0;">Card Title</h3>
      <p>This is a basic card component with subtle styling. It works well for containing related content and creating visual separation from surrounding elements.</p>
      <a href="#" class="btn-primary">Action</a>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="card">
  <h3>Card Title</h3>
  <p>This is a basic card component with subtle styling. It works well for containing related content and creating visual separation from surrounding elements.</p>
  <a href="#" class="btn-primary">Action</a>
</div>
```
  </div>
</div>

## Content Card

Content cards have minimal styling with transparent backgrounds, making them flexible for various contexts:

<div class="example">
  <div class="example-preview">
    <div class="content-card" style="max-width: 500px;">
      <h3 style="margin-top: 0;">Content Card</h3>
      <p>Content cards use a transparent background with no shadow, making them perfect for content that should blend with the surrounding area while maintaining consistent spacing.</p>
      <p>They're often used for text-heavy sections where visual separation is less important than readability.</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="content-card">
  <h3>Content Card</h3>
  <p>Content cards use a transparent background with no shadow, making them perfect for content that should blend with the surrounding area while maintaining consistent spacing.</p>
  <p>They're often used for text-heavy sections where visual separation is less important than readability.</p>
</div>
```
  </div>
</div>

## White Content Card

White content cards provide higher contrast and more emphasis, especially on colored backgrounds:

<div class="example">
  <div class="example-preview">
    <div style="background-color: var(--primary-100); padding: var(--space-6); border-radius: 0.5rem;">
      <div class="white-content-card" style="background-color: white; border-radius: 0.5rem; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1); padding: var(--space-6);">
        <h3 style="margin-top: 0;">White Content Card</h3>
        <p>White content cards provide stronger visual contrast against colored backgrounds. They use deeper shadows and more padding to create a sense of elevation.</p>
        <p>These cards are perfect for featuring important content on colored panel backgrounds.</p>
      </div>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="full-width-panel solution-panel">
  <div class="panel-content">
    <div class="white-content-card">
      <h3>White Content Card</h3>
      <p>White content cards provide stronger visual contrast against colored backgrounds. They use deeper shadows and more padding to create a sense of elevation.</p>
      <p>These cards are perfect for featuring important content on colored panel backgrounds.</p>
    </div>
  </div>
</div>
```
  </div>
</div>

## Team Member Card

A specialized card variant for displaying team member profiles:

<div class="example">
  <div class="example-preview">
    <div class="team-member" style="flex: 1; min-width: 300px; background-color: white; border-radius: 0.5rem; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: var(--space-8); border: 1px solid var(--neutral-200); max-width: 300px;">
      <img src="/api/placeholder/180/180" alt="Team member" class="team-photo" style="width: 180px; height: 180px; border-radius: 50%; object-fit: cover; margin-bottom: var(--space-6); border: 3px solid var(--primary-400); display: block; margin-left: auto; margin-right: auto;">
      <h3 style="margin-top: 0; margin-bottom: var(--space-2); color: var(--neutral-800); text-align: center;">Jane Smith</h3>
      <p class="team-title" style="color: var(--primary-600); font-weight: 600; margin-top: 0; margin-bottom: var(--space-6); text-align: center;">Chief Marketing Officer</p>
      <ul style="margin-top: var(--space-4); margin-bottom: var(--space-6); padding-left: var(--space-6);">
        <li style="margin-bottom: var(--space-2);">Marketing strategy development</li>
        <li style="margin-bottom: var(--space-2);">Brand positioning</li>
        <li style="margin-bottom: var(--space-2);">International market expansion</li>
      </ul>
      <div class="team-member-linkedin" style="display: flex; justify-content: center; margin-top: var(--space-4); margin-bottom: var(--space-4);">
        <a href="#" style="color: var(--neutral-500); font-size: 1.5rem; text-decoration: none;">in</a>
      </div>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="team-member">
  <img src="/path/to/photo.jpg" alt="Jane Smith" class="team-photo">
  <h3>Jane Smith</h3>
  <p class="team-title">Chief Marketing Officer</p>
  <ul>
    <li>Marketing strategy development</li>
    <li>Brand positioning</li>
    <li>International market expansion</li>
  </ul>
  <div class="team-member-linkedin">
    <a href="https://linkedin.com/in/janesmith">
      <i class="fab fa-linkedin"></i>
    </a>
  </div>
</div>
```
  </div>
</div>

## Feature Card

Cards specifically designed for displaying features or benefits:

<div class="example">
  <div class="example-preview">
    <div class="feature-item" style="display: flex; flex-direction: column; text-align: center; align-items: center; max-width: 300px; margin: 0 auto;">
      <div class="feature-icon" style="background-color: white; color: var(--secondary-700); width: 4rem; height: 4rem; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto var(--space-4);">
        <span style="font-size: 1.5rem;">✨</span>
      </div>
      <h3 style="margin-top: var(--space-2); text-align: center; font-size: 1.25rem; margin-bottom: var(--space-2); color: var(--secondary-800);">Feature Title</h3>
      <p style="color: var(--secondary-700); font-size: 0.95rem; width: 100%; text-align: center; margin-left: auto; margin-right: auto;">This feature card highlights a key benefit or feature with an icon, title, and descriptive text.</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="feature-item">
  <div class="feature-icon">
    <svg><!-- Icon SVG --></svg>
  </div>
  <h3>Feature Title</h3>
  <p>This feature card highlights a key benefit or feature with an icon, title, and descriptive text.</p>
</div>
```
  </div>
</div>

## Solution Card

Cards for presenting solutions or steps in a process:

<div class="example">
  <div class="example-preview">
    <div class="solution-item" style="display: flex; align-items: flex-start; margin-bottom: var(--space-6); background-color: var(--primary-50); padding: var(--space-4); border-radius: 0.5rem; border-left: 4px solid var(--primary-400); max-width: 500px;">
      <div class="solution-number" style="background-color: var(--primary-400); color: white; width: 2.5rem; height: 2.5rem; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 1.25rem; margin-right: var(--space-4); flex-shrink: 0;">1</div>
      <div class="solution-content">
        <h3 style="margin: 0 0 var(--space-2) 0; font-size: 1.25rem; color: var(--primary-800);">Solution Title</h3>
        <p style="margin: 0; color: var(--primary-700);">This solution card presents a numbered step or solution with a title and description, creating a clear visual hierarchy for processes.</p>
      </div>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="solution-item">
  <div class="solution-number">1</div>
  <div class="solution-content">
    <h3>Solution Title</h3>
    <p>This solution card presents a numbered step or solution with a title and description, creating a clear visual hierarchy for processes.</p>
  </div>
</div>
```
  </div>
</div>

## Responsive Behavior

All card components are responsive, adapting to different screen sizes:

### Desktop Behavior
- Standard layout with full padding and spacing
- Team member cards in multi-column grid
- Feature items in vertical alignment

### Mobile Behavior
- Reduced padding for improved space utilization
- Single-column layout for all card grids
- Feature items switch to horizontal alignment on smaller screens
- Team member photos may be slightly smaller

## Implementation Guidelines

### Card Container Best Practices

1. **Choose the right card type** for your content:
   - Use basic cards for general content containers
   - Use content cards for text-heavy sections
   - Use white content cards for featured content on colored backgrounds
   - Use specialized cards (team, feature, solution) for specific content types

2. **Maintain consistent spacing** within cards:
   - Start with a heading (h2-h6) at the top
   - Use standard paragraph spacing between elements
   - Include a call-to-action at the bottom when relevant

3. **Consider card grouping** for related content:
   - Use `team-section` for team member cards
   - Use `feature-grid` for feature items
   - Use `solutions-list` for solution items

### Code Examples

#### Card Grid Layout

```html
<div class="feature-grid">
  <div class="feature-item">
    <!-- Feature content -->
  </div>
  <div class="feature-item">
    <!-- Feature content -->
  </div>
  <div class="feature-item">
    <!-- Feature content -->
  </div>
</div>
```

#### Team Member Grid

```html
<div class="team-section">
  <div class="team-member">
    <!-- Team member content -->
  </div>
  <div class="team-member">
    <!-- Team member content -->
  </div>
</div>
```

#### Solution List

```html
<div class="solutions-list">
  <div class="solution-item">
    <!-- Solution content -->
  </div>
  <div class="solution-item">
    <!-- Solution content -->
  </div>
</div>
```