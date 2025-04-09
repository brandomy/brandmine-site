---
layout: discover
title: Discover by Brand Attributes
subtitle: Explore brands with different features from the BRICS+
permalink: /en/discover/attributes/
lang: en
ref: attributes
discovery_path: attributes
---

<!-- Hero Panel -->
<div class="panel panel--hero panel--attributes">
  <div class="panel__content">
    <h1 class="panel__heading-primary">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- Main Content -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- All Attributes Grid -->
    <section class="dimension-section">
      <div class="dimension-section__header">
        <h2 class="dimension-section__title">All Attributes</h2>
        <p class="dimension-section__description">Explore brands by their distinguishing characteristics</p>
      </div>
      
      <div class="dimension-grid">
        {% for attribute in site.data.translations[page.lang].attributes %}
          {% assign slug = attribute[0] %}
          {% assign name = attribute[1] %}
          {% assign brand_count = site.brands | where: "lang", page.lang | where_exp: "brand", "brand.attributes contains name" | size %}
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="dimension-item dimension-item--attribute">
            <div class="dimension-item__content">
              <h3 class="dimension-item__title">{{ name }}</h3>
              <div class="dimension-item__meta">
                <span class="dimension-item__count">{{ brand_count }} brands</span>
              </div>
              <div class="dimension-item__icon">
                {% if slug == "heritage-brand" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 10v12m-4-4h8m-9-8l5-5 5 5M4 22h16"></path>
                  </svg>
                {% elsif slug == "founder-led" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="7" r="4"></circle>
                    <path d="M6 21v-2a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v2"></path>
                  </svg>
                {% elsif slug == "sustainable" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M7 21a4 4 0 0 1-4-4M17 21a4 4 0 0 0 4-4M3 7a4 4 0 0 1 4-4M17 3a4 4 0 0 1 4 4M7 3h10M7 21h10"></path>
                  </svg>
                {% else %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M4 7h16M4 12h16M4 17h10"></path>
                  </svg>
                {% endif %}
              </div>
            </div>
          </a>
        {% endfor %}
      </div>
    </section>
    
    <!-- Attribute Categories Section -->
    <section class="dimension-section">
      <div class="dimension-section__header">
        <h2 class="dimension-section__title">Attribute Categories</h2>
        <p class="dimension-section__description">Explore brand attributes grouped by categories</p>
      </div>
      
      <!-- Business Characteristics -->
      <div class="attribute-category">
        <h3 class="attribute-category__title">Business Characteristics</h3>
        <div class="attribute-category__tags">
          {% for attribute in site.data.translations[page.lang].attributes %}
            {% assign slug = attribute[0] %}
            {% assign name = attribute[1] %}
            {% if slug == "founder-led" or slug == "family-owned" or slug == "heritage-brand" or slug == "award-winning" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="tag tag--attribute">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
      
      <!-- Sustainability & Ethics -->
      <div class="attribute-category">
        <h3 class="attribute-category__title">Sustainability & Ethics</h3>
        <div class="attribute-category__tags">
          {% for attribute in site.data.translations[page.lang].attributes %}
            {% assign slug = attribute[0] %}
            {% assign name = attribute[1] %}
            {% if slug == "sustainable" or slug == "eco-friendly" or slug == "ethical-production" or slug == "fair-trade" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="tag tag--attribute">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
      
      <!-- Production Methods -->
      <div class="attribute-category">
        <h3 class="attribute-category__title">Production Methods</h3>
        <div class="attribute-category__tags">
          {% for attribute in site.data.translations[page.lang].attributes %}
            {% assign slug = attribute[0] %}
            {% assign name = attribute[1] %}
            {% if slug == "handcrafted" or slug == "small-batch" or slug == "traditional-methods" or slug == "artisanal" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="tag tag--attribute">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
    </section>
    
    <!-- Featured Brands with Attributes Section -->
    <section class="dimension-section">
      <div class="dimension-section__header">
        <h2 class="dimension-section__title">Featured Brands by Attribute</h2>
        <p class="dimension-section__description">Brands highlighting specific attributes</p>
      </div>
      
      <div class="attribute-featured">
        <!-- Heritage Brands -->
        <div class="attribute-featured__group">
          <div class="attribute-featured__header">
            <h3 class="attribute-featured__title">Heritage Brands</h3>
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/heritage-brand/" class="attribute-featured__link">View All Heritage Brands</a>
          </div>
          
          <div class="attribute-featured__brands">
            {% assign heritage_brands = site.brands | where: "lang", page.lang | where_exp: "brand", "brand.attributes contains 'Heritage Brand'" | limit: 3 %}
            {% if heritage_brands.size > 0 %}
              {% for brand in heritage_brands %}
                {% include brand-card.html brand=brand %}
              {% endfor %}
            {% else %}
              <div class="attribute-featured__empty">
                <p>No heritage brands available yet.</p>
              </div>
            {% endif %}
          </div>
        </div>
        
        <!-- Founder-Led Brands -->
        <div class="attribute-featured__group">
          <div class="attribute-featured__header">
            <h3 class="attribute-featured__title">Founder-Led Brands</h3>
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/founder-led/" class="attribute-featured__link">View All Founder-Led Brands</a>
          </div>
          
          <div class="attribute-featured__brands">
            {% assign founder_brands = site.brands | where: "lang", page.lang | where_exp: "brand", "brand.attributes contains 'Founder-Led'" | limit: 3 %}
            {% if founder_brands.size > 0 %}
              {% for brand in founder_brands %}
                {% include brand-card.html brand=brand %}
              {% endfor %}
            {% else %}
              <div class="attribute-featured__empty">
                <p>No founder-led brands available yet.</p>
              </div>
            {% endif %}
          </div>
        </div>
      </div>
    </section>
    
    <!-- Related Insights Section -->
    <section class="dimension-section">
      <div class="dimension-section__header">
        <h2 class="dimension-section__title">Attribute Insights</h2>
        <p class="dimension-section__description">Read our latest analyses about brand attributes and characteristics</p>
      </div>
      
      <div class="related-insights">
        {% assign attribute_insights = site.insights | where: "lang", page.lang | where: "category", "attribute" | sort: "date" | reverse | limit: 2 %}
        {% if attribute_insights.size > 0 %}
          <div class="related-insights__grid">
            {% for insight in attribute_insights %}
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
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/?category=attribute" class="btn btn-secondary">View All Attribute Insights</a>
        </div>
      </div>
    </section>
    
    <!-- All Categories Link -->
    <div class="dimensions-navigation">
      <h3 class="dimensions-navigation__title">Explore Other Discovery Dimensions</h3>
      <div class="dimensions-navigation__links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="dimensions-navigation__link dimensions-navigation__link--sector">
          <span class="dimensions-navigation__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          Sectors
        </a>
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