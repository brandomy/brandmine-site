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
  
  /* ===========================
     BRAND CARD VARIANT TESTING - A/B Testing Styles
     =========================== */
  
  /* Brand Card Standard Variant B - 1B Testing */
  .brand-card-variant-b {
    /* Example styling variations for standard card A/B testing */
    
    .brand-card {
      border: 2px solid var(--primary-300) !important;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
    }
    
    .brand-card__header {
      background: var(--primary-50) !important;
      padding: var(--space-3) !important;
    }
    
    .brand-card__title {
      color: var(--primary-700) !important;
      font-weight: var(--font-bold) !important;
    }
  }
  
  /* Brand Card Featured Variant A - 2A Testing */
  .brand-card-featured-variant-a {
    /* Version 2A uses production CSS - no overrides needed */
    /* All 2A improvements would be applied to the base component CSS */
  }
  
  /* Brand Card Featured Variant B - 2B Testing */
  .brand-card-featured-variant-b {
    /* Example styling variations for featured card A/B testing */
    
    .brand-card {
      background: linear-gradient(135deg, var(--neutral-50) 0%, var(--neutral-100) 100%) !important;
      border: 1px solid var(--accent-200) !important;
    }
    
    .brand-card__founding-year {
      background: var(--accent-100) !important;
      color: var(--accent-700) !important;
      border-radius: 0.25rem !important;
      padding: 0.25rem 0.5rem !important;
    }
    
    .brand-card__description {
      font-style: italic !important;
      color: var(--neutral-600) !important;
    }
    
    .brand-card__tags {
      margin-top: var(--space-3) !important;
    }
    
    .brand-card__tag {
      background: var(--accent-50) !important;
      border: 1px solid var(--accent-200) !important;
      color: var(--accent-700) !important;
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
    <h2>Section 0: SINGLE CARD TYPE COMPARISON</h2>
    <p style="text-align: center; color: #6b7280; margin-bottom: 2rem;">Side-by-side comparison of brand card components using identical data</p>
    
    <!-- Single card comparison grid - organized in rows -->
    <div style="margin-bottom: 3rem;">
      
      <!-- Get test brand data -->
      {% assign comparison_brand = site.brands | where: "lang", "en" | first %}
      
      <!-- Row 1: 1A and 1B -->
      <div class="founder-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 2rem;">
      
      <!-- 1A. Standard brand-card (Version A) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1A. brand-card.html (Version A)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Standard brand display - Current design | <strong>Usage:</strong> Grid layouts<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">362×440px</span>
        </div>
        <div style="border: 2px solid #3b82f6; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_brand %}
            {% include components/cards/brand-card.html brand=comparison_brand %}
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Brand Name:</strong><br>
              • Font: <code>var(--text-xl)</code> (1.25rem)<br>
              • Weight: <code>var(--font-bold)</code> (700)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.2<br><br>
              
              <strong style="color: #1f2937;">Description:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-700)</code> (#374151)<br>
              • Line Height: 1.5<br><br>
              
              <strong style="color: #1f2937;">Location/Founded:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code> (#4B5563)<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Dimension Tags:</strong><br>
              • <span style="background: var(--sky-100); color: var(--sky-800); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Markets</span> Sky Blue<br>
              • <span style="background: var(--olive-100); color: var(--olive-800); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Sectors</span> Olive Green<br>
              • <span style="background: var(--secondary-100); color: var(--secondary-800); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Attributes</span> Orange<br>
              • <span style="background: var(--accent-100); color: var(--accent-800); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Signals</span> Indigo<br><br>
              
              <strong style="color: #1f2937;">CTA Elements:</strong><br>
              • Visit Brand: <code>var(--primary-600)</code> link<br>
              • Learn More: <code>var(--primary-600)</code> link<br>
              • Hover: <code>var(--primary-500)</code><br><br>
              
              <strong style="color: #1f2937;">Layout Features:</strong><br>
              • Mobile-first: 345px → 360px responsive<br>
              • Logo display with aspect ratio<br>
              • Hierarchical information structure
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1B. Standard brand-card (Version B) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1B. brand-card.html (Version B)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> A/B test variant - Style variations | <strong>Usage:</strong> Testing alternative designs<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">362×622px</span>
        </div>
        <div style="border: 2px solid #8b5cf6; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_brand %}
            <div class="brand-card-variant-b">
              {% include components/cards/brand-card.html brand=comparison_brand %}
            </div>
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Brand Name (Enhanced):</strong><br>
              • Font: <code>var(--text-xl)</code> (1.25rem)<br>
              • Weight: <code>var(--font-bold)</code> (700)<br>
              • Color: <code>var(--primary-700)</code> (enhanced)<br>
              • Line Height: 1.2<br><br>
              
              <strong style="color: #1f2937;">Description:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-700)</code> (#374151)<br>
              • Line Height: 1.5<br><br>
              
              <strong style="color: #1f2937;">Location/Founded:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code> (#4B5563)<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Variant B Enhancements:</strong><br>
              • Card border: 2px solid <code>var(--primary-300)</code><br>
              • Box shadow: enhanced (0 4px 12px)<br>
              • Header background: <code>var(--primary-50)</code><br>
              • Header padding: <code>var(--space-3)</code><br><br>
              
              <strong style="color: #1f2937;">Visual Differences:</strong><br>
              • More prominent primary color usage<br>
              • Enhanced visual hierarchy<br>
              • Stronger border and shadow styling<br>
              • Header section highlighting<br><br>
              
              <strong style="color: #1f2937;">A/B Testing Focus:</strong><br>
              • Testing enhanced primary color integration<br>
              • Evaluating header section prominence<br>
              • Measuring engagement with stronger styling
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
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/brand-card.scss</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          </div>
          <div>
            <h5 style="margin-bottom: 0.5rem;">1B Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> brand-cards-layout-testing.md (test overrides)</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          </div>
        </div>
      </div>
      
      <!-- Row 2: 2A and 2B -->
      <div class="founder-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 2rem;">
      
      <!-- 2A. Featured brand-card (Version A) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">2A. brand-card.html variant="featured" (Version A)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Featured brand with enhanced styling | <strong>Usage:</strong> Homepage featured brands<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">362×580px</span>
        </div>
        <div style="border: 2px solid #10b981; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_brand %}
            <div class="brand-card-featured-variant-a">
              {% include components/cards/brand-card.html brand=comparison_brand variant="featured" %}
            </div>
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Featured Brand Name:</strong><br>
              • Font: <code>var(--text-2xl)</code> (1.5rem)<br>
              • Weight: <code>var(--font-bold)</code> (700)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.2<br><br>
              
              <strong style="color: #1f2937;">Enhanced Description:</strong><br>
              • Font: <code>var(--text-base)</code> (1rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-700)</code> (#374151)<br>
              • Line Height: 1.5<br>
              • Enhanced readability for featured display<br><br>
              
              <strong style="color: #1f2937;">Founding Year Badge:</strong><br>
              • Enhanced styling for featured context<br>
              • Maintains brand consistency<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Featured Enhancements:</strong><br>
              • Larger text hierarchy for prominence<br>
              • Enhanced logo display sizing<br>
              • Hero image integration<br>
              • Premium spacing and padding<br><br>
              
              <strong style="color: #1f2937;">Layout Features:</strong><br>
              • Responsive featured sizing (345px → 450px)<br>
              • Enhanced visual hierarchy<br>
              • Optimized for homepage carousels<br>
              • Premium brand presentation<br><br>
              
              <strong style="color: #1f2937;">Usage Context:</strong><br>
              • Homepage featured brand sections<br>
              • Premium brand showcases<br>
              • Enhanced engagement CTAs
            </div>
          </div>
        </div>
      </div>
      
      <!-- 2B. Featured brand-card (Version B) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">2B. brand-card.html variant="featured" (Version B)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> A/B test variant - Featured card variations | <strong>Usage:</strong> Alternative design<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">362×580px</span>
        </div>
        <div style="border: 2px solid #06b6d4; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_brand %}
            <div class="brand-card-featured-variant-b">
              {% include components/cards/brand-card.html brand=comparison_brand variant="featured" %}
            </div>
          {% endif %}
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Featured Brand Name (Same):</strong><br>
              • Font: <code>var(--text-2xl)</code> (1.5rem)<br>
              • Weight: <code>var(--font-bold)</code> (700)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.2<br><br>
              
              <strong style="color: #1f2937;">Enhanced Description:</strong><br>
              • Font: <code>var(--text-base)</code> (1rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code> (enhanced)<br>
              • Style: italic for differentiation<br><br>
              
              <strong style="color: #1f2937;">Founding Year Badge:</strong><br>
              • Background: <code>var(--accent-100)</code><br>
              • Color: <code>var(--accent-700)</code><br>
              • Border radius: 0.25rem<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Variant B Enhancements:</strong><br>
              • Card background: gradient (neutral-50 → neutral-100)<br>
              • Border: 1px solid <code>var(--accent-200)</code><br>
              • Tag styling: <code>var(--accent-50)</code> background<br>
              • Tag border: 1px solid <code>var(--accent-200)</code><br><br>
              
              <strong style="color: #1f2937;">Visual Differences:</strong><br>
              • Subtle gradient background<br>
              • Accent color integration<br>
              • Enhanced tag styling<br>
              • Italic description styling<br><br>
              
              <strong style="color: #1f2937;">A/B Testing Focus:</strong><br>
              • Testing accent color theme<br>
              • Evaluating gradient backgrounds<br>
              • Measuring enhanced tag engagement
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
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/brand-card.scss</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          </div>
          <div>
            <h5 style="margin-bottom: 0.5rem;">2B Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> brand-cards-layout-testing.md (test overrides)</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
          </div>
        </div>
      </div>
      
      <!-- Row 3: 3A and 3B -->
      <div class="founder-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 2rem;">
      
      <!-- 3A. Production Brands Page -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">3A. Production Brands Page</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Brands directory grid layout | <strong>Usage:</strong> Live brands page implementation<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">362×440px</span>
        </div>
        <div style="border: 2px solid #f59e0b; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_brand %}
            {% include helpers/brand-card-selector.html brand=comparison_brand %}
          {% endif %}
        </div>
      </div>
      
      <!-- 3B. Production Homepage Featured -->
      <div>
      <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">3B. Production Homepage Featured</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Homepage featured brands carousel | <strong>Usage:</strong> Live homepage implementation<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">362×580px</span>
        </div>
        <div style="border: 2px solid #ec4899; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_brand %}
            {% include components/cards/brand-card.html brand=comparison_brand variant="featured" %}
          {% endif %}
        </div>
      </div>
      
      </div>
      
      <!-- CSS and JS Sources for 3A and 3B -->
      <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin: 2rem 0;">
        <h4 style="margin-bottom: 1rem;">CSS and JS Sources</h4>
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
          <div>
            <h5 style="margin-bottom: 0.5rem;">3A Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/brand-card.scss + helpers/brand-card-selector.html</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> assets/js/pages/brands-grid.js</p>
          </div>
          <div>
            <h5 style="margin-bottom: 0.5rem;">3B Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/brand-card.scss + pages/home/featured-brands.scss</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> assets/js/components/carousel.js</p>
          </div>
        </div>
      </div>
      
      <!-- Row 4: 4A Latest Brands -->
      <div style="display: grid; grid-template-columns: 1fr; gap: 2rem; margin-bottom: 2rem;">
      
      <!-- 4A. Latest Brands Section (Production) -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">4A. Latest Brands Section (Production)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Purpose:</strong> Latest brands grid on brands page | <strong>Usage:</strong> Live brands page latest section<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">362×440px</span>
        </div>
        <div style="border: 2px solid #14b8a6; padding: 1rem; background: white; border-radius: 0.5rem;">
          {% if comparison_brand %}
            <!-- Simulate latest brands grid with single brand -->
            <div class="latest-brands">
              <div class="latest-brands__header">
                <h3 class="latest-brands__title">Latest Brands</h3>
                <p class="latest-brands__description">Discover exceptional founder-led brands from BRICS+ countries.</p>
              </div>
              <div class="grid">
                <div class="grid__item">
                  {% include components/cards/brand-card.html item=comparison_brand %}
                </div>
              </div>
            </div>
          {% endif %}
        </div>
      </div>
      
      </div>
      
      <!-- CSS and JS Sources for 4A -->
      <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin: 2rem 0;">
        <h4 style="margin-bottom: 1rem;">CSS and JS Sources</h4>
        <div style="display: grid; grid-template-columns: 1fr; gap: 2rem;">
          <div>
            <h5 style="margin-bottom: 0.5rem;">4A Sources:</h5>
            <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/brand-card.scss + components/layout/grid.scss + pages/brands/latest-brands.scss</p>
            <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> assets/js/pages/brands/brands-filtering.js</p>
          </div>
        </div>
      </div>
      
    </div>
    
    <!-- Typography & Color Variations Summary -->
    <div style="background: #fffbeb; border: 2px solid #f59e0b; padding: 1.5rem; border-radius: 0.5rem; margin: 2rem 0;">
      <h4 style="margin-bottom: 1rem; color: #92400e;">🎨 Typography & Color Variations Summary</h4>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem;">
        
        <!-- Standard Brand Cards -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Standard Brand Cards (1A-1B):</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>1A - Standard Layout:</strong><br>
            • Brand name: text-xl (1.25rem) bold<br>
            • Description: text-sm neutral-700<br>
            • Dimension tags: 4-color taxonomy system<br>
            • Mobile-first: 345px → 360px responsive<br><br>
            
            <strong>1B - Enhanced Variant:</strong><br>
            • Title color: primary-700 (enhanced)<br>
            • Card border: 2px solid primary-300<br>
            • Header background: primary-50<br>
            • Enhanced shadows and spacing<br><br>
            
            <strong>Typography Consistency:</strong><br>
            • Hierarchical text sizing maintained<br>
            • Neutral color palette preserved<br>
            • Dimension tag color coding intact<br>
            • CTA link styling standardized
          </div>
        </div>
        
        <!-- Featured Brand Cards -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Featured Brand Cards (2A-2B):</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>2A - Featured Layout:</strong><br>
            • Brand name: text-2xl (1.5rem) bold<br>
            • Description: text-base enhanced<br>
            • Premium sizing: 345px → 450px<br>
            • Enhanced visual hierarchy<br><br>
            
            <strong>2B - Accent Variant:</strong><br>
            • Gradient background: neutral-50 → neutral-100<br>
            • Founding badge: accent-100/accent-700<br>
            • Tag styling: accent-50 backgrounds<br>
            • Italic description styling<br><br>
            
            <strong>Featured Enhancements:</strong><br>
            • Larger text hierarchy for prominence<br>
            • Enhanced logo and hero integration<br>
            • Premium spacing and presentation<br>
            • Homepage optimization focus
          </div>
        </div>
        
        <!-- Production Usage -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Production Usage & Context:</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>3A - Production Brands Page:</strong><br>
            • Live brands directory implementation<br>
            • Grid layout optimization<br>
            • Filtering and search integration<br>
            • Performance-optimized rendering<br><br>
            
            <strong>3B - Homepage Featured:</strong><br>
            • Carousel integration<br>
            • Enhanced engagement CTAs<br>
            • Premium brand showcasing<br>
            • Hero section optimization<br><br>
            
            <strong>4A - Latest Brands Section:</strong><br>
            • Recent brand highlighting<br>
            • Grid layout with filtering<br>
            • Responsive brand discovery<br>
            • User engagement optimization
          </div>
        </div>
      </div>
      
      <!-- Quick Reference -->
      <div style="margin-top: 1.5rem; padding: 1rem; background: #fefce8; border-radius: 0.5rem;">
        <h6 style="margin-bottom: 0.5rem; color: #713f12;">⚡ Quick Reference for Brand Card Selection:</h6>
        <ul style="margin: 0; font-size: 0.875rem; line-height: 1.4; color: #713f12;">
          <li><strong>1A Standard:</strong> General brand grids, directory pages</li>
          <li><strong>1B Enhanced:</strong> A/B testing with primary color emphasis</li>
          <li><strong>2A Featured:</strong> Homepage carousels, premium showcases</li>
          <li><strong>2B Accent:</strong> Alternative featured styling with gradients</li>
          <li><strong>3A Production:</strong> Live brands page with full functionality</li>
          <li><strong>3B Homepage:</strong> Featured brands carousel integration</li>
          <li><strong>4A Latest:</strong> Recent brands section with discovery features</li>
        </ul>
      </div>
    </div>
    
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