---
# BRAND FULL TEMPLATE
# Complete profile with all possible fields and sections
# See _templates/brands/ for core and lite versions

# Core identification
layout: brand
title: "BRAND NAME"
slug: brand-slug
ref: brand-slug  # Same as slug - for language switcher
country_code: "xx"  # ISO country code for permalink
lang: en
permalink: /en/brands/{{ page.country_code }}/{{ page.slug }}/

# Core categorization and tags
markets: [Country] # brazil, china, india, russia, south-africa
sectors: [Sector] # artisan-confectionery, artisanal-spirits, fashion-accessories, fermented-dairy, gourmet-foods, halal-foods, honey-bee-products, hotels-resorts, jewelry-watches, mineral-waters, natural-beauty, natural-supplements, porcelain-ceramics, salami-cured-meats, specialty-cheeses, wine
subsectors: [Specific Niche] # freeform text
attributes: [Attribute] # artisanal-excellence, cultural-ambassador, founder-led, heritage-brand, innovation-leader, premium-positioning, regional-icon, sustainability-pioneer
signals: [Signal] # export-ready, franchise-ready, investment-ready, rapid-growth

# Brand basics
description: "Short compelling description of the brand (1-2 sentences)."
slogan: "Brand slogan or tagline"
founding_year: YYYY
website: "https://example.com"
contact_email: "contact@example.com"

# Founder information
founder:
  name: "Founder Name"
  story: "Two-sentence founder summary"
  generation: "first" # first, second, or transition
  transition_status: "active" # succession, seeking-partners, expansion
  founder_led: true # Is the founder still actively leading the company?
  deceased: false # Is the founder deceased?

# Location details
location:
  country: [country]
  region: "Region/Province/State"
  city: "City"
  coordinates: [longitude, latitude]

# Timeline milestones
timeline:
  - year: YYYY
    event: "Company founded"
  - year: YYYY
    event: "Key milestone 1"
  - year: YYYY
    event: "Key milestone 2"
  - year: YYYY
    event: "Key milestone 3"
  - year: YYYY
    event: "Key milestone 4"

# Social media presence
social_media:
  instagram: ""
  facebook: ""
  linkedin: ""
  youtube: ""
  telegram: ""
  vk: ""
  weibo: ""
  wechat: ""

# Certifications and awards
certifications:
  - name: "Certification Name"
    year: YYYY
  - name: "Certification Name"
    year: YYYY
awards:
  - name: "Award Name"
    year: YYYY
  - name: "Recognition"
    year: YYYY

# International presence
international:
  markets: [country1, country2]
  export_ready: true
  distribution_models: [direct-export, distributors] # options: direct-export, distributors, e-commerce, franchise, joint-venture

# Partnership opportunities (premium feature)
partnerships:
  seeking: [distributor, investor, technology]
  requirements: "Brief description of partner requirements"

# Image assets
logo: "/assets/images/brands/brand-slug/originals/logo-color.png"
hero_image: "/assets/images/brands/brand-slug/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/brand-slug/originals/founder-portrait.jpg"
gallery:
  - image: "/assets/images/brands/brand-slug/originals/gallery-image1.jpg"
    caption: "Caption for first gallery image"
  - image: "/assets/images/brands/brand-slug/originals/gallery-image2.jpg"
    caption: "Caption for second gallery image"
  - image: "/assets/images/brands/brand-slug/originals/gallery-image3.jpg"
    caption: "Caption for third gallery image"

# Related content
related_brands: [related-brand-1, related-brand-2]

# Content status/display
featured: false
featured_level: 2  # 0=basic, 1=featured on map, 2=full profile
location_intelligence: true
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
./_scripts/process_brand_images.sh brand-slug
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

## Gallery

[A visual showcase of brand imagery would appear here, displaying product photography, facilities, and founder portraits with captions]
