---
layout: discover
title: Discover Brands
permalink: /en/discover/
lang: en
ref: discover
discovery_path: discover
---

<!-- Hero Panel -->
<div class="panel panel--hero panel--discovery">
  <div class="panel__content">
    <h1 class="panel__heading-primary">Discover Brands</h1>
    <p class="panel__subtitle">Explore BRICS+ brands through multiple dimensions:<br>Sectors, Markets, Attributes, and Growth Signals</p>
  </div>
</div>

<!-- Main Discovery Hub -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- Sector Discovery Section -->
    <section class="discovery-section">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">
          <span class="discovery-section__icon discovery-section__icon--sector">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].nav.sectors }}
        </h2>
        <p class="discovery-section__description">Explore leading brands from top sectors in the BRICS+</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="discovery-section__link">{{ site.data.translations[page.lang].discover.view_all_sectors }}</a>
      </div>
      
      <!-- Showcase common sectors as tags -->
      <div class="tag-cloud tag-cloud--sector">
        <div class="tag-cloud__tags">
          {% for sector in site.data.translations[page.lang].sectors limit:9 %}
            {% assign slug = sector[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ slug }}/" class="tag tag--sector tag-cloud__tag">
              {{ sector[1] }}
            </a>
          {% endfor %}
          
          <!-- Special Russian Sectors tag -->
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="tag tag--russian-sector tag-cloud__tag">
            Russian Sectors
          </a>
          
          {% if site.data.translations[page.lang].sectors.size > 10 %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="tag tag--more tag--sector">
              {{ site.data.translations[page.lang].buttons.view_more }}...
            </a>
          {% endif %}
        </div>
      </div>
      
      <div class="discovery-featured">
        {% assign featured_sectors = site.data.featured_sectors | where: "lang", page.lang | limit: 3 %}
        {% if featured_sectors.size > 0 %}
          <div class="discovery-featured__grid">
            {% for sector in featured_sectors %}
              <div class="discovery-featured__item discovery-featured__item--sector">
                <div class="discovery-featured__image">
                  <img src="{{ sector.image }}" alt="{{ sector.name }}" class="discovery-featured__img">
                </div>
                <div class="discovery-featured__content">
                  <h3 class="discovery-featured__title">{{ sector.name }}</h3>
                  <p class="discovery-featured__description">{{ sector.description }}</p>
                  <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ sector.slug }}/" class="discovery-featured__link">Explore {{ sector.name }}</a>
                </div>
              </div>
            {% endfor %}
          </div>
        {% endif %}
      </div>
    </section>
    
    <!-- Market Discovery Section -->
    <section class="discovery-section">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">
          <span class="discovery-section__icon discovery-section__icon--market">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].nav.markets }}
        </h2>
        <p class="discovery-section__description">Explore brands from growing BRICS+ regions</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="discovery-section__link">{{ site.data.translations[page.lang].discover.view_all_markets }}</a>
      </div>
      
      <!-- Showcase markets as tags -->
      <div class="tag-cloud tag-cloud--market">
        <div class="tag-cloud__tags">
          {% for market in site.data.translations[page.lang].markets %}
            {% assign slug = market[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/{{ slug }}/" class="tag tag--market tag-cloud__tag">
              {{ market[1] }}
            </a>
          {% endfor %}
        </div>
      </div>
      
      <!-- Map preview for markets -->
      <div class="map-preview">
        <div class="map-preview__container">
          <div class="map-preview__content">
            <div class="map-preview__placeholder">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
                <path d="M9 19l-4 1.5v-15l4-1.5 6 1.5 4-1.5v15l-4 1.5-6-1.5zm6-1.5v-15m-6 0v15"></path>
              </svg>
              <span>Interactive map coming soon</span>
            </div>
          </div>
        </div>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/#map" class="map-preview__link">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="10"></circle>
            <path d="M12 8v4m0 4h.01"></path>
          </svg>
          Explore Interactive Map
        </a>
      </div>
    </section>
    
    <!-- Attributes Discovery Section -->
    <section class="discovery-section">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">
          <span class="discovery-section__icon discovery-section__icon--attribute">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].nav.attributes }}
        </h2>
        <p class="discovery-section__description">Explore brands with different features from the BRICS+</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="discovery-section__link">{{ site.data.translations[page.lang].discover.view_all_attributes }}</a>
      </div>
      
      <!-- Showcase attributes as tags -->
      <div class="tag-cloud tag-cloud--attribute">
        <div class="tag-cloud__tags">
          {% for attribute in site.data.translations[page.lang].attributes %}
            {% assign slug = attribute[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="tag tag--attribute tag-cloud__tag">
              {{ attribute[1] }}
            </a>
          {% endfor %}
        </div>
      </div>
    </section>
    
    <!-- Growth Signals Discovery Section -->
    <section class="discovery-section">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">
          <span class="discovery-section__icon discovery-section__icon--signal">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].nav.signals }}
        </h2>
        <p class="discovery-section__description">Explore brands poised to grow</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="discovery-section__link">{{ site.data.translations[page.lang].discover.view_all_signals }}</a>
      </div>
      
      <!-- Showcase growth signals as tags -->
      <div class="tag-cloud tag-cloud--signal">
        <div class="tag-cloud__tags">
          {% for signal in site.data.translations[page.lang].signals %}
            {% assign slug = signal[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/{{ slug }}/" class="tag tag--signal tag-cloud__tag">
              {{ signal[1] }}
            </a>
          {% endfor %}
        </div>
      </div>
    </section>
    
    <!-- Featured Brands Section -->
    <section class="discovery-section discovery-section--featured">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">
          <span class="discovery-section__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2l2.4 7.4h7.6l-6 4.6 2.3 7-6.3-4.6-6.3 4.6 2.3-7-6-4.6h7.6z"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].home.featured_brands }}
        </h2>
        <p class="discovery-section__description">Discover hand-selected brands with compelling narratives and global potential</p>
      </div>
      
      <div class="featured-brands">
        {% assign featured_brands = site.brands | where: "lang", page.lang | where: "featured", true | limit: 3 %}
        {% if featured_brands.size > 0 %}
          {% for brand in featured_brands %}
            {% include brand-card.html brand=brand %}
          {% endfor %}
        {% else %}
          <div class="featured-brands__empty">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <rect x="3" y="3" width="18" height="18" rx="2"></rect>
              <path d="M12 8v8m-4-4h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].home.no_featured_brands }}</p>
          </div>
        {% endif %}
      </div>
      
      <div class="discovery-section__action">
        <a href="{{ site.baseurl }}/{{ page.lang }}/brands/" class="btn btn-primary">{{ site.data.translations[page.lang].buttons.all_brands }}</a>
      </div>
    </section>
    
    <!-- Latest Insights Section -->
    <section class="discovery-section discovery-section--insights">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">
          <span class="discovery-section__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2a3 3 0 0 0 0 6 3 3 0 0 0 0-6z"></path>
              <path d="M19 9H5a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2z"></path>
              <path d="M12 18v3M8 18v3M16 18v3"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].insights.latest }}
        </h2>
        <p class="discovery-section__description">Uncover hidden gems and compelling founder journeys from emerging markets</p>
      </div>
      
      <div class="featured-insights">
        {% assign recent_insights = site.insights | where: "lang", page.lang | sort: "date" | reverse | limit: 2 %}
        {% if recent_insights.size > 0 %}
          {% for insight in recent_insights %}
            {% include insight-card.html insight=insight %}
          {% endfor %}
        {% else %}
          <div class="featured-insights__empty">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z"></path>
              <path d="M8 10h8M8 14h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].insights.no_insights }}</p>
          </div>
        {% endif %}
      </div>
      
      <div class="discovery-section__action">
        <a href="{{ site.baseurl }}/{{ page.lang }}/insights/" class="btn btn-secondary">{{ site.data.translations[page.lang].insights.view_all }}</a>
      </div>
    </section>
  </div>
</div>

<style>
  /* Enhanced discovery page styling */
  .panel--discovery {
    background: linear-gradient(135deg, var(--emerald-600), var(--sky-600));
    color: white;
  }
  
  .discovery-section {
    margin-bottom: var(--space-12);
    position: relative;
  }
  
  .discovery-section__header {
    margin-bottom: var(--space-6);
    position: relative;
  }
  
  .discovery-section__title {
    display: flex;
    align-items: center;
    font-size: var(--text-2xl);
    font-weight: var(--font-bold);
    color: var(--neutral-800);
    margin-bottom: var(--space-2);
  }
  
  .discovery-section__icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    margin-right: var(--space-2);
    border-radius: var(--radius-md);
    background-color: var(--neutral-100);
    color: var(--neutral-600);
  }
  
  .discovery-section__icon--sector {
    background-color: var(--emerald-100);
    color: var(--emerald-700);
  }
  
  .discovery-section__icon--market {
    background-color: var(--sky-100);
    color: var(--sky-700);
  }
  
  .discovery-section__icon--attribute {
    background-color: var(--amber-100);
    color: var(--amber-700);
  }
  
  .discovery-section__icon--signal {
    background-color: var(--purple-100);
    color: var(--purple-700);
  }
  
  .discovery-section__description {
    font-size: var(--text-lg);
    color: var(--neutral-600);
    margin-bottom: var(--space-2);
  }
  
  .discovery-section__link {
    font-size: var(--text-sm);
    color: var(--primary-600);
    text-decoration: none;
    display: inline-flex;
    align-items: center;
  }
  
  .discovery-section__link:hover {
    text-decoration: underline;
  }
  
  /* Tag cloud styling */
  .tag-cloud {
    margin-bottom: var(--space-6);
  }
  
  .tag-cloud__tags {
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-2);
  }
  
  .tag {
    display: inline-flex;
    align-items: center;
    padding: var(--space-2) var(--space-3);
    border-radius: var(--radius-full);
    font-size: var(--text-sm);
    font-weight: var(--font-medium);
    transition: all 0.2s ease;
    text-decoration: none;
    white-space: nowrap;
  }
  
  .tag:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  }
  
  .tag--sector {
    background-color: var(--emerald-100);
    color: var(--emerald-800);
    border: 1px solid var(--emerald-200);
  }
  
  .tag--sector:hover {
    background-color: var(--emerald-200);
  }
  
  .tag--market {
    background-color: var(--sky-100);
    color: var(--sky-800);
    border: 1px solid var(--sky-200);
  }
  
  .tag--market:hover {
    background-color: var(--sky-200);
  }
  
  .tag--attribute {
    background-color: var(--amber-100);
    color: var(--amber-800);
    border: 1px solid var(--amber-200);
  }
  
  .tag--attribute:hover {
    background-color: var(--amber-200);
  }
  
  .tag--signal {
    background-color: var(--purple-100);
    color: var(--purple-800);
    border: 1px solid var(--purple-200);
  }
  
  .tag--signal:hover {
    background-color: var(--purple-200);
  }
  
  .tag--more {
    background-color: var(--neutral-100);
    color: var(--neutral-700);
    border: 1px solid var(--neutral-200);
  }
  
  .tag--more:hover {
    background-color: var(--neutral-200);
  }
  
  /* Map preview styling */
  .map-preview {
    margin: var(--space-4) 0 var(--space-6);
    text-align: center;
  }
  
  .map-preview__container {
    height: 220px;
    max-width: 100%;
    margin: 0 auto var(--space-3);
    border-radius: var(--radius-lg);
    overflow: hidden;
    background-color: var(--sky-50);
    border: var(--border-width-thin) solid var(--sky-200);
  }
  
  .map-preview__content {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .map-preview__placeholder {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: var(--space-2);
    color: var(--sky-700);
    font-style: italic;
  }
  
  .map-preview__link {
    display: inline-flex;
    align-items: center;
    gap: var(--space-1);
    color: var(--sky-700);
    font-weight: var(--font-medium);
    text-decoration: none;
  }
  
  .map-preview__link:hover {
    text-decoration: underline;
  }
  
  /* Featured content styling */
  .discovery-featured {
    margin: var(--space-4) 0;
  }
  
  .discovery-featured__grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: var(--space-4);
  }
  
  .discovery-featured__item {
    border-radius: var(--radius-lg);
    overflow: hidden;
    background-color: white;
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
    transition: all 0.3s ease;
  }
  
  .discovery-featured__item:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  }
  
  .discovery-featured__item--sector {
    border-top: 4px solid var(--emerald-500);
  }
  
  .discovery-featured__image {
    height: 160px;
    overflow: hidden;
  }
  
  .discovery-featured__img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
  }
  
  .discovery-featured__item:hover .discovery-featured__img {
    transform: scale(1.05);
  }
  
  .discovery-featured__content {
    padding: var(--space-4);
  }
  
  .discovery-featured__title {
    font-size: var(--text-lg);
    font-weight: var(--font-bold);
    margin-bottom: var(--space-2);
    color: var(--neutral-800);
  }
  
  .discovery-featured__description {
    color: var(--neutral-600);
    margin-bottom: var(--space-3);
    font-size: var(--text-sm);
  }
  
  .discovery-featured__link {
    display: inline-block;
    color: var(--emerald-600);
    font-weight: var(--font-medium);
    font-size: var(--text-sm);
    text-decoration: none;
  }
  
  .discovery-featured__link:hover {
    text-decoration: underline;
  }
  
  /* Featured brands and insights styling */
  .featured-brands,
  .featured-insights {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: var(--space-4);
    margin-top: var(--space-4);
  }
  
  .featured-brands__empty,
  .featured-insights__empty {
    grid-column: 1 / -1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: var(--space-4);
    text-align: center;
    padding: var(--space-8);
    background-color: var(--neutral-50);
    border-radius: var(--radius-md);
    color: var(--neutral-500);
    border: 1px dashed var(--neutral-300);
  }
  
  .discovery-section__action {
    margin-top: var(--space-6);
    text-align: center;
  }
  
  /* Responsive adjustments */
  @media (max-width: 768px) {
    .discovery-featured__grid,
    .featured-brands,
    .featured-insights {
      grid-template-columns: 1fr;
    }
    
    .map-preview__container {
      height: 180px;
    }
    
    .discovery-section {
      margin-bottom: var(--space-8);
    }
  }
</style>