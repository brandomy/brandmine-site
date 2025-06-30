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

</div>