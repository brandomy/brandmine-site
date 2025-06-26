/**
 * Simple Founder Focus Carousel
 * Lightweight carousel for revolutionary 50% portrait founder cards with dot navigation
 */

document.addEventListener('DOMContentLoaded', function() {
    // Initialize all founder focus carousels
    const carousels = document.querySelectorAll('.universal-carousel[data-component-type="founder-focus"]');
    
    carousels.forEach(function(carousel) {
        initializeFounderFocusCarousel(carousel);
    });
});

function initializeFounderFocusCarousel(carousel) {
    const cards = carousel.querySelectorAll('.founder-focus-card');
    const dots = document.querySelectorAll('.founder-focus__dot');
    
    if (cards.length === 0) return;
    
    let currentSlide = 0;
    
    // Add smooth scrolling support
    carousel.style.scrollBehavior = 'smooth';
    
    // Dot click navigation
    dots.forEach(function(dot, index) {
        dot.addEventListener('click', function() {
            currentSlide = index;
            scrollToSlide(index);
            updateActiveDot(index);
        });
    });
    
    // Update dots based on scroll position
    carousel.addEventListener('scroll', function() {
        const cardWidth = cards[0].offsetWidth;
        const gap = parseFloat(getComputedStyle(carousel).gap) || 24;
        const slideIndex = Math.round(carousel.scrollLeft / (cardWidth + gap));
        const adjustedIndex = Math.min(slideIndex, cards.length - 1);
        
        if (adjustedIndex !== currentSlide) {
            currentSlide = adjustedIndex;
            updateActiveDot(adjustedIndex);
        }
    });
    
    // Keyboard navigation
    carousel.addEventListener('keydown', function(e) {
        if (e.key === 'ArrowLeft' || e.key === 'ArrowRight') {
            e.preventDefault();
            
            if (e.key === 'ArrowLeft' && currentSlide > 0) {
                currentSlide--;
            } else if (e.key === 'ArrowRight' && currentSlide < cards.length - 1) {
                currentSlide++;
            }
            
            scrollToSlide(currentSlide);
            updateActiveDot(currentSlide);
        }
    });
    
    // Helper functions
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
                dot.classList.add('founder-focus__dot--active');
            } else {
                dot.classList.remove('founder-focus__dot--active');
            }
        });
    }
    
    // Make carousel focusable for keyboard navigation
    carousel.setAttribute('tabindex', '0');
}