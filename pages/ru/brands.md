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
<div class="panel panel--light">
  <div class="panel__content">
    <p class="panel__lead-text">Brandmine предлагает беспрецедентный доступ к потребительским брендам, которые доказали свой успех на рынках БРИКС+, но остаются неоткрытыми на международном уровне из-за языковых, политических и культурных барьеров.</p>
  </div>
</div>

<!-- Search Panel - NEW -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Поиск в нашей базе брендов</h2>
    <p class="panel__lead-text">Ищете конкретные бренды? Используйте наш поиск, чтобы найти именно то, что вам нужно.</p>
    
    <div class="brands__search-container">
      <form action="{{ site.baseurl }}/{{ page.lang }}/search/" method="get" class="brands__search-form">
        <input type="text" name="q" class="brands__search-input" placeholder="{{ site.data.translations[page.lang].search.placeholder }}" aria-label="Поиск брендов">
        <button type="submit" class="btn btn--primary brands__search-button">
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
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 3a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3 3 3 0 0 0 3-3 3 3 0 0 0-3-3H6a3 3 0 0 0-3 3 3 3 0 0 0 3 3 3 3 0 0 0 3-3V6a3 3 0 0 0-3-3 3 3 0 0 0-3 3 3 3 0 0 0 3 3h12a3 3 0 0 0 3-3 3 3 0 0 0-3-3z"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">История создания</h3>
          <p class="brands__feature-text">Видение и путь, стоящие за каждым брендом</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 3h7a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-7m0-18H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h7m0-18v18"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Визуальная идентичность</h3>
          <p class="brands__feature-text">Активы бренда, упаковка и изображения продукции</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M16 12l-4 4-4-4M12 8v7"></path></svg>
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
      <div class="brands__filter">Размер компании</div>
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