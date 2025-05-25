---
layout: simple
title: "Signals Test Page"
ref: test-signals
permalink: /en/test-signals/
lang: en
---

# Signals Test Page

## Test 1: Just Signals Card

<div style="max-width: 400px; margin: 20px 0;">
{% include components/cards/dimension-card.html type="signals" limit=6 %}
</div>

## Test 2: All 4 Dimension Cards

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin: 20px 0;">
{% include components/cards/dimension-card.html type="markets" limit=6 %}
{% include components/cards/dimension-card.html type="sectors" limit=6 %}
{% include components/cards/dimension-card.html type="attributes" limit=6 %}
{% include components/cards/dimension-card.html type="signals" limit=6 %}
</div>

## Test 3: Just Signals Tag Cloud

<div style="margin: 20px 0; padding: 20px; border: 2px solid #ccc;">
<h3>Direct Tag Cloud Test:</h3>
{% include components/dimensions/dimension-tag-cloud.html type="signals" limit=6 %}
</div>

## Debug Info

<div style="margin: 20px 0; padding: 20px; background: #f5f5f5;">
<h3>Debug Data:</h3>
<pre>
Signals data access: site.data.signals
Current page.lang: {{ page.lang }}
Signals array size: {{ site.data.signals.size }}

Raw signals check:
{% if site.data.signals %}HAS SIGNALS DATA{% else %}NO SIGNALS DATA{% endif %}

First 3 signals:
{% for signal in site.data.signals limit:3 %}
- {{ signal.name.en }} (featured: {{ signal.featured }}, id: {{ signal.id }})
{% endfor %}

Test manual tag:
{% for signal in site.data.signals %}
  {% if signal.featured %}
    <span style="background: purple; color: white; padding: 4px;">{{ signal.name.en }}</span>
  {% endif %}
{% endfor %}
</pre>
</div>
