# Step-by-Step Implementation Guide for Brandmine Site Restructuring

This guide outlines the steps needed to restructure the Brandmine Jekyll site according to the new navigation and content organization strategy. The guide is divided into high-level changes followed by detailed implementation steps with code examples.

## High-Level Changes Required

1. **Update Site Navigation Structure**
   - Modify main navigation to use the new structure
   - Create dropdown functionality for the Discover section
   - Add Insights section to main navigation

2. **Create New Page Templates**
   - Develop a Brands page template with filtering
   - Create a Discover section template with tabbed interface
   - Update individual discovery path pages (Sectors, Markets, Attributes, Signals)
   - Create Insights list and detail page templates

3. **Implement Search and Filtering**
   - Create a search implementation for the homepage and brands page
   - Implement filtering functionality using JavaScript
   - Generate JSON data from Jekyll collections

4. **Setup Insights Section**
   - Create insights collection structure
   - Implement insights listing page with categorization
   - Develop insights detail page template
   - Configure related content recommendations

5. **Update Content Organization**
   - Reorganize existing content to fit the new structure
   - Update links throughout the site to match new paths
   - Ensure multilingual support across all pages

6. **Implement Premium Content Controls**
   - Add premium content markers in the front matter
   - Create JavaScript toggle for premium content visibility

## Detailed Implementation Steps

### 1. Update Site Navigation

#### 1.1 Modify the Header Include

Edit `_includes/header.html` to implement the new navigation structure with Insights:

```html
<header class="site-header">
  <div class="wrapper">
    <!-- Site title/logo -->
    <a class="site-title" href="{{ site.baseurl }}/{{ page.lang }}/">{{ site.data.translations[page.lang].site.title }}</a>
    
    <!-- Add hamburger menu button -->
    <button class="menu-toggle" aria-label="Toggle menu">
      <span class="menu-icon"></span>
    </button>
        
    <!-- Main navigation -->
    <nav class="site-nav">
      <a href="{{ site.baseurl }}/{{ page.lang }}/">{{ site.data.translations[page.lang].nav.home }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/brands/">{{ site.data.translations[page.lang].nav.brands }}</a>
      
      <div class="dropdown">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/" class="dropbtn">{{ site.data.translations[page.lang].nav.discover }}</a>
        <div class="dropdown-content">
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/">{{ site.data.translations[page.lang].nav.sectors }}</a>
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/">{{ site.data.translations[page.lang].nav.markets }}</a>
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/">{{ site.data.translations[page.lang].nav.attributes }}</a>
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/">{{ site.data.translations[page.lang].nav.signals }}</a>
        </div>
      </div>
      
      <a href="{{ site.baseurl }}/{{ page.lang }}/insights/">{{ site.data.translations[page.lang].nav.insights }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/about/">{{ site.data.translations[page.lang].nav.about }}</a>
      
      <!-- Language selector -->
      {% include language-selector.html %}
    </nav>
  </div>
</header>
```

#### 1.2 Update Translation Files

Add the new navigation terms to your translation files:

For `_data/translations/en.yml`:
```yaml
nav:
  home: "Home"
  brands: "Brands"
  discover: "Discover"
  sectors: "Sectors"
  markets: "Markets"
  attributes: "Attributes"
  signals: "Signals"
  insights: "Insights"
  about: "About"
```

For `_data/translations/ru.yml`:
```yaml
nav:
  home: "Главная"
  brands: "Бренды"
  discover: "Открыть"
  sectors: "Секторы"
  markets: "Рынки"
  attributes: "Атрибуты"
  signals: "Сигналы"
  insights: "Аналитика"
  about: "О нас"
```

For `_data/translations/zh.yml`:
```yaml
nav:
  home: "首页"
  brands: "品牌"
  discover: "发现"
  sectors: "行业"
  markets: "市场"
  attributes: "特性"
  signals: "信号"
  insights: "洞察"
  about: "关于我们"
```

Also add insights-specific translations:

For `_data/translations/en.yml`:
```yaml
insights:
  latest: "Latest Insights"
  categories: "Categories"
  read_more: "Read More"
  related: "Related Insights"
  featured: "Featured"
  published_on: "Published on"
  author: "Author"
  back_to_insights: "Back to Insights"
  premium_content: "Premium Content"
  all_insights: "View All Insights"
```

Add equivalent translations for Russian and Chinese.

### 2. Create Jekyll Collections Configuration

Update your `_config.yml` to include the insights collection:

```yaml
collections:
  brands:
    output: true
    permalink: /:collection/:path/
  tags:
    output: true
    permalink: /:collection/:path/
  insights:
    output: true
    permalink: /:collection/:path/
```

Add defaults for insights:

```yaml
defaults:
  # Other defaults...
  
  # Insights defaults by language
  - scope:
      path: "_insights/en"
      type: "insights"
    values:
      layout: "insight"
      lang: "en"
  - scope:
      path: "_insights/ru"
      type: "insights"
    values:
      layout: "insight"
      lang: "ru"
  - scope:
      path: "_insights/zh"
      type: "insights"
    values:
      layout: "insight"
      lang: "zh"
```

### 3. Create Insights Page Templates

#### 3.1 Create Insights Index Template

Create a new file `_layouts/insights.html` for the insights listing page:

```html
---
layout: default
---

<div class="full-width-panel hero-panel">
  <div class="panel-content centered">
    <h1>{{ page.title }}</h1>
    <p class="hero-subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<div class="full-width-panel light-panel">
  <div class="panel-content">
    <div class="insights-container">
      <div class="insights-main">
        <h2>{{ site.data.translations[page.lang].insights.latest }}</h2>
        
        <div class="insights-grid">
          {% assign insights = site.insights | where: "lang", page.lang | sort: "date" | reverse %}
          {% for insight in insights %}
          <div class="insight-card {% if insight.featured %}featured-insight{% endif %}">
            {% if insight.image %}
            <div class="insight-image">
              <img src="{{ insight.image | relative_url }}" alt="{{ insight.title }}">
            </div>
            {% endif %}
            
            <div class="insight-content">
              {% if insight.featured %}
              <span class="featured-badge">{{ site.data.translations[page.lang].insights.featured }}</span>
              {% endif %}
              
              {% if insight.premium %}
              <span class="premium-badge">{{ site.data.translations[page.lang].insights.premium_content }}</span>
              {% endif %}
              
              <div class="insight-meta">
                <span class="insight-date">{{ insight.date | date: "%B %-d, %Y" }}</span>
                {% if insight.author %}
                <span class="insight-author">{{ insight.author }}</span>
                {% endif %}
              </div>
              
              <h3><a href="{{ insight.url | relative_url }}">{{ insight.title }}</a></h3>
              
              <p>{{ insight.excerpt | strip_html | truncate: 120 }}</p>
              
              <a href="{{ insight.url | relative_url }}" class="read-more">{{ site.data.translations[page.lang].insights.read_more }}</a>
            </div>
          </div>
          {% endfor %}
        </div>
      </div>
      
      <div class="insights-sidebar">
        <div class="sidebar-section">
          <h3>{{ site.data.translations[page.lang].insights.categories }}</h3>
          <ul class="category-list">
            {% assign categories = insights | map: "categories" | flatten | uniq %}
            {% for category in categories %}
            <li><a href="{{ site.baseurl }}/{{ page.lang }}/insights/categories/{{ category | slugify }}/">{{ category }}</a></li>
            {% endfor %}
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
```

#### 3.2 Create Insight Detail Template

Create a new file `_layouts/insight.html` for individual insight posts:

```html
---
layout: default
---

<div class="full-width-panel light-panel">
  <div class="panel-content">
    <div class="insight-detail-container">
      <div class="insight-detail-main {% if page.premium %}premium-content{% endif %}">
        <div class="insight-header">
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/" class="back-link">
            ← {{ site.data.translations[page.lang].insights.back_to_insights }}
          </a>
          
          <h1>{{ page.title }}</h1>
          
          <div class="insight-meta">
            <span class="insight-date">{{ site.data.translations[page.lang].insights.published_on }} {{ page.date | date: "%B %-d, %Y" }}</span>
            {% if page.author %}
            <span class="insight-author">{{ site.data.translations[page.lang].insights.author }}: {{ page.author }}</span>
            {% endif %}
            
            {% if page.premium %}
            <span class="premium-badge">{{ site.data.translations[page.lang].insights.premium_content }}</span>
            {% endif %}
          </div>
          
          {% if page.image %}
          <div class="insight-feature-image">
            <img src="{{ page.image | relative_url }}" alt="{{ page.title }}">
          </div>
          {% endif %}
        </div>
        
        <div class="insight-content">
          {{ content }}
        </div>
        
        {% if page.categories %}
        <div class="insight-categories">
          {% for category in page.categories %}
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/categories/{{ category | slugify }}/" class="category-tag">{{ category }}</a>
          {% endfor %}
        </div>
        {% endif %}
      </div>
      
      <div class="insight-detail-sidebar">
        <div class="sidebar-section">
          <h3>{{ site.data.translations[page.lang].insights.related }}</h3>
          <div class="related-insights">
            {% assign related_insights = site.insights | where: "lang", page.lang | where_exp: "item", "item.url != page.url" | sample: 3 %}
            {% for related in related_insights %}
            <div class="related-insight">
              <h4><a href="{{ related.url | relative_url }}">{{ related.title }}</a></h4>
              <span class="insight-date">{{ related.date | date: "%B %-d, %Y" }}</span>
            </div>
            {% endfor %}
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
```

#### 3.3 Create Category Page Template

Create a new file `_layouts/category.html` for insight category pages:

```html
---
layout: default
---

<div class="full-width-panel hero-panel">
  <div class="panel-content centered">
    <h1>{{ page.title }}</h1>
  </div>
</div>

<div class="full-width-panel light-panel">
  <div class="panel-content">
    <div class="insights-container">
      <div class="insights-main">
        <div class="insights-grid">
          {% assign insights = site.insights | where: "lang", page.lang | where: "categories", page.category | sort: "date" | reverse %}
          {% for insight in insights %}
          <div class="insight-card {% if insight.featured %}featured-insight{% endif %}">
            {% if insight.image %}
            <div class="insight-image">
              <img src="{{ insight.image | relative_url }}" alt="{{ insight.title }}">
            </div>
            {% endif %}
            
            <div class="insight-content">
              {% if insight.featured %}
              <span class="featured-badge">{{ site.data.translations[page.lang].insights.featured }}</span>
              {% endif %}
              
              {% if insight.premium %}
              <span class="premium-badge">{{ site.data.translations[page.lang].insights.premium_content }}</span>
              {% endif %}
              
              <div class="insight-meta">
                <span class="insight-date">{{ insight.date | date: "%B %-d, %Y" }}</span>
                {% if insight.author %}
                <span class="insight-author">{{ insight.author }}</span>
                {% endif %}
              </div>
              
              <h3><a href="{{ insight.url | relative_url }}">{{ insight.title }}</a></h3>
              
              <p>{{ insight.excerpt | strip_html | truncate: 120 }}</p>
              
              <a href="{{ insight.url | relative_url }}" class="read-more">{{ site.data.translations[page.lang].insights.read_more }}</a>
            </div>
          </div>
          {% endfor %}
        </div>
        
        <div class="back-link-container">
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/" class="btn-secondary">{{ site.data.translations[page.lang].insights.back_to_insights }}</a>
        </div>
      </div>
      
      <div class="insights-sidebar">
        <div class="sidebar-section">
          <h3>{{ site.data.translations[page.lang].insights.categories }}</h3>
          <ul class="category-list">
            {% assign all_insights = site.insights | where: "lang", page.lang %}
            {% assign categories = all_insights | map: "categories" | flatten | uniq %}
            {% for category in categories %}
            <li class="{% if category == page.category %}active{% endif %}">
              <a href="{{ site.baseurl }}/{{ page.lang }}/insights/categories/{{ category | slugify }}/">{{ category }}</a>
            </li>
            {% endfor %}
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
```

### 4. Create Insights CSS

Add these styles to a new file `assets/css/components/insights.css`:

```css
/* Insights Pages Styling */
.insights-container {
  display: flex;
  gap: var(--space-6);
}

.insights-main {
  flex: 3;
}

.insights-sidebar {
  flex: 1;
}

.insights-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  gap: var(--space-4);
  margin-bottom: var(--space-6);
}

.insight-card {
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  overflow: hidden;
  display: flex;
  flex-direction: column;
  transition: transform 0.2s, box-shadow 0.2s;
  border: 1px solid var(--neutral-200);
}

.insight-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.insight-image {
  height: 180px;
  overflow: hidden;
}

.insight-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.insight-content {
  padding: var(--space-4);
  display: flex;
  flex-direction: column;
  flex-grow: 1;
}

.insight-meta {
  display: flex;
  gap: var(--space-2);
  margin-bottom: var(--space-2);
  font-size: 0.875rem;
  color: var(--neutral-500);
}

.insight-card h3 {
  margin-top: 0;
  margin-bottom: var(--space-2);
}

.insight-card p {
  margin-top: 0;
  margin-bottom: var(--space-3);
  color: var(--neutral-600);
  flex-grow: 1;
}

.read-more {
  color: var(--primary-600);
  font-weight: 500;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
}

.read-more:hover {
  text-decoration: underline;
}

.featured-insight {
  grid-column: span 2;
  display: flex;
  flex-direction: row;
}

.featured-insight .insight-image {
  flex: 1;
  height: auto;
}

.featured-insight .insight-content {
  flex: 1;
}

.featured-badge {
  background-color: var(--primary-600);
  color: white;
  font-size: 0.75rem;
  padding: 0.25rem 0.5rem;
  border-radius: 0.25rem;
  display: inline-block;
  margin-bottom: var(--space-2);
}

.premium-badge {
  background-color: var(--secondary-600);
  color: white;
  font-size: 0.75rem;
  padding: 0.25rem 0.5rem;
  border-radius: 0.25rem;
  display: inline-block;
  margin-bottom: var(--space-2);
  margin-left: var(--space-2);
}

.sidebar-section {
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  padding: var(--space-4);
  margin-bottom: var(--space-4);
  border: 1px solid var(--neutral-200);
}

.sidebar-section h3 {
  margin-top: 0;
  margin-bottom: var(--space-3);
  font-size: 1.125rem;
}

.category-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.category-list li {
  margin-bottom: var(--space-2);
}

.category-list li a {
  color: var(--neutral-700);
  text-decoration: none;
}

.category-list li a:hover {
  color: var(--primary-600);
}

.category-list li.active a {
  color: var(--primary-600);
  font-weight: 600;
}

/* Insight Detail Page */
.insight-detail-container {
  display: flex;
  gap: var(--space-6);
}

.insight-detail-main {
  flex: 3;
}

.insight-detail-sidebar {
  flex: 1;
}

.insight-header {
  margin-bottom: var(--space-6);
}

.back-link {
  display: inline-block;
  margin-bottom: var(--space-4);
  color: var(--neutral-600);
  text-decoration: none;
}

.back-link:hover {
  color: var(--primary-600);
}

.insight-feature-image {
  margin-top: var(--space-4);
  margin-bottom: var(--space-4);
  border-radius: 0.5rem;
  overflow: hidden;
}

.insight-feature-image img {
  width: 100%;
  display: block;
}

.insight-content {
  font-size: 1.125rem;
  line-height: 1.7;
  color: var(--neutral-800);
}

.insight-content h2 {
  margin-top: var(--space-6);
  margin-bottom: var(--space-4);
}

.insight-content p {
  margin-bottom: var(--space-4);
}

.insight-categories {
  margin-top: var(--space-6);
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
}

.category-tag {
  background-color: var(--neutral-100);
  color: var(--neutral-700);
  padding: 0.25rem 0.75rem;
  border-radius: 1rem;
  font-size: 0.875rem;
  text-decoration: none;
}

.category-tag:hover {
  background-color: var(--neutral-200);
}

.related-insights {
  display: flex;
  flex-direction: column;
  gap: var(--space-3);
}

.related-insight h4 {
  margin: 0 0 var(--space-1) 0;
  font-size: 1rem;
}

.related-insight a {
  color: var(--neutral-800);
  text-decoration: none;
}

.related-insight a:hover {
  color: var(--primary-600);
}

.related-insight .insight-date {
  font-size: 0.75rem;
  color: var(--neutral-500);
}

.back-link-container {
  margin-top: var(--space-6);
  text-align: center;
}

@media (max-width: 768px) {
  .insights-container, 
  .insight-detail-container {
    flex-direction: column;
  }
  
  .featured-insight {
    grid-column: span 1;
    flex-direction: column;
  }
  
  .insights-grid {
    grid-template-columns: 1fr;
  }
}
```

Include this file in your `_layouts/default.html`:

```html
<!-- In the head section -->
<link rel="stylesheet" href="{{ '/assets/css/components/insights.css' | relative_url }}">
```

### 5. Create Insights Index Pages

Create the main insights index page for each language:

File: `/pages/en/insights.md`:
```yaml
---
layout: insights
title: Insights
subtitle: Expert analysis and thought leadership on BRICS+ consumer brands
permalink: /en/insights/
lang: en
---
```

File: `/pages/ru/insights.md`:
```yaml
---
layout: insights
title: Аналитика
subtitle: Экспертный анализ и идеи о потребительских брендах стран БРИКС+
permalink: /ru/insights/
lang: ru
---
```

File: `/pages/zh/insights.md`:
```yaml
---
layout: insights
title: 洞察
subtitle: 金砖国家消费品牌的专家分析与思想领导力
permalink: /zh/insights/
lang: zh
---
```

### 6. Create Category Pages

For each category, create a page in each language:

File: `/pages/en/insights/categories/market-trends.md`:
```yaml
---
layout: category
title: Market Trends
category: Market Trends
permalink: /en/insights/categories/market-trends/
lang: en
---
```

Create similar pages for other categories and languages.

### 7. Create Example Insight Posts

Create example insight posts with this front matter structure in `_insights/en/`:

```yaml
---
layout: insight
title: "The Rise of Russian Boutique Hotels: An Investment Opportunity"
date: 2025-03-15
author: "Anna Petrova"
categories: [Market Trends, Investment Opportunities]
image: /assets/images/insights/russian-boutique-hotels.jpg
featured: true
premium: false
permalink: /en/insights/russian-boutique-hotels/
lang: en
---

Content for the insight post goes here...

## Introduction

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, velit vel bibendum bibendum, velit velit bibendum velit, vel bibendum bibendum velit.

## Market Analysis

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, velit vel bibendum bibendum, velit velit bibendum velit, vel bibendum bibendum velit.

## Investment Potential

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, velit vel bibendum bibendum, velit velit bibendum velit, vel bibendum bibendum velit.

## Conclusion

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, velit vel bibendum bibendum, velit velit bibendum velit, vel bibendum bibendum velit.
```

Create similar posts for Russian and Chinese by updating the language code, path in permalink, and translating the content.

### 8. Update Homepage to Feature Insights

Add an insights section to your homepage to promote this content:

```html
<!-- Insights Preview Panel -->
<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h2>{{ site.data.translations[page.lang].insights.latest }}</h2>
    
    <div class="featured-insights">
      {% assign insights = site.insights | where: "lang", page.lang | where: "featured", true | sort: "date" | reverse | limit: 3 %}
      
      {% for insight in insights %}
      <div class="insight-card">
        {% if insight.image %}
        <div class="insight-image">
          <img src="{{ insight.image | relative_url }}" alt="{{ insight.title }}">
        </div>
        {% endif %}
        
        <div class="insight-content">
          {% if insight.premium %}
          <span class="premium-badge">{{ site.data.translations[page.lang].insights.premium_content }}</span>
          {% endif %}
          
          <div class="insight-meta">
            <span class="insight-date">{{ insight.date | date: "%B %-d, %Y" }}</span>
          </div>
          
          <h3><a href="{{ insight.url | relative_url }}">{{ insight.title }}</a></h3>
          
          <p>{{ insight.excerpt | strip_html | truncate: 120 }}</p>
          
          <a href="{{ insight.url | relative_url }}" class="read-more">{{ site.data.translations[page.lang].insights.read_more }}</a>
        </div>
      </div>
      {% endfor %}
    </div>
    
    <div class="centered">
      <a href="{{ site.baseurl }}/{{ page.lang }}/insights/" class="btn-primary">{{ site.data.translations[page.lang].insights.all_insights }}</a>
    </div>
  </div>
</div>
```

### 9. Update JSON Data Generation to Include Insights

Update your `brands-data.json` file to include insights:

```liquid
---
layout: null
---
{
  "brands": [
    // Existing brand data
  ],
  "insights": [
    {% for insight in site.insights %}
    {
      "title": "{{ insight.title | escape }}",
      "url": "{{ insight.url | relative_url }}",
      "excerpt": "{{ insight.excerpt | strip_html | truncate: 160 | escape }}",
      "date": "{{ insight.date | date: "%Y-%m-%d" }}",
      "author": "{{ insight.author | escape }}",
      "categories": [{% for category in insight.categories %}"{{ category }}"{% unless forloop.last %},{% endunless %}{% endfor %}],
      "image": "{{ insight.image | relative_url }}",
      "premium": {% if insight.premium %}true{% else %}false{% endif %},
      "featured": {% if insight.featured %}true{% else %}false{% endif %},
      "language": "{{ insight.lang }}"
    }{% unless forloop.last %},{% endunless %}
    {% endfor %}
  ],
  // Existing tag data
}
```

### 10. Implement Premium Content for Insights

Update the premium content handling in `assets/js/premium-content.js` to specifically target insight posts:

```javascript
// Add this to your existing premium content handling
const premiumInsights = document.querySelectorAll('.insight-detail-main.premium-content');

premiumInsights.forEach(insight => {
  if (hasPremiumAccess) {
    insight.classList.remove('content-locked');
  } else {
    // Only lock content after the first paragraph
    const contentElements = insight.querySelectorAll('.insight-content > *');
    
    if (contentElements.length > 1) {
      for (let i = 1; i < contentElements.length; i++) {
        contentElements[i].classList.add('premium-locked');
      }
      
      // Add premium notice after first paragraph
      const premiumNotice = document.createElement('div');
      premiumNotice.className = 'premium-overlay insight-premium-notice';
      premiumNotice.innerHTML = `
        <h3>${messages[currentLang].title}</h3>
        <p>${messages[currentLang].description}</p>
        <button class="btn-primary upgrade-button">${messages[currentLang].button}</button>
      `;
      
      contentElements[0].insertAdjacentElement('afterend', premiumNotice);
      
      // Add event listener to the upgrade button
      const upgradeButton = premiumNotice.querySelector('.upgrade-button');
      upgradeButton.addEventListener('click', function() {
        localStorage.setItem('premiumAccess', 'true');
        location.reload();
      });
    }
  }
});
```

Add additional CSS for premium insights:

```css
.insight-premium-notice {
  position: relative;
  margin: var(--space-6) 0;
  padding: var(--space-4);
  text-align: center;
  border-radius: 0.5rem;
}

.premium-locked {
  filter: blur(4px);
  pointer-events: none;
}
```

### 11. Implementation Checklist

Here's a summary of the steps needed to implement the Insights section:

1. **Navigation Update**
   - [ ] Modify `_includes/header.html` with the new structure
   - [ ] Update translation files with new navigation terms
   - [ ] Add insights-specific translations

2. **Collection Configuration**
   - [ ] Update `_config.yml` with insights collection
   - [ ] Add front matter defaults for insights

3. **Page Templates**
   - [ ] Create insights listing template
   - [ ] Create insight detail template
   - [ ] Create category page template
   - [ ] Add CSS for insights pages

4. **Page Creation**
   - [ ] Create insights index pages for each language
   - [ ] Create category pages for each language
   - [ ] Create example insight posts

5. **Homepage Integration**
   - [ ] Add insights preview section to homepage
   - [ ] Add link to full insights section

6. **Data Generation**
   - [ ] Update JSON data generation to include insights
   - [ ] Ensure proper language filtering

7. **Premium Content**
   - [ ] Implement premium content handling for insights
   - [ ] Create teaser/preview approach for premium insights
   - [ ] Add visual indicators for premium content

8. **Testing**
   - [ ] Test insights navigation across all languages
   - [ ] Test category filtering
   - [ ] Test premium content controls
   - [ ] Verify responsive layout on mobile devices

## Example Directory Structure

Your insights content should be organized following this structure:

```
_insights/
├── en/
│   ├── 2025-03-15-russian-boutique-hotels.md
│   ├── 2025-03-10-chinese-spirits-market.md
│   └── ... (more insights)
├── ru/
│   ├── 2025-03-15-russian-boutique-hotels.md
│   ├── 2025-03-10-chinese-spirits-market.md
│   └── ... (more insights)
└── zh/
    ├── 2025-03-15-russian-boutique-hotels.md
    ├── 2025-03-10-chinese-spirits-market.md
    └── ... (more insights)

pages/
├── en/
│   ├── insights.md
│   └── insights/
│       └── categories/
│           ├── market-trends.md
│           ├── investment-opportunities.md
│           └── ... (more categories)
├── ru/
│   ├── insights.md
│   └── insights/
│       └── categories/
│           ├── market-trends.md
│           ├── investment-opportunities.md
│           └── ... (more categories)
└── zh/
    ├── insights.md
    └── insights/
        └── categories/
            ├── market-trends.md
            ├── investment-opportunities.md
            └── ... (more categories)
```

## Integration with Existing Features

### Connecting Insights to Brands

To create connections between insights and brands, add references in your insight front matter:

```yaml
---
layout: insight
title: "The Rise of Russian Boutique Hotels: An Investment Opportunity"
date: 2025-03-15
author: "Anna Petrova"
categories: [Market Trends, Investment Opportunities]
related_brands: [grand-hotel-moscow, siberian-retreat, volga-boutique]
image: /assets/images/insights/russian-boutique-hotels.jpg
featured: true
premium: false
permalink: /en/insights/russian-boutique-hotels/
lang: en
---
```

Then, in your brand detail template, you can display related insights:

```liquid
{% if page.related_insights %}
<div class="related-insights">
  <h3>{{ site.data.translations[page.lang].brand.related_insights }}</h3>
  <div class="insights-list">
    {% for insight_slug in page.related_insights %}
      {% assign insight = site.insights | where: "slug", insight_slug | where: "lang", page.lang | first %}
      {% if insight %}
      <div class="related-insight">
        <h4><a href="{{ insight.url | relative_url }}">{{ insight.title }}</a></h4>
        <span class="insight-date">{{ insight.date | date: "%B %-d, %Y" }}</span>
      </div>
      {% endif %}
    {% endfor %}
  </div>
</div>
{% endif %}
```

Alternatively, if you want to show related insights based on sector or other attributes:

```liquid
<div class="related-insights">
  <h3>{{ site.data.translations[page.lang].brand.related_insights }}</h3>
  <div class="insights-list">
    {% assign related_insights = site.insights | where: "lang", page.lang | where: "categories", page.sector | limit: 3 %}
    {% for insight in related_insights %}
    <div class="related-insight">
      <h4><a href="{{ insight.url | relative_url }}">{{ insight.title }}</a></h4>
      <span class="insight-date">{{ insight.date | date: "%B %-d, %Y" }}</span>
    </div>
    {% endfor %}
  </div>
</div>
```

### Featuring Insights in Discovery Sections

You can also feature relevant insights in your discovery section pages:

```liquid
<!-- In discover/sectors.html or similar template -->
<div class="related-insights-section">
  <h3>Latest Insights on {{ page.title }}</h3>
  
  {% assign related_insights = site.insights | where: "lang", page.lang | where: "categories", page.title | sort: "date" | reverse | limit: 2 %}
  
  {% if related_insights.size > 0 %}
  <div class="insights-grid small-grid">
    {% for insight in related_insights %}
    <div class="insight-card">
      {% if insight.image %}
      <div class="insight-image">
        <img src="{{ insight.image | relative_url }}" alt="{{ insight.title }}">
      </div>
      {% endif %}
      
      <div class="insight-content">
        <h3><a href="{{ insight.url | relative_url }}">{{ insight.title }}</a></h3>
        <p>{{ insight.excerpt | strip_html | truncate: 100 }}</p>
        <a href="{{ insight.url | relative_url }}" class="read-more">{{ site.data.translations[page.lang].insights.read_more }}</a>
      </div>
    </div>
    {% endfor %}
  </div>
  {% else %}
  <p>No insights available for this topic yet.</p>
  {% endif %}
</div>
```

## Monetization Implementation

To implement premium content restrictions for insights:

1. **Mark Premium Content in Front Matter**:
   ```yaml
   premium: true
   ```

2. **Add Visual Indicators for Premium Content**:
   - Premium badges on insight cards
   - Lock icons on premium content sections
   - Upgrade calls-to-action

3. **Create Teaser Access**:
   - Allow free users to see the first paragraph or section
   - Blur or hide the remainder of the content
   - Show an upgrade prompt between the free and premium sections

4. **Track Premium Content Engagement**:
   - Add analytics events for premium content views
   - Track upgrade button clicks
   - Measure conversion from free to premium users

## Full Example of an Insights Category Page

Here is a complete implementation example for an insights category page in English:

`/pages/en/insights/categories/market-trends.md`:
```yaml
---
layout: category
title: Market Trends
category: Market Trends
permalink: /en/insights/categories/market-trends/
lang: en
---
```

This page will automatically display all insights tagged with the "Market Trends" category in English, sorted by date, with the most recent posts first. The template handles the display of featured and premium content indicators, provides category navigation, and includes links back to the main insights page.

The multilingual structure ensures that each language has its own dedicated category pages, displaying only content in the appropriate language while maintaining consistent navigation and user experience across the site.

## Conclusion

Adding the Insights section to your site architecture provides valuable content marketing opportunities while establishing Brandmine as an authority in BRICS+ markets. The implementation leverages your existing Jekyll infrastructure and multilingual support, with new templates and CSS to create a professional, engaging content section.

By featuring insights throughout the site—on the homepage, in discovery sections, and on brand pages—you create multiple entry points for users while reinforcing the connections between your expert content and brand profiles. The premium content capabilities also establish clear monetization paths for high-value market intelligence.

This implementation approach ensures the Insights section is fully integrated with your streamlined navigation structure while maintaining the focus on brand discovery that is core to your platform's value proposition.