---
# BRAND PROFILE TEMPLATE - Hybrid Approach
# Human-friendly YAML that auto-generates JSON for Airtable compatibility

layout: brand-profile
ref: xx-brandslug  # Global brand ID (used for JSON generation)
title: "Brand Name"  # Primary display name
description: "Brief brand description (1-2 sentences)."
slogan: "Brand tagline or motto"  # Optional
lang: en
permalink: /en/brands/xx-brandslug/

# JSON Generation Control
generate_json: true  # Set to true to include in brands.json output
sample_data: true    # Flag for sample/test data

# === SECTION CONTROL (CRITICAL - Drives page layout) ===
# Controls which sections appear and in what order
# Each section corresponds to _includes/pages/brand/{section}.html
sections:
  - breadcrumbs           # Navigation breadcrumbs
  - hero                  # Brand hero panel
  - identity              # Brand hero, logo, basic info
  - founder-narrative     # Founder story and journey
  - brand-story          # About the brand
  - product              # Product range and offerings
  - market-presence      # Market position and distribution
  - location-intelligence # Map and geographic context
  - growth-signals       # Business signals and opportunities
  - connections          # Related brands and insights

# Optional: Override sections per brand
# sections: [identity, product, founder-narrative]  # Custom order example

# === CORE INFORMATION (Human-friendly entry) ===

# Basic Brand Information
founding_year: YYYY
website: "https://example.com"
email: "contact@example.com"

# Founder Information (easy to edit)
founders:
  - id: "xx-founder-slug"  # Links to founder profile
    name: "Founder Name"   # Human-readable (auto-syncs to founders.json)
    role: "CEO & Founder"  # Optional role
founder_led: true          # Boolean flag

# Taxonomy (Human-readable, maps to taxonomy system)
sectors:
  - "gourmet-foods"       # Must match taxonomy slugs
markets:
  - "brazil"              # Must match taxonomy slugs
attributes:
  - "founder-led"         # Must match taxonomy slugs
  - "sustainability-pioneer"
signals:
  - "export-ready"        # Must match taxonomy slugs

# Display & Feature Settings
featured: true
featured_level: 2  # 0=basic, 1=standard, 2=premium

# === LOCATION (Easy manual entry) ===
location:
  lat: -22.6569
  lng: -45.8558
  city: "City Name"
  region: "State/Province"  # Optional
  country: "br"            # ISO code

# === IMAGES (Semantic structure that works with collection-image) ===
images:
  logo:
    name: "color"     # Becomes logo-color-400w.png
    ext: "png"
  hero:
    name: "storefront"  # Becomes hero-storefront-400w.jpg
    ext: "jpg"
  founder:
    name: "portrait"    # Becomes founder-portrait-400w.jpg
    ext: "jpg"

# === SOCIAL MEDIA (Easy to edit) ===
social_media:
  facebook: ""
  instagram: ""
  linkedin: ""
  telegram: ""
  twitter: ""
  vk: ""
  youtube: ""

# === BUSINESS INFO (Easy manual entry) ===
export_ready: false
export_markets: []  # ISO country codes
distribution_models:
  - "direct-export"
  - "distributors"

# === TIMELINE (Human-friendly) ===
timeline:
  - year: 1986
    event: "Company founded"
  - year: 2020
    event: "Achieved organic certification"

# === CERTIFICATIONS ===
certifications:
  - name: "Organic Certification"
    year: 2017
  - name: "Fair Trade Certified"
    year: 2019

# === GALLERY (Easy to manage) ===
gallery:
  - name: "production-facility"
    ext: "jpg"
    caption: "Modern production facility"
  - name: "product-range"
    ext: "jpg"
    caption: "Complete product range"

# === MULTILINGUAL CONTENT (Future expansion) ===
# When we add RU/ZH versions, these will be translation overrides
translations:
  ru:
    title: "Название на русском"
    description: "Описание на русском"
  zh:
    title: "中文品牌名"
    description: "中文描述"
---

## About {{ page.title }}

Manual content entry here - easy for humans to read and edit.

Brand information like name, founding year, website will be automatically pulled from the front matter above and can also be auto-generated into brands.json for Airtable sync.

## Founder's Journey

Content about founder - founder details pulled from the founders array above.

## Product Range

Product information here.

## Market Presence

Market information here.
