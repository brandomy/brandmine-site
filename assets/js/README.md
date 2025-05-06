# Brandmine JavaScript Directory

This directory contains all JavaScript files for the Brandmine website. The JavaScript follows a modular, progressive enhancement approach that ensures core functionality works without JS while providing enhanced interactions where available.

## Directory Structure

```
js/
├── brand-filtering.js     # Brand search, filter, and sort functionality
├── header.js              # Header behavior, mobile menu, language switching
├── premium-content.js     # Premium content handling and access
└── styleguide.js          # Style guide interactive functionality
```

## JavaScript Philosophy

The Brandmine JavaScript follows these core principles:

1. **Progressive Enhancement**: Ensure basic functionality works without JavaScript, then enhance with JS
2. **Modular Organization**: Each file addresses a specific functional area
3. **Vanilla JavaScript**: No dependencies on frameworks like jQuery or React
4. **Unobtrusive JS**: Behavior is separated from structure and presentation
5. **Accessibility**: All interactive elements are fully accessible via keyboard and screen readers
6. **Performance**: Scripts are optimized for fast loading and execution

## File Purposes

### brand-filtering.js

Handles the dynamic filtering, sorting, and searching of brand listings:

**Key Features:**
- Text search with real-time filtering
- Multi-dimension filtering (sectors, markets, attributes, signals)
- Sorting functionality (name, sector, country, date)
- Pagination and "load more" functionality
- URL parameter handling for shareable filtered views
- Mobile-friendly filter interface

**Usage:**
```html
<!-- Filter Controls -->
<div class="search-filter" data-filter-target="brands-container">
  <!-- Filter controls here -->
</div>

<!-- Brand Container (filtered results appear here) -->
<div id="brands-container" class="brands__grid">
  <!-- Brand cards here -->
</div>

<!-- Include the script -->
<script src="{{ '/assets/js/brand-filtering.js' | relative_url }}"></script>
```

### header.js

Manages the site header behavior, especially on mobile devices:

**Key Features:**
- Mobile menu toggle functionality
- Sticky header on scroll
- Submenu handling for navigation dropdowns
- Language switcher interaction
- Header search box functionality

**Usage:**
```html
<!-- Header element with necessary data attributes -->
<header class="header" data-sticky="true">
  <!-- Header content here -->
  
  <!-- Mobile menu toggle button -->
  <button class="mobile-menu-toggle" aria-expanded="false" aria-controls="main-navigation">
    <span class="sr-only">Toggle menu</span>
    <span class="mobile-menu-toggle__icon"></span>
  </button>
  
  <!-- Navigation menu -->
  <nav id="main-navigation" class="main-navigation">
    <!-- Navigation items -->
  </nav>
</header>

<!-- Include the script at the end of the body -->
<script src="{{ '/assets/js/header.js' | relative_url }}"></script>
```

### premium-content.js

Handles premium content access and functionality:

**Key Features:**
- Premium content visibility toggling
- Premium feature access control
- Premium indicator display
- Premium registration/login prompts
- Integration with user authentication

**Usage:**
```html
<!-- Premium content section -->
<div class="premium-content" data-premium-id="brand-signals-section">
  <!-- Premium content here -->
</div>

<!-- Premium indicator -->
<span class="premium-indicator">Premium</span>

<!-- Include the script -->
<script src="{{ '/assets/js/premium-content.js' | relative_url }}"></script>
```

### styleguide.js

Powers the interactive elements in the style guide documentation:

**Key Features:**
- Code example display with syntax highlighting
- Interactive component demonstrations
- Color palette and token visualization
- Responsive breakpoint indicators
- Dark/light mode toggle for style guide

**Usage:**
```html
<!-- Only include on style guide pages -->
{% if page.layout == 'styleguide' %}
<script src="{{ '/assets/js/styleguide.js' | relative_url }}"></script>
{% endif %}
```

## Implementation Patterns

### Event Delegation

The JavaScript uses event delegation for optimal performance, especially with dynamic content:

```javascript
// Event delegation example
document.addEventListener('DOMContentLoaded', function() {
  // Instead of attaching to each button
  document.body.addEventListener('click', function(event) {
    // Find closest matching element
    const filterButton = event.target.closest('.filter-button');
    
    if (filterButton) {
      // Handle filter button click
      const filterType = filterButton.dataset.filterType;
      const filterValue = filterButton.dataset.filterValue;
      
      // Apply the filter
      applyFilter(filterType, filterValue);
      
      // Update UI state
      updateActiveFilters();
    }
  });
});
```

### Data Attributes

Data attributes are used for configuration and state management:

```javascript
// Reading data attributes
function initializeFilter() {
  const filterContainer = document.querySelector('.search-filter');
  
  if (filterContainer) {
    // Get configuration from data attributes
    const targetId = filterContainer.dataset.filterTarget;
    const defaultSort = filterContainer.dataset.defaultSort || 'name';
    const itemsPerPage = parseInt(filterContainer.dataset.itemsPerPage || '20', 10);
    
    // Initialize with configuration
    // ...
  }
}
```

### Module Pattern

JavaScript is organized using the module pattern for encapsulation:

```javascript
// Module pattern example
const BrandFilter = (function() {
  // Private variables
  let activeFilters = {};
  let currentSort = 'name';
  let currentPage = 1;
  
  // Private methods
  function applyFilters() {
    // Implementation...
  }
  
  // Public API
  return {
    initialize: function() {
      // Setup code...
    },
    addFilter: function(type, value) {
      // Add filter and apply...
    },
    removeFilter: function(type, value) {
      // Remove filter and apply...
    },
    setSort: function(sortType) {
      // Set sort type and apply...
    }
  };
})();

// Usage
document.addEventListener('DOMContentLoaded', function() {
  BrandFilter.initialize();
});
```

### Responsive Design Support

JavaScript components adapt to different screen sizes:

```javascript
// Responsive behavior adaptation
function setupResponsiveUI() {
  // Check viewport width
  const isMobile = window.matchMedia('(max-width: 767px)').matches;
  
  if (isMobile) {
    // Mobile-specific setup
    setupMobileFilters();
  } else {
    // Desktop-specific setup
    setupDesktopFilters();
  }
  
  // Rerun on resize 
  window.addEventListener('resize', debounce(function() {
    // Check if view changed between mobile and desktop
    const newIsMobile = window.matchMedia('(max-width: 767px)').matches;
    
    if (newIsMobile !== isMobile) {
      // Reinitialize for the new view
      isMobile = newIsMobile;
      
      if (isMobile) {
        setupMobileFilters();
      } else {
        setupDesktopFilters();
      }
    }
  }, 250));
}
```

### Utility Functions

Common utility functions are shared across scripts:

```javascript
// Debounce function for resize events
function debounce(func, wait) {
  let timeout;
  return function() {
    const context = this;
    const args = arguments;
    clearTimeout(timeout);
    timeout = setTimeout(function() {
      func.apply(context, args);
    }, wait);
  };
}

// Local storage helper
const Storage = {
  set: function(key, value) {
    try {
      localStorage.setItem(`brandmine_${key}`, JSON.stringify(value));
      return true;
    } catch (e) {
      console.error('Local storage error:', e);
      return false;
    }
  },
  
  get: function(key, defaultValue = null) {
    try {
      const value = localStorage.getItem(`brandmine_${key}`);
      return value ? JSON.parse(value) : defaultValue;
    } catch (e) {
      console.error('Local storage error:', e);
      return defaultValue;
    }
  }
};
```

## MapLibre Integration

For location-based brand visualization, MapLibre is integrated:

```javascript
// Map initialization 
function initializeBrandMap() {
  // Check if map element and coordinates exist
  const mapElement = document.getElementById('brandLocationMap');
  
  if (mapElement && mapElement.dataset.lat && mapElement.dataset.lng) {
    const lat = parseFloat(mapElement.dataset.lat);
    const lng = parseFloat(mapElement.dataset.lng);
    const brandName = mapElement.dataset.name;
    
    // Initialize map if MapLibre is available 
    if (typeof maplibregl !== 'undefined') {
      const map = new maplibregl.Map({
        container: 'brandLocationMap',
        style: 'https://tiles.stadiamaps.com/styles/alidade_smooth.json?api_key={{ site.stadia_maps_api_key }}',
        center: [lng, lat],
        zoom: 7
      });
      
      // Add controls and markers
      map.addControl(new maplibregl.NavigationControl());
      
      new maplibregl.Marker()
        .setLngLat([lng, lat])
        .setPopup(new maplibregl.Popup().setHTML(`<h3>${brandName}</h3>`))
        .addTo(map);
    } else {
      // Fallback if MapLibre is not available
      mapElement.innerHTML = `<div class="map-placeholder">
        <p>Map showing ${brandName} at coordinates ${lat}, ${lng}</p>
        <p>Interactive map loading...</p>
      </div>`;
    }
  }
}
```

## Multilingual Support

JavaScript includes special handling for multilingual content:

```javascript
// Language handling example
const languageSupport = {
  // Current language from html lang attribute
  getCurrentLanguage: function() {
    return document.documentElement.lang || 'en';
  },
  
  // Language-specific text elements
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
  },
  
  // Language-specific date formatting
  formatDate: function(dateString) {
    const date = new Date(dateString);
    const lang = this.getCurrentLanguage();
    
    const options = { 
      year: 'numeric', 
      month: 'long', 
      day: 'numeric' 
    };
    
    return date.toLocaleDateString(this.getLanguageCode(lang), options);
  },
  
  // Convert internal language code to locale code
  getLanguageCode: function(lang) {
    const localeMap = {
      en: 'en-US',
      ru: 'ru-RU',
      zh: 'zh-CN'
    };
    
    return localeMap[lang] || 'en-US';
  }
};
```

## Accessibility Features

JavaScript enhances accessibility through:

```javascript
// Focus management for modals
function openModal(modalId) {
  const modal = document.getElementById(modalId);
  
  if (!modal) return;
  
  // Store last active element to restore focus later
  lastActiveElement = document.activeElement;
  
  // Show modal
  modal.classList.add('modal--active');
  modal.setAttribute('aria-hidden', 'false');
  
  // Set focus to first focusable element
  const focusableElements = modal.querySelectorAll('button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])');
  
  if (focusableElements.length) {
    focusableElements[0].focus();
  }
  
  // Trap focus within modal
  modal.addEventListener('keydown', trapFocus);
}

// Trap focus in modal
function trapFocus(e) {
  const modal = e.currentTarget;
  const focusableElements = modal.querySelectorAll('button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])');
  
  const firstElement = focusableElements[0];
  const lastElement = focusableElements[focusableElements.length - 1];
  
  // Handle tab key navigation
  if (e.key === 'Tab') {
    if (e.shiftKey && document.activeElement === firstElement) {
      e.preventDefault();
      lastElement.focus();
    } else if (!e.shiftKey && document.activeElement === lastElement) {
      e.preventDefault();
      firstElement.focus();
    }
  }
  
  // Close on escape
  if (e.key === 'Escape') {
    closeModal(modal.id);
  }
}
```

## Best Practices

### Performance Optimization

1. **Minimize DOM Manipulation**:
   - Batch DOM operations where possible
   - Use document fragments for multiple insertions
   - Avoid layout thrashing by reading then writing

2. **Event Handling Efficiency**:
   - Use event delegation for dynamic elements
   - Debounce resize and scroll handlers
   - Remove event listeners for destroyed elements

3. **Loading Strategy**:
   - Scripts are loaded at the end of the document
   - Critical scripts use `defer` attribute
   - Optional scripts are loaded on demand

### Maintainability

1. **Code Organization**:
   - Organize code using module pattern
   - Keep functions small and focused
   - Use meaningful variable and function names

2. **Comments and Documentation**:
   - Document function purpose and parameters
   - Explain complex logic or unusual approaches
   - Include example usage where helpful

3. **Error Handling**:
   - Gracefully handle script errors
   - Provide fallbacks for missing elements
   - Log useful error messages for debugging

### Cross-Browser Compatibility

1. **Feature Detection**:
   - Check for feature support before using
   - Provide polyfills or fallbacks as needed
   - Test in all major browsers

2. **Browser-Specific Issues**:
   - Document known browser quirks
   - Implement targeted fixes when necessary
   - Avoid browser sniffing

## Adding New JavaScript

When adding new JavaScript functionality:

1. **Determine Scope**:
   - Is it page-specific or site-wide?
   - Should it be a new file or extend existing?

2. **Create File** (if needed):
   - Place in `assets/js/` directory
   - Follow naming conventions (`kebab-case.js`)
   - Include file header documentation

3. **Follow Structure Pattern**:
   - Use module pattern for encapsulation
   - Include initialization on DOMContentLoaded
   - Provide clear public API

4. **Include in Template**:
   - Add script tag at the end of the body
   - Use relative_url filter for proper path
   - Consider conditionally including if page-specific

## Troubleshooting

### Common Issues

1. **Script not running**:
   - Check for JavaScript errors in console
   - Verify script is being loaded
   - Check if element IDs/selectors exist in DOM

2. **Events not firing**:
   - Verify event listeners are attached
   - Check for typos in event names
   - Ensure proper event delegation

3. **Conflicts with other scripts**:
   - Use module pattern to prevent global namespace pollution
   - Check for duplicate IDs in the DOM
   - Verify script execution order

### Debug Tips

```javascript
// Enable debug mode
const DEBUG = true;

// Debug logging
function debug(message, data) {
  if (DEBUG && console) {
    console.log(`[DEBUG] ${message}`, data || '');
  }
}

// Track performance
function measurePerformance(name, fn) {
  if (DEBUG) {
    console.time(name);
    fn();
    console.timeEnd(name);
  } else {
    fn();
  }
}
```

## Related Documentation

- [Main Assets README](../README.md) - Overview of all assets
- [CSS README](../css/README.md) - CSS architecture documentation
- [Component Integration Guide](../../docs/component-integration.md) - How JavaScript integrates with components