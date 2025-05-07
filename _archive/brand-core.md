---
# BRAND CORE TEMPLATE
layout: brand
title: "BRAND NAME" #trx
description: "Brief description (1-2 sentences)." #trx
country_code: "xx"  # ISO country code (ru, br, cn, in, za)
lang: en
ref: brand-slug  # Used for language switcher and as the slug
permalink: /en/brands/xx/brand-slug/

founding_year: YYYY
website: "https://example.com"
founders: ["name_surname"] # from translations dictionary???
founder_led: true  # Is the founder still actively leading?
sectors: [primary-sector]  # Must be from existing taxonomy - use kebab-case
markets: [market-code]  # Must be from existing taxonomy - use kebab-case
featured: false
featured_level: 0  # 0=basic, 1=map marker, 2=full profile
location_intelligence: false

location: 
  coordinates: [longitude, latitude]  # For map display
  address: "" #trx
  city: "" #trx

logo: "/assets/images/brands/xx/brand-slug/originals/logo-color.png"
hero_image: "/assets/images/brands/xx/brand-slug/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/xx/brand-slug/originals/founder-portrait.jpg"
---

## About BRAND NAME

Brief description of the brand, its history and core offerings. 2-3 sentences is sufficient for the core template.

## Founder's Journey

Brief founder information here. 2-3 sentences about the founder's background and why they started the company.

## Market Presence

The brand operates locally in its home region through independent retailers.


<!--
BRAND CORE TEMPLATE
Absolute minimum required fields for a valid brand page.

Use this template when:
- You need to quickly add a brand with minimal information
- Only basic details are available
- You plan to enhance the profile later

For more comprehensive templates, see:
- _templates/brands/brand-lite.md (Basic profile with essential sections)
- _templates/brands/brand-full.md (Complete profile with all possible fields)

Note: Even with this minimal template, remember to process images with:
./_scripts/process_brand_images.sh xx brand-slug
-->