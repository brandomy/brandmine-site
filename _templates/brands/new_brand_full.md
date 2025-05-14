---
# NEW BRAND FULL TEMPLATE
layout: brand
ref: xx-brandslug  # Global ID (country-brandslug format)
title: "Brand Name"  # Display name, fallback if JSON lookup fails
description: "Brief brand description (1-2 sentences)."
slogan: "Brand slogan or tagline"
lang: en
permalink: /en/brands/xx-brandslug/  # Simplified permalink without country code
founding_year: YYYY
website: "https://example.com"
founders: []  # Array of founder keys that match founder_names.json entries
founder_led: true  # Boolean: Is the founder still actively leading?
sectors: []  # Required: At least one sector from taxonomy
markets: []  # Required: At least one market from taxonomy
attributes: []  # Optional: Brand attributes from taxonomy
signals: []  # Optional: Business signals from taxonomy
featured: false
featured_level: 0  # 0=basic listing, 1=standard featured, 2=premium featured
location_lat: 0.0  # Latitude coordinate
location_lng: 0.0  # Longitude coordinate
location_city: ""  # City name (translatable)
location_region: ""  # Region/state/province (translatable, optional)
location_country: "ru"  # ISO country code
logo: "/assets/images/brands/xx-brandslug/logo-color.png"
hero_image: "/assets/images/brands/xx-brandslug/hero-main.jpg"
founder_portrait: "/assets/images/brands/xx-brand-slug/founder-portrait.jpg"
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
export_ready: true
export_markets: [country1, country2]  # Country codes, do not translate
distribution_models: [direct-export, distributors]  # Do not translate codes
timeline:  # (translate event descriptions only)
  - year: YYYY  # Do not translate year
    event: "Company founded"  # Translate event description
  - year: YYYY  # Do not translate year
    event: "Key milestone 1"  # Translate event description
  - year: YYYY  # Do not translate year
    event: "Key milestone 2"  # Translate event description
certifications:         # (translate names only)
  - name: "Certification Name"  # Translate name
    year: YYYY  # Do not translate year
awards:
  - name: "Award Name"  # Translate name
    year: YYYY  # Do not translate year
gallery:  # (translate captions only)
  - image: "/assets/images/brands/xx-brand-slug/originals/gallery-image1.jpg"  # Do not translate path
    caption: "Caption for first gallery image"  # Translate caption
  - image: "/assets/images/brands/xx-brand-slug/originals/gallery-image2.jpg"  # Do not translate path
    caption: "Caption for second gallery image"  # Translate caption
  - image: "/assets/images/brands/xx-brand-slug/originals/gallery-image3.jpg"  # Do not translate path
    caption: "Caption for third gallery image"  # Translate caption
---

## About {{ page.title }}

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
