/**
 * Insights Carousel Component
 * Handles carousel functionality for insights sections
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
    // Add JS-enabled class for progressive enhancement
    document.documentElement.classList.add('js-enabled');
    
    // Find all carousel instances
    const carousels = document.querySelectorAll('.latest-insights-carousel, .recent-insights__carousel');
    
    carousels.forEach(carousel => {
      initCarousel(carousel);
    });
  }

  function initCarousel(carousel) {
    const container = carousel.closest('.latest-insights-carousel, .recent-insights');
    if (!container) return;
    
    const track = carousel.querySelector('.latest-insights-carousel__track, .recent-insights__carousel');
    if (!track) return;
    
    const items = track.querySelectorAll('.insight-card');
    if (items.length === 0) return;
    
    const navDots = container.querySelectorAll('.latest-insights-carousel__nav-dot, .recent-insights__nav-dot');
    
    let currentSlide = 0;
    let itemsPerSlide = getItemsPerSlide();
    // Calculate max slides as the number of items that can be scrolled
    let maxSlides = Math.max(1, items.length - itemsPerSlide + 1);
    
    // Update on resize
    let resizeTimeout;
    window.addEventListener('resize', () => {
      clearTimeout(resizeTimeout);
      resizeTimeout = setTimeout(() => {
        itemsPerSlide = getItemsPerSlide();
        maxSlides = Math.max(1, items.length - itemsPerSlide + 1);
        goToSlide(Math.min(currentSlide, maxSlides - 1));
      }, 250);
    });
    
    // Navigation dots
    navDots.forEach((dot, index) => {
      dot.addEventListener('click', () => {
        goToSlide(index);
      });
    });
    
    // Touch/swipe support
    let touchStartX = 0;
    let touchEndX = 0;
    
    track.addEventListener('touchstart', e => {
      touchStartX = e.changedTouches[0].screenX;
    }, { passive: true });
    
    track.addEventListener('touchend', e => {
      touchEndX = e.changedTouches[0].screenX;
      handleSwipe();
    }, { passive: true });
    
    function handleSwipe() {
      const swipeThreshold = 50;
      const diff = touchStartX - touchEndX;
      
      if (Math.abs(diff) > swipeThreshold) {
        if (diff > 0 && currentSlide < maxSlides - 1) {
          // Swipe left - next slide
          goToSlide(currentSlide + 1);
        } else if (diff < 0 && currentSlide > 0) {
          // Swipe right - previous slide
          goToSlide(currentSlide - 1);
        }
      }
    }
    
    function getItemsPerSlide() {
      const width = window.innerWidth;
      if (width >= 992) return 3;
      if (width >= 768) return 2;
      return 1;
    }
    
    function goToSlide(slideIndex) {
      currentSlide = Math.max(0, Math.min(slideIndex, maxSlides - 1));
      // Move by one card width, not the full container
      const cardWidth = 100 / itemsPerSlide;
      const offset = currentSlide * cardWidth;
      
      track.style.transform = `translateX(-${offset}%)`;
      
      // Update navigation dots
      navDots.forEach((dot, index) => {
        dot.classList.toggle('active', index === currentSlide);
      });
    }
    
    // Keyboard navigation
    container.addEventListener('keydown', e => {
      if (e.key === 'ArrowLeft' && currentSlide > 0) {
        goToSlide(currentSlide - 1);
      } else if (e.key === 'ArrowRight' && currentSlide < maxSlides - 1) {
        goToSlide(currentSlide + 1);
      }
    });
    
    // Auto-play (optional - disabled by default)
    // Uncomment to enable auto-play
    /*
    let autoPlayInterval;
    const autoPlayDelay = 5000; // 5 seconds
    
    function startAutoPlay() {
      autoPlayInterval = setInterval(() => {
        goToSlide((currentSlide + 1) % maxSlides);
      }, autoPlayDelay);
    }
    
    function stopAutoPlay() {
      clearInterval(autoPlayInterval);
    }
    
    // Start auto-play
    startAutoPlay();
    
    // Pause on hover
    container.addEventListener('mouseenter', stopAutoPlay);
    container.addEventListener('mouseleave', startAutoPlay);
    
    // Pause on focus
    container.addEventListener('focusin', stopAutoPlay);
    container.addEventListener('focusout', startAutoPlay);
    */
  }
})();