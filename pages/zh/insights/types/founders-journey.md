---
layout: insights-type  
title: "创始人之路"
permalink: /zh/insights/types/founders-journey/
lang: zh
insight_type: "founders-journey"
description: "品牌背后人物及其创业历程的故事。"
---

## 创始人之路

品牌背后人物及其创业历程的故事。

{% assign empty_array = "" | split: "" %}
{% assign type_insights = site.insights | default: empty_array | where: "lang", page.lang | where: "category", page.insight_type | sort: "date" | reverse %}

<div class="insights-grid">
  {% for insight in type_insights %}
    {% include components/cards/insight-card.html insight=insight %}
  {% endfor %}
</div>

{% if type_insights.size == 0 %}
  <p class="no-insights">创始人故事暂时无法提供。请稍后查看！</p>
{% endif %}