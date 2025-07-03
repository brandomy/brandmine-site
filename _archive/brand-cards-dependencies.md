---
layout: default
title: Brand Cards Dependencies Reference
permalink: /test/brand-cards-dependencies
lang: en
---

<style>
  .dependency-card {
    background: var(--neutral-50);
    padding: 1.5rem;
    margin: 1rem 0;
    border-radius: 0.5rem;
    border-left: 4px solid var(--primary-500);
  }
  .status-good { color: #22c55e; }
  .status-warning { color: #f59e0b; }
  .status-poor { color: #ef4444; }
  .component-sample {
    max-width: 300px;
    margin: 1rem 0;
    border: 1px solid var(--neutral-300);
    border-radius: 0.5rem;
    overflow: hidden;
  }
  .code-block {
    background: var(--neutral-100);
    padding: 1rem;
    border-radius: 0.25rem;
    font-family: monospace;
    overflow-x: auto;
    margin: 0.5rem 0;
  }
  .dependency-matrix {
    overflow-x: auto;
    margin: 2rem 0;
  }
  .dependency-matrix table {
    width: 100%;
    border-collapse: collapse;
  }
  .dependency-matrix th,
  .dependency-matrix td {
    padding: 0.75rem;
    border: 1px solid var(--neutral-300);
    text-align: left;
  }
  .dependency-matrix th {
    background: var(--neutral-100);
    font-weight: bold;
  }
</style>

<div class="container">
  <div class="test-header">
    <h1>Brand Cards Dependencies Reference</h1>
    <p>Complete technical reference for brand card component dependencies and configuration</p>
  </div>

  <!-- Quick Reference -->
  <section class="test-section">
    <h2>Quick Reference</h2>
    
    <div class="dependency-card">
      <h3>✅ Recommended: brand-card.html</h3>
      <div class="component-sample">
        {% assign sample_brand = site.brands | where: "lang", "en" | first %}
        {% if sample_brand %}
          {% include components/cards/brand-card.html brand=sample_brand %}
        {% else %}
          <div style="background: white; padding: 1rem; text-align: center; border: 1px solid var(--neutral-300);">
            <strong>No sample brands available</strong><br>
            <small>Add brand data to see working component</small>
          </div>
        {% endif %}
      </div>
      <p><strong>Dependencies:</strong> component-defaults.html, collection-image.html, dimension-name.html</p>
      <p><strong>Status:</strong> <span class="status-good">✅ Working</span></p>
      <p><strong>Usage:</strong> Standard grid display, carousel with variant="featured"</p>
    </div>

    <div class="dependency-card">
      <h3>✅ Current: brand-card.html (Featured Variant)</h3>
      <div class="component-sample">
        {% assign sample_brand = site.brands | where: "lang", "en" | first %}
        {% if sample_brand %}
          {% include components/cards/brand-card.html brand=sample_brand variant="featured" %}
        {% else %}
          <div style="background: white; padding: 1rem; text-align: center; border: 1px solid var(--neutral-300);">
            <strong>No sample brands available</strong><br>
            <small>Add brand data to see working featured variant</small>
          </div>
        {% endif %}
      </div>
      <p><strong>Dependencies:</strong> component-defaults.html, collection-image.html, dimension-name.html</p>
      <p><strong>Status:</strong> <span class="status-good">✅ Working</span></p>
      <p><strong>Usage:</strong> Enhanced display with hero images and comprehensive tags</p>
    </div>

    <div class="dependency-card">
      <h3>🗑️ Removed: hero-brand-card.html</h3>
      <div class="component-sample">
        <div style="background: #f8f9fa; padding: 1rem; text-align: center; border: 1px dashed #6c757d;">
          <strong>Component Removed</strong><br>
          <small style="color: var(--neutral-600);">Complex component eliminated to reduce maintenance burden</small><br>
          <div style="margin-top: 0.5rem;">
            <span style="background: var(--primary-100); padding: 0.25rem 0.5rem; border-radius: 1rem; font-size: 0.75rem;">Use variant="featured" instead</span>
          </div>
        </div>
      </div>
      <p><strong>Replacement:</strong> brand-card.html with variant="featured"</p>
      <p><strong>Status:</strong> <span class="status-poor">❌ Eliminated</span></p>
      <p><strong>Reason:</strong> High complexity, maintenance burden</p>
    </div>
  </section>

  <!-- Detailed Dependencies -->
  <section class="test-section">
    <h2>Detailed Dependencies</h2>

    <div class="dependency-matrix">
      <h3>Critical Dependencies (Required for All Brand Cards)</h3>
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

    <div class="dependency-matrix">
      <h3>Component-Specific Dependencies</h3>
      <table>
        <thead>
          <tr>
            <th>Component</th>
            <th>Additional Dependencies</th>
            <th>Complexity</th>
            <th>Risk Level</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>brand-card.html</strong></td>
            <td>founder-check.html, country-flag.html</td>
            <td class="status-good">Low</td>
            <td class="status-good">✅ Low Risk</td>
          </tr>
          <tr>
            <td><strong>hero-brand-card.html</strong></td>
            <td><em>Component removed</em></td>
            <td class="status-poor">N/A</td>
            <td class="status-poor">❌ Eliminated</td>
          </tr>
          <tr>
            <td><strong>related-brand-card.html</strong></td>
            <td><em>Component removed</em></td>
            <td class="status-poor">N/A</td>
            <td class="status-poor">❌ Eliminated</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- Configuration Guide -->
  <section class="test-section">
    <h2>Configuration Guide</h2>

    <div class="dependency-matrix">
      <h3>Configuration via _data/component_defaults.yml</h3>
      <div class="code-block">cards:
  brand-card:
    show_location: true
    show_sector: true
    tag_limit: 4
    
  brand-card-featured:
    show_location: true
    show_sector: true
    tag_limit: 6
    description_words: 180</div>
    </div>

    <div class="dependency-matrix">
      <h3>Brand Data Requirements</h3>
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
  </section>

  <!-- Usage Examples -->
  <section class="test-section">
    <h2>Usage Examples</h2>

    <div class="dependency-matrix">
      <h3>Common Usage Patterns</h3>
      
      <div class="dependency-card">
        <h4>Basic Brand Card (Grid Display)</h4>
        <div class="code-block">{% include components/cards/brand-card.html brand=brand %}</div>
      </div>
      
      <div class="dependency-card">
        <h4>Featured Brand Card (Carousel Display)</h4>
        <div class="code-block">{% include components/cards/brand-card.html brand=brand variant="featured" %}</div>
      </div>
      
      <div class="dependency-card">
        <h4>With Configuration Options</h4>
        <div class="code-block">{% include components/cards/brand-card.html 
  brand=brand 
  show_location=false 
  tag_limit=2 
  variant="featured" %}</div>
      </div>
      
      <div class="dependency-card">
        <h4>In Grid Layout</h4>
        <div class="code-block">{% assign brands = site.brands | where: "lang", "en" | limit: 12 %}
<div class="grid">
  {% for brand in brands %}
    <div class="grid__item">
      {% include components/cards/brand-card.html brand=brand %}
    </div>
  {% endfor %}
</div></div>
      </div>
      
      <div class="dependency-card">
        <h4>In Carousel Layout</h4>
        <div class="code-block">{% assign featured_brands = site.brands | where: "featured", true | limit: 10 %}
<div class="carousel">
  {% for brand in featured_brands %}
    <div class="carousel-card">
      {% include components/cards/brand-card.html brand=brand variant="featured" %}
    </div>
  {% endfor %}
</div></div>
      </div>
    </div>
  </section>

  <!-- Quick Deploy Checklist -->
  <section class="test-section">
    <h2>Quick Deploy Checklist</h2>
    
    <div class="dependency-card" style="border-left-color: var(--success-500);">
      <h3>🚀 Pre-Deployment Checklist</h3>
      <ol style="margin: 0.5rem 0; padding-left: 1.5rem;">
        <li>✅ Ensure brand data has required fields (title, ref, description, url)</li>
        <li>✅ Configure behavior in <code>_data/component_defaults.yml</code></li>
        <li>✅ Use <code>brand-card.html</code> for grid layouts</li>
        <li>✅ Use <code>variant="featured"</code> for carousel/hero layouts</li>
        <li>✅ Test in both grid and carousel contexts</li>
        <li>✅ Verify responsive behavior on mobile/tablet/desktop</li>
        <li>✅ Check taxonomy tags display correctly</li>
        <li>✅ Validate image loading and alt text</li>
      </ol>
    </div>
    
    <div class="dependency-card" style="border-left-color: var(--warning-500);">
      <h3>⚠️ Common Issues</h3>
      <ul style="margin: 0.5rem 0; padding-left: 1.5rem;">
        <li><strong>Missing images:</strong> Check brand front matter has proper images structure</li>
        <li><strong>Raw dimension IDs:</strong> Verify dimension-name.html helper is working</li>
        <li><strong>Broken links:</strong> Ensure brand.url is correctly set</li>
        <li><strong>Layout issues:</strong> Check grid/carousel CSS is properly loaded</li>
      </ul>
    </div>
  </section>
</div>