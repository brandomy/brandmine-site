// Case Studies Section JavaScript - Homepage Integration
// Using universal carousel consolidation (Phase 3) with preserved dynamic dots

document.addEventListener('DOMContentLoaded', function() {
    // Use universal initialization for basic setup
    const carouselInstance = window.UniversalCarousel.init('case-studies');
    if (!carouselInstance) return;
    
    const navContainer = document.querySelector('.universal-carousel-nav[data-carousel-id="case-studies"]');
    if (!navContainer) return;

    // Count the actual number of cards dynamically
    const totalCards = carouselInstance.cards.length;
    let dots = [];

    /**
     * Generate navigation dots based on screen size
     * Desktop: 2 cards per view
     * Mobile: 1 card per view
     */
    function generateDots() {
        const cardsPerView = window.innerWidth <= 991 ? 1 : 2;
        const totalDots = Math.ceil(totalCards / cardsPerView);

        navContainer.innerHTML = '';
        dots = [];

        for (let i = 0; i < totalDots; i++) {
            const dot = document.createElement('div');
            dot.className = 'universal-carousel-nav-dot';
            if (i === 0) dot.classList.add('active');
            navContainer.appendChild(dot);
            dots.push(dot);
        }

        return { cardsPerView, totalDots };
    }

    /**
     * Calculate scroll positions for each dot
     * Each position represents where carousel should scroll to
     */
    function calculateScrollPositions() {
        const cardsPerView = window.innerWidth <= 991 ? 1 : 2;
        const cardWidth = carouselInstance.getCardWidth();
        const gap = carouselInstance.getGap();

        const positions = {};
        for (let i = 0; i < dots.length; i++) {
            positions[i] = i * cardWidth * cardsPerView + (i * gap * cardsPerView);
        }

        return positions;
    }

    /**
     * Update active dot based on current scroll position
     * Finds closest position match with threshold tolerance
     */
    function updateActiveDot() {
        const scrollLeft = carouselInstance.carousel.scrollLeft;
        const positions = calculateScrollPositions();
        const threshold = 50;

        let activeDotIndex = 0;

        for (let i = 0; i < dots.length; i++) {
            if (Math.abs(scrollLeft - positions[i]) < threshold) {
                activeDotIndex = i;
                break;
            } else if (scrollLeft > positions[i]) {
                activeDotIndex = i;
            }
        }

        dots.forEach((dot, index) => {
            dot.classList.toggle('active', index === activeDotIndex);
        });
    }

    /**
     * Attach click handlers to navigation dots
     * Smooth scroll to corresponding position when clicked
     */
    function attachDotHandlers() {
        dots.forEach((dot, index) => {
            dot.addEventListener('click', function() {
                const positions = calculateScrollPositions();
                const targetPosition = positions[index] || 0;

                carouselInstance.scrollToPosition(targetPosition);

                dots.forEach(d => d.classList.remove('active'));
                dot.classList.add('active');
            });
        });
    }

    /**
     * Initialize carousel functionality
     * Sets up dots, handlers, and initial state
     */
    function initCarousel() {
        const { cardsPerView, totalDots } = generateDots();
        attachDotHandlers();
        updateActiveDot();

        console.log(`Case studies carousel initialized - ${totalDots} dots for ${cardsPerView} cards per view (${totalCards} total cards)`);
    }

    // Use universal scroll handling with custom case studies logic
    window.UniversalCarousel.addScrollHandler(carouselInstance, function(slideIndex) {
        // Custom update logic for case studies - use our special updateActiveDot
        updateActiveDot();
    });

    // Reinitialize on window resize (desktop/mobile transitions)
    window.addEventListener('resize', function() {
        setTimeout(() => {
            initCarousel();
        }, 100);
    });

    // Start the carousel
    initCarousel();
});