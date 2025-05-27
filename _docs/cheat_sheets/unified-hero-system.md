# Unified Hero System

This document outlines the unified hero panel system implemented across all Brandmine page types to ensure consistent styling and user experience.

## Overview

All major page types now have hero panels that immediately follow breadcrumbs, creating a consistent visual hierarchy with three distinct tiers:

**Breadcrumbs → Hero Panel → Content**

### Design Tiers

**Tier 1: Navigation Pages** - Full teal gradient (`panel--hero`)
- Major landing and navigation pages
- Maximum visual impact

**Tier 2: Individual Profiles** - Subtle teal gradient (`panel--hero-subtle`)
- Auto-generated content (thousands of records)
- Consistent but reduced visual weight
- Scalable for mass content generation

**Tier 3: Editorial Content** - Hero images with overlay (`panel--hero-image`)
- Curated insight articles
- Unique hero images for editorial impact

## Implementation by Page Type

### 1. Home Page
- **Component**: `_includes/pages/home/hero.html`
- **CSS**: `assets/css/pages/home/hero.scss`
- **Layout**: `_layouts/home.html`
- **Features**: Main site introduction, CTAs

### 2. Discovery Pages
- **Component**: `_includes/pages/discovery/hero.html`
- **CSS**: `assets/css/pages/discovery/hero.scss`
- **Layout**: `_layouts/discovery.html`
- **Features**: Introduction to dimensions taxonomy

### 3. Founders Index
- **Component**: `_includes/pages/founders/hero.html`
- **CSS**: `assets/css/pages/founders/hero.scss`
- **Layout**: `_layouts/founders.html`
- **Features**: Introduction to founders directory

### 4. Brands Index
- **Component**: `_includes/pages/brands/hero.html`
- **CSS**: `assets/css/pages/brands/hero.scss`
- **Layout**: `_layouts/brands.html`
- **Features**: Introduction to brands directory

### 5. Individual Brand Profiles *(Tier 2)*
- **Component**: `_includes/pages/brand/hero.html`
- **CSS**: `assets/css/pages/brand/hero.scss`
- **Layout**: `_layouts/brand-profile.html`
- **Panel Type**: `panel--hero-subtle`
- **Features**: Brand name, tagline, founding year, location

### 6. Individual Founder Profiles *(Tier 2)*
- **Component**: `_includes/pages/founder/hero.html`
- **CSS**: `assets/css/pages/founder/hero.scss`
- **Layout**: `_layouts/founder-profile.html`
- **Panel Type**: `panel--hero-subtle`
- **Features**: Founder name, position, company, location

### 7. Individual Dimensions *(Tier 2)*
- **Component**: `_includes/pages/dimension/hero.html`
- **CSS**: `assets/css/pages/dimension/hero.scss`
- **Layout**: `_layouts/dimension.html`
- **Panel Type**: `panel--hero-subtle`
- **Features**: Dimension name, category, description

### 8. Insight Articles *(Tier 3)*
- **Component**: `_includes/pages/insight/hero.html`
- **CSS**: `assets/css/pages/insight/hero.scss`
- **Layout**: `_layouts/insight-article.html`
- **Panel Type**: `panel--hero` or `panel--hero-image` (if `hero_image` is set)
- **Features**: Article title, category, publication date, reading time, optional hero image

### 9. About Page
- **Component**: `_includes/pages/about/hero.html`
- **CSS**: `assets/css/pages/about/hero.scss`
- **Layout**: `_layouts/about.html`
- **Features**: About page introduction

### 10. Insights Category Pages
- **Component**: Uses existing hero sections
- **CSS**: `assets/css/pages/insights-category/hero.scss`
- **Layout**: `_layouts/insight-category.html`
- **Features**: Category-specific introductions

## Panel Types

### `panel--hero` (Tier 1 - Navigation Pages)
```scss
background: radial-gradient(circle at center, var(--primary-400) 0%, var(--primary-600) 100%);
```
**Use for**: Home, Discovery, Brands Index, Founders Index, About pages

### `panel--hero-subtle` (Tier 2 - Individual Profiles)
```scss
background: radial-gradient(circle at center, var(--primary-300) 0%, var(--primary-500) 100%);
```
**Use for**: Brand profiles, Founder profiles, Individual dimensions
**Benefits**: Lighter visual weight, suitable for auto-generated content at scale

### `panel--hero-image` (Tier 3 - Editorial Content)
```scss
background-image: url('path/to/image.jpg');
background-size: cover;
background-position: center;
/* Dark overlay for text readability */
```
**Use for**: Insight articles with `hero_image` front matter
**Features**: Responsive images, dark overlay, text shadows for readability

## Consistent Design Elements

### Visual Style
- All hero panels use one of the three panel types above
- Consistent typography hierarchy across all variants
- White text with appropriate contrast handling
- Centered text alignment

### Typography Hierarchy
- **Main Title**: `font-size: var(--text-5xl)` (responsive to `--text-3xl` on mobile)
- **Subtitle/Position**: `font-size: var(--text-2xl)` (responsive to `--text-lg` on mobile)
- **Meta Information**: `font-size: var(--text-lg)` (responsive to `--text-base` on mobile)

### Color System
- **Primary Heading**: `color: var(--secondary-200)`
- **Subtitle Text**: `color: white`
- **Meta Text**: `color: var(--secondary-100)`

### Layout Specifications
- Full-width panels using the panel component system
- Max-width content of 1200px (following site width strategy)
- Consistent padding through panel system
- Responsive design mobile-first approach

## Logic-Light Implementation

All hero components follow the "logic-light" approach:

### Translation System
```liquid
{% include helpers/t.html key="section.hero.title" fallback="Default Title" %}
```

### Parameter Passing
```liquid
{% assign entity = include.entity | default: page %}
```

### Consistent Structure
```liquid
<div class="panel panel--hero">
  <div class="panel__content">
    <div class="[page-type]-hero">
      <!-- Content specific to page type -->
    </div>
  </div>
</div>
```

## CSS Organization

### BEM Methodology
- **Block**: `.[page-type]-hero`
- **Elements**: `.[page-type]-hero__title`, `.[page-type]-hero__subtitle`
- **Modifiers**: Applied at panel level

### File Structure
```
assets/css/pages/[page-type]/hero.scss
```

### Import Pattern
Each page's main CSS file imports its hero component:
```scss
@import "hero";
```

## Section Configuration

All layouts include hero in their default sections array:

```yaml
sections:
  - breadcrumbs
  - hero
  - [other sections...]
```

## Maintenance Guidelines

### Adding New Page Types
1. Create hero component in `_includes/pages/[page-type]/hero.html`
2. Create corresponding CSS in `assets/css/pages/[page-type]/hero.scss`
3. Add hero to layout's default sections
4. Import hero CSS in page's `_index.scss`
5. Follow consistent naming and structure patterns

### Modifying Existing Heroes
- Maintain consistent visual hierarchy
- Preserve responsive design patterns
- Keep translation system intact
- Test across all breakpoints

### Translation Keys
Ensure all hero text uses the translation system:

```yaml
# _data/translations/en.yml
[page-type]:
  hero:
    title: "Page Title"
    subtitle: "Page Subtitle"
```

## Testing Checklist

When implementing or modifying hero sections:

- [ ] Hero appears immediately after breadcrumbs
- [ ] Consistent visual styling across page types
- [ ] Responsive design works on mobile
- [ ] Translation keys are properly implemented
- [ ] CSS follows BEM naming conventions
- [ ] Logic-light approach maintained
- [ ] Panel component system used correctly
- [ ] Typography hierarchy consistent

## Usage Guide

### Adding Hero Images to Insight Articles

To add a hero image to an insight article, add the `hero_image` field to the front matter:

```yaml
---
layout: insight-article
title: "Your Article Title"
category: brand-spotlight
hero_image: "/assets/images/insights/your-hero-image.jpg"
date: 2025-05-28
reading_time: 5
---
```

**Image Requirements:**
- Minimum resolution: 1200×600px
- Aspect ratio: 2:1 (recommended)
- File format: JPG or PNG
- Optimized file size: < 500KB
- High contrast areas for text overlay

**If no `hero_image` is specified**, the insight will use the standard teal gradient hero panel.

### Auto-Generated Content Guidelines

For the thousands of auto-generated brand, founder, and dimension profiles:

- **No manual hero images required** - all use `panel--hero-subtle`
- **No sidebar complexity** - simple linear section-based layout
- **Consistent data structure** ensures uniform appearance
- **Scalable system** handles mass content generation
- **Lighter visual weight** prevents visual fatigue across many pages
- **MVP-friendly** - easy to debug and maintain

## Benefits

This unified system provides:

1. **Consistent User Experience**: Predictable navigation hierarchy across all page types
2. **Visual Cohesion**: Unified design language with appropriate visual weight for each content tier
3. **Maintainability**: Standardized component structure with clear guidelines
4. **Scalability**: Optimized for thousands of auto-generated profiles while preserving editorial impact
5. **Accessibility**: Consistent semantic structure and proper contrast handling
6. **Mobile Optimization**: Responsive design patterns across all hero variants
7. **Color System Preservation**: Doesn't interfere with existing insights and dimensions color taxonomy

---

*Document last updated: 2025-05-28*
*Status: Complete implementation across all page types with three-tier design system*