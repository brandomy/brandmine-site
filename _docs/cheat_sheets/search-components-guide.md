# Search Components Guide

This guide covers all search components in the Brandmine website, following the "logic light" principle where CSS structure mirrors the includes organization.

## 📁 Structure

```
_includes/components/search/         CSS: assets/css/components/search/
├── simple-search.html              ↔ search-box.scss
├── search-filter.html              ↔ search-filter.scss
└── (advanced search planned)       ↔ advanced-search.scss
```

## 🎯 Component Overview

### 1. Search Box (`search-box.scss`)
**Purpose**: Basic search input with simple styling for quick searches.

**Include**: `simple-search.html`

**Key Classes**:
- `.search-box` - Main search container
- `.search-box__input` - Search input field
- `.search-box__button` - Search submit button
- `.search-box--compact` - Smaller variant
- `.search-box--full-width` - Full-width variant

**Usage**:
```liquid
{% include components/search/simple-search.html 
   search_id="brand-search"
   search_placeholder="Search brands..."
   search_action="/search/"
   search_method="GET" %}
```

**Features**:
- Clean, minimal design
- Responsive layout
- Icon integration support
- Keyboard shortcut support (Ctrl+K)

### 2. Search Filter (`search-filter.scss`)
**Purpose**: Advanced multi-dimensional filtering system for brands, founders, and insights.

**Include**: `search-filter.html`

**Key Classes**:
- `.search-filter` - Main filter container
- `.search-filter__header` - Filter section header
- `.search-filter__group` - Individual filter group
- `.search-filter__controls` - Action buttons area
- `.filter-groups` - Multi-column grid container
- `.filter-results` - Results display area

**Multi-Column Layout**:
```scss
.filter-groups {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-6);
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
  }
}
```

**Filter Group Structure**:
- **Sectors**: Industry categories (mint green/olive styling)
- **Markets**: Regional focus (light blue styling)
- **Attributes**: Brand qualities (light orange styling)
- **Signals**: Growth indicators (light purple styling)

**Usage**:
```liquid
{% include components/search/search-filter.html 
   filter_target="brands"
   show_view_toggle=true
   show_sort_options=true
   enable_live_search=true %}
```

### 3. Advanced Search (`advanced-search.scss`)
**Purpose**: Complex search interface with multiple criteria and operators.

**Status**: Planned component for future implementation

**Planned Features**:
- Boolean search operators (AND, OR, NOT)
- Date range filtering
- Numeric range sliders
- Saved search functionality
- Export search results

## 🎨 Visual Taxonomy System

Search components implement Brandmine's visual taxonomy with consistent color coding:

```scss
/* Dimension color coding */
.filter-tag--sector {
  background-color: var(--olive-100);
  color: var(--olive-900);
  border: 1px solid var(--olive-200);
}

.filter-tag--market {
  background-color: var(--sky-100);
  color: var(--sky-900);
  border: 1px solid var(--sky-200);
}

.filter-tag--attribute {
  background-color: var(--secondary-100);
  color: var(--secondary-900);
  border: 1px solid var(--secondary-200);
}

.filter-tag--signal {
  background-color: var(--accent-100);
  color: var(--accent-900);
  border: 1px solid var(--accent-200);
}
```

## 🔧 JavaScript Integration

### Search Filter Script (`search-filter.js`)

**Key Functions**:
- `initializeSearch()` - Sets up search interface
- `handleFilterChange()` - Processes filter selections
- `updateResults()` - Updates display based on filters
- `clearAllFilters()` - Resets all filter states
- `toggleView()` - Switches between grid/list view
- `exportResults()` - Export filtered results

**Event Handling**:
```javascript
// Filter change events
document.addEventListener('change', '[data-filter-type]', handleFilterChange);

// Search input events
document.addEventListener('input', '.search-input', debounce(handleSearch, 300));

// View toggle events
document.addEventListener('click', '.view-toggle', handleViewToggle);
```

### Data Sources

Search components pull from these JSON endpoints:
- `/assets/data/brands.json` - Brand data with full taxonomy
- `/assets/data/founders.json` - Founder profiles and metadata
- `/assets/data/insights.json` - Insights articles and categories
- `/assets/data/dimensions.json` - Dimension definitions

## 📱 Responsive Design

### Breakpoint Behavior:

**Mobile (≤768px)**:
- Single column filter layout
- Collapsible filter groups
- Touch-optimized controls
- Simplified view options

**Tablet (769px-991px)**:
- Two-column filter layout
- Expandable filter sections
- Enhanced touch targets

**Desktop (≥992px)**:
- Multi-column filter layout (up to 3 columns)
- Hover interactions
- Keyboard navigation support
- Advanced view options

### Mobile-First CSS:
```scss
.search-filter {
  // Mobile styles first
  padding: var(--space-4);
  
  @media (min-width: 768px) {
    // Tablet styles
    padding: var(--space-6);
    display: grid;
    grid-template-columns: 300px 1fr;
  }
  
  @media (min-width: 992px) {
    // Desktop styles
    grid-template-columns: 350px 1fr;
  }
}
```

## 🔍 Search Implementation Examples

### Basic Brand Search
```liquid
<!-- Simple search for brand names -->
<div class="brand-search-container">
  {% include components/search/simple-search.html 
     search_id="brand-quick-search"
     search_placeholder="Find brands..."
     search_action="/brands/"
     search_class="search-box--full-width" %}
</div>
```

### Advanced Brand Filtering
```liquid
<!-- Multi-dimensional brand discovery -->
<section class="brand-discovery">
  <div class="search-container">
    {% include components/search/search-filter.html 
       filter_target="brands"
       filter_collections=site.brands
       show_view_toggle=true
       show_sort_options=true
       enable_export=true
       default_view="grid" %}
  </div>
</section>
```

### Insight Search with Categories
```liquid
<!-- Insights search with category filtering -->
<div class="insights-search">
  {% include components/search/search-filter.html 
     filter_target="insights"
     filter_collections=site.insights
     show_categories=true
     show_date_filter=true
     enable_live_search=true %}
</div>
```

## 🎛️ Configuration Options

### Search Filter Configuration
```liquid
{% assign search_config = {
  "target": "brands",
  "collections": site.brands,
  "filters": {
    "sectors": true,
    "markets": true,
    "attributes": true,
    "signals": true
  },
  "display": {
    "view_toggle": true,
    "sort_options": true,
    "result_count": true,
    "pagination": true
  },
  "features": {
    "live_search": true,
    "export": true,
    "save_search": false
  }
} %}

{% include components/search/search-filter.html config=search_config %}
```

## 🔧 Customization Guide

### Adding New Filter Types
1. **Update the dimensions system** in `_dimensions/`
2. **Add new filter group** in `search-filter.html`
3. **Create corresponding styles** in `search-filter.scss`
4. **Update JavaScript logic** in `search-filter.js`
5. **Add color coding** following the visual taxonomy

### Creating Custom Search Layouts
```scss
.custom-search-layout {
  .search-filter {
    // Override default layout
    grid-template-columns: 1fr;
    
    .filter-groups {
      // Custom filter arrangement
      grid-template-columns: repeat(4, 1fr);
      gap: var(--space-4);
    }
  }
}
```

### Integrating with Collections
```liquid
<!-- For custom collections -->
{% assign filtered_items = collection | where: "sector", filter_sector %}
{% if filter_market %}
  {% assign filtered_items = filtered_items | where: "market", filter_market %}
{% endif %}
```

## 📊 Performance Optimization

### Search Performance Tips:
1. **Use client-side filtering** for small datasets (< 500 items)
2. **Implement server-side search** for large datasets
3. **Debounce search input** to avoid excessive API calls
4. **Cache search results** in sessionStorage
5. **Lazy load search data** when possible

### JavaScript Optimization:
```javascript
// Debounced search function
const debouncedSearch = debounce((query) => {
  performSearch(query);
}, 300);

// Efficient filtering
const filterBrands = (brands, filters) => {
  return brands.filter(brand => {
    return Object.entries(filters).every(([key, value]) => {
      if (!value) return true;
      return brand[key] === value;
    });
  });
};
```

## ✅ Best Practices

### Search UX:
1. **Provide immediate feedback** for search actions
2. **Show result counts** to set expectations
3. **Implement clear all filters** functionality
4. **Use progressive disclosure** for advanced options
5. **Maintain search state** in URL parameters
6. **Provide search suggestions** when possible

### Accessibility:
1. **Use semantic HTML** for search forms
2. **Provide clear labels** for all filter options
3. **Implement keyboard navigation** for all controls
4. **Use ARIA attributes** for dynamic content
5. **Announce search results** to screen readers

### Performance:
1. **Minimize DOM manipulation** during filtering
2. **Use CSS transforms** for smooth animations
3. **Implement virtual scrolling** for large result sets
4. **Optimize images** in search results
5. **Use web workers** for complex filtering operations

## 🐛 Troubleshooting

### Common Issues:

**Search not working**:
- Check JavaScript console for errors
- Verify JSON data is loading correctly
- Ensure filter event handlers are attached

**Filters not updating results**:
- Check filter logic in JavaScript
- Verify data attribute names match
- Test filter combinations individually

**Mobile layout issues**:
- Test responsive breakpoints
- Check CSS Grid support
- Verify touch event handling

**Performance problems**:
- Profile JavaScript execution
- Check for memory leaks in event handlers
- Optimize filter algorithms

### Debug Tools:
```javascript
// Search debugging utilities
window.searchDebug = {
  logFilters: () => console.log(currentFilters),
  logResults: () => console.log(currentResults),
  testFilter: (key, value) => testSingleFilter(key, value)
};
```