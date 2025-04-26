---
layout: discovery
title: 探索
permalink: /zh/discovery/
lang: zh
ref: discovery-hub
discovery_path: discovery
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary discover__title">{{ site.data.translations[page.lang].discover.discover_title }}</h1>
    <p class="panel__subtitle">{{ site.data.translations[page.lang].discover.discover_subtitle | newline_to_br }}</p>
  </div>
</div>

<!-- Main Discovery Hub -->
<div class="panel panel--light discover-panel">
  <div class="panel__content">
    <!-- Sector Discovery Section -->
    <section class="discover__section">
      <div class="discover__section-header">
        <h2 class="discover__section-title">
          <span class="discover__icon discover__icon--sector">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].nav.sectors }}
        </h2>
        <p class="discover__section-description">探索金砖国家+地区顶级行业的领先品牌</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="discover__section-link">{{ site.data.translations[page.lang].discover.view_all_sectors }}</a>
      </div>
      
      <!-- Showcase common sectors as tags -->
      <div class="discover__tag-cloud discover__tag-cloud--sector">
        <div class="discover__tags">
          {% for sector in site.data.translations[page.lang].sectors limit:8 %}
            {% assign slug = sector[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ slug }}/" class="discover__tag discover__tag--sector">
              {{ sector[1] }}
            </a>
          {% endfor %}
          
          <!-- Special Russian Sectors tag -->
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="discover__tag discover__tag--russian-sector">
            俄罗斯行业
          </a>
          
          {% if site.data.translations[page.lang].sectors.size > 8 %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="discover__tag discover__tag--more discover__tag--sector">
              {{ site.data.translations[page.lang].buttons.view_more }}...
            </a>
          {% endif %}
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Market Discovery Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <!-- Market Discovery Section -->
    <section class="discover__section">
      <div class="discover__section-header">
        <h2 class="discover__section-title">
          <span class="discover__icon discover__icon--market">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].nav.markets }}
        </h2>
        <p class="discover__section-description">探索来自金砖国家+新兴地区的品牌</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="discover__section-link">{{ site.data.translations[page.lang].discover.view_all_markets }}</a>
      </div>
      
      <!-- Showcase markets as tags -->
      <div class="discover__tag-cloud discover__tag-cloud--market">
        <div class="discover__tags">
          {% for market in site.data.translations[page.lang].markets %}
            {% assign slug = market[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/{{ slug }}/" class="discover__tag discover__tag--market">
              {{ market[1] }}
            </a>
          {% endfor %}
        </div>
      </div>
      
      <!-- Map preview for markets -->
      <div class="discover__map-preview">
        <div class="discover__map-container">
          <div class="discover__map-content">
            <div class="discover__map-placeholder">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
                <path d="M9 19l-4 1.5v-15l4-1.5 6 1.5 4-1.5v15l-4 1.5-6-1.5zm6-1.5v-15m-6 0v15"></path>
              </svg>
              <span>互动地图即将推出</span>
            </div>
          </div>
        </div>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/#map" class="discover__map-link">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="10"></circle>
            <path d="M12 8v4m0 4h.01"></path>
          </svg>
          探索互动地图
        </a>
      </div>
    </section>
  </div>
</div>

<!-- Attributes Discovery Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- Attributes Discovery Section -->
    <section class="discover__section">
      <div class="discover__section-header">
        <h2 class="discover__section-title">
          <span class="discover__icon discover__icon--attribute">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].nav.attributes }}
        </h2>
        <p class="discover__section-description">探索金砖国家+地区具有不同特点的品牌</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="discover__section-link">{{ site.data.translations[page.lang].discover.view_all_attributes }}</a>
      </div>
      
      <!-- Showcase attributes as tags -->
      <div class="discover__tag-cloud discover__tag-cloud--attribute">
        <div class="discover__tags">
          {% for attribute in site.data.translations[page.lang].attributes %}
            {% assign slug = attribute[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="discover__tag discover__tag--attribute">
              {{ attribute[1] }}
            </a>
          {% endfor %}
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Growth Signals Discovery Panel -->
<div class="panel panel--accent-soft">
  <div class="panel__content">
    <!-- Growth Signals Discovery Section -->
    <section class="discover__section">
      <div class="discover__section-header">
        <h2 class="discover__section-title">
          <span class="discover__icon discover__icon--signal">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].nav.signals }}
        </h2>
        <p class="discover__section-description">探索准备增长的品牌</p>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="discover__section-link">{{ site.data.translations[page.lang].discover.view_all_signals }}</a>
      </div>
      
      <!-- Showcase growth signals as tags -->
      <div class="discover__tag-cloud discover__tag-cloud--signal">
        <div class="discover__tags">
          {% for signal in site.data.translations[page.lang].signals %}
            {% assign slug = signal[0] %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/{{ slug }}/" class="discover__tag discover__tag--signal">
              {{ signal[1] }}
            </a>
          {% endfor %}
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Featured Brands Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- Featured Brands Section -->
    <section class="discover__section discover__section--featured">
      <div class="discover__section-header">
        <h2 class="discover__section-title">
          <span class="discover__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2l2.4 7.4h7.6l-6 4.6 2.3 7-6.3-4.6-6.3 4.6 2.3-7-6-4.6h7.6z"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].home.featured_brands }}
        </h2>
        <p class="discover__section-description">发现精心挑选的、拥有吸引人故事和全球潜力的品牌</p>
      </div>
      
      <div class="discover__brands-grid">
        {% assign featured_brands = site.brands | where: "lang", page.lang | where: "featured", true | limit: 3 %}
        {% if featured_brands.size > 0 %}
          {% for brand in featured_brands %}
            {% include components/cards/brand-card.html brand=brand %}
          {% endfor %}
        {% else %}
          <div class="discover__empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <rect x="3" y="3" width="18" height="18" rx="2"></rect>
              <path d="M12 8v8m-4-4h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].home.no_featured_brands }}</p>
          </div>
        {% endif %}
      </div>
      
      <div class="discover__section-action">
        <a href="{{ site.baseurl }}/{{ page.lang }}/brands/" class="btn btn--primary-cta">{{ site.data.translations[page.lang].buttons.all_brands }}</a>
      </div>
    </section>
  </div>
</div>

<!-- Latest Insights Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <!-- Latest Insights Section -->
    <section class="discover__section discover__section--insights">
      <div class="discover__section-header">
        <h2 class="discover__section-title">
          <span class="discover__icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2a3 3 0 0 0 0 6 3 3 0 0 0 0-6z"></path>
              <path d="M19 9H5a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2z"></path>
              <path d="M12 18v3M8 18v3M16 18v3"></path>
            </svg>
          </span>
          {{ site.data.translations[page.lang].insights.latest }}
        </h2>
        <p class="discover__section-description">发现来自新兴市场的隐藏瑰宝和引人入胜的创始人故事</p>
      </div>
      
      <div class="discover__insights-grid">
        {% assign recent_insights = site.insights | where: "lang", page.lang | sort: "date" | reverse | limit: 2 %}
        {% if recent_insights.size > 0 %}
          {% for insight in recent_insights %}
            {% include components/cards/insight-card.html insight=insight %}
          {% endfor %}
        {% else %}
          <div class="discover__empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z"></path>
              <path d="M8 10h8M8 14h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].insights.no_insights }}</p>
          </div>
        {% endif %}
      </div>
      
      <div class="discover__section-action">
        <a href="{{ site.baseurl }}/{{ page.lang }}/insights/" class="btn btn--secondary-cta">{{ site.data.translations[page.lang].insights.view_all }}</a>
      </div>
    </section>
  </div>
</div>

<!-- Contact CTA Panel -->
<div class="panel panel--cta">
  <div class="panel__content panel--centered">
    <h2 class="panel__heading-secondary">准备探索金砖国家+品牌？</h2>
    <p class="panel__lead-text">联系我们，了解更多关于我们的发现平台或讨论您的具体需求。</p>
    <div class="cta-buttons">
      <a href="{{ site.baseurl }}/{{ page.lang }}/about/#contact" class="btn btn--secondary-cta">联系我们</a>
    </div>
  </div>
</div>