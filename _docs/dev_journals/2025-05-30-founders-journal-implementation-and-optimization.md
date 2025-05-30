# 2025-05-30 Development Journal: Founders' Journal Implementation and Optimization

## Overview

Today's session focused on implementing and optimizing the **Founders' Journal** blog section for Brandmine. This represents a significant addition to the site's content strategy, providing a platform for sharing the founder's journey building Brandmine and insights from exploring BRICS+ markets.

## Key Accomplishments

### 1. Journal Post Date Management
- **Challenge**: Jekyll was not building future-dated posts (June 15, July 1, 2025)
- **Solution**: Rolled back post dates to earlier in May 2025 instead of enabling `future: true`
- **Posts Updated**:
  - MapLibre Journey: 2025-05-30 → 2025-05-23
  - Russian Market Insights: 2025-06-15 → 2025-05-16
  - China Brand Storytelling: 2025-07-01 → 2025-05-09

### 2. Multilingual URL Structure Implementation
- **Challenge**: Posts lacked language-specific URLs for proper language switching
- **Solution**: Added explicit permalinks to all 9 posts (EN/RU/ZH versions)
- **URL Pattern**: `/[lang]/journal/YYYY/MM/DD/post-slug/`
- **Examples**:
  - English: `/en/journal/2025/05/23/maplibre-journey/`
  - Russian: `/ru/journal/2025/05/23/maplibre-journey/`
  - Chinese: `/zh/journal/2025/05/23/maplibre-journey/`

### 3. Visual Styling Optimizations

#### Image Quality and Aspect Ratios
- **Fixed**: Journal entry cards displaying 1:1 cropped images instead of full 3:2 images
- **Standardized**: All images now use Brandmine's approved aspect ratios (3:2, 2:3, 1:1)
- **Removed**: 16:9 aspect ratio usage (not part of Brandmine standards)
- **Implemented**: Responsive `srcset` for optimal image quality:
  ```html
  <img src="hero-400w.jpg" 
       srcset="hero-400w.jpg 400w, hero-800w.jpg 800w, hero-1200w.jpg 1200w"
       sizes="(max-width: 479px) 100vw, (max-width: 767px) 50vw, 33vw">
  ```

#### Typography and UI Consistency
- **Fixed**: Oversized tags on journal entry cards using `!important` overrides
- **Enhanced**: Breadcrumb styling for proper hierarchy display
- **Added**: Bullet separators (`•`) to featured article meta sections for consistency
- **Implemented**: Post-page specific CSS rules for seamless section flow

### 4. Reusable Component Architecture

#### Entry Card Component Migration
- **Created**: `_includes/components/cards/entry-card.html` as reusable component
- **Moved**: CSS from `assets/css/pages/journal/_entry-card.scss` to `assets/css/components/cards/entry-card.scss`
- **Enhanced**: Component flexibility with configurable parameters:
  ```liquid
  {% include components/cards/entry-card.html 
     item=post 
     image_base_path="/assets/images/insights/"
     show_author=false
     read_more_text="Read Insight" %}
  ```

#### Component Features
- **Flexible content**: Works with posts, insights, articles, or any content type
- **Configurable display**: Toggle author, date, tags, excerpt individually
- **Custom image handling**: Specify base paths and sizes
- **Translation support**: Use custom translation objects
- **Fallback support**: Handles missing images with placeholders
- **Backward compatible**: Works with existing journal posts

### 5. CSS Architecture Improvements

#### Whitespace Management
- **Implemented**: Post-Page Specific Rules for reduced whitespace between sections
- **Principle**: First section maintains padding, subsequent sections flow seamlessly
- **CSS Pattern**:
  ```scss
  .post-page {
    .post-section:not(:first-of-type) .panel {
      padding-top: 0;
    }
    .post-section:first-of-type .panel {
      padding-top: var(--space-8);
    }
  }
  ```

#### SCSS File Organization
- **Clarified**: Underscore prefix (`_`) naming convention in Sass partials
- **Purpose**: Files with `_` prefix are import-only and won't compile independently
- **Pattern**: Consistent throughout project for modular CSS architecture

### 6. Technical Fixes

#### Build Error Resolution
- **Issue**: Jekyll build failing due to missing `pages/journal/entry-card.html` references
- **Root Cause**: Old include paths in `latest-entries.html` and `related-posts.html`
- **Solution**: Updated all references to use new `components/cards/entry-card.html`
- **Parameter Change**: Updated from `post=post` to `item=post` for new component

#### Image Path Construction Bug
- **Issue**: Extra dots in image URLs (e.g., `hero-1200w./jpg`)
- **Root Cause**: `relative_url` filter applied to file extension instead of full path
- **Solution**: Proper path construction before applying `relative_url`
- **Before**: `{{ hero_base_path }}-400w.{{ item.images.hero.ext | relative_url }}`
- **After**: `{{ hero_400w_path | relative_url }}` where `hero_400w_path` is pre-constructed

## Technical Insights

### Sass Partials Convention
- Files prefixed with `_` (e.g., `_entry-card.scss`) are Sass partials
- Won't compile to individual CSS files
- Must be imported into main stylesheets
- Standard convention for modular CSS organization

### Responsive Image Strategy
- **Mobile**: Uses appropriate size for viewport width
- **Tablet**: 800w images for better quality at ~50% viewport
- **Desktop**: 800w/1200w images for crisp display at ~33% viewport
- **Loading**: `loading="lazy"` for performance optimization

### Jekyll URL Patterns
- **Collections**: Use `permalink: /:collection/:path/` for automatic generation
- **Posts**: Require explicit permalinks for multilingual support
- **Language switching**: Depends on `ref` attribute matching across languages

## Architecture Decisions

### Linear Layout Consistency
- **Maintained**: Brandmine's simplified linear sectioning approach
- **Avoided**: Complex grid-based sidebar layouts
- **Result**: Consistent mobile-first experience across all devices

### Component Reusability
- **Strategy**: Move page-specific components to shared `components/` directory when they become reusable
- **Benefit**: Reduces code duplication and improves maintainability
- **Pattern**: Flexible parameter system for different use cases

### Image Quality Standards
- **Enforced**: Brandmine's 3:2, 2:3, 1:1 aspect ratio standards
- **Implemented**: Responsive image loading with appropriate sizes
- **Performance**: Lazy loading and optimal format delivery

## Content Strategy Integration

### Founders' Journal Purpose
- **Mission**: Document the journey building Brandmine
- **Content**: Technical insights, market exploration learnings, founder reflections
- **Audience**: Potential users, partners, and fellow entrepreneurs in BRICS+ markets

### Multilingual Support
- **Languages**: Full EN/RU/ZH support for all journal content
- **URL Structure**: Language-specific paths for SEO and user experience
- **Content Strategy**: Same articles translated across all languages

## Future Considerations

### Scalability
- **Reusable components**: Entry card can be used for insights, case studies, etc.
- **Template flexibility**: Easy to add new content types using same patterns
- **Performance**: Responsive images and lazy loading prepared for growth

### Content Management
- **Workflow**: Standardized front matter for consistent metadata
- **Images**: Automated responsive image generation through existing scripts
- **Translation**: Clear reference system for cross-language content matching

## Files Modified

### New Files Created
- `_includes/components/cards/entry-card.html` - Reusable entry card component
- `assets/css/components/cards/entry-card.scss` - Component styles (moved from journal)

### Files Updated
- `_posts/*.md` (9 files) - Added permalinks to all journal posts
- `_includes/pages/journal/latest-entries.html` - Updated to use new component
- `_includes/pages/journal/related-posts.html` - Updated includes and parameters
- `_includes/pages/journal/featured-article.html` - Added bullet separators
- `assets/css/pages/journal/_index.scss` - Removed entry-card import
- `assets/css/pages/journal/_post-page.scss` - Added whitespace management rules
- `assets/css/components/cards/entry-card.scss` - Enhanced with tag size fixes

### Files Removed
- `_includes/pages/journal/entry-card.html` - Moved to components
- `assets/css/pages/journal/_entry-card.scss` - Moved to components

## Lessons Learned

### Jekyll Build Management
- **Future posts**: Avoid enabling `future: true` in production; manage dates explicitly
- **Include references**: Always update all file references when moving components
- **Liquid syntax**: Proper path construction before applying Jekyll filters

### Component Architecture
- **Reusability planning**: Consider component reuse potential early in development
- **Parameter flexibility**: Design components with configurable options from the start
- **Documentation**: Clear parameter documentation enables broader adoption

### Image Optimization
- **Responsive strategy**: Plan `srcset` and `sizes` attributes based on actual layout usage
- **Quality vs. performance**: Balance image quality with loading performance
- **Standards compliance**: Enforce consistent aspect ratios across all content

## Success Metrics

- ✅ **Build Success**: Jekyll builds without errors
- ✅ **Visual Consistency**: All journal cards display proper 3:2 images
- ✅ **Performance**: Responsive images load appropriate sizes
- ✅ **Multilingual**: Language switching works correctly
- ✅ **Maintainability**: Reusable components reduce future development time
- ✅ **User Experience**: Consistent typography and spacing throughout

This implementation establishes a solid foundation for Brandmine's content strategy while maintaining the site's high standards for performance, accessibility, and multilingual support.