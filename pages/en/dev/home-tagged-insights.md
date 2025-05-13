---
layout: default
title: Home with Tagged Insights
permalink: /en/dev/home-tagged-insights/
lang: en
---

<div class="home-page">
  {% include pages/home/hero.html %}
  {% include pages/home/impact-statement.html %}
  
  <!-- The new tagged insights section -->
  <section class="mt-5 mb-5">
    <div class="container">
      <h2 class="text-center mb-4">Latest Insights with Dimension Tags</h2>
      <p class="text-center mb-5">This variation shows dimension tags to provide additional context at a glance.</p>
    </div>
    
    {% include pages/home/latest-insights-tagged.html %}
  </section>
  
  <hr class="my-5">
  
  <!-- The original insights section for comparison -->
  <section class="mt-5 mb-5">
    <div class="container">
      <h2 class="text-center mb-4">Original Latest Insights</h2>
      <p class="text-center mb-5">The standard version without dimension tags.</p>
    </div>
    
    {% include pages/home/latest-insights.html %}
  </section>
  
  {% include pages/home/final-cta.html %}
</div>