/**
 * Founder Carousel JavaScript
 * 
 * Enhanced carousel system supporting single and dual-card carousels
 * with proper dot navigation and smooth scrolling.
 */

document.addEventListener('DOMContentLoaded', function() {
  // Initialize founder-focus carousel (existing)
  initializeFounderCarousel('.founder-focus-carousel', '.founder-focus-nav-dot', '.founder-card-featured');
  
  // Initialize new single-card founders carousel
  const singleCarousel = document.querySelector('[data-carousel="founders"]');
  if (singleCarousel) {
    initializeFoundersCarousel(singleCarousel, 'single');
  }
  
  // Initialize dual-card carousel
  const dualCarousel = document.querySelector('[data-carousel="founders-dual"]');
  if (dualCarousel) {
    initializeFoundersCarousel(dualCarousel, 'dual');
  }
  
  // Legacy carousel support
  function initializeFounderCarousel(carouselSelector, dotsSelector, cardSelector) {
    const carousel = document.querySelector(carouselSelector);
    const dots = document.querySelectorAll(dotsSelector);

  if (carousel && dots.length > 0) {
    console.log('Founder carousel initialized with', dots.length, 'dots');

    // Calculate card width for navigation
    const getCardWidth = () => {
      const card = carousel.querySelector(cardSelector);
      if (!card) return 0;
      const style = getComputedStyle(card);
      const marginRight = parseFloat(style.marginRight) || 0;
      return card.offsetWidth + marginRight + 20; // Include gap
    };

    // Update active dot based on scroll position
    const updateActiveDot = () => {
      const cardWidth = getCardWidth();
      if (cardWidth === 0) return;
      
      const scrollPos = carousel.scrollLeft;
      const currentIndex = Math.round(scrollPos / cardWidth);
      
      dots.forEach((dot, index) => {
        dot.classList.toggle('active', index === currentIndex);
      });
    };

    // Navigate to specific slide
    const goToSlide = (slideIndex) => {
      const cardWidth = getCardWidth();
      if (cardWidth === 0) return;
      
      carousel.scrollTo({
        left: cardWidth * slideIndex,
        behavior: 'smooth'
      });
    };

    // Event listeners for dots
    dots.forEach((dot) => {
      dot.addEventListener('click', () => {
        const slideIndex = parseInt(dot.getAttribute('data-slide'));
        console.log('Clicking dot for slide:', slideIndex);
        goToSlide(slideIndex);
      });
    });

    // Update active dot on scroll
    carousel.addEventListener('scroll', updateActiveDot);
    
    // Initial state
    setTimeout(updateActiveDot, 100); // Small delay to ensure layout is complete

    // Add horizontal scrolling with mouse wheel
    carousel.addEventListener('wheel', function(e) {
      if (e.deltaY !== 0) {
        e.preventDefault();
        carousel.scrollLeft += e.deltaY;
        setTimeout(updateActiveDot, 10); // Update dots after scroll
      }
    });

    // Check if carousel is actually scrollable
    setTimeout(() => {
      console.log('Carousel width:', carousel.offsetWidth);
      console.log('Carousel scroll width:', carousel.scrollWidth);
      console.log('Is scrollable:', carousel.scrollWidth > carousel.offsetWidth);
    }, 200);
  }
  } // Close legacy initializeFounderCarousel function
  
  // Enhanced carousel initialization for new carousels
  function initializeFoundersCarousel(carousel, type) {
    const dots = carousel.querySelectorAll('.founder-focus-nav-dot, .carousel-dot');
    const slides = carousel.querySelectorAll('.carousel__slide, .founders-carousel__slide');
    
    if (!dots.length || !slides.length) return;
    
    console.log(`Initializing ${type} founders carousel with ${dots.length} dots and ${slides.length} slides`);
    
    dots.forEach((dot, index) => {
      dot.addEventListener('click', function() {
        // Update active dot
        dots.forEach(d => {
          d.classList.remove('active', 'carousel-dot--active');
        });
        this.classList.add(this.classList.contains('carousel-dot') ? 'carousel-dot--active' : 'active');
        
        // Scroll to slide
        if (slides[index]) {
          slides[index].scrollIntoView({
            behavior: 'smooth',
            block: 'center',
            inline: 'center'
          });
        }
      });
    });
    
    // Handle scroll events to update active dots
    const track = carousel.querySelector('.carousel__track, .founders-carousel__track');
    if (track) {
      track.addEventListener('scroll', function() {
        const scrollLeft = track.scrollLeft;
        const slideWidth = slides[0] ? slides[0].offsetWidth : 0;
        const currentIndex = Math.round(scrollLeft / slideWidth);
        
        dots.forEach((dot, index) => {
          if (index === currentIndex) {
            dot.classList.add(dot.classList.contains('carousel-dot') ? 'carousel-dot--active' : 'active');
          } else {
            dot.classList.remove('active', 'carousel-dot--active');
          }
        });
      });
    }
  }
});