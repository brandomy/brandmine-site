---
layout: discover
title: Откройте бренды
permalink: /ru/discover/
lang: ru
ref: discover
discovery_path: discover
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary">Откройте бренды</h1>
    <p class="panel__subtitle">Исследуйте бренды по нескольким измерениям: <br>Секторам, Рынкам, Атрибутам и Путям Роста</p>
  </div>
</div>

<!-- Main Discovery Hub -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- Sector Discovery Section -->
    <section class="discovery-section">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">{{ site.data.translations[page.lang].nav.sectors }}</h2>
        <p class="discovery-section__description">Исследуйте ведущие бренды из ключевых секторов в БРИКС+</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="discovery-section__link">{{ site.data.translations[page.lang].discover.view_all_sectors }}</a>
      </div>
      
      <!-- Showcase common sectors as tags -->
      <div class="tag-cloud">
        <div class="tag-cloud__tags">
          {% for sector in site.data.translations[page.lang].sectors limit:8 %}
            {% assign slug = sector[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ slug }}/" class="tag tag--sector tag-cloud__tag">
              {{ sector[1] }}
            </a>
          {% endfor %}
          
          <!-- Special Russian Sectors tag -->
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="tag tag--russian-sector tag-cloud__tag">
            Российские секторы
          </a>
          
          {% if site.data.translations[page.lang].sectors.size > 8 %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="tag tag--more">
              {{ site.data.translations[page.lang].buttons.view_more }}...
            </a>
          {% endif %}
        </div>
      </div>
    </section>
    
    <!-- Market Discovery Section -->
    <section class="discovery-section">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">{{ site.data.translations[page.lang].nav.markets }}</h2>
        <p class="discovery-section__description">Исследуйте бренды из растущих регионов БРИКС+</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="discovery-section__link">{{ site.data.translations[page.lang].discover.view_all_markets }}</a>
      </div>
      
      <!-- Showcase markets as tags -->
      <div class="tag-cloud">
        <div class="tag-cloud__tags">
          {% for market in site.data.translations[page.lang].markets %}
            {% assign slug = market[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/{{ slug }}/" class="tag tag--market tag-cloud__tag">
              {{ market[1] }}
            </a>
          {% endfor %}
        </div>
      </div>
      
      <!-- Mini map preview for markets -->
      <div class="map-preview">
        <div class="map-preview__container">
          <div class="map-preview__placeholder">
            Интерактивная карта скоро появится
          </div>
        </div>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/#map" class="map-preview__link">
          Исследовать интерактивную карту
        </a>
      </div>
    </section>
    
    <!-- Attributes Discovery Section -->
    <section class="discovery-section">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">{{ site.data.translations[page.lang].nav.attributes }}</h2>
        <p class="discovery-section__description">Исследуйте бренды с различными характеристиками из БРИКС+</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="discovery-section__link">{{ site.data.translations[page.lang].discover.view_all_attributes }}</a>
      </div>
      
      <!-- Showcase attributes as tags -->
      <div class="tag-cloud">
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
    
    <!-- Growth Pathways Discovery Section -->
    <section class="discovery-section">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">{{ site.data.translations[page.lang].nav.signals }}</h2>
        <p class="discovery-section__description">Исследуйте бренды, готовые к росту</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="discovery-section__link">{{ site.data.translations[page.lang].discover.view_all_signals }}</a>
      </div>
      
      <!-- Showcase growth signals as tags -->
      <div class="tag-cloud">
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
        <h2 class="discovery-section__title">{{ site.data.translations[page.lang].home.featured_brands }}</h2>
        <p class="discovery-section__description">Откройте для себя тщательно отобранные бренды с привлекательными историями и глобальным потенциалом</p>
      </div>
      
      <div class="featured-brands">
        {% assign featured_brands = site.brands | where: "lang", page.lang | where: "featured", true | limit: 3 %}
        {% if featured_brands.size > 0 %}
          {% for brand in featured_brands %}
            {% include brand-card.html brand=brand %}
          {% endfor %}
        {% else %}
          <p class="featured-brands__empty">{{ site.data.translations[page.lang].home.no_featured_brands }}</p>
        {% endif %}
      </div>
      
      <div class="discovery-section__action">
        <a href="{{ site.baseurl }}/{{ page.lang }}/brands/" class="btn btn-primary">{{ site.data.translations[page.lang].buttons.all_brands }}</a>
      </div>
    </section>
    
    <!-- Latest Insights Section -->
    <section class="discovery-section discovery-section--insights">
      <div class="discovery-section__header">
        <h2 class="discovery-section__title">{{ site.data.translations[page.lang].insights.latest }}</h2>
        <p class="discovery-section__description">Откройте для себя скрытые жемчужины и увлекательные истории основателей с развивающихся рынков</p>
      </div>
      
      <div class="featured-insights">
        {% assign recent_insights = site.insights | where: "lang", page.lang | sort: "date" | reverse | limit: 2 %}
        {% if recent_insights.size > 0 %}
          {% for insight in recent_insights %}
            {% include insight-card.html insight=insight %}
          {% endfor %}
        {% else %}
          <p class="featured-insights__empty">{{ site.data.translations[page.lang].insights.no_insights }}</p>
        {% endif %}
      </div>
      
      <div class="discovery-section__action">
        <a href="{{ site.baseurl }}/{{ page.lang }}/insights/" class="btn btn-secondary">{{ site.data.translations[page.lang].insights.view_all }}</a>
      </div>
    </section>
  </div>
</div>

<style>
  /* Inline styles for map preview */
  .map-preview {
    margin: var(--space-4) 0 var(--space-6);
    text-align: center;
  }
  
  .map-preview__container {
    height: 180px;
    max-width: 600px;
    margin: 0 auto var(--space-3);
    border-radius: var(--radius-md);
    overflow: hidden;
    background-color: var(--neutral-100);
    border: var(--border-width-thin) solid var(--neutral-200);
  }
  
  .map-preview__placeholder {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--neutral-600);
    font-style: italic;
    background-color: var(--sky-50);
  }
  
  .map-preview__link {
    display: inline-block;
    color: var(--sky-700);
    font-weight: var(--font-medium);
    text-decoration: underline;
  }
  
  /* Featured content area styles */
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
    text-align: center;
    padding: var(--space-8);
    background-color: var(--neutral-100);
    border-radius: var(--radius-md);
    color: var(--neutral-500);
  }
  
  @media (max-width: 768px) { /* md breakpoint */
    .featured-brands,
    .featured-insights {
      grid-template-columns: 1fr;
      gap: var(--space-4);
    }
    
    .map-preview__container {
      height: 150px;
    }
  }
</style>