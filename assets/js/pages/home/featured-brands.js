/**
 * Featured Brands Carousel
 * Using universal carousel consolidation (Phase 3)
 */

document.addEventListener('DOMContentLoaded', function() {
    // Use universal initialization
    const carousel = window.UniversalCarousel.init('featured-brands');
    if (!carousel) return;
    
    const dots = document.querySelectorAll('.carousel-nav[data-target="featured-brands"] .carousel-nav-dot');
    const cards = carousel.carousel.querySelectorAll('.carousel-card');
    
    if (cards.length === 0) return;
    
    // Show/hide dots based on responsive behavior
    function updateDots() {
        const cardsPerView = getCardsPerView();
        const maxSlide = Math.max(0, Math.ceil(cards.length / cardsPerView) - 1);
        
        // Show/hide dots based on needed slides
        dots.forEach(function(dot, index) {
            if (index <= maxSlide) {
                dot.style.display = 'block';
            } else {
                dot.style.display = 'none';
            }
        });
    }
    
    function getCardsPerView() {
        const width = window.innerWidth;
        if (width >= 992) return 2; // Desktop: 2 cards
        return 1; // Mobile/Tablet: 1 card
    }
    
    // Initialize responsive dots
    updateDots();
    
    // Use universal dot handlers (standard behavior)
    window.UniversalCarousel.addDotHandlers(carousel, dots);
    
    // Use universal scroll handling with custom callback for dot visibility
    window.UniversalCarousel.addScrollHandler(carousel, function(slideIndex) {
        const cardsPerView = getCardsPerView();
        const maxSlide = Math.max(0, Math.ceil(cards.length / cardsPerView) - 1);
        const adjustedIndex = Math.min(slideIndex, maxSlide);
        
        // Update active dot
        dots.forEach((dot, index) => {
            dot.classList.toggle('active', index === adjustedIndex);
        });
    });
    
    // Responsive updates
    window.addEventListener('resize', function() {
        updateDots();
    });
});