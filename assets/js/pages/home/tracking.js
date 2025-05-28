/**
 * Brandmine Homepage Tracking Functionality
 *
 * Handles event tracking for homepage buttons and interactions
 * Integrates with Google Analytics (gtag)
 */

const BrandmineTracking = (function() {
  /**
   * Track a button click event
   * @param {HTMLElement} button - The button element that was clicked
   */
  function trackButtonClick(button) {
    const buttonText = button.textContent.trim();
    const trackingId = button.getAttribute('data-track');

    // Check if Google Analytics is available
    if (typeof gtag === 'function') {
      // Track the click event
      gtag('event', 'click', {
        'event_category': 'Homepage',
        'event_label': buttonText,
        'value': 1,
        'button_section': trackingId
      });
    }
  }

  /**
   * Initialize tracking for all buttons with data-track attribute
   */
  function initButtonTracking() {
    // Select all buttons with data-track attribute
    const buttons = document.querySelectorAll('[data-track]');

    // Add click event listener to each button
    buttons.forEach(button => {
      button.addEventListener('click', function(e) {
        trackButtonClick(this);
      });
    });
  }

  // Public API
  return {
    /**
     * Initialize tracking functionality
     */
    init: function() {
      initButtonTracking();

      // Add any additional tracking initialization here
    }
  };
})();

// Initialize tracking when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  BrandmineTracking.init();
});
