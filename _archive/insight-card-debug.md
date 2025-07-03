---
layout: default
title: Insight Card Debug Test
permalink: /test/insight-card-debug
lang: en
---

<style>
  .debug-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
  }
  
  .debug-section {
    margin-bottom: 3rem;
    padding: 2rem;
    border: 2px solid #e5e7eb;
    border-radius: 0.5rem;
  }
  
  .debug-info {
    background: #f3f4f6;
    padding: 1rem;
    margin-bottom: 2rem;
    border-radius: 0.5rem;
    font-family: monospace;
    font-size: 0.875rem;
  }
  
  /* Basic insight card CSS for debugging */
  .insight-card {
    background: white;
    border: 1px solid #d1d5db;
    border-radius: 0.5rem;
    padding: 1rem;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    max-width: 400px;
  }
  
  .insight-card__hero {
    width: 100%;
    margin-bottom: 1rem;
  }
  
  .insight-card__hero-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 0.25rem;
  }
  
  .insight-card__content {
    padding: 0;
  }
  
  .insight-card__title {
    font-size: 1.125rem;
    font-weight: bold;
    margin: 0 0 0.5rem 0;
    color: #1f2937;
  }
  
  .insight-card__excerpt {
    font-size: 0.875rem;
    color: #6b7280;
    line-height: 1.5;
    margin-bottom: 1rem;
  }
  
  .insight-card__meta {
    font-size: 0.75rem;
    color: #9ca3af;
  }
  
  .insight-card__category-badge {
    display: inline-block;
    background: #dbeafe;
    color: #1e40af;
    padding: 0.25rem 0.5rem;
    border-radius: 0.25rem;
    font-size: 0.75rem;
    margin-bottom: 0.5rem;
  }
</style>

<div class="debug-container">
  <h1>Insight Card Debug Test</h1>
  
  <div class="debug-info">
    <strong>DEBUG INFO:</strong><br>
    Page: /test/insight-card-debug<br>
    Layout: default<br>
    Component: insight-card.html<br>
    CSS: Inline debugging styles
  </div>
  
  <div class="debug-section">
    <h2>Test 1: Basic Insight Card</h2>
    
    {% assign test_insight = site.insights | where: "lang", "en" | first %}
    
    <div class="debug-info">
      <strong>INSIGHT DATA:</strong><br>
      {% if test_insight %}
        Title: {{ test_insight.title }}<br>
        Ref: {{ test_insight.ref }}<br>
        Category: {{ test_insight.category }}<br>
        Hero Image: {{ test_insight.images.hero.name }}.{{ test_insight.images.hero.ext }}
      {% else %}
        ERROR: No insight found
      {% endif %}
    </div>
    
    <div style="border: 2px dashed #f59e0b; padding: 1rem; background: #fffbeb;">
      <strong>CARD OUTPUT:</strong>
      {% if test_insight %}
        {% include components/cards/insight-card.html insight=test_insight %}
      {% else %}
        <p style="color: #dc2626;">No insight data available for testing</p>
      {% endif %}
    </div>
  </div>
  
  <div class="debug-section">
    <h2>Test 2: Raw HTML Check</h2>
    
    <div class="debug-info">
      <strong>MANUAL HTML:</strong><br>
      Testing basic HTML structure
    </div>
    
    <div style="border: 2px dashed #10b981; padding: 1rem; background: #f0fdf4;">
      <article class="insight-card">
        <div class="insight-card__hero">
          <img src="/assets/images/insights/placeholder-insight.jpg" alt="Test" class="insight-card__hero-image">
        </div>
        <div class="insight-card__content">
          <span class="insight-card__category-badge">Test Category</span>
          <h3 class="insight-card__title">Manual Test Card</h3>
          <p class="insight-card__excerpt">This is a manually created card to test if the CSS is working properly.</p>
          <div class="insight-card__meta">
            <span>Test Date</span>
          </div>
        </div>
      </article>
    </div>
  </div>
  
  <div class="debug-section">
    <h2>Test 3: CSS Class Detection</h2>
    
    <div class="debug-info">
      <strong>CSS CHECK:</strong><br>
      Checking if insight-card classes are applied
    </div>
    
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.insight-card');
        const debugInfo = document.createElement('div');
        debugInfo.style.cssText = 'background: #fef3c7; padding: 1rem; margin: 1rem 0; border-radius: 0.5rem;';
        debugInfo.innerHTML = `
          <strong>JavaScript Debug:</strong><br>
          Found ${cards.length} elements with class 'insight-card'<br>
          ${cards.length > 0 ? 'CSS classes are being applied' : 'CSS classes NOT found'}
        `;
        document.querySelector('.debug-section:last-child').appendChild(debugInfo);
      });
    </script>
  </div>
</div>