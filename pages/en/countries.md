---
layout: default
title: Country Focus
permalink: /en/countries/
lang: en
---

<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h1>Country Focus</h1>
    
    <p>Brandmine's country tags help you discover content based on geographic focus. Our initial focus covers the original BRICS nations, with more countries to be added as we expand.</p>
    
    <div class="country-grid">
      {% assign country_tags = site.tags | where: "tag_type", "country" | where: "lang", page.lang %}
      {% for tag in country_tags %}
        <div class="country-card">
          <h2><a href="{{ tag.url | relative_url }}">{{ tag.title }}</a></h2>
          <p>{{ tag.description }}</p>
          <a href="{{ tag.url | relative_url }}" class="btn-secondary">Explore {{ tag.title }}</a>
        </div>
      {% endfor %}
    </div>
  </div>
</div>