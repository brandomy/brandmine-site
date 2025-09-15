---
layout: default
title: Insight Tag Testing
permalink: /test/insight-tag-testing
lang: en

# Test data for insight tag testing
test_insight_minimal:
  sectors: ["wine"]
  markets: ["russia"]
  attributes: ["founder-led"]
  signals: ["export-ready"]

test_insight_moderate:
  sectors: ["natural-beauty", "honey-bee-products"]
  markets: ["china", "brazil"]
  attributes: ["sustainability-pioneer", "heritage-brand"]
  signals: ["franchise-ready", "rapid-growth"]

test_insight_extensive:
  sectors: ["wine", "natural-beauty", "honey-bee-products", "artisanal-spirits"]
  markets: ["russia", "china", "brazil", "south-africa", "india"]
  attributes: ["founder-led", "heritage-brand", "sustainability-pioneer", "artisanal-excellence"]
  signals: ["export-ready", "rapid-growth", "franchise-ready", "investment-ready"]
---

<style>
  .test-section {
    padding: 2rem 0;
    border-bottom: 2px solid var(--neutral-200);
  }
  
  .test-variant {
    display: flex;
    flex-direction: column;
    gap: var(--space-3);
    margin: var(--space-4) 0;
    padding: var(--space-4);
    background: var(--neutral-50);
    border-radius: var(--radius-lg);
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
  
  .test-showcase {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: var(--space-6);
    margin: var(--space-6) 0;
  }
  
  .specs-table {
    width: 100%;
    border-collapse: collapse;
    margin: var(--space-4) 0;
  }
  
  .specs-table th,
  .specs-table td {
    padding: var(--space-2);
    border: 1px solid var(--neutral-300);
    text-align: left;
    font-size: var(--text-sm);
  }
  
  .specs-table th {
    background: var(--neutral-100);
    font-weight: var(--font-semibold);
  }
  
  .color-swatch {
    display: inline-block;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    margin-right: var(--space-1);
    vertical-align: middle;
  }
</style>

<div class="container">
  
  <h1>Insight Tag Testing</h1>
  <p style="text-align: center; color: var(--neutral-600); margin-bottom: 2rem;">Visual testing and specs for insight card dimension tag styling as used in standard insight-card.html</p>

  <!-- Section 1: Insight Card Tag Implementation -->
  <section class="test-section">
    <h2>Insight Card Tag Implementation</h2>
    
    <div class="test-showcase">
      
      <!-- 1A: Standard Insight Card Tags -->
      <div class="test-variant">
        <h5>1A: Standard Insight Card Tags</h5>
        {% include components/ui/dimension-tag-cloud.html 
           parent=page.test_insight_minimal
           limit=1
           class_prefix="insight-card-tags"
           spacing="tight" %}
        
        <!-- Specifications Box -->
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); margin-top: var(--space-3); font-size: var(--text-xs); line-height: 1.4;">
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-2);">
            <div>
              <strong>Class Prefix:</strong> insight-card-tags<br>
              <strong>Spacing:</strong> tight<br>
              <strong>Limit:</strong> 1 tag per dimension type
            </div>
            <div>
              <strong>Usage Context:</strong> Inside insight cards<br>
              <strong>Layout:</strong> Flex wrap<br>
              <strong>Purpose:</strong> Minimal dimension display
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1B: Moderate Content -->
      <div class="test-variant">
        <h5>1B: Moderate Content (2 tags)</h5>
        {% include components/ui/dimension-tag-cloud.html 
           parent=page.test_insight_moderate
           limit=2
           class_prefix="insight-card-tags"
           spacing="tight" %}
        
        <!-- Specifications Box -->
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); margin-top: var(--space-3); font-size: var(--text-xs); line-height: 1.4;">
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-2);">
            <div>
              <strong>Class Prefix:</strong> insight-card-tags<br>
              <strong>Spacing:</strong> tight<br>
              <strong>Limit:</strong> 2 tags per dimension type
            </div>
            <div>
              <strong>Display Pattern:</strong> Shows more variety<br>
              <strong>Overflow:</strong> Truncated after limit<br>
              <strong>Visual Balance:</strong> Optimized for cards
            </div>
          </div>
        </div>
      </div>
      
      <!-- 1C: Show All Tags -->
      <div class="test-variant">
        <h5>1C: Show All Tags (No Limit)</h5>
        {% include components/ui/dimension-tag-cloud.html 
           parent=page.test_insight_extensive
           show_all=true
           class_prefix="insight-card-tags"
           spacing="tight" %}
        
        <!-- Specifications Box -->
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); margin-top: var(--space-3); font-size: var(--text-xs); line-height: 1.4;">
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-2);">
            <div>
              <strong>Class Prefix:</strong> insight-card-tags<br>
              <strong>Spacing:</strong> tight<br>
              <strong>Show All:</strong> true (no limits)
            </div>
            <div>
              <strong>Use Case:</strong> Full taxonomy display<br>
              <strong>Layout:</strong> May wrap multiple lines<br>
              <strong>Density:</strong> High information density
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </section>

  <!-- Section 2: Styling Specifications -->
  <section class="test-section">
    <h2>Styling Specifications</h2>
    
    <!-- Comprehensive Specifications Table -->
    <table class="specs-table">
      <thead>
        <tr>
          <th>Property</th>
          <th>Insight Card Tags (1A)</th>
          <th>CSS Variable/Value</th>
          <th>Notes</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Class Prefix</td>
          <td>insight-card-tags</td>
          <td>Custom prefix for insight cards</td>
          <td>Allows independent styling</td>
        </tr>
        <tr>
          <td>Spacing</td>
          <td>tight</td>
          <td>var(--space-1) (4px gaps)</td>
          <td>Compact for card layouts</td>
        </tr>
        <tr>
          <td>Tag Limit</td>
          <td>1 per dimension type</td>
          <td>limit=1</td>
          <td>Minimal display priority</td>
        </tr>
        <tr>
          <td>Font Size</td>
          <td>Small</td>
          <td>Inherited from tag cloud component</td>
          <td>var(--text-xs) typically</td>
        </tr>
        <tr>
          <td>Border Radius</td>
          <td>Small</td>
          <td>var(--radius-sm)</td>
          <td>Subtle rounded corners</td>
        </tr>
      </tbody>
    </table>
  </section>

  <!-- Section 3: Color System Reference -->
  <section class="test-section">
    <h2>Color System Reference</h2>
    
    <table class="specs-table">
      <thead>
        <tr>
          <th>Dimension Type</th>
          <th>Background</th>
          <th>Text Color</th>
          <th>Sample Tag</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <span class="color-swatch" style="background: var(--sky-100);"></span>
            Markets
          </td>
          <td><code>var(--sky-100)</code></td>
          <td><code>var(--sky-800)</code></td>
          <td><span style="background: var(--sky-100); color: var(--sky-800); padding: 2px 6px; border-radius: 4px; font-size: 0.75rem;">Russia</span></td>
        </tr>
        <tr>
          <td>
            <span class="color-swatch" style="background: var(--olive-100);"></span>
            Sectors
          </td>
          <td><code>var(--olive-100)</code></td>
          <td><code>var(--olive-800)</code></td>
          <td><span style="background: var(--olive-100); color: var(--olive-800); padding: 2px 6px; border-radius: 4px; font-size: 0.75rem;">Wine</span></td>
        </tr>
        <tr>
          <td>
            <span class="color-swatch" style="background: var(--secondary-100);"></span>
            Attributes
          </td>
          <td><code>var(--secondary-100)</code></td>
          <td><code>var(--secondary-800)</code></td>
          <td><span style="background: var(--secondary-100); color: var(--secondary-800); padding: 2px 6px; border-radius: 4px; font-size: 0.75rem;">Founder Led</span></td>
        </tr>
        <tr>
          <td>
            <span class="color-swatch" style="background: var(--accent-100);"></span>
            Signals
          </td>
          <td><code>var(--accent-100)</code></td>
          <td><code>var(--accent-800)</code></td>
          <td><span style="background: var(--accent-100); color: var(--accent-800); padding: 2px 6px; border-radius: 4px; font-size: 0.75rem;">Export Ready</span></td>
        </tr>
      </tbody>
    </table>
  </section>

  <!-- Section 4: Implementation Context -->
  <section class="test-section">
    <h2>Implementation Context</h2>
    
    <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0;">
      <h4>Standard Insight Card Implementation</h4>
      <pre><code>{% raw %}<!-- Dimension Tags (Using unified component) -->
{% include components/ui/dimension-tag-cloud.html 
   parent=include.insight
   limit=1
   class_prefix="insight-card-tags"
   spacing="tight" %}{% endraw %}</code></pre>
      
      <div style="margin-top: var(--space-3); font-size: var(--text-sm); color: var(--neutral-700);">
        <strong>Usage:</strong> This exact implementation is used in the "tagged" variant of insight-card.html to display dimension tags within insight cards. The tight spacing and limit=1 ensures minimal, clean display suitable for card layouts.
      </div>
    </div>
    
    <div style="background: var(--accent-50); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0; border-left: 4px solid var(--accent-500);">
      <h4>Design Principles</h4>
      <ul style="margin: 0; padding-left: var(--space-4);">
        <li><strong>Minimal Display:</strong> Only 1 tag per dimension type to avoid cluttering cards</li>
        <li><strong>Tight Spacing:</strong> Compact gaps (4px) optimize for limited card space</li>
        <li><strong>Consistent Colors:</strong> Uses established dimension color system</li>
        <li><strong>Custom Prefix:</strong> "insight-card-tags" allows independent styling if needed</li>
        <li><strong>Flexible Limits:</strong> Can be adjusted for different card contexts</li>
      </ul>
    </div>
  </section>

  <!-- Section 5: Comparison with Other Tag Variants -->
  <section class="test-section">
    <h2>Comparison with Other Tag Variants</h2>
    
    <div class="test-showcase">
      
      <div class="test-variant">
        <h5>Standard Dimension Tags</h5>
        {% include components/ui/dimension-tag-cloud.html 
           parent=page.test_insight_minimal
           variant="standard" %}
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); margin-top: var(--space-3); font-size: var(--text-xs);">
          <strong>Context:</strong> General use (brand cards, discovery pages)<br>
          <strong>Spacing:</strong> Normal (8px gaps)<br>
          <strong>Size:</strong> Standard sizing
        </div>
      </div>
      
      <div class="test-variant">
        <h5>Case Study Tags</h5>
        {% include components/ui/dimension-tag-cloud.html 
           parent=page.test_insight_minimal
           variant="case-study" %}
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); margin-top: var(--space-3); font-size: var(--text-xs);">
          <strong>Context:</strong> Premium displays (case studies)<br>
          <strong>Spacing:</strong> Normal (8px gaps)<br>
          <strong>Size:</strong> Larger, bolder styling
        </div>
      </div>
      
      <div class="test-variant">
        <h5>Insight Card Tags (This Implementation)</h5>
        {% include components/ui/dimension-tag-cloud.html 
           parent=page.test_insight_minimal
           limit=1
           class_prefix="insight-card-tags"
           spacing="tight" %}
        
        <div style="background: var(--primary-100); padding: var(--space-3); border-radius: var(--radius-md); margin-top: var(--space-3); font-size: var(--text-xs); border: 2px solid var(--primary-300);">
          <strong>Context:</strong> Inside insight cards<br>
          <strong>Spacing:</strong> Tight (4px gaps)<br>
          <strong>Limit:</strong> 1 per type for minimal display
        </div>
      </div>
      
    </div>
  </section>

</div>