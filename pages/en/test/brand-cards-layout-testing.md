---
layout: default
title: Brand Cards Layout Testing
permalink: /test/brand-cards-layout-testing
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
  
  /* Override grid for 3-column layout in tests */
  .test-grid-3col {
    display: grid !important;
    grid-template-columns: repeat(3, 1fr) !important;
    gap: var(--space-4) !important;
    max-width: 100%;
    overflow-x: auto;
  }
  
  .test-grid-3col .grid__item {
    min-width: 280px;
    max-width: 380px;
  }
  
  /* 4-card grid variant for brand testing */
  .test-grid-4col {
    display: grid !important;
    grid-template-columns: repeat(4, 1fr) !important;
    gap: var(--space-3) !important;
    max-width: 100%;
    overflow-x: auto;
  }
  
  .test-grid-4col .grid__item {
    min-width: 250px;
    max-width: 320px;
  }
  
  /* VISUAL DEBUGGING TOOLKIT - Isolated to test page only */
  
  /* Color-coded element debugging */
  .debug-layout .brand-card__founding-year {
    background: rgba(0, 255, 0, 0.2) !important;
    border: 2px solid green !important;
    margin: 2px 0 !important;
  }
  
  .debug-layout .brand-card__location {
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
  .debug-grid .brand-card {
    position: relative;
  }

  .debug-grid .brand-card::before {
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

  .debug-grid .brand-card::after {
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
  .debug-ruler .brand-card__founding-year::before,
  .debug-ruler .brand-card__location::before {
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
  
  @media (max-width: 1200px) {
    .test-grid-4col {
      grid-template-columns: repeat(3, 1fr) !important;
    }
  }
  
  @media (max-width: 900px) {
    .test-grid-4col {
      grid-template-columns: repeat(2, 1fr) !important;
    }
  }
  
  @media (max-width: 640px) {
    .test-grid-4col {
      grid-template-columns: 1fr !important;
    }
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
  
  /* Override carousel for 2-per-slide in tests */
  .carousel .carousel__item,
  .carousel .carousel-card {
    flex: 0 0 calc(50% - var(--space-3)) !important;
  }
  
  @media (max-width: 768px) {
    .carousel .carousel__item,
    .carousel .carousel-card {
      flex: 0 0 100% !important;
    }
  }
</style>

<div class="container">
  <div class="test-header">
    <h1>Brand Cards Layout Testing</h1>
    <p>Comprehensive testing of MVP brand cards in different layout contexts</p>
  </div>

  <!-- Section 0: Single Card Comparison -->
  <section class="test-section">
    <h2>Section 0: SINGLE CARD COMPARISON</h2>
    <p>Side-by-side comparison of all brand card variants using the same brand data</p>
    
    {% assign comparison_brand = site.brands | where: "lang", "en" | first %}
    
    {% if comparison_brand %}
      <div class="card-info">
        <strong>Test Brand:</strong> {{ comparison_brand.title }} | 
        <strong>Ref:</strong> {{ comparison_brand.ref }} |
        <strong>Data Available:</strong> ✅
      </div>
      
      
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin: 2rem 0;">
        
        <!-- 1. Standard brand-card -->
        <div>
          <h4>1. brand-card.html (Standard)</h4>
          <div style="border: 2px solid #007bff; padding: 1rem; background: white;">
            {% include components/cards/brand-card.html brand=comparison_brand %}
          </div>
        </div>
        
        <!-- 2. Featured variant of brand-card -->
        <div>
          <h4>2. brand-card.html (Featured Variant)</h4>
          <div style="border: 2px solid #28a745; padding: 1rem; background: white;">
            {% include components/cards/brand-card.html brand=comparison_brand variant="featured" %}
          </div>
        </div>
        
      </div>
    {% else %}
      <div class="card-info" style="background: var(--warning-50);">
        <strong>⚠️ No brand data available for comparison</strong>
      </div>
    {% endif %}
  </section>

  <!-- Section 1: MVP Brand Cards Testing -->
  <section class="test-section">
    <h2>Section 1: MVP BRAND CARDS - Dual Layout Testing</h2>
    
    <!-- Get test brand data -->
    {% assign test_brand = site.brands | where: "lang", "en" | where: "ref", "ru-altai-honey" | first %}
    {% assign test_brands = site.brands | where: "lang", "en" | limit: 3 %}
    
    <!-- Data Debug -->
    <div class="card-info">
      <strong>Debug:</strong> Found {{ test_brands.size }} English brands for testing
      {% if test_brands.size > 0 %}(First: {{ test_brands[0].title }}){% endif %}
    </div>
    
    <!-- brand-card.html -->
    <div class="test-subsection">
      <h3>brand-card.html (Standard)</h3>
      <div class="card-info">
        <strong>Card:</strong> brand-card.html | <strong>Purpose:</strong> Standard brand display with logo, description, and tags
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      {% if test_brands.size > 0 %}
        <div class="grid test-grid-3col">
          {% for brand in test_brands %}
            <div class="grid__item">
              {% include components/cards/brand-card.html brand=brand %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English brand data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- 4-Card Grid Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">4-Card Grid Layout</div>
      {% if test_brands.size > 0 %}
        {% assign test_brands_4 = site.brands | where: "lang", "en" | limit: 4 %}
        <div class="grid test-grid-4col">
          {% for brand in test_brands_4 %}
            <div class="grid__item">
              {% include components/cards/brand-card.html brand=brand %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English brand data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (2 per slide)</div>
      {% if test_brands.size > 0 %}
        <div class="carousel" data-component-type="brand-cards-test">
          {% for brand in test_brands %}
            <div class="carousel-card">
              {% include components/cards/brand-card.html brand=brand %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English brand data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Styling Evaluation Framework -->
      <div class="styling-assessment" style="margin-top: 2rem; padding: 1.5rem; background: var(--neutral-50); border-radius: 0.5rem;">
        <h4>Styling Evaluation: brand-card.html (Standard)</h4>
        <div class="assessment-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem;">
          <div class="criteria">
            <strong>Visual Appeal:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Information Clarity:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Professional Appearance:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Brands Page Suitability:</strong> ⭐⭐⭐⭐⭐
          </div>
          <div class="notes">
            <strong>Styling Notes:</strong> Clean, minimal design with excellent hierarchy<br>
            <strong>Potential Issues:</strong> None identified<br>
            <strong>Recommendation:</strong> ✅ Primary choice for brand grids
          </div>
        </div>
      </div>
    </div>
    
    <!-- brand-card.html (Featured Variant) -->
    <div class="test-subsection">
      <h3>brand-card.html (Featured Variant)</h3>
      <div class="card-info">
        <strong>Card:</strong> brand-card.html with variant="featured" | <strong>Purpose:</strong> Enhanced brand display with hero image
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      {% if test_brands.size > 0 %}
        <div class="grid test-grid-3col">
          {% for brand in test_brands %}
            <div class="grid__item">
              {% include components/cards/brand-card.html brand=brand variant="featured" %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English brand data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (2 per slide)</div>
      {% if test_brands.size > 0 %}
        <div class="carousel" data-component-type="brand-featured-test">
          {% for brand in test_brands %}
            <div class="carousel-card">
              {% include components/cards/brand-card.html brand=brand variant="featured" %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English brand data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Styling Evaluation Framework -->
      <div class="styling-assessment" style="margin-top: 2rem; padding: 1.5rem; background: var(--neutral-50); border-radius: 0.5rem;">
        <h4>Styling Evaluation: brand-card.html (Featured Variant)</h4>
        <div class="assessment-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem;">
          <div class="criteria">
            <strong>Visual Appeal:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Information Clarity:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Professional Appearance:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Brands Page Suitability:</strong> ⭐⭐⭐⭐⭐
          </div>
          <div class="notes">
            <strong>Styling Notes:</strong> Premium layout with hero images and comprehensive tags<br>
            <strong>Potential Issues:</strong> May be too detailed for dense grids<br>
            <strong>Recommendation:</strong> ✅ Excellent for carousels and featured sections
          </div>
        </div>
      </div>
    </div>
    
  </section>


  <!-- Section 3: Quick Reference -->
  <section class="test-section">
    <h2>Section 3: QUICK REFERENCE</h2>
    
    <div class="card-info" style="background: var(--primary-50); border-left-color: var(--primary-500);">
      <h3>📋 Complete Technical Documentation</h3>
      <p>For comprehensive component dependencies, configuration guides, and deployment references, see:</p>
      <p><strong><a href="/test/brand-cards-dependencies/">Brand Cards Dependencies Reference</a></strong></p>
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
        🟢 <strong>Green:</strong> Working "Founded" element<br>
        🔴 <strong>Red:</strong> Problem location container<br>
        🔵 <strong>Blue:</strong> Flex wrapper (.location)<br>
        🟡 <strong>Yellow:</strong> Location icon<br>
        🟣 <strong>Purple:</strong> Location text content<br>
        📏 <strong>Grid:</strong> 10px measurement grid with vertical alignment guide
      </div>
    </div>
    
  </section>

</div>

<script>
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
  const founding = document.querySelector('.brand-card__founding-year');
  const location = document.querySelector('.brand-card__location');
  const locationText = document.querySelector('.location__text');
  const locationIcon = document.querySelector('.location__icon');
  
  console.group('🔍 Element Dimension Report');
  
  if (founding) {
    const foundingRect = founding.getBoundingClientRect();
    const foundingStyles = window.getComputedStyle(founding);
    console.log('✅ Founded Element:', {
      offsetLeft: founding.offsetLeft,
      offsetTop: founding.offsetTop,
      clientWidth: founding.clientWidth,
      clientHeight: founding.clientHeight,
      boundingRect: foundingRect,
      marginLeft: foundingStyles.marginLeft,
      paddingLeft: foundingStyles.paddingLeft,
      textAlign: foundingStyles.textAlign,
      textIndent: foundingStyles.textIndent
    });
  }
  
  if (location) {
    const locationRect = location.getBoundingClientRect();
    const locationStyles = window.getComputedStyle(location);
    console.log('🔴 Location Container:', {
      offsetLeft: location.offsetLeft,
      offsetTop: location.offsetTop,
      clientWidth: location.clientWidth,
      clientHeight: location.clientHeight,
      boundingRect: locationRect,
      marginLeft: locationStyles.marginLeft,
      paddingLeft: locationStyles.paddingLeft,
      textAlign: locationStyles.textAlign,
      textIndent: locationStyles.textIndent
    });
  }
  
  if (locationText) {
    const textRect = locationText.getBoundingClientRect();
    const textStyles = window.getComputedStyle(locationText);
    console.log('🟣 Location Text:', {
      offsetLeft: locationText.offsetLeft,
      offsetTop: locationText.offsetTop,
      clientWidth: locationText.clientWidth,
      clientHeight: locationText.clientHeight,
      boundingRect: textRect,
      textContent: locationText.textContent,
      marginLeft: textStyles.marginLeft,
      paddingLeft: textStyles.paddingLeft
    });
  }
  
  if (locationIcon) {
    const iconRect = locationIcon.getBoundingClientRect();
    const iconStyles = window.getComputedStyle(locationIcon);
    console.log('🟡 Location Icon:', {
      offsetLeft: locationIcon.offsetLeft,
      offsetTop: locationIcon.offsetTop,
      clientWidth: locationIcon.clientWidth,
      clientHeight: locationIcon.clientHeight,
      boundingRect: iconRect,
      display: iconStyles.display,
      visibility: iconStyles.visibility
    });
  }
  
  // Calculate alignment difference
  if (founding && location) {
    const foundingLeft = founding.getBoundingClientRect().left;
    const locationLeft = location.getBoundingClientRect().left;
    const difference = locationLeft - foundingLeft;
    
    console.log('📏 Alignment Analysis:', {
      foundingLeft: foundingLeft,
      locationLeft: locationLeft,
      difference: difference,
      alignment: difference === 0 ? '✅ PERFECT' : `❌ ${difference}px offset`
    });
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