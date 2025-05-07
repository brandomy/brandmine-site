---
# NEW BRAND LITE TEMPLATE
layout: brand
ref: xx-brandslug  # Global ID (country-brandslug format)
title: "Brand Name"  # Display name, fallback if JSON lookup fails
description: "Brief brand description (1-2 sentences)." 
lang: en
permalink: /en/brands/xx-brandslug/  # Simplified permalink without country code

# Basic Information
founding_year: YYYY
website: "https://example.com"
founders: []  # Array of founder keys that match founder_names.json entries

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
location_country: "ru"  # ISO country code 

# Image Paths (follow global ID pattern)
logo: "/assets/images/brands/xx-brandslug/logo-color.png"
hero_image: "/assets/images/brands/xx-brandslug/hero-main.jpg"
---

## About {{ page.title }}

Brief introduction to the brand, including core offerings and distinctive characteristics. Focus on what makes this brand unique within its sector and market context.

## Founder's Journey

Brief overview of the founder's background and motivation for creating the brand. If founder is unknown or not relevant, this section can focus on the brand's origin story instead.

## Market Presence

Description of the brand's current market position, distribution channels, and geographic footprint. Include any notable expansion or recent developments.