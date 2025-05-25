# Brandmine Search & Filters Setup Cheat Sheet

## Overview
This guide covers how to set up and troubleshoot search and filtering functionality across different pages in the Brandmine Jekyll site.

---

## 🔍 Search System Architecture

### Search Components Overview
```
assets/js/
├── advanced-search.js         # Site-wide advanced search
├── brand-filtering.js         # Brands page filtering
├── insights-search.js         # Insights page search
├── founders-search.js         # Founders page search  
├── discovery-search.js        # Discovery page search
└── search-filter.js           # Generic filter component

_includes/components/search/
├── search-filter.html         # Filter interface component
└── simple-search.html         # Basic search input

_includes/pages/{page}/
├── search.html               # Page-specific search implementation
└── filter-interface.html    # Page-specific filter interface
```

### Data Sources
```
search.json                   # Site-wide search index
assets/data/brands.json      # Brand data for filtering
assets/data/founders.json    # Founder data for filtering  
assets/data/insights.json    # Insights data for filtering
assets/data/dimensions.json  # Taxonomy data for filters
```

---

## 🎯 Page-Specific Search Setup

### 1. Brands Page Search
**Location**: `/en/brands/`
**Files**:
- `_includes/pages/brands/search.html`
- `assets/js/brand-filtering.js`
- `assets/js/pages/brands/brands-filtering.js`

**Setup**:
```liquid
<!-- In brands page layout -->
{% include pages/brands/search.html %}
{% include pages/brands/filter-interface.html %}
{% include pages/brands/brands-grid.html %}
```

**JavaScript Integration**:
```html
<script src="{{ '/assets/js/pages/brands/brands-filtering.js' | relative_url }}"></script>
```

**Filter Categories**:
- **Text Search**: Brand names and descriptions
- **Sectors**: Taxonomy-based filtering
- **Markets**: Geographic filtering 
- **Attributes**: Brand characteristics
- **Signals**: Business indicators

### 2. Insights Page Search
**Location**: `/en/insights/`
**Files**:
- `_includes/pages/insights/insights-search.html`
- `assets/js/insights-search.js`

**Setup**:
```liquid
<!-- In insights page layout -->
{% include pages/insights/insights-search.html %}
```

**Filter Categories**:
- **Text Search**: Title and content
- **Category**: brand-spotlight, founders-journey, etc.
- **Date Range**: Recent, last month, last year
- **Reading Time**: Short, medium, long articles
- **Markets**: Geographic focus

### 3. Founders Page Search
**Location**: `/en/founders/`
**Files**:
- `_includes/pages/founders/filter-interface.html`
- `assets/js/founders-search.js`

**Filter Categories**:
- **Text Search**: Founder names and bios
- **Markets**: Founder locations
- **Expertise**: Areas of specialization
- **Generation**: 1st, 2nd, 3rd generation
- **Cross-border**: International experience

### 4. Discovery Page Search
**Location**: `/en/discovery/`
**Files**:
- `_includes/pages/discovery/universal-search.html`
- `assets/js/discovery-search.js`

**Features**:
- **Universal Search**: All content types
- **Type Filtering**: Brands, founders, insights, dimensions
- **Smart Suggestions**: Auto-complete functionality

---

## 🛠️ Search Implementation Guide

### Basic Search Input
```liquid
{% include components/search/simple-search.html 
   id="page-search"
   placeholder="Search brands, founders, insights..."
   class_name="search--large" %}
```

### Advanced Filter Interface
```liquid
<div class="search-interface">
  <!-- Text Search -->
  <div class="search-input-wrapper">
    <input type="text" id="search-input" placeholder="Search...">
    <button type="button" id="search-button">Search</button>
  </div>
  
  <!-- Filters -->
  <div class="search-filters">
    <!-- Sector Filter -->
    <div class="filter-group">
      <h4>Sectors</h4>
      {% for sector in site.data.dimensions.sectors %}
        <label class="filter-option">
          <input type="checkbox" name="sector" value="{{ sector.slug }}">
          {{ sector.name[page.lang] }}
        </label>
      {% endfor %}
    </div>
    
    <!-- Market Filter -->
    <div class="filter-group">
      <h4>Markets</h4>
      {% for market in site.data.dimensions.markets %}
        <label class="filter-option">
          <input type="checkbox" name="market" value="{{ market.slug }}">
          {{ market.name[page.lang] }}
        </label>
      {% endfor %}
    </div>
  </div>
  
  <!-- Results Container -->
  <div id="search-results"></div>
  
  <!-- Load More -->
  <div id="load-more-container" style="display: none;">
    <button type="button" id="load-more-btn">Load More Results</button>
  </div>
</div>
```

### JavaScript Search Class
```javascript
class PageSearch {
  constructor() {
    this.searchData = [];
    this.filteredResults = [];
    this.currentPage = 1;
    this.resultsPerPage = 12;
    this.activeFilters = {
      search: '',
      sector: [],
      market: [],
      attribute: [],
      signal: []
    };
    
    this.init();
  }
  
  async init() {
    await this.loadData();
    this.setupEventListeners();
    this.performSearch();
  }
  
  async loadData() {
    // Load search data
    const response = await fetch('/search.json');
    this.searchData = await response.json();
  }
  
  setupEventListeners() {
    // Search input
    document.getElementById('search-input').addEventListener('input', 
      this.debounce(() => this.performSearch(), 300)
    );
    
    // Filter checkboxes
    document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
      checkbox.addEventListener('change', () => this.performSearch());
    });
    
    // Clear filters
    document.getElementById('clear-filters').addEventListener('click', 
      () => this.clearFilters()
    );
  }
  
  performSearch() {
    this.updateActiveFilters();
    this.filterResults();
    this.displayResults();
    this.updateURL();
  }
}

// Initialize search when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  new PageSearch();
});
```

---

## 🎛️ Filter Configuration

### Filter Types

**Text Search**:
```javascript
const searchTerm = this.activeFilters.search.toLowerCase();
results = results.filter(item => 
  item.title.toLowerCase().includes(searchTerm) ||
  item.description.toLowerCase().includes(searchTerm)
);
```

**Taxonomy Filters**:
```javascript
if (this.activeFilters.sector.length > 0) {
  results = results.filter(item => 
    item.sectors.some(sector => this.activeFilters.sector.includes(sector))
  );
}
```

**Date Range Filters**:
```javascript
if (this.activeFilters.date_range !== 'all') {
  const cutoffDate = this.getDateRange(this.activeFilters.date_range);
  results = results.filter(item => new Date(item.date) >= cutoffDate);
}
```

**Multi-select Filters**:
```javascript
// Get selected values from checkboxes
this.activeFilters.sector = Array.from(
  document.querySelectorAll('input[name="sector"]:checked')
).map(cb => cb.value);
```

### Dynamic Filter Options
```liquid
<!-- Generate filter options from data -->
{% assign sectors = site.brands | map: 'sectors' | join: ',' | split: ',' | uniq | sort %}
{% for sector in sectors %}
  <label class="filter-option">
    <input type="checkbox" name="sector" value="{{ sector }}">
    {{ site.data.translations[page.lang].sectors[sector] | default: sector }}
  </label>
{% endfor %}
```

---

## 🔗 URL Parameter Integration

### Reading URL Parameters
```javascript
function getURLParams() {
  const urlParams = new URLSearchParams(window.location.search);
  
  // Set search input
  const searchQuery = urlParams.get('q');
  if (searchQuery) {
    document.getElementById('search-input').value = searchQuery;
    this.activeFilters.search = searchQuery;
  }
  
  // Set filter checkboxes
  const sectorParam = urlParams.get('sector');
  if (sectorParam) {
    this.activeFilters.sector = sectorParam.split(',');
    sectorParam.split(',').forEach(sector => {
      const checkbox = document.querySelector(`input[name="sector"][value="${sector}"]`);
      if (checkbox) checkbox.checked = true;
    });
  }
}
```

### Updating URL Parameters
```javascript
function updateURL() {
  const params = new URLSearchParams();
  
  // Add search query
  if (this.activeFilters.search) {
    params.set('q', this.activeFilters.search);
  }
  
  // Add filter parameters
  if (this.activeFilters.sector.length > 0) {
    params.set('sector', this.activeFilters.sector.join(','));
  }
  
  if (this.activeFilters.market.length > 0) {
    params.set('market', this.activeFilters.market.join(','));
  }
  
  // Update URL without page reload
  const newURL = window.location.pathname + '?' + params.toString();
  window.history.replaceState({}, '', newURL);
}
```

---

## 🎨 Search Results Display

### Results Container
```html
<div id="search-results" class="search-results">
  <div class="search-results__header">
    <h3>Search Results</h3>
    <span id="results-count">0 results</span>
  </div>
  
  <div class="search-results__controls">
    <div class="view-toggle">
      <button id="grid-view" class="view-toggle-btn active">Grid</button>
      <button id="list-view" class="view-toggle-btn">List</button>
    </div>
    
    <select id="sort-select" class="sort-select">
      <option value="relevance">Most Relevant</option>
      <option value="date-desc">Newest First</option>
      <option value="date-asc">Oldest First</option>
      <option value="name-asc">A-Z</option>
    </select>
  </div>
  
  <div class="search-results__grid" id="results-container">
    <!-- Results populated by JavaScript -->
  </div>
  
  <div class="search-results__pagination">
    <button id="load-more" class="btn btn--outline">Load More</button>
  </div>
</div>
```

### Result Card Templates
```javascript
function createBrandCard(brand) {
  return `
    <article class="brand-card">
      <div class="brand-card__image">
        <img src="${brand.logo_url}" alt="${brand.name}">
      </div>
      <div class="brand-card__content">
        <h3 class="brand-card__title">${brand.name}</h3>
        <p class="brand-card__description">${brand.description}</p>
        <div class="brand-card__tags">
          ${brand.sectors.map(sector => `<span class="tag tag--sector">${sector}</span>`).join('')}
        </div>
      </div>
      <a href="${brand.url}" class="brand-card__link">View Details</a>
    </article>
  `;
}

function displayResults() {
  const container = document.getElementById('results-container');
  const html = this.filteredResults.map(result => {
    switch(result.type) {
      case 'brand': return createBrandCard(result);
      case 'founder': return createFounderCard(result);
      case 'insight': return createInsightCard(result);
      default: return '';
    }
  }).join('');
  
  container.innerHTML = html;
  
  // Update results count
  document.getElementById('results-count').textContent = 
    `${this.filteredResults.length} results`;
}
```

---

## 🚀 Performance Optimization

### Debounced Search
```javascript
function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

// Use with search input
document.getElementById('search-input').addEventListener('input', 
  this.debounce(() => this.performSearch(), 300)
);
```

### Lazy Loading
```javascript
function setupLazyLoading() {
  const loadMoreBtn = document.getElementById('load-more');
  loadMoreBtn.addEventListener('click', () => {
    this.currentPage++;
    this.loadMoreResults();
  });
}

function loadMoreResults() {
  const startIndex = (this.currentPage - 1) * this.resultsPerPage;
  const endIndex = startIndex + this.resultsPerPage;
  const newResults = this.filteredResults.slice(startIndex, endIndex);
  
  // Append new results to existing ones
  const container = document.getElementById('results-container');
  newResults.forEach(result => {
    container.appendChild(this.createResultElement(result));
  });
}
```

### Search Index Optimization
```javascript
// Pre-process search data for faster searching
function preprocessSearchData(data) {
  return data.map(item => ({
    ...item,
    searchableText: (item.title + ' ' + item.description).toLowerCase(),
    searchTerms: this.extractSearchTerms(item)
  }));
}

function extractSearchTerms(item) {
  // Extract key terms for fuzzy matching
  const terms = [];
  terms.push(...item.title.split(' '));
  terms.push(...item.sectors);
  terms.push(...item.markets);
  return terms.map(term => term.toLowerCase());
}
```

---

## 🐛 Troubleshooting Common Issues

### Search Not Working

**1. Check Data Loading**:
```javascript
// Debug data loading
console.log('Search data loaded:', this.searchData.length, 'items');
console.log('Sample item:', this.searchData[0]);
```

**2. Verify JSON Files**:
```bash
# Check if JSON files exist and are valid
curl -I http://localhost:4000/search.json
curl -I http://localhost:4000/assets/data/brands.json
```

**3. Check Console Errors**:
```javascript
// Add error handling
try {
  await this.loadData();
} catch (error) {
  console.error('Failed to load search data:', error);
  this.showErrorMessage('Search functionality unavailable');
}
```

### Filters Not Applying

**1. Check Filter Event Listeners**:
```javascript
// Debug filter events
document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
  checkbox.addEventListener('change', (e) => {
    console.log('Filter changed:', e.target.name, e.target.value, e.target.checked);
    this.performSearch();
  });
});
```

**2. Verify Active Filters**:
```javascript
// Debug active filters
function performSearch() {
  console.log('Active filters:', this.activeFilters);
  this.filterResults();
  this.displayResults();
}
```

### URL Parameters Not Working

**1. Check URL Parameter Reading**:
```javascript
// Debug URL parameters
function getURLParams() {
  const params = new URLSearchParams(window.location.search);
  console.log('URL parameters:', Object.fromEntries(params));
}
```

**2. Verify URL Updates**:
```javascript
// Debug URL updates
function updateURL() {
  const newURL = this.buildURL();
  console.log('Updating URL to:', newURL);
  window.history.replaceState({}, '', newURL);
}
```

### Performance Issues

**1. Check Data Size**:
```javascript
// Monitor data sizes
console.log('Total items:', this.searchData.length);
console.log('Filtered items:', this.filteredResults.length);
console.log('Memory usage:', performance.memory?.usedJSHeapSize);
```

**2. Profile Search Performance**:
```javascript
// Time search operations
function performSearch() {
  console.time('search');
  this.updateActiveFilters();
  this.filterResults();
  this.displayResults();
  console.timeEnd('search');
}
```

---

## 📱 Mobile & Responsive Considerations

### Mobile Search Interface
```scss
@media (max-width: 768px) {
  .search-interface {
    .search-filters {
      // Stack filters vertically on mobile
      flex-direction: column;
    }
    
    .filter-group {
      // Collapsible filter groups on mobile
      &:not(.active) .filter-options {
        display: none;
      }
    }
  }
  
  .search-results__grid {
    // Single column grid on mobile
    grid-template-columns: 1fr;
  }
}
```

### Touch-Friendly Controls
```html
<!-- Larger touch targets for mobile -->
<button class="filter-toggle filter-toggle--mobile" aria-expanded="false">
  Filters <span class="filter-count">3</span>
</button>

<div class="filter-dropdown" hidden>
  <!-- Filter content here -->
</div>
```

---

## 🔄 Search Index Generation

### Automatic Index Creation
```python
# _scripts/generate_search_index.py
import json
import yaml
from pathlib import Path

def generate_search_index():
    search_data = []
    
    # Process brands
    for brand_file in Path('_brands').glob('**/*.md'):
        with open(brand_file, 'r', encoding='utf-8') as f:
            content = f.read()
            frontmatter, body = content.split('---\n', 2)[1:3]
            data = yaml.safe_load(frontmatter)
            
            search_data.append({
                'type': 'brand',
                'title': data.get('title'),
                'description': data.get('description'),
                'url': data.get('permalink'),
                'sectors': data.get('sectors', []),
                'markets': data.get('markets', []),
                'content': body[:500]  # Truncated content
            })
    
    # Output search index
    with open('search.json', 'w', encoding='utf-8') as f:
        json.dump(search_data, f, ensure_ascii=False, indent=2)
```

### Manual Index Updates
```bash
# Update search indexes after content changes
python _scripts/generate_search_index.py

# Update specific data files
python _scripts/yml_to_json_converter.py

# Rebuild Jekyll to see changes
bundle exec jekyll build
```

---

*Last Updated: 2025-05-25*
*For questions: Check browser console for errors or review JavaScript files in `assets/js/`*