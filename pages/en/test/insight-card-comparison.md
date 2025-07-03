---
layout: default
title: Insight Card Comparison - Latest vs 1C Featured
permalink: /test/insight-card-comparison
lang: en
---

<style>
  .comparison-container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 2rem;
  }
  
  .comparison-header {
    text-align: center;
    margin-bottom: 3rem;
    padding: 2rem;
    background: #fef3c7;
    border: 2px solid #f59e0b;
    border-radius: 0.5rem;
  }
  
  .comparison-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 3rem;
    margin-bottom: 3rem;
  }
  
  .comparison-section {
    background: white;
    border: 2px solid #e5e7eb;
    border-radius: 0.5rem;
    padding: 2rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }
  
  .comparison-section h3 {
    margin-bottom: 1rem;
    text-align: center;
    color: #000000;
    font-weight: bold;
  }
  
  .analysis-section {
    background: #eff6ff;
    border: 2px solid #3b82f6;
    border-radius: 0.5rem;
    padding: 2rem;
    margin-top: 3rem;
  }
  
  .analysis-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-top: 1.5rem;
  }
  
  .analysis-item {
    background: white;
    padding: 1.5rem;
    border-radius: 0.375rem;
    border-left: 4px solid #3b82f6;
  }
  
  .analysis-item h5 {
    margin-bottom: 0.75rem;
    color: #1e40af;
  }
  
  .analysis-item ul {
    margin: 0;
    padding-left: 1rem;
    font-size: 0.875rem;
    line-height: 1.5;
  }
  
  .analysis-item li {
    margin-bottom: 0.5rem;
  }
  
  /* Mobile responsive */
  @media (max-width: 768px) {
    .analysis-grid {
      grid-template-columns: 1fr;
    }
  }
  
  /* Override latest insights styling for comparison */
  .latest-insights__container {
    display: grid !important;
    grid-template-columns: repeat(2, 1fr) !important;
    gap: 1.5rem !important;
    max-width: 100% !important;
  }
  
  /* Center the View All Insights button */
  .latest-insights__footer {
    text-align: center !important;
    margin-top: 2rem !important;
  }
  
  /* Ensure cards fit in comparison containers */
  .insight-latest-card,
  .insight-card--featured {
    max-width: 100% !important;
    width: 100% !important;
  }
  
  .warning-notice {
    background: #fecaca;
    border: 2px solid #ef4444;
    color: #991b1b;
    padding: 1rem;
    border-radius: 0.5rem;
    margin-bottom: 2rem;
    text-align: center;
    font-weight: bold;
  }
</style>

<div class="comparison-container">
  <div class="comparison-header">
    <h1>🔬 Insight Card Component Comparison</h1>
    <p><strong>Testing:</strong> insight-card-latest.html vs insight-card.html variant="featured"</p>
    <p style="color: #92400e; font-size: 0.875rem; margin-top: 1rem;">
      Comparing visual appearance, typography, layout, and behavior for potential component consolidation
    </p>
  </div>
  
  <div class="warning-notice">
    ⚠️ This is a staging test page. Changes here do not affect the live homepage.
  </div>

  <div class="comparison-grid">
    <!-- Production Version (Current) -->
    <div class="comparison-section">
      <h3>Production: insight-card-latest.html</h3>
      <p style="font-size: 0.875rem; color: #6b7280; margin-bottom: 2rem; text-align: center;">
        Current homepage implementation
      </p>
      
      <!-- Production Latest Insights Section -->
      {% include pages/home/latest-insights.html title="Production Version" %}
    </div>
    
    <!-- Test Version (1C Featured) -->
    <div class="comparison-section">
      <h3>Test: insight-card.html variant="featured"</h3>
      <p style="font-size: 0.875rem; color: #6b7280; margin-bottom: 2rem; text-align: center;">
        Proposed replacement using unified component system
      </p>
      
      <!-- Test Latest Insights Section -->
      {% include pages/home/latest-insights-test-1c.html title="Test Version (1C)" %}
    </div>
  </div>
  
  <!-- Detailed Analysis Section -->
  <div class="analysis-section">
    <h2 style="text-align: center; margin-bottom: 1rem; color: #1e40af;">📊 Detailed Comparison Analysis</h2>
    <p style="text-align: center; color: #475569; margin-bottom: 2rem;">
      Compare the visual and functional differences between the two implementations
    </p>
    
    <div class="analysis-grid">
      <!-- Typography Analysis -->
      <div class="analysis-item">
        <h5>📝 Typography Hierarchy</h5>
        <ul>
          <li><strong>Title:</strong> Compare font sizes, weights, line heights</li>
          <li><strong>Meta info:</strong> Date/time positioning and styling</li>
          <li><strong>Category badges:</strong> Background colors and text treatment</li>
          <li><strong>Description:</strong> Text clamping and alignment</li>
          <li><strong>CTA links:</strong> "Read More" button styling</li>
        </ul>
      </div>
      
      <!-- Layout Analysis -->
      <div class="analysis-item">
        <h5>📐 Layout & Positioning</h5>
        <ul>
          <li><strong>Text alignment:</strong> Center vs left alignment check</li>
          <li><strong>Element spacing:</strong> Padding and margin consistency</li>
          <li><strong>Category badge position:</strong> Overlay vs inline placement</li>
          <li><strong>Meta ordering:</strong> Date above/below title</li>
          <li><strong>Image aspect ratio:</strong> Hero image treatment</li>
        </ul>
      </div>
      
      <!-- Visual Styling -->
      <div class="analysis-item">
        <h5>🎨 Visual Styling</h5>
        <ul>
          <li><strong>Border radius:</strong> Both use var(--radius-xl) = 24px</li>
          <li><strong>Box shadows:</strong> Shadow depth and color</li>
          <li><strong>Hover effects:</strong> Transform and transition behavior</li>
          <li><strong>Color scheme:</strong> Background and text colors</li>
          <li><strong>Card dimensions:</strong> Width and height consistency</li>
        </ul>
      </div>
      
      <!-- Technical Implementation -->
      <div class="analysis-item">
        <h5>⚙️ Technical Implementation</h5>
        <ul>
          <li><strong>CSS classes:</strong> BEM naming convention differences</li>
          <li><strong>File size:</strong> Component code complexity</li>
          <li><strong>Maintainability:</strong> Single vs multiple components</li>
          <li><strong>Performance:</strong> Render time and CSS load</li>
          <li><strong>Grid behavior:</strong> 2x2 homepage layout compatibility</li>
        </ul>
      </div>
    </div>
    
    <!-- Quick Visual Checklist -->
    <div style="background: white; padding: 1.5rem; border-radius: 0.375rem; margin-top: 2rem; border: 2px solid #22c55e;">
      <h4 style="color: #15803d; margin-bottom: 1rem;">✅ Visual Inspection Checklist</h4>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1rem;">
        <div>
          <strong>Category Badges:</strong><br>
          □ Same background colors<br>
          □ Same text styling<br>
          □ Same positioning
        </div>
        <div>
          <strong>Typography:</strong><br>
          □ Title hierarchy match<br>
          □ Meta info consistency<br>
          □ Text alignment identical
        </div>
        <div>
          <strong>Layout:</strong><br>
          □ Card dimensions match<br>
          □ Spacing consistency<br>
          □ Grid behavior identical
        </div>
        <div>
          <strong>Interactive:</strong><br>
          □ Hover effects similar<br>
          □ Link behavior consistent<br>
          □ Touch targets appropriate
        </div>
      </div>
    </div>
  </div>
  
  <!-- Instructions -->
  <div style="background: #f8fafc; border: 2px solid #64748b; border-radius: 0.5rem; padding: 2rem; margin-top: 3rem;">
    <h3 style="color: #334155; margin-bottom: 1rem;">🔍 How to Use This Comparison</h3>
    <ol style="color: #475569; line-height: 1.6;">
      <li><strong>Visual Inspection:</strong> Compare the two sections side-by-side for visual differences</li>
      <li><strong>Responsive Testing:</strong> Resize browser window to test mobile/desktop behavior</li>
      <li><strong>Browser DevTools:</strong> Inspect CSS classes, computed styles, and box model</li>
      <li><strong>Interaction Testing:</strong> Test hover effects, link behavior, and touch interactions</li>
      <li><strong>Performance Check:</strong> Monitor render times and CSS load impact</li>
    </ol>
    
    <div style="margin-top: 1.5rem; padding: 1rem; background: #dbeafe; border-radius: 0.375rem;">
      <strong style="color: #1e40af;">Next Steps:</strong> If visual parity is achieved, we can safely replace insight-card-latest.html with the unified variant system for better maintainability.
    </div>
  </div>
</div>