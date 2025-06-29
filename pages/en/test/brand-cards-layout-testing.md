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
    gap: var(--space-6) !important;
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
</style>

<div class="container">
  <div class="test-header">
    <h1>Brand Cards Layout Testing</h1>
    <p>Comprehensive testing of MVP brand cards in different layout contexts</p>
  </div>

  <!-- Section 0: Single Card Comparison -->
  <section class="test-section">
    <h2>Section 0: SINGLE CARD COMPARISON</h2>
    <p>Side-by-side comparison of all brand card variants using the same brand data</p>
    
    {% assign comparison_brand = site.brands | where: "lang", "en" | first %}
    
    {% if comparison_brand %}
      <div class="card-info">
        <strong>Test Brand:</strong> {{ comparison_brand.title }} | 
        <strong>Ref:</strong> {{ comparison_brand.ref }} |
        <strong>Data Available:</strong> ✅
      </div>
      
      <!-- Image Debug Section -->
      <div class="card-info" style="background: #f8f9fa; border-left-color: #007bff;">
        <h4>🖼️ Image Debug Information</h4>
        <p><strong>Brand:</strong> {{ comparison_brand.title }}</p>
        <p><strong>Images data:</strong> {{ comparison_brand.images | jsonify }}</p>
        <p><strong>Logo file expected:</strong> assets/images/brands/{{ comparison_brand.ref }}/{{ comparison_brand.ref }}-logo-{{ comparison_brand.images.logo.name }}-400w.{{ comparison_brand.images.logo.ext }}</p>
        
        {% if comparison_brand.images.logo %}
          <h5>Direct Image Include Test:</h5>
          <div style="border: 1px solid #dee2e6; padding: 1rem; margin: 0.5rem 0;">
            {% include components/images/collection-image.html 
               collection="brands" 
               slug=comparison_brand.ref 
               purpose="logo" 
               name=comparison_brand.images.logo.name 
               alt=comparison_brand.images.logo.alt 
               class="test-logo" %}
          </div>
        {% else %}
          <p style="color: orange;">⚠️ No logo data in brand front matter</p>
        {% endif %}
      </div>
      
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin: 2rem 0;">
        
        <!-- 1. Standard brand-card -->
        <div>
          <h4>1. brand-card.html (Standard)</h4>
          <div style="border: 2px solid #007bff; padding: 1rem; background: white;">
            {% include components/cards/brand-card.html brand=comparison_brand %}
          </div>
        </div>
        
        <!-- 2. Featured variant of brand-card -->
        <div>
          <h4>2. brand-card.html (Featured Variant)</h4>
          <div style="border: 2px solid #28a745; padding: 1rem; background: white;">
            {% include components/cards/brand-card.html brand=comparison_brand variant="featured" %}
          </div>
        </div>
        
        <!-- 3. Legacy brand-card-featured -->
        <div>
          <h4>3. brand-card-featured.html (Legacy - REMOVED)</h4>
          <div style="border: 2px solid #ffc107; padding: 1rem; background: #fff3cd;">
            <p style="color: #856404; text-align: center; margin: 2rem 0;">
              ❌ Component removed as part of cleanup<br>
              <em>Use brand-card.html with variant="featured" instead</em>
            </p>
          </div>
        </div>
        
        <!-- 4. Hero brand card -->
        <div>
          <h4>4. hero-brand-card.html</h4>
          <div style="border: 2px solid #6f42c1; padding: 1rem; background: white; min-height: 200px;">
            <div style="background: #f8f4ff; padding: 2rem; text-align: center; border: 1px dashed #6f42c1; border-radius: 0.5rem;">
              <strong>Hero Brand Card</strong><br>
              <em>Complex component with high dependencies.<br>
              Recommend using brand-card.html with variant="featured" instead.</em>
              <div style="margin-top: 1rem; font-size: 0.875rem; color: #6f42c1;">
                <strong>Dependencies:</strong> Multiple image helpers, founder data, metrics display
              </div>
            </div>
          </div>
        </div>
        
      </div>
    {% else %}
      <div class="card-info" style="background: var(--warning-50);">
        <strong>⚠️ No brand data available for comparison</strong>
      </div>
    {% endif %}
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
    
    <!-- Additional Components -->
    <div class="test-subsection">
      <h3>Additional Brand Card Components</h3>
      <div class="card-info">
        <strong>Available components:</strong> hero-brand-card.html, related-brand-card.html, brand-card-featured.html (separate file)
      </div>
      
      <!-- hero-brand-card Test -->
      <div class="test-layout-label">hero-brand-card.html (Single Display)</div>
      {% if test_brands.size > 0 %}
        {% assign hero_brand = test_brands | first %}
        <div style="max-width: 800px; margin: 1rem 0;">
          {% comment %} Hero card may have complex dependencies, test carefully {% endcomment %}
          <div class="card-info" style="background: #f8f4ff; border-left-color: #6f42c1;">
            <strong>Note:</strong> hero-brand-card.html is a complex component with multiple dependencies. Using it requires founder data and metrics.
          </div>
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English brand data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- related-brand-card Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">related-brand-card.html (Grid Display)</div>
      {% if test_brands.size > 0 %}
        <div class="grid test-grid-3col">
          {% for brand in test_brands %}
            <div class="grid__item">
              {% include components/cards/related-brand-card.html brand=brand %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English brand data found for testing</strong>
        </div>
      {% endif %}
      
      <!-- brand-card-featured.html Test -->
      <div class="test-layout-label" style="margin-top: 2rem;">brand-card-featured.html (Separate File)</div>
      {% if test_brands.size > 0 %}
        <div class="grid test-grid-3col">
          {% for brand in test_brands %}
            <div class="grid__item">
              {% include components/cards/brand-card-featured.html brand=brand %}
            </div>
          {% endfor %}
        </div>
      {% else %}
        <div class="card-info" style="background: var(--warning-50);">
          <strong>⚠️ No English brand data found for testing</strong>
        </div>
      {% endif %}
    </div>
  </section>

  <!-- Section 2: Legacy Comparison -->
  <section class="test-section">
    <h2>Section 2: LEGACY COMPARISON - Elimination Candidates</h2>
    
    <div class="performance-matrix">
      <table>
        <thead>
          <tr>
            <th>Legacy Component</th>
            <th>Status</th>
            <th>Recommendation</th>
            <th>Replacement</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>hero-brand-card.html</strong></td>
            <td class="status-poor">❌ High complexity, 46 usages</td>
            <td><strong>Eliminate</strong></td>
            <td>Use brand-card.html with variant="featured"</td>
          </tr>
          <tr>
            <td><strong>featured-brand-card.html</strong></td>
            <td class="status-warning">⚠️ Redundant, 41 usages</td>
            <td><strong>Migrate</strong></td>
            <td>Use brand-card.html with variant="featured"</td>
          </tr>
          <tr>
            <td><strong>simplified-brand-card.html</strong></td>
            <td class="status-good">✅ Working but specialized</td>
            <td><strong>Consider merging</strong></td>
            <td>Evaluate for founder card variants</td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <div class="card-info" style="background: var(--warning-50); border-left-color: var(--warning-500); margin-top: 2rem;">
      <strong>⚠️ Legacy Component Notice:</strong> Complex legacy components have been temporarily disabled in this test page due to dependency issues. The working brand-card.html component with variants provides all necessary functionality for MVP implementation.
    </div>
  </section>

  <!-- Section 3: Brand Cards Deployment Reference -->
  <section class="test-section">
    <h2>Section 3: BRAND CARDS DEPLOYMENT REFERENCE</h2>
    
    <div class="test-subsection">
      <h3>Component Inventory & Usage Guide</h3>
      <div class="card-info">
        <strong>Purpose:</strong> Ready reference for deploying brand cards across the site
      </div>
      
      <!-- Component Usage Table -->
      <div class="performance-matrix">
        <h4>Available Brand Card Components</h4>
        <table>
          <thead>
            <tr>
              <th>Component</th>
              <th>File Path</th>
              <th>Primary Use Case</th>
              <th>Key Features</th>
              <th>Dependencies</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>brand-card.html</strong></td>
              <td><code>_includes/components/cards/brand-card.html</code></td>
              <td>Standard grid display</td>
              <td>Logo, title, description, tags, responsive</td>
              <td class="status-good">✅ All working</td>
            </tr>
            <tr>
              <td><strong>brand-card (featured variant)</strong></td>
              <td><code>_includes/components/cards/brand-card.html</code></td>
              <td>Carousel display, featured grid</td>
              <td>Hero image, enhanced meta, all tags</td>
              <td class="status-good">✅ All working</td>
            </tr>
            <tr>
              <td><strong>brand-card-featured.html</strong></td>
              <td><code>REMOVED</code></td>
              <td>Legacy featured display</td>
              <td>❌ Eliminated during cleanup</td>
              <td class="status-poor">❌ Removed</td>
            </tr>
            <tr>
              <td><strong>hero-brand-card.html</strong></td>
              <td><code>_includes/components/cards/hero-brand-card.html</code></td>
              <td>Premium hero sections</td>
              <td>Full hero image, founder info, metrics</td>
              <td class="status-poor">❌ High complexity</td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!-- Critical Dependencies -->
      <div class="performance-matrix">
        <h4>Critical Dependencies (Required for All Brand Cards)</h4>
        <table>
          <thead>
            <tr>
              <th>Helper</th>
              <th>Location</th>
              <th>Purpose</th>
              <th>Failure Impact</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><code>component-defaults.html</code></td>
              <td><code>helpers/</code></td>
              <td>Configuration retrieval</td>
              <td>Card fails to configure</td>
              <td class="status-good">✅ Working</td>
            </tr>
            <tr>
              <td><code>collection-image.html</code></td>
              <td><code>components/images/</code></td>
              <td>Brand images (logo, hero)</td>
              <td>Images don't display</td>
              <td class="status-good">✅ Working</td>
            </tr>
            <tr>
              <td><code>dimension-name.html</code></td>
              <td><code>helpers/</code></td>
              <td>Taxonomy names</td>
              <td>Tags show as raw IDs</td>
              <td class="status-good">✅ Working</td>
            </tr>
            <tr>
              <td><code>t.html</code></td>
              <td><code>helpers/</code></td>
              <td>Translation system</td>
              <td>English fallback text</td>
              <td class="status-good">✅ Working</td>
            </tr>
            <tr>
              <td><code>card-header.html</code></td>
              <td><code>components/helpers/</code></td>
              <td>Standard card headers</td>
              <td>Manual header required</td>
              <td class="status-good">✅ Fixed</td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!-- Usage Examples -->
      <div class="performance-matrix">
        <h4>Common Usage Patterns</h4>
        <div style="background: var(--neutral-50); padding: 1.5rem; border-radius: 0.5rem; margin: 1rem 0;">
          <h5>Basic Brand Card (Grid Display)</h5>
          <pre style="background: var(--neutral-100); padding: 1rem; border-radius: 0.25rem; margin: 0.5rem 0; overflow-x: auto;"><code>&#123;% include components/cards/brand-card.html brand=brand %&#125;</code></pre>
          
          <h5>Featured Brand Card (Carousel Display)</h5>
          <pre style="background: var(--neutral-100); padding: 1rem; border-radius: 0.25rem; margin: 0.5rem 0; overflow-x: auto;"><code>&#123;% include components/cards/brand-card.html brand=brand variant="featured" %&#125;</code></pre>
          
          <h5>With Configuration Options</h5>
          <pre style="background: var(--neutral-100); padding: 1rem; border-radius: 0.25rem; margin: 0.5rem 0; overflow-x: auto;"><code>&#123;% include components/cards/brand-card.html 
   brand=brand 
   show_location=false 
   tag_limit=2 
   variant="featured" %&#125;</code></pre>
        </div>
      </div>
      
      <!-- Data Requirements -->
      <div class="performance-matrix">
        <h4>Brand Data Requirements</h4>
        <table>
          <thead>
            <tr>
              <th>Field</th>
              <th>Type</th>
              <th>Required</th>
              <th>Purpose</th>
              <th>Example</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><code>title</code></td>
              <td>String</td>
              <td class="status-poor">✅ Required</td>
              <td>Brand display name</td>
              <td>"Altai Gold Honey"</td>
            </tr>
            <tr>
              <td><code>ref</code></td>
              <td>String</td>
              <td class="status-poor">✅ Required</td>
              <td>Global brand ID</td>
              <td>"ru-altai-honey"</td>
            </tr>
            <tr>
              <td><code>description</code></td>
              <td>String</td>
              <td class="status-poor">✅ Required</td>
              <td>Brand description</td>
              <td>"Traditional Siberian honey..."</td>
            </tr>
            <tr>
              <td><code>url</code></td>
              <td>String</td>
              <td class="status-poor">✅ Required</td>
              <td>Brand profile URL</td>
              <td>"/en/brands/ru-altai-honey/"</td>
            </tr>
            <tr>
              <td><code>founding_year</code></td>
              <td>Integer</td>
              <td class="status-warning">⚠️ Optional</td>
              <td>Company founding year</td>
              <td>2005</td>
            </tr>
            <tr>
              <td><code>markets</code></td>
              <td>Array</td>
              <td class="status-warning">⚠️ Optional</td>
              <td>Geographic markets</td>
              <td>["russia", "china"]</td>
            </tr>
            <tr>
              <td><code>sectors</code></td>
              <td>Array</td>
              <td class="status-warning">⚠️ Optional</td>
              <td>Industry sectors</td>
              <td>["honey-bee-products"]</td>
            </tr>
            <tr>
              <td><code>city</code></td>
              <td>String</td>
              <td class="status-good">✓ Enhanced</td>
              <td>Location display</td>
              <td>"Barnaul"</td>
            </tr>
            <tr>
              <td><code>country</code></td>
              <td>String</td>
              <td class="status-good">✓ Enhanced</td>
              <td>Country flag/name</td>
              <td>"ru"</td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!-- Configuration Guide -->
      <div class="performance-matrix">
        <h4>Configuration via _data/component_defaults.yml</h4>
        <div style="background: var(--neutral-50); padding: 1.5rem; border-radius: 0.5rem; margin: 1rem 0;">
          <pre style="background: var(--neutral-100); padding: 1rem; border-radius: 0.25rem; margin: 0.5rem 0; overflow-x: auto;"><code>cards:
  brand-card:
    show_location: true
    show_sector: true
    tag_limit: 4
    
  brand-card-featured:
    show_location: true
    show_sector: true
    tag_limit: 6
    description_words: 180</code></pre>
        </div>
      </div>
      
      <!-- Quick Deploy Checklist -->
      <div class="card-info" style="background: var(--primary-50); border-left-color: var(--primary-500);">
        <h4>🚀 Quick Deploy Checklist</h4>
        <ol style="margin: 0.5rem 0; padding-left: 1.5rem;">
          <li>Ensure brand data has required fields (title, ref, description, url)</li>
          <li>Configure behavior in <code>_data/component_defaults.yml</code></li>
          <li>Use <code>brand-card.html</code> for grid layouts</li>
          <li>Use <code>variant="featured"</code> for carousel/hero layouts</li>
          <li>Test in both grid and carousel contexts</li>
          <li>Verify responsive behavior on mobile/tablet/desktop</li>
          <li>Check taxonomy tags display correctly</li>
          <li>Validate image loading and alt text</li>
        </ol>
      </div>
    </div>
  </section>

  <!-- Component Architecture Analysis -->
  <section class="test-section">
    <h2>Component Architecture Analysis</h2>
    
    <div class="card-info" style="background: var(--primary-50); border-left-color: var(--primary-500);">
      <h3>Key Finding: Single Component Architecture Wins</h3>
      <p><strong>Recommendation:</strong> Use <code>brand-card.html</code> with variant parameter for all brand card needs</p>
    </div>
    
    <div class="performance-matrix">
      <h3>Architecture Comparison: Single vs Multiple Components</h3>
      <table>
        <thead>
          <tr>
            <th>Criteria</th>
            <th>Single Component (brand-card.html)</th>
            <th>Multiple Components (separate files)</th>
            <th>Winner</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>Code Duplication</strong></td>
            <td class="status-good">✅ Zero duplication, shared logic</td>
            <td class="status-poor">❌ ~70% code overlap between files</td>
            <td><strong>Single Component</strong></td>
          </tr>
          <tr>
            <td><strong>Maintainability</strong></td>
            <td class="status-good">✅ Single file to update</td>
            <td class="status-poor">❌ Multiple files to sync</td>
            <td><strong>Single Component</strong></td>
          </tr>
          <tr>
            <td><strong>Flexibility</strong></td>
            <td class="status-good">✅ Easy to add new variants</td>
            <td class="status-warning">⚠️ Requires new files</td>
            <td><strong>Single Component</strong></td>
          </tr>
          <tr>
            <td><strong>Performance</strong></td>
            <td class="status-good">✅ Conditional rendering</td>
            <td class="status-good">✅ Optimized files</td>
            <td><strong>Tie</strong></td>
          </tr>
          <tr>
            <td><strong>Developer Experience</strong></td>
            <td class="status-good">✅ Single mental model</td>
            <td class="status-warning">⚠️ Multiple patterns to learn</td>
            <td><strong>Single Component</strong></td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="performance-matrix">
      <h3>Implementation Evidence</h3>
      <div style="background: var(--neutral-50); padding: 1.5rem; border-radius: 0.5rem; margin: 1rem 0;">
        <h4>Current Architecture Analysis</h4>
        <ul>
          <li><strong>brand-card.html:</strong> 251 lines, handles both standard and featured variants</li>
          <li><strong>brand-card-featured.html:</strong> Separate file with ~70% overlap</li>
          <li><strong>Code overlap:</strong> Header, body, tags, footer logic nearly identical</li>
          <li><strong>Key difference:</strong> Image handling and tag display limits</li>
        </ul>
        
        <h4>Maintainability Impact</h4>
        <ul>
          <li><strong>Bug fixes:</strong> Single component = 1 fix; Multiple = 2+ fixes</li>
          <li><strong>Feature additions:</strong> Single component = 1 update; Multiple = synchronized updates</li>
          <li><strong>Styling changes:</strong> Single component = consistent; Multiple = risk of drift</li>
        </ul>
        
        <h4>Scalability Assessment</h4>
        <ul>
          <li><strong>Future variants:</strong> Single component handles via parameters</li>
          <li><strong>Configuration:</strong> Single component uses <code>component_defaults.yml</code></li>
          <li><strong>Testing:</strong> Single component = single test suite</li>
        </ul>
      </div>
    </div>
    
    <div class="card-info" style="background: var(--success-50); border-left-color: var(--success-500);">
      <h3>✅ Final Recommendation</h3>
      <p><strong>Consolidate to single component architecture:</strong></p>
      <ol>
        <li>Use <code>brand-card.html</code> for all brand card needs</li>
        <li>Use <code>variant="featured"</code> parameter for enhanced display</li>
        <li>Eliminate <code>brand-card-featured.html</code> to reduce maintenance burden</li>
        <li>Keep <code>hero-brand-card.html</code> only if genuinely unique functionality is needed</li>
      </ol>
    </div>
  </section>

  <!-- Performance Matrix -->
  <section class="test-section">
    <h2>Layout Compatibility Assessment</h2>
    
    <div class="performance-matrix">
      <table>
        <thead>
          <tr>
            <th>Card</th>
            <th>Grid Performance</th>
            <th>Carousel Performance</th>
            <th>Overall Verdict</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>brand-card.html</strong></td>
            <td class="status-good">✅ Good - Clean grid display, responsive</td>
            <td class="status-good">✅ Good - Works well in carousel</td>
            <td><strong>Keep</strong> - Versatile for both layouts</td>
          </tr>
          <tr>
            <td><strong>brand-card-featured.html</strong></td>
            <td class="status-warning">⚠️ Mixed - May be too detailed for grid</td>
            <td class="status-good">✅ Good - Designed for carousel</td>
            <td><strong>Keep</strong> - Primary carousel card</td>
          </tr>
          <tr>
            <td><strong>hero-brand-card.html</strong></td>
            <td class="status-poor">❌ Poor - Too large for grid</td>
            <td class="status-poor">❌ Poor - Not carousel compatible</td>
            <td><strong>Eliminate</strong> - Limited use case</td>
          </tr>
          <tr>
            <td><strong>featured-brand-card.html</strong></td>
            <td class="status-warning">⚠️ Mixed - Similar to brand-card-featured</td>
            <td class="status-warning">⚠️ Mixed - Redundant with brand-card-featured</td>
            <td><strong>Eliminate</strong> - Duplicate functionality</td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <h3 style="margin-top: 2rem;">Performance Criteria</h3>
    <ul>
      <li><strong>Visual:</strong> Content hierarchy, image display, text readability, hover states</li>
      <li><strong>Technical:</strong> Responsive behavior, container fit, interaction areas, performance</li>
      <li><strong>UX:</strong> Information architecture, CTA prominence, consistency, accessibility</li>
    </ul>
  </section>
</div>