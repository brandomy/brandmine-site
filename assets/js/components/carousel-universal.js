/**
 * Universal Carousel JavaScript
 * 
 * Handles all carousel functionality for Brandmine site using a single,
 * configurable component that reads responsive settings from data attributes.
 * 
 * Features:
 * - Responsive behavior based on data attributes
 * - Touch/swipe support for mobile devices
 * - Keyboard navigation (arrow keys, tab)
 * - Smooth transitions with CSS transforms
 * - Accessibility support (ARIA attributes, focus management)
 * - Auto-calculation of slides based on responsive breakpoints
 */

class UniversalCarousel {
  constructor(element) {
    this.carousel = element;
    this.track = element.querySelector('.carousel__track');
    this.items = element.querySelectorAll('.carousel__item');
    this.dots = element.querySelectorAll('.carousel__dot');
    this.prevArrow = element.querySelector('.carousel__arrow--prev');
    this.nextArrow = element.querySelector('.carousel__arrow--next');
    
    // Read responsive configuration from data attributes
    this.config = {
      desktop: parseInt(element.dataset.cardsDesktop) || 3,
      tablet: parseInt(element.dataset.cardsTablet) || 2,
      mobile: parseInt(element.dataset.cardsMobile) || 1,
      totalItems: parseInt(element.dataset.totalItems) || 0,
      componentType: element.dataset.componentType || 'universal'
    };
    
    // Current state
    this.currentSlide = 0;
    this.isTransitioning = false;
    
    // Breakpoints (matching CSS)
    this.breakpoints = {
      mobile: 768,
      tablet: 1024
    };
    
    // Touch/swipe handling
    this.touchStart = { x: 0, y: 0 };
    this.touchEnd = { x: 0, y: 0 };
    this.touchThreshold = 50;
    
    this.init();
  }
  
  init() {
    if (!this.track || this.items.length === 0) {
      console.warn('Carousel initialization failed: missing track or items');
      return;
    }
    
    console.log(`Initializing ${this.config.componentType} carousel with ${this.config.totalItems} items`);
    
    this.setupEventListeners();
    this.updateCarousel();
    this.setupAccessibility();
    
    // Handle window resize
    let resizeTimeout;
    window.addEventListener('resize', () => {
      clearTimeout(resizeTimeout);
      resizeTimeout = setTimeout(() => this.updateCarousel(), 150);
    });
  }
  
  setupEventListeners() {
    // Dot navigation
    this.dots.forEach((dot, index) => {
      dot.addEventListener('click', (e) => {
        e.preventDefault();
        this.goToSlide(index);
      });
      
      // Keyboard support for dots
      dot.addEventListener('keydown', (e) => {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          this.goToSlide(index);
        }
      });
    });
    
    // Arrow navigation
    if (this.prevArrow) {
      this.prevArrow.addEventListener('click', (e) => {
        e.preventDefault();
        this.previousSlide();
      });
    }
    
    if (this.nextArrow) {
      this.nextArrow.addEventListener('click', (e) => {
        e.preventDefault();
        this.nextSlide();
      });
    }
    
    // Keyboard navigation for carousel
    this.carousel.addEventListener('keydown', (e) => {
      switch (e.key) {
        case 'ArrowLeft':
          e.preventDefault();
          this.previousSlide();
          break;
        case 'ArrowRight':
          e.preventDefault();
          this.nextSlide();
          break;
        case 'Home':
          e.preventDefault();
          this.goToSlide(0);
          break;
        case 'End':
          e.preventDefault();
          this.goToSlide(this.getMaxSlides() - 1);
          break;
      }
    });
    
    // Touch/swipe support
    this.track.addEventListener('touchstart', (e) => this.handleTouchStart(e), { passive: true });
    this.track.addEventListener('touchmove', (e) => this.handleTouchMove(e), { passive: true });
    this.track.addEventListener('touchend', (e) => this.handleTouchEnd(e), { passive: true });
    
    // Mouse wheel support (horizontal scrolling)
    this.track.addEventListener('wheel', (e) => {
      if (Math.abs(e.deltaX) > Math.abs(e.deltaY)) {
        e.preventDefault();
        if (e.deltaX > 0) {
          this.nextSlide();
        } else {
          this.previousSlide();
        }
      }
    });
  }
  
  setupAccessibility() {
    // Set up ARIA attributes
    this.carousel.setAttribute('aria-roledescription', 'carousel');
    
    // Focus management
    this.carousel.setAttribute('tabindex', '0');
    
    // Announce slide changes to screen readers
    const liveRegion = document.createElement('div');
    liveRegion.setAttribute('aria-live', 'polite');
    liveRegion.setAttribute('aria-atomic', 'true');
    liveRegion.className = 'sr-only';
    liveRegion.id = `${this.carousel.id}-live-region`;
    this.carousel.appendChild(liveRegion);
    this.liveRegion = liveRegion;
  }
  
  getCardsPerView() {
    const width = window.innerWidth;
    if (width <= this.breakpoints.mobile) {
      return this.config.mobile;
    } else if (width <= this.breakpoints.tablet) {
      return this.config.tablet;
    } else {
      return this.config.desktop;
    }
  }
  
  getMaxSlides() {
    const cardsPerView = this.getCardsPerView();
    return Math.max(1, Math.ceil(this.config.totalItems / cardsPerView));
  }
  
  updateCarousel() {
    const cardsPerView = this.getCardsPerView();
    const maxSlides = this.getMaxSlides();
    
    // Ensure current slide is within bounds
    this.currentSlide = Math.min(this.currentSlide, maxSlides - 1);
    
    // Update CSS custom properties for responsive behavior
    this.track.style.setProperty('--cards-per-view', cardsPerView);
    
    // Calculate and apply transform
    const slideWidth = 100 / cardsPerView;
    const translateX = -(this.currentSlide * slideWidth);
    this.track.style.transform = `translateX(${translateX}%)`;
    
    // Update dots
    this.updateDots();
    
    // Update arrows
    this.updateArrows(maxSlides);
    
    // Update ARIA attributes
    this.updateAccessibility();
    
    console.log(`Carousel updated: slide ${this.currentSlide + 1}/${maxSlides}, ${cardsPerView} cards per view`);
  }
  
  updateDots() {
    this.dots.forEach((dot, index) => {
      const isActive = index === this.currentSlide;
      dot.classList.toggle('carousel__dot--active', isActive);
      dot.setAttribute('aria-selected', isActive.toString());
      
      if (isActive) {
        dot.setAttribute('tabindex', '0');
      } else {
        dot.setAttribute('tabindex', '-1');
      }
    });
  }
  
  updateArrows(maxSlides) {
    if (this.prevArrow) {
      const isDisabled = this.currentSlide === 0;
      this.prevArrow.disabled = isDisabled;
      this.prevArrow.setAttribute('aria-disabled', isDisabled.toString());
    }
    
    if (this.nextArrow) {
      const isDisabled = this.currentSlide >= maxSlides - 1;
      this.nextArrow.disabled = isDisabled;
      this.nextArrow.setAttribute('aria-disabled', isDisabled.toString());
    }
  }
  
  updateAccessibility() {
    const maxSlides = this.getMaxSlides();
    const currentSlideNumber = this.currentSlide + 1;
    
    // Update live region for screen readers
    if (this.liveRegion) {
      this.liveRegion.textContent = `Slide ${currentSlideNumber} of ${maxSlides}`;
    }
    
    // Update carousel label
    this.carousel.setAttribute('aria-label', 
      `${this.config.componentType} carousel, slide ${currentSlideNumber} of ${maxSlides}`);
  }
  
  goToSlide(slideIndex) {
    if (this.isTransitioning) return;
    
    const maxSlides = this.getMaxSlides();
    const newSlide = Math.max(0, Math.min(slideIndex, maxSlides - 1));
    
    if (newSlide !== this.currentSlide) {
      this.isTransitioning = true;
      this.currentSlide = newSlide;
      this.updateCarousel();
      
      // Reset transition flag after animation
      setTimeout(() => {
        this.isTransitioning = false;
      }, 300);
    }
  }
  
  nextSlide() {
    const maxSlides = this.getMaxSlides();
    if (this.currentSlide < maxSlides - 1) {
      this.goToSlide(this.currentSlide + 1);
    }
  }
  
  previousSlide() {
    if (this.currentSlide > 0) {
      this.goToSlide(this.currentSlide - 1);
    }
  }
  
  // Touch handling methods
  handleTouchStart(e) {
    this.touchStart.x = e.touches[0].clientX;
    this.touchStart.y = e.touches[0].clientY;
  }
  
  handleTouchMove(e) {
    this.touchEnd.x = e.touches[0].clientX;
    this.touchEnd.y = e.touches[0].clientY;
  }
  
  handleTouchEnd(e) {
    if (!this.touchStart.x || !this.touchEnd.x) return;
    
    const deltaX = this.touchStart.x - this.touchEnd.x;
    const deltaY = this.touchStart.y - this.touchEnd.y;
    
    // Only handle horizontal swipes
    if (Math.abs(deltaX) > Math.abs(deltaY) && Math.abs(deltaX) > this.touchThreshold) {
      if (deltaX > 0) {
        // Swipe left (next slide)
        this.nextSlide();
      } else {
        // Swipe right (previous slide)
        this.previousSlide();
      }
    }
    
    // Reset touch coordinates
    this.touchStart = { x: 0, y: 0 };
    this.touchEnd = { x: 0, y: 0 };
  }
}

// Initialize all carousels when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  const carousels = document.querySelectorAll('.carousel');
  
  console.log(`Found ${carousels.length} carousels to initialize`);
  
  carousels.forEach((carousel, index) => {
    try {
      new UniversalCarousel(carousel);
      console.log(`Carousel ${index + 1} initialized successfully`);
    } catch (error) {
      console.error(`Failed to initialize carousel ${index + 1}:`, error);
    }
  });
});

// Export for potential external use
if (typeof module !== 'undefined' && module.exports) {
  module.exports = UniversalCarousel;
}