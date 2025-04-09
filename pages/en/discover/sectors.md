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
<div class="panel panel--hero panel--sectors">
  <div class="panel__content">
    <h1 class="panel__heading-primary">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- Main Content -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- All Sectors Grid -->
    <section class="dimension-section">
      <div class="dimension-section__header">
        <h2 class="dimension-section__title">All Sectors</h2>
        <p class="dimension-section__description">Explore all available business sectors in our database</p>
      </div>
      
      <div class="dimension-grid">
        {% for sector in site.data.translations[page.lang].sectors %}
          {% assign slug = sector[0] %}
          {% assign name = sector[1] %}
          {% assign brand_count = site.brands | where: "lang", page.lang | where: "sector", name | size %}
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ slug }}/" class="dimension-item dimension-item--sector">
            <div class="dimension-item__content">
              <h3 class="dimension-item__title">{{ name }}</h3>
              <div class="dimension-item__meta">
                <span class="dimension-item__count">{{ brand_count }} brands</span>
              </div>
              <div class="dimension-item__icon">
                {% if slug == "hotels-resorts" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 14h18M3 14v7h18v-7M3 21V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v9m0-9h10a2 2 0 0 1 2 2v9"></path>
                  </svg>
                {% elsif slug == "wine" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M8 22h8M12 11v11M7 1h10l-3 10H10L7 1z"></path>
                  </svg>
                {% elsif slug == "artisanal-spirits" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M8 22h8M12 11v11M10 7a4 4 0 0 0 4 0M6 2h12l-1.5 7A4 4 0 0 1 12 13a4 4 0 0 1-4.5-4L6 2z"></path>
                  </svg>
                {% elsif slug == "natural-beauty" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 2a9 9 0 0 1 9 9c0 3.9-2 7-5 9-3 2-4 3-4 6h-4c0-3-1-4-4-6-3-2-5-5.1-5-9a9 9 0 0 1 9-9z"></path>
                  </svg>
                {% else %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
                  </svg>
                {% endif %}
              </div>
            </div>
          </a>
        {% endfor %}
      </div>
    </section>
    
    <!-- Russian Sectors Special Section -->
    <section class="dimension-section">
      <div class="dimension-section__header">
        <h2 class="dimension-section__title">Russian Sectors Special Focus</h2>
        <p class="dimension-section__description">Explore our in-depth analysis of 16 high-potential Russian consumer sectors</p>
      </div>
      
      <div class="featured-sectors">
        <div class="featured-sector" style="grid-column: 1 / -1;">
          <div class="featured-sector__image" style="flex: 0 0 25%;">
            <img src="{{ site.baseurl }}/assets/images/sectors/russian-overview.jpg" alt="Russian Sectors Overview" class="featured-sector__img" onerror="this.src='{{ site.baseurl }}/assets/images/sectors/confectionery.jpg'">
          </div>
          <div class="featured-sector__content">
            <h3 class="featured-sector__title">Russian Consumer Brand Sectors</h3>
            <p class="featured-sector__description">Discover our curated selection of 16 high-potential Russian consumer sectors, from artisanal spirits and natural beauty products to specialty foods and hospitality. Each sector offers unique investment and partnership opportunities with compelling narratives.</p>
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="featured-sector__link btn btn-outline">Explore Russian Sectors</a>
          </div>
        </div>
      </div>
    </section>
    
    <!-- Featured Sectors Section -->
    <section class="dimension-section">
      <div class="dimension-section__header">
        <h2 class="dimension-section__title">Featured Sectors</h2>
        <p class="dimension-section__description">Explore our highlighted business sectors with the most promising brands</p>
      </div>
      
      <div class="featured-sectors">
        <div class="featured-sectors__grid">
          <!-- Featured Sector 1: Hotels & Resorts -->
          <div class="featured-sector">
            <div class="featured-sector__image">
              <img src="{{ site.baseurl }}/assets/images/sectors/hotels-resorts.jpg" alt="Hotels & Resorts" class="featured-sector__img">
            </div>
            <div class="featured-sector__content">
              <h3 class="featured-sector__title">Hotels & Resorts</h3>
              <p class="featured-sector__description">From historic city properties to remote wilderness retreats, Russian boutique hotels and resorts offer unique cultural experiences that showcase the country's remarkable diversity.</p>
              <div class="featured-sector__meta">
                {% assign hotel_count = site.brands | where: "lang", page.lang | where: "sector", "Hotels & Resorts" | size %}
                <span class="featured-sector__count">{{ hotel_count }} brands</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/hotels-resorts/" class="featured-sector__link btn btn-outline">Explore Hotels & Resorts</a>
            </div>
          </div>
          
          <!-- Featured Sector 2: Artisanal Spirits & Vodka -->
          <div class="featured-sector">
            <div class="featured-sector__image">
              <img src="{{ site.baseurl }}/assets/images/sectors/artisanal-spirits.jpg" alt="Artisanal Spirits & Vodka" class="featured-sector__img">
            </div>
            <div class="featured-sector__content">
              <h3 class="featured-sector__title">Artisanal Spirits & Vodka</h3>
              <p class="featured-sector__description">Russia's craft spirits scene has experienced a renaissance, with over 80 new premium distilleries emerging in the past decade creating distinctive products with compelling stories.</p>
              <div class="featured-sector__meta">
                {% assign spirits_count = site.brands | where: "lang", page.lang | where: "sector", "Artisanal Spirits & Vodka" | size %}
                <span class="featured-sector__count">{{ spirits_count }} brands</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/artisanal-spirits/" class="featured-sector__link btn btn-outline">Explore Artisanal Spirits</a>
            </div>
          </div>
          
          <!-- Featured Sector 3: Natural Beauty Products -->
          <div class="featured-sector">
            <div class="featured-sector__image">
              <img src="{{ site.baseurl }}/assets/images/sectors/natural-beauty.jpg" alt="Natural Beauty Products" class="featured-sector__img">
            </div>
            <div class="featured-sector__content">
              <h3 class="featured-sector__title">Natural Beauty Products</h3>
              <p class="featured-sector__description">Russia's natural beauty sector leverages the country's vast botanical resources, particularly from Siberia and the Far East, where plants have evolved potent bioactive compounds.</p>
              <div class="featured-sector__meta">
                {% assign beauty_count = site.brands | where: "lang", page.lang | where: "sector", "Natural Beauty Products" | size %}
                <span class="featured-sector__count">{{ beauty_count }} brands</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/natural-beauty/" class="featured-sector__link btn btn-outline">Explore Natural Beauty</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- Related Insights Section -->
    <section class="dimension-section">
      <div class="dimension-section__header">
        <h2 class="dimension-section__title">Sector Insights</h2>
        <p class="dimension-section__description">Read our latest analyses and stories about BRICS+ business sectors</p>
      </div>
      
      <div class="related-insights">
        {% assign sector_insights = site.insights | where: "lang", page.lang | where: "category", "sector" | sort: "date" | reverse | limit: 2 %}
        {% if sector_insights.size > 0 %}
          <div class="related-insights__grid">
            {% for insight in sector_insights %}
              {% include insight-card.html insight=insight %}
            {% endfor %}
          </div>
        {% else %}
          <div class="related-insights__empty">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z"></path>
              <path d="M8 10h8M8 14h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].insights.no_insights }}</p>
          </div>
        {% endif %}
        
        <div class="related-insights__action">
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/?category=sector" class="btn btn-secondary">View All Sector Insights</a>
        </div>
      </div>
    </section>
    
    <!-- All Categories Link -->
    <div class="dimensions-navigation">
      <h3 class="dimensions-navigation__title">Explore Other Discovery Dimensions</h3>
      <div class="dimensions-navigation__links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="dimensions-navigation__link dimensions-navigation__link--russian-sectors">
          <span class="dimensions-navigation__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          Russian Sectors
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="dimensions-navigation__link dimensions-navigation__link--market">
          <span class="dimensions-navigation__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10a15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
            </svg>
          </span>
          Markets
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="dimensions-navigation__link dimensions-navigation__link--attribute">
          <span class="dimensions-navigation__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          Attributes
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="dimensions-navigation__link dimensions-navigation__link--signal">
          <span class="dimensions-navigation__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </span>
          Growth Signals
        </a>
      </div>
    </div>
  </div>
</div>