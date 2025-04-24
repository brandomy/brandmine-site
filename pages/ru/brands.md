---
layout: default
title: Бренды
permalink: /ru/brands/
lang: ru
ref: brands
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary brands__title">Откройте для себя ведущие потребительские бренды БРИКС+</h1>
    <p class="panel__subtitle">Преодолевая барьеры для новых возможностей</p>
  </div>
</div>

<!-- Introduction Panel -->
<div class="panel panel--light brands-panel">
  <div class="panel__content">
    <p class="panel__lead-text">Brandmine предлагает беспрецедентный доступ к потребительским брендам, которые доказали свой успех на рынках БРИКС+, но остаются неоткрытыми на международном уровне из-за языковых, политических и культурных барьеров.</p>
  </div>
</div>

<!-- Search Panel - NEW -->
<div class="panel panel--primary-soft brands-panel">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Поиск в нашей базе брендов</h2>
    <p class="panel__lead-text">Ищете конкретные бренды? Используйте наш поиск, чтобы найти именно то, что вам нужно.</p>
    
    <div class="brands__search-container">
      <form action="{{ site.baseurl }}/{{ page.lang }}/search/" method="get" class="brands__search-form">
        <input type="text" name="q" class="brands__search-input" placeholder="{{ site.data.translations[page.lang].search.placeholder }}" aria-label="Поиск брендов">
        <button type="submit" class="brands__search-button">
          <i class="fas fa-search"></i>
          {{ site.data.translations[page.lang].search.button }}
        </button>
      </form>
    </div>
    
    <div class="brands__search-suggestions">
      <p class="brands__search-suggestions-title">{{ site.data.translations[page.lang].search.popular_searches }}</p>
      <div class="brands__search-tags">
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=вино" class="brands__search-tag">Вино</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=красота" class="brands__search-tag">Красота</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=основатель" class="brands__search-tag">Управляемые основателями</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=москва" class="brands__search-tag">Москва</a>
      </div>
    </div>
  </div>
</div>

<!-- Brand Profiles Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Полные профили брендов</h2>
    <p class="panel__lead-text">Наши тщательно подобранные профили брендов выходят за рамки базовой информации о компании и раскрывают:</p>
    
    <div class="brands__features-list">
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><line x1="10" y1="9" x2="8" y2="9"></line></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">История создания</h3>
          <p class="brands__feature-text">Видение и путь, стоящие за каждым брендом</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="4"></circle><line x1="21.17" y1="8" x2="12" y2="8"></line><line x1="3.95" y1="6.06" x2="8.54" y2="14"></line><line x1="10.88" y1="21.94" x2="15.46" y2="14"></line></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Визуальная идентичность</h3>
          <p class="brands__feature-text">Активы бренда, упаковка и изображения продукции</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="20" x2="12" y2="10"></line><line x1="18" y1="20" x2="18" y2="4"></line><line x1="6" y1="20" x2="6" y2="16"></line><rect x="2" y="20" width="20" height="2" rx="1"></rect></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Позиция на рынке</h3>
          <p class="brands__feature-text">Конкурентный ландшафт и отношения с потребителями</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Ключевые люди</h3>
          <p class="brands__feature-text">Руководство и лица, принимающие решения</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Траектория роста</h3>
          <p class="brands__feature-text">Исторические вехи и направление развития</p>
        </div>
      </div>

      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Присутствие на рынке</h3>
          <p class="brands__feature-text">Геоаналитика и розничная сеть</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Featured Brands Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Избранные бренды</h2>
    
    <div class="brands__grid">
      <!-- This will be populated dynamically in the future -->
      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">Название бренда</h3>
        <p>Краткое описание бренда, подчеркивающее его уникальные особенности и происхождение.</p>
        <div class="brands__meta">
          <span class="brands__tag--country">Россия</span>
          <span class="brands__tag--sector">Ремесленная еда</span>
        </div>
      </div>
      
      <!-- Add 2 more placeholder cards -->
      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">Название бренда</h3>
        <p>Краткое описание бренда, подчеркивающее его уникальные особенности и происхождение.</p>
        <div class="brands__meta">
          <span class="brands__tag--country">Бразилия</span>
          <span class="brands__tag--sector">Натуральная косметика</span>
        </div>
      </div>
      
      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">Название бренда</h3>
        <p>Краткое описание бренда, подчеркивающее его уникальные особенности и происхождение.</p>
        <div class="brands__meta">
          <span class="brands__tag--country">Индия</span>
          <span class="brands__tag--sector">Мода</span>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Find Your Partner Panel -->
<div class="panel panel--accent-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Найдите своего следующего партнера</h2>
    <p class="panel__lead-text">Используйте наши расширенные инструменты поиска и фильтрации для поиска брендов по:</p>
    
    <div class="brands__filters">
      <div class="brands__filter">Рынок происхождения</div>
      <div class="brands__filter">Сектор</div>
      <div class="brands__filter">Сигналы</div>
      <div class="brands__filter">Атрибуты</div>
    </div>
    
    <div class="brands__cta">
      <button id="database-button" class="btn btn--primary-cta" onclick="trackButtonClick(this)">Запустить интерактивную базу данных</button>
      <div id="button-feedback" class="brands__feedback" style="display: none; margin-top: var(--space-2); color: var(--primary-600);">
        Скоро! Мы работаем над этой функцией.
      </div>
    </div>
  </div>
</div>

<!-- Contact CTA Panel -->
<div class="panel panel--cta">
  <div class="panel__content panel--centered">
    <h2 class="panel__heading-secondary">Готовы открыть для себя бренды БРИКС+?</h2>
    <p class="panel__lead-text">Свяжитесь с нами, чтобы узнать больше о наших избранных брендах или обсудить ваши конкретные потребности.</p>
    <div class="cta-buttons">
      <a href="{{ site.baseurl }}/{{ page.lang }}/about/#contact" class="btn btn--secondary-cta">Связаться с нами</a>
    </div>
  </div>
</div>

<script>
  function trackButtonClick(button) {
    console.log('Database button clicked');
    
    // Show feedback message
    const feedback = document.getElementById('button-feedback');
    feedback.style.display = 'block';
    
    // Hide the message after 10 seconds
    setTimeout(() => {
      feedback.style.display = 'none';
    }, 10000);
  }
</script>