---
layout: dimensions-category
title: Секторы
subtitle: Находите бренды в различных отраслевых категориях и типах продукции
permalink: /ru/discover/sectors/
ref: sectors
category: sector
lang: ru
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary sectors__title">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- All Sectors Grid Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- All Sectors Grid -->
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          Все секторы
        </h2>
        <p class="sectors__section-description">Исследуйте все доступные бизнес-секторы в нашей базе данных</p>
      </div>
      
      <div class="sectors__grid">
        {% for sector in site.data.translations[page.lang].sectors %}
          {% assign slug = sector[0] %}
          {% assign name = sector[1] %}
          {% assign brand_count = site.brands | where: "lang", page.lang | where: "sector", name | size %}
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ slug }}/" class="sectors__item sectors__item--sector">
            <div class="sectors__item-content">
              <h3 class="sectors__item-title">{{ name }}</h3>
              <div class="sectors__item-meta">
                <span class="sectors__item-count">{{ brand_count }} брендов</span>
              </div>
              <div class="sectors__item-icon">
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
  </div>
</div>

<!-- Russian Sectors Special Focus Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--russian">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          Специальный фокус на российские секторы
        </h2>
        <p class="sectors__section-description">Исследуйте наш углубленный анализ 16 перспективных российских потребительских секторов</p>
      </div>
      
      <div class="sectors__featured">
        <div class="sectors__featured-item sectors__featured-item--special">
          <div class="sectors__featured-image">
            <img src="{{ site.baseurl }}/assets/images/sectors/russian-overview.jpg" alt="Обзор российских секторов" class="sectors__featured-img" onerror="this.src='{{ site.baseurl }}/assets/images/sectors/confectionery.jpg'">
          </div>
          <div class="sectors__featured-content">
            <h3 class="sectors__featured-title">Российские потребительские бренд-секторы</h3>
            <p class="sectors__featured-description">Откройте для себя нашу тщательно подобранную коллекцию из 16 перспективных российских потребительских секторов, от крафтовых спиртных напитков и натуральной косметики до деликатесов и гостиничного бизнеса. Каждый сектор предлагает уникальные инвестиционные и партнерские возможности с увлекательными историями.</p>
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="sectors__featured-link btn btn-outline">Исследовать российские секторы</a>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Featured Sectors Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--featured">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2l2.4 7.4h7.6l-6 4.6 2.3 7-6.3-4.6-6.3 4.6 2.3-7-6-4.6h7.6z"></path>
            </svg>
          </span>
          Избранные секторы
        </h2>
        <p class="sectors__section-description">Исследуйте наши важнейшие бизнес-секторы с самыми перспективными брендами</p>
      </div>
      
      <div class="sectors__featured">
        <div class="sectors__featured-grid">
          <!-- Featured Sector 1: Hotels & Resorts -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/hotels-resorts.jpg" alt="Отели и курорты" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">Отели и курорты</h3>
              <p class="sectors__featured-description">От исторических городских объектов до удаленных природных курортов, российские бутик-отели и курорты предлагают уникальный культурный опыт, демонстрирующий удивительное разнообразие страны.</p>
              <div class="sectors__featured-meta">
                {% assign hotel_count = site.brands | where: "lang", page.lang | where: "sector", "Отели и курорты" | size %}
                <span class="sectors__featured-count">{{ hotel_count }} брендов</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/hotels-resorts/" class="sectors__featured-link btn btn-outline">Исследовать отели и курорты</a>
            </div>
          </div>
          
          <!-- Featured Sector 2: Artisanal Spirits & Vodka -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/artisanal-spirits.jpg" alt="Крафтовые спиртные напитки и водка" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">Крафтовые спиртные напитки и водка</h3>
              <p class="sectors__featured-description">В России происходит ренессанс крафтовых спиртных напитков: за последнее десятилетие появилось более 80 новых премиальных дистиллерий, создающих уникальные продукты с увлекательными историями.</p>
              <div class="sectors__featured-meta">
                {% assign spirits_count = site.brands | where: "lang", page.lang | where: "sector", "Крафтовые спиртные напитки и водка" | size %}
                <span class="sectors__featured-count">{{ spirits_count }} брендов</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/artisanal-spirits/" class="sectors__featured-link btn btn-outline">Исследовать крафтовые спиртные напитки</a>
            </div>
          </div>
          
          <!-- Featured Sector 3: Natural Beauty Products -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/natural-beauty.jpg" alt="Натуральная косметика" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">Натуральная косметика</h3>
              <p class="sectors__featured-description">Российский сектор натуральной косметики использует обширные растительные ресурсы страны, особенно из Сибири и Дальнего Востока, где растения развили мощные биоактивные соединения.</p>
              <div class="sectors__featured-meta">
                {% assign beauty_count = site.brands | where: "lang", page.lang | where: "sector", "Натуральная косметика" | size %}
                <span class="sectors__featured-count">{{ beauty_count }} брендов</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/natural-beauty/" class="sectors__featured-link btn btn-outline">Исследовать натуральную косметику</a>
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
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--insights">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2a3 3 0 0 0 0 6 3 3 0 0 0 0-6z"></path>
              <path d="M19 9H5a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2z"></path>
              <path d="M12 18v3M8 18v3M16 18v3"></path>
            </svg>
          </span>
          Аналитика секторов
        </h2>
        <p class="sectors__section-description">Читайте наши последние аналитические материалы и истории о бизнес-секторах стран БРИКС+</p>
      </div>
      
      <div class="sectors__insights">
        {% assign all_insights = site.insights | default: empty %}
        {% assign sector_insights = all_insights | where: "lang", page.lang | where: "category", "sector" | sort: "date" | reverse | limit: 2 %}
        {% if sector_insights.size > 0 %}
          <div class="sectors__insights-grid">
            {% for insight in sector_insights %}
              {% include components/cards/insight-card.html insight=insight %}
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
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/?category=sector" class="btn btn--secondary-cta">Просмотреть всю аналитику секторов</a>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- All Categories Link Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <div class="sectors__navigation">
      <h3 class="sectors__navigation-title">Исследуйте другие измерения</h3>
      <div class="sectors__navigation-links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="sectors__navigation-link sectors__navigation-link--russian-sectors">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          Российские секторы
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="sectors__navigation-link sectors__navigation-link--market">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10a15.3 15.3 0 0 1-4-10a15.3 15.3 0 0 1 4-10z"></path>
            </svg>
          </span>
          Рынки
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="sectors__navigation-link sectors__navigation-link--attribute">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          Атрибуты
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="sectors__navigation-link sectors__navigation-link--signal">
          <span class="sectors__navigation-icon">
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