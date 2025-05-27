/**
 * Founders Search and Filter Functionality
 * Provides text search and advanced filtering for the founders page
 */

class FoundersSearch {
  constructor() {
    this.searchData = [];
    this.foundersData = [];
    this.filteredResults = [];
    this.currentPage = 1;
    this.resultsPerPage = 12;
    this.activeFilters = {
      search: '',
      market: [],
      languages: [],
      expertise: [],
      cross_border: false,
      international_expansion: false,
      generation: []
    };

    this.init();
  }

  async init() {
    try {
      await this.loadSearchData();
      await this.loadFoundersData();
      this.setupEventListeners();
      this.performSearch();
    } catch (error) {
      console.error('Failed to initialize founders search:', error);
      this.showError('Failed to load search functionality');
    }
  }

  async loadSearchData() {
    const response = await fetch('/search.json');
    if (!response.ok) throw new Error('Failed to load search data');
    
    const allData = await response.json();
    this.searchData = allData.filter(item => item.type === 'founder');
  }

  async loadFoundersData() {
    const response = await fetch('/assets/data/founders.json');
    if (!response.ok) throw new Error('Failed to load founders data');
    
    this.foundersData = await response.json();
  }

  setupEventListeners() {
    // Search input
    const searchInput = document.getElementById('founders-search-query');
    const clearSearch = document.getElementById('clear-founders-search');
    
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

    // Filter checkboxes
    this.setupFilterListeners('market');
    this.setupFilterListeners('languages');
    this.setupFilterListeners('expertise');
    this.setupFilterListeners('generation');

    // Cross-border checkboxes
    const crossBorderCheckbox = document.getElementById('cross-border-yes');
    const intlExpansionCheckbox = document.getElementById('international-expansion');

    if (crossBorderCheckbox) {
      crossBorderCheckbox.addEventListener('change', (e) => {
        this.activeFilters.cross_border = e.target.checked;
        this.performSearch();
      });
    }

    if (intlExpansionCheckbox) {
      intlExpansionCheckbox.addEventListener('change', (e) => {
        this.activeFilters.international_expansion = e.target.checked;
        this.performSearch();
      });
    }

    // Sort select
    const sortSelect = document.getElementById('founders-sort-select');
    if (sortSelect) {
      sortSelect.addEventListener('change', () => {
        this.performSearch();
      });
    }

    // Reset filters
    const resetButton = document.getElementById('reset-founders-filters');
    const clearAllButton = document.getElementById('clear-all-founders');

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
    const loadMoreBtn = document.getElementById('load-more-founders');
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

  performSearch() {
    let results = [...this.foundersData];

    // Filter by current page language
    const currentLang = document.documentElement.lang || 'en';
    results = results.filter(founder => founder.lang === currentLang);

    // Text search
    if (this.activeFilters.search) {
      const searchTerm = this.activeFilters.search.toLowerCase();
      results = results.filter(founder => {
        const searchableText = [
          founder.name,
          founder.biography && founder.biography[currentLang],
          founder.position && founder.position[currentLang],
          founder.brands?.join(' '),
          founder.expertise?.join(' '),
          founder.languages?.join(' ')
        ].filter(Boolean).join(' ').toLowerCase();

        return searchableText.includes(searchTerm);
      });
    }

    // Market filter
    if (this.activeFilters.market.length > 0) {
      results = results.filter(founder => 
        this.activeFilters.market.includes(founder.country)
      );
    }

    // Languages filter
    if (this.activeFilters.languages.length > 0) {
      results = results.filter(founder => 
        founder.languages && 
        this.activeFilters.languages.some(lang => founder.languages.includes(lang))
      );
    }

    // Expertise filter
    if (this.activeFilters.expertise.length > 0) {
      results = results.filter(founder => 
        founder.expertise && 
        this.activeFilters.expertise.some(exp => founder.expertise.includes(exp))
      );
    }

    // Generation filter
    if (this.activeFilters.generation.length > 0) {
      results = results.filter(founder => 
        this.activeFilters.generation.includes(founder.generation)
      );
    }

    // Cross-border filter
    if (this.activeFilters.cross_border) {
      results = results.filter(founder => founder.cross_border_expertise);
    }

    // International expansion filter
    if (this.activeFilters.international_expansion) {
      results = results.filter(founder => 
        founder.markets && founder.markets.length > 1
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

  sortResults(results) {
    const sortSelect = document.getElementById('founders-sort-select');
    const sortBy = sortSelect ? sortSelect.value : 'name';
    const currentLang = document.documentElement.lang || 'en';

    results.sort((a, b) => {
      switch (sortBy) {
        case 'market':
          return (a.country || '').localeCompare(b.country || '');
        case 'languages':
          const aLangs = a.languages ? a.languages.length : 0;
          const bLangs = b.languages ? b.languages.length : 0;
          return bLangs - aLangs;
        case 'expertise':
          const aExp = a.expertise ? a.expertise.length : 0;
          const bExp = b.expertise ? b.expertise.length : 0;
          return bExp - aExp;
        case 'recent':
          return new Date(b.updated_at || b.created_at || 0) - new Date(a.updated_at || a.created_at || 0);
        case 'name':
        default:
          const aName = a.name && a.name[currentLang] ? a.name[currentLang] : a.name || '';
          const bName = b.name && b.name[currentLang] ? b.name[currentLang] : b.name || '';
          return aName.localeCompare(bName);
      }
    });
  }

  displayResults() {
    const resultsContainer = document.getElementById('founders-search-results');
    if (!resultsContainer) return;

    const start = (this.currentPage - 1) * this.resultsPerPage;
    const end = start + this.resultsPerPage;
    const pageResults = this.filteredResults.slice(0, end);

    if (pageResults.length === 0) {
      resultsContainer.innerHTML = '<div class="no-results">No founders found matching your criteria.</div>';
      this.hideLoadMore();
      return;
    }

    const currentLang = document.documentElement.lang || 'en';
    resultsContainer.innerHTML = pageResults.map(founder => this.createFounderCard(founder, currentLang)).join('');

    // Show/hide load more button
    if (end < this.filteredResults.length) {
      this.showLoadMore();
    } else {
      this.hideLoadMore();
    }
  }

  createFounderCard(founder, currentLang) {
    const name = founder.name && founder.name[currentLang] ? founder.name[currentLang] : founder.name || 'Unknown';
    const position = founder.position && founder.position[currentLang] ? founder.position[currentLang] : founder.position || '';
    const biography = founder.biography && founder.biography[currentLang] ? founder.biography[currentLang] : founder.biography || '';
    const truncatedBio = biography.length > 120 ? biography.substring(0, 120) + '...' : biography;

    return `
      <div class="founder-card">
        <a href="${founder.url || '#'}" class="founder-card__link">
          <div class="founder-card__header">
            <h3 class="founder-card__name">${name}</h3>
            ${position ? `<p class="founder-card__position">${position}</p>` : ''}
          </div>
          
          ${truncatedBio ? `<p class="founder-card__bio">${truncatedBio}</p>` : ''}
          
          <div class="founder-card__details">
            ${founder.country ? `<span class="founder-card__country">${founder.country}</span>` : ''}
            ${founder.generation ? `<span class="founder-card__generation">${founder.generation}</span>` : ''}
          </div>
          
          ${founder.languages ? `
            <div class="founder-card__languages">
              <strong>Languages:</strong> ${founder.languages.slice(0, 3).join(', ')}${founder.languages.length > 3 ? '...' : ''}
            </div>
          ` : ''}
          
          ${founder.expertise ? `
            <div class="founder-card__expertise">
              <strong>Expertise:</strong> ${founder.expertise.slice(0, 2).join(', ')}${founder.expertise.length > 2 ? '...' : ''}
            </div>
          ` : ''}
        </a>
      </div>
    `;
  }

  updateResultsCount() {
    const countElement = document.getElementById('founders-results-count');
    if (countElement) {
      const count = this.filteredResults.length;
      const total = this.foundersData.filter(f => f.lang === (document.documentElement.lang || 'en')).length;
      countElement.textContent = `${count} of ${total} founders`;
    }
  }

  updateActiveFilters() {
    const container = document.getElementById('active-founders-filters');
    if (!container) return;

    const filters = [];

    if (this.activeFilters.search) {
      filters.push(`Search: "${this.activeFilters.search}"`);
    }

    ['market', 'languages', 'expertise', 'generation'].forEach(filterType => {
      if (this.activeFilters[filterType].length > 0) {
        filters.push(`${filterType}: ${this.activeFilters[filterType].join(', ')}`);
      }
    });

    if (this.activeFilters.cross_border) {
      filters.push('Cross-border experience');
    }

    if (this.activeFilters.international_expansion) {
      filters.push('International expansion');
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
      market: [],
      languages: [],
      expertise: [],
      cross_border: false,
      international_expansion: false,
      generation: []
    };

    // Reset UI elements
    const searchInput = document.getElementById('founders-search-query');
    if (searchInput) searchInput.value = '';

    // Reset all checkboxes
    document.querySelectorAll('#founders-search input[type="checkbox"]').forEach(cb => {
      cb.checked = false;
    });

    this.performSearch();
  }

  clearAllFilters() {
    this.resetFilters();
  }

  setViewMode(mode) {
    const resultsContainer = document.getElementById('founders-search-results');
    const gridBtn = document.getElementById('grid-view');
    const listBtn = document.getElementById('list-view');

    if (resultsContainer) {
      resultsContainer.className = mode === 'grid' ? 'founders-results-grid' : 'founders-results-list';
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
    const container = document.getElementById('load-more-founders-container');
    if (container) container.style.display = 'block';
  }

  hideLoadMore() {
    const container = document.getElementById('load-more-founders-container');
    if (container) container.style.display = 'none';
  }

  showError(message) {
    const resultsContainer = document.getElementById('founders-search-results');
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
  new FoundersSearch();
});