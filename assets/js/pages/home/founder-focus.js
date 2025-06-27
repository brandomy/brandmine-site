/**
 * Simple Founder Focus Carousel with Auto-Advance
 * Lightweight carousel for revolutionary 50% portrait founder cards with dot navigation
 * Features: Auto-advance, pause on interaction, accessibility support
 */

// Configuration for auto-advance behavior
const CONFIG = {
    ADVANCE_INTERVAL: 8000,        // 8 seconds between slides (slower for better UX)
    PAUSE_DURATION: 4000,          // 4 seconds resume delay after interaction
    SMOOTH_SCROLL_DURATION: 800,   // Scroll animation time (for native behavior)
    ENABLE_AUTO_ADVANCE: true,     // Feature toggle
    PAUSE_ON_HOVER: true,          // Desktop hover pausing
    RESPECT_REDUCED_MOTION: true   // Accessibility compliance
};

document.addEventListener('DOMContentLoaded', function() {
    // Use universal initialization for basic setup (Phase 3 minimal integration)
    const carouselInstance = window.UniversalCarousel.init('founder-focus');
    if (!carouselInstance) return;
    
    initializeFounderFocusCarousel(carouselInstance.carousel);
});

function initializeFounderFocusCarousel(carousel) {
    const cards = carousel.querySelectorAll('.founder-focus-card');
    const dots = document.querySelectorAll('.founder-focus__dot');

    if (cards.length === 0) return;

    let currentSlide = 0;
    let autoAdvanceTimer = null;
    let isPaused = false;
    let userInteracted = false;

    // Check for reduced motion preference
    const prefersReducedMotion = CONFIG.RESPECT_REDUCED_MOTION &&
        window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    // Add smooth scrolling support
    carousel.style.scrollBehavior = 'smooth';

    // Auto-advance functions
    function startAutoAdvance() {
        if (!CONFIG.ENABLE_AUTO_ADVANCE || prefersReducedMotion || isPaused || userInteracted) {
            return;
        }

        stopAutoAdvance();
        autoAdvanceTimer = setInterval(function() {
            if (!isPaused && !userInteracted) {
                const nextSlide = (currentSlide + 1) % cards.length;
                currentSlide = nextSlide;
                scrollToSlide(nextSlide);
                updateActiveDot(nextSlide);
            }
        }, CONFIG.ADVANCE_INTERVAL);
    }

    function stopAutoAdvance() {
        if (autoAdvanceTimer) {
            clearInterval(autoAdvanceTimer);
            autoAdvanceTimer = null;
        }
    }

    function pauseAutoAdvance() {
        userInteracted = true;
        stopAutoAdvance();

        // Resume after pause duration
        setTimeout(function() {
            userInteracted = false;
            startAutoAdvance();
        }, CONFIG.PAUSE_DURATION);
    }

    // Dot click navigation
    dots.forEach(function(dot, index) {
        dot.addEventListener('click', function() {
            pauseAutoAdvance();
            currentSlide = index;
            scrollToSlide(index);
            updateActiveDot(index);
        });
    });

    // Update dots based on scroll position
    let scrollTimeout;
    carousel.addEventListener('scroll', function() {
        const cardWidth = cards[0].offsetWidth;
        const gap = parseFloat(getComputedStyle(carousel).gap) || 24;
        const slideIndex = Math.round(carousel.scrollLeft / (cardWidth + gap));
        const adjustedIndex = Math.min(slideIndex, cards.length - 1);

        if (adjustedIndex !== currentSlide) {
            currentSlide = adjustedIndex;
            updateActiveDot(adjustedIndex);
        }

        // Detect manual scrolling
        clearTimeout(scrollTimeout);
        scrollTimeout = setTimeout(function() {
            // Only pause if scroll wasn't triggered by auto-advance
            if (!autoAdvanceTimer) {
                pauseAutoAdvance();
            }
        }, 150);
    });

    // Keyboard navigation
    carousel.addEventListener('keydown', function(e) {
        if (e.key === 'ArrowLeft' || e.key === 'ArrowRight') {
            e.preventDefault();
            pauseAutoAdvance();

            if (e.key === 'ArrowLeft' && currentSlide > 0) {
                currentSlide--;
            } else if (e.key === 'ArrowRight' && currentSlide < cards.length - 1) {
                currentSlide++;
            }

            scrollToSlide(currentSlide);
            updateActiveDot(currentSlide);
        }
    });

    // Touch interaction detection
    carousel.addEventListener('touchstart', function() {
        pauseAutoAdvance();
    });

    // Mouse interaction detection (hover pause)
    if (CONFIG.PAUSE_ON_HOVER) {
        carousel.addEventListener('mouseenter', function() {
            isPaused = true;
            stopAutoAdvance();
        });

        carousel.addEventListener('mouseleave', function() {
            isPaused = false;
            if (!userInteracted) {
                startAutoAdvance();
            }
        });
    }

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

    // Cleanup on page unload
    window.addEventListener('beforeunload', function() {
        stopAutoAdvance();
    });

    // Start auto-advance after a short delay
    setTimeout(function() {
        startAutoAdvance();
    }, 1000);
}
