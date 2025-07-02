---
layout: default
title: Insight Cards Layout Testing
permalink: /test/insight-cards-layout-testing
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
  
  /* 4-card grid variant for insight testing */
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
  .debug-layout .insight-card__date {
    background: rgba(0, 255, 0, 0.2) !important;
    border: 2px solid green !important;
    margin: 2px 0 !important;
  }
  
  .debug-layout .insight-card__category-badge {
    background: rgba(255, 0, 0, 0.2) !important;
    border: 2px solid red !important;
    margin: 2px 0 !important;
  }
  
  .debug-layout .insight-card__reading-time {
    background: rgba(0, 0, 255, 0.2) !important;
    border: 2px solid blue !important;
    margin: 1px !important;
  }
  
  .debug-layout .insight-card__author {
    background: rgba(128, 0, 128, 0.2) !important;
    border: 2px solid purple !important;
  }
  
  /* Grid overlay debugging */
  .debug-grid .insight-card {
    position: relative;
  }

  .debug-grid .insight-card::before {
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

  .debug-grid .insight-card::after {
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
  
  /* ===========================
     RESPONSIVE CARD CONSTRAINTS
     =========================== */
  
  .insight-card,
  .featured-insight-card,
  .simple-insight-card {
    max-width: 100% !important;
    width: 100% !important;
    box-sizing: border-box !important;
  }
  
  .insight-card__hero,
  .featured-insight-card__image {
    max-width: 100% !important;
    overflow: hidden !important;
  }
  
  .insight-card__hero-image,
  .featured-insight-card__img {
    max-width: 100% !important;
    height: auto !important;
    object-fit: cover !important;
  }
  
  /* Grid item constraints */
  .insight-comparison-grid > div {
    box-sizing: border-box;
  }
  
  /* Simple 2-column grid for card comparisons - matches other test pages */
  .insight-comparison-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 2rem;
    margin-bottom: 2rem;
  }
  
  /* ==========================================================================
     SECTION 0B: PRODUCTION REFERENCE STYLING
     ========================================================================== */
  
  .test-production-reference {
    margin: var(--space-6) 0;
    padding: var(--space-6);
    background: var(--primary-50);
    border: 2px solid var(--primary-200);
    border-radius: var(--radius-lg);
  }
  
  .test-production-card {
    display: flex;
    justify-content: center;
    margin: var(--space-4) 0;
    padding: var(--space-4);
    background: white;
    border-radius: var(--radius-md);
    box-shadow: var(--shadow-md);
  }
  
  .test-production-notes {
    margin-top: var(--space-4);
    padding: var(--space-3);
    background: var(--neutral-100);
    border-radius: var(--radius-md);
    font-size: var(--text-sm);
  }
  
  .test-production-notes h5 {
    margin: 0 0 var(--space-2) 0;
    color: var(--neutral-800);
    font-weight: var(--font-semibold);
  }
  
  .test-production-notes ul {
    margin: 0;
    padding-left: var(--space-4);
  }
  
  .test-production-notes li {
    margin-bottom: var(--space-1);
    color: var(--neutral-700);
  }
  
  /* ==========================================================================
     SECTION 0C: VARIANT SHOWCASE STYLING
     ========================================================================== */
  
  .test-variant-showcase {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: var(--space-6);
    margin: var(--space-6) 0;
    padding: var(--space-4);
    background: var(--neutral-50);
    border-radius: var(--radius-lg);
  }
  
  .test-variant {
    display: flex;
    flex-direction: column;
    gap: var(--space-3);
  }
  
  .test-variant h5 {
    font-size: var(--text-sm);
    font-weight: var(--font-semibold);
    color: var(--neutral-700);
    background: var(--neutral-100);
    padding: var(--space-2);
    border-radius: var(--radius-md);
    margin: 0;
    text-align: center;
  }
  
  .test-placeholder {
    background: var(--neutral-200);
    border: 2px dashed var(--neutral-400);
    border-radius: var(--radius-md);
    padding: var(--space-4);
    text-align: center;
    color: var(--neutral-600);
    font-size: var(--text-sm);
    min-height: 200px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
  
  .test-placeholder p {
    margin: var(--space-1) 0;
  }
  
  .test-placeholder .placeholder-emoji {
    font-size: 2rem;
    margin-bottom: var(--space-2);
  }
  
  /* Mini variant constraint for demonstration */
  .test-variant [variant="mini"] {
    max-width: 360px;
    margin: 0 auto;
  }
  
  /* Card system demonstration section */
  .card-system-demo {
    margin: var(--space-8) 0;
    padding: var(--space-6);
    background: var(--accent-50);
    border: 2px solid var(--accent-200);
    border-radius: var(--radius-lg);
  }
  
  .card-system-demo h4 {
    color: var(--accent-800);
    margin-bottom: var(--space-4);
    text-align: center;
  }
  
  .architecture-principles {
    background: white;
    padding: var(--space-4);
    border-radius: var(--radius-md);
    margin-top: var(--space-4);
  }
  
  .architecture-principles h5 {
    color: var(--neutral-800);
    margin-bottom: var(--space-3);
  }
  
  .architecture-principles ul {
    margin: 0;
    padding-left: var(--space-4);
  }
  
  .architecture-principles li {
    margin-bottom: var(--space-2);
    color: var(--neutral-700);
  }
  
  /* Constrain cards to their grid area */
  .insight-comparison-grid > div > div[style*="border"] {
    max-width: 100%;
    overflow: hidden;
  }
  
  /* Ensure cards respect container width */
  .insight-card,
  .featured-insight-card,
  .simple-insight-card,
  .insight-latest-card {
    max-width: 100%;
    width: 100%;
    box-sizing: border-box;
  }
  
  /* Constrain images within cards */
  .insight-card__hero-image,
  .featured-insight-card__img,
  .insight-card__image img {
    max-width: 100%;
    width: 100%;
    height: auto;
    object-fit: cover;
  }
  
  /* Mobile responsive adjustments */
  @media (max-width: 768px) {
    .insight-comparison-grid {
      grid-template-columns: 1fr;
      gap: 1rem;
    }
  }
  
  /* COMPLETE INSIGHT CARD CSS - TEMPORARY FIX */
  .insight-card {
    background-color: white;
    border-radius: 0.75rem;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.10);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    display: flex;
    flex-direction: column;
    height: auto;
    border: 1px solid #e5e7eb;
    border-left: 4px solid #e5e7eb;
    max-width: 100%;
    position: relative;
  }
  
  .insight-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.15);
  }
  
  .insight-card__hero {
    position: relative;
    aspect-ratio: 16/9;
    overflow: hidden;
    width: 100%;
  }
  
  .insight-card__hero-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
  }
  
  .insight-card__content {
    padding: 1rem;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
  }
  
  .insight-card__title {
    font-size: 1.125rem;
    font-weight: 700;
    line-height: 1.25;
    margin: 0 0 0.5rem 0;
    color: #1f2937;
  }
  
  .insight-card__title-link {
    color: inherit;
    text-decoration: none;
  }
  
  .insight-card__title-link:hover {
    color: #3b82f6;
  }
  
  .insight-card__excerpt {
    font-size: 0.875rem;
    line-height: 1.625;
    color: #6b7280;
    margin-bottom: 1rem;
    flex-grow: 1;
  }
  
  .insight-card__meta,
  .insight-card__meta-enhanced {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.75rem;
    color: #9ca3af;
    margin-bottom: 0.75rem;
  }
  
  .insight-card__date {
    font-weight: 500;
  }
  
  .insight-card__category-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.25rem;
    padding: 0.25rem 0.5rem;
    background: #dbeafe;
    color: #1e40af;
    border-radius: 0.25rem;
    font-weight: 500;
    margin-bottom: 0.5rem;
    font-size: 0.75rem;
  }
  
  .insight-card__category-overlay {
    position: absolute;
    top: 0.5rem;
    left: 0.5rem;
    background: rgba(255, 255, 255, 0.9);
    padding: 0.25rem 0.5rem;
    border-radius: 0.25rem;
    font-size: 0.75rem;
    font-weight: 500;
  }
  
  .insight-card__footer {
    margin-top: auto;
    padding-top: 0.5rem;
  }
  
  .insight-card__cta {
    display: inline-flex;
    align-items: center;
    gap: 0.25rem;
    color: #3b82f6;
    text-decoration: none;
    font-size: 0.875rem;
    font-weight: 500;
  }
  
  .insight-card__cta:hover {
    color: #1d4ed8;
  }
  
  /* ===========================
     INSIGHT CARD VARIANT TESTING - A/B Testing Styles
     =========================== */
  
  /* Insight Card Standard Variant B - 1B Testing */
  .insight-card-variant-b {
    /* Example styling variations for standard card A/B testing */
    
    .insight-card {
      border: 2px solid var(--accent-300) !important;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12) !important;
    }
    
    .insight-card__category-badge {
      background: var(--accent-100) !important;
      color: var(--accent-700) !important;
      border-radius: 0.5rem !important;
      padding: 0.375rem 0.75rem !important;
    }
    
    .insight-card__title {
      color: var(--accent-700) !important;
      font-weight: var(--font-bold) !important;
    }
    
    .insight-card__excerpt {
      font-style: italic !important;
      color: var(--neutral-600) !important;
      border-left: 3px solid var(--accent-200) !important;
      padding-left: 1rem !important;
    }
  }
  
  /* Featured Insight Card Variant B - 2B Testing */
  .featured-insight-card-variant-b {
    /* Example styling variations for featured card A/B testing */
    
    .featured-insight-card {
      background: linear-gradient(135deg, var(--neutral-50) 0%, var(--accent-50) 100%) !important;
      border: 1px solid var(--accent-200) !important;
    }
    
    .featured-insight-card__category {
      background: var(--accent-500) !important;
      color: white !important;
      border-radius: 0.75rem !important;
      padding: 0.5rem 1rem !important;
      font-weight: bold !important;
    }
    
    .featured-insight-card__title {
      color: var(--accent-800) !important;
      text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1) !important;
    }
    
    .featured-insight-card__meta {
      background: rgba(255, 255, 255, 0.8) !important;
      padding: 0.5rem !important;
      border-radius: 0.25rem !important;
    }
  }
  
  /* Simple Insight Card Variant B - 3B Testing */
  .simple-insight-card-variant-b {
    /* Example styling variations for simple card A/B testing */
    
    .insight-card {
      border-radius: 1rem !important;
      overflow: hidden !important;
      transition: all 0.3s ease !important;
    }
    
    .insight-card:hover {
      transform: translateY(-4px) !important;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15) !important;
    }
    
    .insight-card__category-badge {
      position: absolute !important;
      top: 1rem !important;
      right: 1rem !important;
      background: rgba(0, 0, 0, 0.8) !important;
      color: white !important;
      font-size: 0.75rem !important;
      padding: 0.25rem 0.5rem !important;
    }
  }
</style>

<div class="container">
  <div class="test-header">
    <h1>Insight Cards Layout Testing</h1>
    <p>Comprehensive testing of insight card components in different layout contexts</p>
  </div>

  <!-- Section 0A: Complete Insight Card Inventory -->
  <section class="test-section">
    <h2>Section 0A: CURRENT INSIGHT CARD INVENTORY (Pre-Consolidation)</h2>
    <p style="text-align: center; color: #6b7280; margin-bottom: 2rem;"><strong>Status:</strong> 5 components identified for consolidation to single file + variants</p>
    
    <!-- BEM Audit Results Summary -->
    <div style="background: #fef3c7; border: 2px solid #f59e0b; padding: 1rem; border-radius: 0.5rem; margin-bottom: 2rem;">
      <h4 style="margin-bottom: 1rem; color: #92400e;">📋 BEM Audit Results Summary</h4>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; font-size: 0.875rem;">
        <div><strong>Total Components:</strong> 6</div>
        <div><strong>BEM Violations:</strong> 2 components</div>
        <div><strong>CSS Boundaries:</strong> ✅ Clean</div>
        <div><strong>Configuration:</strong> ✅ Properly integrated</div>
      </div>
    </div>
    
    <!-- Get test insight data -->
    {% assign comparison_insight = site.insights | where: "lang", "en" | first %}
    
    <!-- Components 1-5 Grid -->
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;">
      
      <!-- 1. insight-card.html (Primary Strategic) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1. insight-card.html</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">320px × 420px</span><br>
          <strong>Purpose:</strong> Primary strategic insight display with category differentiation<br>
          <strong>BEM Status:</strong> <span style="color: #22c55e;">✅ Compliant</span>
        </div>
        <div style="border: 2px solid #3b82f6; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% include components/cards/insight-card.html insight=comparison_insight %}
            </div>
          {% endif %}
        </div>
        <!-- CSS and JS Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">CSS and JS Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/insight-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
      </div>
      
      <!-- 2. insight-card.html featured variant (Conceptual) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">2. insight-card.html featured variant</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">360px × 450px</span><br>
          <strong>Purpose:</strong> Enhanced insight-card with featured styling (conceptual variant)<br>
          <strong>BEM Status:</strong> <span style="color: #22c55e;">✅ Compliant</span> (would use insight-card--featured modifier)
        </div>
        <div style="border: 2px solid #8b5cf6; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% comment %} Note: This would be insight-card.html with variant="featured" parameter if implemented {% endcomment %}
              {% include components/cards/insight-card.html insight=comparison_insight %}
            </div>
          {% endif %}
        </div>
        <!-- CSS and JS Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">CSS and JS Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/insight-card.scss (with --featured modifier)</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
      </div>
      
      <!-- 3. featured-insight-card.html (Hero Images) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">3. featured-insight-card.html</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">380px × 480px</span><br>
          <strong>Purpose:</strong> Featured insights with hero images for homepage<br>
          <strong>BEM Status:</strong> <span style="color: #ef4444;">❌ Violation</span> (should be insight-card-featured.html)
        </div>
        <div style="border: 2px solid #10b981; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% include components/cards/featured-insight-card.html insight=comparison_insight featured=true %}
            </div>
          {% endif %}
        </div>
        <!-- CSS and JS Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">CSS and JS Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/featured-insight-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
      </div>
      
      <!-- 4. simple-insight-card.html (Streamlined) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">4. simple-insight-card.html</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">280px × 320px</span><br>
          <strong>Purpose:</strong> Streamlined display for compact listings and sidebars<br>
          <strong>BEM Status:</strong> <span style="color: #22c55e;">✅ Compliant</span>
        </div>
        <div style="border: 2px solid #f59e0b; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% include components/cards/simple-insight-card.html insight=comparison_insight %}
            </div>
          {% endif %}
        </div>
        <!-- CSS and JS Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">CSS and JS Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/simple-insight-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
      </div>
      
      <!-- 5. tagged-insight-card.html (Category Focus) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">5. tagged-insight-card.html</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">340px × 400px</span><br>
          <strong>Purpose:</strong> Category-focused display for filtered insights<br>
          <strong>BEM Status:</strong> <span style="color: #22c55e;">✅ Compliant</span>
        </div>
        <div style="border: 2px solid #a855f7; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% include components/cards/tagged-insight-card.html insight=comparison_insight %}
            </div>
          {% endif %}
        </div>
        <!-- CSS and JS Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">CSS and JS Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/tagged-insight-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
      </div>
      
    </div>
    
    <!-- Component 6: Homepage Production Style (Full Width) -->
    <div style="margin-top: 3rem;">
      <h3 style="text-align: center; margin-bottom: 2rem; color: #1f2937;">Homepage Production Display</h3>
      
      <!-- 6. Homepage Latest Insights Style (Current Production) -->
      <div style="max-width: 500px; margin: 0 auto;">
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">6. Homepage Latest Insights Style (Current Production)</h4>
        <div class="card-info" style="margin-bottom: 1rem; text-align: center;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">420px × 500px</span><br>
          <strong>Purpose:</strong> Premium homepage display with large hero images and category borders<br>
          <strong>BEM Status:</strong> <span style="color: #ef4444;">❌ Violation</span> (uses insight-latest-card.html)
        </div>
        <div style="border: 2px solid #059669; padding: 1.5rem; background: white; border-radius: 0.5rem; display: flex; justify-content: center;">
          {% if comparison_insight %}
            <div style="width: 420px;">
              {% comment %} Apply homepage styling context for accurate rendering {% endcomment %}
              <div class="home-page">
                <div class="latest-insights__container" style="display: block; width: 100%; margin: 0;">
                  {% include components/cards/insight-latest-card.html insight=comparison_insight %}
                </div>
              </div>
            </div>
          {% endif %}
        </div>
        <!-- CSS and JS Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">CSS and JS Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/insight-latest-card.scss (component styles) + assets/css/pages/home/latest-insights.scss (grid layout)</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Layout:</strong> _includes/pages/home/latest-insights.html (2x2 grid)</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Architecture:</strong> Proper CSS separation - component styles in component file, layout in page file</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Note:</strong> Card automatically selects 400w image for card-sized display (not 1200w)</p>
        </div>
      </div>
      
    </div>
    
    <!-- Component Architecture Analysis -->
    <div style="background: #eff6ff; padding: 1.5rem; border-radius: 0.5rem; border: 2px solid #3b82f6;">
      <h4 style="margin-bottom: 1rem; color: #1e40af;">🏗️ Component Architecture Analysis</h4>
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
        <div>
          <h5 style="margin-bottom: 0.5rem;">Current State (5 Components)</h5>
          <ul style="margin: 0; font-size: 0.875rem; line-height: 1.5;">
            <li><strong>insight-card.html:</strong> 11,260 bytes - Primary strategic display</li>
            <li><strong>featured-insight-card.html:</strong> 5,185 bytes - Hero images (BEM violation)</li>
            <li><strong>simple-insight-card.html:</strong> 4,966 bytes - Compact display</li>
            <li><strong>insight-latest-card.html:</strong> 4,039 bytes - Recent insights (BEM violation)</li>
            <li><strong>tagged-insight-card.html:</strong> 6,523 bytes - Category focus</li>
          </ul>
        </div>
        <div>
          <h5 style="margin-bottom: 0.5rem;">Optimization Target (2 Components)</h5>
          <ul style="margin: 0; font-size: 0.875rem; line-height: 1.5;">
            <li><strong>insight-card.html:</strong> Unified with variants for simple/latest/tagged</li>
            <li><strong>insight-card-featured.html:</strong> Hero-focused variant for featured display</li>
            <li><strong>Configuration-driven:</strong> Behavior controlled via _data/component_defaults.yml</li>
            <li><strong>Maintenance:</strong> Reduced from 5 to 2 components</li>
          </ul>
        </div>
      </div>
    </div>
    
    <!-- Target Architecture Summary -->
    <div style="background: #dcfce7; border: 2px solid #22c55e; padding: 1.5rem; border-radius: 0.5rem; margin-top: 2rem;">
      <h4 style="margin-bottom: 1rem; color: #15803d;">🎯 Target Consolidation Strategy</h4>
      <p style="margin: 0; font-size: 0.875rem; color: #166534; text-align: center;">
        <strong>Consolidate to:</strong> <code>insight-card.html</code> with variants (standard, featured, mini) + separate <code>insight-card-featured.html</code> for complex differences
      </p>
    </div>
    
  </section>
  
  <!-- Section 0B: Production Homepage Reference -->
  <section class="test-section">
    <h2>Section 0B: PRODUCTION HOMEPAGE DISPLAY (Live Reference)</h2>
    <p style="text-align: center; color: #6b7280; margin-bottom: 2rem;"><strong>Purpose:</strong> Show exactly how insight-latest-card appears on live homepage</p>
    
    <div class="test-production-reference">
      <h4 style="text-align: center; margin-bottom: 2rem; color: #1e40af;">Live Homepage: Latest Insights Section</h4>
      
      <div class="test-production-card">
        {% comment %}
        This displays the actual production card as it appears on homepage
        Using insight-latest-card.html with proper homepage context
        {% endcomment %}
        {% assign sample_insight = site.insights | where: "lang", "en" | first %}
        {% if sample_insight %}
          <div style="width: 420px;">
            <!-- Apply homepage styling context for accurate rendering -->
            <div class="home-page">
              <div class="latest-insights__container" style="display: block; width: 100%; margin: 0;">
                {% include components/cards/insight-latest-card.html insight=sample_insight %}
              </div>
            </div>
          </div>
        {% else %}
          <div class="test-placeholder">
            <div class="placeholder-emoji">🔴</div>
            <p><strong>No sample insight available for production display</strong></p>
          </div>
        {% endif %}
      </div>
      
      <div class="test-production-notes">
        <h5>Production Card Analysis</h5>
        <ul>
          <li><strong>Component:</strong> insight-latest-card.html (4,039 bytes)</li>
          <li><strong>CSS Sources:</strong> insight-latest-card.scss + latest-insights.scss (grid layout)</li>
          <li><strong>Features:</strong> Category badges, hero images, centered layout</li>
          <li><strong>Width:</strong> Natural responsive width (homepage grid)</li>
          <li><strong>Usage Context:</strong> Homepage 2x2 grid display</li>
          <li><strong>Architecture:</strong> Proper CSS separation - component styles in component file</li>
        </ul>
      </div>
    </div>
    
  </section>
  
  <!-- Section 0C: Hybrid Architecture Demonstration -->
  <section class="test-section">
    <h2>Section 0C: HYBRID ARCHITECTURE - VARIANT DEMONSTRATION</h2>
    <p style="text-align: center; color: #6b7280; margin-bottom: 2rem;"><strong>Architecture Principle:</strong> Separate files for complex differences, variants for sizing modifications</p>
    
    <div class="card-system-demo">
      <h4>Card System Comparison</h4>
      
      <!-- Brand Cards (Single File + Variants) -->
      <div style="margin-bottom: var(--space-8);">
        <h5 style="color: #1f2937; margin-bottom: var(--space-4); text-align: center;">Brand Cards (Single File + Variants)</h5>
        <div class="test-variant-showcase">
          <div class="test-variant">
            <h5>brand-card.html (standard)</h5>
            {% assign sample_brand = site.brands | where: "lang", "en" | first %}
            {% if sample_brand %}
              {% include components/cards/brand-card.html brand=sample_brand %}
            {% else %}
              <div class="test-placeholder">
                <div class="placeholder-emoji">🏢</div>
                <p><strong>Brand card display</strong></p>
                <p>Standard brand profile</p>
              </div>
            {% endif %}
          </div>
          
          <div class="test-variant">
            <h5>brand-card.html variant="featured"</h5>
            {% if sample_brand %}
              {% include components/cards/brand-card.html brand=sample_brand variant="featured" %}
            {% else %}
              <div class="test-placeholder">
                <div class="placeholder-emoji">⭐</div>
                <p><strong>Featured brand variant</strong></p>
                <p>Enhanced prominence styling</p>
              </div>
            {% endif %}
          </div>
          
          <div class="test-variant">
            <h5>brand-card.html variant="mini" (360px)</h5>
            {% if sample_brand %}
              <div style="max-width: 360px; margin: 0 auto;">
                {% include components/cards/brand-card.html brand=sample_brand variant="mini" %}
              </div>
            {% else %}
              <div class="test-placeholder" style="max-width: 360px; margin: 0 auto;">
                <div class="placeholder-emoji">📱</div>
                <p><strong>Mini brand variant</strong></p>
                <p>360px constrained for mobile</p>
              </div>
            {% endif %}
          </div>
        </div>
      </div>
      
      <!-- Founder Cards (Hybrid: Separate Files + Mini Variant) -->
      <div style="margin-bottom: var(--space-8);">
        <h5 style="color: #1f2937; margin-bottom: var(--space-4); text-align: center;">Founder Cards (Hybrid: Separate Files + Mini Variant)</h5>
        <div class="test-variant-showcase">
          <div class="test-variant">
            <h5>founder-card.html (standard)</h5>
            {% assign sample_founder = site.founders | where: "lang", "en" | first %}
            {% if sample_founder %}
              {% include components/cards/founder-card.html founder=sample_founder %}
            {% else %}
              <div class="test-placeholder">
                <div class="placeholder-emoji">👤</div>
                <p><strong>Founder card display</strong></p>
                <p>Standard biographical profile</p>
              </div>
            {% endif %}
          </div>
          
          <div class="test-variant">
            <h5>founder-card-featured.html (separate file - complex differences)</h5>
            {% if sample_founder %}
              {% include components/cards/founder-card-featured.html founder=sample_founder %}
            {% else %}
              <div class="test-placeholder">
                <div class="placeholder-emoji">🌟</div>
                <p><strong>Featured founder component</strong></p>
                <p>Separate file for complex layout differences</p>
              </div>
            {% endif %}
          </div>
          
          <div class="test-variant">
            <h5>founder-card.html variant="mini" (360px)</h5>
            {% if sample_founder %}
              <div style="max-width: 360px; margin: 0 auto;">
                {% include components/cards/founder-card.html founder=sample_founder variant="mini" %}
              </div>
            {% else %}
              <div class="test-placeholder" style="max-width: 360px; margin: 0 auto;">
                <div class="placeholder-emoji">📱</div>
                <p><strong>Mini founder variant</strong></p>
                <p>360px constrained for mobile/sidebar</p>
              </div>
            {% endif %}
          </div>
        </div>
      </div>
      
      <!-- Insight Cards (Target Architecture) -->
      <div>
        <h5 style="color: #1f2937; margin-bottom: var(--space-4); text-align: center;">Insight Cards (Target Architecture - Single File + Variants)</h5>
        <div class="test-variant-showcase">
          <div class="test-variant">
            <h5>insight-card.html (standard) - TARGET</h5>
            <div class="test-placeholder">
              <div class="placeholder-emoji">🎯</div>
              <p><strong>Target: Consolidated insight-card.html</strong></p>
              <p>Combines best elements from 5 current components</p>
            </div>
          </div>
          
          <div class="test-variant">
            <h5>insight-card.html variant="featured" - TARGET</h5>
            <div class="test-placeholder">
              <div class="placeholder-emoji">⭐</div>
              <p><strong>Target: Featured variant</strong></p>
              <p>Premium hero emphasis styling</p>
            </div>
          </div>
          
          <div class="test-variant">
            <h5>insight-card.html variant="mini" (360px) - TARGET</h5>
            <div class="test-placeholder" style="max-width: 360px; margin: 0 auto;">
              <div class="placeholder-emoji">📱</div>
              <p><strong>Target: Mini variant</strong></p>
              <p>360px constrained for mobile/sidebar use</p>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Architecture Documentation -->
      <div class="architecture-principles">
        <h5>Architecture Documentation</h5>
        
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-6); margin-top: var(--space-4);">
          <div>
            <h6 style="color: #374151; margin-bottom: var(--space-2);">Separate Files Used When:</h6>
            <ul>
              <li>Fundamentally different layouts (founder-card vs founder-card-featured)</li>
              <li>Different content structures or data requirements</li>
              <li>Complex conditional logic that would make single file unmaintainable</li>
            </ul>
          </div>
          
          <div>
            <h6 style="color: #374151; margin-bottom: var(--space-2);">Variants Used When:</h6>
            <ul>
              <li>Sizing constraints (mini variants - 360px width)</li>
              <li>Styling modifications (featured styling on same structure)</li>
              <li>Simple conditional changes (show/hide elements, spacing)</li>
            </ul>
          </div>
        </div>
        
        <div style="margin-top: var(--space-6); padding: var(--space-3); background: var(--neutral-50); border-radius: var(--radius-md);">
          <h6 style="color: #374151; margin-bottom: var(--space-2);">Universal Mini Variant Standard:</h6>
          <ul style="font-size: var(--text-sm); color: #6b7280; margin: 0;">
            <li><strong>360px Width Constraint:</strong> Mobile optimization for 375px standard mobile screens</li>
            <li><strong>Grid flexibility:</strong> Responsive layouts with optimal content readability</li>
            <li><strong>Professional consistency:</strong> Maintained across all card types</li>
          </ul>
        </div>
      </div>
    </div>
    
  </section>

  <!-- Section 1: Main Insight Cards Testing -->
  <section class="test-section">
    <h2>Section 1: MAIN INSIGHT CARDS - Layout Testing</h2>
    
    <!-- Get test insight data -->
    {% assign test_insights = site.insights | where: "lang", "en" | limit: 3 %}
    
    <!-- Data Debug -->
    <div class="card-info">
      <strong>Debug:</strong> Found {{ test_insights.size }} English insights for testing
      {% if test_insights.size > 0 %}(First: {{ test_insights[0].title }}){% endif %}
    </div>
    
    <!-- insight-card.html -->
    <div class="test-subsection">
      <h3>insight-card.html (Strategic)</h3>
      <div class="card-info">
        <strong>Card:</strong> insight-card.html | <strong>Purpose:</strong> Strategic insight display with category differentiation and metadata
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      {% if test_insights.size > 0 %}
        <div class="grid test-grid-3col">
          {% for insight in test_insights %}
            <div class="grid__item">
              {% include components/cards/insight-card.html insight=insight %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English insight data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- 4-Card Grid Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">4-Card Grid Layout</div>
      {% if test_insights.size > 0 %}
        {% assign test_insights_4 = site.insights | where: "lang", "en" | limit: 4 %}
        <div class="grid test-grid-4col">
          {% for insight in test_insights_4 %}
            <div class="grid__item">
              {% include components/cards/insight-card.html insight=insight %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English insight data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (2 per slide)</div>
      {% if test_insights.size > 0 %}
        <div class="carousel" data-component-type="insight-cards-test">
          {% for insight in test_insights %}
            <div class="carousel-card">
              {% include components/cards/insight-card.html insight=insight %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English insight data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Styling Evaluation Framework -->
      <div class="styling-assessment" style="margin-top: 2rem; padding: 1.5rem; background: var(--neutral-50); border-radius: 0.5rem;">
        <h4>Styling Evaluation: insight-card.html (Strategic)</h4>
        <div class="assessment-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem;">
          <div class="criteria">
            <strong>Visual Appeal:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Information Clarity:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Category Differentiation:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Insights Page Suitability:</strong> ⭐⭐⭐⭐⭐
          </div>
          <div class="notes">
            <strong>Styling Notes:</strong> Rich category-based styling with strategic CTAs<br>
            <strong>Potential Issues:</strong> High information density<br>
            <strong>Recommendation:</strong> ✅ Primary choice for main insights grid
          </div>
        </div>
      </div>
    </div>
    
    <!-- featured-insight-card.html -->
    <div class="test-subsection">
      <h3>featured-insight-card.html (Featured)</h3>
      <div class="card-info">
        <strong>Card:</strong> featured-insight-card.html | <strong>Purpose:</strong> Featured insights with hero images and enhanced styling
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      {% if test_insights.size > 0 %}
        <div class="grid test-grid-3col">
          {% for insight in test_insights %}
            <div class="grid__item">
              {% include components/cards/featured-insight-card.html insight=insight featured=true %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English insight data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Carousel Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Carousel Layout (2 per slide)</div>
      {% if test_insights.size > 0 %}
        <div class="carousel" data-component-type="insight-featured-test">
          {% for insight in test_insights %}
            <div class="carousel-card">
              {% include components/cards/featured-insight-card.html insight=insight featured=true %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English insight data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Styling Evaluation Framework -->
      <div class="styling-assessment" style="margin-top: 2rem; padding: 1.5rem; background: var(--neutral-50); border-radius: 0.5rem;">
        <h4>Styling Evaluation: featured-insight-card.html (Featured)</h4>
        <div class="assessment-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem;">
          <div class="criteria">
            <strong>Visual Appeal:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Information Clarity:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Hero Image Impact:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Homepage Suitability:</strong> ⭐⭐⭐⭐⭐
          </div>
          <div class="notes">
            <strong>Styling Notes:</strong> Excellent hero image presentation with clean metadata<br>
            <strong>Potential Issues:</strong> May be less suitable for dense grids<br>
            <strong>Recommendation:</strong> ✅ Perfect for featured sections and carousels
          </div>
        </div>
      </div>
    </div>
    
    <!-- simple-insight-card.html -->
    <div class="test-subsection">
      <h3>simple-insight-card.html (Streamlined)</h3>
      <div class="card-info">
        <strong>Card:</strong> simple-insight-card.html | <strong>Purpose:</strong> Streamlined insight display for compact listings
      </div>
      
      <!-- Grid Layout Test -->
      <div class="test-layout-label">Grid Layout (3 cards)</div>
      {% if test_insights.size > 0 %}
        <div class="grid test-grid-3col">
          {% for insight in test_insights %}
            <div class="grid__item">
              {% include components/cards/simple-insight-card.html insight=insight %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English insight data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- Styling Evaluation Framework -->
      <div class="styling-assessment" style="margin-top: 2rem; padding: 1.5rem; background: var(--neutral-50); border-radius: 0.5rem;">
        <h4>Styling Evaluation: simple-insight-card.html (Streamlined)</h4>
        <div class="assessment-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem;">
          <div class="criteria">
            <strong>Visual Appeal:</strong> ⭐⭐⭐⭐⚪<br>
            <strong>Information Clarity:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Compact Efficiency:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Sidebar Suitability:</strong> ⭐⭐⭐⭐⭐
          </div>
          <div class="notes">
            <strong>Styling Notes:</strong> Clean, minimal design optimized for space efficiency<br>
            <strong>Potential Issues:</strong> Limited visual impact compared to featured cards<br>
            <strong>Recommendation:</strong> ✅ Ideal for sidebar lists and compact displays
          </div>
        </div>
      </div>
    </div>
    
  </section>

  <!-- Section 2: Insight Card Architecture Analysis -->
  <section class="test-section">
    <h2>Section 2: INSIGHT CARD ARCHITECTURE ANALYSIS</h2>
    
    <div class="performance-matrix">
      <h3>Component Architecture Comparison</h3>
      <table>
        <thead>
          <tr>
            <th>Component</th>
            <th>Primary Use Case</th>
            <th>Key Features</th>
            <th>Layout Flexibility</th>
            <th>Performance</th>
            <th>Maintenance</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>insight-card.html</strong></td>
            <td>Main insights grid</td>
            <td>Category badges, strategic CTAs, metadata</td>
            <td><span class="status-good">✅ Excellent</span></td>
            <td><span class="status-good">✅ Good</span></td>
            <td><span class="status-good">✅ Active</span></td>
          </tr>
          <tr>
            <td><strong>featured-insight-card.html</strong></td>
            <td>Homepage featured</td>
            <td>Hero images, enhanced styling</td>
            <td><span class="status-good">✅ Good</span></td>
            <td><span class="status-warning">⚠️ Moderate</span></td>
            <td><span class="status-good">✅ Active</span></td>
          </tr>
          <tr>
            <td><strong>simple-insight-card.html</strong></td>
            <td>Compact listings</td>
            <td>Minimal metadata, space efficient</td>
            <td><span class="status-good">✅ Excellent</span></td>
            <td><span class="status-good">✅ Excellent</span></td>
            <td><span class="status-good">✅ Active</span></td>
          </tr>
          <tr>
            <td><strong>insight-latest-card.html</strong></td>
            <td>Recent insights</td>
            <td>Time-focused, minimal design</td>
            <td><span class="status-warning">⚠️ Limited</span></td>
            <td><span class="status-good">✅ Good</span></td>
            <td><span class="status-warning">⚠️ Needs review</span></td>
          </tr>
          <tr>
            <td><strong>tagged-insight-card.html</strong></td>
            <td>Category filtering</td>
            <td>Tag emphasis, category focus</td>
            <td><span class="status-warning">⚠️ Limited</span></td>
            <td><span class="status-good">✅ Good</span></td>
            <td><span class="status-warning">⚠️ Needs review</span></td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <div class="card-info" style="background: var(--primary-50); border-left-color: var(--primary-500); margin-top: 2rem;">
      <h3>🏗️ Architecture Recommendations</h3>
      <ul style="margin: 1rem 0;">
        <li><strong>Primary Usage:</strong> insight-card.html for main grids, featured-insight-card.html for hero sections</li>
        <li><strong>Consolidation Opportunity:</strong> Consider merging insight-latest-card and tagged-insight-card with insight-card variants</li>
        <li><strong>Performance:</strong> All cards show good performance; featured cards slightly heavier due to images</li>
        <li><strong>Maintenance:</strong> Three core cards (insight, featured, simple) are well-maintained and sufficient</li>
      </ul>
    </div>
    
  </section>

  <!-- Section 3: Quick Reference -->
  <section class="test-section">
    <h2>Section 3: QUICK REFERENCE</h2>
    
    <div class="card-info" style="background: var(--primary-50); border-left-color: var(--primary-500);">
      <h3>📋 Insight Card Usage Guidelines</h3>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1rem; margin-top: 1rem;">
        <div>
          <h4>Main Insights Page</h4>
          <p><strong>Use:</strong> insight-card.html<br>
          <strong>Layout:</strong> 3-column grid<br>
          <strong>Features:</strong> Full metadata, category badges</p>
        </div>
        <div>
          <h4>Homepage Featured</h4>
          <p><strong>Use:</strong> featured-insight-card.html<br>
          <strong>Layout:</strong> Carousel or 2-column<br>
          <strong>Features:</strong> Hero images, enhanced styling</p>
        </div>
        <div>
          <h4>Sidebar Lists</h4>
          <p><strong>Use:</strong> simple-insight-card.html<br>
          <strong>Layout:</strong> Single column<br>
          <strong>Features:</strong> Minimal, space-efficient</p>
        </div>
      </div>
    </div>
    
  </section>

  <!-- Visual Debugging Toolkit -->
  <section class="test-section" style="background: var(--warning-50);">
    <h2>🔧 Visual Debugging Toolkit</h2>
    
    <div class="card-info" style="background: var(--warning-100); border-left-color: var(--warning-600);">
      <h3>⚠️ Debugging Tools for Layout Investigation</h3>
      <p>Use these tools to identify insight card styling and spacing issues:</p>
      
      <div style="display: flex; gap: 1rem; margin: 1rem 0; flex-wrap: wrap;">
        <button onclick="toggleDebugLayout()" class="debug-btn" style="background: #22c55e; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Layout Debug</button>
        <button onclick="toggleDebugGrid()" class="debug-btn" style="background: #3b82f6; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Grid Debug</button>
        <button onclick="toggleDebugBoxModel()" class="debug-btn" style="background: #8b5cf6; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Box Model</button>
        <button onclick="reportInsightDimensions()" class="debug-btn" style="background: #ef4444; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Report Measurements</button>
      </div>
      
      <div style="font-size: 0.875rem; line-height: 1.5;">
        <strong>Color Legend:</strong><br>
        🟢 <strong>Green:</strong> Date elements<br>
        🔴 <strong>Red:</strong> Category badges<br>
        🔵 <strong>Blue:</strong> Reading time indicators<br>
        🟣 <strong>Purple:</strong> Author information<br>
        📏 <strong>Grid:</strong> 10px measurement grid with alignment guides
      </div>
    </div>
    
  </section>

</div>

<script>
// Visual Debugging Toolkit JavaScript
let debugState = {
  layout: false,
  grid: false,
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

function toggleDebugBoxModel() {
  debugState.boxModel = !debugState.boxModel;
  document.body.classList.toggle('debug-box-model', debugState.boxModel);
  console.log('Box model debug:', debugState.boxModel ? 'ON' : 'OFF');
}

// Element dimension reporting for insights
function reportInsightDimensions() {
  const categoryBadge = document.querySelector('.insight-card__category-badge');
  const readingTime = document.querySelector('.insight-card__reading-time');
  const author = document.querySelector('.insight-card__author');
  const date = document.querySelector('.insight-card__date');
  
  console.group('🔍 Insight Card Dimension Report');
  
  if (categoryBadge) {
    const badgeRect = categoryBadge.getBoundingClientRect();
    const badgeStyles = window.getComputedStyle(categoryBadge);
    console.log('🔴 Category Badge:', {
      offsetLeft: categoryBadge.offsetLeft,
      offsetTop: categoryBadge.offsetTop,
      clientWidth: categoryBadge.clientWidth,
      clientHeight: categoryBadge.clientHeight,
      boundingRect: badgeRect,
      textAlign: badgeStyles.textAlign,
      padding: badgeStyles.padding
    });
  }
  
  if (readingTime) {
    const timeRect = readingTime.getBoundingClientRect();
    const timeStyles = window.getComputedStyle(readingTime);
    console.log('🔵 Reading Time:', {
      offsetLeft: readingTime.offsetLeft,
      offsetTop: readingTime.offsetTop,
      clientWidth: readingTime.clientWidth,
      clientHeight: readingTime.clientHeight,
      boundingRect: timeRect,
      textContent: readingTime.textContent
    });
  }
  
  if (author) {
    const authorRect = author.getBoundingClientRect();
    console.log('🟣 Author:', {
      offsetLeft: author.offsetLeft,
      offsetTop: author.offsetTop,
      clientWidth: author.clientWidth,
      clientHeight: author.clientHeight,
      boundingRect: authorRect,
      textContent: author.textContent
    });
  }
  
  if (date) {
    const dateRect = date.getBoundingClientRect();
    console.log('🟢 Date:', {
      offsetLeft: date.offsetLeft,
      offsetTop: date.offsetTop,
      clientWidth: date.clientWidth,
      clientHeight: date.clientHeight,
      boundingRect: dateRect,
      textContent: date.textContent
    });
  }
  
  console.groupEnd();
  
  // Also show alert for quick reference
  alert(`Debug measurements logged to console. Check browser dev tools for detailed analysis.`);
}

// Initialize debugging tools
document.addEventListener('DOMContentLoaded', function() {
  console.log('🔧 Insight Cards Visual Debugging Toolkit loaded. Use the debug buttons above to analyze layout issues.');
});
</script>