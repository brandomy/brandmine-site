---
# BRAND PROFILE TEMPLATE (LOGIC-LIGHT)
layout: brand-profile
ref: xx-brandslug
title: "Brand Name"
description: "Brief brand description (1-2 sentences)."
lang: en
permalink: /en/brands/xx-brandslug/

# Section Control - with Location Intelligence after Market Presence
sections:
  - identity
  - founder-narrative
  - brand-story
  - product
  - market-presence
  - location-intelligence
  - growth-signals
  - connections

# Basic Information
founding_year: YYYY
website: "https://example.com"
email: "contact@example.com"
founders: []  # Array of founder keys that match founder_names.json entries
founder_led: true  # Boolean: Is the founder still actively leading?

# Taxonomy (all using kebab-case)
sectors: []  # Required: At least one sector from taxonomy
markets: []  # Required: At least one market from taxonomy
attributes: []  # Optional: Brand attributes from taxonomy
signals: []  # Optional: Business signals from taxonomy

# Display Settings
featured: false
featured_level: 0  # 0=basic listing, 1=map marker, 2=full profile

# Location (flat structure for easier data handling)
location_lat: 0.0  # Latitude coordinate
location_lng: 0.0  # Longitude coordinate
location_city: ""  # City name (translatable)
location_region: ""  # Region/state/province (translatable, optional)
location_country: "xx"  # ISO country code

# Image Paths
logo: "/assets/images/brands/xx-brandslug/logo-color.png"
hero_image: "/assets/images/brands/xx-brandslug/hero-main.jpg"
founder_portrait: "/assets/images/brands/xx-brandslug/founder-portrait.jpg"

# Social Media (optional)
social_media:
  facebook: ""
  instagram: ""
  linkedin: ""
  telegram: ""
  tiktok: ""
  twitter: ""
  vk: ""
  weibo: ""
  wechat: ""
  youtube: ""

# Growth & Export Information (optional)
export_ready: false
export_markets: []  # Country codes
distribution_models: []  # Distribution model codes

# Timeline (optional)
timeline:
  - year: YYYY
    event: "Company founded"
  - year: YYYY
    event: "Key milestone 1"

# Certifications (optional)
certifications:
  - name: "Certification Name"
    year: YYYY

# Product Gallery (optional)
gallery:
  - image: "/assets/images/brands/xx-brandslug/gallery-image1.jpg"
    caption: "Caption for first gallery image"
  - image: "/assets/images/brands/xx-brandslug/gallery-image2.jpg"
    caption: "Caption for second gallery image"
---

## About {{ page.title }}

Brief introduction to the brand, including core offerings and distinctive characteristics. Focus on what makes this brand unique within its sector and market context.

## Founder's Journey

Brief overview of the founder's background and motivation for creating the brand. If founder is unknown or not relevant, this section can focus on the brand's origin story instead.

## Product Range

Overview of the brand's key products or services, highlighting distinctive features, quality standards, and unique offerings.

## Market Presence

Description of the brand's current market position, distribution channels, and geographic footprint. Include any notable expansion or recent developments.
