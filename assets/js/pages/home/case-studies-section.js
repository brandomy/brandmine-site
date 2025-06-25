// Case Studies Section JavaScript - Homepage Integration
// Handles horizontal scrolling carousel with dot navigation

document.addEventListener('DOMContentLoaded', function() {
    const carousel = document.querySelector('.universal-carousel[data-component-type="case-studies"]');
    const navContainer = document.querySelector('.universal-carousel-nav[data-carousel-id="case-studies"]');

    if (!carousel || !navContainer) return;

    // Count the actual number of cards dynamically
    const totalCards = carousel.children.length;
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
        const cardWidth = carousel.children[0].offsetWidth;
        const gap = parseFloat(getComputedStyle(carousel).gap) || 24;

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
        const scrollLeft = carousel.scrollLeft;
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

                carousel.scrollTo({
                    left: targetPosition,
                    behavior: 'smooth'
                });

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

    // Update active dot during manual scrolling
    let scrollTimeout;
    carousel.addEventListener('scroll', function() {
        clearTimeout(scrollTimeout);
        scrollTimeout = setTimeout(updateActiveDot, 100);
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