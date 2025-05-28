/**
 * Advanced Search for Brandmine
 * Supports complex multi-dimensional filtering for brands and founders
 */

class BrandmineSearch {
  constructor() {
    this.data = {
      brands: [],
      founders: [],
      dimensions: {}
    };
    this.filters = {
      query: '',
      sectors: [],
      markets: [],
      attributes: [],
      signals: [],
      founding_year_min: null,
      founding_year_max: null,
      founder_led: null,
      featured_only: false
    };
    this.init();
  }

  async init() {
    await this.loadData();
    this.setupEventListeners();
    this.updateFromURL();
    this.render();
  }

  async loadData() {
    try {
      // Try to load from Jekyll's generated site data first
      const baseUrl = window.location.origin;
      
      const [brandsRes, foundersRes, dimensionsRes] = await Promise.all([
        fetch(`${baseUrl}/assets/data/brands.json`),
        fetch(`${baseUrl}/assets/data/founders.json`), 
        fetch(`${baseUrl}/assets/data/dimensions.json`)
      ]);

      this.data.brands = await brandsRes.json();
      this.data.founders = await foundersRes.json();
      this.data.dimensions = await dimensionsRes.json();

      console.log(`Loaded ${this.data.brands.length} brands, ${this.data.founders.length} founders`);
      
      // Initialize filter options after data loads
      this.initializeFilterOptions();
    } catch (error) {
      console.error('Failed to load search data:', error);
      // Fallback to Jekyll's direct data access
      try {
        // Use Jekyll's site.data directly if available
        if (window.jekyllData) {
          this.data.brands = window.jekyllData.brands || [];
          this.data.founders = window.jekyllData.founders || [];
          this.data.dimensions = window.jekyllData.dimensions || {};
          this.initializeFilterOptions();
          return;
        }
        
        // Last resort: try relative paths
        const [brandsRes, foundersRes, dimensionsRes] = await Promise.all([
          fetch('/_data/brands.json'),
          fetch('/_data/founders.json'), 
          fetch('/_data/dimensions.json')
        ]);
        
        this.data.brands = await brandsRes.json();
        this.data.founders = await foundersRes.json();
        this.data.dimensions = await dimensionsRes.json();
        
        this.initializeFilterOptions();
      } catch (fallbackError) {
        console.error('All data loading attempts failed:', fallbackError);
        document.getElementById('results-count').textContent = 'Error loading data. Please refresh the page.';
      }
    }
  }

  initializeFilterOptions() {
    // Get current language
    this.currentLang = document.documentElement.lang || 'en';
    
    // Populate filter options from dimensions data
    this.populateFilterOptions('sectors', this.data.dimensions.sectors);
    this.populateFilterOptions('markets', this.data.dimensions.markets);
    this.populateFilterOptions('attributes', this.data.dimensions.attributes);
    this.populateFilterOptions('signals', this.data.dimensions.signals);
  }

  populateFilterOptions(filterType, dimensionsData) {
    const container = document.getElementById(`${filterType}-filters`);
    if (!container || !dimensionsData) return;

    const counts = this.generateFilterCounts();
    const options = Object.entries(dimensionsData).map(([slug, data]) => {
      const name = data.translations?.[this.currentLang]?.name || slug;
      const count = counts[filterType]?.[slug] || 0;
      
      return {
        slug,
        name,
        count
      };
    }).sort((a, b) => b.count - a.count); // Sort by count descending

    container.innerHTML = options.map(option => `
      <label class="filter-option">
        <input type="checkbox" class="filter-checkbox" 
               data-filter-type="${filterType}" 
               value="${option.slug}">
        <span class="option-label">${option.name}</span>
        <span class="option-count">${option.count}</span>
      </label>
    `).join('');
  }

  setupEventListeners() {
    // Text search
    document.getElementById('search-query')?.addEventListener('input', (e) => {
      this.filters.query = e.target.value.toLowerCase();
      this.debounceRender();
    });

    // Filter checkboxes
    document.querySelectorAll('.filter-checkbox').forEach(checkbox => {
      checkbox.addEventListener('change', (e) => {
        const filterType = e.target.dataset.filterType;
        const value = e.target.value;
        
        if (e.target.checked) {
          this.filters[filterType].push(value);
        } else {
          this.filters[filterType] = this.filters[filterType].filter(item => item !== value);
        }
        
        this.updateURL();
        this.render();
      });
    });

    // Year range inputs
    document.getElementById('year-min')?.addEventListener('input', (e) => {
      this.filters.founding_year_min = e.target.value ? parseInt(e.target.value) : null;
      this.debounceRender();
    });

    document.getElementById('year-max')?.addEventListener('input', (e) => {
      this.filters.founding_year_max = e.target.value ? parseInt(e.target.value) : null;
      this.debounceRender();
    });

    // Clear filters
    document.getElementById('clear-filters')?.addEventListener('click', () => {
      this.clearFilters();
    });

    // Content type toggle
    document.querySelectorAll('input[name="content-type"]').forEach(radio => {
      radio.addEventListener('change', (e) => {
        this.contentType = e.target.value;
        this.render();
      });
    });
  }

  // Smart search that handles your complex queries
  searchBrands() {
    let results = [...this.data.brands];

    // Text search across multiple fields
    if (this.filters.query) {
      const query = this.filters.query.toLowerCase();
      results = results.filter(brand => {
        const searchableText = [
          brand.name.en || '',
          brand.name.ru || '', 
          brand.name.zh || '',
          brand.description?.en || '',
          brand.description?.ru || '',
          brand.description?.zh || '',
          ...(brand.sectors || []),
          ...(brand.markets || []),
          ...(brand.attributes || []),
          brand.location?.city || '',
          brand.location?.region || ''
        ].join(' ').toLowerCase();
        
        return searchableText.includes(query);
      });
    }

    // Sector filtering (coffee, jewelry, clothing, etc.)
    if (this.filters.sectors.length > 0) {
      results = results.filter(brand => 
        brand.sectors && brand.sectors.some(sector => 
          this.filters.sectors.includes(sector)
        )
      );
    }

    // Market filtering (Thailand, Russia, China, India, BRICS, etc.)
    if (this.filters.markets.length > 0) {
      results = results.filter(brand => 
        brand.markets && brand.markets.some(market => 
          this.filters.markets.includes(market)
        )
      );
    }

    // Attribute filtering (premium, heritage, etc.)
    if (this.filters.attributes.length > 0) {
      results = results.filter(brand => 
        brand.attributes && brand.attributes.some(attr => 
          this.filters.attributes.includes(attr)
        )
      );
    }

    // Signals filtering (export-ready, growth-ready, etc.)
    if (this.filters.signals.length > 0) {
      results = results.filter(brand => 
        brand.signals && brand.signals.some(signal => 
          this.filters.signals.includes(signal)
        )
      );
    }

    // Founding year range (10+ years old = founded before 2014)
    if (this.filters.founding_year_min !== null) {
      results = results.filter(brand => 
        brand.founding_year && brand.founding_year >= this.filters.founding_year_min
      );
    }

    if (this.filters.founding_year_max !== null) {
      results = results.filter(brand => 
        brand.founding_year && brand.founding_year <= this.filters.founding_year_max
      );
    }

    // Founder-led filter
    if (this.filters.founder_led !== null) {
      results = results.filter(brand => 
        brand.founder_led === this.filters.founder_led
      );
    }

    // Featured only filter
    if (this.filters.featured_only) {
      results = results.filter(brand => brand.featured === true);
    }

    return results;
  }

  searchFounders() {
    let results = [...this.data.founders];

    if (this.filters.query) {
      const query = this.filters.query.toLowerCase();
      results = results.filter(founder => {
        const searchableText = [
          founder.name.en || '',
          founder.name.ru || '',
          founder.name.zh || '',
          founder.biography?.en || '',
          founder.biography?.ru || '',
          founder.biography?.zh || '',
          founder.expertise?.join(' ') || '',
          founder.location?.city || '',
          founder.location?.region || ''
        ].join(' ').toLowerCase();
        
        return searchableText.includes(query);
      });
    }

    // Filter founders by their associated brands' attributes
    if (this.filters.sectors.length > 0 || this.filters.markets.length > 0) {
      results = results.filter(founder => {
        // Find brands associated with this founder
        const associatedBrands = this.data.brands.filter(brand => 
          brand.founders && brand.founders.includes(founder.id)
        );

        return associatedBrands.some(brand => {
          const matchesSector = this.filters.sectors.length === 0 || 
            (brand.sectors && brand.sectors.some(s => this.filters.sectors.includes(s)));
          const matchesMarket = this.filters.markets.length === 0 || 
            (brand.markets && brand.markets.some(m => this.filters.markets.includes(m)));
          
          return matchesSector && matchesMarket;
        });
      });
    }

    return results;
  }

  // Generate filter counts for better UX
  generateFilterCounts() {
    const counts = {
      sectors: {},
      markets: {},
      attributes: {},
      signals: {}
    };

    // Count how many brands have each dimension
    this.data.brands.forEach(brand => {
      brand.sectors?.forEach(sector => {
        counts.sectors[sector] = (counts.sectors[sector] || 0) + 1;
      });
      brand.markets?.forEach(market => {
        counts.markets[market] = (counts.markets[market] || 0) + 1;
      });
      brand.attributes?.forEach(attr => {
        counts.attributes[attr] = (counts.attributes[attr] || 0) + 1;
      });
      brand.signals?.forEach(signal => {
        counts.signals[signal] = (counts.signals[signal] || 0) + 1;
      });
    });

    return counts;
  }

  // Handle complex search examples from your requirements
  handlePresetSearch(preset) {
    this.clearFilters();

    switch(preset) {
      case 'coffee-thailand':
        this.filters.sectors = ['artisanal-spirits']; // Closest to coffee
        this.filters.markets = ['indonesia']; // Closest to Thailand in BRICS+
        break;
      
      case 'premium-jewelry-russia-china':
        this.filters.attributes = ['premium-positioning'];
        this.filters.sectors = ['jewelry-watches'];
        this.filters.markets = ['russia', 'china'];
        break;
      
      case 'clothing-india-10plus':
        this.filters.sectors = ['fashion-accessories']; // Closest to clothing
        this.filters.markets = ['india'];
        this.filters.founding_year_max = 2014; // 10+ years old
        break;
      
      case 'heritage-brics':
        this.filters.attributes = ['heritage-brand'];
        this.filters.markets = ['brazil', 'russia', 'india', 'china', 'south-africa'];
        break;
      
      case 'heritage-ceramics-brics':
        this.filters.attributes = ['heritage-brand'];
        this.filters.sectors = ['artisan-ceramics'];
        this.filters.markets = ['brazil', 'russia', 'india', 'china', 'south-africa'];
        break;
    }

    this.updateURL();
    this.render();
  }

  render() {
    const contentType = document.querySelector('input[name="content-type"]:checked')?.value || 'brands';
    const results = contentType === 'brands' ? this.searchBrands() : this.searchFounders();
    
    // Update results count
    const resultsCount = document.getElementById('results-count');
    if (resultsCount) {
      resultsCount.textContent = `${results.length} ${contentType} found`;
    }

    // Render results
    const resultsContainer = document.getElementById('search-results');
    if (resultsContainer) {
      resultsContainer.innerHTML = results.map(item => 
        contentType === 'brands' ? this.renderBrandCard(item) : this.renderFounderCard(item)
      ).join('');
    }

    // Update filter counts
    this.updateFilterCounts();

    // Update active filter display
    this.updateActiveFilters();
  }

  renderBrandCard(brand) {
    const currentLang = document.documentElement.lang || 'en';
    return `
      <article class="brand-card">
        <h3><a href="/${currentLang}/brands/${brand.id}/">${brand.name[currentLang] || brand.name.en}</a></h3>
        <p>${brand.description?.[currentLang] || brand.description?.en || ''}</p>
        <div class="brand-meta">
          <span class="founding-year">${brand.founding_year || ''}</span>
          <span class="location">${brand.location?.city || ''}, ${brand.location?.region || ''}</span>
        </div>
        <div class="dimensions">
          ${(brand.sectors || []).map(s => `<span class="dim dim--sector">${s}</span>`).join('')}
          ${(brand.markets || []).map(m => `<span class="dim dim--market">${m}</span>`).join('')}
          ${(brand.attributes || []).map(a => `<span class="dim dim--attribute">${a}</span>`).join('')}
        </div>
      </article>
    `;
  }

  renderFounderCard(founder) {
    const currentLang = document.documentElement.lang || 'en';
    return `
      <article class="founder-card">
        <h3><a href="/${currentLang}/founders/${founder.id}/">${founder.name[currentLang] || founder.name.en}</a></h3>
        <p>${founder.biography?.[currentLang] || founder.biography?.en || ''}</p>
        <div class="founder-meta">
          <span class="location">${founder.location?.city || ''}, ${founder.location?.region || ''}</span>
        </div>
      </article>
    `;
  }

  // URL state management for shareable searches
  updateURL() {
    const params = new URLSearchParams();
    
    if (this.filters.query) params.set('q', this.filters.query);
    if (this.filters.sectors.length) params.set('sectors', this.filters.sectors.join(','));
    if (this.filters.markets.length) params.set('markets', this.filters.markets.join(','));
    if (this.filters.attributes.length) params.set('attributes', this.filters.attributes.join(','));
    if (this.filters.signals.length) params.set('signals', this.filters.signals.join(','));
    if (this.filters.founding_year_min) params.set('year_min', this.filters.founding_year_min);
    if (this.filters.founding_year_max) params.set('year_max', this.filters.founding_year_max);
    if (this.filters.founder_led !== null) params.set('founder_led', this.filters.founder_led);
    if (this.filters.featured_only) params.set('featured', '1');
    
    const newURL = window.location.pathname + (params.toString() ? '?' + params.toString() : '');
    window.history.replaceState({}, '', newURL);
  }

  updateFromURL() {
    const params = new URLSearchParams(window.location.search);
    
    this.filters.query = params.get('q') || '';
    this.filters.sectors = params.get('sectors')?.split(',').filter(Boolean) || [];
    this.filters.markets = params.get('markets')?.split(',').filter(Boolean) || [];
    this.filters.attributes = params.get('attributes')?.split(',').filter(Boolean) || [];
    this.filters.signals = params.get('signals')?.split(',').filter(Boolean) || [];
    this.filters.founding_year_min = params.get('year_min') ? parseInt(params.get('year_min')) : null;
    this.filters.founding_year_max = params.get('year_max') ? parseInt(params.get('year_max')) : null;
    this.filters.founder_led = params.get('founder_led') ? params.get('founder_led') === 'true' : null;
    this.filters.featured_only = params.get('featured') === '1';
  }

  clearFilters() {
    this.filters = {
      query: '',
      sectors: [],
      markets: [],
      attributes: [],
      signals: [],
      founding_year_min: null,
      founding_year_max: null,
      founder_led: null,
      featured_only: false
    };
    
    // Clear form inputs
    document.getElementById('search-query').value = '';
    document.querySelectorAll('.filter-checkbox').forEach(cb => cb.checked = false);
    document.getElementById('year-min').value = '';
    document.getElementById('year-max').value = '';
    
    this.updateURL();
    this.render();
  }

  debounceRender() {
    clearTimeout(this.renderTimeout);
    this.renderTimeout = setTimeout(() => this.render(), 300);
  }

  updateFilterCounts() {
    // Implementation for showing filter counts in UI
    const counts = this.generateFilterCounts();
    // Update UI elements to show counts next to filter options
  }

  updateActiveFilters() {
    // Show active filters as removable tags
    const activeContainer = document.getElementById('active-filters');
    if (!activeContainer) return;

    const activeFilters = [];
    
    this.filters.sectors.forEach(s => activeFilters.push({type: 'sectors', value: s, label: s}));
    this.filters.markets.forEach(m => activeFilters.push({type: 'markets', value: m, label: m}));
    this.filters.attributes.forEach(a => activeFilters.push({type: 'attributes', value: a, label: a}));
    
    activeContainer.innerHTML = activeFilters.map(filter => `
      <span class="active-filter" data-type="${filter.type}" data-value="${filter.value}">
        ${filter.label} <button class="remove-filter">&times;</button>
      </span>
    `).join('');

    // Add remove filter functionality
    activeContainer.querySelectorAll('.remove-filter').forEach(btn => {
      btn.addEventListener('click', (e) => {
        const filterTag = e.target.closest('.active-filter');
        const type = filterTag.dataset.type;
        const value = filterTag.dataset.value;
        
        this.filters[type] = this.filters[type].filter(item => item !== value);
        this.updateURL();
        this.render();
      });
    });
  }
}

// Initialize search when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('search-interface')) {
    window.brandmineSearch = new BrandmineSearch();
  }
});

// Expose preset search functions globally for easy access
window.searchPresets = {
  coffeeThailand: () => window.brandmineSearch?.handlePresetSearch('coffee-thailand'),
  premiumJewelryRussiaChina: () => window.brandmineSearch?.handlePresetSearch('premium-jewelry-russia-china'),
  clothingIndia10Plus: () => window.brandmineSearch?.handlePresetSearch('clothing-india-10plus'),
  heritageBrics: () => window.brandmineSearch?.handlePresetSearch('heritage-brics'),
  heritageCeramicsBrics: () => window.brandmineSearch?.handlePresetSearch('heritage-ceramics-brics')
};