---
# LOGIC-LIGHT INSIGHT TEMPLATE - MARKET MOMENTUM
layout: insight-article
ref: xx-insight-slug  # Global ID (market-slug format) For language switcher
title: "[Market Code] Market Momentum: [Sector] Sector Shows [X]% Growth"
lang: en
permalink: /en/insights/xx-insight-slug/

# Section Configuration - determines which sections appear in the article
sections:
  - header
  - featured-image
  - content
  - market-chart
  - taxonomy

# Sidebar Configuration - determines which sections appear in the sidebar
sidebar_sections:
  - market-info
  - related-insights
  - related-brands
  - taxonomy-cloud

# Basic Information
date: YYYY-MM-DD  # Publication date
author: "author_slug"  # Key for translation lookup
excerpt: "Brief excerpt highlighting key market trends and growth drivers (1-2 sentences)"
category: "market-momentum"  # Must match insights/en.yml
reading_time: 7

# Brand Information
brands: [xx-brand-slug]  # Featured brand(s) with market prefix
founding_year: YYYY
website: "https://example.com"
founders: []  # Array of founder keys that match founder_names.json entries
founder_led: false  # Boolean: Is the founder still actively leading?

# Taxonomy - All exact slugs from dimensions.json (DO NOT TRANSLATE)
sectors: [sector-slug]  # Required: Use exact slugs from dimensions file
markets: [market-slug]  # Required: Use exact slugs from dimensions file
attributes: [attribute-slug]  # Optional: Use exact slugs from dimensions file
signals: [signal-slug]  # Optional: Use exact slugs from dimensions file

# Display Settings
featured: false
premium: false

# Location (flat structure for easier data handling)
location_lng: 0.0  # Longitude coordinate
location_lat: 0.0  # Latitude coordinate
location_city: ""  # City name (translatable)
location_region: ""  # Region/state/province (translatable, optional)
location_country: "xx"  # ISO country code

# Market data for visualization
market_data:
  - label: "Annual Growth Rate"
    value: "X%"
  - label: "Market Size"
    value: "$X billion"
  - label: "Key Driver"
    value: "Consumer demand for [attribute]"

# Image Paths (follow the global ID pattern)
hero_image: "/assets/images/insights/xx-insight-slug/hero-market-scene.jpg"
chart_image: "/assets/images/insights/xx-insight-slug/market-chart.jpg"  # Optional
logo: "/assets/images/insights/xx-insight-slug/logo-brand-name.png"  # Optional
---

## Market Overview

[Write 2-3 paragraphs in ENGLISH about the current market state. Include key statistics, growth rates, and why this momentum matters internationally.]

## Growth Drivers

[Describe the main factors driving growth in ENGLISH (2-3 paragraphs). Include economic, social, and technological factors with supporting data.]

## Brand Success Stories

[Profile 2-3 brands that exemplify market momentum in ENGLISH (2-3 paragraphs). Include specific metrics and a quote from a brand leader if available.]

## Market Evolution

[Write about how the sector has transformed in ENGLISH (1-2 paragraphs). Include changes in consumer preferences and business models.]

## Opportunity Assessment

[Analyze current opportunities for businesses in ENGLISH (2-3 paragraphs). Include market gaps and recommendations for market entry.]

## Future Outlook

[Write about market trajectory over the next 3-5 years in ENGLISH (1-2 paragraphs). End with specific steps international businesses should take.]
