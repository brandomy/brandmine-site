---
layout: discover
title: Discover by Market
subtitle: Explore brands from growing BRICS+ regions
permalink: /en/discover/markets/
lang: en
ref: markets
discovery_path: markets
---

<div class="markets-grid">
  {% assign market_tags = site.tags | where: "tag_type", "country" | where: "lang", page.lang %}
  
  {% for market in market_tags %}
  <div class="market-card">
    <div class="market-icon">
      {% if market.icon %}
      <img src="{{ market.icon | relative_url }}" alt="{{ market.title }} icon">
      {% else %}
      <div class="placeholder-icon"></div>
      {% endif %}
    </div>
    
    <h3>{{ market.title }}</h3>
    
    <p>{{ market.description }}</p>
    
    <a href="{{ market.url | relative_url }}" class="btn-secondary">{{ site.data.translations[page.lang].discover.explore_market }}</a>
  </div>
  {% endfor %}
</div>
