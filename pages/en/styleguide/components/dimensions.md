---
layout: styleguide
title: Dimensions System
description: Brandmine's dimensions system provides consistent categorization and filtering across content.
permalink: /en/styleguide/components/dimensions/
lang: en
ref: styleguide-components-dimensions
---

## Dimensions System Overview

Our dimensions system provides a multi-dimensional categorization framework that helps users discover and filter content. The system uses visual differentiation to indicate dimensions types while maintaining a cohesive design language.

## Dimensions Categories

Our dimensionsging system includes four distinct categories, each with visual differentiation:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: start;">
      <div>
        <div class="sector-dimensions">
          <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hotels & Resorts</span>
          <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Spirits</span>
        </div>
      </div>
      <div><strong>Sector Dimensions</strong> - Product and service categories with teal styling</div>
      
      <div>
        <div class="attribute-dimensions">
          <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Excellence</span>
          <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Premium Positioning</span>
        </div>
      </div>
      <div><strong>Attribute Dimensions</strong> - Brand qualities with orange styling</div>
      
      <div>
        <div class="growth-dimensions">
          <span class="dimensions growth-dimensions" style="background-color: var(--accent-100); color: var(--accent-700); border: 1px solid var(--accent-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Export Ready</span>
          <span class="dimensions growth-dimensions" style="background-color: var(--accent-100); color: var(--accent-700); border: 1px solid var(--accent-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Investment Ready</span>
        </div>
      </div>
      <div><strong>Growth Dimensions</strong> - Business readiness indicators with indigo styling</div>
      
      <div>
        <div class="country-dimensions">
          <span class="dimensions country-dimensions" style="background-color: var(--accent-50); color: var(--accent-800); border: 1px solid var(--accent-100); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Russia</span>
          <span class="dimensions country-dimensions" style="background-color: var(--accent-50); color: var(--accent-800); border: 1px solid var(--accent-100); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">China</span>
        </div>
      </div>
      <div><strong>Country Dimensions</strong> - Geographic indicators with light indigo styling</div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Sector Dimensions --&gt;
&lt;div class="sector-dimensions"&gt;
  &lt;a href="/en/discover/sectors/hotels-resorts/" class="dimensions sector-dimensions"&gt;Hotels &amp; Resorts&lt;/a&gt;
  &lt;a href="/en/discover/sectors/artisanal-spirits/" class="dimensions sector-dimensions"&gt;Artisanal Spirits&lt;/a&gt;
&lt;/div&gt;

&lt;!-- Attribute Dimensions --&gt;
&lt;div class="attribute-dimensions"&gt;
  &lt;a href="/en/discover/attributes/artisanal-excellence/" class="dimensions attribute-dimensions"&gt;Artisanal Excellence&lt;/a&gt;
  &lt;a href="/en/discover/attributes/premium-positioning/" class="dimensions attribute-dimensions"&gt;Premium Positioning&lt;/a&gt;
&lt;/div&gt;

&lt;!-- Signal Dimensions --&gt;
&lt;div class="signal-dimensions"&gt;
  &lt;a href="/en/discover/signals/export-ready/" class="dimensions signal-dimensions"&gt;Export Ready&lt;/a&gt;
  &lt;a href="/en/discover/signals/investment-ready/" class="dimensions signal-dimensions"&gt;Investment Ready&lt;/a&gt;
&lt;/div&gt;

&lt;!-- Market Dimensions --&gt;
&lt;div class="market-dimensions"&gt;
  &lt;a href="/en/discover/markets/russia/" class="dimensions market-dimensions"&gt;Russia&lt;/a&gt;
  &lt;a href="/en/discover/markets/china/" class="dimensions market-dimensions"&gt;China&lt;/a&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Dimensions States

Dimensions include hover states for improved interaction feedback:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: center;">
      <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Normal State</span>
      <div>Default appearance for sector dimensions</div>
      
      <span class="dimensions sector-dimensions" style="background-color: var(--primary-200); color: var(--primary-800); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hover State</span>
      <div>When user hovers over a sector dimensions</div>
      
      <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Normal State</span>
      <div>Default appearance for attribute dimensions</div>
      
      <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-200); color: var(--secondary-800); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hover State</span>
      <div>When user hovers over an attribute dimensions</div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.sector-dimensions {
  background-color: var(--primary-100);
  color: var(--primary-700);
  border: 1px solid var(--primary-200);
}

.sector-dimensions:hover {
  background-color: var(--primary-200);
  color: var(--primary-800);
}

.attribute-dimensions {
  background-color: var(--secondary-100);
  color: var(--secondary-700);
  border: 1px solid var(--secondary-200);
}

.attribute-dimensions:hover {
  background-color: var(--secondary-200);
  color: var(--secondary-800);
}</code></pre>
  </div>
</div>

## Dimensions Lists

Dimensions are typically grouped by category in list format:

<div class="example-wrapper">
  <div class="example-preview">
    <div class="dimensions-list" style="margin: var(--space-4) 0;">
      <div class="sector-dimensions" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-2);">
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hotels & Resorts</span>
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Spirits</span>
      </div>
      <div class="attribute-dimensions" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-2);">
        <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Excellence</span>
        <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Premium Positioning</span>
      </div>
      <div class="growth-dimensions" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-2);">
        <span class="dimensions growth-dimensions" style="background-color: var(--accent-100); color: var(--accent-700); border: 1px solid var(--accent-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Export Ready</span>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="dimensions-list"&gt;
  &lt;div class="sector-dimensions"&gt;
    &lt;a href="/en/discover/sectors/hotels-resorts/" class="dimensions sector-dimensions"&gt;Hotels &amp; Resorts&lt;/a&gt;
    &lt;a href="/en/discover/sectors/artisanal-spirits/" class="dimensions sector-dimensions"&gt;Artisanal Spirits&lt;/a&gt;
  &lt;/div&gt;
  &lt;div class="attribute-dimensions"&gt;
    &lt;a href="/en/discover/attributes/artisanal-excellence/" class="dimensions attribute-dimensions"&gt;Artisanal Excellence&lt;/a&gt;
    &lt;a href="/en/discover/attributes/premium-positioning/" class="dimensions attribute-dimensions"&gt;Premium Positioning&lt;/a&gt;
  &lt;/div&gt;
  &lt;div class="signal-dimensions"&gt;
    &lt;a href="/en/discover/signals/export-ready/" class="dimensions signal-dimensions"&gt;Export Ready&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Dimensions Clouds

Dimensions clouds display all dimensions in a category for browsing and discovery:

<div class="example-wrapper">
  <div class="example-preview">
    <div class="dimensions-cloud" style="margin: var(--space-6) 0;">
      <h3 style="margin-bottom: var(--space-2); font-size: 1.25rem;">Sectors</h3>
      <div class="sector-cloud" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-6);">
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hotels & Resorts</span>
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Spirits</span>
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Gourmet Foods</span>
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Natural Beauty</span>
      </div>
      
      <h3 style="margin-bottom: var(--space-2); font-size: 1.25rem;">Attributes</h3>
      <div class="attribute-cloud" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-6);">
        <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Excellence</span>
        <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Premium Positioning</span>
        <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Founder-Led</span>
        <span class="dimensions attribute-dimensions" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Heridimensionse Brand</span>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="dimensions-cloud"&gt;
  &lt;h3&gt;Sectors&lt;/h3&gt;
  &lt;div class="sector-cloud"&gt;
    &lt;a href="/en/discover/sectors/hotels-resorts/" class="dimensions sector-dimensions"&gt;Hotels &amp; Resorts&lt;/a&gt;
    &lt;a href="/en/discover/sectors/artisanal-spirits/" class="dimensions sector-dimensions"&gt;Artisanal Spirits&lt;/a&gt;
    &lt;a href="/en/discover/sectors/gourmet-foods/" class="dimensions sector-dimensions"&gt;Gourmet Foods&lt;/a&gt;
    &lt;a href="/en/discover/sectors/natural-beauty/" class="dimensions sector-dimensions"&gt;Natural Beauty&lt;/a&gt;
  &lt;/div&gt;
  
  &lt;h3&gt;Attributes&lt;/h3&gt;
  &lt;div class="attribute-cloud"&gt;
    &lt;a href="/en/discover/attributes/artisanal-excellence/" class="dimensions attribute-dimensions"&gt;Artisanal Excellence&lt;/a&gt;
    &lt;a href="/en/discover/attributes/premium-positioning/" class="dimensions attribute-dimensions"&gt;Premium Positioning&lt;/a&gt;
    &lt;a href="/en/discover/attributes/founder-led/" class="dimensions attribute-dimensions"&gt;Founder-Led&lt;/a&gt;
    &lt;a href="/en/discover/attributes/heridimensionse-brand/" class="dimensions attribute-dimensions"&gt;Heridimensionse Brand&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Dimensions Pages

Dimensions pages display content related to a specific dimensions with header information:

<div class="example-wrapper">
  <div class="example-preview">
    <div class="dimensions-header" style="margin-bottom: var(--space-8);">
      <span class="dimensions-type" style="display: inline-block; padding: var(--space-1) var(--space-2); background-color: var(--neutral-200); color: var(--neutral-700); border-radius: 4px; font-size: 0.875rem; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: var(--space-2);">SECTOR</span>
      <h1 style="margin-top: 0; margin-bottom: var(--space-2);">Hotels & Resorts</h1>
      <p class="dimensions-description" style="font-size: 1.125rem; color: var(--neutral-600); margin-bottom: var(--space-4); max-width: 40em;">Luxury and boutique accommodation providers across the BRICS+ region offering distinctive hospitality experiences.</p>
    </div>
    
    <div class="dimensions-posts">
      <h2>Related Content</h2>
      <div style="display: grid; grid-template-columns: 1fr; gap: var(--space-4); max-width: 800px;">
        <div style="border: 1px solid var(--neutral-200); border-radius: 0.5rem; padding: var(--space-4);">
          <h3 style="margin-top: 0;">Top 10 Boutique Hotels in Moscow</h3>
          <p>Explore the most distinctive luxury accommodations in Russia's capital city...</p>
          <a href="#" style="color: var(--primary-600); text-decoration: none;">Read More</a>
        </div>
        <div style="border: 1px solid var(--neutral-200); border-radius: 0.5rem; padding: var(--space-4);">
          <h3 style="margin-top: 0;">Emerging Trends in BRICS Hospitality</h3>
          <p>How hotels across Brazil, Russia, India, China and South Africa are innovating...</p>
          <a href="#" style="color: var(--primary-600); text-decoration: none;">Read More</a>
        </div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="dimensions-header"&gt;
  &lt;span class="dimensions-type"&gt;SECTOR&lt;/span&gt;
  &lt;h1&gt;Hotels &amp; Resorts&lt;/h1&gt;
  &lt;p class="dimensions-description"&gt;Luxury and boutique accommodation providers across the BRICS+ region offering distinctive hospitality experiences.&lt;/p&gt;
&lt;/div&gt;

&lt;div class="dimensions-posts"&gt;
  &lt;h2&gt;Related Content&lt;/h2&gt;
  &lt;div class="post-grid"&gt;
    {% for post in posts %}
      &lt;div class="post-card"&gt;
        &lt;h3&gt;&lt;a href="{{ post.url | relative_url }}"&gt;{{ post.title }}&lt;/a&gt;&lt;/h3&gt;
        &lt;p&gt;{{ post.excerpt }}&lt;/p&gt;
        &lt;a href="{{ post.url | relative_url }}" class="read-more"&gt;Read More&lt;/a&gt;
      &lt;/div&gt;
    {% endfor %}
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Badge-Enhanced Dimensions

For future implementation, dimensions can include badge icons:

<div class="example-wrapper">
  <div class="example-preview">
    <span class="dimensions growth-dimensions with-badge" style="background-color: var(--accent-100); color: var(--accent-700); border: 1px solid var(--accent-200); display: inline-block; padding-left: var(--space-6); padding-right: var(--space-2); padding-top: var(--space-1); padding-bottom: var(--space-1); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none; position: relative;">
      <span class="badge-icon" style="position: absolute; left: var(--space-1); top: 50%; transform: translateY(-50%); width: 16px; height: 16px); background-color: var(--accent-700); border-radius: 50%; display: inline-block;"></span>
      Export Ready
    </span>
    <span style="margin-left: var(--space-4); font-size: 0.875rem; color: var(--neutral-500);">Future badge implementation</span>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;a href="/en/dimensions/growth/export-ready/" class="dimensions growth-dimensions with-badge"&gt;
  &lt;span class="badge-icon" style="background-image: url('/assets/images/badges/export-ready.svg')"&gt;&lt;/span&gt;
  Export Ready
&lt;/a&gt;</code></pre>
  </div>
</div>

## Multilingual Dimensions System

All dimensions are implemented consistently across languages:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: var(--space-4);">
      <div>
        <div style="margin-bottom: var(--space-2); font-weight: bold;">English</div>
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hotels & Resorts</span>
      </div>
      <div>
        <div style="margin-bottom: var(--space-2); font-weight: bold;">Russian</div>
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Отели и Курорты</span>
      </div>
      <div>
        <div style="margin-bottom: var(--space-2); font-weight: bold;">Chinese</div>
        <span class="dimensions sector-dimensions" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">酒店和度假村</span>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">yaml</span>
    <pre><code class="language-yaml"># _data/dimensions_translations.yml

hotels-resorts:
  en: "Hotels & Resorts"
  ru: "Отели и Курорты"
  zh: "酒店和度假村"
  
artisanal-excellence:
  en: "Artisanal Excellence"
  ru: "Мастерство Ремесленников"
  zh: "工艺精湛"</code></pre>
  </div>
</div>

## Implementation Guidelines

### Dimensions Usage

1. **Consistent categorization** - Use appropriate dimensions categories for each content type:
   - Sector dimensions for industry categories
   - Attribute dimensions for brand qualities
   - Growth dimensions for business readiness
   - Country dimensions for geographic context

2. **Dimensions grouping** - Group dimensions by category for clarity:
   ```html
   <div class="dimensions-list">
     <div class="sector-dimensions"><!-- Sector dimensions --></div>
     <div class="attribute-dimensions"><!-- Attribute dimensions --></div>
     <div class="growth-dimensions"><!-- Growth dimensions --></div>
     <div class="country-dimensions"><!-- Country dimensions --></div>
   </div>
   ```

3. **Multilingual implementation** - Use proper dimensions translation data:
   ```html
   <a href="/{{ page.lang }}/discover/sectors/hotels-resorts/" class="dimensions sector-dimensions">
     {{ site.data.dimensions_translations['hotels-resorts'][page.lang] }}
   </a>
   ```

### Dimensions Display Patterns

Common dimensions display patterns:

```html
<!-- Post meta information with dimensions -->
<div class="post-meta">
  <div class="dimensions-list">
    {% for dimensions in post.dimensions %}
      <!-- Use include to render appropriate dimensions styling based on category -->
      {% include dimensions/render-dimensions.html dimensions=dimensions %}
    {% endfor %}
  </div>
</div>

<!-- Dimensions cloud for sidebar -->
<div class="sidebar-section">
  <h3>Popular Topics</h3>
  <div class="dimensions-cloud">
    <h4>Sectors</h4>
    <div class="sector-cloud">
      {% for dimensions in site.dimensions.sectors limit: 8 %}
        <a href="{{ dimensions.url }}" class="dimensions sector-dimensions">{{ dimensions.title }}</a>
      {% endfor %}
    </div>
  </div>
</div>

<!-- Dimensions filtering interface -->
<div class="filter-section">
  <h3>Filter by Category</h3>
  <div class="sector-cloud filter-cloud">
    {% for dimensions in site.dimensions.sectors %}
      <a href="?filter={{ dimensions.slug }}" class="dimensions sector-dimensions {% if current_filter == dimensions.slug %}active{% endif %}">
        {{ dimensions.title }}
      </a>
    {% endfor %}
  </div>
</div>
```

### Best Practices

1. **Visual differentiation** - Maintain distinct styling for each dimensions category
2. **Consistent spacing** - Use standard spacing between dimensions and dimensions groups
3. **Responsive behavior** - Ensure dimensions wrap properly on smaller screens
4. **Multilingual consistency** - Maintain parallel structure across languages
5. **Clear hierarchy** - Use heading elements to label dimensions sections appropriately
6. **Dimensions clouds** - Include dimensions clouds for easy content browsing
7. **Interactive filtering** - Support filtering content by dimensions when appropriate
