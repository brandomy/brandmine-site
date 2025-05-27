---
layout: search
title: 搜索结果
permalink: /zh/search/
lang: zh
ref: search
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

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const searchParams = new URLSearchParams(window.location.search);
    const query = searchParams.get('q');
    const resultsContainer = document.getElementById('search-results');
    
    if (!query) {
      resultsContainer.innerHTML = '<p>请输入搜索关键词。</p>';
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
        const langData = data.filter(item => item.lang === 'zh');
        
        // Filter for query matches
        const results = langData.filter(item => {
          const titleMatch = item.title && item.title.toLowerCase().includes(query.toLowerCase());
          const contentMatch = item.content && item.content.toLowerCase().includes(query.toLowerCase());
          return titleMatch || contentMatch;
        });
        
        if (results.length === 0) {
          resultsContainer.innerHTML = '<p>未找到与 "' + query + '" 匹配的结果。</p>';
          return;
        }
        
        let resultsHtml = '<p>找到 ' + results.length + ' 条与 "' + query + '" 匹配的结果：</p>';
        resultsHtml += '<ul class="search-results__list">';
        
        for (let i = 0; i < results.length; i++) {
          const result = results[i];
          
          // Translate result types for display
          let displayType = result.type || 'page';
          if (displayType === 'brand') displayType = '品牌';
          if (displayType === 'insight') displayType = '洞察';
          if (displayType === 'page') displayType = '页面';
          if (displayType === 'tag') displayType = '标签';
          
          resultsHtml += '<li class="search-results__item search-results__item--' + 
            (result.type || 'page') + '">' +
            '<a href="' + result.url + '" class="search-results__link">' +
            '<div class="search-results__type-badge">' + displayType + '</div>' +
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
        resultsContainer.innerHTML = '<p>加载搜索结果时出错: ' + error.message + '</p>';
        console.error("Search error:", error);
      });
  });
</script>