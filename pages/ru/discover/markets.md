---
layout: discover
title: Рынки
subtitle: Исследуйте бренды по их географическому происхождению в странах БРИКС+
permalink: /ru/discover/markets/
ref: markets
discovery_path: markets
lang: ru
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary markets__title">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- Map Section Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <section class="markets__section" id="map">
      <div class="markets__section-header">
        <h2 class="markets__section-title">
          <span class="markets__icon markets__icon--map">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M9 19l-4 1.5v-15l4-1.5 6 1.5 4-1.5v15l-4 1.5-6-1.5zm6-1.5v-15m-6 0v15"></path>
            </svg>
          </span>
          Карта местоположения брендов
        </h2>
        <p class="markets__section-description">Изучите географическое распределение брендов в регионах БРИКС+</p>
      </div>
      
      <div class="markets-map">
        <div class="markets-map__container" id="brandsMap">
          <!-- Map will be inserted here via JavaScript -->
          <div class="markets-map__placeholder">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M9 19l-4 1.5v-15l4-1.5 6 1.5 4-1.5v15l-4 1.5-6-1.5zm6-1.5v-15m-6 0v15"></path>
            </svg>
            <span>Интерактивная карта скоро появится</span>
          </div>
        </div>
        
        <div class="markets-map__legend">
          <div class="markets-map__legend-title">Условные обозначения</div>
          <div class="markets-map__legend-items">
            <div class="markets-map__legend-item">
              <span class="markets-map__legend-marker markets-map__legend-marker--hotel"></span>
              <span class="markets-map__legend-label">Отели и курорты</span>
            </div>
            <div class="markets-map__legend-item">
              <span class="markets-map__legend-marker markets-map__legend-marker--spirits"></span>
              <span class="markets-map__legend-label">Крафтовые спиртные напитки</span>
            </div>
            <div class="markets-map__legend-item">
              <span class="markets-map__legend-marker markets-map__legend-marker--beauty"></span>
              <span class="markets-map__legend-label">Натуральная косметика</span>
            </div>
            <div class="markets-map__legend-item">
              <span class="markets-map__legend-marker markets-map__legend-marker--other"></span>
              <span class="markets-map__legend-label">Другие секторы</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- All Markets Grid Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <section class="markets__section">
      <div class="markets__section-header">
        <h2 class="markets__section-title">
          <span class="markets__icon markets__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10a15.3 15.3 0 0 1-4-10a15.3 15.3 0 0 1 4-10z"></path>
            </svg>
          </span>
          Все рынки
        </h2>
        <p class="markets__section-description">Исследуйте бренды по географическим рынкам</p>
      </div>
      
      <div class="markets__grid">
        {% for market in site.data.translations[page.lang].markets %}
          {% assign slug = market[0] %}
          {% assign name = market[1] %}
          {% assign brand_count = site.brands | where: "lang", page.lang | where: "market", name | size %}
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/{{ slug }}/" class="markets__item markets__item--market">
            <div class="markets__item-content">
              <h3 class="markets__item-title">{{ name }}</h3>
              <div class="markets__item-meta">
                <span class="markets__item-count">{{ brand_count }} брендов</span>
              </div>
              <div class="markets__item-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                  <circle cx="12" cy="12" r="10"></circle>
                  <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10a15.3 15.3 0 0 1-4-10a15.3 15.3 0 0 1 4-10z"></path>
                </svg>
              </div>
            </div>
          </a>
        {% endfor %}
      </div>
    </section>
  </div>
</div>

<!-- Featured Markets Panel -->
<div class="panel panel--sky-soft">
  <div class="panel__content">
    <section class="markets__section">
      <div class="markets__section-header">
        <h2 class="markets__section-title">
          <span class="markets__icon markets__icon--featured">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2l2.4 7.4h7.6l-6 4.6 2.3 7-6.3-4.6-6.3 4.6 2.3-7-6-4.6h7.6z"></path>
            </svg>
          </span>
          Избранные рынки
        </h2>
        <p class="markets__section-description">Изучите наши выделенные географические рынки с наиболее перспективными брендами</p>
      </div>
      
      <div class="markets__featured">
        <div class="markets__featured-grid">
          <!-- Featured Market 1: Russia -->
          <div class="markets__featured-item">
            <div class="markets__featured-image">
              <img src="{{ site.baseurl }}/assets/images/markets/russia.jpg" alt="Россия" class="markets__featured-img">
            </div>
            <div class="markets__featured-content">
              <h3 class="markets__featured-title">Россия</h3>
              <p class="markets__featured-description">Обширная территория России включает всё: от исторических городских центров до нетронутой природы, создавая разнообразный рынок для характерных потребительских брендов в различных секторах.</p>
              <div class="markets__featured-meta">
                {% assign russia_count = site.brands | where: "lang", page.lang | where: "market", "Россия" | size %}
                <span class="markets__featured-count">{{ russia_count }} брендов</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/russia/" class="markets__featured-link btn btn--outline-light">Исследовать российские бренды</a>
            </div>
          </div>
          
          <!-- Featured Market 2: China -->
          <div class="markets__featured-item">
            <div class="markets__featured-image">
              <img src="{{ site.baseurl }}/assets/images/markets/china.jpg" alt="Китай" class="markets__featured-img">
            </div>
            <div class="markets__featured-content">
              <h3 class="markets__featured-title">Китай</h3>
              <p class="markets__featured-description">Быстро развивающийся потребительский ландшафт Китая создал возможности для инновационных брендов, сочетающих традиционное наследие с современным дизайном и глобальной привлекательностью.</p>
              <div class="markets__featured-meta">
                {% assign china_count = site.brands | where: "lang", page.lang | where: "market", "Китай" | size %}
                <span class="markets__featured-count">{{ china_count }} брендов</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/china/" class="markets__featured-link btn btn--outline-light">Исследовать китайские бренды</a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Related Insights Panel -->
<div class="panel panel--accent-soft">
  <div class="panel__content">
    <section class="markets__section">
      <div class="markets__section-header">
        <h2 class="markets__section-title">
          <span class="markets__icon markets__icon--insights">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2a3 3 0 0 0 0 6 3 3 0 0 0 0-6z"></path>
              <path d="M19 9H5a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2z"></path>
              <path d="M12 18v3M8 18v3M16 18v3"></path>
            </svg>
          </span>
          Аналитика рынков
        </h2>
        <p class="markets__section-description">Читайте наши последние анализы и рассказы о рынках БРИКС+</p>
      </div>
      
      <div class="markets__insights">
        {% assign market_insights = site.insights | default: ("" | split: "") | where: "lang", page.lang | where: "category", "market" | sort: "date" | reverse | limit: 2 %}
        {% if market_insights.size > 0 %}
          <div class="markets__insights-grid">
            {% for insight in market_insights %}
              {% include components/cards/insight-card.html insight=insight %}
            {% endfor %}
          </div>
        {% else %}
          <div class="markets__empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z"></path>
              <path d="M8 10h8M8 14h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].insights.no_insights }}</p>
          </div>
        {% endif %}
        
        <div class="markets__section-action">
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/?category=market" class="btn btn--secondary-cta">Просмотреть всю аналитику рынков</a>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- All Categories Link Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <div class="markets__navigation">
      <h3 class="markets__navigation-title">Изучите другие измерения</h3>
      <div class="markets__navigation-links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="markets__navigation-link markets__navigation-link--sector">
          <span class="markets__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          Секторы
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="markets__navigation-link markets__navigation-link--sector">
          <span class="markets__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          Российские секторы
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="markets__navigation-link markets__navigation-link--attribute">
          <span class="markets__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          Атрибуты
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="markets__navigation-link markets__navigation-link--signal">
          <span class="markets__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </span>
          Сигналы роста
        </a>
      </div>
    </div>
  </div>
</div>