---
# LOGIC-LIGHT INSIGHT TEMPLATE - BRAND SPOTLIGHT
layout: insight-article
ref: xx-insight-slug  # Global ID (market-slug format) For language switcher
title: "[Market Code] Spotlight: [Brand Name] - [Main Focus]"
lang: en
permalink: /en/insights/xx-insight-slug/

# Section Configuration - determines which sections appear in the article - Using linear layout (no sidebar)
sections:
  - breadcrumbs
  - hero
  - header
  - featured-image
  - content
  - taxonomy
  - brand-info
  - related-brands
  - related-insights
  - taxonomy-cloud

# Optional: Override sections per article
# sections: [breadcrumbs, hero, content, taxonomy, related-insights]  # Custom order example

# Basic Information
date: YYYY-MM-DD  # Publication date
author: "author_slug"  # Key for translation lookup
excerpt: "Brief excerpt highlighting the brand's unique positioning and key achievements (1-2 sentences)"
category: "brand-spotlight"  # Must match insights/en.yml
reading_time: 7

# Brand Information
brands: [xx-brand-slug]  # Featured brand(s) with market prefix
founding_year: YYYY
website: "https://example.com"
founders: []  # Array of founder keys that match founder_names.json entries
founder_led: true  # Boolean: Is the founder still actively leading?

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

# Image Paths (follow the global ID pattern)
hero_image: "/assets/images/insights/xx-insight-slug/hero-description.jpg"
founder_portrait: "/assets/images/insights/xx-insight-slug/founder-portrait.jpg"  # Optional
logo: "/assets/images/insights/xx-insight-slug/logo-description.png"  # Optional
---

## Brand Introduction

[Write 1-2 paragraphs in ENGLISH introducing the brand. Include when it was founded, where it's based, and what makes it distinctive in the international marketplace.]

## Distinctive Offering

[Describe the brand's products or services in ENGLISH (2-3 paragraphs). Focus on what makes them unique and include a quote from a brand representative if available.]

## Brand Aesthetics and Identity

[Write about the brand's visual identity and cultural influences in ENGLISH (1-2 paragraphs). Include how design choices reflect the brand's values.]

## Market Position and Consumer Response

[Describe the brand's market position and customer base in ENGLISH (2-3 paragraphs). Include success metrics and a quote from a customer or analyst if available.]

## Future Trajectory

[Write about the brand's future plans and potential in ENGLISH (2-3 paragraphs). Include recent developments and end with why international partners should notice this brand.]
