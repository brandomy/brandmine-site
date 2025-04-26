---
layout: discover
title: Discover by Business Sector
subtitle: Explore leading brands from top sectors in the BRICS+
permalink: /en/discover/sectors/
lang: en
ref: sectors
discovery_path: sectors
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary sectors__title">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- All Sectors Grid Panel -->
<div class="panel panel--olive-soft">
  <div class="panel__content panel__content--full-width">
    <!-- All Sectors Grid -->
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          All Sectors
        </h2>
        <p class="sectors__section-description">Explore all available business sectors in our database</p>
      </div>
      
      <div class="sectors__grid">
        {% assign sectors_data = site.data.sectors[page.lang] %}
        {% for sector in sectors_data %}
          {% assign slug = sector.id %}
          {% assign name = sector.name %}
          {% assign icon_id = sector.icon %}
          {% assign brand_count = site.brands | where: "lang", page.lang | where: "sector", name | size %}
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ slug }}/" class="sectors__item sectors__item--sector">
            <div class="sectors__item-content">
              <h3 class="sectors__item-title">{{ name }}</h3>
              <div class="sectors__item-meta">
                <span class="sectors__item-count">{{ brand_count | default: 0 }} brands</span>
              </div>
              <div class="sectors__item-icon">
                {% include components/icons/icon.html type="sector" name=icon_id %}
              </div>
            </div>
          </a>
        {% endfor %}
      </div>
    </section>
  </div>
</div>

<!-- Russian Sectors Special Focus Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content panel__content--full-width">
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--russian">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          Russian Sectors Special Focus
        </h2>
        <p class="sectors__section-description">Explore our in-depth analysis of 16 high-potential Russian consumer sectors</p>
      </div>
      
      <div class="sectors__featured">
        <div class="sectors__featured-item sectors__featured-item--special">
          <div class="sectors__featured-image">
            <img src="{{ site.baseurl }}/assets/images/sectors/russian-overview.jpg" alt="Russian Sectors Overview" class="sectors__featured-img" onerror="this.src='{{ site.baseurl }}/assets/images/sectors/confectionery.jpg'">
          </div>
          <div class="sectors__featured-content">
            <h3 class="sectors__featured-title">Russian Consumer Brand Sectors</h3>
            <p class="sectors__featured-description">Discover our curated selection of 16 high-potential Russian consumer sectors, from artisanal spirits and natural beauty products to specialty foods and hospitality. Each sector offers unique investment and partnership opportunities with compelling narratives.</p>
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="sectors__featured-link btn btn-outline">Explore Russian Sectors</a>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Featured Sectors Panel -->
<div class="panel panel--secondary-soft">
  <div class="panel__content panel__content--full-width">
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--featured">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2l2.4 7.4h7.6l-6 4.6 2.3 7-6.3-4.6-6.3 4.6 2.3-7-6-4.6h7.6z"></path>
            </svg>
          </span>
          Featured Sectors
        </h2>
        <p class="sectors__section-description">Explore our highlighted business sectors with the most promising brands</p>
      </div>
      
      <div class="sectors__featured">
        <div class="sectors__featured-grid">
          <!-- Featured Sector 1: Hotels & Resorts -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/hotels-resorts.jpg" alt="Hotels & Resorts" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">Hotels & Resorts</h3>
              <p class="sectors__featured-description">From historic city properties to remote wilderness retreats, Russian boutique hotels and resorts offer unique cultural experiences that showcase the country's remarkable diversity.</p>
              <div class="sectors__featured-meta">
                {% assign hotel_count = site.brands | where: "lang", page.lang | where: "sector", "Hotels & Resorts" | size %}
                <span class="sectors__featured-count">{{ hotel_count }} brands</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/hotels-resorts/" class="sectors__featured-link btn btn-outline">Explore Hotels & Resorts</a>
            </div>
          </div>
          
          <!-- Featured Sector 2: Artisanal Spirits & Vodka -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/artisanal-spirits.jpg" alt="Artisanal Spirits & Vodka" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">Artisanal Spirits & Vodka</h3>
              <p class="sectors__featured-description">Russia's craft spirits scene has experienced a renaissance, with over 80 new premium distilleries emerging in the past decade creating distinctive products with compelling stories.</p>
              <div class="sectors__featured-meta">
                {% assign spirits_count = site.brands | where: "lang", page.lang | where: "sector", "Artisanal Spirits & Vodka" | size %}
                <span class="sectors__featured-count">{{ spirits_count }} brands</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/artisanal-spirits/" class="sectors__featured-link btn btn-outline">Explore Artisanal Spirits</a>
            </div>
          </div>
          
          <!-- Featured Sector 3: Natural Beauty Products -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/natural-beauty.jpg" alt="Natural Beauty Products" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">Natural Beauty Products</h3>
              <p class="sectors__featured-description">Russia's natural beauty sector leverages the country's vast botanical resources, particularly from Siberia and the Far East, where plants have evolved potent bioactive compounds.</p>
              <div class="sectors__featured-meta">
                {% assign beauty_count = site.brands | where: "lang", page.lang | where: "sector", "Natural Beauty Products" | size %}
                <span class="sectors__featured-count">{{ beauty_count }} brands</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/natural-beauty/" class="sectors__featured-link btn btn-outline">Explore Natural Beauty</a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Related Insights Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content panel__content--full-width">
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--insights">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="11" cy="11" r="8"></circle>
              <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
              <line x1="11" y1="8" x2="11" y2="14"></line>
              <line x1="8" y1="11" x2="14" y2="11"></line>
            </svg>
          </span>
          Sector Insights
        </h2>
        <p class="sectors__section-description">Read our latest analyses and stories about BRICS+ business sectors</p>
      </div>
      
      <div class="sectors__insights">
        {% assign sector_insights = site.insights | where: "lang", page.lang | where: "primary_dimension", "sectors" | sort: "date" | reverse | limit: 2 %}
        
        <!-- Make sure we have at least 2 insights with sector tags -->
        {% if sector_insights.size < 2 %}
          {% assign all_insights = site.insights | where: "lang", page.lang %}
          {% assign sector_insights = "" | split: "" %}
          {% for insight in all_insights %}
            {% if insight.sectors.size > 0 %}
              {% assign sector_insights = sector_insights | push: insight %}
            {% endif %}
          {% endfor %}
          {% assign sector_insights = sector_insights | sort: "date" | reverse | slice: 0, 2 %}
        {% endif %}
        
        {% if sector_insights.size > 0 %}
          <div class="insights-category-grid">
            {% for insight in sector_insights %}
              <div class="insights-category__card">
                <a href="{{ insight.url | relative_url }}">
                  <div class="insights-category__image-wrapper">
                    <img src="{{ insight.image | relative_url }}" alt="{{ insight.title }}" class="insights-category__image">
                  </div>
                  <div class="insights-category__content">
                    <h4 class="insights-category__card-title">{{ insight.title }}</h4>
                    <p class="insights-category__excerpt">{{ insight.excerpt | strip_html | truncate: 120 }}</p>
                    <div class="insights-category__meta">
                      <div class="insights-category__tags">
                        <!-- Content Type Tag -->
                        <span class="tag">{{ insight.content_type }}</span>
                        
                        {% if insight.sectors.size > 0 %}
                          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ insight.sectors[0] | slugify }}/" class="tag tag--sector">{{ insight.sectors[0] }}</a>
                        {% endif %}
                        {% if insight.markets.size > 0 %}
                          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/{{ insight.markets[0] | slugify }}/" class="tag tag--market">{{ insight.markets[0] }}</a>
                        {% endif %}
                        {% if insight.attributes.size > 0 %}
                          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ insight.attributes[0] | slugify }}/" class="tag tag--attribute">{{ insight.attributes[0] }}</a>
                        {% endif %}
                      </div>
                    </div>
                    <div class="insights-category__footer">
                      <span class="insights-category__date">{{ insight.date | date: "%b %-d, %Y" }}</span>
                      <a href="{{ insight.url | relative_url }}" class="insights-category__read-more">
                        <span>Read more</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"></path><path d="M12 5l7 7-7 7"></path></svg>
                      </a>
                    </div>
                  </div>
                </a>
              </div>
            {% endfor %}
          </div>
        {% else %}
          <div class="sectors__empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z"></path>
              <path d="M8 10h8M8 14h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].insights.no_insights }}</p>
          </div>
        {% endif %}
        
        <div class="sectors__section-action">
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/?category=sector" class="btn btn--secondary-cta">View All Sector Insights</a>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- All Categories Link Panel -->
<div class="panel panel--light">
  <div class="panel__content panel__content--full-width">
    <div class="sectors__navigation">
      <h3 class="sectors__navigation-title">Explore Other Discovery Dimensions</h3>
      <div class="sectors__navigation-links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="sectors__navigation-link sectors__navigation-link--russian-sectors">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          Russian Sectors
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="sectors__navigation-link sectors__navigation-link--market">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="10"/>
              <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>
              <path d="M2 12h20"/>
            </svg>
          </span>
          Markets
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="sectors__navigation-link sectors__navigation-link--attribute">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
              <line x1="1" y1="1" x2="23" y2="23"/>
              <circle cx="12" cy="12" r="3"/>
            </svg>
          </span>
          Attributes
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="sectors__navigation-link sectors__navigation-link--signal">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
            </svg>
          </span>
          Growth Signals
        </a>
      </div>
    </div>
  </div>
</div>