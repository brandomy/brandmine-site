---
layout: default
title: Search Results
permalink: /en/search/
lang: en
ref: search
---

<div class="panel panel--light search-results-page">
  <div class="panel__content">
    <h1 class="panel__heading-primary">Search Results</h1>
    
    <div class="search-box">
      <form id="search-form" action="{{ site.baseurl }}/{{ page.lang }}/search/" method="get">
        <input type="text" id="search-input" name="q" class="search-box__input" 
               placeholder="{{ site.data.translations[page.lang].search.placeholder }}" aria-label="Search brands">
        <button type="submit" class="search-box__button">
          <i class="fas fa-search"></i>
          {{ site.data.translations[page.lang].search.button }}
        </button>
      </form>
    </div>
    
    <div class="search-popular">
      <p class="search-popular__title">{{ site.data.translations[page.lang].search.popular_searches }}</p>
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
</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const searchParams = new URLSearchParams(window.location.search);
    const query = searchParams.get('q');
    const resultsContainer = document.getElementById('search-results');
    
    if (!query) {
      resultsContainer.innerHTML = '<p>Please enter a search term.</p>';
      return;
    }
    
    document.getElementById('search-input').value = query;
    
    // First, try to fetch the raw JSON
    fetch('/search.json')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.text(); // Get raw text first
      })
      .then(text => {
        try {
          // Try to log and parse the raw JSON
          console.log("Raw JSON:", text.substring(0, 500) + "..."); // Log the first 500 chars
          return JSON.parse(text);
        } catch (e) {
          console.error("JSON parse error:", e);
          throw new Error('JSON parsing failed: ' + e.message);
        }
      })
      .then(data => {
        // Filter for current language
        const langData = data.filter(item => item.lang === 'en');
        
        // Filter for query matches
        const results = langData.filter(item => {
          const titleMatch = item.title && item.title.toLowerCase().includes(query.toLowerCase());
          const contentMatch = item.content && item.content.toLowerCase().includes(query.toLowerCase());
          return titleMatch || contentMatch;
        });
        
        if (results.length === 0) {
          resultsContainer.innerHTML = '<p>No results found for "' + query + '".</p>';
          return;
        }
        
        let resultsHtml = '<p>Found ' + results.length + ' results for "' + query + '":</p>';
        resultsHtml += '<ul class="search-results__list">';
        
        for (let i = 0; i < results.length; i++) {
          const result = results[i];
          resultsHtml += '<li class="search-results__item search-results__item--' + 
            (result.type || 'page') + '">' +
            '<a href="' + result.url + '" class="search-results__link">' +
            '<div class="search-results__type-badge">' + (result.type || 'page') + '</div>' +
            '<h3 class="search-results__title">' + (result.title || '') + '</h3>';
          
          if (result.content) {
            let excerpt = result.content;
            if (excerpt.length > 150) {
              excerpt = excerpt.substring(0, 150) + '...';
            }
            resultsHtml += '<p class="search-results__excerpt">' + excerpt + '</p>';
          }
          
          resultsHtml += '</a></li>';
        }
        
        resultsHtml += '</ul>';
        resultsContainer.innerHTML = resultsHtml;
      })
      .catch(error => {
        resultsContainer.innerHTML = '<p>Error loading search results: ' + error.message + '</p>';
        console.error("Search error:", error);
      });
  });
</script>