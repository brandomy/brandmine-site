---
layout: search
title: 搜索结果
permalink: /zh/search/
lang: zh
ref: search-results  # Changed for consistency
sections:
  - breadcrumbs
  - content
---

<div class="search-results-page">
  <h1 class="panel__heading-primary">搜索结果</h1>

    <div class="search-box">
      <form id="search-form" action="{{ site.baseurl }}/{{ page.lang }}/search/" method="get">
        <input type="text" id="search-input" name="q" class="search-box__input"
               placeholder="{% include helpers/t.html key="search.placeholder" fallback="搜索品牌..." %}" aria-label="搜索品牌">
        <button type="submit" class="search-box__button">
          <i class="fas fa-search"></i>
          {% include helpers/t.html key="search.button" fallback="搜索" %}
        </button>
      </form>
    </div>

    <div class="search-popular">
      <p class="search-popular__title">{% include helpers/t.html key="search.popular_searches" fallback="热门搜索" %}</p>
      <div class="search-popular__tags">
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=葡萄酒" class="search-popular__tag">葡萄酒</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=美容" class="search-popular__tag">美容</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=创始人" class="search-popular__tag">创始人领导</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=莫斯科" class="search-popular__tag">莫斯科</a>
      </div>
    </div>

    <div id="search-results" class="search-results">
      <p class="search-results__loading">正在加载搜索结果...</p>
    </div>
</div>

<script src="{{ '/assets/js/search/search-results.js' | relative_url }}"></script>
