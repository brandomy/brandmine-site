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
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
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
    
    <!-- Single card comparison grid -->
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 2rem; margin-bottom: 3rem;">
      
      <!-- 1. Standard founder-card -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1. founder-card.html (Standard)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Standard founder display | <strong>Usage:</strong> Grid layouts, multi-card carousels
        </div>
        <div style="border: 2px solid #3b82f6; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_founder %}
            {% include components/cards/founder-card.html founder=comparison_founder %}
          {% endif %}
        </div>
      </div>
      
      <!-- 2. Featured founder-card -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">2. founder-card-featured.html (Featured)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Featured founder with 50% portrait | <strong>Usage:</strong> Homepage focus, single-card carousels
        </div>
        <div style="border: 2px solid #10b981; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_founder %}
            {% include components/cards/founder-card-featured.html founder=comparison_founder %}
          {% endif %}
        </div>
      </div>
      
    </div>
    
    <!-- Key Differences Summary -->
    <div style="background: #f9fafb; padding: 1.5rem; border-radius: 0.5rem; border-left: 4px solid #6366f1;">
      <h4>Key Component Differences</h4>
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-top: 1rem;">
        <div>
          <h5>founder-card.html</h5>
          <ul style="font-size: 0.875rem; color: #4b5563;">
            <li>Vertical card layout</li>
            <li>Portrait at top</li>
            <li>Standard content hierarchy</li>
            <li>Optimized for grid displays</li>
          </ul>
        </div>
        <div>
          <h5>founder-card-featured.html</h5>
          <ul style="font-size: 0.875rem; color: #4b5563;">
            <li>50% portrait + 50% content layout</li>
            <li>Revolutionary horizontal design</li>
            <li>Enhanced achievement section</li>
            <li>Optimized for single-card focus</li>
          </ul>
        </div>
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
  <section class="test-section">
    <h2>Section 2: founder-card-featured.html (Featured Card) Testing</h2>
    <div class="card-info">
      <strong>Card:</strong> founder-card-featured.html | <strong>Purpose:</strong> Featured founder with 50% portrait layout for single-card focus
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

  <!-- Section 3: Location Display Scenarios Testing -->
  <section class="test-section">
    <h2>Section 3: LOCATION DISPLAY OPTIMIZATION</h2>\n    <div class=\"card-info\">\n      <strong>Purpose:</strong> Test different location display combinations for marketing impact and user perception\n    </div>\n    \n    <div class=\"test-subsection\">\n      <h3>Location Display Scenarios</h3>\n      <p style=\"color: #6b7280; margin-bottom: 2rem;\">Testing 4 strategic location combinations for international audience recognition and space efficiency.</p>\n      \n      <!-- Scenario A: City, Country + Flag -->\n      <div class=\"test-layout-label\">Scenario A: City, Country + Flag → \"Moscow, Russia 🇷🇺\"</div>\n      <div style=\"background: #f8fafc; padding: 1rem; margin-bottom: 2rem; border-radius: 0.5rem;\">\n        <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 1rem;\">\n          <div style=\"border: 2px solid #3b82f6; padding: 1rem; background: white; border-radius: 0.5rem;\">\n            {% if comparison_founder %}\n              <!-- Mock Scenario A: Full location with flag -->\n              <div class=\"founder-focus-card\" style=\"height: 300px;\">\n                <div class=\"founder-focus-card__content\" style=\"width: 100%; padding: var(--space-4);\">\n                  <div class=\"founder-focus-card__header\">\n                    <h3 class=\"founder-focus-card__name\">{{ comparison_founder.name }}</h3>\n                    <p class=\"founder-focus-card__location\">Moscow, Russia 🇷🇺</p>\n                  </div>\n                  <div class=\"founder-focus-card__achievement\">\n                    <span class=\"founder-focus-card__achievement-label\">🏆 Key Achievement</span>\n                    <p class=\"founder-focus-card__achievement-text\">{{ comparison_founder.achievements.first }}</p>\n                  </div>\n                  <div class=\"founder-focus-card__cta\">\n                    <a href=\"#\" class=\"founder-focus-card__cta-button\">Connect with {{ comparison_founder.name }} →</a>\n                  </div>\n                </div>\n              </div>\n            {% endif %}\n          </div>\n        </div>\n        <div style=\"margin-top: 1rem; color: #374151;\">\n          <strong>Analysis:</strong> Maximum geographic context, recognizable flag, may feel cluttered for space-conscious design.\n        </div>\n      </div>\n      \n      <!-- Scenario B: City, Country (no flag) -->\n      <div class=\"test-layout-label\">Scenario B: City, Country (no flag) → \"Moscow, Russia\"</div>\n      <div style=\"background: #f0fdf4; padding: 1rem; margin-bottom: 2rem; border-radius: 0.5rem;\">\n        <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 1rem;\">\n          <div style=\"border: 2px solid #10b981; padding: 1rem; background: white; border-radius: 0.5rem;\">\n            {% if comparison_founder %}\n              <!-- Mock Scenario B: Full location without flag -->\n              <div class=\"founder-focus-card\" style=\"height: 300px;\">\n                <div class=\"founder-focus-card__content\" style=\"width: 100%; padding: var(--space-4);\">\n                  <div class=\"founder-focus-card__header\">\n                    <h3 class=\"founder-focus-card__name\">{{ comparison_founder.name }}</h3>\n                    <p class=\"founder-focus-card__location\">Moscow, Russia</p>\n                  </div>\n                  <div class=\"founder-focus-card__achievement\">\n                    <span class=\"founder-focus-card__achievement-label\">🏆 Key Achievement</span>\n                    <p class=\"founder-focus-card__achievement-text\">{{ comparison_founder.achievements.first }}</p>\n                  </div>\n                  <div class=\"founder-focus-card__cta\">\n                    <a href=\"#\" class=\"founder-focus-card__cta-button\">Connect with {{ comparison_founder.name }} →</a>\n                  </div>\n                </div>\n              </div>\n            {% endif %}\n          </div>\n        </div>\n        <div style=\"margin-top: 1rem; color: #374151;\">\n          <strong>Analysis:</strong> Clean, professional appearance, clear geographic context, avoids potential flag sensitivity.\n        </div>\n      </div>\n      \n      <!-- Scenario C: Country + Flag only -->\n      <div class=\"test-layout-label\">Scenario C: Country + Flag only → \"Russia 🇷🇺\"</div>\n      <div style=\"background: #fef3c7; padding: 1rem; margin-bottom: 2rem; border-radius: 0.5rem;\">\n        <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 1rem;\">\n          <div style=\"border: 2px solid #f59e0b; padding: 1rem; background: white; border-radius: 0.5rem;\">\n            {% if comparison_founder %}\n              <!-- Mock Scenario C: Country and flag only -->\n              <div class=\"founder-focus-card\" style=\"height: 300px;\">\n                <div class=\"founder-focus-card__content\" style=\"width: 100%; padding: var(--space-4);\">\n                  <div class=\"founder-focus-card__header\">\n                    <h3 class=\"founder-focus-card__name\">{{ comparison_founder.name }}</h3>\n                    <p class=\"founder-focus-card__location\">Russia 🇷🇺</p>\n                  </div>\n                  <div class=\"founder-focus-card__achievement\">\n                    <span class=\"founder-focus-card__achievement-label\">🏆 Key Achievement</span>\n                    <p class=\"founder-focus-card__achievement-text\">{{ comparison_founder.achievements.first }}</p>\n                  </div>\n                  <div class=\"founder-focus-card__cta\">\n                    <a href=\"#\" class=\"founder-focus-card__cta-button\">Connect with {{ comparison_founder.name }} →</a>\n                  </div>\n                </div>\n              </div>\n            {% endif %}\n          </div>\n        </div>\n        <div style=\"margin-top: 1rem; color: #374151;\">\n          <strong>Analysis:</strong> Space-efficient, immediate recognition, good for mobile, loses city-level specificity.\n        </div>\n      </div>\n      \n      <!-- Scenario D: City only -->\n      <div class=\"test-layout-label\">Scenario D: City only → \"Moscow\"</div>\n      <div style=\"background: #fdf2f8; padding: 1rem; margin-bottom: 2rem; border-radius: 0.5rem;\">\n        <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 1rem;\">\n          <div style=\"border: 2px solid #ec4899; padding: 1rem; background: white; border-radius: 0.5rem;\">\n            {% if comparison_founder %}\n              <!-- Mock Scenario D: City only -->\n              <div class=\"founder-focus-card\" style=\"height: 300px;\">\n                <div class=\"founder-focus-card__content\" style=\"width: 100%; padding: var(--space-4);\">\n                  <div class=\"founder-focus-card__header\">\n                    <h3 class=\"founder-focus-card__name\">{{ comparison_founder.name }}</h3>\n                    <p class=\"founder-focus-card__location\">Moscow</p>\n                  </div>\n                  <div class=\"founder-focus-card__achievement\">\n                    <span class=\"founder-focus-card__achievement-label\">🏆 Key Achievement</span>\n                    <p class=\"founder-focus-card__achievement-text\">{{ comparison_founder.achievements.first }}</p>\n                  </div>\n                  <div class=\"founder-focus-card__cta\">\n                    <a href=\"#\" class=\"founder-focus-card__cta-button\">Connect with {{ comparison_founder.name }} →</a>\n                  </div>\n                </div>\n              </div>\n            {% endif %}\n          </div>\n        </div>\n        <div style=\"margin-top: 1rem; color: #374151;\">\n          <strong>Analysis:</strong> Ultra-minimal, assumes audience knows geography, risk of ambiguity (Moscow, ID vs Moscow, RU).\n        </div>\n      </div>\n    </div>\n    \n    <!-- Strategic Recommendation -->\n    <div style=\"background: #1e40af; color: white; padding: 1.5rem; border-radius: 0.5rem; margin-top: 2rem;\">\n      <h4 style=\"color: white; margin-top: 0;\">Strategic Recommendation Matrix</h4>\n      <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; margin-top: 1rem;\">\n        <div>\n          <h5 style=\"color: #93c5fd;\">✅ B2B International</h5>\n          <p style=\"font-size: 0.875rem;\">Scenario B: \"Moscow, Russia\"<br>Professional, clear, avoids flag politics</p>\n        </div>\n        <div>\n          <h5 style=\"color: #93c5fd;\">✅ Consumer/Cultural</h5>\n          <p style=\"font-size: 0.875rem;\">Scenario A: \"Moscow, Russia 🇷🇺\"<br>Visual impact, cultural pride, emotional connection</p>\n        </div>\n        <div>\n          <h5 style=\"color: #93c5fd;\">✅ Mobile-First</h5>\n          <p style=\"font-size: 0.875rem;\">Scenario C: \"Russia 🇷🇺\"<br>Space-efficient, quick recognition</p>\n        </div>\n        <div>\n          <h5 style=\"color: #93c5fd;\">⚠️ High-Risk</h5>\n          <p style=\"font-size: 0.875rem;\">Scenario D: \"Moscow\"<br>Ambiguous, lacks context</p>\n        </div>\n      </div>\n    </div>\n  </section>

  <!-- Performance Matrix -->
  <section class="test-section">
    <h2>Layout Compatibility Assessment</h2>
    
    <div class="performance-matrix">
      <table>
        <thead>
          <tr>
            <th>Card</th>
            <th>Grid Performance</th>
            <th>Carousel Performance</th>
            <th>Overall Verdict</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>founder-card.html</strong></td>
            <td class="status-good">✅ Good - Clean grid display, responsive</td>
            <td class="status-good">✅ Excellent - Perfect single-card carousel display</td>
            <td><strong>Keep</strong> - Versatile for both layouts</td>
          </tr>
          <tr>
            <td><strong>founder-card-featured.html</strong></td>
            <td class="status-warning">⚠️ Mixed - May be too detailed for grid</td>
            <td class="status-good">✅ Excellent - Perfect single-card carousel display</td>
            <td><strong>Keep</strong> - Primary carousel card</td>
          </tr>
          <tr>
            <td><strong>founder-card-featured.html</strong></td>
            <td>N/A - Homepage only</td>
            <td>N/A - Homepage only</td>
            <td><strong>Protected</strong> - Homepage focus section</td>
          </tr>
          <tr>
            <td><strong>featured-founder-card.html</strong></td>
            <td class="status-warning">⚠️ Mixed - Similar to founder-card-featured</td>
            <td class="status-warning">⚠️ Mixed - Redundant functionality</td>
            <td><strong>Eliminate</strong> - Duplicate of founder-card-featured</td>
          </tr>
          <tr>
            <td><strong>founder-intense-card.html</strong></td>
            <td class="status-poor">❌ Poor - Not grid compatible</td>
            <td class="status-warning">⚠️ Mixed - Specialized layout</td>
            <td><strong>Question</strong> - Check if still needed</td>
          </tr>
          <tr>
            <td><strong>founder-quote-card.html</strong></td>
            <td class="status-warning">⚠️ Mixed - Quote focus limits use</td>
            <td class="status-warning">⚠️ Mixed - Specialized content</td>
            <td><strong>Question</strong> - Testimonial alternative?</td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <h3 style="margin-top: 2rem;">Performance Criteria</h3>
    <ul>
      <li><strong>Visual:</strong> Content hierarchy, image display, text readability, hover states</li>
      <li><strong>Technical:</strong> Responsive behavior, container fit, interaction areas, performance</li>
      <li><strong>UX:</strong> Information architecture, CTA prominence, consistency, accessibility</li>
    </ul>
    
    <h3 style="margin-top: 2rem;">Key Findings</h3>
    <ul>
      <li>✅ <strong>founder-card.html</strong> works excellently in both grid and carousel layouts</li>
      <li>✅ <strong>founder-card-featured.html</strong> perfect for single-card carousel display</li>
      <li>✅ <strong>Carousel structure</strong> properly implemented with .carousel__item wrappers</li>
      <li>✅ <strong>Single-card display</strong> achieved with proper CSS and structure</li>
      <li>❌ Legacy cards show significant overlap with MVP cards</li>
    </ul>
  </section>
</div>