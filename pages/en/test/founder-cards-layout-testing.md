---
layout: default
title: Founder Cards Layout Testing
permalink: /test/founder-cards-layout-testing/
lang: en
---

<style>
  .test-section {
    padding: 2rem 0;
    border-bottom: 2px solid var(--neutral-200);
  }
  .test-header {
    text-align: center;
    margin-bottom: 2rem;
  }
  .test-subsection {
    margin: 3rem 0;
  }
  .test-layout-label {
    background: var(--primary-100);
    padding: 0.5rem 1rem;
    margin-bottom: 1rem;
    border-left: 4px solid var(--primary-500);
    font-weight: bold;
  }
  .card-info {
    background: var(--neutral-100);
    padding: 1rem;
    margin-bottom: 1rem;
    font-size: 0.875rem;
    border-radius: 0.5rem;
  }
  .performance-matrix {
    margin-top: 3rem;
    overflow-x: auto;
  }
  .performance-matrix table {
    width: 100%;
    border-collapse: collapse;
  }
  .performance-matrix th,
  .performance-matrix td {
    padding: 0.75rem;
    border: 1px solid var(--neutral-300);
    text-align: left;
  }
  .performance-matrix th {
    background: var(--neutral-100);
    font-weight: bold;
  }
  .status-good { color: #22c55e; }
  .status-warning { color: #f59e0b; }
  .status-poor { color: #ef4444; }
  .protected-notice {
    background: #fef3c7;
    border: 2px solid #f59e0b;
    padding: 1rem;
    margin: 1rem 0;
    border-radius: 0.5rem;
    text-align: center;
    font-weight: bold;
  }
  
  /* Override grid for 3-column layout in tests */
  .test-grid-3col {
    display: grid !important;
    grid-template-columns: repeat(3, 1fr) !important;
    gap: var(--space-6) !important;
  }
  
  /* Override grid for 2-column layout in tests */
  .test-grid-2col {
    display: grid !important;
    grid-template-columns: repeat(2, 1fr) !important;
    gap: var(--space-6) !important;
  }
  
  /* Override grid for 4-column layout in tests */
  .test-grid-4col {
    display: grid !important;
    grid-template-columns: repeat(4, 1fr) !important;
    gap: var(--space-4) !important;
  }
  
  @media (max-width: 1024px) {
    .test-grid-2col {
      grid-template-columns: 1fr !important;
    }
    .test-grid-3col {
      grid-template-columns: repeat(2, 1fr) !important;
    }
    .test-grid-4col {
      grid-template-columns: repeat(3, 1fr) !important;
    }
  }
  
  @media (max-width: 640px) {
    .test-grid-2col {
      grid-template-columns: 1fr !important;
    }
    .test-grid-3col {
      grid-template-columns: 1fr !important;
    }
    .test-grid-4col {
      grid-template-columns: repeat(2, 1fr) !important;
    }
  }
  
  /* Override carousel for single-card display in tests */
  .carousel .carousel__item {
    flex: 0 0 100% !important;
    max-width: 400px;
    margin: 0 auto;
  }
  
  /* Multi-card carousel (2 per slide) */
  .carousel--multi .carousel__item--half {
    flex: 0 0 50% !important;
    max-width: 50%;
    margin: 0;
    padding: 0 0.5rem;
  }
  
  /* Multi-card carousel (3 per slide) */
  .carousel--multi .carousel__item--third {
    flex: 0 0 33.333% !important;
    max-width: 33.333%;
    margin: 0;
    padding: 0 0.5rem;
  }
  
  @media (max-width: 768px) {
    .carousel--multi .carousel__item--half {
      flex: 0 0 100% !important;
      max-width: 100%;
    }
    .carousel--multi .carousel__item--third {
      flex: 0 0 50% !important;
      max-width: 50%;
    }
  }
  
  @media (max-width: 480px) {
    .carousel--multi .carousel__item--half {
      flex: 0 0 100% !important;
      max-width: 100%;
    }
    .carousel--multi .carousel__item--third {
      flex: 0 0 100% !important;
      max-width: 100%;
    }
  }
  
  /* Ensure proper carousel item structure */
  .carousel > .founder-card {
    flex: 0 0 100% !important;
    max-width: 400px;
    margin: 0 auto;
  }
  
  /* Fix carousel height for founder cards - set to auto instead of fixed 360px */
  .carousel {
    --carousel-height: auto !important;
  }
  
  .carousel .carousel__item {
    height: auto !important;
  }
  
  .carousel .founder-card {
    height: auto !important;
  }
  
  /* Founder comparison grid - 2 cards per row */
  .founder-comparison-grid {
    display: grid !important;
    grid-template-columns: repeat(2, 1fr) !important;
    gap: 2rem !important;
  }
  
  @media (max-width: 768px) {
    .founder-comparison-grid {
      grid-template-columns: 1fr !important;
    }
  }
  
  /* ===========================
     STANDARD CARD VARIANT C - 360px Carousel Optimized
     =========================== */
  .founder-card-variant-c {
    /* Optimize layout for 360px constraint */
    
    .founder-card {
      height: 100%;
      display: flex;
      flex-direction: column;
      padding: var(--space-3) !important; /* Reduced padding */
    }
    
    /* Circular avatar for space efficiency */
    .founder-card__headshot {
      width: 100px !important;
      height: 100px !important;
      padding-bottom: 0 !important;
      margin: 0 auto var(--space-3) !important;
      
      img {
        border-radius: 50% !important;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }
    
    /* Compact header */
    .founder-card__header {
      margin-bottom: var(--space-2) !important;
    }
    
    /* Smaller text sizes */
    .founder-card__name {
      font-size: var(--text-lg) !important;
      margin-bottom: 2px !important;
    }
    
    .founder-card__position {
      font-size: var(--text-sm) !important;
      margin-bottom: 2px !important;
    }
    
    .founder-card__location {
      font-size: var(--text-xs) !important;
    }
    
    /* Hide description to save space */
    .founder-card__description {
      display: none !important;
    }
    
    /* Compact tags */
    .founder-card__tags {
      margin: var(--space-2) 0 !important;
    }
    
    .founder-card__tag {
      font-size: 10px !important;
      padding: 2px 6px !important;
    }
    
    /* Push CTA to bottom */
    .founder-card__footer {
      margin-top: auto !important;
    }
    
    /* Smaller CTA link */
    .founder-card__footer a {
      font-size: var(--text-sm) !important;
    }
  }

  /* ===========================
     STANDARD CARD VARIANT D - Experimental Horizontal Layout
     =========================== */
  .founder-card-variant-d {
    /* Experimental horizontal card layout */
    
    .founder-card {
      display: flex !important;
      flex-direction: row !important;
      align-items: center !important;
      padding: var(--space-4) !important;
      gap: var(--space-4) !important;
      min-height: 180px !important;
    }
    
    /* Circular headshot on the left */
    .founder-card__headshot {
      width: 120px !important;
      height: 120px !important;
      flex-shrink: 0 !important;
      padding-bottom: 0 !important;
      margin-bottom: 0 !important;
      
      img {
        border-radius: 50% !important;
      }
    }
    
    /* Content flows horizontally */
    .founder-card__header {
      margin-bottom: 0 !important;
    }
    
    /* Stack name and details */
    .founder-card__info {
      display: flex !important;
      flex-direction: column !important;
      gap: var(--space-1) !important;
    }
    
    /* Hide description for cleaner look */
    .founder-card__description {
      display: none !important;
    }
    
    /* Tags inline with smaller size */
    .founder-card__tags {
      display: flex !important;
      flex-wrap: wrap !important;
      gap: var(--space-1) !important;
      margin: var(--space-2) 0 !important;
    }
    
    .founder-card__tag {
      font-size: 10px !important;
      padding: 2px 8px !important;
      background: var(--primary-100) !important;
      color: var(--primary-700) !important;
      border: none !important;
    }
    
    /* Right-aligned CTA */
    .founder-card__footer {
      margin-left: auto !important;
      margin-top: 0 !important;
    }
    
    .founder-card__footer a {
      background: var(--primary-600) !important;
      color: white !important;
      padding: var(--space-2) var(--space-3) !important;
      border-radius: var(--radius-full) !important;
      text-decoration: none !important;
      font-size: var(--text-sm) !important;
      font-weight: var(--font-medium) !important;
      white-space: nowrap !important;
      
      &:hover {
        background: var(--primary-700) !important;
      }
    }
  }

  /* ===========================
     FEATURED CARD VARIANT A - A/B Testing Styles
     =========================== */
  .founder-card-featured-variant-a {
    /* Version 2A: Now uses production CSS - no overrides needed */
    /* All 2A improvements have been applied to the base component CSS */
  }

  /* ===========================
     FEATURED CARD VARIANT B - A/B Testing Styles
     =========================== */
  .founder-card-featured-variant-b {
    /* Version 2B: Style variations for featured card */
    
    
    /* Change header border from accent to neutral grey - same as 2A */
    .founder-card-featured__header {
      border-bottom-color: var(--neutral-200) !important;
    }
    
    /* Restore subtle accent color to key achievements box with radius */
    .founder-card-featured__achievement {
      background: var(--accent-100) !important;
      border: 1px solid var(--accent-200) !important;
      border-radius: 0.25rem !important;
    }
    
    /* Remove bottom margin from description */
    .founder-card-featured__description {
      margin-bottom: 0 !important;
    }
    
    /* Reduce inner padding: was var(--space-6) [24px], now var(--space-4) [16px] */
    .founder-card-featured__content {
      padding: var(--space-4) !important;
    }
    
    /* Ensure CTA button is at bottom of card and align right */
    .founder-card-featured__cta {
      margin-top: auto !important;
      align-self: flex-end !important;
      text-align: right !important;
    }
    
    /* Make button only as wide as text content - same as 2A */
    .founder-card-featured__cta-button {
      display: inline-block !important;
      width: auto !important;
      text-align: center !important;
    }
    
    /* Generation metric in upper right */
    .founder-card-featured {
      position: relative !important;
    }
    
    .generation-metric {
      position: absolute !important;
      top: 8px !important;
      right: 8px !important;
      background: rgba(255, 255, 255, 0.9) !important;
      color: var(--neutral-700) !important;
      font-size: 0.75rem !important;
      font-weight: var(--font-medium) !important;
      padding: 2px 6px !important;
      border-radius: 4px !important;
      border: 1px solid var(--neutral-200) !important;
      z-index: 10 !important;
    }
    
    /* Custom location format: Company • City Flag */
    .founder-card-featured__location {
      /* Will be overridden by custom HTML content */
    }
  }
  
  /* VISUAL DEBUGGING TOOLKIT - Isolated to test page only */
  
  /* Color-coded element debugging */
  .debug-layout .founder-card__achievement,
  .debug-layout .founder-card-featured__achievement {
    background: rgba(0, 255, 0, 0.2) !important;
    border: 2px solid green !important;
    margin: 2px 0 !important;
  }
  
  .debug-layout .founder-card__location,
  .debug-layout .founder-card-featured__location {
    background: rgba(255, 0, 0, 0.2) !important;
    border: 2px solid red !important;
    margin: 2px 0 !important;
  }
  
  .debug-layout .location {
    background: rgba(0, 0, 255, 0.2) !important;
    border: 2px solid blue !important;
    margin: 1px !important;
  }
  
  .debug-layout .location__icon {
    background: yellow !important;
    border: 2px solid orange !important;
    min-width: 10px !important;
    min-height: 10px !important;
  }
  
  .debug-layout .location__text {
    background: rgba(128, 0, 128, 0.2) !important;
    border: 2px solid purple !important;
  }
  
  /* Grid overlay debugging */
  .debug-grid .founder-card,
  .debug-grid .founder-card-featured {
    position: relative;
  }

  .debug-grid .founder-card::before,
  .debug-grid .founder-card-featured::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: 
      linear-gradient(to right, rgba(255, 0, 0, 0.1) 1px, transparent 1px),
      linear-gradient(to bottom, rgba(255, 0, 0, 0.1) 1px, transparent 1px);
    background-size: 10px 10px;
    pointer-events: none;
    z-index: 999;
  }

  .debug-grid .founder-card::after,
  .debug-grid .founder-card-featured::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 2px;
    height: 100%;
    background: rgba(255, 0, 0, 0.8);
    pointer-events: none;
    z-index: 1000;
  }
  
  /* Ruler debugging */
  .debug-ruler .founder-card__achievement::before,
  .debug-ruler .founder-card__location::before,
  .debug-ruler .founder-card-featured__achievement::before,
  .debug-ruler .founder-card-featured__location::before {
    content: '← 0px 5px 10px 15px 20px 25px 30px →';
    display: block;
    font-size: 8px;
    color: red;
    font-family: monospace;
    background: rgba(255, 255, 255, 0.9);
    padding: 2px;
    margin-bottom: 2px;
  }
  
  /* Box model debugging */
  .debug-box-model * {
    box-shadow: 
      0 0 0 1px red,      /* Border */
      0 0 0 3px yellow,   /* Padding */
      0 0 0 5px blue      /* Margin */
    !important;
    position: relative;
  }

  .debug-box-model *::before {
    content: attr(class);
    position: absolute;
    top: -20px;
    left: 0;
    font-size: 8px;
    background: black;
    color: white;
    padding: 2px;
    white-space: nowrap;
    z-index: 1000;
  }
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Custom formatting for both 2A and 2B variants
    
    // 2A: Change location format with active TeaTime link, remove duplicate company section, and move description
    const variantA = document.querySelector('.founder-card-featured-variant-a');
    if (variantA) {
        const locationElement = variantA.querySelector('.founder-card-featured__location');
        const companySection = variantA.querySelector('.founder-card-featured__company');
        const tagsSection = variantA.querySelector('.founder-card-featured__tags');
        const descriptionSection = variantA.querySelector('.founder-card-featured__description');
        const card = variantA.querySelector('.founder-card-featured');
        
        // Add generation marker to 2A (matching 2B)
        if (card && !card.querySelector('.generation-metric')) {
            const generationMetric = document.createElement('div');
            generationMetric.className = 'generation-metric';
            generationMetric.textContent = '1st Gen';
            card.appendChild(generationMetric);
        }
        
        if (locationElement && locationElement.textContent.includes('Moscow')) {
            // Create HTML with smaller link emoji and active TeaTime link
            locationElement.innerHTML = '<span style="font-size: 0.7em;">🔗</span> <a href="/en/brands/ru-teatime/" class="teatime-link-2a" style="color: inherit; text-decoration: none;">TeaTime</a> • Moscow 🇷🇺';
            
            // Add hover effect to the TeaTime link in 2A
            const teatimeLink = locationElement.querySelector('.teatime-link-2a');
            if (teatimeLink) {
                teatimeLink.addEventListener('mouseenter', function() {
                    this.style.color = 'var(--primary-600)';
                    this.style.textDecoration = 'underline';
                });
                teatimeLink.addEventListener('mouseleave', function() {
                    this.style.color = 'inherit';
                    this.style.textDecoration = 'none';
                });
            }
        }
        
        // Remove the duplicate company section (second "🔗 TeaTime")
        if (companySection) {
            companySection.remove();
        }
        
        // Move description above the tag cloud
        if (descriptionSection && tagsSection) {
            tagsSection.parentNode.insertBefore(descriptionSection, tagsSection);
        }
        
        // Change CTA button text to "Meet Alexei..."
        const ctaButton2A = variantA.querySelector('.founder-card-featured__cta-button');
        if (ctaButton2A) {
            ctaButton2A.textContent = 'Meet Alexei →';
        }
    }
    
    // 2B: Apply modifications to all cards with variant-b styling
    const applyVariant2BStyling = (card) => {
        const locationElement = card.querySelector('.founder-card-featured__location');
        const companySection = card.querySelector('.founder-card-featured__company');
        const achievementSection = card.querySelector('.founder-card-featured__achievement');
        const originalDescription = card.querySelector('.founder-card-featured__description');
        const ctaButton = card.querySelector('.founder-card-featured__cta-button');
        const nameElement = card.querySelector('.founder-card-featured__name');
        
        // Add generation metric to upper right (only if not already added)
        if (!card.querySelector('.generation-metric')) {
            const generationMetric = document.createElement('div');
            generationMetric.className = 'generation-metric';
            generationMetric.textContent = '1st Gen';
            card.appendChild(generationMetric);
        }
        
        if (locationElement) {
            // Simple format matching 2A: 🔗 TeaTime • Moscow 🇷🇺
            locationElement.innerHTML = '<span style="font-size: 0.85em;">🔗</span> <a href="/en/brands/ru-teatime/" class="company-link-2b" style="color: inherit; text-decoration: none;">TeaTime</a> • Moscow 🇷🇺';
            
            // Add hover effect to the company link
            const companyLink = locationElement.querySelector('.company-link-2b');
            if (companyLink) {
                companyLink.addEventListener('mouseenter', function() {
                    this.style.textDecoration = 'underline';
                    this.style.color = 'var(--primary-600)';
                });
                companyLink.addEventListener('mouseleave', function() {
                    this.style.textDecoration = 'none';
                    this.style.color = 'inherit';
                });
            }
        }
        
        // Move description between achievement box and tags
        if (achievementSection && originalDescription) {
            const descriptionText = originalDescription.textContent;
            const tagsSection = card.querySelector('.founder-card-featured__tags');
            
            // Remove original description
            originalDescription.remove();
            
            // Create new description element
            const newDescription = document.createElement('p');
            newDescription.className = 'founder-card-featured__description';
            newDescription.style.cssText = 'font-size: var(--text-sm); line-height: var(--leading-relaxed); color: var(--neutral-600); margin: var(--space-3) 0;';
            newDescription.textContent = descriptionText;
            
            // Insert between achievement and tags
            if (tagsSection) {
                tagsSection.parentNode.insertBefore(newDescription, tagsSection);
            } else {
                // If no tags, append after achievement
                achievementSection.parentNode.insertBefore(newDescription, achievementSection.nextSibling);
            }
        }
        
        // Remove the company section entirely
        if (companySection) {
            companySection.remove();
        }
        
        // Change CTA button text to use first name
        if (ctaButton && nameElement) {
            const firstName = nameElement.textContent.split(' ')[0];
            ctaButton.textContent = `Meet ${firstName} →`;
        }
    };
    
    // Apply to all cards within variant-b sections (both single card in Section 0 and all cards in Section 2)
    const allVariantBCards = document.querySelectorAll('.founder-card-featured-variant-b .founder-card-featured, .founder-card-featured-variant-b .founder-card-featured');
    allVariantBCards.forEach(card => {
        applyVariant2BStyling(card);
    });
    
    // 1A: Change "View Profile" text to "Meet Alexei -->"
    // Find all founder cards and check which ones are NOT in variant-b wrapper
    const allFounderCards = document.querySelectorAll('.founder-card');
    allFounderCards.forEach(card => {
        if (!card.closest('.founder-card-variant-b') && !card.closest('.founder-card-featured-variant-a') && !card.closest('.founder-card-featured-variant-b')) {
            const profileLink1A = card.querySelector('a[href*="founders"]');
            if (profileLink1A && profileLink1A.textContent.includes('View Profile')) {
                profileLink1A.textContent = 'Meet Alexei →';
            }
        }
    });
    
    // 1B: Change "View Profile" text to "Meet Alexei -->"
    const variant1B = document.querySelector('.founder-card-variant-b');
    if (variant1B) {
        const profileLink = variant1B.querySelector('a[href*="founders"]');
        if (profileLink && profileLink.textContent.includes('View Profile')) {
            profileLink.textContent = 'Meet Alexei →';
        }
    }
    
    // 1C: Change "View Profile" text to "Meet Alexei -->"
    const variant1C = document.querySelector('.founder-card-variant-c');
    if (variant1C) {
        const profileLink = variant1C.querySelector('a[href*="founders"]');
        if (profileLink && profileLink.textContent.includes('View Profile')) {
            profileLink.textContent = 'Meet Alexei →';
        }
    }
    
    // 1D: Change "View Profile" text to shorter "Meet →" for compact button
    const variant1D = document.querySelector('.founder-card-variant-d');
    if (variant1D) {
        const profileLink = variant1D.querySelector('a[href*="founders"]');
        if (profileLink && profileLink.textContent.includes('View Profile')) {
            profileLink.textContent = 'Meet →';
        }
    }
    
    // Display card dimensions for each variant
    const displayCardDimensions = () => {
        // Define the card variants and their selectors
        const variants = [
            { id: '1A', selector: '.founder-card:not(.founder-card-variant-b):not(.founder-card-variant-c):not(.founder-card-variant-d)' },
            { id: '1B', selector: '.founder-card-variant-b .founder-card' },
            { id: '1C', selector: '.founder-card-variant-c .founder-card' },
            { id: '1D', selector: '.founder-card-variant-d .founder-card' },
            { id: '2A', selector: '.founder-card-featured-variant-a .founder-card-featured' },
            { id: '2B', selector: '.founder-card-featured-variant-b .founder-card-featured' }
        ];
        
        variants.forEach(variant => {
            const card = document.querySelector(variant.selector);
            if (card) {
                const rect = card.getBoundingClientRect();
                const computedStyle = window.getComputedStyle(card);
                
                // Create dimension display element
                const dimensionDisplay = document.createElement('div');
                dimensionDisplay.className = 'card-dimensions';
                dimensionDisplay.style.cssText = 'position: absolute; top: -25px; left: 0; background: #1f2937; color: white; padding: 2px 8px; font-size: 11px; border-radius: 4px; font-family: monospace; z-index: 100;';
                dimensionDisplay.textContent = `${Math.round(rect.width)}×${Math.round(rect.height)}px`;
                
                // Find the card's container and make it relative positioned
                const container = card.closest('[style*="border"]');
                if (container) {
                    container.style.position = 'relative';
                    container.appendChild(dimensionDisplay);
                }
                
                // Log dimensions to console for debugging
                console.log(`${variant.id} Card Dimensions:`, {
                    width: Math.round(rect.width),
                    height: Math.round(rect.height),
                    padding: computedStyle.padding,
                    maxWidth: computedStyle.maxWidth
                });
            }
        });
    };
    
    // Run after a delay to ensure all styles are applied
    setTimeout(displayCardDimensions, 500);
    
    // Also update on window resize
    let resizeTimeout;
    window.addEventListener('resize', () => {
        clearTimeout(resizeTimeout);
        // Remove old dimension displays
        document.querySelectorAll('.card-dimensions').forEach(el => el.remove());
        resizeTimeout = setTimeout(displayCardDimensions, 250);
    });
    
    console.log('Initializing founder cards test carousels...');
    
    // Find all carousels on the test page
    const carousels = document.querySelectorAll('.carousel');
    console.log('Found', carousels.length, 'carousels');
    
    carousels.forEach((carousel, carouselIndex) => {
        initializeTestCarousel(carousel, carouselIndex);
    });
});

function initializeTestCarousel(carousel, carouselIndex) {
    const items = carousel.querySelectorAll('.carousel__item');
    console.log('Carousel', carouselIndex, 'has', items.length, 'items');
    
    if (items.length === 0) {
        console.warn('No carousel items found in carousel', carouselIndex);
        return;
    }
    
    // Detect carousel type and calculate slides
    const carouselType = getCarouselType(carousel);
    const slideCount = calculateSlideCount(items.length, carouselType);
    console.log('Carousel type:', carouselType, 'Slide count:', slideCount);
    
    let currentSlide = 0;
    
    // Create navigation dots based on actual slide count
    const navContainer = createNavigationDots(carousel, slideCount, carouselIndex);
    const dots = navContainer.querySelectorAll('.founder-focus__dot');
    
    // Set initial active state
    updateActiveDot(dots, 0);
    
    // Add click handlers to dots
    dots.forEach((dot, index) => {
        dot.addEventListener('click', function() {
            console.log('Dot clicked:', index);
            goToSlide(carousel, items, dots, index, carouselType);
            currentSlide = index;
        });
    });
    
    // Add scroll listener for manual scrolling
    carousel.addEventListener('scroll', function() {
        const newSlide = getCurrentSlide(carousel, items, carouselType);
        if (newSlide !== currentSlide) {
            currentSlide = newSlide;
            updateActiveDot(dots, currentSlide);
        }
    });
    
    console.log('Test carousel', carouselIndex, 'initialized successfully');
}

function getCarouselType(carousel) {
    // Detect carousel type based on CSS classes and item classes
    if (carousel.classList.contains('carousel--multi')) {
        const firstItem = carousel.querySelector('.carousel__item');
        if (firstItem) {
            if (firstItem.classList.contains('carousel__item--third')) {
                return '3-per-slide';
            } else if (firstItem.classList.contains('carousel__item--half')) {
                return '2-per-slide';
            }
        }
        return 'multi-unknown';
    }
    return '1-per-slide';
}

function calculateSlideCount(itemCount, carouselType) {
    switch (carouselType) {
        case '1-per-slide':
            return itemCount;
        case '2-per-slide':
            return Math.ceil(itemCount / 2);
        case '3-per-slide':
            return Math.ceil(itemCount / 3);
        default:
            return itemCount;
    }
}

function createNavigationDots(carousel, slideCount, carouselIndex) {
    // Look for existing navigation container
    let navContainer = carousel.parentNode.querySelector('.founder-focus__navigation');
    
    if (!navContainer) {
        // Create navigation container using homepage styles
        navContainer = document.createElement('div');
        navContainer.className = 'founder-focus__navigation';
        
        const dotsContainer = document.createElement('div');
        dotsContainer.className = 'founder-focus__dots';
        navContainer.appendChild(dotsContainer);
        
        // Insert after carousel
        carousel.parentNode.insertBefore(navContainer, carousel.nextSibling);
    }
    
    // Get or create dots container
    let dotsContainer = navContainer.querySelector('.founder-focus__dots');
    if (!dotsContainer) {
        dotsContainer = document.createElement('div');
        dotsContainer.className = 'founder-focus__dots';
        navContainer.appendChild(dotsContainer);
    }
    
    // Clear existing dots
    dotsContainer.innerHTML = '';
    
    // Create dots using homepage CSS classes
    for (let i = 0; i < slideCount; i++) {
        const dot = document.createElement('button');
        dot.className = 'founder-focus__dot';
        dot.setAttribute('data-slide', i);
        dot.setAttribute('aria-label', `Go to slide ${i + 1}`);
        
        // Active state using homepage classes
        if (i === 0) {
            dot.classList.add('founder-focus__dot--active');
        }
        
        dotsContainer.appendChild(dot);
    }
    
    console.log('Created', slideCount, 'navigation dots for carousel', carouselIndex);
    return navContainer;
}

function goToSlide(carousel, items, dots, slideIndex, carouselType) {
    // Calculate how many items per slide
    let itemsPerSlide = 1;
    switch (carouselType) {
        case '2-per-slide': itemsPerSlide = 2; break;
        case '3-per-slide': itemsPerSlide = 3; break;
    }
    
    // Calculate which item to scroll to
    const targetItemIndex = slideIndex * itemsPerSlide;
    if (targetItemIndex >= items.length) return;
    
    // Calculate scroll position
    const targetItem = items[targetItemIndex];
    const scrollLeft = targetItem.offsetLeft - carousel.offsetLeft;
    
    // Smooth scroll to position
    carousel.scrollTo({
        left: scrollLeft,
        behavior: 'smooth'
    });
    
    // Update dots
    updateActiveDot(dots, slideIndex);
}

function updateActiveDot(dots, activeIndex) {
    dots.forEach((dot, index) => {
        const isActive = index === activeIndex;
        // Use homepage CSS classes instead of inline styles
        if (isActive) {
            dot.classList.add('founder-focus__dot--active');
        } else {
            dot.classList.remove('founder-focus__dot--active');
        }
    });
}

function getCurrentSlide(carousel, items, carouselType) {
    // Calculate how many items per slide
    let itemsPerSlide = 1;
    switch (carouselType) {
        case '2-per-slide': itemsPerSlide = 2; break;
        case '3-per-slide': itemsPerSlide = 3; break;
    }
    
    const scrollLeft = carousel.scrollLeft;
    let closestSlide = 0;
    let closestDistance = Math.abs(items[0].offsetLeft - scrollLeft);
    
    // Check each slide position (every itemsPerSlide items)
    for (let slideIndex = 0; slideIndex < Math.ceil(items.length / itemsPerSlide); slideIndex++) {
        const itemIndex = slideIndex * itemsPerSlide;
        if (itemIndex < items.length) {
            const distance = Math.abs(items[itemIndex].offsetLeft - scrollLeft);
            if (distance < closestDistance) {
                closestDistance = distance;
                closestSlide = slideIndex;
            }
        }
    }
    
    return closestSlide;
}

// Visual Debugging Toolkit JavaScript
let debugState = {
  layout: false,
  grid: false,
  ruler: false,
  boxModel: false
};

function toggleDebugLayout() {
  debugState.layout = !debugState.layout;
  document.body.classList.toggle('debug-layout', debugState.layout);
  console.log('Layout debug:', debugState.layout ? 'ON' : 'OFF');
}

function toggleDebugGrid() {
  debugState.grid = !debugState.grid;
  document.body.classList.toggle('debug-grid', debugState.grid);
  console.log('Grid debug:', debugState.grid ? 'ON' : 'OFF');
}

function toggleDebugRuler() {
  debugState.ruler = !debugState.ruler;
  document.body.classList.toggle('debug-ruler', debugState.ruler);
  console.log('Ruler debug:', debugState.ruler ? 'ON' : 'OFF');
}

function toggleDebugBoxModel() {
  debugState.boxModel = !debugState.boxModel;
  document.body.classList.toggle('debug-box-model', debugState.boxModel);
  console.log('Box model debug:', debugState.boxModel ? 'ON' : 'OFF');
}

// Element dimension reporting
function reportDimensions() {
  const achievement = document.querySelector('.founder-card__achievement, .founder-card-featured__achievement');
  const location = document.querySelector('.founder-card__location, .founder-card-featured__location');
  const locationText = document.querySelector('.location__text');
  const locationIcon = document.querySelector('.location__icon');
  
  console.group('🔍 Element Dimension Report');
  
  if (achievement) {
    const achievementRect = achievement.getBoundingClientRect();
    const achievementStyles = window.getComputedStyle(achievement);
    console.log('✅ Achievement Element:', {
      offsetLeft: achievement.offsetLeft,
      offsetTop: achievement.offsetTop,
      clientWidth: achievement.clientWidth,
      clientHeight: achievement.clientHeight,
      boundingRect: achievementRect,
      marginLeft: achievementStyles.marginLeft,
      paddingLeft: achievementStyles.paddingLeft
    });
  }
  
  if (location) {
    const locationRect = location.getBoundingClientRect();
    const locationStyles = window.getComputedStyle(location);
    const locationLeft = location.offsetLeft;
    
    console.log('🔴 Location Element:', {
      offsetLeft: locationLeft,
      offsetTop: location.offsetTop,
      clientWidth: location.clientWidth,
      clientHeight: location.clientHeight,
      boundingRect: locationRect,
      marginLeft: locationStyles.marginLeft,
      paddingLeft: locationStyles.paddingLeft
    });
    
    // Compare alignment with achievement if both exist
    if (achievement) {
      const achievementLeft = achievement.offsetLeft;
      const difference = Math.abs(achievementLeft - locationLeft);
      
      console.log('🎯 Alignment Analysis:', {
        achievementLeft: achievementLeft,
        locationLeft: locationLeft,
        difference: difference,
        alignment: difference === 0 ? '✅ PERFECT' : `❌ ${difference}px offset`
      });
    }
  }
  
  console.groupEnd();
  
  // Also show alert for quick reference
  alert(`Debug measurements logged to console. Check browser dev tools for detailed analysis.`);
}

// Initialize debugging tools
document.addEventListener('DOMContentLoaded', function() {
  console.log('🔧 Visual Debugging Toolkit loaded. Use the debug buttons above to analyze layout issues.');
});
</script>

<div class="container">
  <div class="test-header">
    <h1>Founder Cards Layout Testing</h1>
    <p>Comprehensive testing of MVP founder cards in different layout contexts</p>
  </div>

  <!-- Get test founder data -->
  {% assign comparison_founder = site.founders | where: "lang", "en" | where: "ref", "ru-alexei-sokolov" | first %}
  {% assign test_founders = site.founders | where: "lang", "en" | limit: 3 %}

  <!-- Section 0: Single Card Comparison -->
  <section class="test-section">
    <h2>Section 0: SINGLE CARD TYPE COMPARISON</h2>
    <p style="text-align: center; color: #6b7280; margin-bottom: 2rem;">Side-by-side comparison of founder card components using identical data</p>
    
    <!-- Single card comparison grid - organized in rows -->
    <div style="margin-bottom: 3rem;">
      
      <!-- Row 1: 1A and 1B -->
      <div class="founder-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 2rem;">
      
      <!-- 1A. Standard founder-card (Version A) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1A. founder-card.html (Version A)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Standard founder display - Current design | <strong>Usage:</strong> Grid layouts
        </div>
        <div style="border: 2px solid #3b82f6; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_founder %}
            {% include components/cards/founder-card.html founder=comparison_founder %}
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Name:</strong><br>
              • Font: <code>var(--text-lg)</code> (1.125rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.25<br><br>
              
              <strong style="color: #1f2937;">Position/Company:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code> (#4B5563)<br><br>
              
              <strong style="color: #1f2937;">Location:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-500)</code> (#6B7280)<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Generation Badge:</strong><br>
              • Font: <code>var(--text-xs)</code> (0.75rem)<br>
              • Weight: <code>var(--font-medium)</code> (500)<br>
              • Background: <code>var(--primary-100)</code><br>
              • Color: <code>var(--primary-700)</code><br>
              • Padding: 2px 8px<br>
              • Border radius: <code>var(--radius-full)</code><br><br>
              
              <strong style="color: #1f2937;">Dimension Tags:</strong><br>
              • <span style="background: var(--neutral-100); color: var(--neutral-600); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Standard</span> Neutral tags<br>
              • Font: <code>var(--text-xs)</code> (0.75rem)<br>
              • Padding: 4px 8px<br><br>
              
              <strong style="color: #1f2937;">CTA Link:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--primary-600)</code><br>
              • Hover: <code>var(--primary-500)</code>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1B. Standard founder-card (Version B) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1B. founder-card.html (Version B)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> A/B test variant - Style variations | <strong>Usage:</strong> Testing alternative designs
        </div>
        <div style="border: 2px solid #8b5cf6; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_founder %}
            <div class="founder-card-variant-b">
              {% include components/cards/founder-card.html founder=comparison_founder %}
            </div>
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Name:</strong><br>
              • Font: <code>var(--text-lg)</code> (1.125rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.25<br><br>
              
              <strong style="color: #1f2937;">Position/Company:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code> (#4B5563)<br><br>
              
              <strong style="color: #1f2937;">Location:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-500)</code> (#6B7280)<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Variant B Styling:</strong><br>
              • Background: <code>var(--neutral-100)</code> (light gray)<br>
              • Headshot: Square corners (no radius)<br>
              • Tags: <code>var(--neutral-200)</code> background<br>
              • Divider: <code>var(--neutral-200)</code><br><br>
              
              <strong style="color: #1f2937;">CTA Link Enhanced:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--primary-600)</code><br>
              • Hover: underline + <code>var(--primary-500)</code><br>
              • Underline offset: 2px
            </div>
          </div>
        </div>
      </div>
      
      </div>
      
      <!-- CSS and JS Sources for 1A and 1B -->
      <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin: 2rem 0;">
        <h4 style="margin-bottom: 1rem;">CSS and JS Sources</h4>
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
          <div>
            <h5 style="margin-bottom: 0.5rem;">1A Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/founder-card.scss</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          </div>
          <div>
            <h5 style="margin-bottom: 0.5rem;">1B Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> founder-cards-layout-testing.md (lines 320-342)</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          </div>
        </div>
      </div>
      
      <!-- Row 2: 1C and 1D -->
      <div class="founder-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 2rem;">
      
      <!-- 1C. Standard founder-card (Constrained Height) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1C. founder-card.html (360px Constrained)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Carousel-optimized height | <strong>Usage:</strong> Standard carousel layouts
        </div>
        <div style="border: 2px solid #f59e0b; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_founder %}
            <div class="founder-card-variant-c" style="height: 360px; overflow: hidden;">
              {% include components/cards/founder-card.html founder=comparison_founder %}
            </div>
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Name (Compact):</strong><br>
              • Font: <code>var(--text-lg)</code> (1.125rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Margin: 2px bottom<br><br>
              
              <strong style="color: #1f2937;">Position (Compact):</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code> (#4B5563)<br>
              • Margin: 2px bottom<br><br>
              
              <strong style="color: #1f2937;">Location (Compact):</strong><br>
              • Font: <code>var(--text-xs)</code> (0.75rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-500)</code> (#6B7280)<br>
            </div>
            <div>
              <strong style="color: #1f2937;">360px Optimizations:</strong><br>
              • Circular avatar: 100px × 100px<br>
              • Reduced padding: <code>var(--space-3)</code><br>
              • Hidden description for space efficiency<br>
              • Compact tags: 10px font, 2px-6px padding<br><br>
              
              <strong style="color: #1f2937;">Layout Features:</strong><br>
              • Height constraint: 360px with overflow hidden<br>
              • Centered avatar layout<br>
              • Bottom-aligned CTA<br>
              • Space-efficient design for carousels
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1D. Standard founder-card (Experimental Layout) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1D. founder-card.html (Experimental)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Experimental layout variations | <strong>Usage:</strong> Testing new approaches
        </div>
        <div style="border: 2px solid #14b8a6; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_founder %}
            <div class="founder-card-variant-d">
              {% include components/cards/founder-card.html founder=comparison_founder %}
            </div>
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Horizontal Layout:</strong><br>
              • Display: flex row with center alignment<br>
              • Avatar: 120px × 120px circular (left)<br>
              • Content: vertical stack (center)<br>
              • CTA: right-aligned<br><br>
              
              <strong style="color: #1f2937;">Typography (Unchanged):</strong><br>
              • Name: <code>var(--text-lg)</code> semibold<br>
              • Position: <code>var(--text-sm)</code> regular<br>
              • Location: <code>var(--text-sm)</code> regular<br>
              • Colors: Standard neutral palette<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Experimental Features:</strong><br>
              • Horizontal information flow<br>
              • Larger circular headshot<br>
              • Hidden description for clean look<br>
              • Inline tag layout<br><br>
              
              <strong style="color: #1f2937;">Enhanced CTA:</strong><br>
              • Background: <code>var(--primary-600)</code><br>
              • Color: white<br>
              • Padding: <code>var(--space-2)</code> <code>var(--space-3)</code><br>
              • Border radius: <code>var(--radius-full)</code><br>
              • Hover: <code>var(--primary-700)</code>
            </div>
          </div>
        </div>
      </div>
      
      </div>
      
      <!-- CSS and JS Sources for 1C and 1D -->
      <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin: 2rem 0;">
        <h4 style="margin-bottom: 1rem;">CSS and JS Sources</h4>
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
          <div>
            <h5 style="margin-bottom: 0.5rem;">1C Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> founder-cards-layout-testing.md (lines 191-260)</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          </div>
          <div>
            <h5 style="margin-bottom: 0.5rem;">1D Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> founder-cards-layout-testing.md (lines 265-342)</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          </div>
        </div>
      </div>
      
      <!-- Row 3: 2A and 2B -->
      <div class="founder-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 2rem;">
      
      <!-- 2A. Featured founder-card (Version A) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">2A. founder-card-featured.html (Version A)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Featured founder with 50% portrait - Current design | <strong>Usage:</strong> Homepage focus
        </div>
        <div style="border: 2px solid #10b981; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_founder %}
            <div class="founder-card-featured-variant-a">
              {% include components/cards/founder-card-featured.html founder=comparison_founder %}
            </div>
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Featured Name:</strong><br>
              • Font: <code>var(--text-2xl)</code> (1.5rem)<br>
              • Weight: <code>var(--font-bold)</code> (700)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.2<br><br>
              
              <strong style="color: #1f2937;">Position (Enhanced):</strong><br>
              • Font: <code>var(--text-lg)</code> (1.125rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code> (#4B5563)<br><br>
              
              <strong style="color: #1f2937;">Location (Enhanced):</strong><br>
              • Font: <code>var(--text-base)</code> (1rem)<br>
              • Color: <code>var(--neutral-500)</code> (#6B7280)<br>
              • Icon: 16px × 16px flex-shrink-0<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Achievement Badge:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: <code>var(--font-medium)</code> (500)<br>
              • Color: <code>var(--secondary-700)</code><br>
              • Icon: 16px × 16px <code>var(--secondary-500)</code><br><br>
              
              <strong style="color: #1f2937;">Enhanced Layout:</strong><br>
              • 50% portrait split layout<br>
              • Larger text hierarchy<br>
              • Enhanced padding and spacing<br>
              • Premium content presentation<br><br>
              
              <strong style="color: #1f2937;">CTA Button:</strong><br>
              • Background: <code>var(--primary-600)</code><br>
              • Font: <code>var(--text-lg)</code> semibold<br>
              • Hover: <code>var(--primary-700)</code>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 2B. Featured founder-card (Version B) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">2B. founder-card-featured.html (Version B)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> A/B test variant - Featured card variations | <strong>Usage:</strong> alternative design
        </div>
        <div style="border: 2px solid #06b6d4; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_founder %}
            <div class="founder-card-featured-variant-b">
              {% include components/cards/founder-card-featured.html founder=comparison_founder %}
            </div>
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Featured Name (Same):</strong><br>
              • Font: <code>var(--text-2xl)</code> (1.5rem)<br>
              • Weight: <code>var(--font-bold)</code> (700)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.2<br><br>
              
              <strong style="color: #1f2937;">Position (Same):</strong><br>
              • Font: <code>var(--text-lg)</code> (1.125rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code> (#4B5563)<br><br>
              
              <strong style="color: #1f2937;">Location (Enhanced):</strong><br>
              • Custom format: 🔗 TeaTime • Moscow 🇷🇺<br>
              • Active company link with hover effects<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Variant B Enhancements:</strong><br>
              • Achievement box: <code>var(--accent-100)</code> background<br>
              • Border: 1px solid <code>var(--accent-200)</code><br>
              • Border radius: 0.25rem<br>
              • Reduced padding: <code>var(--space-4)</code><br><br>
              
              <strong style="color: #1f2937;">Generation Metric:</strong><br>
              • Position: absolute top-right<br>
              • Background: rgba(255,255,255,0.9)<br>
              • Font: 0.75rem medium<br>
              • Border: 1px solid <code>var(--neutral-200)</code><br><br>
              
              <strong style="color: #1f2937;">Layout Changes:</strong><br>
              • Description moved between achievement and tags<br>
              • Enhanced company link interaction<br>
              • Compact content organization
            </div>
          </div>
        </div>
      </div>
      
      </div>
      
    </div>
    
    <!-- CSS and JS Sources for 2A and 2B -->
    <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin: 2rem 0;">
      <h4 style="margin-bottom: 1rem;">CSS and JS Sources</h4>
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
        <div>
          <h5 style="margin-bottom: 0.5rem;">2A Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> founder-cards-layout-testing.md (lines 348-404)</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> founder-cards-layout-testing.md (lines 462-512)</p>
        </div>
        <div>
          <h5 style="margin-bottom: 0.5rem;">2B Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> founder-cards-layout-testing.md (lines 408-450)</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> founder-cards-layout-testing.md (lines 515-584)</p>
        </div>
      </div>
    </div>
    
    <!-- 3. Founder Focus Carousel from Homepage -->
    <div style="margin-top: 3rem;">
      <h3 style="text-align: center; margin-bottom: 1.5rem; color: #1f2937;">3. Founder Focus Carousel (Homepage Production)</h3>
      <div class="card-info" style="margin-bottom: 1rem; text-align: center;">
        <strong>Purpose:</strong> Production homepage carousel | <strong>Usage:</strong> Live homepage implementation
      </div>
      
      <!-- Include the actual founder focus section from homepage -->
      <div style="border: 2px solid #9333ea; padding: 1rem; background: white; border-radius: 0.5rem;">
        {% include pages/home/founder-focus.html %}
      </div>
      
      <!-- CSS and JS Sources for Homepage Carousel -->
      <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
        <h5 style="margin-bottom: 0.5rem;">Homepage Carousel Sources (Clean Architecture):</h5>
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 0.5rem;">
          <div>
            <h6 style="margin: 0 0 0.25rem 0; color: #374151;">Page Level (Layout/Carousel):</h6>
            <p style="margin: 0; font-size: 0.75rem;"><strong>HTML:</strong> _includes/pages/home/founder-focus.html</p>
            <p style="margin: 0; font-size: 0.75rem;"><strong>CSS:</strong> assets/css/pages/home/founder-focus.scss</p>
            <p style="margin: 0; font-size: 0.75rem;"><strong>JS:</strong> assets/js/pages/home/founder-focus.js</p>
          </div>
          <div>
            <h6 style="margin: 0 0 0.25rem 0; color: #374151;">Component Level (Card Styling):</h6>
            <p style="margin: 0; font-size: 0.75rem;"><strong>HTML:</strong> _includes/components/cards/founder-card-featured.html</p>
            <p style="margin: 0; font-size: 0.75rem;"><strong>CSS:</strong> assets/css/components/cards/founder-card-featured.scss</p>
            <p style="margin: 0; font-size: 0.75rem;"><strong>JS:</strong> None (pure CSS component)</p>
          </div>
        </div>
        <p style="margin: 0.5rem 0 0 0; font-size: 0.75rem; color: #6b7280;"><strong>Note:</strong> Clean separation - page handles layout/carousel, component handles card visuals. 2A improvements applied to component CSS.</p>
      </div>
    </div>
    
    <!-- Typography & Color Variations Summary -->
    <div style="background: #fffbeb; border: 2px solid #f59e0b; padding: 1.5rem; border-radius: 0.5rem; margin: 2rem 0;">
      <h4 style="margin-bottom: 1rem; color: #92400e;">🎨 Typography & Color Variations Summary</h4>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem;">
        
        <!-- Standard Cards (1A-1D) -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Standard Founder Cards (1A-1D):</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>1A - Standard Layout:</strong><br>
            • Name: text-lg (1.125rem) semibold<br>
            • Position: text-sm neutral-600<br>
            • Tags: neutral background, standard spacing<br><br>
            
            <strong>1B - Variant B Styling:</strong><br>
            • Background: neutral-100 (light gray)<br>
            • Headshot: square corners<br>
            • Enhanced CTA: semibold with underline hover<br><br>
            
            <strong>1C - 360px Constrained:</strong><br>
            • Compact sizing for carousel optimization<br>
            • Circular avatar: 100px<br>
            • Hidden description for space efficiency<br><br>
            
            <strong>1D - Experimental Horizontal:</strong><br>
            • Flex row layout with larger avatar (120px)<br>
            • Enhanced CTA: primary background button<br>
            • Inline tag arrangement
          </div>
        </div>
        
        <!-- Featured Cards (2A-2B) -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Featured Founder Cards (2A-2B):</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>2A - Featured Layout:</strong><br>
            • Name: text-2xl (1.5rem) bold<br>
            • Position: text-lg enhanced<br>
            • 50% portrait split layout<br>
            • Achievement badge with icon<br><br>
            
            <strong>2B - Enhanced Variant:</strong><br>
            • Achievement box: accent-100 background<br>
            • Generation metric: absolute positioned<br>
            • Custom location format with company link<br>
            • Reduced padding for compactness<br><br>
            
            <strong>Layout Philosophy:</strong><br>
            • Premium presentation for featured content<br>
            • Enhanced typography hierarchy<br>
            • Interactive elements and hover states<br>
            • Horizontal space utilization
          </div>
        </div>
        
        <!-- Design Principles -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Design Principles & Usage:</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>Typography Hierarchy:</strong><br>
            • Standard cards: text-lg → text-sm progression<br>
            • Featured cards: text-2xl → text-lg progression<br>
            • Consistent neutral color palette<br><br>
            
            <strong>Layout Adaptation:</strong><br>
            • 1A: Grid-optimized vertical layout<br>
            • 1C: Carousel-constrained compact<br>
            • 1D: Horizontal experimental<br>
            • 2A/2B: Premium featured presentation<br><br>
            
            <strong>Interactive Elements:</strong><br>
            • Standard CTAs: text links with hover<br>
            • Enhanced CTAs: button styling<br>
            • Company links: hover underlines<br>
            • Generation metrics: contextual positioning
          </div>
        </div>
      </div>
      
      <!-- Quick Reference -->
      <div style="margin-top: 1.5rem; padding: 1rem; background: #fefce8; border-radius: 0.5rem;">
        <h6 style="margin-bottom: 0.5rem; color: #713f12;">⚡ Quick Reference for Card Selection:</h6>
        <ul style="margin: 0; font-size: 0.875rem; line-height: 1.4; color: #713f12;">
          <li><strong>1A Standard:</strong> Grid layouts, general founder displays</li>
          <li><strong>1B Variant:</strong> A/B testing alternative styling</li>
          <li><strong>1C Constrained:</strong> Carousel with height limits</li>
          <li><strong>1D Horizontal:</strong> Experimental space-efficient layout</li>
          <li><strong>2A Featured:</strong> Homepage hero sections</li>
          <li><strong>2B Enhanced:</strong> Premium featured with custom styling</li>
        </ul>
      </div>
    </div>
    
  </section>

  <!-- Section 1: founder-card.html Testing -->
  <section class="test-section">
    <h2>Section 1: founder-card.html (Standard Card) Testing</h2>
    
    <div class="card-info">
      <strong>Card:</strong> founder-card.html | <strong>Purpose:</strong> Standard founder display for grid and multi-card carousels
    </div>
    
    <!-- Grid Layout Tests -->
    <div class="test-subsection">
      <h3>Grid Layout Tests</h3>
      
      <!-- Grid Layout (3 cards) -->
      <div class="test-layout-label">Grid Layout (3 cards) - Standard Responsive</div>
      <div class="grid__container test-grid-3col">
        {% for founder in test_founders %}
          {% include components/cards/founder-card.html founder=founder %}
        {% endfor %}
      </div>
      
      <!-- Grid Layout (4 cards) -->
      <div class="test-layout-label" style="margin-top: 2rem;">Grid Layout (4 cards) - Adjusted Width</div>
      <div class="grid__container test-grid-4col">
        {% for founder in test_founders %}
          {% include components/cards/founder-card.html founder=founder %}
        {% endfor %}
      </div>
    </div>
    
    <!-- Carousel Layout Tests -->
    <div class="test-subsection">
      <h3>Carousel Layout Tests</h3>
      
      <!-- Carousel Layout (3 per slide) -->
      <div class="test-layout-label">Carousel Layout (3 per slide) - Full Width</div>
      <div class="carousel carousel--founders carousel--multi" data-component-type="founder-cards-test" style="width: 100%; height: 420px;">
        {% for founder in test_founders %}
          <div class="carousel__item carousel__item--third">
            {% include components/cards/founder-card.html founder=founder %}
          </div>
        {% endfor %}
      </div>
    </div>
  </section>

  <!-- Section 2: founder-card-featured.html Testing -->
  <section class="test-section founder-card-featured-variant-b">
    <h2>Section 2: founder-card-featured.html (Featured Card) Testing - Using 2B Style</h2>
    <div class="card-info">
      <strong>Card:</strong> founder-card-featured.html | <strong>Purpose:</strong> Featured founder with 50% portrait layout for single-card focus
      <br><strong style="color: var(--primary-600);">Note: All cards in this section use the 2B variant styling</strong>
    </div>
    
    <!-- Grid Layout Tests -->
    <div class="test-subsection">
      <h3>Grid Layout Tests</h3>
      
      <!-- Grid Layout (2 cards) -->
      <div class="test-layout-label">Grid Layout (2 cards) - Larger Cards</div>
      <div class="grid__container test-grid-2col">
        {% for founder in test_founders limit: 2 %}
          {% include components/cards/founder-card-featured.html founder=founder %}
        {% endfor %}
      </div>
      
      <!-- Grid Layout (3 cards) -->
      <div class="test-layout-label" style="margin-top: 2rem;">Grid Layout (3 cards) - Existing Layout</div>
      <div class="grid__container test-grid-3col">
        {% for founder in test_founders %}
          {% include components/cards/founder-card-featured.html founder=founder %}
        {% endfor %}
      </div>
    </div>
    
    <!-- Carousel Layout Tests -->
    <div class="test-subsection">
      <h3>Carousel Layout Tests</h3>
      
      <!-- Carousel Layout (1 per slide) -->
      <div class="test-layout-label">Carousel Layout (1 per slide) - Increased Height</div>
      <div class="carousel carousel--founders" data-component-type="founder-featured-test" style="width: 100%; height: 450px;">
        {% for founder in test_founders %}
          <div class="carousel__item">
            {% include components/cards/founder-card-featured.html founder=founder %}
          </div>
        {% endfor %}
      </div>
      
      <!-- Carousel Layout (2 per slide) -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (2 per slide) - NEW Addition</div>
      <div class="carousel carousel--founders carousel--multi" data-component-type="founder-featured-multi-test" style="width: 100%; height: 450px;">
        {% for founder in test_founders %}
          <div class="carousel__item carousel__item--half">
            {% include components/cards/founder-card-featured.html founder=founder %}
          </div>
        {% endfor %}
      </div>
      
      <!-- Carousel Layout (3 per slide) -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (3 per slide) - Full Width</div>
      <div class="carousel carousel--founders carousel--multi" data-component-type="founder-featured-triple-test" style="width: 100%; height: 450px;">
        {% for founder in test_founders %}
          <div class="carousel__item carousel__item--third">
            {% include components/cards/founder-card-featured.html founder=founder %}
          </div>
        {% endfor %}
      </div>
    </div>
  </section>

  <!-- Visual Debugging Toolkit -->
  <section class="test-section" style="background: var(--warning-50);">
    <h2>🔧 Visual Debugging Toolkit</h2>
    
    <div class="card-info" style="background: var(--warning-100); border-left-color: var(--warning-600);">
      <h3>⚠️ Debugging Tools for Layout Investigation</h3>
      <p>Use these tools to identify alignment issues and spacing problems:</p>
      
      <div style="display: flex; gap: 1rem; margin: 1rem 0; flex-wrap: wrap;">
        <button onclick="toggleDebugLayout()" class="debug-btn" style="background: #22c55e; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Layout Debug</button>
        <button onclick="toggleDebugGrid()" class="debug-btn" style="background: #3b82f6; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Grid Debug</button>
        <button onclick="toggleDebugRuler()" class="debug-btn" style="background: #f59e0b; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Ruler Debug</button>
        <button onclick="toggleDebugBoxModel()" class="debug-btn" style="background: #8b5cf6; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Box Model</button>
        <button onclick="reportDimensions()" class="debug-btn" style="background: #ef4444; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Report Measurements</button>
      </div>
      
      <div style="font-size: 0.875rem; line-height: 1.5;">
        <strong>Color Legend:</strong><br>
        🟢 <strong>Green:</strong> Working achievement element<br>
        🔴 <strong>Red:</strong> Problem location container<br>
        🔵 <strong>Blue:</strong> Flex wrapper (.location)<br>
        🟡 <strong>Yellow:</strong> Location icon<br>
        🟣 <strong>Purple:</strong> Location text content<br>
        📏 <strong>Grid:</strong> 10px measurement grid with vertical alignment guide
      </div>
    </div>
    
  </section>

</div>