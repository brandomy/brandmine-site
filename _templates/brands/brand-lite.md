---
# BRAND LITE TEMPLATE
# Basic profile with essential fields and sections
# See _templates/brands/ for core and full versions

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
  instagram: ""
  facebook: ""
  linkedin: ""
  youtube: ""
  telegram: ""
  vk: ""
  weibo: ""
  wechat: ""

# International presence
international:
  markets: [country1, country2]  # Country codes, do not translate
  export_ready: true
  distribution_models: [direct-export, distributors]  # Do not translate codes

# Image assets
logo: "/assets/images/brands/xx/brand-slug/originals/logo-color.png"
hero_image: "/assets/images/brands/xx/brand-slug/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/xx/brand-slug/originals/founder-portrait.jpg"

# Related content
related_brands: [related-brand-1, related-brand-2]  # Brand slugs, do not translate

# Content status/display
featured: false
featured_level: 1  # 0=basic, 1=map marker, 2=full profile
location_intelligence: false

# ============================================================================
# TRANSLATABLE SECTION - TRANSLATE THESE FIELDS FOR EACH LANGUAGE
# Only these fields should be translated when creating RU/ZH versions
# ============================================================================
brand_name: "BRAND NAME"
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

# Certifications and awards (translate names only)
certifications:
  - name: "Certification Name"  # Translate name
    year: YYYY  # Do not translate year
awards:
  - name: "Award Name"  # Translate name
    year: YYYY  # Do not translate year
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
./_scripts/process_brand_images.sh xx brand-slug
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