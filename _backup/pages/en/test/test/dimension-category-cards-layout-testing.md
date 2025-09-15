---
layout: default
title: Dimension Category Cards Layout Testing
permalink: /test/dimension-category-cards-layout-testing
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
  
  /* Override grid for 4-column layout in tests */
  .test-grid-4col {
    display: grid !important;
    grid-template-columns: repeat(4, 1fr) !important;
    gap: var(--space-4) !important;
    max-width: 100%;
    overflow-x: auto;
  }
  
  .test-grid-4col .grid__item {
    min-width: 345px;
    max-width: 450px;
  }
  
  /* 2-card grid variant for dimension testing */
  .test-grid-2col {
    display: grid !important;
    grid-template-columns: repeat(2, 1fr) !important;
    gap: var(--space-6) !important;
    max-width: 100%;
    overflow-x: auto;
  }
  
  .test-grid-2col .grid__item {
    min-width: 345px;
    max-width: 450px;
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
    .test-grid-4col,
    .test-grid-2col {
      grid-template-columns: 1fr !important;
    }
  }
  
  /* Dimension comparison grid - 2 cards per row */
  .dimension-comparison-grid {
    display: grid !important;
    grid-template-columns: repeat(2, 1fr) !important;
    gap: 2rem !important;
  }
  
  @media (max-width: 768px) {
    .dimension-comparison-grid {
      grid-template-columns: 1fr !important;
    }
  }
  
  /* VISUAL DEBUGGING TOOLKIT - Isolated to test page only */
  
  /* Color-coded element debugging */
  .debug-layout .dimension-category-card__title {
    background: rgba(0, 255, 0, 0.2) !important;
    border: 2px solid green !important;
    margin: 2px 0 !important;
  }
  
  .debug-layout .dimension-category-card__description {
    background: rgba(255, 0, 0, 0.2) !important;
    border: 2px solid red !important;
    margin: 2px 0 !important;
  }
  
  .debug-layout .dimension-category-card__icon {
    background: rgba(0, 0, 255, 0.2) !important;
    border: 2px solid blue !important;
    margin: 1px !important;
  }
  
  .debug-layout .dimension-category-card__count {
    background: rgba(128, 0, 128, 0.2) !important;
    border: 2px solid purple !important;
  }
  
  /* Grid overlay debugging */
  .debug-grid .dimension-category-card {
    position: relative;
  }

  .debug-grid .dimension-category-card::before {
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

  .debug-grid .dimension-category-card::after {
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
</style>

<div class="container">
  <div class="test-header">
    <h1>Dimension Category Cards Layout Testing</h1>
    <p>Comprehensive testing of dimension category card components with 1A base and 1B featured variants</p>
  </div>

  <!-- Section 0: Single Card Comparison -->
  <section class="test-section">
    <h2>Section 0: DIMENSION CATEGORY CARD VARIANTS COMPARISON</h2>
    <p style="text-align: center; color: #6b7280; margin-bottom: 2rem;">Side-by-side comparison of dimension category card variants using all four dimension types</p>
    
    <!-- Single card comparison grid - organized by dimension type -->
    <div style="margin-bottom: 3rem;">
      
      <!-- Sectors: 1A and 1B -->
      <div class="dimension-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 3rem;">
      
      <!-- 1A. Sectors Standard -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1A. Sectors (Standard)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Type:</strong> sectors | <strong>Variant:</strong> standard | <strong>Usage:</strong> Discovery grid layouts<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">345px mobile → 360px desktop</span>
        </div>
        <div style="border: 2px solid var(--olive-500); padding: 1rem; background: white; border-radius: 0.5rem;">
          {% include components/cards/dimension-category-card.html type="sectors" limit=3 %}
        </div>
        
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/dimension-category-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/dimension-category-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Title:</strong><br>
              • Font: <code>var(--text-xl)</code> (1.25rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--olive-800)</code><br>
              • Sector-specific theming<br><br>
              
              <strong style="color: #1f2937;">Description:</strong><br>
              • Font: <code>var(--text-base)</code> (1rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-600)</code><br>
              • Standard content spacing<br><br>
              
              <strong style="color: #1f2937;">Icon:</strong><br>
              • Size: 48px × 48px circular<br>
              • Background: <code>var(--olive-100)</code><br>
              • Color: <code>var(--olive-700)</code><br>
            </div>
            <div>
              <strong style="color: #1f2937;">Card Styling:</strong><br>
              • Border top: 3px solid <code>var(--olive-500)</code><br>
              • Background: white<br>
              • Border radius: <code>var(--radius-lg)</code><br>
              • Padding: <code>var(--space-6)</code><br><br>
              
              <strong style="color: #1f2937;">CTA Button:</strong><br>
              • Style: outline button<br>
              • Color: <code>var(--olive-700)</code><br>
              • Border: <code>var(--olive-300)</code><br>
              • Text: "View All Sectors"<br><br>
              
              <strong style="color: #1f2937;">Tag Cloud:</strong><br>
              • Integrated dimension tag component<br>
              • Sector-specific color coding<br>
              • Configurable limit and selection
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1B. Sectors Featured -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1B. Sectors (Featured)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Type:</strong> sectors | <strong>Variant:</strong> featured | <strong>Usage:</strong> Homepage highlights<br>
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">345px mobile → 450px desktop</span>
        </div>
        <div style="border: 2px solid var(--olive-600); padding: 1rem; background: white; border-radius: 0.5rem;">
          {% include components/cards/dimension-category-card.html type="sectors" limit=3 variant="featured" %}
        </div>
        
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/dimension-category-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/dimension-category-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Enhanced Title:</strong><br>
              • Font: <code>var(--text-2xl)</code> (1.5rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--olive-800)</code><br>
              • Enhanced hierarchy<br><br>
              
              <strong style="color: #1f2937;">Enhanced Description:</strong><br>
              • Font: <code>var(--text-lg)</code> (1.125rem)<br>
              • Line height: 1.6<br>
              • Color: <code>var(--neutral-700)</code><br>
              • Premium content presentation<br><br>
              
              <strong style="color: #1f2937;">Large Icon:</strong><br>
              • Size: 64px × 64px circular<br>
              • Background: <code>var(--olive-100)</code><br>
              • SVG: 32px × 32px<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Featured Enhancements:</strong><br>
              • Border top: 4px solid <code>var(--olive-500)</code><br>
              • Background: gradient (neutral-50 → white)<br>
              • Box shadow: <code>var(--shadow-lg)</code><br>
              • Padding: <code>var(--space-8)</code><br><br>
              
              <strong style="color: #1f2937;">Count Display:</strong><br>
              • Font: <code>var(--text-sm)</code> medium<br>
              • Color: <code>var(--neutral-500)</code><br>
              • Transform: uppercase<br>
              • Letter spacing: 0.05em<br><br>
              
              <strong style="color: #1f2937;">Solid CTA Button:</strong><br>
              • Background: <code>var(--olive-600)</code><br>
              • Color: white<br>
              • Text: "Explore Sectors"<br>
              • Enhanced prominence
            </div>
          </div>
        </div>
      </div>
      
      </div>
      
      <!-- Markets: 1A and 1B -->
      <div class="dimension-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 3rem;">
      
      <!-- 1A. Markets Standard -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1A. Markets (Standard)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Type:</strong> markets | <strong>Variant:</strong> standard | <strong>Usage:</strong> Discovery grid layouts<br>
          <strong>Color scheme:</strong> Sky blue theme<br>
        </div>
        <div style="border: 2px solid var(--sky-500); padding: 1rem; background: white; border-radius: 0.5rem;">
          {% include components/cards/dimension-category-card.html type="markets" limit=3 %}
        </div>
        
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/dimension-category-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/dimension-category-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Markets Color Scheme:</strong><br>
              • Title: <code>var(--sky-800)</code><br>
              • Icon background: <code>var(--sky-100)</code><br>
              • Icon color: <code>var(--sky-700)</code><br>
              • Border top: <code>var(--sky-500)</code><br><br>
              
              <strong style="color: #1f2937;">Typography:</strong><br>
              • Same font hierarchy as sectors<br>
              • Consistent spacing patterns<br>
              • Market-specific content<br>
            </div>
            <div>
              <strong style="color: #1f2937;">CTA Styling:</strong><br>
              • Color: <code>var(--sky-700)</code><br>
              • Border: <code>var(--sky-300)</code><br>
              • Text: "View All Markets"<br><br>
              
              <strong style="color: #1f2937;">Tag Integration:</strong><br>
              • Market-specific tag colors<br>
              • Geographic region focus<br>
              • Consistent tag cloud component<br>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1B. Markets Featured -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1B. Markets (Featured)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Type:</strong> markets | <strong>Variant:</strong> featured | <strong>Usage:</strong> Homepage highlights<br>
          <strong>Color scheme:</strong> Enhanced sky blue theme<br>
        </div>
        <div style="border: 2px solid var(--sky-600); padding: 1rem; background: white; border-radius: 0.5rem;">
          {% include components/cards/dimension-category-card.html type="markets" limit=3 variant="featured" %}
        </div>
        
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/dimension-category-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/dimension-category-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Enhanced Markets Theme:</strong><br>
              • Title: <code>var(--sky-800)</code> (larger)<br>
              • Icon: 64px with enhanced colors<br>
              • Border: 4px solid <code>var(--sky-500)</code><br>
              • Gradient background integration<br><br>
              
              <strong style="color: #1f2937;">Featured Elements:</strong><br>
              • Count display for markets<br>
              • Enhanced description styling<br>
              • Premium layout structure<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Solid Button:</strong><br>
              • Background: <code>var(--sky-600)</code><br>
              • Hover: <code>var(--sky-700)</code><br>
              • Text: "Explore Markets"<br>
              • Enhanced CTA prominence<br><br>
              
              <strong style="color: #1f2937;">Visual Hierarchy:</strong><br>
              • Larger icon and text<br>
              • Enhanced spacing<br>
              • Premium card presentation<br>
            </div>
          </div>
        </div>
      </div>
      
      </div>
      
      <!-- Attributes: 1A and 1B -->
      <div class="dimension-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 3rem;">
      
      <!-- 1A. Attributes Standard -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1A. Attributes (Standard)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Type:</strong> attributes | <strong>Variant:</strong> standard | <strong>Usage:</strong> Discovery grid layouts<br>
          <strong>Color scheme:</strong> Orange/secondary theme<br>
        </div>
        <div style="border: 2px solid var(--secondary-500); padding: 1rem; background: white; border-radius: 0.5rem;">
          {% include components/cards/dimension-category-card.html type="attributes" limit=3 %}
        </div>
        
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/dimension-category-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/dimension-category-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Attributes Color Scheme:</strong><br>
              • Title: <code>var(--secondary-800)</code><br>
              • Icon background: <code>var(--secondary-100)</code><br>
              • Icon color: <code>var(--secondary-700)</code><br>
              • Border top: <code>var(--secondary-500)</code><br><br>
              
              <strong style="color: #1f2937;">Content Focus:</strong><br>
              • Brand qualities and characteristics<br>
              • Foundation and heritage elements<br>
              • Consistent typography patterns<br>
            </div>
            <div>
              <strong style="color: #1f2937;">CTA Integration:</strong><br>
              • Color: <code>var(--secondary-700)</code><br>
              • Border: <code>var(--secondary-300)</code><br>
              • Text: "View All Attributes"<br><br>
              
              <strong style="color: #1f2937;">Orange Theme Usage:</strong><br>
              • Warm, inviting color palette<br>
              • Brand quality emphasis<br>
              • Consistent visual language<br>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1B. Attributes Featured -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1B. Attributes (Featured)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Type:</strong> attributes | <strong>Variant:</strong> featured | <strong>Usage:</strong> Homepage highlights<br>
          <strong>Color scheme:</strong> Enhanced orange/secondary theme<br>
        </div>
        <div style="border: 2px solid var(--secondary-600); padding: 1rem; background: white; border-radius: 0.5rem;">
          {% include components/cards/dimension-category-card.html type="attributes" limit=3 variant="featured" %}
        </div>
        
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/dimension-category-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/dimension-category-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Enhanced Attributes:</strong><br>
              • Larger typography hierarchy<br>
              • Enhanced orange color integration<br>
              • Premium layout presentation<br>
              • 64px icon with enhanced visibility<br><br>
              
              <strong style="color: #1f2937;">Featured Styling:</strong><br>
              • 4px border enhancement<br>
              • Gradient background<br>
              • Enhanced shadows and spacing<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Solid CTA:</strong><br>
              • Background: <code>var(--secondary-600)</code><br>
              • Hover: <code>var(--secondary-700)</code><br>
              • Text: "Explore Attributes"<br>
              • Enhanced button prominence<br><br>
              
              <strong style="color: #1f2937;">Premium Features:</strong><br>
              • Count display integration<br>
              • Enhanced content spacing<br>
              • Featured card presentation<br>
            </div>
          </div>
        </div>
      </div>
      
      </div>
      
      <!-- Signals: 1A and 1B -->
      <div class="dimension-comparison-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-bottom: 3rem;">
      
      <!-- 1A. Signals Standard -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1A. Signals (Standard)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Type:</strong> signals | <strong>Variant:</strong> standard | <strong>Usage:</strong> Discovery grid layouts<br>
          <strong>Color scheme:</strong> Indigo/accent theme<br>
        </div>
        <div style="border: 2px solid var(--accent-500); padding: 1rem; background: white; border-radius: 0.5rem;">
          {% include components/cards/dimension-category-card.html type="signals" limit=3 %}
        </div>
        
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/dimension-category-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/dimension-category-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Signals Color Scheme:</strong><br>
              • Title: <code>var(--accent-800)</code><br>
              • Icon background: <code>var(--accent-100)</code><br>
              • Icon color: <code>var(--accent-700)</code><br>
              • Border top: <code>var(--accent-500)</code><br><br>
              
              <strong style="color: #1f2937;">Growth Focus:</strong><br>
              • Growth indicators and metrics<br>
              • Future potential markers<br>
              • Investment readiness signals<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Indigo Theme:</strong><br>
              • Color: <code>var(--accent-700)</code><br>
              • Border: <code>var(--accent-300)</code><br>
              • Text: "View All Signals"<br><br>
              
              <strong style="color: #1f2937;">Visual Identity:</strong><br>
              • Professional indigo palette<br>
              • Growth-oriented messaging<br>
              • Consistent design language<br>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1B. Signals Featured -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1B. Signals (Featured)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Type:</strong> signals | <strong>Variant:</strong> featured | <strong>Usage:</strong> Homepage highlights<br>
          <strong>Color scheme:</strong> Enhanced indigo/accent theme<br>
        </div>
        <div style="border: 2px solid var(--accent-600); padding: 1rem; background: white; border-radius: 0.5rem;">
          {% include components/cards/dimension-category-card.html type="signals" limit=3 variant="featured" %}
        </div>
        
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/dimension-category-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/dimension-category-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>
        
        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Enhanced Signals:</strong><br>
              • Premium indigo color integration<br>
              • Growth-focused messaging<br>
              • Enhanced visual hierarchy<br>
              • 64px icon prominence<br><br>
              
              <strong style="color: #1f2937;">Featured Elements:</strong><br>
              • Enhanced gradient background<br>
              • 4px border prominence<br>
              • Premium spacing and shadows<br>
            </div>
            <div>
              <strong style="color: #1f2937;">Solid CTA Button:</strong><br>
              • Background: <code>var(--accent-600)</code><br>
              • Hover: <code>var(--accent-700)</code><br>
              • Text: "Explore Signals"<br>
              • Enhanced button styling<br><br>
              
              <strong style="color: #1f2937;">Premium Presentation:</strong><br>
              • Count display for signals<br>
              • Enhanced content layout<br>
              • Featured card prominence<br>
            </div>
          </div>
        </div>
      </div>
      
      </div>
      
    </div>
    
    <!-- Typography & Color Variations Summary -->
    <div style="background: #fffbeb; border: 2px solid #f59e0b; padding: 1.5rem; border-radius: 0.5rem; margin: 2rem 0;">
      <h4 style="margin-bottom: 1rem; color: #92400e;">🎨 Typography & Color Variations Summary</h4>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem;">
        
        <!-- Standard Variant Analysis -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">1A Standard Variant:</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>Typography Hierarchy:</strong><br>
            • Title: text-xl (1.25rem) semibold<br>
            • Description: text-base neutral-600<br>
            • Icon: 48px circular with dimension colors<br>
            • CTA: outline button with dimension theming<br><br>
            
            <strong>Color Coding System:</strong><br>
            • <span style="background: var(--olive-100); color: var(--olive-800); padding: 2px 6px; border-radius: 6px;">Sectors</span> Olive green theme<br>
            • <span style="background: var(--sky-100); color: var(--sky-800); padding: 2px 6px; border-radius: 6px;">Markets</span> Sky blue theme<br>
            • <span style="background: var(--secondary-100); color: var(--secondary-800); padding: 2px 6px; border-radius: 6px;">Attributes</span> Orange theme<br>
            • <span style="background: var(--accent-100); color: var(--accent-800); padding: 2px 6px; border-radius: 6px;">Signals</span> Indigo theme<br><br>
            
            <strong>Layout Features:</strong><br>
            • Mobile-first: 345px → 360px<br>
            • 3px top border dimension coding<br>
            • Standard padding and spacing<br>
            • Integrated tag cloud component
          </div>
        </div>
        
        <!-- Featured Variant Analysis -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">1B Featured Variant:</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>Enhanced Typography:</strong><br>
            • Title: text-2xl (1.5rem) semibold<br>
            • Description: text-lg enhanced (1.125rem)<br>
            • Icon: 64px circular with enhanced colors<br>
            • CTA: solid button with dimension backgrounds<br><br>
            
            <strong>Premium Features:</strong><br>
            • Responsive sizing: 345px → 450px<br>
            • 4px enhanced top border<br>
            • Gradient background (neutral-50 → white)<br>
            • Enhanced shadows (shadow-lg)<br>
            • Count display with dimension statistics<br><br>
            
            <strong>Enhanced Layout:</strong><br>
            • Hero section with larger icon<br>
            • Title section with count display<br>
            • Enhanced content spacing<br>
            • Solid CTA buttons with hover states<br>
            • Premium visual hierarchy
          </div>
        </div>
        
        <!-- Design System Integration -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Design System Integration:</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>Consistent Patterns:</strong><br>
            • Mobile-first responsive design<br>
            • BEM CSS methodology<br>
            • Design token integration<br>
            • Component configuration defaults<br><br>
            
            <strong>Dimension Color System:</strong><br>
            • Each type has dedicated color palette<br>
            • Consistent icon and border theming<br>
            • Harmonious visual language<br>
            • Accessible color combinations<br><br>
            
            <strong>Usage Guidelines:</strong><br>
            • 1A: Discovery grid layouts<br>
            • 1B: Homepage featured sections<br>
            • Configurable tag display<br>
            • Scalable component architecture<br>
            • Integration with discovery system
          </div>
        </div>
      </div>
      
      <!-- Quick Reference -->
      <div style="margin-top: 1.5rem; padding: 1rem; background: #fefce8; border-radius: 0.5rem;">
        <h6 style="margin-bottom: 0.5rem; color: #713f12;">⚡ Quick Reference for Dimension Category Card Usage:</h6>
        <div style="font-size: 0.875rem; line-height: 1.4; color: #713f12;">
          <strong>Usage Examples:</strong><br>
          <code>{% raw %}{% include components/cards/dimension-category-card.html type="sectors" %}{% endraw %}</code> (Standard)<br>
          <code>{% raw %}{% include components/cards/dimension-category-card.html type="markets" variant="featured" %}{% endraw %}</code> (Featured)<br><br>
          
          <strong>Available Types:</strong><br>
          • <strong>sectors</strong> - Industry and business category discovery<br>
          • <strong>markets</strong> - Geographic region exploration<br>
          • <strong>attributes</strong> - Brand quality and characteristic discovery<br>
          • <strong>signals</strong> - Growth indicator and investment readiness exploration<br><br>
          
          <strong>Variants:</strong><br>
          • <strong>Standard (default):</strong> Discovery page grids, category navigation<br>
          • <strong>Featured (variant="featured"):</strong> Homepage highlights, premium discovery sections
        </div>
      </div>
    </div>
    
  </section>

  <!-- Section 1: Layout Testing -->
  <section class="test-section">
    <h2>Section 1: DIMENSION CATEGORY CARDS - Layout Testing</h2>
    
    <div class="card-info">
      <strong>Testing:</strong> dimension-category-card.html with variants | <strong>Purpose:</strong> Discovery grid and featured layouts
    </div>
    
    <!-- Grid Layout Tests -->
    <div class="test-subsection">
      <h3>Discovery Grid Layout</h3>
      
      <!-- 4-Card Grid Layout (All Types) -->
      <div class="test-layout-label">Discovery Grid (All 4 Dimension Types) - Standard Variant</div>
      <div class="grid test-grid-4col">
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="sectors" limit=3 %}
        </div>
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="markets" limit=3 %}
        </div>
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="attributes" limit=3 %}
        </div>
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="signals" limit=3 %}
        </div>
      </div>
      
      <!-- Featured Layout Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">Featured Grid (All 4 Dimension Types) - Featured Variant</div>
      <div class="grid test-grid-4col">
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="sectors" limit=5 variant="featured" %}
        </div>
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="markets" limit=5 variant="featured" %}
        </div>
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="attributes" limit=5 variant="featured" %}
        </div>
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="signals" limit=5 variant="featured" %}
        </div>
      </div>
      
      <!-- 2-Card Featured Comparison -->
      <div class="test-layout-label" style="margin-top: 2rem;">Featured Comparison (2-Card Layout)</div>
      <div class="grid test-grid-2col">
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="sectors" limit=4 variant="featured" %}
        </div>
        <div class="grid__item">
          {% include components/cards/dimension-category-card.html type="markets" limit=4 variant="featured" %}
        </div>
      </div>
      
      <!-- Styling Evaluation Framework -->
      <div class="styling-assessment" style="margin-top: 2rem; padding: 1.5rem; background: var(--neutral-50); border-radius: 0.5rem;">
        <h4>Styling Evaluation: dimension-category-card.html</h4>
        <div class="assessment-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem;">
          <div class="criteria">
            <strong>Visual Appeal:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Information Clarity:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Color Coding Effectiveness:</strong> ⭐⭐⭐⭐⭐<br>
            <strong>Discovery Page Suitability:</strong> ⭐⭐⭐⭐⭐
          </div>
          <div class="notes">
            <strong>Styling Notes:</strong> Excellent dimension-specific theming with clear visual hierarchy<br>
            <strong>Variant Benefits:</strong> Featured variant provides enhanced prominence for key sections<br>
            <strong>Recommendation:</strong> ✅ Perfect for discovery system integration
          </div>
        </div>
      </div>
    </div>
    
  </section>

  <!-- Homepage Implementation Details -->
  <section class="test-section">
    <h2>🏠 Homepage Implementation Details</h2>
    <div class="card-info" style="background: var(--primary-100); border-left-color: var(--primary-600); margin-bottom: 2rem;">
      <h3>Discovery Dimensions Section on Homepage</h3>
      <p><strong>Location:</strong> <code>_includes/pages/home/discovery-dimensions.html</code></p>
      <p><strong>Grid Component:</strong> <code>_includes/components/dimensions/discovery-dimensions-grid.html</code></p>
      <p><strong>Default Configuration:</strong> 4 columns, 6 items per dimension type</p>
      <p><strong>Usage:</strong></p>
      <pre style="background: var(--neutral-800); color: white; padding: 1rem; border-radius: 0.375rem; overflow-x: auto;">{% raw %}{% include components/dimensions/discovery-dimensions-grid.html columns=4 limit=6 %}{% endraw %}</pre>
      <p style="margin-top: 1rem;"><strong>Note:</strong> The discovery-dimensions-grid.html component automatically includes all four dimension types (markets, sectors, attributes, signals) using the standard variant of dimension-category-card.html</p>
    </div>
  </section>

  <!-- Visual Debugging Toolkit -->
  <section class="test-section" style="background: var(--warning-50);">
    <h2>🔧 Visual Debugging Toolkit</h2>
    
    <div class="card-info" style="background: var(--warning-100); border-left-color: var(--warning-600);">
      <h3>⚠️ Debugging Tools for Layout Investigation</h3>
      <p>Use these tools to identify dimension card styling and alignment issues:</p>
      
      <div style="display: flex; gap: 1rem; margin: 1rem 0; flex-wrap: wrap;">
        <button onclick="toggleDebugLayout()" class="debug-btn" style="background: #22c55e; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Layout Debug</button>
        <button onclick="toggleDebugGrid()" class="debug-btn" style="background: #3b82f6; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Grid Debug</button>
        <button onclick="toggleDebugBoxModel()" class="debug-btn" style="background: #8b5cf6; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Box Model</button>
        <button onclick="reportDimensions()" class="debug-btn" style="background: #ef4444; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Report Measurements</button>
      </div>
      
      <div style="font-size: 0.875rem; line-height: 1.5;">
        <strong>Color Legend:</strong><br>
        🟢 <strong>Green:</strong> Title elements<br>
        🔴 <strong>Red:</strong> Description content<br>
        🔵 <strong>Blue:</strong> Icon containers<br>
        🟣 <strong>Purple:</strong> Count displays (featured variant)<br>
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

// Element dimension reporting
function reportDimensions() {
  const title = document.querySelector('.dimension-category-card__title');
  const description = document.querySelector('.dimension-category-card__description');
  const icon = document.querySelector('.dimension-category-card__icon');
  const count = document.querySelector('.dimension-category-card__count');
  
  console.group('🔍 Dimension Card Element Report');
  
  if (title) {
    const titleRect = title.getBoundingClientRect();
    const titleStyles = window.getComputedStyle(title);
    console.log('🟢 Title Element:', {
      offsetLeft: title.offsetLeft,
      offsetTop: title.offsetTop,
      clientWidth: title.clientWidth,
      clientHeight: title.clientHeight,
      boundingRect: titleRect,
      fontSize: titleStyles.fontSize,
      fontWeight: titleStyles.fontWeight,
      color: titleStyles.color
    });
  }
  
  if (description) {
    const descRect = description.getBoundingClientRect();
    const descStyles = window.getComputedStyle(description);
    console.log('🔴 Description Element:', {
      offsetLeft: description.offsetLeft,
      offsetTop: description.offsetTop,
      clientWidth: description.clientWidth,
      clientHeight: description.clientHeight,
      boundingRect: descRect,
      fontSize: descStyles.fontSize,
      lineHeight: descStyles.lineHeight,
      color: descStyles.color
    });
  }
  
  if (icon) {
    const iconRect = icon.getBoundingClientRect();
    const iconStyles = window.getComputedStyle(icon);
    console.log('🔵 Icon Element:', {
      offsetLeft: icon.offsetLeft,
      offsetTop: icon.offsetTop,
      clientWidth: icon.clientWidth,
      clientHeight: icon.clientHeight,
      boundingRect: iconRect,
      backgroundColor: iconStyles.backgroundColor,
      borderRadius: iconStyles.borderRadius
    });
  }
  
  if (count) {
    const countRect = count.getBoundingClientRect();
    const countStyles = window.getComputedStyle(count);
    console.log('🟣 Count Element:', {
      offsetLeft: count.offsetLeft,
      offsetTop: count.offsetTop,
      clientWidth: count.clientWidth,
      clientHeight: count.clientHeight,
      boundingRect: countRect,
      textContent: count.textContent
    });
  }
  
  console.groupEnd();
  
  // Also show alert for quick reference
  alert(`Debug measurements logged to console. Check browser dev tools for detailed analysis.`);
}

// Initialize debugging tools
document.addEventListener('DOMContentLoaded', function() {
  console.log('🔧 Dimension Cards Visual Debugging Toolkit loaded. Use the debug buttons above to analyze layout issues.');
});
</script>