# Brandmine JavaScript Directory

This directory contains all JavaScript files for the Brandmine website. The JavaScript follows a modular, progressive enhancement approach that ensures core functionality works without JS while providing enhanced interactions where available.

## Directory Structure

```
js/
├── components/           # Reusable UI component scripts
│   ├── custom-forms.js   # Custom contact and newsletter forms
│   ├── founder-carousel.js # Founder carousel navigation
│   ├── header.js         # Header behavior, mobile menu, language switching
│   ├── premium-content.js # Premium content handling and access
│   └── search-filter.js  # Reusable search and filter functionality
├── data/                 # Data processing and generation scripts
│   └── generate-map-data.js # Map data generation utilities
└── pages/                # Page-specific functionality
    ├── about/            # About page scripts (currently empty)
    ├── brand/            # Brand page scripts
    │   ├── brand-filtering.js # Brand search and filtering
    │   ├── brand-map-script.js # Brand location maps
    │   └── gallery.js    # Brand image galleries
    ├── brands/           # Brands listing page scripts
    │   └── brands-filtering.js # Multi-brand search and filtering
    ├── dimension/        # Dimension page scripts
    │   └── dimension-filtering.js # Dimension-specific filtering
    ├── discover/         # Discover page scripts
    │   └── market-map.js # Interactive market maps
    ├── discovery/        # Discovery page scripts
    │   ├── discovery-search.js # Universal search functionality
    │   └── discovery.js  # Discovery page interactions
    ├── founders/         # Founders page scripts
    │   ├── founders-search.js # Founder search and filtering
    │   └── founders.js   # Founders page interactions
    ├── home/             # Homepage scripts
    │   ├── carousels.js  # Homepage carousels
    │   ├── smooth-scroll.js # Smooth scrolling behavior
    │   └── tracking.js   # Analytics and tracking
    ├── insights/         # Insights page scripts
    │   ├── insights-search.js # Advanced insights search
    │   └── simple-insights-search.js # Simple insights search
    ├── search/           # Search page scripts
    │   ├── advanced-search.js # Advanced multi-dimensional search
    │   └── search-results.js # Search results handling
    └── styleguide/       # Style guide scripts
        └── styleguide.js # Style guide interactive functionality
```

## JavaScript Philosophy

The Brandmine JavaScript follows these core principles:

1. **Progressive Enhancement**: Ensure basic functionality works without JavaScript, then enhance with JS
2. **Modular Organization**: Each file addresses a specific functional area
3. **Vanilla JavaScript**: No dependencies on frameworks like jQuery or React
4. **Unobtrusive JS**: Behavior is separated from structure and presentation
5. **Accessibility**: All interactive elements are fully accessible via keyboard and screen readers
6. **Performance**: Scripts are optimized for fast loading and execution

## Component Scripts

### custom-forms.js

Handles custom-built contact and newsletter forms as alternatives to external services:

**Key Features:**
- Real-time validation with visual feedback
- Loading states and success/error handling
- Accessibility features (ARIA labels, screen reader support)
- Multilingual support using translation files
- Multiple form variants (default, inline, minimal, compact)

**Usage:**
```html
{% include components/forms/custom-contact-form.html %}
<script src="{{ '/assets/js/components/custom-forms.js' | relative_url }}"></script>
```

### founder-carousel.js

Powers founder carousel navigation and interactions:

**Key Features:**
- Touch-friendly carousel navigation
- Dot navigation for position tracking
- Responsive behavior for different screen sizes
- Smooth scrolling transitions

### header.js

Manages the site header behavior, especially on mobile devices:

**Key Features:**
- Mobile menu toggle functionality
- Sticky header on scroll
- Submenu handling for navigation dropdowns
- Language switcher interaction
- Header search box functionality

### search-filter.js

Reusable search and filter component for different content types:

**Key Features:**
- Multi-dimensional filtering (sectors, markets, attributes, signals)
- Content type switching (brands, founders, insights, dimensions)
- Filter presets and quick searches
- Sort functionality and view toggles
- Active filter display and management

## Page-Specific Scripts

### Brand Pages

- **brand-filtering.js**: Search and filter functionality for individual brand pages
- **brand-map-script.js**: Interactive maps showing brand locations
- **gallery.js**: Image gallery functionality for brand photos

### Search & Discovery

- **advanced-search.js**: Multi-dimensional search across all content types
- **discovery-search.js**: Universal search for the discovery page
- **insights-search.js**: Advanced search specifically for insights content

### Interactive Elements

- **carousels.js**: Homepage carousel functionality
- **smooth-scroll.js**: Smooth scrolling behavior for navigation
- **tracking.js**: Analytics and user interaction tracking

## Implementation Patterns

### Module Pattern

JavaScript is organized using the module pattern for encapsulation:

```javascript
const SearchFilter = (function() {
  // Private variables
  let activeFilters = {};
  let currentSort = 'relevance';
  let contentType = 'brands';
  
  // Private methods
  function applyFilters() {
    // Implementation...
  }
  
  // Public API
  return {
    initialize: function(options) {
      // Setup code...
    },
    addFilter: function(type, value) {
      // Add filter and apply...
    },
    clearFilters: function() {
      // Clear all filters...
    }
  };
})();
```

### Event Delegation

The JavaScript uses event delegation for optimal performance:

```javascript
document.addEventListener('DOMContentLoaded', function() {
  document.body.addEventListener('click', function(event) {
    const filterButton = event.target.closest('.filter-button');
    
    if (filterButton) {
      const filterType = filterButton.dataset.filterType;
      const filterValue = filterButton.dataset.filterValue;
      
      SearchFilter.addFilter(filterType, filterValue);
    }
  });
});
```

### Progressive Enhancement

All scripts check for required elements before initialization:

```javascript
function initializeComponent() {
  const container = document.querySelector('.search-filter');
  
  if (!container) {
    // Component not present on this page, exit gracefully
    return;
  }
  
  // Component is present, initialize functionality
  setupEventListeners();
  loadInitialData();
}
```

## Multilingual Support

JavaScript includes special handling for multilingual content:

```javascript
const LanguageSupport = {
  getCurrentLanguage: function() {
    return document.documentElement.lang || 'en';
  },
  
  getTranslation: function(key) {
    const lang = this.getCurrentLanguage();
    const translations = {
      en: {
        noResults: 'No results found',
        loadMore: 'Load More',
        searching: 'Searching...'
      },
      ru: {
        noResults: 'Результаты не найдены',
        loadMore: 'Загрузить еще',
        searching: 'Поиск...'
      },
      zh: {
        noResults: '未找到结果',
        loadMore: '加载更多',
        searching: '搜索中...'
      }
    };
    
    return translations[lang][key] || translations.en[key];
  }
};
```

## MapLibre Integration

For location-based visualizations, MapLibre is integrated:

```javascript
function initializeBrandMap() {
  const mapElement = document.getElementById('brandLocationMap');
  
  if (mapElement && typeof maplibregl !== 'undefined') {
    const lat = parseFloat(mapElement.dataset.lat);
    const lng = parseFloat(mapElement.dataset.lng);
    
    const map = new maplibregl.Map({
      container: 'brandLocationMap',
      style: 'https://tiles.stadiamaps.com/styles/alidade_smooth.json?api_key={{ site.stadia_maps_api_key }}',
      center: [lng, lat],
      zoom: 7
    });
    
    map.addControl(new maplibregl.NavigationControl());
    
    new maplibregl.Marker()
      .setLngLat([lng, lat])
      .addTo(map);
  }
}
```

## Accessibility Features

All JavaScript enhances accessibility through:

- Focus management for modal dialogs
- Keyboard navigation support
- Screen reader announcements
- ARIA state updates
- Proper heading hierarchy maintenance

## Performance Optimization

1. **Efficient DOM Manipulation**:
   - Batch DOM operations where possible
   - Use document fragments for multiple insertions
   - Avoid layout thrashing

2. **Event Handling**:
   - Use event delegation for dynamic elements
   - Debounce resize and scroll handlers
   - Remove event listeners when components are destroyed

3. **Loading Strategy**:
   - Scripts are loaded with `defer` attribute
   - Page-specific scripts only load on relevant pages
   - Optional functionality loads on demand

## Adding New JavaScript

When adding new JavaScript functionality:

1. **Determine Scope**:
   - Component-level: Place in `components/`
   - Page-specific: Place in `pages/[page-name]/`
   - Data processing: Place in `data/`

2. **Follow Naming Conventions**:
   - Use `kebab-case.js` for filenames
   - Match functionality to filename purpose

3. **Structure Pattern**:
   - Use module pattern for encapsulation
   - Include initialization on DOMContentLoaded
   - Provide clear public API
   - Handle missing elements gracefully

4. **Include in Template**:
   ```html
   <script src="{{ '/assets/js/[category]/[filename].js' | relative_url }}" defer></script>
   ```

## File Organization by Function

### Search & Filtering
- `components/search-filter.js` - Reusable search component
- `pages/search/advanced-search.js` - Advanced multi-dimensional search
- `pages/brands/brands-filtering.js` - Brand-specific filtering
- `pages/founders/founders-search.js` - Founder-specific search
- `pages/insights/insights-search.js` - Insight-specific search
- `pages/discovery/discovery-search.js` - Universal discovery search

### User Interface
- `components/header.js` - Header and navigation
- `components/custom-forms.js` - Form interactions
- `components/founder-carousel.js` - Carousel functionality
- `pages/home/carousels.js` - Homepage carousels
- `pages/styleguide/styleguide.js` - Style guide interactions

### Maps & Location
- `pages/brand/brand-map-script.js` - Individual brand maps
- `pages/discover/market-map.js` - Market overview maps
- `data/generate-map-data.js` - Map data utilities

### Content Display
- `pages/brand/gallery.js` - Image galleries
- `components/premium-content.js` - Premium content access
- `pages/home/tracking.js` - Analytics tracking

## Related Documentation

- [Main Assets README](../README.md) - Overview of all assets
- [CSS README](../css/README.md) - CSS architecture documentation
- [CLAUDE.md](../../CLAUDE.md) - Project architecture and conventions