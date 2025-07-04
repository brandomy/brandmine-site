---
# BRAND PROFILE TEMPLATE
# Uses centralized section control via _data/page_sections.yml

layout: brand-profile
ref: xx-brandslug  # Global brand ID (country-brandslug format)
title: "Brand Name"  # Primary display name, fallback if JSON lookup fails
description: "Brief brand description (1-2 sentences)."
slogan: "Brand tagline or motto"  # Optional
lang: en
permalink: /en/brands/xx-brandslug/

# JSON Generation Control
generate_json: true  # Set to true to include in brands.json output
sample_data: true    # Flag for sample/test data

# === LAYOUT CONTROL ===
# Page sections automatically loaded from _data/page_sections.yml
# Layout: brand-profile determines which sections appear and in what order
# No manual section configuration required

# === CORE INFORMATION ===
# Basic Information
founding_year: YYYY  # Maps to JSON field: "founded"
website: "https://example.com"
email: "contact@example.com"  # Optional contact email
founders: ["xx-founder-slug"]  # Array of founder keys for JSON lookup
founder_led: true  # Boolean: Is the founder still actively leading?

# Taxonomy (all using kebab-case)
markets: ["brazil"]  # Required: At least one market from taxonomy
sectors: ["gourmet-foods"]  # Required: At least one sector from taxonomy
attributes: ["founder-led", "sustainability-pioneer"]  # Optional attributes
signals: ["export-ready"]  # Optional signals

# Display Settings
featured: true
featured_level: 2  # 0=basic listing, 1=standard featured, 2=premium featured

# === LOCATION (Flattened structure for easier data handling) ===
latitude: -22.6569  # Latitude coordinate
longitude: -45.8558  # Longitude coordinate
city: "City Name"  # City name (translatable)
region: "State/Province"  # Region/state/province (translatable, optional)
country: "br"  # ISO country code

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

# === SOCIAL MEDIA (Flattened structure for easier data handling) ===
social_facebook: ""
social_instagram: ""
social_linkedin: ""
social_pinterest: ""  # Added for completeness
social_telegram: ""
social_twitter: ""
social_vk: ""
social_youtube: ""

# === BUSINESS INFO ===
export_ready: false
export_markets: []  # ISO country codes, do not translate
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
  - name: "Industry Excellence Award"  # Translate name
    year: 2022  # Do not translate year
  - name: "Sustainability Leadership Recognition"  # Translate name
    year: 2023  # Do not translate year

# === GALLERY ===
gallery:
  - name: "production-facility"
    ext: "jpg"
    caption: "Modern production facility"
  - name: "product-range"
    ext: "jpg"
    caption: "Complete product range"

# === MULTILINGUAL APPROACH ===
# We create separate files for each language:
# _brands/en/xx-brandslug.md (this file)
# _brands/ru/xx-brandslug.md (complete Russian translation)
# _brands/zh/xx-brandslug.md (complete Chinese translation)
---

## Architecture Notes

This template uses Brandmine's centralized section control system:

- **Layout**: brand-profile automatically loads appropriate sections
- **Configuration**: Section order and behavior defined in `_data/page_sections.yml`
- **Consistency**: All brand profiles use identical section structure

No manual section configuration is needed in the front matter.

## About {{ page.title }}

This content area will be displayed in the "content" section of the brand profile. The hybrid architecture automatically handles the placement of this markdown content within the structured sections defined above.

Key brand information like name, founding year, and website will be automatically pulled from the YAML front matter and displayed in the structured sections (identity, business-intelligence, etc.).

## Founder's Journey

Detailed founder narrative content goes here. The founder details from the `founders` array will be automatically looked up from the founders.json data and displayed in the founder-narrative section.

## Product Range

Information about the brand's products and services. This content works alongside the structured data in the front matter to create a complete brand profile.

## Market Presence

Market positioning, distribution, and business development information. The export markets and distribution models from the front matter will be displayed in the business-intelligence section.
