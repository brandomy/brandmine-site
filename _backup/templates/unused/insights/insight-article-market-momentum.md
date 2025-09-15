---
# LOGIC-LIGHT INSIGHT TEMPLATE - MARKET MOMENTUM
layout: insight-article
ref: xx-insight-slug  # Global ID (market-slug format) For language switcher
title: "[Market Code] Market Momentum: [Sector] Sector Shows [X]% Growth"
lang: en
permalink: /en/insights/xx-insight-slug/

# Sections are now controlled centrally via _data/page_sections.yml (insight-article)
# No need to specify sections in front matter - they are standardized

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

# Location (flattened structure for easier data handling)
longitude: 0.0  # Longitude coordinate
latitude: 0.0  # Latitude coordinate
city: ""  # City name (translatable)
region: ""  # Region/state/province (translatable, optional)
country: "xx"  # ISO country code

# Market data for visualization
market_data:
  - label: "Annual Growth Rate"
    value: "X%"
  - label: "Market Size"
    value: "$X billion"
  - label: "Key Driver"
    value: "Consumer demand for [attribute]"

# === IMAGES (Semantic Structure for Collection-Image System) ===
# Semantic image structure for collection-image.html include
images:
  hero:
    name: "market-scene"  # e.g., "market-chart", "city-skyline"
    alt: "Descriptive alt text for accessibility"
    ext: "jpg"
  infographic:  # Optional for charts/maps
    name: "market-chart"
    alt: "Market data visualization description"
    ext: "jpg"
  logo:  # Optional
    name: "brand-name"
    alt: "Brand logo"
    ext: "png"
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
