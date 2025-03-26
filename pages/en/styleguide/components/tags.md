---
layout: styleguide
title: Tag System
description: Brandmine's tag system provides consistent categorization and filtering across content.
permalink: /en/styleguide/patterns/tags/
lang: en
---

## Tag System Overview

Our tag system provides a multi-dimensional categorization framework that helps users discover and filter content. The system uses visual differentiation to indicate tag types while maintaining a cohesive design language.

## Tag Categories

Our tagging system includes four distinct categories, each with visual differentiation:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: start;">
      <div>
        <div class="sector-tags">
          <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hotels & Resorts</span>
          <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Spirits</span>
        </div>
      </div>
      <div><strong>Sector Tags</strong> - Product and service categories with teal styling</div>
      
      <div>
        <div class="attribute-tags">
          <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Excellence</span>
          <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Premium Positioning</span>
        </div>
      </div>
      <div><strong>Attribute Tags</strong> - Brand qualities with orange styling</div>
      
      <div>
        <div class="growth-tags">
          <span class="tag growth-tag" style="background-color: var(--accent-100); color: var(--accent-700); border: 1px solid var(--accent-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Export Ready</span>
          <span class="tag growth-tag" style="background-color: var(--accent-100); color: var(--accent-700); border: 1px solid var(--accent-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Investment Ready</span>
        </div>
      </div>
      <div><strong>Growth Tags</strong> - Business readiness indicators with indigo styling</div>
      
      <div>
        <div class="country-tags">
          <span class="tag country-tag" style="background-color: var(--accent-50); color: var(--accent-800); border: 1px solid var(--accent-100); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Russia</span>
          <span class="tag country-tag" style="background-color: var(--accent-50); color: var(--accent-800); border: 1px solid var(--accent-100); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">China</span>
        </div>
      </div>
      <div><strong>Country Tags</strong> - Geographic indicators with light indigo styling</div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Sector Tags --&gt;
&lt;div class="sector-tags"&gt;
  &lt;a href="/en/tags/sectors/hotels-resorts/" class="tag sector-tag"&gt;Hotels &amp; Resorts&lt;/a&gt;
  &lt;a href="/en/tags/sectors/artisanal-spirits/" class="tag sector-tag"&gt;Artisanal Spirits&lt;/a&gt;
&lt;/div&gt;

&lt;!-- Attribute Tags --&gt;
&lt;div class="attribute-tags"&gt;
  &lt;a href="/en/tags/attributes/artisanal-excellence/" class="tag attribute-tag"&gt;Artisanal Excellence&lt;/a&gt;
  &lt;a href="/en/tags/attributes/premium-positioning/" class="tag attribute-tag"&gt;Premium Positioning&lt;/a&gt;
&lt;/div&gt;

&lt;!-- Growth Tags --&gt;
&lt;div class="growth-tags"&gt;
  &lt;a href="/en/tags/growth/export-ready/" class="tag growth-tag"&gt;Export Ready&lt;/a&gt;
  &lt;a href="/en/tags/growth/investment-ready/" class="tag growth-tag"&gt;Investment Ready&lt;/a&gt;
&lt;/div&gt;

&lt;!-- Country Tags --&gt;
&lt;div class="country-tags"&gt;
  &lt;a href="/en/tags/countries/russia/" class="tag country-tag"&gt;Russia&lt;/a&gt;
  &lt;a href="/en/tags/countries/china/" class="tag country-tag"&gt;China&lt;/a&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Tag States

Tags include hover states for improved interaction feedback:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: center;">
      <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Normal State</span>
      <div>Default appearance for sector tags</div>
      
      <span class="tag sector-tag" style="background-color: var(--primary-200); color: var(--primary-800); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hover State</span>
      <div>When user hovers over a sector tag</div>
      
      <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Normal State</span>
      <div>Default appearance for attribute tags</div>
      
      <span class="tag attribute-tag" style="background-color: var(--secondary-200); color: var(--secondary-800); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hover State</span>
      <div>When user hovers over an attribute tag</div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">.sector-tag {
  background-color: var(--primary-100);
  color: var(--primary-700);
  border: 1px solid var(--primary-200);
}

.sector-tag:hover {
  background-color: var(--primary-200);
  color: var(--primary-800);
}

.attribute-tag {
  background-color: var(--secondary-100);
  color: var(--secondary-700);
  border: 1px solid var(--secondary-200);
}

.attribute-tag:hover {
  background-color: var(--secondary-200);
  color: var(--secondary-800);
}</code></pre>
  </div>
</div>

## Tag Lists

Tags are typically grouped by category in list format:

<div class="example-wrapper">
  <div class="example-preview">
    <div class="tag-list" style="margin: var(--space-4) 0;">
      <div class="sector-tags" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-2);">
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hotels & Resorts</span>
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Spirits</span>
      </div>
      <div class="attribute-tags" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-2);">
        <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Excellence</span>
        <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Premium Positioning</span>
      </div>
      <div class="growth-tags" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-2);">
        <span class="tag growth-tag" style="background-color: var(--accent-100); color: var(--accent-700); border: 1px solid var(--accent-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Export Ready</span>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="tag-list"&gt;
  &lt;div class="sector-tags"&gt;
    &lt;a href="/en/tags/sectors/hotels-resorts/" class="tag sector-tag"&gt;Hotels &amp; Resorts&lt;/a&gt;
    &lt;a href="/en/tags/sectors/artisanal-spirits/" class="tag sector-tag"&gt;Artisanal Spirits&lt;/a&gt;
  &lt;/div&gt;
  &lt;div class="attribute-tags"&gt;
    &lt;a href="/en/tags/attributes/artisanal-excellence/" class="tag attribute-tag"&gt;Artisanal Excellence&lt;/a&gt;
    &lt;a href="/en/tags/attributes/premium-positioning/" class="tag attribute-tag"&gt;Premium Positioning&lt;/a&gt;
  &lt;/div&gt;
  &lt;div class="growth-tags"&gt;
    &lt;a href="/en/tags/growth/export-ready/" class="tag growth-tag"&gt;Export Ready&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Tag Clouds

Tag clouds display all tags in a category for browsing and discovery:

<div class="example-wrapper">
  <div class="example-preview">
    <div class="tag-cloud" style="margin: var(--space-6) 0;">
      <h3 style="margin-bottom: var(--space-2); font-size: 1.25rem;">Sectors</h3>
      <div class="sector-cloud" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-6);">
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hotels & Resorts</span>
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Spirits</span>
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Gourmet Foods</span>
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Natural Beauty</span>
      </div>
      
      <h3 style="margin-bottom: var(--space-2); font-size: 1.25rem;">Attributes</h3>
      <div class="attribute-cloud" style="display: flex; flex-wrap: wrap; gap: var(--space-2); margin-bottom: var(--space-6);">
        <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Artisanal Excellence</span>
        <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Premium Positioning</span>
        <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Founder-Led</span>
        <span class="tag attribute-tag" style="background-color: var(--secondary-100); color: var(--secondary-700); border: 1px solid var(--secondary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Heritage Brand</span>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="tag-cloud"&gt;
  &lt;h3&gt;Sectors&lt;/h3&gt;
  &lt;div class="sector-cloud"&gt;
    &lt;a href="/en/tags/sectors/hotels-resorts/" class="tag sector-tag"&gt;Hotels &amp; Resorts&lt;/a&gt;
    &lt;a href="/en/tags/sectors/artisanal-spirits/" class="tag sector-tag"&gt;Artisanal Spirits&lt;/a&gt;
    &lt;a href="/en/tags/sectors/gourmet-foods/" class="tag sector-tag"&gt;Gourmet Foods&lt;/a&gt;
    &lt;a href="/en/tags/sectors/natural-beauty/" class="tag sector-tag"&gt;Natural Beauty&lt;/a&gt;
  &lt;/div&gt;
  
  &lt;h3&gt;Attributes&lt;/h3&gt;
  &lt;div class="attribute-cloud"&gt;
    &lt;a href="/en/tags/attributes/artisanal-excellence/" class="tag attribute-tag"&gt;Artisanal Excellence&lt;/a&gt;
    &lt;a href="/en/tags/attributes/premium-positioning/" class="tag attribute-tag"&gt;Premium Positioning&lt;/a&gt;
    &lt;a href="/en/tags/attributes/founder-led/" class="tag attribute-tag"&gt;Founder-Led&lt;/a&gt;
    &lt;a href="/en/tags/attributes/heritage-brand/" class="tag attribute-tag"&gt;Heritage Brand&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Tag Pages

Tag pages display content related to a specific tag with header information:

<div class="example-wrapper">
  <div class="example-preview">
    <div class="tag-header" style="margin-bottom: var(--space-8);">
      <span class="tag-type" style="display: inline-block; padding: var(--space-1) var(--space-2); background-color: var(--neutral-200); color: var(--neutral-700); border-radius: 4px; font-size: 0.875rem; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: var(--space-2);">SECTOR</span>
      <h1 style="margin-top: 0; margin-bottom: var(--space-2);">Hotels & Resorts</h1>
      <p class="tag-description" style="font-size: 1.125rem; color: var(--neutral-600); margin-bottom: var(--space-4); max-width: 40em;">Luxury and boutique accommodation providers across the BRICS+ region offering distinctive hospitality experiences.</p>
    </div>
    
    <div class="tag-posts">
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
    <pre><code class="language-html">&lt;div class="tag-header"&gt;
  &lt;span class="tag-type"&gt;SECTOR&lt;/span&gt;
  &lt;h1&gt;Hotels &amp; Resorts&lt;/h1&gt;
  &lt;p class="tag-description"&gt;Luxury and boutique accommodation providers across the BRICS+ region offering distinctive hospitality experiences.&lt;/p&gt;
&lt;/div&gt;

&lt;div class="tag-posts"&gt;
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

## Badge-Enhanced Tags

For future implementation, tags can include badge icons:

<div class="example-wrapper">
  <div class="example-preview">
    <span class="tag growth-tag with-badge" style="background-color: var(--accent-100); color: var(--accent-700); border: 1px solid var(--accent-200); display: inline-block; padding-left: var(--space-6); padding-right: var(--space-2); padding-top: var(--space-1); padding-bottom: var(--space-1); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none; position: relative;">
      <span class="badge-icon" style="position: absolute; left: var(--space-1); top: 50%; transform: translateY(-50%); width: 16px; height: 16px); background-color: var(--accent-700); border-radius: 50%; display: inline-block;"></span>
      Export Ready
    </span>
    <span style="margin-left: var(--space-4); font-size: 0.875rem; color: var(--neutral-500);">Future badge implementation</span>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;a href="/en/tags/growth/export-ready/" class="tag growth-tag with-badge"&gt;
  &lt;span class="badge-icon" style="background-image: url('/assets/images/badges/export-ready.svg')"&gt;&lt;/span&gt;
  Export Ready
&lt;/a&gt;</code></pre>
  </div>
</div>

## Multilingual Tag System

All tags are implemented consistently across languages:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: var(--space-4);">
      <div>
        <div style="margin-bottom: var(--space-2); font-weight: bold;">English</div>
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Hotels & Resorts</span>
      </div>
      <div>
        <div style="margin-bottom: var(--space-2); font-weight: bold;">Russian</div>
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">Отели и Курорты</span>
      </div>
      <div>
        <div style="margin-bottom: var(--space-2); font-weight: bold;">Chinese</div>
        <span class="tag sector-tag" style="background-color: var(--primary-100); color: var(--primary-700); border: 1px solid var(--primary-200); display: inline-block; padding: var(--space-1) var(--space-2); border-radius: 4px; font-size: 0.875rem; line-height: 1.4; text-decoration: none;">酒店和度假村</span>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">yaml</span>
    <pre><code class="language-yaml"># _data/tag_translations.yml

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

### Tag Usage

1. **Consistent categorization** - Use appropriate tag categories for each content type:
   - Sector tags for industry categories
   - Attribute tags for brand qualities
   - Growth tags for business readiness
   - Country tags for geographic context

2. **Tag grouping** - Group tags by category for clarity:
   ```html
   <div class="tag-list">
     <div class="sector-tags"><!-- Sector tags --></div>
     <div class="attribute-tags"><!-- Attribute tags --></div>
     <div class="growth-tags"><!-- Growth tags --></div>
     <div class="country-tags"><!-- Country tags --></div>
   </div>
   ```

3. **Multilingual implementation** - Use proper tag translation data:
   ```html
   <a href="/{{ page.lang }}/tags/sectors/hotels-resorts/" class="tag sector-tag">
     {{ site.data.tag_translations['hotels-resorts'][page.lang] }}
   </a>
   ```

### Tag Display Patterns

Common tag display patterns:

```html
<!-- Post meta information with tags -->
<div class="post-meta">
  <div class="tag-list">
    {% for tag in post.tags %}
      <!-- Use include to render appropriate tag styling based on category -->
      {% include tags/render-tag.html tag=tag %}
    {% endfor %}
  </div>
</div>

<!-- Tag cloud for sidebar -->
<div class="sidebar-section">
  <h3>Popular Topics</h3>
  <div class="tag-cloud">
    <h4>Sectors</h4>
    <div class="sector-cloud">
      {% for tag in site.tags.sectors limit: 8 %}
        <a href="{{ tag.url }}" class="tag sector-tag">{{ tag.title }}</a>
      {% endfor %}
    </div>
  </div>
</div>

<!-- Tag filtering interface -->
<div class="filter-section">
  <h3>Filter by Category</h3>
  <div class="sector-cloud filter-cloud">
    {% for tag in site.tags.sectors %}
      <a href="?filter={{ tag.slug }}" class="tag sector-tag {% if current_filter == tag.slug %}active{% endif %}">
        {{ tag.title }}
      </a>
    {% endfor %}
  </div>
</div>
```

### Best Practices

1. **Visual differentiation** - Maintain distinct styling for each tag category
2. **Consistent spacing** - Use standard spacing between tags and tag groups
3. **Responsive behavior** - Ensure tags wrap properly on smaller screens
4. **Multilingual consistency** - Maintain parallel structure across languages
5. **Clear hierarchy** - Use heading elements to label tag sections appropriately
6. **Tag clouds** - Include tag clouds for easy content browsing
7. **Interactive filtering** - Support filtering content by tags when appropriate
