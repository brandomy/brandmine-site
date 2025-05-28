/**
 * Search Placeholder Component
 * Handles click tracking and modal display for search placeholder components
 * Used for customer discovery to track user search interest
 */

class SearchPlaceholder {
  constructor() {
    this.init();
  }

  init() {
    // Auto-initialize when DOM is ready
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', () => this.setupEventListeners());
    } else {
      this.setupEventListeners();
    }
  }

  setupEventListeners() {
    // Handle search button clicks
    document.addEventListener('click', (e) => {
      if (e.target.closest('[data-search-placeholder]')) {
        this.handleSearchClick(e);
      }
    });

    // Handle input clicks (also triggers modal)
    document.addEventListener('click', (e) => {
      if (e.target.classList.contains('search-placeholder__input')) {
        this.handleSearchClick(e);
      }
    });

    // Handle modal close events
    document.addEventListener('click', (e) => {
      if (e.target.closest('[data-modal-close]')) {
        this.closeModal(e);
      }
    });

    // Close modal on escape key
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') {
        this.closeAllModals();
      }
    });
  }

  handleSearchClick(e) {
    e.preventDefault();
    
    // Track the click event
    this.trackSearchInterest(e);
    
    // Find the associated modal
    const searchContainer = e.target.closest('.search-placeholder');
    if (searchContainer) {
      const modalId = searchContainer.id + '-modal';
      this.openModal(modalId);
    }
  }

  openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
      modal.style.display = 'flex';
      document.body.style.overflow = 'hidden';
      
      // Focus management for accessibility
      const closeButton = modal.querySelector('[data-modal-close]');
      if (closeButton) {
        closeButton.focus();
      }
    }
  }

  closeModal(e) {
    e.preventDefault();
    const modal = e.target.closest('.search-modal');
    if (modal) {
      modal.style.display = 'none';
      document.body.style.overflow = '';
    }
  }

  closeAllModals() {
    const modals = document.querySelectorAll('.search-modal');
    modals.forEach(modal => {
      modal.style.display = 'none';
    });
    document.body.style.overflow = '';
  }

  trackSearchInterest(e) {
    // Track click data for customer discovery
    const searchContainer = e.target.closest('.search-placeholder');
    const pageUrl = window.location.pathname;
    const timestamp = new Date().toISOString();
    
    // Get search context
    const searchTitle = searchContainer.querySelector('.search-placeholder__title')?.textContent || 'Unknown';
    const searchPlaceholder = searchContainer.querySelector('.search-placeholder__input')?.placeholder || 'Unknown';
    
    // Log to console for now (can be enhanced with analytics later)
    console.log('Search Interest Tracked:', {
      timestamp,
      pageUrl,
      searchTitle,
      searchPlaceholder,
      elementClicked: e.target.tagName.toLowerCase()
    });

    // If Google Analytics is available, track the event
    if (typeof gtag !== 'undefined') {
      gtag('event', 'search_placeholder_click', {
        'event_category': 'User Interest',
        'event_label': `${pageUrl} - ${searchTitle}`,
        'page_title': document.title,
        'page_location': window.location.href
      });
    }

    // If other analytics tools are available, add them here
    // Example: Mixpanel, Hotjar, etc.
  }
}

// Initialize the search placeholder functionality
new SearchPlaceholder();