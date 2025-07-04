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
    min-width: 345px;
    max-width: 480px;
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
    min-width: 345px;
    max-width: 360px;
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
    grid-template-columns: repeat(auto-fit, minmax(345px, 1fr));
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
    max-width: 345px;
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
    <h2>Section 0A: Current Insight Card Inventory</h2>
    <p style="text-align: center; color: #6b7280; margin-bottom: 2rem;"><strong>Status:</strong> 3 primary components with variants displayed, target consolidation to 2-3 components</p>


    <!-- Get test insight data -->
    {% assign comparison_insight = site.insights | where: "lang", "en" | first %}

    <!-- Row 1: Component 1A (1 column) and 1B (2 columns) -->
    <div class="test-grid-3col" style="display: grid; grid-template-columns: 1fr 2fr; gap: var(--space-4); margin-bottom: 3rem;">

      <!-- 1A. insight-card.html (Base Card) - 1 column -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1A. insight-card.html (Base Card)</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">345px mobile → 360px desktop</span><br>
          <strong>Purpose:</strong> Base insight card with mobile-first responsive design<br>
          <strong>BEM Status:</strong> <span style="color: #22c55e;">✅ Compliant</span><br>
          <strong>Width System:</strong> <span style="color: #059669;">✅ Mobile-first 345px → 360px</span>
        </div>
        <div style="border: 2px solid #3b82f6; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% include components/cards/insight-card.html insight=comparison_insight %}
            </div>
          {% endif %}
        </div>
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/insight-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/insight-card.scss</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>

        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Title:</strong><br>
              • Font: <code>var(--text-custom)</code> (0.95rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.4<br><br>

              <strong style="color: #1f2937;">Meta (Date/Author):</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-500)</code> (#6B7280)<br><br>

              <strong style="color: #1f2937;">Excerpt:</strong><br>
              • Font: <code>var(--text-base)</code> (1rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-700)</code> (#374151)<br>
              • Line Height: 1.5
            </div>
            <div>
              <strong style="color: #1f2937;">Category Badge ✨ UPDATED:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem) ✅<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Background: <code>var(--primary-100)</code><br>
              • Color: <code>var(--primary-900)</code><br>
              • Transform: uppercase<br>
              • Padding: Enhanced breathing room ✅<br><br>

              <strong style="color: #1f2937;">Tags:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Background: <code>var(--neutral-200)</code><br>
              • Color: <code>var(--neutral-600)</code><br><br>

              <strong style="color: #1f2937;">Read More Link:</strong><br>
              • Font: Inherits from container<br>
              • Weight: <code>var(--font-medium)</code> (500)<br>
              • Color: <code>var(--primary-600)</code><br>
              • Hover: underline
            </div>
          </div>
        </div>
      </div>

      <!-- 1B. insight-card.html Tagged Variant - 2 columns -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1B. insight-card.html Tagged Variant</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">345px mobile → 360px desktop</span><br>
          <strong>Purpose:</strong> Base card with tagged variant showing colored dimension tags<br>
          <strong>BEM Status:</strong> <span style="color: #22c55e;">✅ Compliant</span><br>
          <strong>Width System:</strong> <span style="color: #059669;">✅ Mobile-first 345px → 360px</span>
        </div>
        <div style="border: 2px solid #10b981; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% include components/cards/insight-card.html insight=comparison_insight variant="tagged" %}
            </div>
          {% endif %}
        </div>
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/insight-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/insight-card.scss (base styling only)</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Usage:</strong> {% raw %}{% include components/cards/insight-card.html insight=insight variant="tagged" %}{% endraw %}</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>

        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Title:</strong><br>
              • Font: <code>var(--text-custom)</code> (0.95rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.4<br><br>

              <strong style="color: #1f2937;">Meta (Date/Author):</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-500)</code> (#6B7280)<br><br>

              <strong style="color: #1f2937;">Excerpt:</strong><br>
              • Font: <code>var(--text-base)</code> (1rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-700)</code> (#374151)<br>
              • Line Height: 1.5
            </div>
            <div>
              <strong style="color: #1f2937;">Category Badge ✨ UPDATED:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem) ✅<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Background: <code>var(--primary-100)</code><br>
              • Color: <code>var(--primary-900)</code><br>
              • Transform: uppercase<br>
              • Padding: Enhanced breathing room ✅<br><br>

              <strong style="color: #1f2937;">Dimension Tags:</strong><br>
              • <span style="background: var(--sky-100); color: var(--sky-800); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Markets</span> Sky Blue<br>
              • <span style="background: var(--olive-100); color: var(--olive-800); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Sectors</span> Olive Green<br>
              • <span style="background: var(--secondary-100); color: var(--secondary-800); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Attributes</span> Orange<br>
              • <span style="background: var(--accent-100); color: var(--accent-800); padding: 2px 6px; border-radius: 6px; font-size: 0.7rem;">Signals</span> Indigo<br><br>

              <strong style="color: #1f2937;">Read More Link:</strong><br>
              • Font: Inherits from container<br>
              • Weight: <code>var(--font-medium)</code> (500)<br>
              • Color: <code>var(--primary-600)</code><br>
              • Hover: underline
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Row 2: Component 1C (Featured Variant) - 2 columns -->
    <div class="test-grid-2col-centered" style="display: grid; grid-template-columns: 1fr; gap: var(--space-4); margin-bottom: 3rem; max-width: 50%; margin-left: 0;">

      <!-- 1C. insight-card.html Featured Variant - 2 columns width -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1C. insight-card.html Featured Variant</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">345px mobile → 480px desktop</span><br>
          <strong>Purpose:</strong> Premium homepage display with enhanced styling<br>
          <strong>BEM Status:</strong> <span style="color: #22c55e;">✅ Compliant</span><br>
          <strong>Width System:</strong> <span style="color: #059669;">✅ Mobile-first 345px → 480px (--card-width-featured-lg)</span>
        </div>
        <div style="border: 2px solid #f59e0b; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% include components/cards/insight-card.html insight=comparison_insight variant="featured" %}
            </div>
          {% endif %}
        </div>
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/insight-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> assets/css/components/cards/insight-card.scss (.insight-card--featured styling)</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Usage:</strong> {% raw %}{% include components/cards/insight-card.html insight=insight variant="featured" %}{% endraw %}</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>JS:</strong> No custom JavaScript required</p>
        </div>

        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Title:</strong><br>
              • Font: <code>var(--text-lg)</code> (1.125rem)<br>
              • Weight: <code>var(--font-bold)</code> (700)<br>
              • Color: <code>var(--neutral-900)</code> (#111827)<br>
              • Line Height: 1.3<br>
              • Enhanced hierarchy for featured display<br><br>

              <strong style="color: #1f2937;">Meta (Date/Author):</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: <code>var(--font-medium)</code> (500)<br>
              • Color: <code>var(--neutral-500)</code> (#6B7280)<br>
              • Enhanced readability<br><br>

              <strong style="color: #1f2937;">Excerpt:</strong><br>
              • Font: <code>var(--text-base)</code> (1rem)<br>
              • Weight: Default (400)<br>
              • Color: <code>var(--neutral-700)</code> (#374151)<br>
              • Line Height: 1.5<br>
              • Optimized for featured presentation
            </div>
            <div>
              <strong style="color: #1f2937;">Category Badge:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem)<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Background: <code>var(--primary-100)</code><br>
              • Color: <code>var(--primary-900)</code><br>
              • Transform: uppercase<br>
              • Enhanced visibility for hero layout<br><br>

              <strong style="color: #1f2937;">Hero Image Enhancement:</strong><br>
              • Aspect ratio: 16:9 optimized<br>
              • Object fit: cover for consistency<br>
              • Hover effects: Enhanced transition<br>
              • Loading: Optimized for featured display<br><br>

              <strong style="color: #1f2937;">Read More Link:</strong><br>
              • Font: <code>var(--text-sm)</code> (0.875rem) ✅<br>
              • Weight: <code>var(--font-semibold)</code> (600)<br>
              • Color: <code>var(--primary-600)</code> ✅<br>
              • Enhanced prominence for CTAs
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Row 3: Component 1D (Related Variant) - 3 columns -->
    <div class="test-grid-wide" style="display: grid; grid-template-columns: 1fr; gap: var(--space-4); margin-bottom: 3rem; max-width: 75%; margin-left: auto; margin-right: auto;">

      <!-- 1D. insight-card.html Related Variant -->
      <div>
        <h4 style="text-align: center; margin-bottom: 1rem; color: #1f2937;">1D. insight-card.html Related Variant</h4>
        <div class="card-info" style="margin-bottom: 1rem;">
          <strong>Dimensions:</strong> <span style="background: rgba(45, 45, 45, 0.9); color: white; padding: 2px 8px; border-radius: 4px; font-family: monospace;">Horizontal layout 120x80px (3:2) image, 400w source</span><br>
          <strong>Purpose:</strong> Horizontal minimal cards for related insights sections<br>
          <strong>BEM Status:</strong> <span style="color: #22c55e;">✅ Inline styles (adjustable)</span><br>
          <strong>Width System:</strong> <span style="color: #059669;">✅ Full width horizontal layout</span>
        </div>
        <div style="border: 2px solid #8b5cf6; padding: 1rem; background: white; border-radius: 0.5rem; max-width: 100%; overflow: hidden;">
          {% if comparison_insight %}
            <div style="max-width: 100%; overflow: hidden;">
              {% include components/cards/insight-card.html insight=comparison_insight variant="related" %}
            </div>
          {% endif %}
        </div>
        <!-- File Sources -->
        <div style="background: #e5e7eb; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.5rem;">File Sources:</h5>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Component:</strong> _includes/components/cards/insight-card.html</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>CSS:</strong> Inline styles for easy adjustment</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Usage:</strong> {% raw %}{% include components/cards/insight-card.html insight=insight variant="related" %}{% endraw %}</p>
          <p style="margin: 0; font-size: 0.875rem;"><strong>Layout:</strong> Horizontal grid (120px image + 1fr content)</p>
        </div>

        <!-- Typography & Color Analysis -->
        <div style="background: #f3f4f6; padding: 1rem; border-radius: 0.5rem; margin-top: 1rem;">
          <h5 style="margin-bottom: 0.75rem; color: #374151;">Typography & Color Analysis:</h5>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; font-size: 0.75rem; line-height: 1.4;">
            <div>
              <strong style="color: #1f2937;">Title (H5):</strong><br>
              • Font: Default system font<br>
              • Weight: Normal (500)<br>
              • Color: #333 (dark gray)<br>
              • Line Height: Normal<br>
              • Margin: 0.5rem 0<br><br>

              <strong style="color: #1f2937;">Layout Structure:</strong><br>
              • Article: CSS Grid layout<br>
              • Columns: 120px 1fr<br>
              • Gap: 1rem<br>
              • Align: start<br><br>

              <strong style="color: #1f2937;">Image Container:</strong><br>
              • Size: 120px × 80px<br>
              • Border radius: 4px<br>
              • Object fit: cover<br>
              • Overflow: hidden
            </div>
            <div>
              <strong style="color: #1f2937;">Category Badge:</strong><br>
              • Dynamic color mapping<br>
              • Market Momentum: #28a745 (green)<br>
              • Brand Spotlight: #fd7e14 (orange)<br>
              • Location Intelligence: #6f42c1 (purple)<br>
              • Font size: 0.7rem<br>
              • Border radius: 12px<br><br>

              <strong style="color: #1f2937;">Excerpt:</strong><br>
              • Font: Default system font<br>
              • Size: 0.9rem<br>
              • Color: #6c757d (muted gray)<br>
              • Line Height: 1.4<br>
              • Truncate: 20 words<br><br>

              <strong style="color: #1f2937;">Container:</strong><br>
              • Border: 1px solid #dee2e6<br>
              • Background: white<br>
              • Padding: 1rem<br>
              • Border radius: 8px
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Typography & Color Variations Summary -->
    <div style="background: #fffbeb; border: 2px solid #f59e0b; padding: 1.5rem; border-radius: 0.5rem; margin: 2rem 0;">
      <h4 style="margin-bottom: 1rem; color: #92400e;">🎨 Typography & Color Variations Summary</h4>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem;">

        <!-- Key Differences -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Key Typographic Standards (Post Fine-Tuning):</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>Title Colors (Standardized):</strong><br>
            • insight-card: neutral-900 ✅<br>
            • insight-card featured: neutral-900 ✅<br>
            • insight-card-tagged: <strong>neutral-900 ✅ (updated)</strong><br><br>

            <strong>Category Badge Sizes (Enhanced):</strong><br>
            • insight-card: <strong>text-sm (0.875rem) ✅ (updated)</strong><br>
            • insight-card featured: <strong>text-sm (0.875rem) ✅ (updated)</strong><br>
            • insight-card-tagged: <strong>text-sm (0.875rem) ✅ (updated)</strong><br><br>

            <strong>Title Weights (Preserved):</strong><br>
            • insight-card: semibold (600)<br>
            • insight-card featured: <strong>bold (700)</strong><br>
            • insight-card-tagged: semibold (600)
          </div>
        </div>

        <!-- Color Scheme Differences -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Design Philosophy Maintained:</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>Clean Card Minimalism:</strong><br>
            • Clean card minimalism preserved ✅<br>
            • Textured minimalism images remain prominent ✅<br>
            • "Read More" CTA unchanged ✅<br>
            • Information hierarchy preserved ✅<br><br>

            <strong>Category Badge Styles (Improved):</strong><br>
            • insight-card: primary-100 bg / primary-900 text<br>
            • insight-card featured: primary-100 bg / <strong>primary-800 text</strong><br>
            • insight-card-tagged: <strong>overlay-modal bg / white text</strong><br><br>

            <strong>Special Features:</strong><br>
            • insight-card featured: <strong>center alignment</strong><br>
            • insight-card-tagged: <strong>dimension tag colors</strong>
          </div>
        </div>

        <!-- Behavioral Differences -->
        <div>
          <h5 style="color: #451a03; margin-bottom: 0.75rem;">Layout & Behavior Differences:</h5>
          <div style="font-size: 0.875rem; line-height: 1.5;">
            <strong>Text Alignment:</strong><br>
            • insight-card: left-aligned<br>
            • insight-card featured: <strong>center-aligned</strong><br>
            • insight-card-tagged: left-aligned<br><br>

            <strong>Line Height Variations:</strong><br>
            • insight-card: 1.4 (title), 1.5 (excerpt)<br>
            • insight-card featured: <strong>1.3 (title)</strong>, 1.4 (desc)<br>
            • insight-card-tagged: 1.25 (title), <strong>1.625 (excerpt)</strong><br><br>

            <strong>Text Clamping:</strong><br>
            • insight-card: no clamping<br>
            • insight-card featured: <strong>2 lines (title), 4 lines (desc)</strong><br>
            • insight-card-tagged: no clamping
          </div>
        </div>
      </div>

      <!-- Quick Reference -->
      <div style="margin-top: 1.5rem; padding: 1rem; background: #fefce8; border-radius: 0.5rem;">
        <h6 style="margin-bottom: 0.5rem; color: #713f12;">⚡ Quick Reference for Typography Decisions:</h6>
        <ul style="margin: 0; font-size: 0.875rem; line-height: 1.4; color: #713f12;">
          <li><strong>insight-card:</strong> Compact & readable - best for dense grids</li>
          <li><strong>insight-card featured:</strong> Bold & centered - premium homepage display</li>
          <li><strong>insight-card-tagged:</strong> Tag-focused - dimension exploration context</li>
        </ul>
      </div>
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
                {% include components/cards/insight-card.html insight=sample_insight variant="featured" %}
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
          <li><strong>Component:</strong> insight-card.html variant="featured" (4,039 bytes)</li>
          <li><strong>CSS Sources:</strong> insight-card.scss + latest-insights.scss (grid layout)</li>
          <li><strong>Features:</strong> Category badges, hero images, centered layout</li>
          <li><strong>Width:</strong> Natural responsive width (homepage grid)</li>
          <li><strong>Usage Context:</strong> Homepage 2x2 grid display</li>
          <li><strong>Architecture:</strong> Proper CSS separation - component styles in component file</li>
        </ul>
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
            <td><strong>insight-card.html (1A)</strong></td>
            <td>Main insights grid</td>
            <td>Category badges, strategic CTAs, metadata</td>
            <td><span class="status-good">✅ Excellent</span></td>
            <td><span class="status-good">✅ Good</span></td>
            <td><span class="status-good">✅ Active</span></td>
          </tr>
          <tr>
            <td><strong>insight-card.html (1B variant="tagged")</strong></td>
            <td>Taxonomy exploration</td>
            <td>Dimension tags, category focus</td>
            <td><span class="status-good">✅ Excellent</span></td>
            <td><span class="status-good">✅ Good</span></td>
            <td><span class="status-good">✅ Active</span></td>
          </tr>
          <tr>
            <td><strong>insight-card.html (1C variant="featured")</strong></td>
            <td>Homepage featured</td>
            <td>Hero images, enhanced styling</td>
            <td><span class="status-good">✅ Good</span></td>
            <td><span class="status-warning">⚠️ Moderate</span></td>
            <td><span class="status-good">✅ Active</span></td>
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

 <!-- Section 3: Sample Usage -->
## Section 3: Sample Usage

<!-- Section 4: Usage Examples -->
  <section class="test-section">
    <h2>Section 4: USAGE EXAMPLES</h2>
    <p style="text-align: center; color: #6b7280; margin-bottom: 2rem;"><strong>Copy-paste ready code</strong> for implementing each insight card variant</p>

    <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0;">
      <h4>1A. Standard Insight Card</h4>
      <p style="margin: 0.5rem 0; font-size: var(--text-sm); color: var(--neutral-600);">Base card for main insights grid - mobile-first 345px → 360px</p>
      <pre><code>{% raw %}{% include components/cards/insight-card.html insight=insight %}{% endraw %}</code></pre>
    </div>

    <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0;">
      <h4>1B. Tagged Insight Card</h4>
      <p style="margin: 0.5rem 0; font-size: var(--text-sm); color: var(--neutral-600);">Base card with dimension tags - shows all taxonomy classifications</p>
      <pre><code>{% raw %}{% include components/cards/insight-card.html insight=insight variant="tagged" %}{% endraw %}</code></pre>
    </div>

    <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0;">
      <h4>1C. Featured Insight Card</h4>
      <p style="margin: 0.5rem 0; font-size: var(--text-sm); color: var(--neutral-600);">Enhanced card for homepage - mobile-first 345px → 480px with premium styling</p>
      <pre><code>{% raw %}{% include components/cards/insight-card.html insight=insight variant="featured" %}{% endraw %}</code></pre>
    </div>

    <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0;">
      <h4>1D. Related Insight Card</h4>
      <p style="margin: 0.5rem 0; font-size: var(--text-sm); color: var(--neutral-600);">Horizontal minimal layout - 120x80px image with full-width content</p>
      <pre><code>{% raw %}{% include components/cards/insight-card.html insight=insight variant="related" %}{% endraw %}</code></pre>
    </div>

    <!-- Parameter Reference -->
    <div style="background: var(--neutral-50); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0; border: 1px solid var(--neutral-200);">
      <h4>Parameter Reference</h4>

      <table class="specs-table">
        <thead>
          <tr>
            <th>Parameter</th>
            <th>Options</th>
            <th>Default</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><code>insight</code></td>
            <td>Jekyll insight object (required)</td>
            <td>-</td>
          </tr>
          <tr>
            <td><code>variant</code></td>
            <td>"standard", "tagged", "featured", "related"</td>
            <td>"standard"</td>
          </tr>
        </tbody>
      </table>

      <div style="margin-top: var(--space-3); padding: var(--space-3); background: white; border-radius: var(--radius-md);">
        <h5>File Location</h5>
        <div style="font-family: monospace; font-size: var(--text-sm); color: var(--neutral-700);">
          <strong>Component:</strong> _includes/components/cards/insight-card.html
        </div>
      </div>
    </div>

  </section>


  <!-- Section 4: Quick Reference -->
  <section class="test-section">
    <h2>Section 4: QUICK REFERENCE</h2>

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
          <p><strong>Use:</strong> insight-card.html variant="featured"<br>
          <strong>Layout:</strong> Carousel or 2-column<br>
          <strong>Features:</strong> Hero images, enhanced styling</p>
        </div>
        <div>
          <h4>All Contexts</h4>
          <p><strong>Use:</strong> insight-card.html (base card)<br>
          <strong>Layout:</strong> Flexible (grid, list, sidebar)<br>
          <strong>Features:</strong> Streamlined, space-efficient</p>
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
