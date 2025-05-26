---
layout: insights-type  
title: "Путь основателей"
permalink: /ru/insights/categories/founders-journey/
lang: ru
insight_type: "founders-journey"
description: "Истории стоящих за брендами людей и созданных ими компаний."
---

## Путь основателей

Истории стоящих за брендами людей и созданных ими компаний.

{% assign empty_array = "" | split: "" %}
{% assign type_insights = site.insights | default: empty_array | where: "lang", page.lang | where: "category", page.insight_type | sort: "date" | reverse %}

<div class="insights-grid">
  {% for insight in type_insights %}
    {% include components/cards/insight-card.html insight=insight %}
  {% endfor %}
</div>

{% if type_insights.size == 0 %}
  <p class="no-insights">Истории основателей пока недоступны. Проверьте позже!</p>
{% endif %}