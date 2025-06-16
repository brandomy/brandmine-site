/**
 * Case Studies Carousel Component
 * 
 * Handles carousel functionality for featured case studies with navigation buttons
 * and dot indicators. Implements smooth scrolling and responsive behavior.
 */

(function() {
  'use strict';

  class CaseStudiesCarousel {
    constructor(element) {
      this.carousel = element;
      this.track = element.querySelector('.carousel-track');
      this.slides = element.querySelectorAll('.carousel-slide');
      this.prevButton = element.querySelector('.carousel-nav--prev');
      this.nextButton = element.querySelector('.carousel-nav--next');
      this.indicators = element.querySelectorAll('.carousel-indicator');
      
      this.currentIndex = 0;
      this.slideWidth = 0;
      this.maxIndex = this.slides.length - 1;
      
      this.init();
    }

    init() {
      if (!this.track || this.slides.length === 0) return;
      
      // Calculate slide dimensions
      this.calculateDimensions();
      
      // Set up event listeners
      this.setupEventListeners();
      
      // Update initial state
      this.updateCarouselState();
      
      // Handle resize
      this.setupResizeHandler();
    }

    calculateDimensions() {
      if (this.slides.length === 0) return;
      
      const firstSlide = this.slides[0];
      const computedStyle = window.getComputedStyle(firstSlide);
      const gap = parseFloat(window.getComputedStyle(this.track).gap) || 24;
      
      this.slideWidth = firstSlide.offsetWidth + gap;
      
      // Calculate visible slides
      const containerWidth = this.carousel.offsetWidth;
      this.visibleSlides = Math.floor(containerWidth / this.slideWidth);
      
      // Update max index based on visible slides
      this.maxIndex = Math.max(0, this.slides.length - this.visibleSlides);
    }

    setupEventListeners() {
      // Navigation buttons
      if (this.prevButton) {
        this.prevButton.addEventListener('click', () => this.goToPrevious());
      }
      
      if (this.nextButton) {
        this.nextButton.addEventListener('click', () => this.goToNext());
      }
      
      // Dot indicators
      this.indicators.forEach((indicator, index) => {
        indicator.addEventListener('click', () => this.goToSlide(index));
      });
      
      // Track scroll for mobile
      this.track.addEventListener('scroll', () => this.handleScroll());
      
      // Touch support
      this.setupTouchSupport();
    }

    setupTouchSupport() {
      let startX = 0;
      let scrollLeft = 0;
      
      this.track.addEventListener('touchstart', (e) => {
        startX = e.touches[0].pageX - this.track.offsetLeft;
        scrollLeft = this.track.scrollLeft;
      });
      
      this.track.addEventListener('touchmove', (e) => {
        if (!startX) return;
        const x = e.touches[0].pageX - this.track.offsetLeft;
        const walk = (x - startX) * 2;
        this.track.scrollLeft = scrollLeft - walk;
      });
    }

    setupResizeHandler() {
      let resizeTimer;
      window.addEventListener('resize', () => {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(() => {
          this.calculateDimensions();
          this.goToSlide(this.currentIndex);
        }, 250);
      });
    }

    goToPrevious() {
      if (this.currentIndex > 0) {
        this.goToSlide(this.currentIndex - 1);
      }
    }

    goToNext() {
      if (this.currentIndex < this.maxIndex) {
        this.goToSlide(this.currentIndex + 1);
      }
    }

    goToSlide(index) {
      // Clamp index to valid range
      index = Math.max(0, Math.min(index, this.maxIndex));
      
      this.currentIndex = index;
      const scrollPosition = index * this.slideWidth;
      
      this.track.scrollTo({
        left: scrollPosition,
        behavior: 'smooth'
      });
      
      this.updateCarouselState();
    }

    handleScroll() {
      // Update current index based on scroll position
      const scrollPosition = this.track.scrollLeft;
      const newIndex = Math.round(scrollPosition / this.slideWidth);
      
      if (newIndex !== this.currentIndex) {
        this.currentIndex = newIndex;
        this.updateCarouselState();
      }
    }

    updateCarouselState() {
      // Update navigation buttons
      if (this.prevButton) {
        this.prevButton.disabled = this.currentIndex === 0;
        this.prevButton.setAttribute('aria-disabled', this.currentIndex === 0);
      }
      
      if (this.nextButton) {
        this.nextButton.disabled = this.currentIndex === this.maxIndex;
        this.nextButton.setAttribute('aria-disabled', this.currentIndex === this.maxIndex);
      }
      
      // Update indicators
      this.indicators.forEach((indicator, index) => {
        const isActive = index === this.currentIndex;
        indicator.classList.toggle('active', isActive);
        indicator.setAttribute('aria-current', isActive ? 'true' : 'false');
      });
    }
  }

  // Initialize all case studies carousels on page
  document.addEventListener('DOMContentLoaded', function() {
    const carousels = document.querySelectorAll('.featured-case-studies-carousel');
    
    carousels.forEach(carousel => {
      new CaseStudiesCarousel(carousel);
    });
  });

  // Export for use in other modules if needed
  window.CaseStudiesCarousel = CaseStudiesCarousel;

})();