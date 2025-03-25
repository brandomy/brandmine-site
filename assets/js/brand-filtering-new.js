document.addEventListener('DOMContentLoaded', function() {
  // Elements
  const brandsContainer = document.getElementById('brands-container');
  const searchInput = document.getElementById('brand-search');
  const searchButton = document.getElementById('search-button');
  const applyFiltersButton = document.getElementById('apply-filters');
  const clearFiltersButton = document.getElementById('clear-filters');
  const loadMoreButton = document.getElementById('load-more');
  const resultsCount = document.getElementById('results-count');
  const sortSelect = document.getElementById('sort-select');
  
  // Filter containers
  const sectorFilters = document.getElementById('sector-filters');
  const marketFilters = document.getElementById('market-filters');
  const attributeFilters = document.getElementById('attribute-filters');
  const signalFilters = document.getElementById('signal-filters');
  
  // State
  let brands = [];
  let filteredBrands = [];
  let currentPage = 1;
  const perPage = 9;
  let currentLang = document.documentElement.lang || 'en';
  let currentFilters = {
    sectors: [],
    markets: [],
    attributes: [],
    signals: []
  };
  
  // Load brand data
  async function loadBrands() {
    try {
      const response = await fetch('/assets/data/brands-data.json');
      const data = await response.json();
      
      // Filter brands by current language
      brands = data.brands.filter(brand => brand.language === currentLang);
      
      // Initialize filters
      initializeFilters(data);
      
      // Initial display
      filteredBrands = [...brands];
      displayBrands();
      updateResultsCount();
    } catch (error) {
      console.error('Error loading brand data:', error);
    }
  }
  
  // Initialize filter options
  function initializeFilters(data) {
    // Get filter categories for current language
    const sectors = data.sectors.filter(item => item.language === currentLang);
    const markets = data.markets.filter(item => item.language === currentLang);
    const attributes = data.attributes.filter(item => item.language === currentLang);
    const signals = data.signals.filter(item => item.language === currentLang);
    
    // Populate filter sections
    populateFilterSection(sectorFilters, sectors, 'sectors');
    populateFilterSection(marketFilters, markets, 'markets');
    populateFilterSection(attributeFilters, attributes, 'attributes');
    populateFilterSection(signalFilters, signals, 'signals');
  }
  
  // Create filter checkboxes
  function populateFilterSection(container, items, filterType) {
    container.innerHTML = '';
    
    items.forEach(item => {
      const filterItem = document.createElement('div');
      filterItem.className = 'filter-item';
      
      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.id = `${filterType}-${item.id}`;
      checkbox.dataset.type = filterType;
      checkbox.dataset.value = item.id;
      
      const label = document.createElement('label');
      label.htmlFor = `${filterType}-${item.id}`;
      label.textContent = item.name;
      
      filterItem.appendChild(checkbox);
      filterItem.appendChild(label);
      container.appendChild(filterItem);
    });
  }
  
  // Apply filters
  function applyFilters() {
    // Get selected filters
    currentFilters = {
      sectors: getSelectedFilters('sectors'),
      markets: getSelectedFilters('markets'),
      attributes: getSelectedFilters('attributes'),
      signals: getSelectedFilters('signals')
    };
    
    // Filter brands
    filteredBrands = brands.filter(brand => {
      // Search text filter
      if (searchInput.value && !brandMatchesSearch(brand, searchInput.value)) {
        return false;
      }
      
      // Category filters
      if (currentFilters.sectors.length && !containsAny(brand.sectors, currentFilters.sectors)) {
        return false;
      }
      
      if (currentFilters.markets.length && !containsAny(brand.markets, currentFilters.markets)) {
        return false;
      }
      
      if (currentFilters.attributes.length && !containsAny(brand.attributes, currentFilters.attributes)) {
        return false;
      }
      
      if (currentFilters.signals.length && !containsAny(brand.signals, currentFilters.signals)) {
        return false;
      }
      
      return true;
    });
    
    // Sort filtered brands
    sortBrands();
    
    // Reset to first page and display
    currentPage = 1;
    displayBrands();
    updateResultsCount();
  }
  
  // Get selected filters by type
  function getSelectedFilters(type) {
    const selected = [];
    const checkboxes = document.querySelectorAll(`input[data-type="${type}"]:checked`);
    
    checkboxes.forEach(checkbox => {
      selected.push(checkbox.dataset.value);
    });
    
    return selected;
  }
  
  // Check if brand matches search text
  function brandMatchesSearch(brand, searchText) {
    searchText = searchText.toLowerCase();
    
    return (
      brand.title.toLowerCase().includes(searchText) ||
      brand.description.toLowerCase().includes(searchText) ||
      (brand.sectors && brand.sectors.some(sector => sector.toLowerCase().includes(searchText))) ||
      (brand.markets && brand.markets.some(market => market.toLowerCase().includes(searchText)))
    );
  }
  
  // Check if arrays have at least one common element
  function containsAny(array1, array2) {
    return array1.some(item => array2.includes(item));
  }
  
  // Sort brands based on selected option
  function sortBrands() {
    const sortBy = sortSelect.value;
    
    filteredBrands.sort((a, b) => {
      switch (sortBy) {
        case 'name':
          return a.title.localeCompare(b.title);
        case 'sector':
          return a.sectors[0].localeCompare(b.sectors[0]);
        case 'country':
          return a.markets[0].localeCompare(b.markets[0]);
        default:
          return 0;
      }
    });
  }
  
  // Display brands with pagination
  function displayBrands() {
    brandsContainer.innerHTML = '';
    
    const start = (currentPage - 1) * perPage;
    const end = start + perPage;
    const brandsToShow = filteredBrands.slice(start, end);
    
    if (brandsToShow.length === 0) {
      brandsContainer.innerHTML = '<p class="no-results">No brands match your criteria.</p>';
      loadMoreButton.style.display = 'none';
      return;
    }
    
    brandsToShow.forEach(brand => {
      // This would typically call a template or include
      // For MVP we'll use basic HTML
      const brandCard = document.createElement('div');
      brandCard.className = 'brand-card';
      
      brandCard.innerHTML = `
        <div class="brand-logo">
          ${brand.logo ? `<img src="${brand.logo}" alt="${brand.title} logo">` : ''}
        </div>
        <div class="brand-content">
          <h3><a href="${brand.url}">${brand.title}</a></h3>
          <p>${brand.description}</p>
          <div class="brand-tags">
            ${brand.sectors.map(sector => `<span class="tag sector-tag">${sector}</span>`).join('')}
            ${brand.markets.map(market => `<span class="tag market-tag">${market}</span>`).join('')}
          </div>
        </div>
      `;
      
      brandsContainer.appendChild(brandCard);
    });
    
    // Show/hide load more button
    loadMoreButton.style.display = end < filteredBrands.length ? 'block' : 'none';
  }
  
  // Update results count
  function updateResultsCount() {
    if (filteredBrands.length === brands.length) {
      resultsCount.textContent = 'All Brands';
    } else {
      resultsCount.textContent = `${filteredBrands.length} Results`;
    }
  }
  
  // Load more results
  function loadMore() {
    currentPage++;
    displayBrands();
  }
  
  // Clear all filters
  function clearFilters() {
    // Clear checkboxes
    document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
      checkbox.checked = false;
    });
    
    // Clear search
    searchInput.value = '';
    
    // Reset filters
    currentFilters = {
      sectors: [],
      markets: [],
      attributes: [],
      signals: []
    };
    
    // Reset brands and display
    filteredBrands = [...brands];
    currentPage = 1;
    displayBrands();
    updateResultsCount();
  }
  
  // Event listeners
  if (searchButton) searchButton.addEventListener('click', applyFilters);
  if (searchInput) searchInput.addEventListener('keyup', event => {
    if (event.key === 'Enter') applyFilters();
  });
  if (applyFiltersButton) applyFiltersButton.addEventListener('click', applyFilters);
  if (clearFiltersButton) clearFiltersButton.addEventListener('click', clearFilters);
  if (loadMoreButton) loadMoreButton.addEventListener('click', loadMore);
  if (sortSelect) sortSelect.addEventListener('change', () => {
    sortBrands();
    currentPage = 1;
    displayBrands();
  });
  
  // Initialize
  loadBrands();
});