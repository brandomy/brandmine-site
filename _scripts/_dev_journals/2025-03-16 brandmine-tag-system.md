# Brandmine Tag System Implementation Guide

This guide provides step-by-step instructions for implementing a sector-focused tag system with business attributes for the Brandmine blog. This implementation is specifically designed for Jekyll on GitHub Pages and will support your initial focus on Russian brands across 15 specific sectors.

## Directory Structure

First, create the necessary directories for tag organization:

```bash
# Create base tag directories
mkdir -p _tags/sectors
mkdir -p _tags/attributes

# Create tag layouts directory if it doesn't exist
mkdir -p _layouts

# Create tag includes directory
mkdir -p _includes/tags
```

## Tag Configuration Files

### 1. Create Sector Tag Files

Create individual files for each sector tag in the `_tags/sectors/` directory:

**_tags/sectors/artisanal-spirits-vodka.md**
```yaml
---
layout: tag
title: "Artisanal Spirits & Vodka"
tag: artisanal-spirits-vodka
tag_type: sector
description: "Craft distilleries producing premium vodka and other spirits with distinctive character and authentic production methods."
permalink: /tags/sectors/artisanal-spirits-vodka/
---
Russia has a rich history of vodka production dating back centuries. Today's craft distilleries are revitalizing this tradition with small-batch production methods, unique filtration techniques, and regional ingredients that create distinctive products with true terroir and character.
```

Repeat this process for each of your 15 sectors:

**_tags/sectors/wine.md**
```yaml
---
layout: tag
title: "Wine"
tag: wine
tag_type: sector
description: "Russian wineries producing quality wines with unique characteristics from regions like Krasnodar and Crimea."
permalink: /tags/sectors/wine/
---
Russia's wine industry has seen remarkable growth and quality improvements in recent years, particularly in southern regions with favorable climates. Modern wineries are combining international expertise with local grape varieties to create distinctive wines gaining international recognition.
```

**_tags/sectors/specialty-cheeses.md**
```yaml
---
layout: tag
title: "Specialty Cheeses"
tag: specialty-cheeses
tag_type: sector
description: "Artisanal cheese producers creating traditional and innovative varieties using high-quality Russian milk."
permalink: /tags/sectors/specialty-cheeses/
---
Russia's specialty cheese sector has undergone a renaissance following import substitution policies, with artisanal producers developing both traditional Russian varieties and adaptations of European classics with distinctly local character.
```

Continue with all 15 sectors. For brevity, I've only shown three examples, but you should create files for all sectors:
- halal-food-products.md
- mineral-waters.md
- honey-bee-products.md
- gourmet-fish-seafood.md
- fermented-dairy-kefir.md
- artisan-porcelain-ceramics.md
- natural-food-supplements.md
- jewelry-watches.md
- salami-cured-meats.md
- natural-beauty-products.md
- fashion-accessories.md
- artisan-confectionery.md

### 2. Create Business Attribute Tag Files

Create individual files for each business attribute tag in the `_tags/attributes/` directory:

**_tags/attributes/export-ready.md**
```yaml
---
layout: tag
title: "Export-Ready"
tag: export-ready
tag_type: attribute
description: "Brands with products, packaging, and certifications prepared for international markets."
permalink: /tags/attributes/export-ready/
---
Export-ready brands have addressed key requirements for international market entry, including appropriate packaging, required certifications, English/multilingual materials, and logistics preparations.
```

**_tags/attributes/premium-positioning.md**
```yaml
---
layout: tag
title: "Premium Positioning"
tag: premium-positioning
tag_type: attribute
description: "Brands positioned in the premium or luxury segment of their respective markets."
permalink: /tags/attributes/premium-positioning/
---
Brands with premium positioning offer distinctive quality, craftsmanship, or unique attributes that justify higher price points and target discerning consumers seeking exceptional products.
```

Create the remaining business attribute tag files:
- _tags/attributes/authentic-craftsmanship.md
- _tags/attributes/regional-heritage.md
- _tags/attributes/design-excellence.md
- _tags/attributes/sustainable-practices.md
- _tags/attributes/innovative-packaging.md
- _tags/attributes/award-winning.md
- _tags/attributes/market-leaders.md
- _tags/attributes/growth-trajectory.md

## Tag Layout Files

### 1. Create Tag Layout

Create a layout file for tag pages:

**_layouts/tag.html**
```html
---
layout: default
---
<div class="full-width-panel light-panel">
  <div class="panel-content">
    <div class="tag-header">
      <span class="tag-type">{{ page.tag_type | capitalize }}</span>
      <h1>{{ page.title }}</h1>
      <p class="tag-description">{{ page.description }}</p>
    </div>
    
    {{ content }}
    
    <div class="tag-posts">
      <h2>Related Posts</h2>
      <div class="post-grid">
        {% assign posts = site.posts | where: "lang", "en" %}
        {% for post in posts %}
          {% if post.tags contains page.tag %}
            <div class="post-card">
              {% if post.image %}
              <div class="post-image">
                <img src="{{ post.image | relative_url }}" alt="{{ post.title }}">
              </div>
              {% endif %}
              <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
              <p class="post-meta">{{ post.date | date: "%B %-d, %Y" }}</p>
              <p>{{ post.excerpt }}</p>
              <a href="{{ post.url | relative_url }}" class="read-more">Read more</a>
            </div>
          {% endif %}
        {% endfor %}
      </div>
    </div>
  </div>
</div>
```

### 2. Create Tag Collection Configuration

Add tag collection configuration to your `_config.yml` file:

```yaml
# Add to your existing _config.yml
collections:
  tags:
    output: true
    permalink: /tags/:path/
```

## Tag Includes

### 1. Create Tag List Include

Create a reusable include for displaying tag lists:

**_includes/tags/tag-list.html**
```html
<div class="tag-list">
  {% if include.tags %}
    {% assign sector_tags = "" | split: "" %}
    {% assign attribute_tags = "" | split: "" %}
    
    {% for tag in include.tags %}
      {% assign tag_path = tag | slugify %}
      {% if site.tags.sectors[tag_path] %}
        {% assign sector_tags = sector_tags | push: tag %}
      {% else %}
        {% assign attribute_tags = attribute_tags | push: tag %}
      {% endif %}
    {% endfor %}
    
    {% if sector_tags.size > 0 %}
      <div class="sector-tags">
        {% for tag in sector_tags %}
          <a href="{{ site.baseurl }}/tags/sectors/{{ tag | slugify }}/" class="tag sector-tag">{{ tag | replace: '-', ' ' | capitalize }}</a>
        {% endfor %}
      </div>
    {% endif %}
    
    {% if attribute_tags.size > 0 %}
      <div class="attribute-tags">
        {% for tag in attribute_tags %}
          <a href="{{ site.baseurl }}/tags/attributes/{{ tag | slugify }}/" class="tag attribute-tag">{{ tag | replace: '-', ' ' | capitalize }}</a>
        {% endfor %}
      </div>
    {% endif %}
  {% endif %}
</div>
```

### 2. Create Tag Cloud Include

Create a tag cloud for the blog sidebar or dedicated tags page:

**_includes/tags/tag-cloud.html**
```html
<div class="tag-cloud">
  <h3>Sectors</h3>
  <div class="sector-cloud">
    {% for tag_page in site.tags %}
      {% if tag_page.tag_type == "sector" %}
        <a href="{{ tag_page.url | relative_url }}" class="tag sector-tag">
          {{ tag_page.title }}
        </a>
      {% endif %}
    {% endfor %}
  </div>
  
  <h3>Business Attributes</h3>
  <div class="attribute-cloud">
    {% for tag_page in site.tags %}
      {% if tag_page.tag_type == "attribute" %}
        <a href="{{ tag_page.url | relative_url }}" class="tag attribute-tag">
          {{ tag_page.title }}
        </a>
      {% endif %}
    {% endfor %}
  </div>
</div>
```

## CSS Styling for Tags

Add tag styling to your CSS. Create or update `assets/css/components/tags.css`:

```css
/* ==========================================================================
   Tag Styling
   ========================================================================== */

/* Tag list styling */
.tag-list {
  margin: var(--space-4) 0;
}

.sector-tags,
.attribute-tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  margin-bottom: var(--space-2);
}

/* Individual tag styling */
.tag {
  display: inline-block;
  padding: var(--space-1) var(--space-2);
  border-radius: 4px;
  font-size: 0.875rem;
  line-height: 1.4;
  text-decoration: none;
  transition: all 0.2s ease;
}

.sector-tag {
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
}

/* Tag cloud styling */
.tag-cloud {
  margin: var(--space-6) 0;
}

.tag-cloud h3 {
  margin-bottom: var(--space-2);
  font-size: 1.25rem;
}

.sector-cloud,
.attribute-cloud {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  margin-bottom: var(--space-6);
}

/* Tag page styling */
.tag-header {
  margin-bottom: var(--space-8);
}

.tag-type {
  display: inline-block;
  padding: var(--space-1) var(--space-2);
  background-color: var(--neutral-200);
  color: var(--neutral-700);
  border-radius: 4px;
  font-size: 0.875rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: var(--space-2);
}

.tag-description {
  font-size: 1.125rem;
  color: var(--neutral-600);
  margin-bottom: var(--space-4);
  max-width: 40em;
}

.tag-posts h2 {
  margin-top: var(--space-8);
  margin-bottom: var(--space-4);
}
```

Add this CSS file to your main layout or include it in your CSS compilation process.

## Updating Post Templates

### 1. Update Post Layout

Modify your `_layouts/post.html` file to include tags:

```html
---
layout: default
---
<div class="full-width-panel light-panel">
  <div class="panel-content blog-post">
    <h1>{{ page.title }}</h1>
    <p class="post-meta">
      {% if page.author %}{{ page.author }} • {% endif %}
      {{ page.date | date: "%B %-d, %Y" }}
      {% if page.categories.size > 0 %} • 
        <span class="post-category">
          <a href="{{ site.baseurl }}/{{ page.lang }}/blog/categories/{{ page.categories[0] | slugify }}/">
            {{ site.data.translations[page.lang].categories[page.categories[0]] | default: page.categories[0] }}
          </a>
        </span>
      {% endif %}
    </p>
    
    <!-- Add tag list -->
    {% if page.tags %}
      {% include tags/tag-list.html tags=page.tags %}
    {% endif %}
    
    <div class="post-content">
      {{ content }}
    </div>
    
    <!-- Add related content by tag -->
    {% if page.tags %}
      <div class="related-posts">
        <h3>Related Content</h3>
        <div class="post-grid">
          {% assign posts = site.posts | where: "lang", page.lang %}
          {% assign count = 0 %}
          {% for post in posts %}
            {% if post.url != page.url %}
              {% assign has_common_tag = false %}
              {% for tag in page.tags %}
                {% if post.tags contains tag %}
                  {% assign has_common_tag = true %}
                {% endif %}
              {% endfor %}
              
              {% if has_common_tag and count < 3 %}
                <div class="post-card">
                  <h4><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h4>
                  <p class="post-meta">{{ post.date | date: "%B %-d, %Y" }}</p>
                  <a href="{{ post.url | relative_url }}" class="read-more">Read more</a>
                </div>
                {% assign count = count | plus: 1 %}
              {% endif %}
            {% endif %}
          {% endfor %}
        </div>
      </div>
    {% endif %}
    
    <div class="post-navigation">
      <div class="post-nav-links">
        {% if page.previous.url and page.previous.lang == page.lang %}
        <a class="prev" href="{{ page.previous.url | relative_url }}">&laquo; {{ page.previous.title }}</a>
        {% endif %}
        
        {% if page.next.url and page.next.lang == page.lang %}
        <a class="next" href="{{ page.next.url | relative_url }}">{{ page.next.title }} &raquo;</a>
        {% endif %}
      </div>
    </div>
  </div>
</div>
```

### 2. Update Blog Index

Add a tag cloud to your blog index page:

```html
---
layout: default
title: Brandmine Blog
permalink: /en/blog/
lang: en
---

<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h1>Brandmine Blog</h1>
    <p class="lead-text">Insights, analysis, and stories of Russian consumer brands with global potential.</p>
    
    <div class="blog-layout">
      <div class="main-content">
        <div class="category-list">
          <h2>Categories</h2>
          <div class="category-grid">
            <!-- Category cards here -->
          </div>
        </div>
        
        <h2>Recent Posts</h2>
        <div class="post-grid">
          <!-- Post cards here -->
        </div>
      </div>
      
      <div class="sidebar">
        {% include tags/tag-cloud.html %}
      </div>
    </div>
  </div>
</div>
```

## Creating a Tags Index Page

Create a dedicated page to browse all tags:

**blog/tags/index.html**
```html
---
layout: default
title: Explore Topics
permalink: /en/blog/tags/
lang: en
---

<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h1>Explore Topics</h1>
    <p class="lead-text">Browse content by sector or business attribute to find exactly what you're looking for.</p>
    
    <div class="tags-layout">
      <div class="tag-section">
        <h2>Sectors</h2>
        <p>Explore Russian brands by product category</p>
        
        <div class="tag-grid">
          {% for tag_page in site.tags %}
            {% if tag_page.tag_type == "sector" %}
              <div class="tag-card">
                <h3><a href="{{ tag_page.url | relative_url }}">{{ tag_page.title }}</a></h3>
                <p>{{ tag_page.description }}</p>
              </div>
            {% endif %}
          {% endfor %}
        </div>
      </div>
      
      <div class="tag-section">
        <h2>Business Attributes</h2>
        <p>Find brands by business characteristics and market positioning</p>
        
        <div class="tag-grid">
          {% for tag_page in site.tags %}
            {% if tag_page.tag_type == "attribute" %}
              <div class="tag-card">
                <h3><a href="{{ tag_page.url | relative_url }}">{{ tag_page.title }}</a></h3>
                <p>{{ tag_page.description }}</p>
              </div>
            {% endif %}
          {% endfor %}
        </div>
      </div>
    </div>
  </div>
</div>
```

## Sample Post Template

Use this template when creating new blog posts:

**_posts/en/2025-03-16-russian-craft-vodka-brands.md**
```markdown
---
layout: post
title: "Five Russian Craft Vodka Brands Redefining Premium Spirits"
author: Founder Name
date: 2025-03-16
categories: [brand-discoveries]
tags: [artisanal-spirits-vodka, premium-positioning, regional-heritage, export-ready]
lang: en
image: "/assets/images/blog/russian-craft-vodka.jpg"
excerpt: "Discover how small-batch Russian distilleries are transforming vodka from commodity to craft, blending traditional methods with modern sensibilities."
---

Russia's relationship with vodka spans centuries, but today's craft distilleries are writing a new chapter in this storied history. Moving beyond mass production, these artisanal producers are creating distinctive expressions that challenge international perceptions of this quintessential Russian spirit.

## The New Wave of Russian Craft Vodka

While global consumers often associate Russian vodka with large commercial brands, a revolution has been quietly brewing. Small-batch distilleries across the country are reviving traditional production methods, emphasizing regional ingredients, and creating products with true terroir and character.

These craft producers are not just making vodka—they're telling the story of Russian craftsmanship, agricultural heritage, and regional identity through their products.

## Five Standout Brands to Watch

### 1. Altai Spirit

**Location:** Altai Republic  
**Founded:** 2017  
**Signature Product:** Altai Cedar Nut Vodka

Based in the pristine Altai mountains, this distillery creates vodka using local spring water filtered through cedar forests. Their signature product incorporates cedar nuts harvested by local communities, creating a distinctive product with subtle nutty notes and exceptional smoothness.

The beautiful hand-etched bottles feature traditional Altai patterns, making them as visually striking as they are delicious.

### 2. Northern Light Distillery

...
```

## Tag Filtering Implementation

To implement tag filtering functionality for your blog, create a JavaScript file:

**assets/js/tag-filter.js**
```javascript
document.addEventListener('DOMContentLoaded', function() {
  // Get all filter elements
  const sectorFilters = document.querySelectorAll('.sector-filter');
  const attributeFilters = document.querySelectorAll('.attribute-filter');
  const resetFilter = document.querySelector('.reset-filter');
  const postCards = document.querySelectorAll('.post-card');
  
  // Active filters
  let activeFilters = {
    sectors: [],
    attributes: []
  };
  
  // Add event listeners to sector filters
  sectorFilters.forEach(filter => {
    filter.addEventListener('click', function(e) {
      e.preventDefault();
      const sector = this.getAttribute('data-filter');
      
      // Toggle active class
      this.classList.toggle('active');
      
      // Update active filters
      if (this.classList.contains('active')) {
        activeFilters.sectors.push(sector);
      } else {
        const index = activeFilters.sectors.indexOf(sector);
        if (index > -1) {
          activeFilters.sectors.splice(index, 1);
        }
      }
      
      // Apply filters
      applyFilters();
    });
  });
  
  // Add event listeners to attribute filters
  attributeFilters.forEach(filter => {
    filter.addEventListener('click', function(e) {
      e.preventDefault();
      const attribute = this.getAttribute('data-filter');
      
      // Toggle active class
      this.classList.toggle('active');
      
      // Update active filters
      if (this.classList.contains('active')) {
        activeFilters.attributes.push(attribute);
      } else {
        const index = activeFilters.attributes.indexOf(attribute);
        if (index > -1) {
          activeFilters.attributes.splice(index, 1);
        }
      }
      
      // Apply filters
      applyFilters();
    });
  });
  
  // Reset filters
  if (resetFilter) {
    resetFilter.addEventListener('click', function(e) {
      e.preventDefault();
      
      // Clear active classes
      sectorFilters.forEach(filter => filter.classList.remove('active'));
      attributeFilters.forEach(filter => filter.classList.remove('active'));
      
      // Reset active filters
      activeFilters.sectors = [];
      activeFilters.attributes = [];
      
      // Show all posts
      postCards.forEach(card => card.style.display = 'block');
      
      // Update count
      updateVisibleCount();
    });
  }
  
  // Apply filters function
  function applyFilters() {
    // If no filters active, show all posts
    if (activeFilters.sectors.length === 0 && activeFilters.attributes.length === 0) {
      postCards.forEach(card => card.style.display = 'block');
      updateVisibleCount();
      return;
    }
    
    // Apply filters
    postCards.forEach(card => {
      const cardTags = card.getAttribute('data-tags').split(',');
      let showCard = true;
      
      // Check sector filters
      if (activeFilters.sectors.length > 0) {
        let hasSector = false;
        for (const sector of activeFilters.sectors) {
          if (cardTags.includes(sector)) {
            hasSector = true;
            break;
          }
        }
        if (!hasSector) showCard = false;
      }
      
      // Check attribute filters
      if (showCard && activeFilters.attributes.length > 0) {
        let hasAttribute = false;
        for (const attribute of activeFilters.attributes) {
          if (cardTags.includes(attribute)) {
            hasAttribute = true;
            break;
          }
        }
        if (!hasAttribute) showCard = false;
      }
      
      // Show or hide card
      card.style.display = showCard ? 'block' : 'none';
    });
    
    // Update count
    updateVisibleCount();
  }
  
  // Update visible post count
  function updateVisibleCount() {
    const visible = document.querySelectorAll('.post-card[style="display: block"]').length;
    const countElement = document.querySelector('.post-count');
    if (countElement) {
      countElement.textContent = `Showing ${visible} of ${postCards.length} posts`;
    }
  }
});
```

Then create a filter interface template:

**_includes/tags/filter-interface.html**
```html
<div class="filter-interface">
  <h3>Filter Posts</h3>
  
  <div class="filter-section">
    <h4>By Sector</h4>
    <div class="filter-buttons">
      {% for tag_page in site.tags %}
        {% if tag_page.tag_type == "sector" %}
          <button class="filter-button sector-filter" data-filter="{{ tag_page.tag }}">
            {{ tag_page.title }}
          </button>
        {% endif %}
      {% endfor %}
    </div>
  </div>
  
  <div class="filter-section">
    <h4>By Business Attribute</h4>
    <div class="filter-buttons">
      {% for tag_page in site.tags %}
        {% if tag_page.tag_type == "attribute" %}
          <button class="filter-button attribute-filter" data-filter="{{ tag_page.tag }}">
            {{ tag_page.title }}
          </button>
        {% endif %}
      {% endfor %}
    </div>
  </div>
  
  <button class="reset-filter">Reset Filters</button>
  <p class="post-count">Showing {{ site.posts | where: "lang", page.lang | size }} of {{ site.posts | where: "lang", page.lang | size }} posts</p>
</div>
```

## Update All Post Cards to Include Tag Data

Modify your post card include file to include tag data attributes:

**_includes/post-card.html**
```html
<div class="post-card" data-tags="{{ include.post.tags | join: ',' }}">
  {% if include.post.image %}
  <div class="post-image">
    <img src="{{ include.post.image | relative_url }}" alt="{{ include.post.title }}">
  </div>
  {% endif %}
  <h3><a href="{{ include.post.url | relative_url }}">{{ include.post.title }}</a></h3>
  <p class="post-meta">{{ include.post.date | date: "%B %-d, %Y" }}</p>
  
  {% if include.post.tags %}
    {% include tags/tag-list.html tags=include.post.tags %}
  {% endif %}
  
  <p>{{ include.post.excerpt }}</p>
  <a href="{{ include.post.url | relative_url }}" class="read-more">Read more</a>
</div>
```

## Complete Tag System Checklist

- [ ] Create all sector tag files (15)
- [ ] Create all business attribute tag files (10)
- [ ] Set up tag layout file
- [ ] Update post layout to include tags
- [ ] Add tag styling CSS
- [ ] Create tag includes (list and cloud)
- [ ] Configure tag collection in _config.yml
- [ ] Create tags index page
- [ ] Implement tag filtering functionality
- [ ] Test the entire tag system

## Testing Your Tag Implementation

1. Create at least one test post with tags from both sectors and attributes
2. Verify that tag pages correctly display related posts
3. Test tag filtering functionality if implemented
4. Check for proper styling and responsive design
5. Verify that related content shows correctly on post pages

## Expansion Strategy

As you expand to new countries beyond Russia, you can:

1. Keep the same tag structure
2. Add a third dimension with country tags when needed:
   ```bash
   mkdir -p _tags/countries
   ```

3. Create country tag files like:
   ```yaml
   ---
   layout: tag
   title: "China"
   tag: china
   tag_type: country
   description: "Consumer brands from China with export potential."
   permalink: /tags/countries/china/
   ---
   ```

4. Update your tag display logic to handle three dimensions

This tag system provides a strong foundation for your content organization and will scale effectively as your blog grows to cover more brands, sectors, and countries.
