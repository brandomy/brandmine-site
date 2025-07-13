/**
 * Discovery Universal Search Engine
 * Comprehensive search across all content types with dimension-aware filtering
 */

class DiscoverySearch {
  constructor() {
    this.searchData = [];
    this.dimensionsData = [];
    this.filteredResults = [];
    this.currentPage = 1;
    this.resultsPerPage = 24;
    
    this.activeFilters = {
      query: '',
      contentTypes: ['brand', 'founder', 'insight', 'dimension'],
      dimensions: {
        markets: [],
        sectors: [],
        attributes: [],
        signals: []
      },
      language: '',
      dateAfter: '',
      founderLedOnly: false,
      featuredOnly: false
    };

    this.searchPresets = {
      'heritage-brands': {
        query: 'heritage',
        contentTypes: ['brand'],
        dimensions: { attributes: ['heritage-brand'] }
      },
      'emerging-founders': {
        query: '',
        contentTypes: ['founder'],
        dimensions: { signals: ['rapid-growth'] }
      },
      'russia-insights': {
        query: 'russia',
        contentTypes: ['insight'],
        dimensions: { markets: ['russia'] }
      },
      'export-ready': {
        query: '',
        contentTypes: ['brand'],
        dimensions: { signals: ['export-ready'] }
      },
      'premium-positioning': {
        query: '',
        contentTypes: ['brand'],
        dimensions: { attributes: ['premium-positioning'] }
      },
      'cross-border': {
        query: 'cross-border international',
        contentTypes: ['founder', 'insight']
      }
    };

    this.init();
  }

  async init() {
    try {
      await this.loadSearchData();
      await this.loadDimensionsData();
      this.setupEventListeners();
      this.populateDimensionFilters();
      this.showSearchPlaceholder();
    } catch (error) {
      console.error('Failed to initialize discovery search:', error);
      this.showError('Failed to load search functionality');
    }
  }

  async loadSearchData() {
    const response = await fetch('/search.json');
    if (!response.ok) throw new Error('Failed to load search data');
    this.searchData = await response.json();
  }

  async loadDimensionsData() {
    const response = await fetch('/assets/data/dimensions.json');
    if (!response.ok) throw new Error('Failed to load dimensions data');
    this.dimensionsData = await response.json();
  }

  setupEventListeners() {
    // Search input
    const searchInput = document.getElementById('universal-search-query');
    const clearSearch = document.getElementById('clear-universal-search');
    const searchSubmit = document.getElementById('search-submit');

    if (searchInput) {
      searchInput.addEventListener('input', this.debounce((e) => {
        this.activeFilters.query = e.target.value.trim();
        this.showSearchSuggestions(e.target.value);
      }, 200));

      searchInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
          this.performSearch();
        }
      });
    }

    if (clearSearch) {
      clearSearch.addEventListener('click', () => {
        searchInput.value = '';
        this.activeFilters.query = '';
        this.hideSearchSuggestions();
        this.showSearchPlaceholder();
      });
    }

    if (searchSubmit) {
      searchSubmit.addEventListener('click', () => this.performSearch());
    }

    // Content type toggles
    this.setupContentTypeListeners();

    // Dimension filters
    this.setupDimensionFilterListeners();

    // Additional filters
    this.setupAdditionalFilterListeners();

    // Control buttons
    const applyFilters = document.getElementById('apply-filters');
    const resetFilters = document.getElementById('reset-discovery-filters');
    const saveSearch = document.getElementById('save-search');

    if (applyFilters) {
      applyFilters.addEventListener('click', () => this.performSearch());
    }

    if (resetFilters) {
      resetFilters.addEventListener('click', () => this.resetAllFilters());
    }

    if (saveSearch) {
      saveSearch.addEventListener('click', () => this.saveCurrentSearch());
    }

    // Preset buttons
    this.setupPresetListeners();

    // View controls
    this.setupViewControls();

    // Sort and load more
    const sortSelect = document.getElementById('discovery-sort');
    if (sortSelect) {
      sortSelect.addEventListener('change', () => this.performSearch());
    }

    const loadMore = document.getElementById('load-more-discovery');
    if (loadMore) {
      loadMore.addEventListener('click', () => this.loadMoreResults());
    }
  }

  setupContentTypeListeners() {
    const toggles = document.querySelectorAll('input[name="content-type"]');
    toggles.forEach(toggle => {
      toggle.addEventListener('change', (e) => {
        const value = e.target.value;
        if (e.target.checked) {
          if (!this.activeFilters.contentTypes.includes(value)) {
            this.activeFilters.contentTypes.push(value);
          }
        } else {
          this.activeFilters.contentTypes = this.activeFilters.contentTypes.filter(t => t !== value);
        }
        this.updateActiveFiltersDisplay();
      });
    });
  }

  setupDimensionFilterListeners() {
    ['markets', 'sectors', 'attributes', 'signals'].forEach(dimensionType => {
      const container = document.getElementById(`${dimensionType}-dimension-filter`);
      if (container) {
        container.addEventListener('change', (e) => {
          if (e.target.type === 'checkbox') {
            const value = e.target.value;
            if (e.target.checked) {
              if (!this.activeFilters.dimensions[dimensionType].includes(value)) {
                this.activeFilters.dimensions[dimensionType].push(value);
              }
            } else {
              this.activeFilters.dimensions[dimensionType] = 
                this.activeFilters.dimensions[dimensionType].filter(v => v !== value);
            }
            this.updateActiveFiltersDisplay();
          }
        });
      }

      // Show more button
      const showMoreBtn = document.querySelector(`[data-filter="${dimensionType}"]`);
      if (showMoreBtn) {
        showMoreBtn.addEventListener('click', () => this.toggleDimensionExpansion(dimensionType));
      }
    });
  }

  setupAdditionalFilterListeners() {
    const languageFilter = document.getElementById('language-filter');
    const dateFilter = document.getElementById('date-range');
    const founderLedFilter = document.getElementById('founder-led-only');
    const featuredFilter = document.getElementById('featured-only');

    if (languageFilter) {
      languageFilter.addEventListener('change', (e) => {
        this.activeFilters.language = e.target.value;
        this.updateActiveFiltersDisplay();
      });
    }

    if (dateFilter) {
      dateFilter.addEventListener('change', (e) => {
        this.activeFilters.dateAfter = e.target.value;
        this.updateActiveFiltersDisplay();
      });
    }

    if (founderLedFilter) {
      founderLedFilter.addEventListener('change', (e) => {
        this.activeFilters.founderLedOnly = e.target.checked;
        this.updateActiveFiltersDisplay();
      });
    }

    if (featuredFilter) {
      featuredFilter.addEventListener('change', (e) => {
        this.activeFilters.featuredOnly = e.target.checked;
        this.updateActiveFiltersDisplay();
      });
    }
  }

  setupPresetListeners() {
    const presetButtons = document.querySelectorAll('.preset-btn[data-preset]');
    presetButtons.forEach(btn => {
      btn.addEventListener('click', (e) => {
        const presetName = e.target.dataset.preset;
        this.applySearchPreset(presetName);
      });
    });
  }

  setupViewControls() {
    const gridView = document.getElementById('grid-view-discovery');
    const listView = document.getElementById('list-view-discovery');
    const mapView = document.getElementById('map-view-discovery');

    if (gridView) {
      gridView.addEventListener('click', () => this.setViewMode('grid'));
    }

    if (listView) {
      listView.addEventListener('click', () => this.setViewMode('list'));
    }

    if (mapView) {
      mapView.addEventListener('click', () => this.setViewMode('map'));
    }
  }

  populateDimensionFilters() {
    const currentLang = document.documentElement.lang || 'en';
    const dimensionsByType = this.groupDimensionsByType();

    Object.keys(dimensionsByType).forEach(type => {
      const container = document.getElementById(`${type}-dimension-filter`);
      if (!container) return;

      const dimensions = dimensionsByType[type]
        .filter(d => d.lang === currentLang)
        .slice(0, 6); // Show first 6, rest behind "show more"

      container.innerHTML = dimensions.map(dimension => `
        <div class="filter-option">
          <input type="checkbox" id="${type}-${dimension.slug}" value="${dimension.slug}">
          <label for="${type}-${dimension.slug}">${dimension.title}</label>
        </div>
      `).join('');
    });
  }

  groupDimensionsByType() {
    const grouped = {
      markets: [],
      sectors: [],
      attributes: [],
      signals: []
    };

    this.dimensionsData.forEach(dimension => {
      if (dimension.category && grouped[dimension.category]) {
        grouped[dimension.category].push({
          title: dimension.title,
          slug: dimension.url ? dimension.url.split('/').pop() : dimension.title.toLowerCase().replace(/\s+/g, '-'),
          lang: dimension.lang
        });
      }
    });

    return grouped;
  }

  showSearchSuggestions(query) {
    if (!query || query.length < 2) {
      this.hideSearchSuggestions();
      return;
    }

    const suggestions = this.generateSearchSuggestions(query);
    const container = document.getElementById('search-suggestions');
    
    if (container && suggestions.length > 0) {
      container.innerHTML = suggestions.slice(0, 5).map(suggestion => `
        <div class="suggestion-item" data-query="${suggestion.query}" data-type="${suggestion.type}">
          <span class="suggestion-icon">${this.getTypeIcon(suggestion.type)}</span>
          <span class="suggestion-text">${suggestion.text}</span>
          <span class="suggestion-type">${suggestion.type}</span>
        </div>
      `).join('');
      
      container.style.display = 'block';
      
      // Add click listeners to suggestions
      container.querySelectorAll('.suggestion-item').forEach(item => {
        item.addEventListener('click', () => {
          const query = item.dataset.query;
          const type = item.dataset.type;
          document.getElementById('universal-search-query').value = query;
          this.activeFilters.query = query;
          this.hideSearchSuggestions();
          this.performSearch();
        });
      });
    } else {
      this.hideSearchSuggestions();
    }
  }

  generateSearchSuggestions(query) {
    const suggestions = [];
    const lowerQuery = query.toLowerCase();

    // Search in actual data
    this.searchData.forEach(item => {
      if (item.title && item.title.toLowerCase().includes(lowerQuery)) {
        suggestions.push({
          query: item.title,
          text: item.title,
          type: item.type
        });
      }
    });

    // Add dimension suggestions
    this.dimensionsData.forEach(dimension => {
      if (dimension.title && dimension.title.toLowerCase().includes(lowerQuery)) {
        suggestions.push({
          query: dimension.title,
          text: dimension.title,
          type: 'dimension'
        });
      }
    });

    return suggestions.sort((a, b) => a.text.localeCompare(b.text));
  }

  hideSearchSuggestions() {
    const container = document.getElementById('search-suggestions');
    if (container) {
      container.style.display = 'none';
    }
  }

  performSearch() {
    this.hideSearchSuggestions();
    
    let results = [...this.searchData];
    const currentLang = document.documentElement.lang || 'en';

    // Filter by language
    if (this.activeFilters.language) {
      results = results.filter(item => item.lang === this.activeFilters.language);
    } else {
      results = results.filter(item => item.lang === currentLang);
    }

    // Filter by content types
    if (this.activeFilters.contentTypes.length > 0) {
      results = results.filter(item => this.activeFilters.contentTypes.includes(item.type));
    }

    // Text search
    if (this.activeFilters.query) {
      const searchTerms = this.activeFilters.query.toLowerCase().split(' ').filter(term => term.length > 1);
      results = results.filter(item => {
        const searchableText = [
          item.title,
          item.excerpt,
          item.category,
          item.dimension_type
        ].filter(Boolean).join(' ').toLowerCase();

        return searchTerms.some(term => searchableText.includes(term));
      });
    }

    // Apply dimension filters
    Object.keys(this.activeFilters.dimensions).forEach(dimType => {
      if (this.activeFilters.dimensions[dimType].length > 0) {
        results = results.filter(item => {
          // This is simplified - you'd need to implement dimension matching based on your data structure
          return true; // Placeholder
        });
      }
    });

    // Apply additional filters
    if (this.activeFilters.featuredOnly) {
      results = results.filter(item => item.featured);
    }

    if (this.activeFilters.dateAfter) {
      const filterDate = new Date(this.activeFilters.dateAfter);
      results = results.filter(item => {
        if (item.date) {
          return new Date(item.date) >= filterDate;
        }
        return true;
      });
    }

    // Sort results
    this.sortResults(results);

    this.filteredResults = results;
    this.currentPage = 1;
    this.displayResults();
    this.updateResultsCount();
    this.updateActiveFiltersDisplay();
  }

  sortResults(results) {
    const sortSelect = document.getElementById('discovery-sort');
    const sortBy = sortSelect ? sortSelect.value : 'relevance';

    results.sort((a, b) => {
      switch (sortBy) {
        case 'date':
          return new Date(b.date || 0) - new Date(a.date || 0);
        case 'name':
          return (a.title || '').localeCompare(b.title || '');
        case 'type':
          return (a.type || '').localeCompare(b.type || '');
        case 'relevance':
        default:
          // Simple relevance scoring
          const aScore = this.calculateRelevanceScore(a);
          const bScore = this.calculateRelevanceScore(b);
          return bScore - aScore;
      }
    });
  }

  calculateRelevanceScore(item) {
    let score = 0;
    
    if (this.activeFilters.query) {
      const query = this.activeFilters.query.toLowerCase();
      if (item.title && item.title.toLowerCase().includes(query)) score += 10;
      if (item.excerpt && item.excerpt.toLowerCase().includes(query)) score += 5;
    }
    
    if (item.featured) score += 3;
    if (item.type === 'brand') score += 1; // Slight preference for brands
    
    return score;
  }

  displayResults() {
    const resultsContainer = document.getElementById('discovery-search-results');
    if (!resultsContainer) return;

    const start = (this.currentPage - 1) * this.resultsPerPage;
    const end = start + this.resultsPerPage;
    const pageResults = this.filteredResults.slice(0, end);

    if (pageResults.length === 0) {
      resultsContainer.innerHTML = `
        <div class="no-results">
          <div class="no-results-icon">🔍</div>
          <h3>No results found</h3>
          <p>Try adjusting your search terms or filters.</p>
        </div>
      `;
      this.hideLoadMore();
      return;
    }

    resultsContainer.innerHTML = pageResults.map(item => this.createResultCard(item)).join('');

    // Show/hide load more
    if (end < this.filteredResults.length) {
      this.showLoadMore();
    } else {
      this.hideLoadMore();
    }
  }

  createResultCard(item) {
    const typeIcon = this.getTypeIcon(item.type);
    const typeClass = `result-card--${item.type}`;
    
    return `
      <div class="result-card ${typeClass}">
        <a href="${item.url || '#'}" class="result-card__link">
          <div class="result-card__header">
            <span class="result-card__type">
              <span class="type-icon">${typeIcon}</span>
              ${item.type}
            </span>
            ${item.featured ? '<span class="featured-badge">Featured</span>' : ''}
          </div>
          
          <h3 class="result-card__title">${item.title}</h3>
          
          ${item.excerpt ? `<p class="result-card__excerpt">${this.truncateText(item.excerpt, 120)}</p>` : ''}
          
          <div class="result-card__meta">
            ${item.category ? `<span class="meta-category">${item.category}</span>` : ''}
            ${item.dimension_type ? `<span class="meta-dimension">${item.dimension_type}</span>` : ''}
            ${item.date ? `<span class="meta-date">${this.formatDate(item.date)}</span>` : ''}
          </div>
        </a>
      </div>
    `;
  }

  getTypeIcon(type) {
    const icons = {
      brand: '🏢',
      founder: '👨‍💼',
      insight: '💡',
      dimension: '🗂️'
    };
    return icons[type] || '📄';
  }

  truncateText(text, length) {
    return text.length > length ? text.substring(0, length) + '...' : text;
  }

  formatDate(dateString) {
    return new Date(dateString).toLocaleDateString();
  }

  updateResultsCount() {
    const countElement = document.getElementById('discovery-results-count');
    if (countElement) {
      const count = this.filteredResults.length;
      const displaying = Math.min(this.currentPage * this.resultsPerPage, count);
      countElement.textContent = `Showing ${displaying} of ${count} results`;
    }
  }

  updateActiveFiltersDisplay() {
    const container = document.getElementById('active-discovery-filters');
    const listContainer = document.getElementById('active-filters-list');
    
    if (!container || !listContainer) return;

    const activeFilters = [];

    if (this.activeFilters.query) {
      activeFilters.push(`Search: "${this.activeFilters.query}"`);
    }

    if (this.activeFilters.contentTypes.length < 4) {
      activeFilters.push(`Types: ${this.activeFilters.contentTypes.join(', ')}`);
    }

    Object.keys(this.activeFilters.dimensions).forEach(dimType => {
      if (this.activeFilters.dimensions[dimType].length > 0) {
        activeFilters.push(`${dimType}: ${this.activeFilters.dimensions[dimType].join(', ')}`);
      }
    });

    if (this.activeFilters.language) {
      activeFilters.push(`Language: ${this.activeFilters.language}`);
    }

    if (this.activeFilters.founderLedOnly) {
      activeFilters.push('Founder-led only');
    }

    if (this.activeFilters.featuredOnly) {
      activeFilters.push('Featured only');
    }

    if (activeFilters.length === 0) {
      container.style.display = 'none';
    } else {
      container.style.display = 'block';
      listContainer.innerHTML = activeFilters.map(filter => 
        `<span class="active-filter-tag">${filter}</span>`
      ).join('');
    }
  }

  applySearchPreset(presetName) {
    const preset = this.searchPresets[presetName];
    if (!preset) return;

    // Reset filters first
    this.resetAllFilters(false);

    // Apply preset
    if (preset.query) {
      this.activeFilters.query = preset.query;
      const searchInput = document.getElementById('universal-search-query');
      if (searchInput) searchInput.value = preset.query;
    }

    if (preset.contentTypes) {
      this.activeFilters.contentTypes = [...preset.contentTypes];
      // Update UI checkboxes
      document.querySelectorAll('input[name="content-type"]').forEach(cb => {
        cb.checked = preset.contentTypes.includes(cb.value);
      });
    }

    if (preset.dimensions) {
      Object.keys(preset.dimensions).forEach(dimType => {
        this.activeFilters.dimensions[dimType] = [...preset.dimensions[dimType]];
        // Update UI checkboxes
        preset.dimensions[dimType].forEach(value => {
          const checkbox = document.getElementById(`${dimType}-${value}`);
          if (checkbox) checkbox.checked = true;
        });
      });
    }

    this.performSearch();
  }

  resetAllFilters(performSearch = true) {
    // Reset filter object
    this.activeFilters = {
      query: '',
      contentTypes: ['brand', 'founder', 'insight', 'dimension'],
      dimensions: {
        markets: [],
        sectors: [],
        attributes: [],
        signals: []
      },
      language: '',
      dateAfter: '',
      founderLedOnly: false,
      featuredOnly: false
    };

    // Reset UI elements
    const searchInput = document.getElementById('universal-search-query');
    if (searchInput) searchInput.value = '';

    document.querySelectorAll('input[type="checkbox"]').forEach(cb => {
      if (cb.name === 'content-type') {
        cb.checked = true; // All content types selected by default
      } else {
        cb.checked = false;
      }
    });

    const languageSelect = document.getElementById('language-filter');
    if (languageSelect) languageSelect.value = '';

    const dateInput = document.getElementById('date-range');
    if (dateInput) dateInput.value = '';

    if (performSearch) {
      this.showSearchPlaceholder();
      this.updateActiveFiltersDisplay();
    }
  }

  showSearchPlaceholder() {
    const resultsContainer = document.getElementById('discovery-search-results');
    if (resultsContainer) {
      resultsContainer.innerHTML = `
        <div class="search-placeholder">
          <div class="placeholder-icon">🔍</div>
          <h3>Start your discovery journey</h3>
          <p>Use the search bar above or try one of our popular discovery presets to explore BRICS+ brands, founders, and insights.</p>
        </div>
      `;
    }
  }

  setViewMode(mode) {
    const resultsContainer = document.getElementById('discovery-search-results');
    const buttons = document.querySelectorAll('.view-btn');
    
    if (resultsContainer) {
      resultsContainer.className = `discovery-results-${mode}`;
    }

    buttons.forEach(btn => {
      btn.classList.remove('active');
    });

    const activeBtn = document.getElementById(`${mode}-view-discovery`);
    if (activeBtn) {
      activeBtn.classList.add('active');
    }
  }

  loadMoreResults() {
    this.currentPage++;
    this.displayResults();
  }

  showLoadMore() {
    const container = document.getElementById('load-more-discovery-container');
    if (container) container.style.display = 'block';
  }

  hideLoadMore() {
    const container = document.getElementById('load-more-discovery-container');
    if (container) container.style.display = 'none';
  }

  toggleDimensionExpansion(dimensionType) {
    // Implement show more/less functionality for dimension filters
    console.log(`Toggle expansion for ${dimensionType}`);
  }

  saveCurrentSearch() {
    // Implement search saving functionality
    const searchData = {
      filters: this.activeFilters,
      timestamp: new Date().toISOString(),
      resultCount: this.filteredResults.length
    };
    
    localStorage.setItem('saved-discovery-search', JSON.stringify(searchData));
    alert('Search saved successfully!');
  }

  showError(message) {
    const resultsContainer = document.getElementById('discovery-search-results');
    if (resultsContainer) {
      resultsContainer.innerHTML = `<div class="error-message">${message}</div>`;
    }
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

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  new DiscoverySearch();
});