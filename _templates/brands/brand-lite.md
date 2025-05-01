---
# BRAND LITE TEMPLATE
# Basic profile with essential fields and sections
# See _templates/brands/ for core and full versions

# Core identification (all required)
layout: brand
title: "BRAND NAME"
slug: brand-slug
ref: brand-slug  # Same as slug - for language switcher
country_code: "xx"  # ISO country code (ru, br, cn, in, za)
lang: en
permalink: /en/brands/{{ page.country_code }}/{{ page.slug }}/

# Core categorization
sectors: [Primary Sector]  # Must be from existing taxonomy
subsectors: [Specific Niche]  # Optional subcategories
markets: [Primary Market]  # Must be from existing taxonomy
attributes: [Attribute1, Attribute2]  # From existing attributes taxonomy
signals: [Signal1, Signal2]  # From existing signals taxonomy

# Brand basics
description: "Brief compelling description of the brand (1-2 sentences)."
slogan: "Brand slogan or tagline"
founding_year: YYYY
website: "https://example.com"
contact_email: "contact@example.com"

# Founder information
founder:
  name: "Founder Name"
  story: "Two-sentence founder summary"
  generation: "first"  # first, second, or transition
  transition_status: "active"  # active, succession, seeking-partners, expansion
  founder_led: true  # Is the founder still actively leading?
  deceased: false  # Is the founder deceased?

# Location details
location:
  country: "Country Name"
  region: "Region/Province/State"
  city: "City Name"
  coordinates: [longitude, latitude]  # For map display

# Timeline milestones
timeline:
  - year: YYYY
    event: "Company founded"
  - year: YYYY
    event: "Key milestone 1"
  - year: YYYY
    event: "Key milestone 2"

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
awards:
  - name: "Award Name"
    year: YYYY

# International presence
international:
  markets: [Country1, Country2]
  export_ready: true
  distribution_models: [direct-export, distributors]  # options: direct-export, distributors, e-commerce, franchise, joint-venture

# Image assets
logo: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/logo-color.png"
hero_image: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/portrait-founder.jpg"

# Related content
related_brands: [related-brand-1, related-brand-2]

# Content status/display
featured: false
featured_level: 1  # 0=basic, 1=map marker, 2=full profile
location_intelligence: false
---
<!--
BRAND LITE TEMPLATE
Basic profile with essential fields and content sections.

Use this template when:
- You have moderate information about a brand
- You need more than minimal fields but not a complete profile
- The brand isn't featured but deserves more than basic listing

Related templates:
- _templates/brands/brand-core.md (Minimal fields only)
- _templates/brands/brand-full.md (Complete profile with all possible fields)

Remember to process images after creation with:
./_scripts/process_brand_images.sh {{ page.country_code }} {{ page.slug }}
-->

## About BRAND NAME

Brief history of the brand, founding story, and core value proposition (2-3 paragraphs).

## Founder's Journey

The personal story of the founder, their vision, challenges overcome, and development of the brand. This section should be 2-3 paragraphs detailing the founder's background, motivation for starting the business, and their continuing role.

## Product Range

Overview of main product lines or services:

- **Product Line 1**: Description with key features
- **Product Line 2**: Description with key features
- **Product Line 3**: Description with key features

## Market Presence

Information about regional distribution, brand footprint, and location strategy:

- **Home Market**: Description of domestic presence and distribution
- **Key Regions**: Notable areas of strength or expansion
- **Flagship Locations**: Mention of flagship stores or important facilities