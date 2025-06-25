/**
 * Insights Search and Filter Functionality
 * Provides text search and advanced filtering for the insights page
 */

class InsightsSearch {
  constructor() {
    this.searchData = [];
    this.insightsData = [];
    this.filteredResults = [];
    this.currentPage = 1;
    this.resultsPerPage = 12;
    this.activeFilters = {
      search: '',
      category: [],
      date_range: 'all',
      reading_time: [],
      market: []
    };

    this.init();
  }

  async init() {
    try {
      await this.loadSearchData();
      await this.loadInsightsData();
      this.setupEventListeners();
      this.performSearch();
    } catch (error) {
      console.error('Failed to initialize insights search:', error);
      this.showError('Failed to load search functionality');
    }
  }

  async loadSearchData() {
    const response = await fetch('/search.json');
    if (!response.ok) throw new Error('Failed to load search data');
    
    const allData = await response.json();
    this.searchData = allData.filter(item => item.type === 'insight');
  }

  async loadInsightsData() {
    try {
      const response = await fetch('/assets/data/insights.json');
      if (!response.ok) throw new Error('Failed to load insights data');
      
      this.insightsData = await response.json();
    } catch (error) {
      // Fallback: generate from search data if insights.json doesn't exist
      console.warn('insights.json not found, using search data');
      this.insightsData = this.searchData.map(item => ({
        ...item,
        date: new Date().toISOString(), // Fallback date
        reading_time: 5, // Default reading time
        markets: [], // Default empty markets
        excerpt: item.excerpt || ''
      }));
    }
  }

  setupEventListeners() {
    // Search input
    const searchInput = document.getElementById('insights-search-query');
    const clearSearch = document.getElementById('clear-insights-search');
    
    if (searchInput) {
      searchInput.addEventListener('input', this.debounce((e) => {
        this.activeFilters.search = e.target.value.trim();
        this.performSearch();
      }, 300));
    }

    if (clearSearch) {
      clearSearch.addEventListener('click', () => {
        searchInput.value = '';
        this.activeFilters.search = '';
        this.performSearch();
      });
    }

    // Category filter checkboxes
    this.setupFilterListeners('category');
    this.setupFilterListeners('reading_time');
    this.setupFilterListeners('market');

    // Date range radio buttons
    this.setupDateRangeListeners();

    // Sort select
    const sortSelect = document.getElementById('insights-sort-select');
    if (sortSelect) {
      sortSelect.addEventListener('change', () => {
        this.performSearch();
      });
    }

    // Reset filters
    const resetButton = document.getElementById('reset-insights-filters');
    const clearAllButton = document.getElementById('clear-all-insights');

    if (resetButton) {
      resetButton.addEventListener('click', () => this.resetFilters());
    }

    if (clearAllButton) {
      clearAllButton.addEventListener('click', () => this.clearAllFilters());
    }

    // View toggle
    const gridViewBtn = document.getElementById('grid-view');
    const listViewBtn = document.getElementById('list-view');

    if (gridViewBtn) {
      gridViewBtn.addEventListener('click', () => this.setViewMode('grid'));
    }

    if (listViewBtn) {
      listViewBtn.addEventListener('click', () => this.setViewMode('list'));
    }

    // Load more
    const loadMoreBtn = document.getElementById('load-more-insights');
    if (loadMoreBtn) {
      loadMoreBtn.addEventListener('click', () => this.loadMore());
    }
  }

  setupFilterListeners(filterType) {
    const container = document.getElementById(`${filterType}-filters`);
    if (!container) return;

    const checkboxes = container.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
      checkbox.addEventListener('change', (e) => {
        const value = e.target.value;
        
        if (e.target.checked) {
          if (!this.activeFilters[filterType].includes(value)) {
            this.activeFilters[filterType].push(value);
          }
        } else {
          this.activeFilters[filterType] = this.activeFilters[filterType].filter(v => v !== value);
        }
        
        this.performSearch();
      });
    });
  }

  setupDateRangeListeners() {
    const container = document.getElementById('date-filters');
    if (!container) return;

    const radioButtons = container.querySelectorAll('input[type="radio"]');
    radioButtons.forEach(radio => {
      radio.addEventListener('change', (e) => {
        if (e.target.checked) {
          this.activeFilters.date_range = e.target.value;
          this.performSearch();
        }
      });
    });
  }

  performSearch() {
    let results = [...this.insightsData];

    // Filter by current page language
    const currentLang = document.documentElement.lang || 'en';
    results = results.filter(insight => insight.lang === currentLang);

    // Text search
    if (this.activeFilters.search) {
      const searchTerm = this.activeFilters.search.toLowerCase();
      results = results.filter(insight => {
        const searchableText = [
          insight.title,
          insight.excerpt,
          insight.category
        ].filter(Boolean).join(' ').toLowerCase();

        return searchableText.includes(searchTerm);
      });
    }

    // Category filter
    if (this.activeFilters.category.length > 0) {
      results = results.filter(insight => 
        this.activeFilters.category.includes(insight.category)
      );
    }

    // Date range filter
    if (this.activeFilters.date_range !== 'all') {
      const now = new Date();
      const filterDate = this.getFilterDate(now, this.activeFilters.date_range);
      
      results = results.filter(insight => {
        const insightDate = new Date(insight.date || insight.updated_at || insight.created_at || now);
        return insightDate >= filterDate;
      });
    }

    // Reading time filter
    if (this.activeFilters.reading_time.length > 0) {
      results = results.filter(insight => {
        const readingTime = insight.reading_time || 5; // Default 5 minutes
        
        return this.activeFilters.reading_time.some(timeRange => {
          switch (timeRange) {
            case 'quick':
              return readingTime < 5;
            case 'medium':
              return readingTime >= 5 && readingTime <= 10;
            case 'long':
              return readingTime > 10;
            default:
              return false;
          }
        });
      });
    }

    // Market filter
    if (this.activeFilters.market.length > 0) {
      results = results.filter(insight => 
        insight.markets && 
        this.activeFilters.market.some(market => insight.markets.includes(market))
      );
    }

    // Sort results
    this.sortResults(results);

    this.filteredResults = results;
    this.currentPage = 1;
    this.displayResults();
    this.updateResultsCount();
    this.updateActiveFilters();
  }

  getFilterDate(now, range) {
    const date = new Date(now);
    
    switch (range) {
      case 'week':
        date.setDate(date.getDate() - 7);
        break;
      case 'month':
        date.setMonth(date.getMonth() - 1);
        break;
      case 'quarter':
        date.setMonth(date.getMonth() - 3);
        break;
      case 'year':
        date.setFullYear(date.getFullYear() - 1);
        break;
      default:
        return new Date(0); // Return epoch for 'all'
    }
    
    return date;
  }

  sortResults(results) {
    const sortSelect = document.getElementById('insights-sort-select');
    const sortBy = sortSelect ? sortSelect.value : 'date';

    results.sort((a, b) => {
      switch (sortBy) {
        case 'title':
          return (a.title || '').localeCompare(b.title || '');
        case 'category':
          return (a.category || '').localeCompare(b.category || '');
        case 'reading_time':
          const aTime = a.reading_time || 5;
          const bTime = b.reading_time || 5;
          return aTime - bTime;
        case 'relevance':
          // For text search, prioritize title matches
          if (this.activeFilters.search) {
            const searchTerm = this.activeFilters.search.toLowerCase();
            const aInTitle = (a.title || '').toLowerCase().includes(searchTerm);
            const bInTitle = (b.title || '').toLowerCase().includes(searchTerm);
            
            if (aInTitle && !bInTitle) return -1;
            if (!aInTitle && bInTitle) return 1;
          }
          // Fall through to date sort
        case 'date':
        default:
          const aDate = new Date(a.date || a.updated_at || a.created_at || 0);
          const bDate = new Date(b.date || b.updated_at || b.created_at || 0);
          return bDate - aDate;
      }
    });
  }

  displayResults() {
    const resultsContainer = document.getElementById('insights-search-results');
    if (!resultsContainer) return;

    const start = (this.currentPage - 1) * this.resultsPerPage;
    const end = start + this.resultsPerPage;
    const pageResults = this.filteredResults.slice(0, end);

    if (pageResults.length === 0) {
      resultsContainer.innerHTML = '<div class="no-results">No insights found matching your criteria.</div>';
      this.hideLoadMore();
      return;
    }

    resultsContainer.innerHTML = pageResults.map(insight => this.createInsightCard(insight)).join('');

    // Show/hide load more button
    if (end < this.filteredResults.length) {
      this.showLoadMore();
    } else {
      this.hideLoadMore();
    }
  }

  createInsightCard(insight) {
    const title = insight.title || 'Untitled';
    const excerpt = insight.excerpt || '';
    const truncatedExcerpt = excerpt.length > 120 ? excerpt.substring(0, 120) + '...' : excerpt;
    const category = insight.category || '';
    const readingTime = insight.reading_time || 5;
    const categoryName = this.getCategoryName(category);

    return `
      <div class="insight-card">
        <a href="${insight.url || '#'}" class="insight-card__link">
          <div class="insight-card__header">
            ${category ? `<span class="insight-card__category insight-card__category--${category}">${categoryName}</span>` : ''}
            <h3 class="insight-card__title">${title}</h3>
          </div>
          
          ${truncatedExcerpt ? `<p class="insight-card__excerpt">${truncatedExcerpt}</p>` : ''}
          
          <div class="insight-card__meta">
            <span class="insight-card__reading-time">${readingTime} min read</span>
            ${insight.date ? `<span class="insight-card__date">${this.formatDate(insight.date)}</span>` : ''}
          </div>
        </a>
      </div>
    `;
  }

  getCategoryName(categoryId) {
    const categoryMap = {
      'brand_spotlight': 'Brand Spotlight',
      'founders_journey': "Founder's Journey",
      'market_momentum': 'Market Momentum',
      'location_intelligence': 'Location Intelligence'
    };
    
    return categoryMap[categoryId] || categoryId;
  }

  formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString(undefined, { 
      year: 'numeric', 
      month: 'short', 
      day: 'numeric' 
    });
  }

  updateResultsCount() {
    const countElement = document.getElementById('insights-results-count');
    if (countElement) {
      const count = this.filteredResults.length;
      const total = this.insightsData.filter(i => i.lang === (document.documentElement.lang || 'en')).length;
      countElement.textContent = `${count} of ${total} insights`;
    }
  }

  updateActiveFilters() {
    const container = document.getElementById('active-insights-filters');
    if (!container) return;

    const filters = [];

    if (this.activeFilters.search) {
      filters.push(`Search: "${this.activeFilters.search}"`);
    }

    if (this.activeFilters.category.length > 0) {
      const categoryNames = this.activeFilters.category.map(cat => this.getCategoryName(cat));
      filters.push(`Category: ${categoryNames.join(', ')}`);
    }

    if (this.activeFilters.date_range !== 'all') {
      const dateRangeNames = {
        'week': 'Past Week',
        'month': 'Past Month',
        'quarter': 'Past Quarter',
        'year': 'Past Year'
      };
      filters.push(`Date: ${dateRangeNames[this.activeFilters.date_range]}`);
    }

    if (this.activeFilters.reading_time.length > 0) {
      const timeNames = {
        'quick': 'Quick Read',
        'medium': 'Medium',
        'long': 'Deep Dive'
      };
      const timeLabels = this.activeFilters.reading_time.map(time => timeNames[time]);
      filters.push(`Reading Time: ${timeLabels.join(', ')}`);
    }

    if (this.activeFilters.market.length > 0) {
      filters.push(`Market: ${this.activeFilters.market.join(', ')}`);
    }

    if (filters.length === 0) {
      container.style.display = 'none';
    } else {
      container.style.display = 'block';
      container.innerHTML = filters.map(filter => 
        `<span class="active-filter">${filter}</span>`
      ).join('');
    }
  }

  resetFilters() {
    // Reset filter objects
    this.activeFilters = {
      search: '',
      category: [],
      date_range: 'all',
      reading_time: [],
      market: []
    };

    // Reset UI elements
    const searchInput = document.getElementById('insights-search-query');
    if (searchInput) searchInput.value = '';

    // Reset all checkboxes
    document.querySelectorAll('.insights-filter input[type="checkbox"]').forEach(cb => {
      cb.checked = false;
    });

    // Reset date range radio buttons
    const allTimeRadio = document.getElementById('date-all');
    if (allTimeRadio) allTimeRadio.checked = true;

    this.performSearch();
  }

  clearAllFilters() {
    this.resetFilters();
  }

  setViewMode(mode) {
    const resultsContainer = document.getElementById('insights-search-results');
    const gridBtn = document.getElementById('grid-view');
    const listBtn = document.getElementById('list-view');

    if (resultsContainer) {
      resultsContainer.className = mode === 'grid' ? 'insights-results-grid' : 'insights-results-list';
    }

    if (gridBtn && listBtn) {
      gridBtn.classList.toggle('active', mode === 'grid');
      listBtn.classList.toggle('active', mode === 'list');
    }
  }

  loadMore() {
    this.currentPage++;
    this.displayResults();
  }

  showLoadMore() {
    const container = document.getElementById('load-more-insights-container');
    if (container) container.style.display = 'block';
  }

  hideLoadMore() {
    const container = document.getElementById('load-more-insights-container');
    if (container) container.style.display = 'none';
  }

  showError(message) {
    const resultsContainer = document.getElementById('insights-search-results');
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
  new InsightsSearch();
});