---
layout: default
title: Test Dimensions
permalink: /en/test-dimensions/
lang: en
ref: test-dimensions
---

# Attributes

{% assign related_dimensions = site.dimensions | where: "category", "attribute" | where: "lang", "en" %}
{% include collections/dimensions/dimension-list.html dimensions=related_dimensions %}

# Markets

{% assign related_dimensions = site.dimensions | where: "category", "market" | where: "lang", "en" %}
{% include collections/dimensions/dimension-list.html dimensions=related_dimensions %}

# All Together

{% assign related_dimensions = site.dimensions | where: "category", "market" | where: "lang", "en" %}
{% include collections/dimensions/dimension-list.html dimensions=related_dimensions %}

{% assign related_dimensions = site.dimensions | where: "category", "sector" | where: "lang", "en" %}
{% include collections/dimensions/dimension-list.html dimensions=related_dimensions %}

{% assign related_dimensions = site.dimensions | where: "category", "attribute" | where: "lang", "en" %}
{% include collections/dimensions/dimension-list.html dimensions=related_dimensions %}

{% assign related_dimensions = site.dimensions | where: "category", "signal" | where: "lang", "en" %}
{% include collections/dimensions/dimension-list.html dimensions=related_dimensions %}

## Dimension Cloud!

  {% include collections/dimensions/dimension-cloud.html %}
