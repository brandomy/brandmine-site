/**
 * Brandmine Carousel Functionality
 *
 * Handles carousel navigation and interaction for homepage brand and insight carousels
 */

// Carousel management module
const BrandmineCarousel = (function() {
  /**
   * Sets up a carousel with navigation dots
   * @param {string} carouselSelector - CSS selector for the carousel container
   * @param {string} dotsSelector - CSS selector for the navigation dots
   */
  function setupCarousel(carouselSelector, dotsSelector) {
    const carousel = document.querySelector(carouselSelector);
    const dots = document.querySelectorAll(dotsSelector);

    if (!carousel || dots.length === 0) return;

    // Update active dot based on scroll position
    carousel.addEventListener('scroll', function() {
      const scrollPosition = carousel.scrollLeft;
      const cardWidth = 300; // Width of a card
      const activeIndex = Math.round(scrollPosition / cardWidth);

      // Don't exceed the number of dots we have
      const dotIndex = Math.min(activeIndex, dots.length - 1);

      // Update active dot
      dots.forEach((dot, index) => {
        if (index === dotIndex) {
          dot.classList.add('active');
        } else {
          dot.classList.remove('active');
        }
      });
    });

    // Make dots clickable to scroll to position
    dots.forEach((dot, index) => {
      dot.addEventListener('click', function() {
        const cardWidth = 300; // Width of a card
        const scrollTo = index * cardWidth;
        carousel.scrollTo({
          left: scrollTo,
          behavior: 'smooth'
        });
      });
    });
  }

  // Public API
  return {
    /**
     * Initialize carousels on the page
     */
    init: function() {
      // Initialize brand carousel
      setupCarousel('.universal-carousel[data-component-type="featured-brands"]', '.universal-carousel-nav-dot');

      // Initialize insights carousel (if exists)
      setupCarousel('.universal-carousel[data-component-type="insights"]', '.universal-carousel-nav-dot');
    }
  };
})();

// Initialize carousels when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  BrandmineCarousel.init();
});
