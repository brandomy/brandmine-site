---
layout: default
title: Image Component Test
permalink: en/dev/test-images/
ref: test-images/
---

<h1>Unified Image Component Test</h1>

<h2>Brand Images</h2>
<!-- Hero image -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   name="storefront"
   aspect="landscape"
   alt="TeaTime storefront" %}

<!-- Logo -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="logo"
   name="color"
   ext="png"
   aspect="square"
   alt="TeaTime logo" %}

<!-- Founder portrait -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="founder"
   name="portrait"
   aspect="portrait"
   alt="TeaTime founder" %}

<h2>Founder Images</h2>
{% include components/images/collection-image.html
   collection="founders"
   slug="br-eduardo-santos"
   purpose="portrait"
   aspect="portrait"
   alt="Eduardo Santos" %}

<h2>People Images</h2>
{% include components/images/collection-image.html
   collection="people"
   category="team"
   slug="olya-eastman"
   purpose="headshot"
   aspect="square"
   alt="Olya Eastman" %}
