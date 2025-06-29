---
layout: default
title: Brand Cards Simple Test
permalink: /test/brand-cards-simple-test/
lang: en
---

<div class="container">
  <h1>Brand Cards BEM Test</h1>

  {% assign test_brands = site.brands | where: "lang", "en" | limit: 3 %}

  <h2>Grid Layout Test</h2>
  <div class="grid" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 2rem;">
    {% for brand in test_brands %}
      <div class="grid__item">
        {% include components/cards/brand-card.html brand=brand %}
      </div>
    {% endfor %}
  </div>

  <h2>Featured Variant Test</h2>
  <div class="grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; margin-top: 2rem;">
    {% for brand in test_brands limit:2 %}
      <div class="grid__item">
        {% include components/cards/brand-card.html brand=brand variant="featured" %}
      </div>
    {% endfor %}
  </div>
</div>