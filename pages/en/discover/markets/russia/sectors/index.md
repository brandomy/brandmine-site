---
layout: default
title: Russian Sectors
subtitle: Explore Consumer Brand Sectors in Russia
permalink: /en/discover/markets/russia/sectors/
lang: en
ref: russia-sectors
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- Sectors Grid Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <div class="market-sectors__description">
      <p>Explore consumer brand sectors with particular significance in the Russian market. These sectors represent areas where Russian brands offer distinctive characteristics, unique innovations, or significant global potential.</p>
    </div>
    
    <div class="market-sectors__grid">
      {% assign market_sectors = site.data.market_sectors[page.lang]['russia'] %}
      {% for sector_entry in market_sectors %}
        {% assign sector_slug = sector_entry[0] %}
        {% assign sector_data = sector_entry[1] %}
        {% assign sector_name = site.data.translations[page.lang].sectors[sector_slug] | default: sector_data.title %}
        
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/russia/sectors/{{ sector_slug }}/" class="market-sectors__item">
          <div class="market-sectors__item-content">
            <h3 class="market-sectors__item-title">{{ sector_data.title }}</h3>
            <p class="market-sectors__item-description">{{ sector_data.description }}</p>
            {% if sector_data.key_stats %}
              <div class="market-sectors__item-stats">
                {% for stat in sector_data.key_stats limit:1 %}
                  <div class="market-sectors__item-stat">
                    <span class="market-sectors__item-stat-label">{{ stat.label }}:</span>
                    <span class="market-sectors__item-stat-value">{{ stat.value }}</span>
                  </div>
                {% endfor %}
              </div>
            {% endif %}
            <span class="market-sectors__item-link">Learn More</span>
          </div>
        </a>
      {% endfor %}
    </div>
  </div>
</div>

<!-- Navigation Links -->
<div class="panel panel--olive-soft">
  <div class="panel__content">
    <div class="market-sectors__navigation">
      <div class="market-sectors__navigation-links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/russia/" class="market-sectors__navigation-link">
          <span class="market-sectors__navigation-icon">
            {% include components/icons/icon.html type="market" name="market-default" size="sm" %}
          </span>
          Back to Russian Market
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="market-sectors__navigation-link">
          <span class="market-sectors__navigation-icon">
            {% include components/icons/icon.html type="sector" name="sector-default" size="sm" %}
          </span>
          Explore All Sectors
        </a>
      </div>
    </div>
  </div>
</div>