/**
 * Brandmine Smooth Scroll Functionality
 *
 * Provides smooth scrolling behavior for anchor links on the homepage
 * Currently handles the "Learn How" button that scrolls to the how-it-works section
 */

const BrandmineSmoothScroll = (function() {
  /**
   * Initialize scroll behavior for a specific anchor
   * @param {string} linkSelector - CSS selector for the anchor link
   * @param {string} targetSelector - CSS selector for the target element to scroll to
   */
  function initAnchorScroll(linkSelector, targetSelector) {
    const link = document.querySelector(linkSelector);
    if (!link) return;

    link.addEventListener('click', function(e) {
      e.preventDefault();
      const target = document.querySelector(targetSelector);
      if (target) {
        target.scrollIntoView({ behavior: 'smooth' });
      }
    });
  }

  // Public API
  return {
    /**
     * Initialize smooth scrolling functionality
     */
    init: function() {
      // Initialize "Learn How" button scroll to "how-it-works" section
      initAnchorScroll('a[href="#how-it-works"]', '#how-it-works');

      // Add any additional anchor links here as needed
    }
  };
})();

// Initialize smooth scrolling when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  BrandmineSmoothScroll.init();
});
