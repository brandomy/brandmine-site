/**
 * Brands Filtering and Search
 * 
 * Handles the dynamic filtering, searching, and sorting of brand cards
 * on the brands index page.
 */

document.addEventListener('DOMContentLoaded', function() {
  // Elements
  const brandCards = document.querySelectorAll('.brand-card');
  const brandsContainer = document.getElementById('brands-container');
  const searchInput = document.getElementById('brand-search');
  const searchButton = document.getElementById('search-button');
  const sortSelect = document.getElementById('sort-select');
  const featuredSelect = document.getElementById('featured-select');
  const loadMoreButton = document.getElementById('load-more');
  const emptyResults = document.getElementById('empty-results');
  const resultsCount = document.getElementById('results-count');
  
  // Constants
  const INITIAL_DISPLAY_COUNT = 12;
  let currentDisplayCount = INITIAL_DISPLAY_COUNT;
  
  // Initialize data attributes for brand cards
  brandCards.forEach(card => {
    // Ensure all necessary data attributes for filtering and sorting are set
    if (card.dataset.name) {
      card.dataset.brandName = card.dataset.name; // Backward compatibility
    }
    if (card.dataset.featuredLevel) {
      card.dataset.featured = card.dataset.featuredLevel > 0 ? 'true' : 'false';
    }
  });
  
  // Filter state
  let activeFilters = {
    search: '',
    sectors: [],
    markets: [],
    attributes: [],
    signals: [],
    featured: 'all'
  };
  
  // Search functionality
  if (searchButton && searchInput) {
    searchButton.addEventListener('click', () => {
      activeFilters.search = searchInput.value.trim().toLowerCase();
      currentDisplayCount = INITIAL_DISPLAY_COUNT;
      applyFilters();
    });
    
    searchInput.addEventListener('keypress', (e) => {
      if (e.key === 'Enter') {
        activeFilters.search = searchInput.value.trim().toLowerCase();
        currentDisplayCount = INITIAL_DISPLAY_COUNT;
        applyFilters();
      }
    });
  }
  
  // Featured filter
  if (featuredSelect) {
    featuredSelect.addEventListener('change', function() {
      activeFilters.featured = this.value;
      currentDisplayCount = INITIAL_DISPLAY_COUNT;
      applyFilters();
    });
  }
  
  // Sort functionality
  if (sortSelect) {
    sortSelect.addEventListener('change', function() {
      sortBrands(this.value);
      applyFilters();
    });
  }
  
  // Load more
  if (loadMoreButton) {
    loadMoreButton.addEventListener('click', function() {
      currentDisplayCount += INITIAL_DISPLAY_COUNT;
      applyFilters();
    });
  }
  
  // Initialize filters from URL params
  initFiltersFromUrl();
  
  // Listen for filter changes
  document.addEventListener('filter-update', function(e) {
    if (e.detail) {
      const { type, value } = e.detail;
      
      if (type === 'sector') {
        updateFilterArray('sectors', value);
      } else if (type === 'market') {
        updateFilterArray('markets', value);
      } else if (type === 'attribute') {
        updateFilterArray('attributes', value);
      } else if (type === 'signal') {
        updateFilterArray('signals', value);
      } else if (type === 'featured') {
        activeFilters.featured = value;
      }
      
      currentDisplayCount = INITIAL_DISPLAY_COUNT;
      applyFilters();
    }
  });
  
  /**
   * Apply all active filters to the brand cards
   */
  function applyFilters() {
    let matchCount = 0;
    let visibleCount = 0;
    
    brandCards.forEach(card => {
      let matches = true;
      
      // Search filter
      if (activeFilters.search && !card.textContent.toLowerCase().includes(activeFilters.search)) {
        matches = false;
      }
      
      // Featured filter
      if (activeFilters.featured !== 'all') {
        const isFeatured = card.dataset.featured === 'true';
        if ((activeFilters.featured === 'featured' && !isFeatured) || 
            (activeFilters.featured === 'standard' && isFeatured)) {
          matches = false;
        }
      }
      
      // Sector filter
      if (activeFilters.sectors.length > 0) {
        const cardSectors = card.dataset.sectors ? card.dataset.sectors.split(',') : [];
        if (!activeFilters.sectors.some(sector => cardSectors.includes(sector))) {
          matches = false;
        }
      }
      
      // Market filter
      if (activeFilters.markets.length > 0) {
        const cardMarkets = card.dataset.markets ? card.dataset.markets.split(',') : [];
        if (!activeFilters.markets.some(market => cardMarkets.includes(market))) {
          matches = false;
        }
      }
      
      // Attribute filter
      if (activeFilters.attributes.length > 0) {
        const cardAttributes = card.dataset.attributes ? card.dataset.attributes.split(',') : [];
        if (!activeFilters.attributes.some(attr => cardAttributes.includes(attr))) {
          matches = false;
        }
      }
      
      // Signal filter
      if (activeFilters.signals.length > 0) {
        const cardSignals = card.dataset.signals ? card.dataset.signals.split(',') : [];
        if (!activeFilters.signals.some(signal => cardSignals.includes(signal))) {
          matches = false;
        }
      }
      
      // Update card visibility
      if (matches) {
        matchCount++;
        if (matchCount <= currentDisplayCount) {
          card.style.display = '';
          visibleCount++;
        } else {
          card.style.display = 'none';
        }
      } else {
        card.style.display = 'none';
      }
    });
    
    // Update results count
    updateResultsCount(matchCount);
    
    // Show/hide empty results message
    emptyResults.style.display = matchCount === 0 ? 'block' : 'none';
    
    // Show/hide load more button
    loadMoreButton.style.display = visibleCount < matchCount ? 'block' : 'none';
    
    // Update URL parameters
    updateUrlParams();
  }
  
  /**
   * Sort brands based on the selected criteria
   */
  function sortBrands(sortBy) {
    const brands = Array.from(brandCards);
    
    brands.sort((a, b) => {
      if (sortBy === 'name') {
        return (a.dataset.name || '').localeCompare(b.dataset.name || '');
      } else if (sortBy === 'sector') {
        return (a.dataset.sector || '').localeCompare(b.dataset.sector || '');
      } else if (sortBy === 'market') {
        return (a.dataset.market || '').localeCompare(b.dataset.market || '');
      } else if (sortBy === 'founded') {
        const yearA = parseInt(a.dataset.foundingYear || '0', 10);
        const yearB = parseInt(b.dataset.foundingYear || '0', 10);
        return yearB - yearA; // Sort descending (newest first)
      }
      return 0;
    });
    
    // Reorder elements in the DOM
    brands.forEach(brand => {
      brandsContainer.appendChild(brand);
    });
  }
  
  /**
   * Update filter array (add/remove values)
   */
  function updateFilterArray(filterType, value) {
    const index = activeFilters[filterType].indexOf(value);
    
    if (index > -1) {
      // Remove value if already present
      activeFilters[filterType].splice(index, 1);
    } else {
      // Add value if not present
      activeFilters[filterType].push(value);
    }
  }
  
  /**
   * Update results count text
   */
  function updateResultsCount(count) {
    if (resultsCount) {
      const translations = window.translations || {};
      const brandSingular = translations.brandSingular || 'brand';
      const brandPlural = translations.brandPlural || 'brands';
      
      resultsCount.textContent = count === 1 
        ? `1 ${brandSingular}`
        : `${count} ${brandPlural}`;
    }
  }
  
  /**
   * Initialize filters from URL parameters
   */
  function initFiltersFromUrl() {
    const params = new URLSearchParams(window.location.search);
    
    if (params.has('search') && searchInput) {
      const searchTerm = params.get('search');
      searchInput.value = searchTerm;
      activeFilters.search = searchTerm.toLowerCase();
    }
    
    if (params.has('featured') && featuredSelect) {
      const featured = params.get('featured');
      featuredSelect.value = featured;
      activeFilters.featured = featured;
    }
    
    // Apply initial filters
    applyFilters();
  }
  
  /**
   * Update URL parameters based on active filters
   */
  function updateUrlParams() {
    const params = new URLSearchParams();
    
    if (activeFilters.search) {
      params.set('search', activeFilters.search);
    }
    
    if (activeFilters.featured !== 'all') {
      params.set('featured', activeFilters.featured);
    }
    
    if (activeFilters.sectors.length > 0) {
      params.set('sectors', activeFilters.sectors.join(','));
    }
    
    if (activeFilters.markets.length > 0) {
      params.set('markets', activeFilters.markets.join(','));
    }
    
    if (activeFilters.attributes.length > 0) {
      params.set('attributes', activeFilters.attributes.join(','));
    }
    
    if (activeFilters.signals.length > 0) {
      params.set('signals', activeFilters.signals.join(','));
    }
    
    // Update URL without reload
    const url = params.toString().length > 0
      ? `${window.location.pathname}?${params.toString()}`
      : window.location.pathname;
      
    window.history.replaceState({}, '', url);
  }
  
  // Apply initial filters
  applyFilters();
});