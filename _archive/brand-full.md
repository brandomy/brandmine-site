---
# BRAND FULL TEMPLATE
# Complete profile with all possible fields and sections
# See _templates/brands/ for core and lite versions

# ============================================================================
# METADATA SECTION - DO NOT TRANSLATE THESE FIELDS
# Keep these fields exactly as shown, in English, for all language versions
# ============================================================================

# Core layout and identification
layout: brand
ref: brand-slug  # Used for language switcher and as the slug
country_code: "xx"  # ISO country code (ru, br, cn, in, za)

# Language and routing
lang: en
permalink: /en/brands/xx/brand-slug/

# Core taxonomy
sectors: [primary-sector]  # Must be from existing taxonomy - use kebab-case
subsectors: [specific-niche]  # Optional subcategories - use kebab-case
markets: [market-code]  # Must be from existing taxonomy - use kebab-case
attributes: [attribute1, attribute2]  # From existing attributes taxonomy - use kebab-case
signals: [signal1, signal2]  # From existing signals taxonomy - use kebab-case

# Brand basics (non-translatable)
founding_year: YYYY
website: "https://example.com"
contact_email: "contact@example.com"

# Founder technical information
founder:
  generation: "first"  # first, second, or transition
  transition_status: "active"  # active, succession, seeking-partners, expansion
  founder_led: true  # Is the founder still actively leading?
  deceased: false  # Is the founder deceased?

# Location (non-translatable parts)
location:
  country_code: "xx"  # Two-letter country code
  coordinates: [longitude, latitude]  # For map display

# Social media presence (do not translate URLs)
social_media:
  facebook: ""
  instagram: ""
  linkedin: ""
  pinterest: ""
  redbook: ""
  telegram: ""
  tiktok: ""
  twitter: ""
  vk: ""
  weibo: ""
  wechat: ""
  youtube: ""

# International presence
international:
  markets: [country1, country2]  # Country codes, do not translate
  export_ready: true
  distribution_models: [direct-export, distributors]  # Do not translate codes

# Image assets (paths do not change across languages)
logo: "/assets/images/brands/xx/brand-slug/originals/logo-color.png"
hero_image: "/assets/images/brands/xx/brand-slug/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/xx/brand-slug/originals/founder-portrait.jpg"

# Related content
related_brands: [related-brand-1, related-brand-2]  # Brand slugs, do not translate

# Content status/display
featured: false
featured_level: 2  # 0=basic, 1=map marker, 2=full profile
location_intelligence: true

# ============================================================================
# TRANSLATABLE SECTION - TRANSLATE THESE FIELDS FOR EACH LANGUAGE
# Only these fields should be translated when creating RU/ZH versions
# ============================================================================
title: "BRAND NAME"
slogan: "Brand slogan or tagline"
description: "Brief compelling description of the brand (1-2 sentences)."

# Founder narrative information
founder:
  name: "Founder Name"  # Translate to appropriate format for target language
  story: "Two-sentence founder summary"  # Translate content

# Location details (translatable parts)
location:
  region: "Region/Province/State"  # Translate region name
  city: "City Name"  # Translate city name

# Timeline milestones (translate event descriptions only)
timeline:
  - year: YYYY  # Do not translate year
    event: "Company founded"  # Translate event description
  - year: YYYY  # Do not translate year
    event: "Key milestone 1"  # Translate event description
  - year: YYYY  # Do not translate year
    event: "Key milestone 2"  # Translate event description
  - year: YYYY  # Do not translate year
    event: "Key milestone 3"  # Translate event description
  - year: YYYY  # Do not translate year
    event: "Key milestone 4"  # Translate event description

# Certifications and awards (translate names only)
certifications:
  - name: "Certification Name"  # Translate name
    year: YYYY  # Do not translate year
  - name: "Certification Name"  # Translate name
    year: YYYY  # Do not translate year
awards:
  - name: "Award Name"  # Translate name
    year: YYYY  # Do not translate year
  - name: "Recognition"  # Translate name
    year: YYYY  # Do not translate year

# Partnership information (translatable parts)
partnerships:
  seeking: [distributor, investor, technology]  # Do not translate codes
  requirements: "Brief description of partner requirements"  # Translate content

# Gallery captions (translate captions only)
gallery:
  - image: "/assets/images/brands/xx/brand-slug/originals/gallery-image1.jpg"  # Do not translate path
    caption: "Caption for first gallery image"  # Translate caption
  - image: "/assets/images/brands/xx/brand-slug/originals/gallery-image2.jpg"  # Do not translate path
    caption: "Caption for second gallery image"  # Translate caption
  - image: "/assets/images/brands/xx/brand-slug/originals/gallery-image3.jpg"  # Do not translate path
    caption: "Caption for third gallery image"  # Translate caption
---

<!--
BRAND FULL TEMPLATE
Complete template with all possible fields for comprehensive brand profiles.

Use this template when:
- You have extensive information about a brand
- The brand is featured prominently on the site
- You need to showcase all aspects of the brand

Related templates:
- _templates/brands/brand-core.md (Minimal fields only)
- _templates/brands/brand-lite.md (Basic profile with essential sections)

Remember to process images after creation with:
./_scripts/process_brand_images.sh xx brand-slug
-->

## About BRAND NAME

Comprehensive history and overview of the brand (3-4 paragraphs). This section should cover the founding story, evolution of the business, core value proposition, and current market position. Include details about the company's philosophy, mission, and what sets it apart from competitors.

This section should also address the brand's relationship to its local context and cultural significance. Explain how the brand reflects or contributes to its regional identity and traditions.

The final paragraph should summarize the brand's current status and future trajectory, highlighting recent achievements and near-term goals.

## Founder's Journey

The personal story of the founder in detail (3-4 paragraphs). This section should explore:

- The founder's background and experiences that led to starting the business
- Key challenges and pivotal moments in the entrepreneurial journey
- Personal philosophy and vision that drives the business
- Current role and relationship to the company (especially important for heritage brands)

For heritage brands with historical founders, include information about how subsequent generations have maintained or evolved the founder's vision, and the current leadership's connection to that legacy.

## Product Range

Detailed overview of product lines or services offered by the brand:

- **Product Line 1**: Comprehensive description including development history, materials or ingredients, production techniques, and distinguishing features. Highlight flagship products or bestsellers within this line.

- **Product Line 2**: Similar detailed description with emphasis on what makes these products special or unique to this brand. Include information about sourcing, craftsmanship, or technology that contributes to quality.

- **Product Line 3**: Detailed description focusing on target audience, usage context, and customer benefits. Include relevant details about pricing tiers or product positioning in the market.

For service-based brands, describe service offerings with similar attention to differentiation, methodology, and customer experience.

## Market Presence

Comprehensive information about the brand's distribution, footprint, and location strategy:

- **Home Market**: Detailed description of domestic presence including number of locations, distribution channels, market share (if available), and regional strengths. Include information about flagship locations and the evolution of the brand's presence over time.

- **Key Regions**: Analysis of the brand's strongest markets, including geographic distribution strategy and regional adaptations. Highlight areas of recent growth or strategic importance.

- **Strategic Position**: Information about how location contributes to brand identity or operations. This may include proximity to raw materials, cultural significance of location, or strategic advantages for distribution and logistics.

- **Nearby Brands**: Mention of related brands in proximity that create cluster effects or regional specialization. This could include complementary businesses, suppliers, or competitors that collectively establish the area's reputation.

## Certifications & Recognition

Detailed information about formal certifications and awards, including:

- Full certification names with explanations of their significance and requirements
- Dates of certification and renewal status
- Description of certification process and how it relates to the brand's practices
- Major awards and recognition with context about their importance in the industry
- Media coverage or notable mentions in prestigious publications
- Industry rankings or ratings that demonstrate the brand's standing

## International Presence

Information about global distribution and international strategy:

- Current export markets with details about when and how they entered each market
- International adaptation strategy, including any product modifications for specific markets
- Distribution models used in different regions and their effectiveness
- Export readiness assessment and future market expansion plans
- International partnerships or collaborations
- Performance in global markets compared to domestic market

## Location Intelligence

Geographic context and spatial analysis information:

- Detailed geographic context of the brand's location and significance
- Regional brand clusters and proximity relationships
- Market saturation analysis for the brand's category within the region
- Travel and tourism patterns relevant to brand discovery
- Transportation infrastructure supporting brand accessibility
- Geographic expansion patterns and opportunities
- Cultural and economic characteristics of the location that impact brand positioning

## Gallery

[A visual showcase of brand imagery would appear here, displaying product photography, facilities, and founder portraits with captions]