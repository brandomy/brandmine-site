/**
 * Featured Brands Simplified Carousel
 * Matches Case Studies carousel functionality with brand-specific adaptations
 */

document.addEventListener('DOMContentLoaded', function() {
    // Initialize all featured brands simplified carousels
    const carousels = document.querySelectorAll('.universal-carousel[data-component-type="featured-brands-simplified"]');
    
    carousels.forEach(function(carousel) {
        initializeFeaturedBrandsCarousel(carousel);
    });
});

function initializeFeaturedBrandsCarousel(carousel) {
    const dots = document.querySelectorAll('.universal-carousel-nav[data-target="featured-brands-simplified"] .universal-carousel-nav-dot');
    const cards = carousel.querySelectorAll('.simplified-carousel-card');
    
    if (cards.length === 0) return;
    
    let currentSlide = 0;
    const cardsPerView = getCardsPerView();
    const maxSlide = Math.max(0, Math.ceil(cards.length / cardsPerView) - 1);
    
    // Update dots based on screen size
    updateDots();
    
    // Dot click handlers
    dots.forEach(function(dot, index) {
        dot.addEventListener('click', function() {
            currentSlide = Math.min(index, maxSlide);
            scrollToSlide(currentSlide);
            updateActiveDot(index);
        });
    });
    
    // Update active dot on scroll
    carousel.addEventListener('scroll', function() {
        const scrollLeft = carousel.scrollLeft;
        const cardWidth = cards[0].offsetWidth;
        const gap = parseFloat(getComputedStyle(carousel).gap) || 24;
        const slideIndex = Math.round(scrollLeft / (cardWidth + gap));
        const adjustedIndex = Math.min(slideIndex, maxSlide);
        
        updateActiveDot(adjustedIndex);
        currentSlide = adjustedIndex;
    });
    
    // Responsive updates
    window.addEventListener('resize', function() {
        updateDots();
    });
    
    function getCardsPerView() {
        const width = window.innerWidth;
        if (width >= 992) return 2; // Desktop: 2 cards
        return 1; // Mobile/Tablet: 1 card
    }
    
    function scrollToSlide(slideIndex) {
        const cardWidth = cards[0].offsetWidth;
        const gap = parseFloat(getComputedStyle(carousel).gap) || 24;
        const scrollPosition = slideIndex * (cardWidth + gap);
        
        carousel.scrollTo({
            left: scrollPosition,
            behavior: 'smooth'
        });
    }
    
    function updateActiveDot(activeIndex) {
        dots.forEach(function(dot, index) {
            if (index === activeIndex) {
                dot.classList.add('active');
            } else {
                dot.classList.remove('active');
            }
        });
    }
    
    function updateDots() {
        const newCardsPerView = getCardsPerView();
        const newMaxSlide = Math.max(0, Math.ceil(cards.length / newCardsPerView) - 1);
        
        // Show/hide dots based on needed slides
        dots.forEach(function(dot, index) {
            if (index <= newMaxSlide) {
                dot.style.display = 'block';
            } else {
                dot.style.display = 'none';
            }
        });
    }
}