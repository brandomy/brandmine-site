---
layout: default
title: Insight Category Testing
permalink: /test/insight-category-testing
lang: en
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
  
  .category-demo {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    align-items: center;
    padding: 1rem;
    background: white;
    border-radius: 8px;
    border: 1px solid var(--neutral-200);
  }
</style>

<div class="container">
  
  <h1>Insight Category Testing</h1>
  <p style="text-align: center; color: var(--neutral-600); margin-bottom: 2rem;">Standardized insight category badge component with data-driven approach and intelligent styling</p>

  <!-- Section 1: All Categories Overview -->
  <section class="test-section">
    <h2>All Categories Overview</h2>
    
    <div class="category-demo">
      {% include components/ui/insight-category.html category="brand_spotlight" %}
      {% include components/ui/insight-category.html category="founders_journey" %}
      {% include components/ui/insight-category.html category="location_intelligence" %}
      {% include components/ui/insight-category.html category="market_momentum" %}
    </div>
    
    <table class="specs-table">
      <thead>
        <tr>
          <th>Category</th>
          <th>Color</th>
          <th>Default Display</th>
          <th>Data Source</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Brand Spotlight</td>
          <td><span class="color-swatch" style="background: #fd7e14;"></span>#fd7e14 (Orange)</td>
          <td>{% include components/ui/insight-category.html category="brand_spotlight" %}</td>
          <td>_data/insights/en.yml</td>
        </tr>
        <tr>
          <td>Founder's Journey</td>
          <td><span class="color-swatch" style="background: #28a745;"></span>#28a745 (Green)</td>
          <td>{% include components/ui/insight-category.html category="founders_journey" %}</td>
          <td>_data/insights/en.yml</td>
        </tr>
        <tr>
          <td>Location Intelligence</td>
          <td><span class="color-swatch" style="background: #6f42c1;"></span>#6f42c1 (Purple)</td>
          <td>{% include components/ui/insight-category.html category="location_intelligence" %}</td>
          <td>_data/insights/en.yml</td>
        </tr>
        <tr>
          <td>Market Momentum</td>
          <td><span class="color-swatch" style="background: #28a745;"></span>#28a745 (Green)</td>
          <td>{% include components/ui/insight-category.html category="market_momentum" %}</td>
          <td>_data/insights/en.yml</td>
        </tr>
      </tbody>
    </table>
  </section>

  <!-- Section 2: Style Variants -->
  <section class="test-section">
    <h2>Style Variants</h2>
    
    <div class="test-showcase">
      
      <!-- Pill Variant (Default) -->
      <div class="test-variant">
        <h5>Pill Variant (Default)</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" variant="pill" %}
          {% include components/ui/insight-category.html category="founders_journey" variant="pill" %}
          {% include components/ui/insight-category.html category="location_intelligence" variant="pill" %}
          {% include components/ui/insight-category.html category="market_momentum" variant="pill" %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Usage:</strong> Default style for most contexts<br>
          <strong>Border Radius:</strong> 12px (rounded pill)<br>
          <strong>Background:</strong> Category color, white text
        </div>
      </div>
      
      <!-- Rectangular Variant -->
      <div class="test-variant">
        <h5>Rectangular Variant</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" variant="rectangular" %}
          {% include components/ui/insight-category.html category="founders_journey" variant="rectangular" %}
          {% include components/ui/insight-category.html category="location_intelligence" variant="rectangular" %}
          {% include components/ui/insight-category.html category="market_momentum" variant="rectangular" %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Usage:</strong> Bold emphasis, headers<br>
          <strong>Border Radius:</strong> 4px (subtle corners)<br>
          <strong>Font Weight:</strong> 600 (semibold)
        </div>
      </div>
      
      <!-- Minimal Variant -->
      <div class="test-variant">
        <h5>Minimal Variant</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" variant="minimal" %}
          {% include components/ui/insight-category.html category="founders_journey" variant="minimal" %}
          {% include components/ui/insight-category.html category="location_intelligence" variant="minimal" %}
          {% include components/ui/insight-category.html category="market_momentum" variant="minimal" %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Usage:</strong> Subtle contexts, secondary information<br>
          <strong>Background:</strong> Transparent with colored border<br>
          <strong>Text Color:</strong> Category color
        </div>
      </div>
      
      <!-- Compact Variant -->
      <div class="test-variant">
        <h5>Compact Variant</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" variant="compact" %}
          {% include components/ui/insight-category.html category="founders_journey" variant="compact" %}
          {% include components/ui/insight-category.html category="location_intelligence" variant="compact" %}
          {% include components/ui/insight-category.html category="market_momentum" variant="compact" %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Usage:</strong> Space-constrained areas, cards<br>
          <strong>Padding:</strong> 0.15rem 0.4rem (extra tight)<br>
          <strong>Font Weight:</strong> 600 (semibold)
        </div>
      </div>
      
    </div>
  </section>

  <!-- Section 3: Size Variants -->
  <section class="test-section">
    <h2>Size Variants</h2>
    
    <div class="test-showcase">
      
      <!-- Small Size -->
      <div class="test-variant">
        <h5>Small Size</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" size="sm" %}
          {% include components/ui/insight-category.html category="founders_journey" size="sm" %}
          {% include components/ui/insight-category.html category="location_intelligence" size="sm" %}
          {% include components/ui/insight-category.html category="market_momentum" size="sm" %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Font Size:</strong> 0.7rem<br>
          <strong>Padding:</strong> 0.2rem 0.5rem<br>
          <strong>Usage:</strong> Secondary contexts, metadata
        </div>
      </div>
      
      <!-- Medium Size (Default) -->
      <div class="test-variant">
        <h5>Medium Size (Default)</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" size="md" %}
          {% include components/ui/insight-category.html category="founders_journey" size="md" %}
          {% include components/ui/insight-category.html category="location_intelligence" size="md" %}
          {% include components/ui/insight-category.html category="market_momentum" size="md" %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Font Size:</strong> 0.75rem<br>
          <strong>Padding:</strong> 0.25rem 0.75rem<br>
          <strong>Usage:</strong> Standard contexts, cards
        </div>
      </div>
      
      <!-- Large Size -->
      <div class="test-variant">
        <h5>Large Size</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" size="lg" %}
          {% include components/ui/insight-category.html category="founders_journey" size="lg" %}
          {% include components/ui/insight-category.html category="location_intelligence" size="lg" %}
          {% include components/ui/insight-category.html category="market_momentum" size="lg" %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Font Size:</strong> 0.875rem<br>
          <strong>Padding:</strong> 0.5rem 1rem<br>
          <strong>Usage:</strong> Headers, hero sections
        </div>
      </div>
      
    </div>
  </section>

  <!-- Section 4: Icon Variants -->
  <section class="test-section">
    <h2>Icon Variants</h2>
    
    <div class="test-showcase">
      
      <!-- With Icons -->
      <div class="test-variant">
        <h5>With Icons</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" show_icon=true %}
          {% include components/ui/insight-category.html category="founders_journey" show_icon=true %}
          {% include components/ui/insight-category.html category="location_intelligence" show_icon=true %}
          {% include components/ui/insight-category.html category="market_momentum" show_icon=true %}
        </div>
        
        <div style="background: var(--primary-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs); border: 2px solid var(--primary-300);">
          <strong>Icon Source:</strong> components/icons/icon.html<br>
          <strong>Gap:</strong> 0.25rem between icon and text<br>
          <strong>Usage:</strong> When visual emphasis is needed
        </div>
      </div>
      
      <!-- Without Icons (Default) -->
      <div class="test-variant">
        <h5>Without Icons (Default)</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" show_icon=false %}
          {% include components/ui/insight-category.html category="founders_journey" show_icon=false %}
          {% include components/ui/insight-category.html category="location_intelligence" show_icon=false %}
          {% include components/ui/insight-category.html category="market_momentum" show_icon=false %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Space Efficiency:</strong> No icon placeholder spacing<br>
          <strong>Clean Layout:</strong> Text-only design<br>
          <strong>Usage:</strong> Most contexts, clean layouts
        </div>
      </div>
      
    </div>
    
    <div style="background: var(--accent-50); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0; border-left: 4px solid var(--accent-500);">
      <h4>🎯 Intelligent Icon Handling</h4>
      <p style="margin: 0; font-size: var(--text-sm); color: var(--neutral-700);">
        <strong>Key Feature:</strong> When <code>show_icon=false</code> (default), no gap or placeholder space is added. This ensures clean, efficient layouts without unnecessary spacing when icons aren't needed.
      </p>
    </div>
  </section>

  <!-- Section 5: Text Transform Options -->
  <section class="test-section">
    <h2>Text Transform Options</h2>
    
    <div class="test-showcase">
      
      <!-- Normal Case (Default) -->
      <div class="test-variant">
        <h5>Normal Case (Default)</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" uppercase=false %}
          {% include components/ui/insight-category.html category="founders_journey" uppercase=false %}
          {% include components/ui/insight-category.html category="location_intelligence" uppercase=false %}
          {% include components/ui/insight-category.html category="market_momentum" uppercase=false %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Transform:</strong> none<br>
          <strong>Letter Spacing:</strong> normal<br>
          <strong>Usage:</strong> Standard readability
        </div>
      </div>
      
      <!-- Uppercase -->
      <div class="test-variant">
        <h5>Uppercase</h5>
        <div class="category-demo">
          {% include components/ui/insight-category.html category="brand_spotlight" uppercase=true %}
          {% include components/ui/insight-category.html category="founders_journey" uppercase=true %}
          {% include components/ui/insight-category.html category="location_intelligence" uppercase=true %}
          {% include components/ui/insight-category.html category="market_momentum" uppercase=true %}
        </div>
        
        <div style="background: var(--neutral-100); padding: var(--space-3); border-radius: var(--radius-md); font-size: var(--text-xs);">
          <strong>Transform:</strong> uppercase<br>
          <strong>Letter Spacing:</strong> 0.025em (improved readability)<br>
          <strong>Usage:</strong> Headers, emphasis contexts
        </div>
      </div>
      
    </div>
  </section>

  <!-- Section 6: Implementation Examples -->
  <section class="test-section">
    <h2>Implementation Examples</h2>
    
    <div style="display: grid; grid-template-columns: 1fr; gap: var(--space-4);">
      
      <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md);">
        <h4>Basic Usage</h4>
        <pre><code>{% raw %}{% include components/ui/insight-category.html category="market_momentum" %}{% endraw %}</code></pre>
        <div style="margin: var(--space-2) 0;">
          {% include components/ui/insight-category.html category="market_momentum" %}
        </div>
      </div>
      
      <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md);">
        <h4>With Icon and Custom Variant</h4>
        <pre><code>{% raw %}{% include components/ui/insight-category.html 
   category="brand_spotlight" 
   variant="rectangular" 
   show_icon=true 
   size="lg" %}{% endraw %}</code></pre>
        <div style="margin: var(--space-2) 0;">
          {% include components/ui/insight-category.html category="brand_spotlight" variant="rectangular" show_icon=true size="lg" %}
        </div>
      </div>
      
      <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md);">
        <h4>Compact for Cards</h4>
        <pre><code>{% raw %}{% include components/ui/insight-category.html 
   category="founders_journey" 
   variant="compact" 
   size="sm" %}{% endraw %}</code></pre>
        <div style="margin: var(--space-2) 0;">
          {% include components/ui/insight-category.html category="founders_journey" variant="compact" size="sm" %}
        </div>
      </div>
      
      <div style="background: var(--neutral-100); padding: var(--space-4); border-radius: var(--radius-md);">
        <h4>Minimal for Subtle Contexts</h4>
        <pre><code>{% raw %}{% include components/ui/insight-category.html 
   category="location_intelligence" 
   variant="minimal" 
   uppercase=true %}{% endraw %}</code></pre>
        <div style="margin: var(--space-2) 0;">
          {% include components/ui/insight-category.html category="location_intelligence" variant="minimal" uppercase=true %}
        </div>
      </div>
      
    </div>
  </section>

  <!-- Section 7: Component Features -->
  <section class="test-section">
    <h2>Component Features</h2>
    
    <div style="background: var(--primary-50); padding: var(--space-4); border-radius: var(--radius-md); margin: var(--space-4) 0; border: 2px solid var(--primary-200);">
      <h4>✨ Key Features</h4>
      <ul style="margin: 0; padding-left: var(--space-4);">
        <li><strong>Data-Driven:</strong> Category names and colors from _data/insights/{lang}.yml</li>
        <li><strong>Multilingual:</strong> Automatic language support</li>
        <li><strong>Intelligent Icons:</strong> No spacing when icons disabled</li>
        <li><strong>Flexible Variants:</strong> 4 style variants for different contexts</li>
        <li><strong>Responsive Sizing:</strong> 3 size options (sm, md, lg)</li>
        <li><strong>Standardized Colors:</strong> Consistent across all variants</li>
        <li><strong>Self-Contained:</strong> Inline styles for easy adjustment</li>
        <li><strong>Fallback Support:</strong> Graceful handling of unknown categories</li>
      </ul>
    </div>
    
    <table class="specs-table">
      <thead>
        <tr>
          <th>Parameter</th>
          <th>Type</th>
          <th>Default</th>
          <th>Options</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>category</td>
          <td>String (required)</td>
          <td>-</td>
          <td>brand_spotlight, founders_journey, location_intelligence, market_momentum</td>
        </tr>
        <tr>
          <td>variant</td>
          <td>String</td>
          <td>pill</td>
          <td>pill, rectangular, minimal, compact</td>
        </tr>
        <tr>
          <td>show_icon</td>
          <td>Boolean</td>
          <td>false</td>
          <td>true, false</td>
        </tr>
        <tr>
          <td>size</td>
          <td>String</td>
          <td>md</td>
          <td>sm, md, lg</td>
        </tr>
        <tr>
          <td>uppercase</td>
          <td>Boolean</td>
          <td>false</td>
          <td>true, false</td>
        </tr>
        <tr>
          <td>lang</td>
          <td>String</td>
          <td>page.lang</td>
          <td>en, ru, zh</td>
        </tr>
      </tbody>
    </table>
  </section>

</div>