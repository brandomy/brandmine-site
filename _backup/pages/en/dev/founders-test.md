---
layout: page
title: "Founders Card Layout Testing"
permalink: /en/dev/founders-test/
lang: en
---

<div class="container" style="max-width: 1200px; margin: 0 auto; padding: var(--space-8);">
  
  <header style="text-align: center; margin-bottom: var(--space-12);">
    <h1>Founders Card Layout Testing</h1>
    <p style="font-size: var(--text-lg); color: var(--neutral-600);">
      Testing founder cards with real founder data
    </p>
  </header>

  <!-- Get founder data -->
  {% assign eduardo = site.founders | where: "ref", "br-eduardo-santos" | where: "lang", "en" | first %}
  {% assign all_founders = site.founders | where: "lang", "en" | limit: 3 %}

  <!-- Section 1: Standard Founder Card -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="color: var(--neutral-700); margin-bottom: var(--space-4);">Standard Founder Card</h2>
    <div style="max-width: 900px; margin: 0 auto;">
      {% include components/cards/founder-card.html founder=eduardo %}
    </div>
  </section>

  <!-- Section 2: Featured Founder Card -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="color: var(--neutral-700); margin-bottom: var(--space-4);">Featured Founder Card</h2>
    <div style="max-width: 900px; margin: 0 auto;">
      {% include components/cards/founder-card-featured.html founder=eduardo %}
    </div>
  </section>

  <!-- Section 3: Grid Layout Test -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="color: var(--neutral-700); margin-bottom: var(--space-4);">Grid Layout Test</h2>
    <div style="margin: 0 auto;">
      {% include components/layout/grid.html items=all_founders type="founder" limit=3 %}
    </div>
  </section>

</div>