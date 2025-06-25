/**
 * Founders Page JavaScript
 * 
 * Provides filtering, searching, and display functionality for the founders index page
 * 
 * - Handles search input filtering by founder name
 * - Manages market and expertise filter checkboxes
 * - Controls load more functionality for paginated display
 * - Handles sorting of founder cards
 */

document.addEventListener('DOMContentLoaded', function() {
  // Search functionality
  const searchInput = document.getElementById('founder-search');
  const searchButton = document.getElementById('search-button');
  const founderCards = document.querySelectorAll('.founder-card');
  const resultsCount = document.getElementById('results-count');
  const emptyResults = document.getElementById('empty-results');
  const loadMoreBtn = document.getElementById('load-more');
  const sortSelect = document.getElementById('sort-select');
  
  // Filter elements
  const marketFilters = document.querySelectorAll('#market-filters input');
  const expertiseFilters = document.querySelectorAll('#expertise-filters input');
  const resetFiltersBtn = document.getElementById('reset-filters');
  
  // Track active filters
  let activeFilters = {
    search: '',
    markets: [],
    expertise: []
  };
  
  // Initial display count
  const initialDisplayCount = 12;
  let currentDisplayCount = initialDisplayCount;
  
  // Apply filters and update display
  function applyFilters() {
    let matchCount = 0;
    let hiddenCount = 0;
    
    founderCards.forEach((card, index) => {
      // Check if card matches all active filters
      const searchMatch = activeFilters.search === '' || 
        card.dataset.name.toLowerCase().includes(activeFilters.search.toLowerCase());
      
      const marketMatch = activeFilters.markets.length === 0 || 
        activeFilters.markets.includes(card.dataset.market);
      
      // Handle expertise matching (data-expertise might be a comma-separated list)
      let expertiseMatch = true;
      if (activeFilters.expertise.length > 0) {
        const cardExpertise = card.dataset.expertise ? card.dataset.expertise.split(',') : [];
        expertiseMatch = activeFilters.expertise.some(exp => cardExpertise.includes(exp));
      }
      
      const matchesFilters = searchMatch && marketMatch && expertiseMatch;
      
      if (matchesFilters) {
        matchCount++;
        // Show card if it's within the display count
        if (matchCount <= currentDisplayCount) {
          card.style.display = '';
        } else {
          card.style.display = 'none';
          hiddenCount++;
        }
      } else {
        card.style.display = 'none';
      }
    });
    
    // Update results count with appropriate translation
    const founderResultLabel = matchCount === 1 
      ? document.querySelector('meta[name="founder-result-singular"]').content
      : document.querySelector('meta[name="founder-result-plural"]').content;
    resultsCount.textContent = `${matchCount} ${founderResultLabel}`;
    
    // Show/hide empty state
    emptyResults.style.display = matchCount === 0 ? 'block' : 'none';
    
    // Show/hide load more button
    loadMoreBtn.style.display = hiddenCount > 0 ? 'block' : 'none';
  }
  
  // Initialize search
  if (searchButton) {
    searchButton.addEventListener('click', function() {
      activeFilters.search = searchInput.value.trim();
      currentDisplayCount = initialDisplayCount;
      applyFilters();
    });
  }
  
  if (searchInput) {
    searchInput.addEventListener('keypress', function(e) {
      if (e.key === 'Enter') {
        activeFilters.search = searchInput.value.trim();
        currentDisplayCount = initialDisplayCount;
        applyFilters();
      }
    });
  }
  
  // Initialize market filters
  marketFilters.forEach(filter => {
    filter.addEventListener('change', function() {
      activeFilters.markets = Array.from(document.querySelectorAll('#market-filters input:checked'))
        .map(input => input.value);
      currentDisplayCount = initialDisplayCount;
      applyFilters();
    });
  });
  
  // Initialize expertise filters
  expertiseFilters.forEach(filter => {
    filter.addEventListener('change', function() {
      activeFilters.expertise = Array.from(document.querySelectorAll('#expertise-filters input:checked'))
        .map(input => input.value);
      currentDisplayCount = initialDisplayCount;
      applyFilters();
    });
  });
  
  // Reset filters
  if (resetFiltersBtn) {
    resetFiltersBtn.addEventListener('click', function() {
      // Clear search
      searchInput.value = '';
      activeFilters.search = '';
      
      // Uncheck all filter checkboxes
      marketFilters.forEach(filter => { filter.checked = false; });
      expertiseFilters.forEach(filter => { filter.checked = false; });
      
      activeFilters.markets = [];
      activeFilters.expertise = [];
      
      // Reset display count and apply filters
      currentDisplayCount = initialDisplayCount;
      applyFilters();
    });
  }
  
  // Load more
  if (loadMoreBtn) {
    loadMoreBtn.addEventListener('click', function() {
      currentDisplayCount += initialDisplayCount;
      applyFilters();
    });
  }
  
  // Sorting
  if (sortSelect) {
    sortSelect.addEventListener('change', function() {
      const sortValue = this.value;
      const foundersContainer = document.getElementById('founders-container');
      const cards = Array.from(founderCards);
      
      // Sort cards
      cards.sort((a, b) => {
        if (sortValue === 'name') {
          return a.dataset.name.localeCompare(b.dataset.name);
        } else if (sortValue === 'market') {
          return a.dataset.market.localeCompare(b.dataset.market);
        }
        return 0;
      });
      
      // Reorder in DOM
      cards.forEach(card => {
        foundersContainer.appendChild(card);
      });
      
      // Re-apply filters
      applyFilters();
    });
  }
  
  // Initial display
  applyFilters();
});