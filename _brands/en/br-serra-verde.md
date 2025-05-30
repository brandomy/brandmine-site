---
layout: brand-profile
ref: br-serra-verde  # Global ID (country-brandslug format)
title: "Serra Verde Organics"  # Display name, fallback if JSON lookup fails
description: "Family-owned producer of organic preserves, honeys, and specialty coffees from Brazil's Atlantic Forest region."
slogan: "From Forest to Table"  # Optional
lang: en
permalink: /en/brands/br-serra-verde/

# JSON Generation Control
generate_json: true  # Set to true to include in brands.json output
sample_data: true    # Flag for sample/test data

# === SECTION CONTROL (CRITICAL - Drives page layout) ===
sections:
  - identity              # Brand hero, logo, basic info (replaces hero)
  - founder-narrative     # Founder story and journey
  - content              # Markdown content area (NEW - enables rich content)
  - business-intelligence # Business signals and opportunities
  - location-intelligence # Map and geographic context
  - connections          # Related brands and insights

# === CORE INFORMATION ===
# Basic Information
founding_year: 1986
website: "https://serraverde.com.br"
email: "contact@serraverde.com.br"  # Optional contact email
founders: ["br-eduardo-santos"]  # Array of founder keys for JSON lookup
founder_led: true  # Boolean: Is the founder still actively leading?

# Taxonomy (all using kebab-case)
sectors: ["gourmet-foods"]  # Required: At least one sector from taxonomy
markets: ["brazil"]  # Required: At least one market from taxonomy
attributes: ["founder-led", "sustainability-pioneer"]  # Optional attributes
signals: []  # Optional signals

# Display Settings
featured: true
featured_level: 2  # 0=basic listing, 1=standard featured, 2=premium featured

# === LOCATION (Structured for collection-image compatibility) ===
location:
  lat: -22.6569  # Latitude coordinate
  lng: -45.8558  # Longitude coordinate
  city: "Gonçalves"  # City name (translatable)
  region: "Minas Gerais"  # Region/state/province (translatable, optional)
  country: "br"  # ISO country code

# === IMAGES (Semantic structure that works with collection-image) ===
images:
  logo:
    name: "color"     # Becomes logo-color-400w.png
    ext: "png"
  hero:
    name: "farm-view"  # Becomes hero-farm-view-400w.jpg
    ext: "jpg"
  founder:
    name: "portrait"    # Becomes founder-portrait-400w.jpg
    ext: "jpg"

# === SOCIAL MEDIA ===
social_media:
  facebook: ""
  instagram: "serraverde_organics"
  linkedin: ""
  pinterest: ""  # Added for completeness
  telegram: ""
  twitter: ""
  vk: ""
  youtube: ""

# === BUSINESS INFO ===
export_ready: true
export_markets: ["pt", "es"]  # ISO country codes, do not translate
distribution_models: ["direct-export", "distributors"]  # Do not translate codes

# === TIMELINE ===
timeline:
  - year: 1986  # Do not translate year
    event: "Company founded"  # Translate event description
  - year: 2020  # Do not translate year
    event: "Achieved organic certification"  # Translate event description

# === CERTIFICATIONS ===
certifications:
  - name: "Organic Certification"  # Translate name
    year: 2017  # Do not translate year
  - name: "Fair Trade Certified"  # Translate name
    year: 2019  # Do not translate year

# === AWARDS (Optional - for featured brands) ===
awards:
  - name: "Brazilian Sustainable Agriculture Award"  # Translate name
    year: 2022  # Do not translate year
  - name: "Best Organic Producer - Minas Gerais"  # Translate name
    year: 2023  # Do not translate year

# === GALLERY ===
gallery:
  - name: "location-pastoral"
    ext: "jpg"
    caption: "Rolling hills of Serra Verde's organic farmland"
  - name: "production-facility"
    ext: "jpg"
    caption: "Modern production facility"
  - name: "product-range"
    ext: "jpg"
    caption: "Complete product range"
---

## About Serra Verde Organics

Serra Verde Organics is a family-owned producer specializing in organic preserves, honeys, and specialty coffees from Brazil's Atlantic Forest region. Founded in 1986 when Eduardo Santos transformed his family's conventional farm into a pioneering organic operation, the company now works with a network of 28 family farms following rigorous organic protocols.

## Founder's Journey

Eduardo Santos represents the third generation of his family to farm the mountainous terrain of southern Minas Gerais. After studying agronomy in São Paulo, he returned home with new ideas about sustainable agriculture that challenged conventional practices. His transformation of depleted farmland into a thriving organic operation has made Serra Verde a leader in Brazil's sustainable food movement.

## Product Range

Information about the brand's products and services. This content works alongside the structured data in the front matter to create a complete brand profile.

## Market Presence

The brand operates locally in its home region through independent retailers and has begun expanding into specialty food stores in major Brazilian cities. Their organic coffee and fruit preserves have gained particular recognition for exceptional quality, with limited export operations to specialty food retailers in Portugal and Spain. Serra Verde also operates a small farm shop and cafe that has become a popular destination for eco-tourists visiting the Serra da Mantiqueira mountain region.


