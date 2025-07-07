/**
 * Insights Carousel JavaScript
 * 
 * Horizontal scrolling carousel for recent insights section
 * Shows 3 cards per row on desktop, responsive design
 */

document.addEventListener('DOMContentLoaded', function() {
  const carousel = document.querySelector('.recent-insights__carousel');
  const dots = document.querySelectorAll('.recent-insights__nav-dot');

  if (carousel && dots.length > 0) {
    console.log('Insights carousel initialized with', dots.length, 'dots');

    // Calculate scroll position for each page
    const getScrollPosition = (slideIndex) => {
      const containerWidth = carousel.offsetWidth;
      const gap = parseFloat(getComputedStyle(carousel).gap) || 0;
      
      // Desktop: 3 cards per page
      if (window.innerWidth > 991) {
        return slideIndex * containerWidth;
      }
      // Tablet: 2 cards per page  
      else if (window.innerWidth > 767) {
        return slideIndex * containerWidth;
      }
      // Mobile: 1 card per page
      else {
        const card = carousel.querySelector('.insight-card');
        if (!card) return 0;
        const cardWidth = card.offsetWidth + gap;
        return slideIndex * cardWidth;
      }
    };

    // Update active dot based on scroll position
    const updateActiveDot = () => {
      const scrollPos = carousel.scrollLeft;
      const containerWidth = carousel.offsetWidth;
      let currentIndex = 0;
      
      // Calculate current page based on screen size
      if (window.innerWidth > 991) {
        // Desktop: 3 cards per page
        currentIndex = Math.round(scrollPos / containerWidth);
      } else if (window.innerWidth > 767) {
        // Tablet: 2 cards per page
        currentIndex = Math.round(scrollPos / containerWidth);
      } else {
        // Mobile: 1 card per page
        const card = carousel.querySelector('.insight-card');
        if (card) {
          const gap = parseFloat(getComputedStyle(carousel).gap) || 0;
          const cardWidth = card.offsetWidth + gap;
          currentIndex = Math.round(scrollPos / cardWidth);
        }
      }
      
      dots.forEach((dot, index) => {
        dot.classList.toggle('active', index === currentIndex);
      });
    };

    // Navigate to specific slide
    const goToSlide = (slideIndex) => {
      const scrollPosition = getScrollPosition(slideIndex);
      carousel.scrollTo({
        left: scrollPosition,
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
    setTimeout(updateActiveDot, 100);

    // Add horizontal scrolling with mouse wheel
    carousel.addEventListener('wheel', function(e) {
      if (e.deltaY !== 0) {
        e.preventDefault();
        carousel.scrollLeft += e.deltaY;
        setTimeout(updateActiveDot, 10);
      }
    });

    // Update on window resize
    window.addEventListener('resize', function() {
      setTimeout(updateActiveDot, 100);
    });

    // Debug info
    setTimeout(() => {
      console.log('Carousel width:', carousel.offsetWidth);
      console.log('Carousel scroll width:', carousel.scrollWidth);
      console.log('Is scrollable:', carousel.scrollWidth > carousel.offsetWidth);
    }, 200);
  }
});