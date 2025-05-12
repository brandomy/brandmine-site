---
layout: default
title: Featured Brands Grid Test
permalink: /en/dev/featured-hero-test/
lang: en
ref: featured-hero-test
---

<div class="panel panel--light">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Featured Brands Grid Test</h2>
    <p class="panel__lead-text">Demonstrating all three brand card types</p>

    <div style="margin-bottom: 3rem;">
      <h3>1. Standard Brand Cards</h3>
      <p>Basic brand cards used in listings:</p>

      <div class="featured-brands-grid">
        {% assign standard_brands = site.brands | where: "lang", page.lang | where: "featured", false %}
        {% if standard_brands.size > 0 %}
          {% for brand in standard_brands limit:3 %}
            {% include components/cards/brand-card.html brand=brand %}
          {% endfor %}
        {% else %}
          <p>No standard brands found (featured = false)</p>
        {% endif %}
      </div>
    </div>

    <div style="margin-bottom: 3rem;">
      <h3>2. Featured Brand Cards</h3>
      <p>Enhanced cards with more details:</p>

      <div class="featured-brands-grid">
        {% assign featured_brands = site.brands | where: "lang", page.lang | where: "featured", true | where: "featured_level", 1 %}
        {% if featured_brands.size > 0 %}
          {% for brand in featured_brands limit:3 %}
            {% include components/cards/featured-brand-card.html brand=brand %}
          {% endfor %}
        {% else %}
          <p>No featured brands found (featured_level = 1)</p>
        {% endif %}
      </div>
    </div>

    <div style="margin-bottom: 3rem;">
      <h3>3. Hero Brand Cards</h3>
      <p>Premium cards with full details:</p>

      <div class="featured-brands-grid">
        {% assign premium_brands = site.brands | where: "lang", page.lang | where: "featured_level", 2 %}
        {% if premium_brands.size > 0 %}
          {% for brand in premium_brands limit:2 %}
            {% include components/cards/hero-brand-card.html brand=brand %}
          {% endfor %}
        {% else %}
          <p>No premium featured brands found (featured_level = 2)</p>
        {% endif %}
      </div>
    </div>

    <div style="margin-bottom: 3rem;">
      <h3>4. Mixed Featured Brands Grid</h3>
      <p>Combination of featured and hero cards:</p>

      <div class="featured-brands-grid">
        {% assign all_featured_brands = site.brands | where: "lang", page.lang | where: "featured", true | sort: "featured_level" | reverse %}

        {% if all_featured_brands.size > 0 %}
          {% for brand in all_featured_brands limit:6 %}
            {% if brand.featured_level >= 2 %}
              {% include components/cards/hero-brand-card.html brand=brand %}
            {% else %}
              {% include components/cards/featured-brand-card.html brand=brand %}
            {% endif %}
          {% endfor %}
        {% else %}
          <p>No featured brands found</p>
        {% endif %}
      </div>
    </div>

    <hr style="margin: 3rem 0;">

    <div style="background-color: #f5f5f5; padding: 1.5rem; border-radius: 0.5rem;">
      <h3>Debug: All brands in the system:</h3>
      {% assign all_brands = site.brands | where: "lang", page.lang %}
      <table style="width: 100%; border-collapse: collapse;">
        <thead>
          <tr>
            <th style="text-align: left; padding: 0.5rem; border-bottom: 2px solid #ccc;">Brand</th>
            <th style="text-align: left; padding: 0.5rem; border-bottom: 2px solid #ccc;">ref</th>
            <th style="text-align: left; padding: 0.5rem; border-bottom: 2px solid #ccc;">featured</th>
            <th style="text-align: left; padding: 0.5rem; border-bottom: 2px solid #ccc;">featured_level</th>
          </tr>
        </thead>
        <tbody>
          {% for brand in all_brands %}
            <tr>
              <td style="padding: 0.5rem; border-bottom: 1px solid #e0e0e0;">{{ brand.title }}</td>
              <td style="padding: 0.5rem; border-bottom: 1px solid #e0e0e0;">{{ brand.ref }}</td>
              <td style="padding: 0.5rem; border-bottom: 1px solid #e0e0e0;">{{ brand.featured }}</td>
              <td style="padding: 0.5rem; border-bottom: 1px solid #e0e0e0;">{{ brand.featured_level }}</td>
            </tr>
          {% endfor %}
        </tbody>
      </table>
    </div>
  </div>
</div>
