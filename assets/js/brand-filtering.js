// Brand filtering and display script
document.addEventListener('DOMContentLoaded', function() {
    // Elements
    const searchInput = document.getElementById('brand-search');
    const searchButton = document.getElementById('search-button');
    const brandsContainer = document.getElementById('brands-container');
    const applyFilters = document.getElementById('apply-filters');
    const clearFilters = document.getElementById('clear-filters');
    const loadMoreButton = document.getElementById('load-more');
    const resultsCount = document.getElementById('results-count');
    const sortSelect = document.getElementById('sort-select');
    
    // State
    let allBrands = [];
    let filteredBrands = [];
    let sectors = [];
    let markets = [];
    let attributes = [];
    let signals = [];
    let currentLanguage = document.documentElement.lang || 'en';
    let currentPage = 1;
    let itemsPerPage = 9;
    let activeFilters = {
      sector: [],
      market: [],
      attribute: [],
      signal: []
    };
    
    // Check URL parameters for initial filters
    function getURLParams() {
      const urlParams = new URLSearchParams(window.location.search);
      
      // Set search input if query parameter exists
      const searchQuery = urlParams.get('q');
      if (searchQuery && searchInput) {
        searchInput.value = searchQuery;
      }
      
      // Set sector filter if it exists
      const sectorParam = urlParams.get('sector');
      if (sectorParam) {
        activeFilters.sector.push(sectorParam);
      }
      
      // Set market filter if it exists
      const marketParam = urlParams.get('market');
      if (marketParam) {
        activeFilters.market.push(marketParam);
      }
      
      // Set signal filter if it exists
      const signalParam = urlParams.get('signal');
      if (signalParam) {
        activeFilters.signal.push(signalParam);
      }
    }
    
    // Fetch data
    fetch('/brands-data.json')
      .then(response => response.json())
      .then(data => {
        // Filter data by current language
        allBrands = data.brands.filter(brand => brand.language === currentLanguage);
        sectors = data.sectors.filter(sector => sector.language === currentLanguage);
        markets = data.markets.filter(market => market.language === currentLanguage);
        attributes = data.attributes.filter(attribute => attribute.language === currentLanguage);
        signals = data.signals.filter(signal => signal.language === currentLanguage);
        
        // Get URL params for initial filtering
        getURLParams();
        
        // Initialize
        populateFilterOptions();
        applyBrandFilters(); // This will filter and display brands
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        if (brandsContainer) {
          brandsContainer.innerHTML = '<p class="error-message">Error loading brands. Please try again later.</p>';
        }
      });
    
    // Populate filter options
    function populateFilterOptions() {
      const sectorFilters = document.getElementById('sector-filters');
      const marketFilters = document.getElementById('market-filters');
      const attributeFilters = document.getElementById('attribute-filters');
      const signalFilters = document.getElementById('signal-filters');
      
      if (!sectorFilters || !marketFilters || !attributeFilters || !signalFilters) {
        return; // Exit if filter containers aren't found
      }
      
      // Populate sectors
      sectors.forEach(sector => {
        const checkbox = createFilterCheckbox(sector.id, sector.name, 'sector');
        
        // Check the checkbox if it's in the active filters
        if (activeFilters.sector.includes(sector.id)) {
          checkbox.querySelector('input').checked = true;
        }
        
        sectorFilters.appendChild(checkbox);
      });
      
      // Populate markets
      markets.forEach(market => {
        const checkbox = createFilterCheckbox(market.id, market.name, 'market');
        
        // Check the checkbox if it's in the active filters
        if (activeFilters.market.includes(market.id)) {
          checkbox.querySelector('input').checked = true;
        }
        
        marketFilters.appendChild(checkbox);
      });
      
      // Populate attributes
      attributes.forEach(attribute => {
        const checkbox = createFilterCheckbox(attribute.id, attribute.name, 'attribute');
        attributeFilters.appendChild(checkbox);
      });
      
      // Populate signals
      signals.forEach(signal => {
        const checkbox = createFilterCheckbox(signal.id, signal.name, 'signal');
        signalFilters.appendChild(checkbox);
      });
    }
    
    // Create filter checkbox
    function createFilterCheckbox(id, name, type) {
      const label = document.createElement('label');
      label.className = 'filter-option';
      
      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.value = id;
      checkbox.dataset.filterType = type;
      
      label.appendChild(checkbox);
      label.appendChild(document.createTextNode(' ' + name));
      
      // Add event listener to track active filters
      checkbox.addEventListener('change', function() {
        if (this.checked) {
          activeFilters[type].push(id);
        } else {
          const index = activeFilters[type].indexOf(id);
          if (index > -1) {
            activeFilters[type].splice(index, 1);
          }
        }
      });
      
      return label;
    }
    
    // Apply filters
    function applyBrandFilters() {
      currentPage = 1;
      
      filteredBrands = allBrands.filter(brand => {
        // Search text filter
        const searchTerm = searchInput ? searchInput.value.toLowerCase() : '';
        const matchesSearch = searchTerm === '' || 
                             brand.name.toLowerCase().includes(searchTerm) ||
                             brand.description.toLowerCase().includes(searchTerm);
        
        // Sector filter
        const matchesSector = activeFilters.sector.length === 0 || 
                             activeFilters.sector.includes(brand.sector);
        
        // Market filter
        const matchesMarket = activeFilters.market.length === 0 || 
                             activeFilters.market.includes(brand.country);
        
        // Attribute filter
        const matchesAttribute = activeFilters.attribute.length === 0 || 
                                activeFilters.attribute.some(attr => brand.attributes.includes(attr));
        
        // Signal filter
        const matchesSignal = activeFilters.signal.length === 0 || 
                             activeFilters.signal.some(signal => brand.signals.includes(signal));
        
        return matchesSearch && matchesSector && matchesMarket && matchesAttribute && matchesSignal;
      });
      
      // Sort results
      sortBrands();
      
      // Update results count
      updateResultsCount();
      
      // Display brands
      displayBrands();
    }
    
    // Sort brands based on selected option
    function sortBrands() {
      if (!sortSelect) return;
      
      const sortBy = sortSelect.value;
      
      filteredBrands.sort((a, b) => {
        if (sortBy === 'name') {
          return a.name.localeCompare(b.name);
        } else if (sortBy === 'sector') {
          return a.sector.localeCompare(b.sector);
        } else if (sortBy === 'country') {
          return a.country.localeCompare(b.country);
        }
        return 0;
      });
    }
    
    // Update results count
    function updateResultsCount() {
      if (!resultsCount) return;
      
      const translations = {
        en: {
          showing: 'Showing',
          brands: 'brands',
          no_results: 'No brands found matching your criteria'
        },
        ru: {
          showing: 'Показано',
          brands: 'брендов',
          no_results: 'Не найдено брендов, соответствующих вашим критериям'
        },
        zh: {
          showing: '显示',
          brands: '品牌',
          no_results: '没有找到符合您条件的品牌'
        }
      };
      
      const t = translations[currentLanguage];
      
      if (filteredBrands.length > 0) {
        resultsCount.textContent = `${t.showing} ${filteredBrands.length} ${t.brands}`;
      } else {
        resultsCount.textContent = t.no_results;
      }
    }
    
    // Display brands
    function displayBrands() {
      if (!brandsContainer) return;
      
      brandsContainer.innerHTML = '';
      
      const startIndex = (currentPage - 1) * itemsPerPage;
      const endIndex = startIndex + itemsPerPage;
      const brandsToShow = filteredBrands.slice(startIndex, endIndex);
      
      if (brandsToShow.length === 0) {
        brandsContainer.innerHTML = `<p class="no-results">${
          currentLanguage === 'en' ? 'No brands found matching your criteria' :
          currentLanguage === 'ru' ? 'Не найдено брендов, соответствующих вашим критериям' :
          '没有找到符合您条件的品牌'
        }</p>`;
        
        if (loadMoreButton) {
          loadMoreButton.style.display = 'none';
        }
        return;
      }
      
      brandsToShow.forEach(brand => {
        const brandCard = document.createElement('div');
        brandCard.className = 'brand-card';
        
        // Add premium class if it's a premium brand
        if (brand.premium) {
          brandCard.classList.add('premium-brand');
        }
        
        // Create badge elements for signals
        const signalBadges = brand.signals.map(signal => {
          const signalObj = signals.find(s => s.id === signal);
          return signalObj ? `<span class="signal-badge">${signalObj.name}</span>` : '';
        }).join('');
        
        brandCard.innerHTML = `
          <div class="brand-logo">
            ${brand.logo ? `<img src="${brand.logo}" alt="${brand.name} logo">` : '<div class="logo-placeholder"></div>'}
          </div>
          <h3><a href="${brand.url}">${brand.name}</a></h3>
          <p>${brand.description}</p>
          <div class="brand-meta">
            <span class="brand-sector">${brand.sector}</span>
            <span class="brand-country">${brand.country}</span>
          </div>
          <div class="brand-signals">
            ${signalBadges}
          </div>
          <a href="${brand.url}" class="btn-primary">${
            currentLanguage === 'en' ? 'View Profile' :
            currentLanguage === 'ru' ? 'Открыть профиль' :
            '查看资料'
          }</a>
        `;
        
        brandsContainer.appendChild(brandCard);
      });
      
      // Show/hide load more button
      if (loadMoreButton) {
        if (endIndex < filteredBrands.length) {
          loadMoreButton.style.display = 'block';
        } else {
          loadMoreButton.style.display = 'none';
        }
      }
    }
    
    // Load more brands
    function loadMoreBrands() {
      currentPage++;
      displayBrands();
    }
    
    // Event listeners
    if (searchButton) {
      searchButton.addEventListener('click', applyBrandFilters);
    }
    
    if (searchInput) {
      searchInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
          applyBrandFilters();
        }
      });
    }
    
    if (applyFilters) {
      applyFilters.addEventListener('click', applyBrandFilters);
    }
    
    if (clearFilters) {
      clearFilters.addEventListener('click', function() {
        // Clear search input
        if (searchInput) {
          searchInput.value = '';
        }
        
        // Uncheck all checkboxes
        document.querySelectorAll('.filter-option input[type="checkbox"]').forEach(checkbox => {
          checkbox.checked = false;
        });
        
        // Reset active filters
        activeFilters = {
          sector: [],
          market: [],
          attribute: [],
          signal: []
        };
        
        // Reset to page 1
        currentPage = 1;
        
        // Apply filters (which will now show all brands)
        applyBrandFilters();
      });
    }
    
    if (loadMoreButton) {
      loadMoreButton.addEventListener('click', loadMoreBrands);
    }
    
    if (sortSelect) {
      sortSelect.addEventListener('change', function() {
        sortBrands();
        currentPage = 1; // Reset to first page
        displayBrands();
      });
    }
  });
  