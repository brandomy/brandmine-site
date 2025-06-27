/**
 * Featured Brands Carousel for Brands Page
 * Adapted from homepage featured-brands-simplified.js for brands page context
 * Handles universal carousel with brand-specific functionality
 */

document.addEventListener('DOMContentLoaded', function() {
    // Initialize featured brands carousel on brands page
    const carousel = document.querySelector('.universal-carousel[data-component-type="featured-brands"]');
    const navContainer = document.querySelector('.universal-carousel-nav[data-target="featured-brands"]');
    
    if (!carousel || !navContainer) return;
    
    initializeFeaturedBrandsCarousel(carousel, navContainer);
});

function initializeFeaturedBrandsCarousel(carousel, navContainer) {
    const cards = carousel.children;
    const dots = navContainer.querySelectorAll('.universal-carousel-nav-dot');
    
    if (cards.length === 0) return;
    
    let currentSlide = 0;
    const cardsPerView = getCardsPerView();
    const maxSlide = Math.max(0, Math.ceil(cards.length / cardsPerView) - 1);
    
    // Dot click handlers
    dots.forEach(function(dot, index) {
        dot.addEventListener('click', function() {
            currentSlide = Math.min(index, maxSlide);
            scrollToSlide(currentSlide, carousel, cards);
            updateActiveDot(index, dots);
        });
    });
    
    // Update active dot on scroll
    let scrollTimeout;
    carousel.addEventListener('scroll', function() {
        clearTimeout(scrollTimeout);
        scrollTimeout = setTimeout(function() {
            const scrollLeft = carousel.scrollLeft;
            const cardWidth = cards[0].offsetWidth;
            const gap = parseFloat(getComputedStyle(carousel).gap) || 24;
            const slideIndex = Math.round(scrollLeft / (cardWidth + gap));
            const adjustedIndex = Math.min(slideIndex, maxSlide);
            
            updateActiveDot(adjustedIndex, dots);
            currentSlide = adjustedIndex;
        }, 100);
    });
    
    // Responsive updates
    window.addEventListener('resize', function() {
        setTimeout(function() {
            const newCardsPerView = getCardsPerView();
            const newMaxSlide = Math.max(0, Math.ceil(cards.length / newCardsPerView) - 1);
            currentSlide = Math.min(currentSlide, newMaxSlide);
            scrollToSlide(currentSlide, carousel, cards);
        }, 100);
    });
    
    // Initialize first slide
    scrollToSlide(0, carousel, cards);
    updateActiveDot(0, dots);
}

function getCardsPerView() {
    // Mobile-first responsive: 1 card on mobile, 2 on tablet+
    return window.innerWidth <= 768 ? 1 : 2;
}

function scrollToSlide(slideIndex, carousel, cards) {
    const cardWidth = cards[0].offsetWidth;
    const gap = parseFloat(getComputedStyle(carousel).gap) || 24;
    const cardsPerView = getCardsPerView();
    const scrollPosition = slideIndex * (cardWidth + gap) * cardsPerView;
    
    carousel.scrollTo({
        left: scrollPosition,
        behavior: 'smooth'
    });
}

function updateActiveDot(activeIndex, dots) {
    dots.forEach(function(dot, index) {
        dot.classList.toggle('active', index === activeIndex);
    });
}