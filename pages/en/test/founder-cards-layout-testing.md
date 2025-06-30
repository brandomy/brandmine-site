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
  
  @media (max-width: 1024px) {
    .test-grid-3col {
      grid-template-columns: repeat(2, 1fr) !important;
    }
  }
  
  @media (max-width: 640px) {
    .test-grid-3col {
      grid-template-columns: 1fr !important;
    }
  }
  
  /* Override carousel for single-card display in tests */
  .carousel .carousel__item {
    flex: 0 0 100% !important;
    max-width: 400px;
    margin: 0 auto;
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
    
    let currentSlide = 0;
    
    // Create navigation dots
    const navContainer = createNavigationDots(carousel, items.length, carouselIndex);
    const dots = navContainer.querySelectorAll('.carousel__dot');
    
    // Set initial active state
    updateActiveDot(dots, 0);
    
    // Add click handlers to dots
    dots.forEach((dot, index) => {
        dot.addEventListener('click', function() {
            console.log('Dot clicked:', index);
            goToSlide(carousel, items, dots, index);
            currentSlide = index;
        });
    });
    
    // Add scroll listener for manual scrolling
    carousel.addEventListener('scroll', function() {
        const newSlide = getCurrentSlide(carousel, items);
        if (newSlide !== currentSlide) {
            currentSlide = newSlide;
            updateActiveDot(dots, currentSlide);
        }
    });
    
    console.log('Test carousel', carouselIndex, 'initialized successfully');
}

function createNavigationDots(carousel, itemCount, carouselIndex) {
    // Look for existing navigation container
    let navContainer = carousel.parentNode.querySelector('.carousel__navigation');
    
    if (!navContainer) {
        // Create new navigation container
        navContainer = document.createElement('div');
        navContainer.className = 'carousel__navigation';
        navContainer.style.cssText = `
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 1rem;
        `;
        
        // Insert after carousel
        carousel.parentNode.insertBefore(navContainer, carousel.nextSibling);
    }
    
    // Clear existing dots
    navContainer.innerHTML = '';
    
    // Create dots
    for (let i = 0; i < itemCount; i++) {
        const dot = document.createElement('button');
        dot.className = 'carousel__dot';
        dot.setAttribute('data-slide', i);
        dot.setAttribute('aria-label', `Go to slide ${i + 1}`);
        dot.style.cssText = `
            width: 12px;
            height: 12px;
            border-radius: 50%;
            border: none;
            background: #d1d5db;
            cursor: pointer;
            transition: background-color 0.2s ease;
            margin: 0;
        `;
        
        // Active state styling
        if (i === 0) {
            dot.style.background = '#f97316'; // Orange for founders
            dot.classList.add('active');
        }
        
        navContainer.appendChild(dot);
    }
    
    console.log('Created', itemCount, 'navigation dots for carousel', carouselIndex);
    return navContainer;
}

function goToSlide(carousel, items, dots, slideIndex) {
    if (slideIndex < 0 || slideIndex >= items.length) return;
    
    // Calculate scroll position
    const item = items[slideIndex];
    const scrollLeft = item.offsetLeft - carousel.offsetLeft;
    
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
        dot.classList.toggle('active', isActive);
        dot.style.background = isActive ? '#f97316' : '#d1d5db'; // Orange for founders
    });
}

function getCurrentSlide(carousel, items) {
    const scrollLeft = carousel.scrollLeft;
    let closestIndex = 0;
    let closestDistance = Math.abs(items[0].offsetLeft - scrollLeft);
    
    for (let i = 1; i < items.length; i++) {
        const distance = Math.abs(items[i].offsetLeft - scrollLeft);
        if (distance < closestDistance) {
            closestDistance = distance;
            closestIndex = i;
        }
    }
    
    return closestIndex;
}
</script>

<div class="container">
  <div class="test-header">
    <h1>Founder Cards Layout Testing</h1>
    <p>Comprehensive testing of MVP founder cards in different layout contexts</p>
  </div>

  <!-- Section 1: MVP Founder Cards Testing -->
  <section class="test-section">
    <h2>Section 1: MVP FOUNDER CARDS - Dual Layout Testing</h2>
    
    <!-- Get test founder data -->
    {% assign test_founder = site.founders | where: "lang", "en" | where: "ref", "ru-alexei-sokolov" | first %}
    {% assign test_founders = site.founders | where: "lang", "en" | limit: 3 %}
    
    <!-- Subsection A: founder-card.html Performance -->
    <div class="test-subsection">
      <h3>Subsection A: founder-card.html Performance</h3>
      <div class="card-info">
        <strong>Card:</strong> founder-card.html | <strong>Lines:</strong> 123 | <strong>Purpose:</strong> Standard founder display
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      <div class="grid__container test-grid-3col">
        {% for founder in test_founders %}
          {% include components/cards/founder-card.html founder=founder %}
        {% endfor %}
      </div>
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (1 per slide)</div>
      <div class="carousel carousel--founders" data-component-type="founder-cards-test">
        {% for founder in test_founders %}
          <div class="carousel__item">
            {% include components/cards/founder-card.html founder=founder %}
          </div>
        {% endfor %}
      </div>
    </div>
    
    <!-- Subsection B: founder-card-featured.html Performance -->
    <div class="test-subsection">
      <h3>Subsection B: founder-card-featured.html Performance</h3>
      <div class="card-info">
        <strong>Card:</strong> founder-card-featured.html | <strong>Lines:</strong> ~200 | <strong>Purpose:</strong> Featured founder with enhanced details
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      <div class="grid__container test-grid-3col">
        {% for founder in test_founders %}
          {% include components/cards/founder-card-featured.html founder=founder %}
        {% endfor %}
      </div>
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (1 per slide)</div>
      <div class="carousel carousel--founders" data-component-type="founder-featured-test">
        {% for founder in test_founders %}
          <div class="carousel__item">
            {% include components/cards/founder-card-featured.html founder=founder %}
          </div>
        {% endfor %}
      </div>
    </div>
  </section>

  <!-- Section 1.5: Homepage Protected Card - Layout Testing -->
  <section class="test-section">
    <h2>Section 1.5: HOMEPAGE PROTECTED CARD - Layout Testing</h2>
    
    <div class="test-subsection">
      <h3>Subsection A: founder-card-featured.html Grid Performance</h3>
      <div class="card-info">
        <strong>Card:</strong> founder-card-featured.html | <strong>Lines:</strong> 108 | <strong>Purpose:</strong> Homepage focus section (50% portrait)
      </div>
      <p style="color: #059669; font-weight: bold; margin-bottom: 1rem;">
        ✓ Testing layout versatility - homepage usage remains protected
      </p>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      <div class="grid__container test-grid-3col">
        {% for founder in test_founders %}
          {% include components/cards/founder-card-featured.html founder=founder %}
        {% endfor %}
      </div>
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (1 per slide)</div>
      <div class="carousel carousel--founders" data-component-type="founder-focus-test">
        {% for founder in test_founders %}
          <div class="carousel__item">
            {% include components/cards/founder-card-featured.html founder=founder %}
          </div>
        {% endfor %}
      </div>
      
      <div style="background: #f3f4f6; padding: 1rem; margin-top: 2rem; border-radius: 0.5rem;">
        <h4>Assessment: founder-card-featured.html Layout Versatility</h4>
        <ul>
          <li><strong>Grid Performance:</strong> The 50% portrait design may create unusual spacing in grid layouts</li>
          <li><strong>Carousel Performance:</strong> Works better in carousel due to individual card focus</li>
          <li><strong>Recommendation:</strong> Keep exclusively for homepage focus section as designed</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- Section 2: Specialized Cards - Homepage Protected -->
  <section class="test-section">
    <h2>Section 2: SPECIALIZED CARDS - Homepage Protected</h2>
    
    <div class="test-subsection">
      <h3>founder-card-featured.html</h3>
      <div class="protected-notice">
        ⚠️ PROTECTED HOMEPAGE CARD - Display Only, No Testing
      </div>
      <div class="card-info">
        <strong>Card:</strong> founder-card-featured.html | <strong>Lines:</strong> 108 | <strong>Purpose:</strong> Homepage focus section (50% portrait)
      </div>
      
      <!-- Display only - no testing -->
      <div class="carousel" data-component-type="founder-focus-display">
        {% if test_founder %}
          <div class="carousel-card">
            {% include components/cards/founder-card-featured.html founder=test_founder %}
          </div>
        {% endif %}
      </div>
      <p style="text-align: center; margin-top: 1rem; color: #6b7280;">
        This card is specifically designed for the homepage founder focus section and should not be modified.
      </p>
    </div>
  </section>

  <!-- Section 3: Legacy Comparison -->
  <section class="test-section">
    <h2>Section 3: LEGACY COMPARISON - Elimination Candidates</h2>
    
    <!-- featured-founder-card.html -->
    <div class="test-subsection">
      <h3>featured-founder-card.html</h3>
      <div class="card-info">
        <strong>Card:</strong> featured-founder-card.html | <strong>Lines:</strong> 200 | <strong>Usages:</strong> 7 | <strong>Purpose:</strong> Legacy featured display
      </div>
      <div class="featured-founders-grid">
        <div class="featured-founders-grid__item">
          {% include components/cards/featured-founder-card.html founder=test_founder %}
        </div>
      </div>
    </div>
    
    <!-- founder-intense-card.html -->
    <div class="test-subsection">
      <h3>founder-intense-card.html</h3>
      <div class="card-info">
        <strong>Card:</strong> founder-intense-card.html | <strong>Lines:</strong> 82 | <strong>Purpose:</strong> Intense visual treatment
      </div>
      {% if test_founder %}
        {% include components/cards/founder-intense-card.html founder=test_founder %}
      {% endif %}
    </div>
    
    <!-- founder-quote-card.html -->
    <div class="test-subsection">
      <h3>founder-quote-card.html</h3>
      <div class="card-info">
        <strong>Card:</strong> founder-quote-card.html | <strong>Lines:</strong> 92 | <strong>Purpose:</strong> Quote-focused display
      </div>
      {% if test_founder %}
        {% include components/cards/founder-quote-card.html founder=test_founder %}
      {% endif %}
    </div>
  </section>

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