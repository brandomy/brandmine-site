---
layout: search
title: Search Results
permalink: /en/search/
lang: en
ref: search-results  # Changed for consistency
sections:
  - breadcrumbs
  - content
---

<div class="search-results-page">
  <h1 class="panel__heading-primary">Search Results</h1>

    <div class="search-box">
      <form id="search-form" action="{{ site.baseurl }}/{{ page.lang }}/search/" method="get">
        <input type="text" id="search-input" name="q" class="search-box__input"
               placeholder="{% include helpers/t.html key='search.placeholder' fallback='Search...' %}" aria-label="Search brands">
        <button type="submit" class="search-box__button">
          <i class="fas fa-search"></i>
          {% include helpers/t.html key="search.button" fallback="Search" %}
        </button>
      </form>
    </div>

    <div class="search-popular">
      <p class="search-popular__title">{% include helpers/t.html key="search.popular_searches" fallback="Popular searches" %}</p>
      <div class="search-popular__tags">
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=wine" class="search-popular__tag">Wine</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=beauty" class="search-popular__tag">Beauty</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=founder" class="search-popular__tag">Founder-led</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=moscow" class="search-popular__tag">Moscow</a>
      </div>
    </div>

    <div id="search-results" class="search-results">
      <p class="search-results__loading">Loading search results...</p>
    </div>
</div>

<script src="{{ '/assets/js/search/search-results.js' | relative_url }}"></script>
