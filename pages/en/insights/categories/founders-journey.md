---
layout: insights-type
title: "Founder's Journey"
permalink: /en/insights/categories/founders-journey/
lang: en
insight_type: "founders-journey"
description: "Personal stories behind the brands and the visionaries who created them."
---

## Founder's Journey Insights

Explore the personal stories behind BRICS+ brands and the visionaries who created them. These insights reveal the entrepreneurial spirit and determination that drives innovation.

{% assign empty_array = "" | split: "" %}
{% assign type_insights = site.insights | default: empty_array | where: "lang", page.lang | where: "category", page.insight_type | sort: "date" | reverse %}

<div class="insights-grid">
  {% for insight in type_insights %}
    {% include components/cards/insight-card.html insight=insight %}
  {% endfor %}
</div>

{% if type_insights.size == 0 %}
  <p class="no-insights">No Founder's Journey insights available yet. Check back soon!</p>
{% endif %}
