---
layout: default
title: Dimension Tag Cloud Testing
permalink: /test/dimension-tag-cloud-testing
lang: en

# Test data for dimension tag cloud testing
test_brand:
  sectors: ["wine", "artisanal-spirits"]
  markets: ["russia"]
  attributes: ["founder-led", "heritage-brand"]
  signals: ["export-ready", "rapid-growth"]

test_insight:
  sectors: ["natural-beauty"]
  markets: ["china", "brazil"]
  attributes: ["sustainability-pioneer"]
  signals: ["market-leader"]

test_minimal:
  sectors: ["gourmet-foods"]
  markets: ["india"]
  
test_extensive:
  sectors: ["wine", "natural-beauty", "honey-bee-products"]
  markets: ["russia", "china", "brazil", "south-africa"]
  attributes: ["founder-led", "heritage-brand", "sustainability-pioneer", "artisanal-excellence"]
  signals: ["export-ready", "rapid-growth", "franchise-ready", "investment-seeking"]
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
  
  <h1>Dimension Tag Cloud Testing</h1>
  <p style="text-align: center; color: var(--neutral-600); margin-bottom: 2rem;">Visual testing and specs for dimension tag cloud component variants</p>

  <!-- Section 1: Base Component -->
  <section class="test-section">
    <h2>Base Component - Standard Variant</h2>
    
    <div class="test-variant">
      <h5>Standard (Default)</h5>
      {% include components/ui/dimension-tag-cloud.html parent=page.test_brand variant="standard" %}
    </div>
    
    <!-- Specifications Table -->
    <table class="specs-table">
      <thead>
        <tr>
          <th>Property</th>
          <th>Value</th>
          <th>CSS Variable</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Font Size</td>
          <td>12px</td>
          <td><code>var(--text-xs)</code></td>
        </tr>
        <tr>
          <td>Font Weight</td>
          <td>500</td>
          <td><code>var(--font-medium)</code></td>
        </tr>
        <tr>
          <td>Border Radius</td>
          <td>4px</td>
          <td><code>var(--radius-sm)</code></td>
        </tr>
        <tr>
          <td>Padding</td>
          <td>2px 8px</td>
          <td><code>calc(var(--space-1) / 2) var(--space-2)</code></td>
        </tr>
        <tr>
          <td>Gap</td>
          <td>8px</td>
          <td><code>var(--space-2)</code></td>
        </tr>
      </tbody>
    </table>
  </section>

  <!-- Section 2: Variants Comparison -->
  <section class="test-section">
    <h2>Variant Comparison</h2>
    
    <div class="test-showcase">
      
      <!-- 1B: Compact Variant -->
      <div class="test-variant">
        <h5>1B: Compact</h5>
        {% include components/ui/dimension-tag-cloud.html parent=page.test_brand variant="compact" limit=3 %}
        <div style="font-size: var(--text-xs); color: var(--neutral-600); margin-top: var(--space-2);">
          <strong>Changes:</strong> Smaller padding, tighter spacing, smaller font
        </div>
      </div>
      
      <!-- 1C: Case Study Variant -->
      <div class="test-variant">
        <h5>1C: Case Study</h5>
        {% include components/ui/dimension-tag-cloud.html parent=page.test_insight variant="case-study" %}
        <div style="font-size: var(--text-xs); color: var(--neutral-600); margin-top: var(--space-2);">
          <strong>Changes:</strong> Bold font (600), medium radius, no border
        </div>
      </div>
      
      <!-- 1D: Large Variant -->
      <div class="test-variant">
        <h5>1D: Large</h5>
        {% include components/ui/dimension-tag-cloud.html parent=page.test_extensive variant="large" limit=6 %}
        <div style="font-size: var(--text-xs); color: var(--neutral-600); margin-top: var(--space-2);">
          <strong>Changes:</strong> Larger padding, semibold font, enhanced visibility
        </div>
      </div>
      
      <!-- 1E: Inline Variant -->
      <div class="test-variant">
        <h5>1E: Inline</h5>
        {% include components/ui/dimension-tag-cloud.html parent=page.test_minimal variant="inline" %}
        <div style="font-size: var(--text-xs); color: var(--neutral-600); margin-top: var(--space-2);">
          <strong>Changes:</strong> No wrapping, horizontal scroll, minimal design
        </div>
      </div>
      
    </div>
  </section>

  <!-- Section 3: Color System -->
  <section class="test-section">
    <h2>Color System Reference</h2>
    
    <table class="specs-table">
      <thead>
        <tr>
          <th>Dimension Type</th>
          <th>Background</th>
          <th>Text Color</th>
          <th>Border (Hover)</th>
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
          <td><code>var(--sky-200)</code></td>
        </tr>
        <tr>
          <td>
            <span class="color-swatch" style="background: var(--olive-100);"></span>
            Sectors
          </td>
          <td><code>var(--olive-100)</code></td>
          <td><code>var(--olive-800)</code></td>
          <td><code>var(--olive-200)</code></td>
        </tr>
        <tr>
          <td>
            <span class="color-swatch" style="background: var(--secondary-100);"></span>
            Attributes
          </td>
          <td><code>var(--secondary-100)</code></td>
          <td><code>var(--secondary-800)</code></td>
          <td><code>var(--secondary-200)</code></td>
        </tr>
        <tr>
          <td>
            <span class="color-swatch" style="background: var(--accent-100);"></span>
            Signals
          </td>
          <td><code>var(--accent-100)</code></td>
          <td><code>var(--accent-800)</code></td>
          <td><code>var(--accent-200)</code></td>
        </tr>
      </tbody>
    </table>
  </section>

  <!-- Section 4: Spacing Options -->
  <section class="test-section">
    <h2>Spacing Options</h2>
    
    <div class="test-showcase">
      
      <div class="test-variant">
        <h5>Tight Spacing</h5>
        {% include components/ui/dimension-tag-cloud.html parent=page.test_brand spacing="tight" %}
        <div style="font-size: var(--text-xs); color: var(--neutral-600); margin-top: var(--space-2);">
          <strong>Gap:</strong> <code>var(--space-1)</code> (4px)
        </div>
      </div>
      
      <div class="test-variant">
        <h5>Normal Spacing (Default)</h5>
        {% include components/ui/dimension-tag-cloud.html parent=page.test_brand spacing="normal" %}
        <div style="font-size: var(--text-xs); color: var(--neutral-600); margin-top: var(--space-2);">
          <strong>Gap:</strong> <code>var(--space-2)</code> (8px)
        </div>
      </div>
      
      <div class="test-variant">
        <h5>Loose Spacing</h5>
        {% include components/ui/dimension-tag-cloud.html parent=page.test_brand spacing="loose" %}
        <div style="font-size: var(--text-xs); color: var(--neutral-600); margin-top: var(--space-2);">
          <strong>Gap:</strong> <code>var(--space-3)</code> (12px)
        </div>
      </div>
      
    </div>
  </section>

  <!-- Section 5: Usage Examples -->
  <section class="test-section">
    <h2>Usage Examples</h2>
    
    <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0;">
      <h4>Brand Cards</h4>
      <pre><code>{% raw %}{% include components/ui/dimension-tag-cloud.html 
   parent=brand 
   variant="standard" 
   limit=4 %}{% endraw %}</code></pre>
    </div>
    
    <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0;">
      <h4>Case Studies</h4>
      <pre><code>{% raw %}{% include components/ui/dimension-tag-cloud.html 
   parent=case_study 
   variant="case-study" 
   spacing="normal" %}{% endraw %}</code></pre>
    </div>
    
    <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0;">
      <h4>Insight Articles</h4>
      <pre><code>{% raw %}{% include components/ui/dimension-tag-cloud.html 
   parent=insight 
   variant="large" 
   show_all=true %}{% endraw %}</code></pre>
    </div>
  </section>

</div>