/**
 * Founder Focus Intense Carousel
 * Uses proven scroll-based carousel approach from test page
 * Native scrolling with enhanced dot navigation for optimal performance
 */

document.addEventListener('DOMContentLoaded', function() {
  // Initialize the founder-focus-intense carousel using the proven approach
  const carousel = document.getElementById('founderFocusIntenseCarousel');
  if (carousel) {
    console.log('Initializing founder-focus-intense carousel');
    initializeFoundersCarousel(carousel, 'single');
  }
  
  /**
   * Enhanced carousel initialization using scroll-based approach
   * Based on proven founder-carousel.js implementation
   */
  function initializeFoundersCarousel(carouselElement, type) {
    const track = carouselElement.querySelector('.carousel__track');
    const dots = carouselElement.querySelectorAll('.founder-focus-nav-dot');
    const slides = carouselElement.querySelectorAll('.carousel__slide');
    
    if (!track || !dots.length || !slides.length) {
      console.warn('Carousel elements not found');
      return;
    }
    
    console.log(`Initializing ${type} carousel with ${slides.length} slides and ${dots.length} dots`);
    
    // Calculate slide width for navigation
    const getSlideWidth = () => {
      const slide = slides[0];
      if (!slide) return 0;
      const style = getComputedStyle(slide);
      const marginRight = parseFloat(style.marginRight) || 0;
      const gap = parseFloat(getComputedStyle(track).gap) || 0;
      return slide.offsetWidth + marginRight + gap;
    };
    
    // Update active dot based on scroll position
    const updateActiveDot = () => {
      const slideWidth = getSlideWidth();
      if (slideWidth === 0) return;
      
      const scrollPos = track.scrollLeft;
      const currentIndex = Math.round(scrollPos / slideWidth);
      
      dots.forEach((dot, index) => {
        dot.classList.toggle('active', index === currentIndex);
      });
    };
    
    // Smooth scroll to specific slide
    const scrollToSlide = (index) => {
      const slideWidth = getSlideWidth();
      const targetScroll = index * slideWidth;
      
      track.scrollTo({
        left: targetScroll,
        behavior: 'smooth'
      });
    };
    
    // Add click handlers to dots with interaction tracking
    dots.forEach((dot, index) => {
      dot.addEventListener('click', () => {
        console.log(`Dot ${index} clicked, scrolling to slide ${index}`);
        scrollToSlide(index);
        resetInteractionTimer(); // Pause auto-advance on user interaction
      });
    });
    
    // Update dots on scroll with interaction tracking
    let scrollTimeout;
    track.addEventListener('scroll', () => {
      clearTimeout(scrollTimeout);
      scrollTimeout = setTimeout(updateActiveDot, 50);
      resetInteractionTimer(); // Track scroll as user interaction
    }, { passive: true });
    
    // Keyboard navigation
    track.addEventListener('keydown', (e) => {
      const currentIndex = Math.round(track.scrollLeft / getSlideWidth());
      
      if (e.key === 'ArrowLeft' && currentIndex > 0) {
        e.preventDefault();
        scrollToSlide(currentIndex - 1);
      } else if (e.key === 'ArrowRight' && currentIndex < slides.length - 1) {
        e.preventDefault();
        scrollToSlide(currentIndex + 1);
      }
    });
    
    // Make track focusable for keyboard navigation
    track.setAttribute('tabindex', '0');
    
    // Auto-advance functionality with user interaction tracking
    let autoAdvanceInterval;
    let userHasInteracted = false;
    let interactionTimer;
    const SLIDE_DURATION = 10000; // 10 seconds for comfortable reading
    const INTERACTION_PAUSE = 5000; // 5 seconds after user interaction
    
    const startAutoAdvance = () => {
      if (autoAdvanceInterval) clearInterval(autoAdvanceInterval);
      
      autoAdvanceInterval = setInterval(() => {
        // Only advance if user hasn't interacted recently
        if (!userHasInteracted) {
          const currentIndex = Math.round(track.scrollLeft / getSlideWidth());
          const nextIndex = (currentIndex + 1) % slides.length;
          scrollToSlide(nextIndex);
        }
      }, SLIDE_DURATION);
    };
    
    const stopAutoAdvance = () => {
      clearInterval(autoAdvanceInterval);
    };
    
    // Track user interactions to pause auto-advance
    const resetInteractionTimer = () => {
      userHasInteracted = true;
      clearTimeout(interactionTimer);
      
      // Resume auto-advance after period of no interaction
      interactionTimer = setTimeout(() => {
        userHasInteracted = false;
      }, INTERACTION_PAUSE);
    };
    
    // Auto-advance when in viewport
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          startAutoAdvance();
        } else {
          stopAutoAdvance();
        }
      });
    }, { threshold: 0.5 });
    
    observer.observe(carouselElement);
    
    // Enhanced user interaction handling
    carouselElement.addEventListener('mouseenter', () => {
      resetInteractionTimer();
      stopAutoAdvance();
    });
    carouselElement.addEventListener('mouseleave', startAutoAdvance);
    carouselElement.addEventListener('touchstart', resetInteractionTimer);
    
    // Initial setup
    updateActiveDot();
    
    // Accessibility enhancements
    slides.forEach((slide, index) => {
      slide.setAttribute('aria-hidden', index !== 0);
    });
    
    // Update aria-hidden on scroll
    track.addEventListener('scroll', () => {
      clearTimeout(scrollTimeout);
      scrollTimeout = setTimeout(() => {
        const currentIndex = Math.round(track.scrollLeft / getSlideWidth());
        slides.forEach((slide, index) => {
          slide.setAttribute('aria-hidden', index !== currentIndex);
        });
      }, 50);
    }, { passive: true });
    
    console.log('Founder-focus-intense carousel initialized successfully');
  }
});