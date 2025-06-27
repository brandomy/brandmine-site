/**
 * Universal Carousel Component
 * Shared carousel functionality for featured content across all pages
 * Supports: brands, founders, insights, testimonials, etc.
 */

document.addEventListener('DOMContentLoaded', function() {
    // Initialize all universal carousels
    const carousels = document.querySelectorAll('.universal-carousel[data-component-type^="featured-"]');
    
    carousels.forEach(function(carousel) {
        initializeUniversalCarousel(carousel);
    });
});

function initializeUniversalCarousel(carousel) {
    const componentType = carousel.getAttribute('data-component-type');
    const pageContext = carousel.getAttribute('data-page-context') || 'default-page';
    const navContainer = document.querySelector(`.universal-carousel-nav[data-target="${componentType}"]`);
    
    if (!navContainer) {
        console.warn(`No navigation container found for ${componentType}`);
        return;
    }
    
    const cards = carousel.children;
    const dots = navContainer.querySelectorAll('.universal-carousel-nav-dot');
    
    if (cards.length === 0) return;
    
    let currentSlide = 0;
    const cardsPerView = getCardsPerView(pageContext);
    const maxSlide = Math.max(0, Math.ceil(cards.length / cardsPerView) - 1);
    
    // Update dots visibility based on content
    updateDotsVisibility(dots, maxSlide);
    
    // Dot click handlers
    dots.forEach(function(dot, index) {
        dot.addEventListener('click', function() {
            if (index <= maxSlide) {
                currentSlide = index;
                scrollToSlide(currentSlide, carousel, cards, cardsPerView);
                updateActiveDot(index, dots);
            }
        });
    });
    
    // Update active dot on scroll with throttling
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
            const newCardsPerView = getCardsPerView(pageContext);
            const newMaxSlide = Math.max(0, Math.ceil(cards.length / newCardsPerView) - 1);
            
            // Update dots visibility
            updateDotsVisibility(dots, newMaxSlide);
            
            // Ensure current slide is within bounds
            currentSlide = Math.min(currentSlide, newMaxSlide);
            scrollToSlide(currentSlide, carousel, cards, newCardsPerView);
            updateActiveDot(currentSlide, dots);
        }, 100);
    });
    
    // Touch/swipe support
    addSwipeSupport(carousel, dots, maxSlide);
    
    // Initialize first slide
    scrollToSlide(0, carousel, cards, cardsPerView);
    updateActiveDot(0, dots);
}

function getCardsPerView(pageContext) {
    const width = window.innerWidth;
    
    // Desktop: 3 cards for some content types
    if (width >= 1200) {
        return 2; // Most content types show 2 cards, some can be customized to 3
    }
    
    // Tablet: 2 cards
    if (width >= 768) {
        return 2;
    }
    
    // Mobile: 1 card
    return 1;
}

function scrollToSlide(slideIndex, carousel, cards, cardsPerView) {
    const cardWidth = cards[0].offsetWidth;
    const gap = parseFloat(getComputedStyle(carousel).gap) || 24;
    const scrollPosition = slideIndex * (cardWidth + gap);
    
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

function updateDotsVisibility(dots, maxSlide) {
    dots.forEach(function(dot, index) {
        if (index <= maxSlide) {
            dot.style.display = 'block';
        } else {
            dot.style.display = 'none';
        }
    });
}

function addSwipeSupport(carousel, dots, maxSlide) {
    let startX = 0;
    let scrollStart = 0;
    let isScrolling = false;
    
    carousel.addEventListener('touchstart', function(e) {
        startX = e.touches[0].clientX;
        scrollStart = carousel.scrollLeft;
        isScrolling = true;
    }, { passive: true });
    
    carousel.addEventListener('touchmove', function(e) {
        if (!isScrolling) return;
        
        const currentX = e.touches[0].clientX;
        const diff = startX - currentX;
        carousel.scrollLeft = scrollStart + diff;
    }, { passive: true });
    
    carousel.addEventListener('touchend', function() {
        isScrolling = false;
        
        // Snap to nearest slide
        const cardWidth = carousel.children[0].offsetWidth;
        const gap = parseFloat(getComputedStyle(carousel).gap) || 24;
        const slideIndex = Math.round(carousel.scrollLeft / (cardWidth + gap));
        const adjustedIndex = Math.min(Math.max(slideIndex, 0), maxSlide);
        
        scrollToSlide(adjustedIndex, carousel, carousel.children, getCardsPerView());
        updateActiveDot(adjustedIndex, dots);
    }, { passive: true });
}

// Export for potential external use
window.UniversalCarousel = {
    initialize: initializeUniversalCarousel,
    getCardsPerView: getCardsPerView,
    scrollToSlide: scrollToSlide,
    updateActiveDot: updateActiveDot,
    
    /**
     * Initialize a carousel with common patterns (Phase 3 Consolidation)
     * @param {string} componentType - The data-component-type value
     * @param {Object} options - Configuration options
     */
    init: function(componentType, options = {}) {
        const carousel = document.querySelector(`.universal-carousel[data-component-type="${componentType}"]`);
        const navContainer = document.querySelector(`.universal-carousel-nav[data-target="${componentType}"]`);
        
        if (!carousel) {
            console.warn(`Carousel not found for component type: ${componentType}`);
            return null;
        }
        
        return {
            carousel: carousel,
            navContainer: navContainer,
            cards: carousel.children,
            // Common utility methods
            scrollToPosition: function(position) {
                carousel.scrollTo({
                    left: position,
                    behavior: 'smooth'
                });
            },
            getCardWidth: function() {
                const firstCard = carousel.children[0];
                return firstCard ? firstCard.offsetWidth : 0;
            },
            getGap: function() {
                return parseFloat(getComputedStyle(carousel).gap) || 24;
            }
        };
    },
    
    /**
     * Add configurable scroll handling that page-specific files can use
     * @param {Object} carouselInstance - Instance returned by init()
     * @param {Function} updateCallback - Callback function for scroll updates
     */
    addScrollHandler: function(carouselInstance, updateCallback) {
        if (!carouselInstance.carousel) return;
        
        let scrollTimeout;
        carouselInstance.carousel.addEventListener('scroll', function() {
            clearTimeout(scrollTimeout);
            scrollTimeout = setTimeout(() => {
                const scrollLeft = carouselInstance.carousel.scrollLeft;
                const cardWidth = carouselInstance.getCardWidth();
                const gap = carouselInstance.getGap();
                
                if (cardWidth > 0) {
                    const slideIndex = Math.round(scrollLeft / (cardWidth + gap));
                    updateCallback(slideIndex);
                }
            }, 100);
        });
    },
    
    /**
     * Add standard dot functionality that most carousels can use
     * @param {Object} carouselInstance - Instance returned by init()
     * @param {NodeList} dots - Array/NodeList of dot elements
     */
    addDotHandlers: function(carouselInstance, dots) {
        if (!dots || !dots.length) return;
        
        dots.forEach((dot, index) => {
            dot.addEventListener('click', function() {
                const cardWidth = carouselInstance.getCardWidth();
                const gap = carouselInstance.getGap();
                const position = index * (cardWidth + gap);
                
                carouselInstance.scrollToPosition(position);
                
                // Update active dot
                dots.forEach(d => d.classList.remove('active'));
                dot.classList.add('active');
            });
        });
    }
};