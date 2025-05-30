# Development Journal: Insights Carousel Fixes & Company News Icon

**Date**: May 30, 2025  
**Developer**: Assistant (with Randal Eastman)  
**Session Duration**: ~1.5 hours  
**Focus Areas**: MVP simplification, carousel functionality, icon system extension

## Overview

This session focused on two main issues:
1. Fixing the insights carousel that wasn't displaying the 4th item
2. Adding the missing Company News icon to the category navigation

Both issues revealed important architectural decisions about keeping the codebase simple and maintainable during the MVP phase.

## Issue 1: Insights Carousel Not Showing 4th Item

### The Problem
After implementing modular insights sections, the carousel was moving by 100% when navigating, causing a blank screen instead of showing the 4th insight card. The JavaScript transform logic was overcomplicated for the actual need.

### Investigation Process
1. Initially tried fixing the transform calculations to move by card width (33.33%)
2. Attempted various mathematical approaches to handle gaps and positioning
3. Realized the approach was fundamentally flawed for this use case

### The Solution: Return to CSS-Based Scrolling
After reviewing the working `recent-insights` carousel from the previous night, we discovered it used a much simpler approach:

**Before (Complex JavaScript):**
```javascript
// Complex calculations for slides and transforms
let maxSlides = Math.max(1, items.length - itemsPerSlide + 1);
const cardWidth = 100 / itemsPerSlide;
const offset = currentSlide * cardWidth;
track.style.transform = `translateX(-${offset}%)`;
```

**After (CSS-Based Scrolling):**
```scss
&__track {
  display: flex;
  overflow-x: auto;
  scroll-behavior: smooth;
  -webkit-overflow-scrolling: touch;
  scroll-snap-type: x mandatory;
}
```

### Key Learning
Sometimes the simplest solution is the best. Native browser scrolling with CSS handles all edge cases automatically and provides better touch support on mobile devices.

## Issue 2: Missing Company News Icon

### The Problem
The insights category navigation was missing an icon for the 5th category (Company News) that was added last night. Initial assumption was that icons were hardcoded.

### Investigation Process
1. Checked `category-navigation.html` - found it was just a wrapper
2. Examined `insights-category-navigation.html` - discovered icons pulled from data files
3. Found in `_data/insights/en.yml` that Company News already had `icon: "brandmine-news"`
4. Traced through `icon.html` component - found it only recognized 4 specific insight icons

### The Solution
The icon system was already well-architected to be extensible:

1. **Created simple SVG icon** (`company-news.svg`):
```svg
<svg class="icon-svg" width="100%" height="100%" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect x="4" y="6" width="16" height="12" rx="2" stroke="currentColor" stroke-width="2"/>
  <path d="M8 10h8M8 14h4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
</svg>
```

2. **Updated icon component** to recognize the new icon:
```liquid
{% assign insight_svgs = "market-momentum,founders-journey,location-intelligence,brand-spotlight,company-news,brandmine-news" | split: "," %}
```

3. **Added render condition**:
```liquid
{% elsif icon_name == "company-news" or icon_name == "brandmine-news" %}
  {% include components/icons/company-news.svg %}
```

### Design Decision: Ultra-Simple Icons
The initial icon design was too complex with multiple elements. For small display sizes, the final design is just:
- A rounded rectangle (document)
- Two horizontal lines (text)

This ensures visibility and recognition even at the smallest sizes.

## MVP Architecture Insights

### 1. No Sidebars Policy
During the MVP stage, all layouts follow a simple vertical flow. The original `all-insights` section had an embedded sidebar with search and filters, violating this principle. Created alternative sections:
- `latest-insights-carousel` - No sidebar, uses carousel
- `latest-insights-grid` - No sidebar, simple grid
- `simple-search` - Standalone search (optional)

### 2. Modular Section Control
Every section can be toggled on/off via the page's sections array:
```yaml
sections:
  - breadcrumbs
  - hero
  - impact
  - featured-article         # Most recent or featured article
  # - simple-search          # Optional search box
  - category-navigation
  - category-highlights
  - latest-insights-carousel  # Latest insights in carousel
  - contact-cta
```

### 3. Terminology Matters
Changed from "All Insights" to "Latest Insights" to better align with Brandmine's mission of providing fresh, timely content. This emphasizes currency over completeness.

## Technical Decisions

### CSS-Based Carousel Benefits
1. **Native scrolling** - Works perfectly on all devices
2. **Touch-friendly** - Swipe gestures work automatically
3. **No complex math** - Browser handles positioning
4. **Accessibility** - Keyboard navigation works by default
5. **Performance** - No JavaScript calculations on scroll

### Icon System Extensibility
The icon system's architecture made adding a new icon straightforward:
1. Data-driven icon selection
2. Central icon component with clear extension points
3. SVG-first approach for scalability
4. Fallback handling for unknown icons

## Files Modified

### Created
- `_includes/pages/insights/latest-insights-carousel.html`
- `_includes/pages/insights/latest-insights-grid.html`
- `_includes/pages/insights/simple-search.html`
- `assets/css/pages/insights/latest-insights-carousel.scss`
- `assets/css/pages/insights/latest-insights-grid.scss`
- `assets/css/pages/insights/simple-search.scss`
- `assets/js/pages/insights/insights-carousel-scroll.js`
- `_includes/components/icons/company-news.svg`

### Modified
- `pages/en/insights.md` (switched to latest-insights-carousel)
- `pages/ru/insights.md` (switched to latest-insights-carousel)
- `pages/zh/insights.md` (switched to latest-insights-carousel)
- `_layouts/insights.html` (updated script reference)
- `_includes/components/icons/icon.html` (added company-news recognition)
- `assets/css/pages/insights/_index.scss` (removed recent-insights, added new files)

### Deleted/Deprecated
- `recent-insights` component (no longer referenced but kept for backward compatibility)
- Complex transform-based carousel JavaScript

## Lessons Learned

1. **Start Simple**: The CSS-based scrolling solution was simpler and more robust than complex JavaScript transforms
2. **Check Existing Architecture**: The icon system was already extensible; we just needed to use it
3. **MVP Discipline**: Removing sidebars and keeping linear flow makes maintenance much easier
4. **Semantic Naming**: "Latest Insights" better communicates freshness than "All Insights"
5. **Small Icons Need Simple Designs**: For 16-24px display, every pixel counts

## Next Steps

### Immediate
- Monitor carousel performance on various devices
- Ensure Company News icon displays correctly in all languages
- Test scroll behavior with different numbers of insights

### Future Considerations
- Consider lazy loading for carousel items beyond initial view
- Add keyboard navigation enhancement to scroll-based carousel
- Create icon guidelines document for consistent simplicity

## Summary

This session successfully resolved two distinct issues while maintaining MVP simplicity. The carousel now uses native browser capabilities instead of complex JavaScript, and the icon system proved its extensibility by easily accommodating a 5th category. Both solutions align with the "logic light" architecture principle of preferring simple, maintainable solutions over complex implementations.