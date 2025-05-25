---
layout: default
title: "Search & Filter Components Test Page"
description: "Test page for all search and filter components in the Brandmine system"
lang: en
permalink: /en/dev/search-test/
ref: dev-search-test
---

# Search & Filter Components Test Page

This page tests all search and filter functionality in the Brandmine system.

---

## 1. Basic Search Components

### Simple Search Input
{% include components/search/simple-search.html
   id="basic-search"
   placeholder="Search brands, founders, insights..."
   class_name="search--large" %}

---

## 2. Advanced Search Interface

<div class="search-test-section">
  <h3>Brands Search Filter Component</h3>
  {% include components/search/search-filter.html
     content_type="brands"
     show_presets=true
     show_sort=true
     class_name="search-test" %}
  
  <h3>Founders Search Filter Component</h3>
  {% include components/search/search-filter.html
     content_type="founders"
     show_presets=true
     show_sort=true
     class_name="search-test" %}
  
  <h3>Insights Search Filter Component</h3>
  {% include components/search/search-filter.html
     content_type="insights"
     show_presets=true
     show_sort=true
     class_name="search-test" %}

<div class="legacy-search-test">
  <h3>Legacy Advanced Multi-Dimensional Search</h3>

  <!-- Search Input -->
  <div class="search-input-wrapper">
    <input type="text" id="advanced-search-input" class="search-input"
           placeholder="Search across all content..."
           aria-label="Advanced search">
    <button type="button" id="advanced-search-btn" class="btn btn--primary">Search</button>
    <button type="button" id="clear-advanced-search" class="search-clear-btn" title="Clear search">×</button>
  </div>

  <!-- Content Type Filter -->
  <div class="content-type-filter">
    <h4>Content Types</h4>
    <label class="filter-checkbox">
      <input type="checkbox" name="content-type" value="brand" checked>
      <span>Brands</span>
    </label>
    <label class="filter-checkbox">
      <input type="checkbox" name="content-type" value="founder">
      <span>Founders</span>
    </label>
    <label class="filter-checkbox">
      <input type="checkbox" name="content-type" value="insight">
      <span>Insights</span>
    </label>
    <label class="filter-checkbox">
      <input type="checkbox" name="content-type" value="dimension">
      <span>Dimensions</span>
    </label>
  </div>

  <!-- Dimension Filters -->
  <div class="dimension-filters">
    <!-- Sectors -->
    <div class="filter-group">
      <h4>Sectors</h4>
      {% assign sectors = "wine,natural-beauty,gourmet-foods,artisanal-spirits,hotels-resorts,artisan-ceramics" | split: "," %}
      {% for sector in sectors %}
        <label class="filter-checkbox">
          <input type="checkbox" name="sector" value="{{ sector }}">
          <span>{{ sector | replace: "-", " " | capitalize }}</span>
        </label>
      {% endfor %}
    </div>

    <!-- Markets -->
    <div class="filter-group">
      <h4>Markets</h4>
      {% assign markets = "russia,brazil,china,india,south-africa,uae" | split: "," %}
      {% for market in markets %}
        <label class="filter-checkbox">
          <input type="checkbox" name="market" value="{{ market }}">
          <span>{{ market | replace: "-", " " | capitalize }}</span>
        </label>
      {% endfor %}
    </div>

    <!-- Attributes -->
    <div class="filter-group">
      <h4>Attributes</h4>
      {% assign attributes = "founder-led,heritage-brand,artisanal-excellence,sustainability-pioneer" | split: "," %}
      {% for attribute in attributes %}
        <label class="filter-checkbox">
          <input type="checkbox" name="attribute" value="{{ attribute }}">
          <span>{{ attribute | replace: "-", " " | capitalize }}</span>
        </label>
      {% endfor %}
    </div>

    <!-- Signals -->
    <div class="filter-group">
      <h4>Signals</h4>
      {% assign signals = "export-ready,franchise-ready,investment-ready,rapid-growth" | split: "," %}
      {% for signal in signals %}
        <label class="filter-checkbox">
          <input type="checkbox" name="signal" value="{{ signal }}">
          <span>{{ signal | replace: "-", " " | capitalize }}</span>
        </label>
      {% endfor %}
    </div>
  </div>

  <!-- Filter Controls -->
  <div class="filter-controls">
    <button type="button" id="apply-filters" class="btn btn--primary">Apply Filters</button>
    <button type="button" id="clear-filters" class="btn btn--outline">Clear All</button>
    <button type="button" id="save-search" class="btn btn--secondary">Save Search</button>
  </div>

  <!-- Active Filters -->
  <div id="active-filters" class="active-filters">
    <h4>Active Filters</h4>
    <div id="filter-pills" class="filter-pills">
      <!-- Filter pills will be added here dynamically -->
    </div>
  </div>

  <!-- Results -->
  <div id="search-results" class="search-results">
    <div class="search-results__header">
      <h3>Search Results</h3>
      <span id="results-count">0 results</span>
    </div>

    <div class="search-results__controls">
      <div class="view-toggle">
        <button id="grid-view" class="view-toggle-btn active" title="Grid view">⊞</button>
        <button id="list-view" class="view-toggle-btn" title="List view">☰</button>
      </div>

      <select id="sort-select" class="sort-select">
        <option value="relevance">Most Relevant</option>
        <option value="date-desc">Newest First</option>
        <option value="date-asc">Oldest First</option>
        <option value="name-asc">A-Z</option>
        <option value="name-desc">Z-A</option>
      </select>
    </div>

    <div id="results-container" class="search-results__grid">
      <!-- Results will be populated here -->
    </div>

    <div id="load-more-container" class="load-more-container" style="display: none;">
      <button type="button" id="load-more-btn" class="btn btn--outline">Load More Results</button>
    </div>
  </div>
</div>
</div>

---

## 3. Search Presets Testing

<div class="search-presets">
  <h3>Quick Search Presets</h3>
  <div class="preset-buttons">
    <button type="button" class="btn btn--outline" data-preset="heritage-brands">Heritage Brands</button>
    <button type="button" class="btn btn--outline" data-preset="export-ready">Export Ready</button>
    <button type="button" class="btn btn--outline" data-preset="founder-led">Founder Led</button>
    <button type="button" class="btn btn--outline" data-preset="russia-focus">Russia Focus</button>
    <button type="button" class="btn btn--outline" data-preset="rapid-growth">Rapid Growth</button>
    <button type="button" class="btn btn--outline" data-preset="sustainability">Sustainability</button>
  </div>
</div>

---

## 4. Page-Specific Search Tests

### Brands Page Search Simulation
<div class="page-search-test">
  <h3>Brands Page Search</h3>

  <!-- Brand-specific filters -->
  <div class="brand-filters">
    <div class="filter-row">
      <label>
        Founding Year:
        <input type="number" id="founding-year-min" placeholder="From" min="1900" max="2025">
        <input type="number" id="founding-year-max" placeholder="To" min="1900" max="2025">
      </label>
    </div>

    <div class="filter-row">
      <label class="filter-checkbox">
        <input type="checkbox" id="founder-led-only">
        <span>Founder-led only</span>
      </label>

      <label class="filter-checkbox">
        <input type="checkbox" id="featured-only">
        <span>Featured brands only</span>
      </label>
    </div>
  </div>

  <div id="brand-results" class="results-grid">
    <!-- Brand results would appear here -->
  </div>
</div>

### Founders Page Search Simulation
<div class="page-search-test">
  <h3>Founders Page Search</h3>

  <!-- Founder-specific filters -->
  <div class="founder-filters">
    <div class="filter-group">
      <h4>Generation</h4>
      <label class="filter-checkbox">
        <input type="checkbox" name="generation" value="first">
        <span>1st Generation</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="generation" value="second">
        <span>2nd Generation</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="generation" value="third">
        <span>3rd Generation</span>
      </label>
    </div>

    <div class="filter-group">
      <h4>Languages</h4>
      <label class="filter-checkbox">
        <input type="checkbox" name="language" value="en">
        <span>English</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="language" value="ru">
        <span>Russian</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="language" value="zh">
        <span>Chinese</span>
      </label>
    </div>

    <div class="filter-group">
      <label class="filter-checkbox">
        <input type="checkbox" id="cross-border-experience">
        <span>Cross-border experience</span>
      </label>
    </div>
  </div>

  <div id="founder-results" class="results-grid">
    <!-- Founder results would appear here -->
  </div>
</div>

### Insights Page Search Simulation
<div class="page-search-test">
  <h3>Insights Page Search</h3>

  <!-- Insight-specific filters -->
  <div class="insight-filters">
    <div class="filter-group">
      <h4>Categories</h4>
      <label class="filter-checkbox">
        <input type="checkbox" name="insight-category" value="brand-spotlight">
        <span>Brand Spotlight</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="insight-category" value="founders-journey">
        <span>Founder's Journey</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="insight-category" value="location-intelligence">
        <span>Location Intelligence</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="insight-category" value="market-momentum">
        <span>Market Momentum</span>
      </label>
    </div>

    <div class="filter-group">
      <h4>Date Range</h4>
      <select id="date-range">
        <option value="all">All Time</option>
        <option value="last-week">Last Week</option>
        <option value="last-month">Last Month</option>
        <option value="last-quarter">Last Quarter</option>
        <option value="last-year">Last Year</option>
      </select>
    </div>

    <div class="filter-group">
      <h4>Reading Time</h4>
      <label class="filter-checkbox">
        <input type="checkbox" name="reading-time" value="short">
        <span>Short (< 5 min)</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="reading-time" value="medium">
        <span>Medium (5-10 min)</span>
      </label>
      <label class="filter-checkbox">
        <input type="checkbox" name="reading-time" value="long">
        <span>Long (> 10 min)</span>
      </label>
    </div>
  </div>

  <div id="insight-results" class="results-grid">
    <!-- Insight results would appear here -->
  </div>
</div>

---

## 5. Search Performance Testing

<div class="performance-test">
  <h3>Performance Testing</h3>

  <button type="button" id="test-search-speed" class="btn btn--secondary">Test Search Speed</button>
  <button type="button" id="test-large-dataset" class="btn btn--secondary">Test Large Dataset</button>
  <button type="button" id="test-multiple-filters" class="btn btn--secondary">Test Multiple Filters</button>

  <div id="performance-results" class="performance-results">
    <!-- Performance test results will appear here -->
  </div>
</div>

---

## 6. URL Parameter Testing

<div class="url-test">
  <h3>URL Parameter Integration</h3>

  <p>Test these URLs to verify parameter handling:</p>
  <ul>
    <li><a href="?q=tea&sector=gourmet-foods">Search for "tea" in gourmet foods</a></li>
    <li><a href="?market=russia&founder-led=true">Russian founder-led brands</a></li>
    <li><a href="?attribute=heritage-brand&signal=export-ready">Heritage brands ready for export</a></li>
    <li><a href="?content-type=founder&cross-border=true">Founders with cross-border experience</a></li>
  </ul>

  <div id="url-params-display">
    Current URL parameters: <span id="current-params">None</span>
  </div>
</div>

---

## Testing Instructions

### Manual Testing Checklist

1. **Basic Search**
   - [ ] Simple search input works
   - [ ] Search results appear
   - [ ] Clear search button works

2. **Filter Testing**
   - [ ] All filter checkboxes are clickable
   - [ ] Multiple filters can be applied
   - [ ] Filter combinations work correctly
   - [ ] Clear filters button works

3. **Results Display**
   - [ ] Results appear in grid/list view
   - [ ] View toggle works
   - [ ] Sort options function
   - [ ] Load more button works

4. **URL Integration**
   - [ ] URL updates with search parameters
   - [ ] Direct URLs with parameters work
   - [ ] Browser back/forward works

5. **Performance**
   - [ ] Search responds quickly (< 500ms)
   - [ ] Large result sets load properly
   - [ ] No memory leaks on repeated searches

6. **Mobile Testing**
   - [ ] Touch interactions work
   - [ ] Responsive layout functions
   - [ ] Mobile keyboard appears correctly

### Expected Data Sources

This test page expects these data endpoints:
- `/search.json` - Site-wide search index
- `/assets/data/brands.json` - Brand data
- `/assets/data/founders.json` - Founder data
- `/assets/data/insights.json` - Insights data
- `/assets/data/dimensions.json` - Taxonomy data

### JavaScript Dependencies

Include these scripts to test functionality:
```html
<script src="/assets/js/advanced-search.js"></script>
<script src="/assets/js/search-filter.js"></script>
<script src="/assets/js/brand-filtering.js"></script>
<script src="/assets/js/founders-search.js"></script>
<script src="/assets/js/insights-search.js"></script>
<script src="/assets/js/discovery-search.js"></script>
```

---

*Last Updated: 2025-05-25*

<script>
// Enhanced test functionality
document.addEventListener('DOMContentLoaded', function() {
  // Display current URL parameters
  const params = new URLSearchParams(window.location.search);
  const paramsDisplay = document.getElementById('current-params');
  if (paramsDisplay) {
    paramsDisplay.textContent = params.toString() || 'None';
  }

  // Legacy search functionality
  setupLegacySearchTest();
  
  // Performance testing placeholders
  document.getElementById('test-search-speed')?.addEventListener('click', function() {
    const start = performance.now();
    // Simulate search operation
    setTimeout(() => {
      const end = performance.now();
      document.getElementById('performance-results').innerHTML =
        `<p>Search completed in ${(end - start).toFixed(2)}ms</p>`;
    }, Math.random() * 200 + 100);
  });

  // Listen for search results from the search-filter components
  document.addEventListener('searchResultsUpdated', function(event) {
    const { contentType, results, activeFilters } = event.detail;
    console.log(`${contentType} search updated:`, results.length, 'results');
    updateLegacyResultsDisplay(results, contentType);
  });
});

function setupLegacySearchTest() {
  // Clear search functionality
  const clearBtn = document.getElementById('clear-advanced-search');
  const searchInput = document.getElementById('advanced-search-input');
  
  if (clearBtn && searchInput) {
    clearBtn.addEventListener('click', function() {
      searchInput.value = '';
      clearAllLegacyFilters();
      updateLegacyResults([]);
    });
  }

  // Search button functionality
  const searchBtn = document.getElementById('advanced-search-btn');
  if (searchBtn) {
    searchBtn.addEventListener('click', performLegacySearch);
  }

  // Apply filters button
  const applyBtn = document.getElementById('apply-filters');
  if (applyBtn) {
    applyBtn.addEventListener('click', performLegacySearch);
  }

  // Clear filters button
  const clearFiltersBtn = document.getElementById('clear-filters');
  if (clearFiltersBtn) {
    clearFiltersBtn.addEventListener('click', function() {
      clearAllLegacyFilters();
      updateLegacyResults([]);
    });
  }

  // View toggle functionality
  const gridViewBtn = document.getElementById('grid-view');
  const listViewBtn = document.getElementById('list-view');
  const resultsContainer = document.getElementById('results-container');
  
  if (gridViewBtn && listViewBtn && resultsContainer) {
    gridViewBtn.addEventListener('click', function() {
      resultsContainer.className = 'search-results__grid';
      gridViewBtn.classList.add('active');
      listViewBtn.classList.remove('active');
    });
    
    listViewBtn.addEventListener('click', function() {
      resultsContainer.className = 'search-results__list';
      listViewBtn.classList.add('active');
      gridViewBtn.classList.remove('active');
    });
  }

  // Sort functionality
  const sortSelect = document.getElementById('sort-select');
  if (sortSelect) {
    sortSelect.addEventListener('change', performLegacySearch);
  }

  // Load more functionality
  const loadMoreBtn = document.getElementById('load-more-btn');
  if (loadMoreBtn) {
    loadMoreBtn.addEventListener('click', function() {
      // Simulate loading more results
      const container = document.getElementById('results-container');
      if (container) {
        const currentCount = container.children.length;
        for (let i = 0; i < 12; i++) {
          const item = document.createElement('div');
          item.className = 'search-result-item';
          item.innerHTML = `<h4>Sample Result ${currentCount + i + 1}</h4><p>This is a sample result item.</p>`;
          container.appendChild(item);
        }
      }
    });
  }
}

function clearAllLegacyFilters() {
  // Clear all checkboxes
  document.querySelectorAll('.legacy-search-test input[type="checkbox"]').forEach(cb => {
    cb.checked = false;
  });
  
  // Clear search input
  const searchInput = document.getElementById('advanced-search-input');
  if (searchInput) searchInput.value = '';
  
  // Clear active filters display
  const filterPills = document.getElementById('filter-pills');
  if (filterPills) filterPills.innerHTML = '';
  
  const activeFilters = document.getElementById('active-filters');
  if (activeFilters) activeFilters.style.display = 'none';
}

function performLegacySearch() {
  // Simulate search with mock data
  const mockResults = [
    { type: 'brand', title: 'Sample Brand 1', description: 'A heritage brand from Russia' },
    { type: 'founder', title: 'Maria Kuznetsova', description: 'Founder of premium tea brand' },
    { type: 'insight', title: 'Russian Tea Renaissance', description: 'Market insights on tea industry' }
  ];
  
  updateLegacyResults(mockResults);
  updateActiveFiltersDisplay();
}

function updateLegacyResults(results) {
  const container = document.getElementById('results-container');
  const count = document.getElementById('results-count');
  const loadMoreContainer = document.getElementById('load-more-container');
  
  if (container) {
    container.innerHTML = '';
    results.forEach(result => {
      const item = document.createElement('div');
      item.className = 'search-result-item';
      item.innerHTML = `
        <h4>${result.title}</h4>
        <p>${result.description}</p>
        <span class="result-type">${result.type}</span>
      `;
      container.appendChild(item);
    });
  }
  
  if (count) {
    count.textContent = `${results.length} results`;
  }
  
  if (loadMoreContainer) {
    loadMoreContainer.style.display = results.length >= 12 ? 'block' : 'none';
  }
}

function updateLegacyResultsDisplay(results, contentType) {
  const container = document.getElementById('results-container');
  if (container && results) {
    container.innerHTML = `<p>Search results from ${contentType} component: ${results.length} items found</p>`;
    results.slice(0, 5).forEach(result => {
      const item = document.createElement('div');
      item.className = 'search-result-item';
      item.innerHTML = `
        <h4>${result.title || result.name || 'Untitled'}</h4>
        <p>${result.description || result.brief_bio || result.excerpt || 'No description'}</p>
        <span class="result-type">${contentType}</span>
      `;
      container.appendChild(item);
    });
  }
}

function updateActiveFiltersDisplay() {
  const checkedFilters = document.querySelectorAll('.legacy-search-test input[type="checkbox"]:checked');
  const searchValue = document.getElementById('advanced-search-input')?.value;
  const filterPills = document.getElementById('filter-pills');
  const activeFilters = document.getElementById('active-filters');
  
  if (filterPills) {
    filterPills.innerHTML = '';
    
    if (searchValue) {
      const pill = document.createElement('span');
      pill.className = 'filter-pill';
      pill.textContent = `Search: "${searchValue}"`;
      filterPills.appendChild(pill);
    }
    
    checkedFilters.forEach(filter => {
      const pill = document.createElement('span');
      pill.className = 'filter-pill';
      pill.textContent = `${filter.name}: ${filter.value}`;
      filterPills.appendChild(pill);
    });
  }
  
  if (activeFilters) {
    activeFilters.style.display = (checkedFilters.length > 0 || searchValue) ? 'block' : 'none';
  }
}
</script>
