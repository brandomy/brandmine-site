---
layout: default
title: Test Pages Directory
permalink: /test/
lang: en
---

<style>
  .test-index {
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
  }
  .test-index h1 {
    text-align: center;
    margin-bottom: 3rem;
  }
  .test-links {
    display: grid;
    gap: 2rem;
  }
  .test-link-card {
    background: white;
    border: 1px solid var(--neutral-200);
    border-radius: 0.5rem;
    padding: 2rem;
    text-decoration: none;
    color: inherit;
    transition: all 0.2s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  }
  .test-link-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    border-color: var(--primary-300);
  }
  .test-link-card h2 {
    color: var(--primary-600);
    margin-bottom: 0.5rem;
  }
  .test-link-card p {
    color: var(--neutral-600);
    margin: 0;
  }
  .test-status {
    display: inline-block;
    background: #10b981;
    color: white;
    padding: 0.25rem 0.75rem;
    border-radius: 9999px;
    font-size: 0.75rem;
    font-weight: bold;
    margin-top: 1rem;
  }
</style>

<div class="test-index">
  <h1>Test Pages Directory</h1>
  
  <div class="test-links">
    <!-- Brand Cards Testing -->
    <a href="/test/brand-cards-layout-testing/" class="test-link-card">
      <h2>Brand Cards Layout Testing</h2>
      <p>Comprehensive testing of MVP brand cards (brand-card.html and brand-card-featured.html) in different layout contexts. Includes grid and carousel performance assessments.</p>
      <span class="test-status">Active</span>
    </a>
    
    <!-- Founder Cards Testing -->
    <a href="/test/founder-cards-layout-testing/" class="test-link-card">
      <h2>Founder Cards Layout Testing</h2>
      <p>Testing of all founder card variants including founder-card.html, founder-card-featured.html, and founder-card-focus.html. Includes layout versatility analysis and homepage protection notes.</p>
      <span class="test-status">Active</span>
    </a>
    
    <!-- Insight Cards Testing -->
    <a href="/test/insight-cards-layout-testing/" class="test-link-card">
      <h2>Insight Cards Layout Testing</h2>
      <p>Comprehensive testing of insight card components (insight-card.html, featured-insight-card.html, simple-insight-card.html) in different layout contexts. Includes category differentiation and performance assessments.</p>
      <span class="test-status">Active</span>
    </a>
    
    <!-- Dimension Cards Testing -->
    <a href="/test/dimension-cards-layout-testing/" class="test-link-card">
      <h2>Dimension Cards Layout Testing</h2>
      <p>Testing of dimension card component (dimension-card.html) with base (1A) and featured (1B) variants across all four dimension types (sectors, markets, attributes, signals). Includes typography analysis and discovery system integration testing.</p>
      <span class="test-status">Active</span>
    </a>
    
    <!-- Insight Card Comparison Testing -->
    <a href="/test/insight-card-comparison/" class="test-link-card">
      <h2>Insight Card Comparison Testing</h2>
      <p>Side-by-side comparison of insight-card-latest.html vs insight-card.html variant="featured" for component consolidation analysis. Tests visual parity, typography hierarchy, layout consistency, and homepage grid compatibility.</p>
      <span class="test-status">Active</span>
    </a>
    
    <!-- Additional Test Pages -->
    <div class="test-link-card" style="opacity: 0.6;">
      <h2>Additional Test Pages</h2>
      <p>Other test pages found in the codebase:</p>
      <ul style="margin-top: 1rem; font-size: 0.875rem;">
        <li>/test/carousel-test/ - Carousel functionality testing</li>
        <li>/en/dev/forms-test/ - Forms testing</li>
        <li>/en/dev/founders-test/ - Founders page testing</li>
        <li>/en/dev/dimensions-grid-test/ - Dimensions grid testing</li>
      </ul>
    </div>
  </div>
  
  <div style="margin-top: 3rem; padding: 1.5rem; background: #f3f4f6; border-radius: 0.5rem;">
    <h3>Reference Documents</h3>
    <ul>
      <li><strong>Card Usage Analysis:</strong> _includes/reference/card-usage-by-page.md</li>
      <li><strong>Universal Card Elimination Plan:</strong> _includes/reference/universal-card-elimination-plan.md</li>
      <li><strong>Helpers Reference:</strong> _includes/reference/helpers-master-table.md</li>
    </ul>
  </div>
</div>