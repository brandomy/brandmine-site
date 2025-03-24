---
layout: styleguide
title: Text Components
description: Brandmine's specialized text components for creating emphasis and flow in content.
permalink: /en/styleguide/components/text/
lang: en
---

## Text Components Overview

Our text components provide specialized typography treatments beyond basic HTML elements. These components create visual hierarchy, guide readers through content, and emphasize important information across the site.

## Hero Subtitle

The hero subtitle provides secondary messaging within hero sections, with lighter weight and generous spacing:

<div class="example">
  <div class="example-preview">
    <div style="background-color: var(--primary-50); padding: var(--space-6); text-align: center;">
      <h1 style="margin-top: 0; margin-bottom: var(--space-4); font-size: 3rem;">Main Hero Heading</h1>
      <p class="hero-subtitle" style="font-size: 1.5rem; font-weight: 300; max-width: 700px; margin: 0 auto var(--space-8);">The hero subtitle expands on the main heading with additional context, creating a clear hierarchy while maintaining visual connection.</p>
      <a href="#" class="btn-primary">Call to Action</a>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="hero-panel">
  <div class="panel-content">
    <h1>Main Hero Heading</h1>
    <p class="hero-subtitle">The hero subtitle expands on the main heading with additional context, creating a clear hierarchy while maintaining visual connection.</p>
    <a href="#" class="btn-primary">Call to Action</a>
  </div>
</div>
```
  </div>
</div>

## Lead Text

Lead text provides an introduction or summary at the beginning of a section, using larger font size and improved spacing:

<div class="example">
  <div class="example-preview">
    <div style="padding: var(--space-4);">
      <h2 style="margin-top: 0; margin-bottom: var(--space-4);">Section Title</h2>
      <p class="lead-text" style="font-size: 1.125rem; line-height: 1.6; margin-bottom: var(--space-8); max-width: 800px; margin-left: auto; margin-right: auto; color: var(--neutral-700);">Lead text introduces a section with slightly larger font size and more generous line height, creating visual emphasis while maintaining readability. It's perfect for summarizing content that follows.</p>
      <p>Regular paragraph text follows the lead text, creating a clear hierarchy between the introductory content and the detailed information that follows.</p>
      <p>Additional paragraphs continue the content with standard typography.</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="panel-content">
  <h2>Section Title</h2>
  <p class="lead-text">Lead text introduces a section with slightly larger font size and more generous line height, creating visual emphasis while maintaining readability. It's perfect for summarizing content that follows.</p>
  <p>Regular paragraph text follows the lead text, creating a clear hierarchy between the introductory content and the detailed information that follows.</p>
  <p>Additional paragraphs continue the content with standard typography.</p>
</div>
```
  </div>
</div>

## Panel Lead Text

Within panels, lead text receives special treatment with a slightly larger size:

<div class="example">
  <div class="example-preview">
    <div style="background-color: var(--neutral-100); padding: var(--space-6); border-radius: 0.5rem;">
      <h2 style="margin-top: 0; text-align: center; margin-bottom: var(--space-4);">Panel Section Title</h2>
      <p style="font-size: 1.2rem; line-height: 1.6; margin-bottom: var(--space-8); max-width: 800px; margin-left: auto; margin-right: auto; color: var(--neutral-700);">Panel lead text uses slightly larger sizing than standard lead text, creating greater emphasis within panel contexts. It helps establish the panel's focus and guides users through complex content sections.</p>
      <p>Regular paragraph text follows with standard sizing and spacing.</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h2>Panel Section Title</h2>
    <p class="lead-text">Panel lead text uses slightly larger sizing than standard lead text, creating greater emphasis within panel contexts. It helps establish the panel's focus and guides users through complex content sections.</p>
    <p>Regular paragraph text follows with standard sizing and spacing.</p>
  </div>
</div>
```
  </div>
</div>

## Conclusion Text

Conclusion text provides visual separation for summary content with a subtle top border:

<div class="example">
  <div class="example-preview">
    <div style="padding: var(--space-4);">
      <p>Regular paragraph content precedes the conclusion text.</p>
      <p>Several paragraphs may provide detailed information.</p>
      <p class="conclusion-text" style="font-size: 1.125rem; border-top: 1px solid rgba(0, 0, 0, 0.1); margin-top: var(--space-8); padding-top: var(--space-6);">Conclusion text summarizes key points or provides a final thought, separated from the main content with a subtle divider. This visual distinction helps readers identify summary information and next steps.</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="panel-content">
  <p>Regular paragraph content precedes the conclusion text.</p>
  <p>Several paragraphs may provide detailed information.</p>
  <p class="conclusion-text">Conclusion text summarizes key points or provides a final thought, separated from the main content with a subtle divider. This visual distinction helps readers identify summary information and next steps.</p>
</div>
```
  </div>
</div>

## Responsive Behavior

All text components are responsive, adapting to different screen sizes:

### Desktop Behavior
- Full font sizes as specified
- Generous maximum widths for optimal reading

### Mobile Behavior (<768px)
- Reduced font sizes for smaller screens:
  - Hero subtitle: 1.25rem (from 1.5rem)
  - Lead text: 1rem (from 1.125rem)
  - Panel lead text: 1.1rem (from 1.2rem)
- Maintained line height and spacing ratios

## Implementation Guidelines

### Text Component Usage

1. **Hero Subtitle** - Use only in hero sections, directly following the main h1 heading
2. **Lead Text** - Use at the beginning of content sections to introduce the topic
3. **Panel Lead Text** - Use in panels where additional emphasis is needed
4. **Conclusion Text** - Use at the end of a content section to summarize or transition

### Best Practices

1. **Maintain hierarchy** - Ensure proper heading (h1-h6) usage before specialized text components
2. **Respect maximum widths** - Text components have max-width settings for optimal readability
3. **Use sparingly** - Reserve these components for their intended purpose to maintain impact
4. **Keep content concise** - These components work best with focused, direct messaging
5. **Preserve visual space** - Maintain the specified margins to create proper rhythm

### Example Section Structure

```html
<div class="full-width-panel light-panel">
  <div class="panel-content">
    <!-- Section heading -->
    <h2>Section Heading</h2>
    
    <!-- Introductory content -->
    <p class="lead-text">Lead paragraph introducing the section content...</p>
    
    <!-- Main content -->
    <p>Regular paragraph content...</p>
    <p>Additional content paragraphs...</p>
    
    <!-- Summary content -->
    <p class="conclusion-text">Conclusion text summarizing key points...</p>
  </div>
</div>
```