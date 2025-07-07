/**
 * Insights Carousel Scroll Component
 * Handles navigation dots for CSS-based scrolling carousel
 */

(function() {
  'use strict';

  // Initialize when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initInsightsCarousels);
  } else {
    initInsightsCarousels();
  }

  function initInsightsCarousels() {
    // Find all carousel instances
    const carousels = document.querySelectorAll('.latest-insights-carousel, .recent-insights');
    
    carousels.forEach(carousel => {
      initCarousel(carousel);
    });
  }

  function initCarousel(carousel) {
    const track = carousel.querySelector('.latest-insights-carousel__track, .recent-insights__carousel');
    if (!track) return;
    
    const navDots = carousel.querySelectorAll('.latest-insights-carousel__nav-dot, .recent-insights__nav-dot');
    if (navDots.length === 0) return;
    
    const items = track.querySelectorAll('.insight-card');
    if (items.length === 0) return;
    
    // Calculate item width for scroll positions
    function getItemWidth() {
      return items[0].offsetWidth + parseInt(window.getComputedStyle(track).gap);
    }
    
    // Update active dot based on scroll position
    function updateActiveDot() {
      const scrollLeft = track.scrollLeft;
      const itemWidth = getItemWidth();
      const activeIndex = Math.round(scrollLeft / itemWidth);
      
      navDots.forEach((dot, index) => {
        dot.classList.toggle('active', index === activeIndex);
      });
    }
    
    // Scroll to specific position when dot is clicked
    navDots.forEach((dot, index) => {
      dot.addEventListener('click', () => {
        const itemWidth = getItemWidth();
        const scrollPosition = index * itemWidth;
        
        track.scrollTo({
          left: scrollPosition,
          behavior: 'smooth'
        });
      });
    });
    
    // Update dots on scroll
    let scrollTimeout;
    track.addEventListener('scroll', () => {
      clearTimeout(scrollTimeout);
      scrollTimeout = setTimeout(updateActiveDot, 50);
    });
    
    // Initial dot state
    updateActiveDot();
  }
})();