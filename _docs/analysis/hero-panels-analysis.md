# Hero Panels Analysis Report

**Date**: June 2, 2025  
**Scope**: Comprehensive analysis of hero panel implementations across all page types in the Brandmine Jekyll site  
**Purpose**: Document current state, identify patterns, and recommend unification strategies  

## Executive Summary

The Brandmine site currently implements hero panels across multiple page types using a **three-tier hero panel system** defined in the centralized panel architecture. However, the analysis reveals **mixed implementation patterns** with some inconsistencies between the intended system and actual usage.

### Key Findings

1. **Three-Tier System Partially Implemented**: The site defines three hero panel types but usage patterns show inconsistencies
2. **Split Layout Pattern Emergence**: Several pages use a newer "split hero" layout with journal-hero classes
3. **Mixed Content Approaches**: Some hero sections contain rich content while others are minimal
4. **CSS Organization Issues**: Hero styling is split between global panels.scss and page-specific files

## Detailed Analysis

### 1. Hero Panel Type Implementation

#### Panel Type Classification

**Tier 1: Navigation Pages (`panel--hero`)**
- **Intended Use**: Discovery, category listings, main navigation pages
- **Styling**: `radial-gradient(circle at center, var(--primary-400) 0%, var(--primary-600) 100%)`
- **Current Implementation**: 
  - ✅ Home page (`home.html`)
  - ✅ Brands page (`brands.html`)
  - ✅ Discovery page (`discovery.html`)
  - ✅ Insights page (`insights.html`)
  - ✅ Journal page (`journal.html`)
  - ✅ About page (`about.html`)

**Tier 2: Individual Profiles (`panel--hero-subtle`)**
- **Intended Use**: Brands, founders, dimensions
- **Styling**: `radial-gradient(circle at center, var(--primary-300) 0%, var(--primary-500) 100%)`
- **Current Implementation**: 
  - ✅ Founder profiles (`founder-profile.html`)
  - ✅ Dimension pages (`dimension.html`)
  - ❌ Brand profiles (uses `panel--hero` instead)

**Tier 3: Editorial Content (`panel--hero-image`)**
- **Intended Use**: Insights, articles with background images
- **Styling**: Background image with dark overlay
- **Current Implementation**: 
  - ✅ Insight articles (`insight-article.html`)

### 2. Content Structure Patterns

#### Home Page Hero
**File**: `_includes/pages/home/hero.html`
**Structure**:
```html
<h1 class="panel__heading-primary">{{ title }}</h1>
<p class="panel__subtitle">{{ subtitle }}</p>
<a href="..." class="btn btn--primary-cta">{{ cta_primary }}</a>
<a href="..." class="btn btn--standard">{{ cta_secondary }}</a>
```
**Characteristics**: 
- Full content including dual CTAs
- Uses translation helper pattern
- Centered text layout

#### Split Layout Heroes (Brands, Discovery)
**Files**: `_includes/pages/brands/hero.html`, `_includes/pages/discovery/hero.html`
**Structure**:
```html
<div class="journal-hero journal-hero--teal journal-hero--landing">
  <div class="journal-hero__content">
    <h1 class="journal-hero__title">{{ page.title }}</h1>
    <p class="journal-hero__subtitle">{{ translated_subtitle }}</p>
  </div>
  <div class="journal-hero__image">
    {% include components/images/collection-image.html %}
  </div>
</div>
```
**Characteristics**: 
- Side-by-side layout (desktop), stacked (mobile)
- Image integration with responsive behavior
- Newer pattern not reflected in main panel system

#### Profile Heroes (Brand, Insight)
**Brand Hero** (`_includes/pages/brand/hero.html`):
```html
<div class="brand-hero">
  <h1 class="brand-hero__title">{{ brand.title }}</h1>
  <p class="brand-hero__tagline">{{ brand.tagline }}</p>
  <div class="brand-hero__meta">
    <span class="brand-hero__founded">Founded {{ brand.founding_year }}</span>
    <span class="brand-hero__location">{{ brand.location }}</span>
  </div>
</div>
```

**Insight Hero** (`_includes/pages/insight/hero.html`):
```html
<div class="insight-hero">
  <div class="insight-hero__category">{{ insight.category }}</div>
  <h1 class="insight-hero__title">{{ insight.title }}</h1>
  <div class="insight-hero__meta">
    <span class="insight-hero__date">{{ insight.date }}</span>
    <span class="insight-hero__reading-time">{{ insight.reading_time }}</span>
  </div>
</div>
```

### 3. CSS Implementation Analysis

#### Global Panel System
**File**: `assets/css/layout/panels.scss`
**Lines**: 170-256

Defines the three-tier system with:
- `.panel--hero`: Primary gradient background
- `.panel--hero-subtle`: Lighter gradient background  
- `.panel--hero-image`: Background image with overlay

#### Page-Specific Hero Styles
**Files Found**:
- `assets/css/pages/home/hero.scss` - Minimal overrides
- `assets/css/pages/brand/hero.scss` - Complete brand hero styling
- `assets/css/pages/journal/_hero.scss` - Split layout system
- `assets/css/pages/insight/hero.scss` - Insight-specific styling
- Multiple others with varying levels of customization

#### Journal Hero System
**File**: `assets/css/pages/journal/_hero.scss`
**Lines**: 1-271

Implements a comprehensive split layout system with:
- Grid-based responsive layout
- Multiple color palette options (8 variants)
- Mobile-first responsive design
- Post-specific variations

### 4. Pattern Inconsistencies Identified

#### Major Issues

1. **Panel Type Mismatches**:
   - Brand profiles use `panel--hero` instead of `panel--hero-subtle`
   - Split layout pages bypass panel system entirely

2. **Mixed CSS Architecture**:
   - Some heroes use global panel classes
   - Others use page-specific custom classes
   - Split layout uses separate journal-hero system

3. **Content Structure Variations**:
   - Home: Full featured with CTAs
   - Brands/Discovery: Split layout with images
   - Profiles: Metadata-focused
   - Insights: Editorial with category indicators

4. **Translation Pattern Inconsistencies**:
   - Home hero uses translation helper consistently
   - Some pages mix direct data access with helpers
   - Impact sections use different translation patterns

#### Minor Issues

1. **Typography Hierarchy**:
   - Different heading classes across hero types
   - Inconsistent responsive scaling

2. **Spacing and Padding**:
   - Mixed padding approaches in global vs. page-specific CSS
   - Panel spacing fixes impact hero appearance

3. **Color Implementation**:
   - Some heroes define custom colors
   - Others rely on inherited panel colors

## Panel Mapping Configuration

The hero panels are controlled through `_data/page_sections.yml`:

```yaml
# Navigation pages use panel--hero
home:
  panel_mappings:
    hero:
      type: panel--hero

brands:
  panel_mappings:
    hero:
      type: panel--hero

# Individual profiles use panel--hero-subtle  
founder-profile:
  panel_mappings:
    hero:
      type: panel--hero-subtle

dimension:
  panel_mappings:
    hero:
      type: panel--hero-subtle

# Editorial content uses panel--hero
insight-article:
  panel_mappings:
    hero:
      type: panel--hero
```

**Issue**: Brand profiles configured to use `panel--hero` but should use `panel--hero-subtle` according to the three-tier system.

## Recommendations

### 1. Standardize Three-Tier Implementation

**Priority**: High  
**Action**: Update page section configurations to properly implement the three-tier system:

```yaml
# Fix brand profiles
brand-profile:
  panel_mappings:
    hero:
      type: panel--hero-subtle

# Ensure insight articles use image hero when appropriate
insight-article:
  panel_mappings:
    hero:
      type: panel--hero-image  # When featured_image present
      # fallback to panel--hero
```

### 2. Integrate Split Layout System

**Priority**: Medium  
**Action**: Decide between:
- **Option A**: Migrate split layout to use panel system variations
- **Option B**: Formalize split layout as fourth tier (`panel--hero-split`)

Recommended: **Option B** with addition to panel system:

```scss
.panel--hero-split {
  .journal-hero {
    // Move existing journal-hero styles here
    // Integrate with panel responsive system
  }
}
```

### 3. Unify CSS Architecture

**Priority**: High  
**Action**: 
- Move all hero-specific styles to `assets/css/layout/panels.scss`
- Remove redundant hero styles from page-specific files
- Create hero variants within panel system

### 4. Standardize Content Patterns

**Priority**: Medium  
**Action**: Define content templates for each hero tier:

**Tier 1 (Navigation)**: Title + Subtitle + Optional CTAs  
**Tier 2 (Profiles)**: Title + Metadata + Optional Tagline  
**Tier 3 (Editorial)**: Title + Category + Metadata  
**Tier 4 (Split)**: Title + Subtitle + Image

### 5. Translation Consistency

**Priority**: Low  
**Action**: Standardize all hero sections to use translation helper pattern:

```liquid
{% include helpers/t.html key="page.hero.title" fallback="Default Title" %}
```

## Implementation Priority

1. **Phase 1**: Fix panel type mismatches in page sections configuration
2. **Phase 2**: Consolidate CSS architecture to panels.scss
3. **Phase 3**: Implement split layout as formal panel tier
4. **Phase 4**: Standardize content patterns and translations

## Impact Assessment

**Low Risk Changes**:
- Panel type configuration updates
- CSS consolidation to panels.scss

**Medium Risk Changes**:
- Split layout integration
- Content pattern standardization

**Testing Required**:
- All hero sections across all languages
- Mobile responsive behavior
- Panel spacing and visual hierarchy

## Conclusion

The Brandmine hero panel system shows a strong foundation with the three-tier architecture but requires consolidation to achieve full consistency. The emergence of the split layout pattern indicates evolving design needs that should be formally integrated into the panel system. With focused implementation of the recommended changes, the site can achieve a unified, maintainable hero panel system that supports both current needs and future growth.