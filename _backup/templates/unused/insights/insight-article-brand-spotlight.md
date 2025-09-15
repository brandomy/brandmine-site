---
# LOGIC-LIGHT INSIGHT TEMPLATE - BRAND SPOTLIGHT
layout: insight-article
ref: xx-insight-slug  # Global ID (market-slug format) For language switcher
title: "[Market Code] Spotlight: [Brand Name] - [Main Focus]"
lang: en
permalink: /en/insights/xx-insight-slug/

# Sections are now controlled centrally via _data/page_sections.yml (insight-article)
# No need to specify sections in front matter - they are standardized

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
    name: "description"  # e.g., "moscow-spice-market", "vineyard-landscape"
    alt: "Descriptive alt text for accessibility"
    ext: "jpg"
  founder_portrait:  # Optional
    name: "founder-portrait"
    alt: "Founder name portrait description"
    ext: "jpg"
  logo:  # Optional
    name: "logo-description"
    alt: "Brand logo description"
    ext: "png"
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
