/**
 * Main JavaScript Initialization
 * ==========================================================================
 * Centralized initialization point for all Brandmine JavaScript components.
 * Implements conditional loading based on DOM element presence and page context.
 * 
 * Architecture:
 * - ES6 class-based components remain in separate files
 * - This file handles discovery and initialization only
 * - Components are initialized only when their DOM elements exist
 * - Proper error handling and logging for debugging
 */

(function() {
  'use strict';

  /**
   * Component Registry
   * Maps component names to their initialization functions
   */
  const ComponentRegistry = {
    // Core components (needed on most pages)
    header: {
      selector: 'header.header',
      init: () => {
        // Header component self-initializes via DOMContentLoaded
        console.log('[Main] Header component initialized');
      }
    },

    // Form components
    customForms: {
      selector: '[data-custom-form="true"], [data-newsletter-form="true"]',
      init: () => {
        const forms = document.querySelectorAll('[data-custom-form="true"]');
        forms.forEach(form => {
          if (form.id && typeof initializeCustomContactForm === 'function') {
            initializeCustomContactForm(form.id);
            console.log(`[Main] Initialized custom contact form: ${form.id}`);
          }
        });

        const newsletters = document.querySelectorAll('[data-newsletter-form="true"]');
        newsletters.forEach(form => {
          if (form.id && typeof initializeCustomNewsletter === 'function') {
            initializeCustomNewsletter(form.id);
            console.log(`[Main] Initialized custom newsletter form: ${form.id}`);
          }
        });
      }
    },

    // Search components
    searchFilter: {
      selector: '.search-filter',
      init: () => {
        if (typeof SearchFilter === 'function') {
          const searchFilters = document.querySelectorAll('.search-filter');
          searchFilters.forEach(filterElement => {
            const contentType = filterElement.dataset.contentType || 'brands';
            new SearchFilter(contentType);
            console.log(`[Main] Initialized search filter for: ${contentType}`);
          });
        }
      }
    },

    searchPlaceholder: {
      selector: '.search-placeholder',
      init: () => {
        // Search placeholder self-initializes
        console.log('[Main] Search placeholder component initialized');
      }
    },

    // Carousel components
    founderCarousel: {
      selector: '.founder-carousel',
      init: () => {
        if (typeof FounderCarousel === 'function') {
          const carousels = document.querySelectorAll('.founder-carousel');
          carousels.forEach(carousel => {
            new FounderCarousel(carousel);
            console.log('[Main] Initialized founder carousel');
          });
        }
      }
    },

    insightsCarousel: {
      selector: '.insights-carousel',
      init: () => {
        // Insights carousel initialization if needed
        console.log('[Main] Insights carousel component initialized');
      }
    },

    featuredCarousel: {
      selector: '.carousel[data-component-type^="featured-"]',
      init: () => {
        // Carousel initializes via DOMContentLoaded in carousel.js
        console.log('[Main] Featured carousel component detected');
      }
    },

    // Page-specific components
    brandsFiltering: {
      selector: 'body.brands-page',
      init: () => {
        console.log('[Main] Brands filtering initialized');
      }
    },

    foundersPage: {
      selector: 'body.founders-page',
      init: () => {
        console.log('[Main] Founders page functionality initialized');
      }
    },

    insightsPagination: {
      selector: '.insights-all',
      init: () => {
        console.log('[Main] Insights pagination initialized');
      }
    },

    discoveryPage: {
      selector: 'body.discovery-page',
      init: () => {
        console.log('[Main] Discovery page functionality initialized');
      }
    },

    dimensionFiltering: {
      selector: 'body.dimension-page',
      init: () => {
        console.log('[Main] Dimension filtering initialized');
      }
    },

    // Map components
    mapLibre: {
      selector: '[data-map-container]',
      init: () => {
        // Map initializer handles this via its own DOMContentLoaded
        console.log('[Main] Map components will be initialized by map-initializer.js');
      }
    },

    // Premium content
    premiumContent: {
      selector: '[data-premium-content]',
      init: () => {
        if (typeof PremiumContent === 'function') {
          new PremiumContent();
          console.log('[Main] Premium content component initialized');
        }
      }
    },

    // Modal component
    modal: {
      selector: '.modal',
      init: () => {
        // Modal manager self-initializes via DOMContentLoaded
        console.log('[Main] Modal component initialized');
      }
    },

    // Tooltip component
    tooltip: {
      selector: '[data-tooltip]',
      init: () => {
        // Tooltip initialization if needed
        console.log('[Main] Tooltip component initialized');
      }
    }
  };

  /**
   * Initialize components based on DOM presence
   */
  function initializeComponents() {
    console.log('[Main] Starting component initialization...');
    
    Object.entries(ComponentRegistry).forEach(([name, component]) => {
      try {
        // Check if component's target elements exist
        if (document.querySelector(component.selector)) {
          component.init();
        } else {
          console.log(`[Main] Skipping ${name} - no matching elements found`);
        }
      } catch (error) {
        console.error(`[Main] Error initializing ${name}:`, error);
      }
    });
    
    console.log('[Main] Component initialization complete');
  }

  /**
   * Feature detection and polyfills
   */
  function checkFeatureSupport() {
    // Check for required features
    const features = {
      querySelector: !!document.querySelector,
      classList: !!document.documentElement.classList,
      addEventListener: !!window.addEventListener,
      forEach: !!NodeList.prototype.forEach
    };

    const unsupported = Object.entries(features)
      .filter(([_, supported]) => !supported)
      .map(([feature]) => feature);

    if (unsupported.length > 0) {
      console.warn('[Main] Missing browser features:', unsupported);
    }

    return unsupported.length === 0;
  }

  /**
   * Performance monitoring
   */
  function measureInitTime(callback) {
    const startTime = performance.now();
    callback();
    const endTime = performance.now();
    console.log(`[Main] Initialization completed in ${(endTime - startTime).toFixed(2)}ms`);
  }

  /**
   * Handle component cleanup on page navigation
   */
  function setupCleanup() {
    // Cleanup handlers for SPAs or Turbo navigation
    window.addEventListener('beforeunload', () => {
      console.log('[Main] Page unloading - cleaning up components');
      // Add cleanup logic here if needed
    });
  }

  /**
   * Error boundary for initialization
   */
  function safeInit() {
    try {
      if (!checkFeatureSupport()) {
        console.error('[Main] Browser lacks required features');
        return;
      }

      measureInitTime(() => {
        initializeComponents();
      });

      setupCleanup();
    } catch (error) {
      console.error('[Main] Critical initialization error:', error);
      // Could show user-friendly error message here
    }
  }

  /**
   * Initialize when DOM is ready
   */
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', safeInit);
  } else {
    // DOM already loaded
    safeInit();
  }

  /**
   * Export for debugging and extension
   */
  window.BrandmineJS = {
    version: '1.0.0',
    components: ComponentRegistry,
    reinitialize: initializeComponents,
    debug: true
  };

})();