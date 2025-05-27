---
layout: search
title: Результаты поиска
permalink: /ru/search/
lang: ru
ref: search-results  # Changed for consistency
sections:
  - breadcrumbs
  - content
---

<div class="search-results-page">
  <h1 class="panel__heading-primary">Результаты поиска</h1>

    <div class="search-box">
      <form id="search-form" action="{{ site.baseurl }}/{{ page.lang }}/search/" method="get">
        <input type="text" id="search-input" name="q" class="search-box__input"
               placeholder="{% include helpers/t.html key="search.placeholder" fallback="Поиск брендов..." %}" aria-label="Поиск брендов">
        <button type="submit" class="search-box__button">
          <i class="fas fa-search"></i>
          {% include helpers/t.html key="search.button" fallback="Поиск" %}
        </button>
      </form>
    </div>

    <div class="search-popular">
      <p class="search-popular__title">{% include helpers/t.html key="search.popular_searches" fallback="Популярные поисковые запросы" %}</p>
      <div class="search-popular__tags">
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=вино" class="search-popular__tag">Вино</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=красота" class="search-popular__tag">Красота</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=основатель" class="search-popular__tag">Управляемые основателями</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=москва" class="search-popular__tag">Москва</a>
      </div>
    </div>

    <div id="search-results" class="search-results">
      <p class="search-results__loading">Загрузка результатов поиска...</p>
    </div>
</div>

<script src="{{ '/assets/js/search/search-results.js' | relative_url }}"></script>
