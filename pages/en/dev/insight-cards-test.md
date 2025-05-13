---
layout: default
title: Insight Cards Test
permalink: /en/dev/insight-cards-test/
lang: en
---

<div class="container">
  <div class="row">
    <div class="col-12">
      <h1>Insight Cards Comparison</h1>
      <p>This page shows different variations of insight cards for comparison and testing purposes.</p>
    </div>
  </div>

  <section class="mt-5 mb-5">
    <h2>Standard Insight Card</h2>
    <div class="row mt-3">
      {% for insight in site.insights limit:2 %}
        {% if insight.lang == page.lang %}
        <div class="col-12 col-md-6 mb-4">
          {% include components/cards/insight-card.html insight=insight %}
        </div>
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="mt-5 mb-5">
    <h2>Featured Insight Card</h2>
    <div class="row mt-3">
      {% for insight in site.insights limit:2 %}
        {% if insight.lang == page.lang %}
        <div class="col-12 col-md-6 mb-4">
          {% include components/cards/featured-insight-card.html insight=insight %}
        </div>
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="mt-5 mb-5">
    <h2>Tagged Insight Card</h2>
    <div class="row mt-3">
      {% for insight in site.insights limit:2 %}
        {% if insight.lang == page.lang %}
        <div class="col-12 col-md-6 mb-4">
          {% include components/cards/tagged-insight-card.html insight=insight %}
        </div>
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="mt-5 mb-5">
    <h2>Simple Insight Card</h2>
    <div class="row mt-3">
      {% for insight in site.insights limit:2 %}
        {% if insight.lang == page.lang %}
        <div class="col-12 col-md-6 mb-4">
          {% assign insight_data = insight %}
          {% include components/cards/simple-insight-card.html insight=insight_data %}
        </div>
        {% endif %}
      {% endfor %}
    </div>
  </section>
</div>