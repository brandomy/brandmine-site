---
lang: en
ref: market-[SLUG]
layout: dimension-profile
title: "[MARKET_NAME]"
dimension: [SLUG]
category: market
country_code: [COUNTRY_CODE]  # Two-letter country code
permalink: /en/discover/markets/[SLUG]/

# Optional fields
description: "Brief description of this market for hero panel"
population: "[POPULATION]"
gdp: "[GDP]"
currency: "[CURRENCY]"

# === LAYOUT CONTROL ===
# Page sections automatically loaded from _data/page_sections.yml
# Layout: dimension-profile determines which sections appear and in what order
# No manual section configuration required

## Architecture Notes

This template uses Brandmine's centralized section control system:

- **Layout**: dimension-profile automatically loads appropriate sections
- **Configuration**: Section order and behavior defined in _data/page_sections.yml
- **Consistency**: All dimension pages use identical section structure

No manual section configuration is needed in the front matter.
---

# [MARKET_NAME] Market Overview

[Describe the market landscape, consumer characteristics, and business environment]

## Key Market Characteristics

[MARKET_NAME] offers [unique characteristics and opportunities]. With [population/economic stats], this market represents [significance in BRICS+ context].

### Market Highlights:
- Population: [POPULATION]
- GDP: [GDP]
- Key consumer sectors: [LIST_SECTORS]
- Notable market trends: [LIST_TRENDS]

## Consumer Brand Landscape

[Describe the typical brand characteristics, heritage, innovation aspects, cultural context]

## Export Opportunities

[Describe international potential, challenges, and opportunities for brands from this market]

### Promising Categories:
- **[CATEGORY_1]**: [Description and potential]
- **[CATEGORY_2]**: [Description and potential]
- **[CATEGORY_3]**: [Description and potential]

## Featured Content

Articles, interviews, and profiles tagged "[MARKET_NAME]" provide insights into [market specifics]. This content helps both [market] brands seeking export opportunities and international partners looking to discover promising [market] consumer products.

Browse our [MARKET_NAME]-focused content to discover distinctive brands with compelling stories and significant market potential.

---

<!-- Template Usage Instructions:
1. Replace [PLACEHOLDERS] with actual values
2. Update country_code with proper two-letter code
3. Customize sections array to show/hide content blocks
4. Add market-specific images to /assets/images/markets/[slug]/
5. Ensure corresponding market-sectors YAML exists in _data/market-sectors/en/[slug].yml
-->