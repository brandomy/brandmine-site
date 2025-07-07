/**
 * Insights Pagination
 * Provides client-side pagination for insights collection
 * Since GitHub Pages doesn't support jekyll-paginate-v2 for collections
 */

(function() {
  'use strict';

  // Configuration
  const ITEMS_PER_PAGE_DEFAULT = 12;
  
  // State
  let currentPage = 1;
  let itemsPerPage = ITEMS_PER_PAGE_DEFAULT;
  let totalItems = 0;
  let totalPages = 0;
  let allItems = [];
  let filteredItems = [];

  // Elements
  let container;
  let gridContainer;
  let paginationContainer;

  /**
   * Initialize pagination when DOM is ready
   */
  function init() {
    container = document.querySelector('.insights-all');
    if (!container) return;

    gridContainer = document.getElementById('insights-grid');
    paginationContainer = document.getElementById('insights-pagination');
    
    if (!gridContainer || !paginationContainer) return;

    // Get configuration from data attributes
    itemsPerPage = parseInt(container.dataset.perPage) || ITEMS_PER_PAGE_DEFAULT;
    
    // Get all insight items
    allItems = Array.from(gridContainer.querySelectorAll('.insights-all__item'));
    filteredItems = [...allItems];
    totalItems = filteredItems.length;
    totalPages = Math.ceil(totalItems / itemsPerPage);

    // Initialize pagination
    if (totalPages > 1) {
      showPage(1);
      renderPagination();
      
      // Listen for filter changes if filters exist
      setupFilterListeners();
    }
  }

  /**
   * Show specific page of items
   */
  function showPage(page) {
    currentPage = page;
    
    // Calculate start and end indices
    const startIndex = (page - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    
    // Hide all items first
    allItems.forEach(item => {
      item.style.display = 'none';
    });
    
    // Show only items for current page
    filteredItems.slice(startIndex, endIndex).forEach(item => {
      item.style.display = '';
    });
    
    // Scroll to top of insights section
    const insightsSection = container.closest('.insights-section');
    if (insightsSection) {
      const offset = insightsSection.offsetTop - 100; // Account for fixed header
      window.scrollTo({
        top: offset,
        behavior: 'smooth'
      });
    }
    
    // Update pagination UI
    updatePaginationUI();
  }

  /**
   * Render pagination controls
   */
  function renderPagination() {
    const lang = container.dataset.lang || 'en';
    const translations = getTranslations(lang);
    
    let html = '<div class="pagination"><ul class="pagination__list">';
    
    // Previous button
    html += `
      <li class="pagination__item ${currentPage === 1 ? 'pagination__item--disabled' : ''}">
        <button class="pagination__link" onclick="window.insightsPagination.goToPage(${currentPage - 1})" 
                ${currentPage === 1 ? 'disabled' : ''} aria-label="${translations.previous}">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">${translations.previous}</span>
        </button>
      </li>
    `;
    
    // Page numbers
    const pageNumbers = getPageNumbers();
    pageNumbers.forEach(pageNum => {
      if (pageNum === '...') {
        html += '<li class="pagination__item"><span class="pagination__link">...</span></li>';
      } else {
        html += `
          <li class="pagination__item ${pageNum === currentPage ? 'pagination__item--active' : ''}">
            <button class="pagination__link" onclick="window.insightsPagination.goToPage(${pageNum})">
              ${pageNum}
              ${pageNum === currentPage ? `<span class="sr-only">${translations.current}</span>` : ''}
            </button>
          </li>
        `;
      }
    });
    
    // Next button
    html += `
      <li class="pagination__item ${currentPage === totalPages ? 'pagination__item--disabled' : ''}">
        <button class="pagination__link" onclick="window.insightsPagination.goToPage(${currentPage + 1})" 
                ${currentPage === totalPages ? 'disabled' : ''} aria-label="${translations.next}">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">${translations.next}</span>
        </button>
      </li>
    `;
    
    html += '</ul></div>';
    
    paginationContainer.innerHTML = html;
  }

  /**
   * Get page numbers to display (with ellipsis for many pages)
   */
  function getPageNumbers() {
    if (totalPages <= 7) {
      // Show all pages if 7 or fewer
      return Array.from({length: totalPages}, (_, i) => i + 1);
    }
    
    const pages = [];
    
    // Always show first page
    pages.push(1);
    
    if (currentPage > 3) {
      pages.push('...');
    }
    
    // Show pages around current page
    for (let i = Math.max(2, currentPage - 1); i <= Math.min(totalPages - 1, currentPage + 1); i++) {
      pages.push(i);
    }
    
    if (currentPage < totalPages - 2) {
      pages.push('...');
    }
    
    // Always show last page
    pages.push(totalPages);
    
    return pages;
  }

  /**
   * Update pagination UI state
   */
  function updatePaginationUI() {
    renderPagination();
  }

  /**
   * Navigate to specific page
   */
  function goToPage(page) {
    if (page < 1 || page > totalPages || page === currentPage) return;
    showPage(page);
  }

  /**
   * Setup listeners for filter changes
   */
  function setupFilterListeners() {
    // Listen for custom filter events if your filter system dispatches them
    document.addEventListener('insightsFiltered', function(event) {
      handleFilterChange(event.detail);
    });
  }

  /**
   * Handle filter changes
   */
  function handleFilterChange(filterData) {
    // Update filtered items based on filter data
    // This would integrate with your existing filter system
    
    // For now, just recalculate pagination
    filteredItems = Array.from(gridContainer.querySelectorAll('.insights-all__item:not([style*="display: none"])'));
    totalItems = filteredItems.length;
    totalPages = Math.ceil(totalItems / itemsPerPage);
    
    // Reset to first page
    if (totalPages > 0) {
      showPage(1);
      renderPagination();
    } else {
      paginationContainer.innerHTML = '';
    }
  }

  /**
   * Get translations for pagination
   */
  function getTranslations(lang) {
    const translations = {
      en: {
        previous: 'Previous',
        next: 'Next',
        current: 'Current page'
      },
      ru: {
        previous: 'Назад',
        next: 'Вперед',
        current: 'Текущая страница'
      },
      zh: {
        previous: '上一页',
        next: '下一页',
        current: '当前页'
      }
    };
    
    return translations[lang] || translations.en;
  }

  // Initialize when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  // Export public methods for global access
  window.insightsPagination = {
    goToPage: goToPage,
    refresh: function() {
      handleFilterChange();
    }
  };

})();