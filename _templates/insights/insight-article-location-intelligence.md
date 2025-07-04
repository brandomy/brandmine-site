---
# LOGIC-LIGHT INSIGHT TEMPLATE - LOCATION INTELLIGENCE
layout: insight-article
ref: xx-insight-slug  # Global ID (market-slug format) For language switcher
title: "[City/Region] Emerging as [Sector] Hub: [Market Code] Regional Analysis"
lang: en
permalink: /en/insights/xx-insight-slug/

# Sections are now controlled centrally via _data/page_sections.yml (insight-article)
# No need to specify sections in front matter - they are standardized

# Basic Information
date: YYYY-MM-DD  # Publication date
author: "author_slug"  # Key for translation lookup
excerpt: "Brief excerpt highlighting key geographic insights and regional trends (1-2 sentences)"
category: "location-intelligence"  # Must match insights/en.yml
reading_time: 6

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

# === IMAGES (Semantic Structure for Collection-Image System) ===
# Semantic image structure for collection-image.html include
images:
  hero:
    name: "description"  # e.g., "market-chart", "city-skyline"
    alt: "Descriptive alt text for accessibility"
    ext: "jpg"
  infographic:  # Optional for charts/maps
    name: "map-location"
    alt: "Geographic location map description"
    ext: "jpg"
  chart:  # Optional
    name: "region-chart"
    alt: "Regional data chart description"
    ext: "jpg"
---

## Geographic Context

[Write 2-3 paragraphs in ENGLISH about the geographic area. Include facts about size, population, economic importance, and why this location matters for international businesses.]

## Economic Landscape

[Describe the region's economy in ENGLISH (2-3 paragraphs). Include data about growth, investment trends, infrastructure, and a quote from a local business leader if available.]

## Sector Concentration

[Write about how specific sectors have clustered in this location in ENGLISH (2-3 paragraphs). Include examples of successful brands and the ecosystem that supports them.]

## Market Trends and Opportunities

[Identify emerging trends specific to this location in ENGLISH (2-3 paragraphs). Include consumer behavior data and a quote from a market analyst if available.]

## Regional Brand Spotlight

[Profile 1-2 representative brands from this location in ENGLISH (2-3 paragraphs). Include how they leverage geographic advantages and their growth stories.]

## Strategic Insights

[Write actionable takeaways for businesses in ENGLISH (2-3 paragraphs). Include market entry advice and conclude with why this location is compelling for investment.]
