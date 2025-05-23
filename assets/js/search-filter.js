/**
 * Search Filter Component JavaScript
 * Handles filter interactions for brand and insight search pages
 */

document.addEventListener('DOMContentLoaded', function() {
  // Initialize filter from URL parameters
  const urlParams = new URLSearchParams(window.location.search);
  let activeFilters = false;
  
  // Check for and set any URL parameters as active filters
  function initializeFilters() {
    for (const [key, value] of urlParams.entries()) {
      if (key === 'q') continue; // Skip search query
      
      const values = value.split(',');
      values.forEach(val => {
        const checkbox = document.querySelector(`input[name="${key}"][value="${val}"]`);
        if (checkbox) {
          checkbox.checked = true;
          addActiveFilter(key, val, checkbox.dataset.display);
          activeFilters = true;
        }
      });
    }
    
    // Show clear all button if there are active filters
    if (activeFilters) {
      const clearButton = document.getElementById('clear-all');
      if (clearButton) clearButton.style.display = 'block';
    }
  }
  
  // Add active filter pill
  function addActiveFilter(type, value, display) {
    const activeFiltersContainer = document.getElementById('active-filters');
    if (!activeFiltersContainer) return;
    
    const pill = document.createElement('div');
    pill.className = 'search-filter__pill';
    pill.dataset.type = type;
    pill.dataset.value = value;
    
    pill.innerHTML = `
      <span class="search-filter__pill-text">${display}</span>
      <button class="search-filter__pill-remove" aria-label="Remove filter">×</button>
    `;
    
    // Add remove handler
    pill.querySelector('.search-filter__pill-remove').addEventListener('click', function() {
      // Uncheck the corresponding checkbox
      const checkbox = document.querySelector(`input[name="${type}"][value="${value}"]`);
      if (checkbox) checkbox.checked = false;
      
      // Remove the pill
      pill.remove();
      
      // Update URL and results
      updateUrlAndResults();
      
      // Hide clear all if no more filters
      if (document.querySelectorAll('.search-filter__pill').length === 0) {
        const clearButton = document.getElementById('clear-all');
        if (clearButton) clearButton.style.display = 'none';
      }
    });
    
    const clearButton = document.getElementById('clear-all');
    if (clearButton) {
      activeFiltersContainer.insertBefore(pill, clearButton);
    } else {
      activeFiltersContainer.appendChild(pill);
    }
  }
  
  // Update URL parameters and trigger results refresh
  function updateUrlAndResults() {
    const newUrl = new URL(window.location.href);
    const params = new URLSearchParams();
    
    // Preserve search query if exists
    const searchInput = document.getElementById('search-input');
    if (searchInput && searchInput.value) {
      params.set('q', searchInput.value);
    }
    
    // Add all checked filters to params
    const checkboxes = document.querySelectorAll('.search-filter__option input[type="checkbox"]:checked');
    const filterGroups = {};
    
    checkboxes.forEach(checkbox => {
      const name = checkbox.getAttribute('name');
      const value = checkbox.value;
      
      if (!filterGroups[name]) filterGroups[name] = [];
      filterGroups[name].push(value);
    });
    
    // Add each filter group to URL
    Object.entries(filterGroups).forEach(([name, values]) => {
      params.set(name, values.join(','));
    });
    
    // Update URL without reloading
    newUrl.search = params.toString();
    window.history.pushState({}, '', newUrl);
    
    // Trigger filter event for JavaScript-based filtering
    const event = new CustomEvent('filterUpdate', { detail: { params: params } });
    document.dispatchEvent(event);
  }
  
  // Set up event handlers for checkboxes
  document.querySelectorAll('.search-filter__option input[type="checkbox"]').forEach(checkbox => {
    checkbox.addEventListener('change', function() {
      const type = this.getAttribute('name');
      const value = this.value;
      const display = this.dataset.display;
      
      // Add or remove active filter
      if (this.checked) {
        addActiveFilter(type, value, display);
        const clearButton = document.getElementById('clear-all');
        if (clearButton) clearButton.style.display = 'block';
      } else {
        const pill = document.querySelector(`.search-filter__pill[data-type="${type}"][data-value="${value}"]`);
        if (pill) pill.remove();
        
        // Hide clear all if no more filters
        if (document.querySelectorAll('.search-filter__pill').length === 0) {
          const clearButton = document.getElementById('clear-all');
          if (clearButton) clearButton.style.display = 'none';
        }
      }
      
      // Update URL and refresh results
      updateUrlAndResults();
    });
  });
  
  // Clear all filters
  const clearAllButton = document.getElementById('clear-all');
  if (clearAllButton) {
    const clearButton = clearAllButton.querySelector('button');
    if (clearButton) {
      clearButton.addEventListener('click', function() {
        // Uncheck all checkboxes
        document.querySelectorAll('.search-filter__option input[type="checkbox"]:checked').forEach(checkbox => {
          checkbox.checked = false;
        });
        
        // Remove all filter pills
        document.querySelectorAll('.search-filter__pill').forEach(pill => {
          pill.remove();
        });
        
        // Hide clear all button
        clearAllButton.style.display = 'none';
        
        // Update URL and refresh results
        updateUrlAndResults();
      });
    }
  }
  
  // Initialize accordion behaviors
  document.querySelectorAll('.search-filter__accordion-button').forEach(button => {
    button.addEventListener('click', function() {
      this.classList.toggle('active');
      const target = document.querySelector(this.getAttribute('data-target'));
      if (target) {
        target.classList.toggle('show');
      }
    });
  });
  
  // Initialize from URL
  initializeFilters();
});