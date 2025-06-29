---
layout: default
title: Brand Cards Layout Testing
permalink: /test/brand-cards-layout-testing/
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
  
  /* Override carousel for 2-per-slide in tests */
  .carousel > * {
    flex: 0 0 calc(50% - var(--space-3)) !important;
  }
  
  @media (max-width: 768px) {
    .carousel > * {
      flex: 0 0 100% !important;
    }
  }
</style>

<div class="container">
  <div class="test-header">
    <h1>Brand Cards Layout Testing</h1>
    <p>Comprehensive testing of MVP brand cards in different layout contexts</p>
  </div>

  <!-- Section 1: MVP Brand Cards Testing -->
  <section class="test-section">
    <h2>Section 1: MVP BRAND CARDS - Dual Layout Testing</h2>
    
    <!-- Get test brand data -->
    {% assign test_brand = site.brands | where: "lang", "en" | where: "ref", "ru-altai-honey" | first %}
    {% assign test_brands = site.brands | where: "lang", "en" | limit: 3 %}
    
    <!-- Subsection A: brand-card.html Performance -->
    <div class="test-subsection">
      <h3>Subsection A: brand-card.html Performance</h3>
      <div class="card-info">
        <strong>Card:</strong> brand-card.html | <strong>Lines:</strong> ~150 | <strong>Purpose:</strong> Standard brand display
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      <div class="grid__container test-grid-3col">
        {% for brand in test_brands %}
          {% include components/cards/brand-card.html brand=brand %}
        {% endfor %}
      </div>
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (2 per slide)</div>
      <div class="carousel" data-component-type="brand-cards-test">
        {% for brand in test_brands %}
          <div class="carousel-card">
            {% include components/cards/brand-card.html brand=brand %}
          </div>
        {% endfor %}
      </div>
    </div>
    
    <!-- Subsection B: brand-card-featured.html Performance -->
    <div class="test-subsection">
      <h3>Subsection B: brand-card-featured.html Performance</h3>
      <div class="card-info">
        <strong>Card:</strong> brand-card-featured.html | <strong>Lines:</strong> 116 | <strong>Purpose:</strong> Featured brand with enhanced details
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      <div class="grid__container test-grid-3col">
        {% for brand in test_brands %}
          {% include components/cards/brand-card-featured.html brand=brand %}
        {% endfor %}
      </div>
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (2 per slide)</div>
      <div class="carousel" data-component-type="brand-featured-test">
        {% for brand in test_brands %}
          <div class="carousel-card">
            {% include components/cards/brand-card-featured.html brand=brand %}
          </div>
        {% endfor %}
      </div>
    </div>
  </section>

  <!-- Section 2: Legacy Comparison -->
  <section class="test-section">
    <h2>Section 2: LEGACY COMPARISON - Elimination Candidates</h2>
    
    <!-- hero-brand-card.html -->
    <div class="test-subsection">
      <h3>hero-brand-card.html</h3>
      <div class="card-info">
        <strong>Card:</strong> hero-brand-card.html | <strong>Lines:</strong> Unknown | <strong>Usages:</strong> 46 | <strong>Purpose:</strong> Large hero display
      </div>
      <div class="hero-section">
        {% include components/cards/hero-brand-card.html brand=test_brand %}
      </div>
    </div>
    
    <!-- featured-brand-card.html -->
    <div class="test-subsection">
      <h3>featured-brand-card.html</h3>
      <div class="card-info">
        <strong>Card:</strong> featured-brand-card.html | <strong>Lines:</strong> Unknown | <strong>Usages:</strong> 41 | <strong>Purpose:</strong> Featured brand display
      </div>
      <div class="featured-brands-grid">
        <div class="featured-brands-grid__item">
          {% include components/cards/featured-brand-card.html brand=test_brand %}
        </div>
      </div>
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
            <td><strong>brand-card.html</strong></td>
            <td class="status-good">✅ Good - Clean grid display, responsive</td>
            <td class="status-good">✅ Good - Works well in carousel</td>
            <td><strong>Keep</strong> - Versatile for both layouts</td>
          </tr>
          <tr>
            <td><strong>brand-card-featured.html</strong></td>
            <td class="status-warning">⚠️ Mixed - May be too detailed for grid</td>
            <td class="status-good">✅ Good - Designed for carousel</td>
            <td><strong>Keep</strong> - Primary carousel card</td>
          </tr>
          <tr>
            <td><strong>hero-brand-card.html</strong></td>
            <td class="status-poor">❌ Poor - Too large for grid</td>
            <td class="status-poor">❌ Poor - Not carousel compatible</td>
            <td><strong>Eliminate</strong> - Limited use case</td>
          </tr>
          <tr>
            <td><strong>featured-brand-card.html</strong></td>
            <td class="status-warning">⚠️ Mixed - Similar to brand-card-featured</td>
            <td class="status-warning">⚠️ Mixed - Redundant with brand-card-featured</td>
            <td><strong>Eliminate</strong> - Duplicate functionality</td>
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
  </section>
</div>