/**
 * Enhanced Search Filter Component JavaScript
 * Handles search and filtering for brands, founders, insights, and dimensions
 */

class SearchFilter {
  constructor(contentType = 'brands') {
    this.contentType = contentType;
    this.data = [];
    this.filteredResults = [];
    this.activeFilters = {
      query: '',
      sectors: [],
      markets: [],
      attributes: [],
      signals: [],
      categories: [], // for insights
      generation: [], // for founders
      'founder-led-only': false,
      'featured-only': false
    };
    this.currentPage = 1;
    this.resultsPerPage = 12;
    this.currentView = 'grid';
    
    this.init();
  }

  async init() {
    try {
      await this.loadData();
      this.setupEventListeners();
      this.initializeFromURL();
      this.performSearch();
    } catch (error) {
      console.error('Failed to initialize search filter:', error);
      this.showError('Search functionality unavailable');
    }
  }

  async loadData() {
    try {
      // Load data based on content type
      let dataUrl;
      switch (this.contentType) {
        case 'brands':
          dataUrl = '/assets/data/brands.json';
          break;
        case 'founders':
          dataUrl = '/assets/data/founders.json';
          break;
        case 'insights':
          dataUrl = '/assets/data/insights.json';
          break;
        default:
          // Fallback to search.json for mixed content
          dataUrl = '/search.json';
      }

      const response = await fetch(dataUrl);
      if (!response.ok) throw new Error(`Failed to load ${dataUrl}`);
      
      this.data = await response.json();
      console.log(`Loaded ${this.data.length} ${this.contentType} items`);
    } catch (error) {
      console.error('Error loading data:', error);
      // Fallback to search.json
      try {
        const response = await fetch('/search.json');
        if (response.ok) {
          const searchData = await response.json();
          this.data = searchData.filter(item => item.type === this.contentType);
        }
      } catch (fallbackError) {
        console.error('Fallback data loading failed:', fallbackError);
        this.data = [];
      }
    }
  }

  setupEventListeners() {
    const contentId = this.contentType;
    
    // Search input
    const searchInput = document.getElementById(`search-input-${contentId}`);
    if (searchInput) {
      searchInput.addEventListener('input', this.debounce(() => {
        this.activeFilters.query = searchInput.value;
        this.performSearch();
      }, 300));
    }

    // Search button
    const searchButton = document.getElementById(`search-button-${contentId}`);
    if (searchButton) {
      searchButton.addEventListener('click', () => this.performSearch());
    }

    // Clear search
    const clearSearch = document.getElementById(`clear-search-${contentId}`);
    if (clearSearch) {
      clearSearch.addEventListener('click', () => {
        if (searchInput) searchInput.value = '';
        this.activeFilters.query = '';
        this.performSearch();
      });
    }

    // Filter toggle
    const filterToggle = document.getElementById(`toggle-filters-${contentId}`);
    const advancedFilters = document.getElementById(`advanced-filters-${contentId}`);
    if (filterToggle && advancedFilters) {
      filterToggle.addEventListener('click', () => {
        const isVisible = advancedFilters.style.display !== 'none';
        advancedFilters.style.display = isVisible ? 'none' : 'block';
        filterToggle.setAttribute('aria-expanded', !isVisible);
      });
    }

    // Sort select
    const sortSelect = document.getElementById(`sort-select-${contentId}`);
    if (sortSelect) {
      sortSelect.addEventListener('change', () => this.performSearch());
    }

    // Filter checkboxes
    document.querySelectorAll(`#advanced-filters-${contentId} input[type="checkbox"]`).forEach(checkbox => {
      checkbox.addEventListener('change', () => this.updateFilters());
    });

    // Preset buttons
    document.querySelectorAll('.preset-btn').forEach(btn => {
      btn.addEventListener('click', (e) => this.applyPreset(e.target.dataset.preset));
    });

    // Apply/Clear filter buttons
    const applyBtn = document.getElementById(`apply-filters-${contentId}`);
    if (applyBtn) {
      applyBtn.addEventListener('click', () => this.performSearch());
    }

    const clearBtn = document.getElementById(`clear-filters-${contentId}`);
    if (clearBtn) {
      clearBtn.addEventListener('click', () => this.clearAllFilters());
    }

    // Clear all filters button (in active filters section)
    const clearAllBtn = document.getElementById(`clear-all-filters-${contentId}`);
    if (clearAllBtn) {
      clearAllBtn.addEventListener('click', () => this.clearAllFilters());
    }

    // View toggle functionality
    this.setupViewToggle();
    
    // Load more functionality
    this.setupLoadMore();
  }

  initializeFromURL() {
    const urlParams = new URLSearchParams(window.location.search);
    
    // Set search query
    const query = urlParams.get('q');
    if (query) {
      this.activeFilters.query = query;
      const searchInput = document.getElementById(`search-input-${this.contentType}`);
      if (searchInput) searchInput.value = query;
    }

    // Set filters from URL
    ['sectors', 'markets', 'attributes', 'signals', 'categories', 'generation'].forEach(filterType => {
      const param = urlParams.get(filterType.slice(0, -1)); // Remove 's' for singular param
      if (param) {
        this.activeFilters[filterType] = param.split(',');
        // Check corresponding checkboxes
        param.split(',').forEach(value => {
          const checkbox = document.querySelector(`input[name="${filterType.slice(0, -1)}"][value="${value}"]`);
          if (checkbox) checkbox.checked = true;
        });
      }
    });

    // Boolean filters
    if (urlParams.get('founder-led') === 'true') {
      this.activeFilters['founder-led-only'] = true;
      const checkbox = document.querySelector('input[name="founder-led-only"]');
      if (checkbox) checkbox.checked = true;
    }

    if (urlParams.get('featured') === 'true') {
      this.activeFilters['featured-only'] = true;
      const checkbox = document.querySelector('input[name="featured-only"]');
      if (checkbox) checkbox.checked = true;
    }
  }

  updateFilters() {
    // Update filters from checkboxes
    ['sector', 'market', 'attribute', 'signal', 'category', 'generation'].forEach(filterType => {
      const checked = document.querySelectorAll(`input[name="${filterType}"]:checked`);
      this.activeFilters[filterType + 's'] = Array.from(checked).map(cb => cb.value);
    });

    // Boolean filters
    const founderLedCheckbox = document.querySelector('input[name="founder-led-only"]');
    this.activeFilters['founder-led-only'] = founderLedCheckbox ? founderLedCheckbox.checked : false;

    const featuredCheckbox = document.querySelector('input[name="featured-only"]');
    this.activeFilters['featured-only'] = featuredCheckbox ? featuredCheckbox.checked : false;

    // Update filter count
    this.updateFilterCount();
    this.updateActiveFiltersDisplay();
  }

  performSearch() {
    this.currentPage = 1; // Reset to first page for new searches
    this.updateFilters();
    this.filterResults();
    this.sortResults();
    this.displayResults();
    this.updateURL();
  }

  filterResults() {
    let results = [...this.data];

    // Text search
    if (this.activeFilters.query) {
      const query = this.activeFilters.query.toLowerCase();
      results = results.filter(item => {
        const searchableText = [
          item.title || item.name || '',
          item.description || item.brief_bio || item.excerpt || '',
          ...(item.sectors || []),
          ...(item.markets || []),
          ...(item.attributes || [])
        ].join(' ').toLowerCase();
        
        return searchableText.includes(query);
      });
    }

    // Dimension filters
    ['sectors', 'markets', 'attributes', 'signals'].forEach(dimension => {
      if (this.activeFilters[dimension].length > 0) {
        results = results.filter(item => {
          const itemDimensions = item[dimension] || [];
          return this.activeFilters[dimension].some(filter => 
            itemDimensions.includes(filter)
          );
        });
      }
    });

    // Content-specific filters
    if (this.contentType === 'brands') {
      if (this.activeFilters['founder-led-only']) {
        results = results.filter(item => item.founder_led === true);
      }
      if (this.activeFilters['featured-only']) {
        results = results.filter(item => item.featured === true);
      }
    }

    if (this.contentType === 'founders') {
      if (this.activeFilters.generation.length > 0) {
        results = results.filter(item => 
          this.activeFilters.generation.includes(item.generation)
        );
      }
    }

    if (this.contentType === 'insights') {
      if (this.activeFilters.categories.length > 0) {
        results = results.filter(item => 
          this.activeFilters.categories.includes(item.category)
        );
      }
    }

    this.filteredResults = results;
  }

  sortResults() {
    const sortSelect = document.getElementById(`sort-select-${this.contentType}`);
    const sortValue = sortSelect ? sortSelect.value : 'relevance';

    this.filteredResults.sort((a, b) => {
      switch (sortValue) {
        case 'name-asc':
          return (a.title || a.name || '').localeCompare(b.title || b.name || '');
        case 'name-desc':
          return (b.title || b.name || '').localeCompare(a.title || a.name || '');
        case 'date-desc':
          return new Date(b.date || b.founding_year || 0) - new Date(a.date || a.founding_year || 0);
        case 'date-asc':
          return new Date(a.date || a.founding_year || 0) - new Date(b.date || b.founding_year || 0);
        default: // relevance
          // For relevance, prioritize featured items and exact matches
          const aScore = (a.featured ? 10 : 0) + (this.getRelevanceScore(a));
          const bScore = (b.featured ? 10 : 0) + (this.getRelevanceScore(b));
          return bScore - aScore;
      }
    });
  }

  getRelevanceScore(item) {
    if (!this.activeFilters.query) return 0;
    
    const query = this.activeFilters.query.toLowerCase();
    const title = (item.title || item.name || '').toLowerCase();
    const description = (item.description || item.brief_bio || item.excerpt || '').toLowerCase();
    
    let score = 0;
    if (title.includes(query)) score += 5;
    if (title.startsWith(query)) score += 3;
    if (description.includes(query)) score += 1;
    
    return score;
  }

  displayResults() {
    console.log(`Search completed: ${this.filteredResults.length} results found`);
    
    // Update results count if element exists
    const resultsCount = document.getElementById('results-count');
    if (resultsCount) {
      resultsCount.textContent = `${this.filteredResults.length} results`;
    }

    // Try to find a results container for this content type
    const resultsContainer = document.getElementById(`results-container-${this.contentType}`) || 
                            document.getElementById('results-container');
    
    if (resultsContainer) {
      this.renderResults(resultsContainer);
    }

    // Show/hide load more button
    const loadMoreContainer = document.getElementById('load-more-container');
    if (loadMoreContainer) {
      const totalShown = this.currentPage * this.resultsPerPage;
      const hasMoreResults = totalShown < this.filteredResults.length;
      loadMoreContainer.style.display = hasMoreResults ? 'block' : 'none';
    }

    // Trigger custom event for other components to listen to
    document.dispatchEvent(new CustomEvent('searchResultsUpdated', {
      detail: {
        contentType: this.contentType,
        results: this.filteredResults,
        activeFilters: this.activeFilters
      }
    }));
  }

  renderResults(container) {
    if (this.filteredResults.length === 0) {
      container.innerHTML = '<div class="no-results"><p>No results found. Try adjusting your search criteria.</p></div>';
      return;
    }

    // For new searches (page 1), clear container
    if (this.currentPage === 1) {
      container.innerHTML = '';
    }

    // Add new results (for load more, append to existing)
    const startIndex = (this.currentPage - 1) * this.resultsPerPage;
    const endIndex = Math.min(startIndex + this.resultsPerPage, this.filteredResults.length);
    
    for (let i = startIndex; i < endIndex; i++) {
      const resultElement = this.createResultElement(this.filteredResults[i]);
      container.appendChild(resultElement);
    }
  }

  createResultElement(item) {
    const element = document.createElement('div');
    element.className = 'search-result-item';
    
    const title = item.title || item.name || 'Untitled';
    const description = item.description || item.brief_bio || item.excerpt || 'No description available';
    const url = item.url || item.permalink || '#';
    
    // Create taxonomy tags
    let taxonomyTags = '';
    if (item.sectors && item.sectors.length > 0) {
      taxonomyTags += item.sectors.map(s => `<span class="taxonomy-tag taxonomy-tag--sector">${s}</span>`).join('');
    }
    if (item.markets && item.markets.length > 0) {
      taxonomyTags += item.markets.map(m => `<span class="taxonomy-tag taxonomy-tag--market">${m}</span>`).join('');
    }
    if (item.attributes && item.attributes.length > 0) {
      taxonomyTags += item.attributes.map(a => `<span class="taxonomy-tag taxonomy-tag--attribute">${a}</span>`).join('');
    }
    if (item.signals && item.signals.length > 0) {
      taxonomyTags += item.signals.map(s => `<span class="taxonomy-tag taxonomy-tag--signal">${s}</span>`).join('');
    }

    element.innerHTML = `
      <div class="search-result-item__content">
        <h3 class="search-result-item__title">
          <a href="${url}">${title}</a>
        </h3>
        <p class="search-result-item__description">${description}</p>
        <div class="search-result-item__meta">
          <span class="content-type">${this.contentType}</span>
          ${item.founding_year ? `<span class="founding-year">${item.founding_year}</span>` : ''}
          ${item.location ? `<span class="location">${item.location.city || item.location.country || ''}</span>` : ''}
        </div>
        ${taxonomyTags ? `<div class="search-result-item__taxonomy">${taxonomyTags}</div>` : ''}
      </div>
    `;
    
    return element;
  }

  updateFilterCount() {
    let totalFilters = 0;
    
    // Count array filters
    ['sectors', 'markets', 'attributes', 'signals', 'categories', 'generation'].forEach(key => {
      if (Array.isArray(this.activeFilters[key])) {
        totalFilters += this.activeFilters[key].length;
      }
    });
    
    // Count boolean filters
    if (this.activeFilters['founder-led-only']) totalFilters++;
    if (this.activeFilters['featured-only']) totalFilters++;
    
    // Count query
    if (this.activeFilters.query && this.activeFilters.query.trim()) totalFilters++;
    
    const filterCount = document.getElementById(`filter-count-${this.contentType}`);
    if (filterCount) {
      filterCount.textContent = totalFilters;
      filterCount.style.display = totalFilters > 0 ? 'inline' : 'none';
    }
  }

  updateActiveFiltersDisplay() {
    const activeFiltersContainer = document.getElementById(`active-filters-${this.contentType}`);
    const filterPills = document.getElementById(`filter-pills-${this.contentType}`);
    
    if (!activeFiltersContainer || !filterPills) return;

    // Clear existing pills
    filterPills.innerHTML = '';

    let hasActiveFilters = false;

    // Add query pill
    if (this.activeFilters.query) {
      this.addFilterPill(filterPills, 'query', this.activeFilters.query, `"${this.activeFilters.query}"`);
      hasActiveFilters = true;
    }

    // Add dimension filter pills
    ['sectors', 'markets', 'attributes', 'signals', 'categories', 'generation'].forEach(dimension => {
      this.activeFilters[dimension].forEach(value => {
        this.addFilterPill(filterPills, dimension, value, value.replace('-', ' '));
        hasActiveFilters = true;
      });
    });

    // Add boolean filter pills
    if (this.activeFilters['founder-led-only']) {
      this.addFilterPill(filterPills, 'founder-led-only', 'true', 'Founder-led');
      hasActiveFilters = true;
    }

    if (this.activeFilters['featured-only']) {
      this.addFilterPill(filterPills, 'featured-only', 'true', 'Featured');
      hasActiveFilters = true;
    }

    activeFiltersContainer.style.display = hasActiveFilters ? 'block' : 'none';
  }

  addFilterPill(container, type, value, display) {
    const pill = document.createElement('div');
    pill.className = 'filter-pill';
    pill.dataset.type = type;
    pill.dataset.value = value;
    
    pill.innerHTML = `
      <span class="filter-pill__text">${display}</span>
      <button class="filter-pill__remove" aria-label="Remove ${display} filter">×</button>
    `;
    
    pill.querySelector('.filter-pill__remove').addEventListener('click', () => {
      this.removeFilter(type, value);
    });
    
    container.appendChild(pill);
  }

  removeFilter(type, value) {
    if (type === 'query') {
      this.activeFilters.query = '';
      const searchInput = document.getElementById(`search-input-${this.contentType}`);
      if (searchInput) searchInput.value = '';
    } else if (type.endsWith('-only')) {
      this.activeFilters[type] = false;
      const checkbox = document.querySelector(`input[name="${type}"]`);
      if (checkbox) checkbox.checked = false;
    } else {
      const index = this.activeFilters[type].indexOf(value);
      if (index > -1) {
        this.activeFilters[type].splice(index, 1);
        const checkbox = document.querySelector(`input[name="${type.slice(0, -1)}"][value="${value}"]`);
        if (checkbox) checkbox.checked = false;
      }
    }
    
    this.performSearch();
  }

  applyPreset(preset) {
    this.clearAllFilters();
    
    // Define presets
    const presets = {
      'featured': { 'featured-only': true },
      'founder-led': { 'founder-led-only': true },
      'export-ready': { signals: ['export-ready'] },
      'heritage': { attributes: ['heritage-brand'] },
      'sustainability': { attributes: ['sustainability-pioneer'] },
      'cross-border': { /* founder-specific logic */ },
      'first-gen': { generation: ['first'] },
      'recent': { /* date-based logic */ },
      'brand-spotlight': { categories: ['brand-spotlight'] },
      'founders-journey': { categories: ['founders-journey'] },
      'market-momentum': { categories: ['market-momentum'] }
    };

    const presetConfig = presets[preset];
    if (presetConfig) {
      Object.assign(this.activeFilters, presetConfig);
      this.updateUIFromFilters();
      this.performSearch();
    }
  }

  updateUIFromFilters() {
    // Update checkboxes to match active filters
    Object.keys(this.activeFilters).forEach(filterType => {
      if (Array.isArray(this.activeFilters[filterType])) {
        this.activeFilters[filterType].forEach(value => {
          const checkbox = document.querySelector(`input[name="${filterType.slice(0, -1)}"][value="${value}"]`);
          if (checkbox) checkbox.checked = true;
        });
      } else if (typeof this.activeFilters[filterType] === 'boolean') {
        const checkbox = document.querySelector(`input[name="${filterType}"]`);
        if (checkbox) checkbox.checked = this.activeFilters[filterType];
      }
    });
  }

  clearAllFilters() {
    this.activeFilters = {
      query: '',
      sectors: [],
      markets: [],
      attributes: [],
      signals: [],
      categories: [],
      generation: [],
      'founder-led-only': false,
      'featured-only': false
    };

    // Clear UI
    const searchInput = document.getElementById(`search-input-${this.contentType}`);
    if (searchInput) searchInput.value = '';

    // Clear all checkboxes
    document.querySelectorAll(`#advanced-filters-${this.contentType} input[type="checkbox"]`).forEach(cb => {
      cb.checked = false;
    });

    // Clear preset buttons state
    document.querySelectorAll('.preset-btn').forEach(btn => {
      btn.classList.remove('active');
    });

    // Reset sort to relevance
    const sortSelect = document.getElementById(`sort-select-${this.contentType}`);
    if (sortSelect) {
      sortSelect.value = 'relevance';
    }

    this.performSearch();
  }

  setupViewToggle() {
    const gridViewBtn = document.getElementById('grid-view');
    const listViewBtn = document.getElementById('list-view');
    const resultsContainer = document.getElementById('results-container');
    
    if (gridViewBtn && listViewBtn && resultsContainer) {
      gridViewBtn.addEventListener('click', () => {
        resultsContainer.className = 'search-results__grid';
        gridViewBtn.classList.add('active');
        listViewBtn.classList.remove('active');
        this.currentView = 'grid';
      });
      
      listViewBtn.addEventListener('click', () => {
        resultsContainer.className = 'search-results__list';
        listViewBtn.classList.add('active');
        gridViewBtn.classList.remove('active');
        this.currentView = 'list';
      });
    }
  }

  setupLoadMore() {
    const loadMoreBtn = document.getElementById('load-more-btn');
    if (loadMoreBtn) {
      loadMoreBtn.addEventListener('click', () => {
        this.currentPage++;
        this.displayResults();
      });
    }
  }

  updateURL() {
    const params = new URLSearchParams();

    if (this.activeFilters.query) {
      params.set('q', this.activeFilters.query);
    }

    ['sectors', 'markets', 'attributes', 'signals', 'categories', 'generation'].forEach(dimension => {
      if (this.activeFilters[dimension].length > 0) {
        params.set(dimension.slice(0, -1), this.activeFilters[dimension].join(','));
      }
    });

    if (this.activeFilters['founder-led-only']) {
      params.set('founder-led', 'true');
    }

    if (this.activeFilters['featured-only']) {
      params.set('featured', 'true');
    }

    const newURL = window.location.pathname + (params.toString() ? '?' + params.toString() : '');
    window.history.replaceState({}, '', newURL);
  }

  showError(message) {
    console.error('SearchFilter Error:', message);
    // Could show user-facing error message
  }

  debounce(func, wait) {
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
}

// Auto-initialize search filters
document.addEventListener('DOMContentLoaded', function() {
  // Initialize based on page context or data attributes
  const searchFilters = document.querySelectorAll('.search-filter');
  
  searchFilters.forEach(filterElement => {
    const contentType = filterElement.dataset.contentType || 'brands';
    new SearchFilter(contentType);
  });
  
  // If no search filters found, check for legacy implementations
  if (searchFilters.length === 0) {
    // Legacy support for existing pages
    if (document.getElementById('search-input-brands')) {
      new SearchFilter('brands');
    }
    if (document.getElementById('search-input-founders')) {
      new SearchFilter('founders');
    }
    if (document.getElementById('search-input-insights')) {
      new SearchFilter('insights');
    }
  }
});

// Export for use in other scripts
window.SearchFilter = SearchFilter;