/**
 * Universal Carousel Component
 * Shared carousel functionality for featured content across all pages
 * Supports: brands, founders, insights, testimonials, etc.
 * 
 * PHASE 5 ADVANCED FEATURES USAGE:
 * 
 * Basic Setup:
 * const carousel = window.UniversalCarousel.init('component-type');
 * window.UniversalCarousel.addDotHandlers(carousel, dots);
 * window.UniversalCarousel.addScrollHandler(carousel, callback);
 * 
 * Advanced Features (Optional):
 * window.UniversalCarousel.addTouchSupport(carousel, { swipeThreshold: 75 });
 * window.UniversalCarousel.addKeyboardNavigation(carousel);
 * window.UniversalCarousel.addAccessibilityFeatures(carousel);
 * window.UniversalCarousel.addAutoAdvance(carousel, { interval: 5000, pauseOnHover: true });
 * 
 * All advanced features are opt-in and do not affect existing carousels.
 */

document.addEventListener('DOMContentLoaded', function() {
    // Initialize all universal carousels
    const carousels = document.querySelectorAll('.carousel[data-component-type^="featured-"]');
    
    carousels.forEach(function(carousel) {
        initializeUniversalCarousel(carousel);
    });
});

function initializeUniversalCarousel(carousel) {
    const componentType = carousel.getAttribute('data-component-type');
    const pageContext = carousel.getAttribute('data-page-context') || 'default-page';
    const navContainer = document.querySelector(`.carousel-nav[data-target="${componentType}"]`);
    
    if (!navContainer) {
        console.warn(`No navigation container found for ${componentType}`);
        return;
    }
    
    const cards = carousel.children;
    const dots = navContainer.querySelectorAll('.carousel-nav-dot');
    
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
        const carousel = document.querySelector(`.carousel[data-component-type="${componentType}"]`);
        const navContainer = document.querySelector(`.carousel-nav[data-target="${componentType}"]`);
        
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
    },
    
    /**
     * PHASE 5: Add optional auto-advance functionality
     * @param {Object} carouselInstance - Instance returned by init()
     * @param {Object} options - Configuration options
     */
    addAutoAdvance: function(carouselInstance, options = {}) {
        const config = {
            interval: options.interval || 5000,        // 5 seconds default
            pauseOnHover: options.pauseOnHover !== false,
            pauseOnFocus: options.pauseOnFocus !== false,
            respectReducedMotion: options.respectReducedMotion !== false,
            ...options
        };
        
        // Check for reduced motion preference
        if (config.respectReducedMotion && 
            window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
            return null; // Don't start auto-advance
        }
        
        let autoAdvanceTimer = null;
        let isPaused = false;
        let currentSlide = 0;
        const totalSlides = carouselInstance.cards.length;
        
        function startAutoAdvance() {
            if (isPaused || totalSlides <= 1) return;
            
            autoAdvanceTimer = setInterval(() => {
                if (!isPaused) {
                    currentSlide = (currentSlide + 1) % totalSlides;
                    const cardWidth = carouselInstance.getCardWidth();
                    const gap = carouselInstance.getGap();
                    const position = currentSlide * (cardWidth + gap);
                    carouselInstance.scrollToPosition(position);
                }
            }, config.interval);
        }
        
        function pauseAutoAdvance() {
            isPaused = true;
            if (autoAdvanceTimer) {
                clearInterval(autoAdvanceTimer);
                autoAdvanceTimer = null;
            }
        }
        
        function resumeAutoAdvance() {
            isPaused = false;
            startAutoAdvance();
        }
        
        // Pause on hover
        if (config.pauseOnHover) {
            carouselInstance.carousel.addEventListener('mouseenter', pauseAutoAdvance);
            carouselInstance.carousel.addEventListener('mouseleave', resumeAutoAdvance);
        }
        
        // Pause on focus
        if (config.pauseOnFocus) {
            carouselInstance.carousel.addEventListener('focusin', pauseAutoAdvance);
            carouselInstance.carousel.addEventListener('focusout', resumeAutoAdvance);
        }
        
        // Start auto-advance
        startAutoAdvance();
        
        // Return control methods
        return {
            pause: pauseAutoAdvance,
            resume: resumeAutoAdvance,
            stop: () => {
                pauseAutoAdvance();
                if (config.pauseOnHover) {
                    carouselInstance.carousel.removeEventListener('mouseenter', pauseAutoAdvance);
                    carouselInstance.carousel.removeEventListener('mouseleave', resumeAutoAdvance);
                }
                if (config.pauseOnFocus) {
                    carouselInstance.carousel.removeEventListener('focusin', pauseAutoAdvance);
                    carouselInstance.carousel.removeEventListener('focusout', resumeAutoAdvance);
                }
            }
        };
    },
    
    /**
     * PHASE 5: Add enhanced touch/swipe support
     * @param {Object} carouselInstance - Instance returned by init()
     * @param {Object} options - Configuration options
     */
    addTouchSupport: function(carouselInstance, options = {}) {
        const config = {
            swipeThreshold: options.swipeThreshold || 50,
            enableVerticalSwipe: options.enableVerticalSwipe || false,
            ...options
        };
        
        let touchStartX = 0;
        let touchStartY = 0;
        let touchEndX = 0;
        let touchEndY = 0;
        
        carouselInstance.carousel.addEventListener('touchstart', (e) => {
            touchStartX = e.changedTouches[0].screenX;
            touchStartY = e.changedTouches[0].screenY;
        }, { passive: true });
        
        carouselInstance.carousel.addEventListener('touchend', (e) => {
            touchEndX = e.changedTouches[0].screenX;
            touchEndY = e.changedTouches[0].screenY;
            handleSwipe();
        }, { passive: true });
        
        function handleSwipe() {
            const diffX = touchStartX - touchEndX;
            const diffY = touchStartY - touchEndY;
            
            // Check if horizontal swipe is stronger than vertical
            if (!config.enableVerticalSwipe && Math.abs(diffY) > Math.abs(diffX)) {
                return; // Vertical swipe, ignore
            }
            
            if (Math.abs(diffX) > config.swipeThreshold) {
                const currentScroll = carouselInstance.carousel.scrollLeft;
                const cardWidth = carouselInstance.getCardWidth();
                const gap = carouselInstance.getGap();
                
                if (diffX > 0) {
                    // Swipe left - next card
                    const nextPosition = currentScroll + cardWidth + gap;
                    carouselInstance.scrollToPosition(nextPosition);
                } else {
                    // Swipe right - previous card
                    const prevPosition = currentScroll - cardWidth - gap;
                    carouselInstance.scrollToPosition(Math.max(0, prevPosition));
                }
            }
        }
    },
    
    /**
     * PHASE 5: Add enhanced keyboard navigation
     * @param {Object} carouselInstance - Instance returned by init()
     * @param {Object} options - Configuration options
     */
    addKeyboardNavigation: function(carouselInstance, options = {}) {
        const config = {
            enableArrowKeys: options.enableArrowKeys !== false,
            enableHomeEnd: options.enableHomeEnd !== false,
            enablePageKeys: options.enablePageKeys || false,
            focusManagement: options.focusManagement !== false,
            ...options
        };
        
        // Make carousel focusable
        carouselInstance.carousel.setAttribute('tabindex', '0');
        carouselInstance.carousel.setAttribute('role', 'region');
        carouselInstance.carousel.setAttribute('aria-label', 'Carousel');
        
        carouselInstance.carousel.addEventListener('keydown', (e) => {
            const currentScroll = carouselInstance.carousel.scrollLeft;
            const cardWidth = carouselInstance.getCardWidth();
            const gap = carouselInstance.getGap();
            const maxScroll = carouselInstance.carousel.scrollWidth - carouselInstance.carousel.offsetWidth;
            
            switch (e.key) {
                case 'ArrowLeft':
                    if (config.enableArrowKeys) {
                        e.preventDefault();
                        const prevPosition = currentScroll - cardWidth - gap;
                        carouselInstance.scrollToPosition(Math.max(0, prevPosition));
                    }
                    break;
                    
                case 'ArrowRight':
                    if (config.enableArrowKeys) {
                        e.preventDefault();
                        const nextPosition = currentScroll + cardWidth + gap;
                        carouselInstance.scrollToPosition(Math.min(maxScroll, nextPosition));
                    }
                    break;
                    
                case 'Home':
                    if (config.enableHomeEnd) {
                        e.preventDefault();
                        carouselInstance.scrollToPosition(0);
                    }
                    break;
                    
                case 'End':
                    if (config.enableHomeEnd) {
                        e.preventDefault();
                        carouselInstance.scrollToPosition(maxScroll);
                    }
                    break;
                    
                case 'PageUp':
                    if (config.enablePageKeys) {
                        e.preventDefault();
                        const pageBackPosition = currentScroll - carouselInstance.carousel.offsetWidth;
                        carouselInstance.scrollToPosition(Math.max(0, pageBackPosition));
                    }
                    break;
                    
                case 'PageDown':
                    if (config.enablePageKeys) {
                        e.preventDefault();
                        const pageForwardPosition = currentScroll + carouselInstance.carousel.offsetWidth;
                        carouselInstance.scrollToPosition(Math.min(maxScroll, pageForwardPosition));
                    }
                    break;
            }
        });
    },
    
    /**
     * PHASE 5: Add enhanced accessibility features
     * @param {Object} carouselInstance - Instance returned by init()
     * @param {Object} options - Configuration options
     */
    addAccessibilityFeatures: function(carouselInstance, options = {}) {
        const config = {
            announceSlideChanges: options.announceSlideChanges !== false,
            announceSlideCount: options.announceSlideCount !== false,
            addLiveRegion: options.addLiveRegion !== false,
            ...options
        };
        
        // Add ARIA attributes
        carouselInstance.carousel.setAttribute('aria-live', 'polite');
        carouselInstance.carousel.setAttribute('aria-atomic', 'false');
        
        // Add slide count information
        if (config.announceSlideCount) {
            carouselInstance.carousel.setAttribute('aria-label', 
                `Carousel with ${carouselInstance.cards.length} items`);
        }
        
        // Create live region for announcements
        let liveRegion;
        if (config.addLiveRegion) {
            liveRegion = document.createElement('div');
            liveRegion.setAttribute('aria-live', 'polite');
            liveRegion.setAttribute('aria-atomic', 'true');
            liveRegion.style.position = 'absolute';
            liveRegion.style.left = '-10000px';
            liveRegion.style.width = '1px';
            liveRegion.style.height = '1px';
            liveRegion.style.overflow = 'hidden';
            document.body.appendChild(liveRegion);
        }
        
        // Announce slide changes
        if (config.announceSlideChanges && liveRegion) {
            let announceTimeout;
            carouselInstance.carousel.addEventListener('scroll', () => {
                clearTimeout(announceTimeout);
                announceTimeout = setTimeout(() => {
                    const scrollLeft = carouselInstance.carousel.scrollLeft;
                    const cardWidth = carouselInstance.getCardWidth();
                    const gap = carouselInstance.getGap();
                    const currentSlide = Math.round(scrollLeft / (cardWidth + gap)) + 1;
                    
                    liveRegion.textContent = `Slide ${currentSlide} of ${carouselInstance.cards.length}`;
                }, 500);
            });
        }
        
        return {
            updateLiveRegion: (message) => {
                if (liveRegion) {
                    liveRegion.textContent = message;
                }
            }
        };
    }
};