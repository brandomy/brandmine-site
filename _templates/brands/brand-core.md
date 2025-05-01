---
# BRAND CORE TEMPLATE
# Absolute minimum fields required for a valid brand page
# See _templates/brands/ for lite and full versions

# Core identification (all required)
layout: brand
title: "BRAND NAME"
slug: brand-slug
ref: brand-slug  # Same as slug - for language switcher
country_code: "xx"  # ISO country code (ru, br, cn, in, za)
lang: en
permalink: /en/brands/{{ page.country_code }}/{{ page.slug }}/

# Core categorization (all required)
sectors: [Primary Sector]  # Must be from existing taxonomy
markets: [Primary Market]  # Must be from existing taxonomy
description: "Brief description (1-2 sentences)."

# Basic essentials (all required)
founding_year: YYYY
website: "https://example.com"

# Founder information (required)
founder:
  name: "Founder Name"
  founder_led: true  # Is the founder still actively leading?

# Location (required for map)
location:
  country: "Country Name" 
  city: "City Name"
  coordinates: [longitude, latitude]  # For map display

# Basic image assets (required)
logo: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/logo-color.png"
hero_image: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/portrait-founder.jpg"

# Content status (required)
featured: false
featured_level: 0  # 0=basic, 1=map marker, 2=full profile
location_intelligence: false
---
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
./_scripts/process_brand_images.sh {{ page.country_code }} {{ page.slug }}
-->

## About BRAND NAME

Brief description of the brand, its history and core offerings. 2-3 sentences is sufficient for the core template.

## Founder's Journey

Brief founder information here. 2-3 sentences about the founder's background and why they started the company.

## Market Presence

The brand operates locally in its home region through independent retailers.