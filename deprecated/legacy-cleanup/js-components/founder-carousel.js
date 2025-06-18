/**
 * Founder Carousel JavaScript
 * 
 * Simple dot navigation carousel for founder focus section
 * following the "logic light" approach with separated concerns.
 */

document.addEventListener('DOMContentLoaded', function() {
  const carousel = document.querySelector('.founder-focus-carousel');
  const dots = document.querySelectorAll('.founder-focus-nav-dot');

  if (carousel && dots.length > 0) {
    console.log('Founder carousel initialized with', dots.length, 'dots');

    // Calculate card width for navigation
    const getCardWidth = () => {
      const card = carousel.querySelector('.founder-card');
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
});