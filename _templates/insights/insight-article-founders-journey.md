---
# LOGIC-LIGHT INSIGHT TEMPLATE - FOUNDERS JOURNEY
layout: insight-article
ref: xx-insight-slug  # Global ID (market-slug format) For language switcher
title: "[Founder Name]: [Brand Name]'s Journey from [Origin] to [Destination]"
lang: en
permalink: /en/insights/xx-insight-slug/

# Sections are now controlled centrally via _data/page_sections.yml (insight-article)
# No need to specify sections in front matter - they are standardized

# Basic Information
date: YYYY-MM-DD  # Publication date
author: "author_slug"  # Key for translation lookup
excerpt: "Brief excerpt highlighting the founder's unique background and journey (1-2 sentences)"
category: "founders-journey"  # Must match insights/en.yml
reading_time: 8

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
    name: "description"  # e.g., "founder-workshop", "tea-ceremony"
    alt: "Descriptive alt text for accessibility"
    ext: "jpg"
  founder_portrait:  # Required for founder journey
    name: "founder-portrait"
    alt: "Founder name portrait description"
    ext: "jpg"
  infographic:  # Optional for timeline/growth charts
    name: "growth-timeline"
    alt: "Company growth timeline description"
    ext: "jpg"
---

## Origin Story

[Write 2-3 paragraphs in ENGLISH about the founder's background and how the brand began. Include a quote from the founder about their journey.]

## Key Turning Point

[Describe a pivotal moment in the brand's development in ENGLISH (1-2 paragraphs). Include specific details and a quote if available.]

## Early Challenges

[Write about initial obstacles and how they were overcome in ENGLISH (2-3 paragraphs). Include both practical and personal challenges.]

## Growth and Evolution

[Describe how the brand grew while maintaining its values in ENGLISH (1-2 paragraphs). Include key milestones and innovative approaches.]

## Current Status and Vision

[Write about where the brand stands today and future aspirations in ENGLISH (2-3 paragraphs). End with an inspiring forward-looking statement.]
