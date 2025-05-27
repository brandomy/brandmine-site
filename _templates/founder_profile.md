---
# FOUNDER PROFILE TEMPLATE - Clean Hybrid Approach
# Human-friendly YAML that auto-generates JSON for Airtable compatibility

layout: founder-profile
ref: xx-firstname-lastname  # Global founder ID (country-brandslug format)
name: "Full Name"
title: "Full Name - Brief Positioning"  # e.g., "Brazil's Organic Pioneer"
date: YYYY-MM-DD  # Date profile was created or updated
lang: en  # Language of this file
permalink: /en/founders/xx-firstname-lastname/

# JSON Generation Control (MATCHING BRAND PATTERN)
generate_json: true  # Set to true to include in founders.json output
sample_data: true    # Flag for sample/test data

# === SECTION CONTROL (CRITICAL - Drives page layout) ===
# Controls which sections appear and in what order
# Linear layout (no sidebar) - Each section corresponds to _includes/pages/founder/sections/{section}.html
# Uncomment sections you want to include:
# sections:
#   - breadcrumbs
#   - hero
#   - professional-details
#   - content
#   - associated-brands
#   - expertise-cloud
#   - related-insights

# === CORE INFORMATION (Human-friendly entry) ===

# Basic Founder Information
brands: [xx-brand-slug]  # Array of associated brand slugs
featured: false  # Is this a featured founder?
generation: "first"  # Options: "first", "second", "third", "transition"
role: "CEO & Founder"  # Their role in the primary brand

# Location (Easy manual entry)
country_code: xx   # Two-letter country code (ISO 3166-1 alpha-2)
region: "Region/State"  # Optional: specific region or state
city: "City Name"

# Markets and Cross-border
markets: [xx]  # Array of country codes where they operate (ISO 3166-1 alpha-2)
cross_border_expertise: false  # Has international experience?
languages: ["xx", "xx"]  # Languages they speak (ISO 639-1 codes: en, zh, ru, etc.)

# === IMAGES (Semantic structure that works with collection-image) ===
images:
  portrait:
    name: "portrait"     # Becomes xx-firstname-lastname-portrait-400w.jpg
    ext: "jpg"
  headshot:
    name: "headshot"     # Becomes xx-firstname-lastname-headshot-400w.jpg
    ext: "jpg"
  action:
    name: "action"       # Becomes xx-firstname-lastname-action-400w.jpg
    ext: "jpg"

# === SOCIAL MEDIA (Easy to edit) ===
social:
  instagram: username
  linkedin: username
  telegram: username
  twitter: username
  wechat: username

# === PROFESSIONAL INFO (Easy manual entry) ===
expertise:
  - primary skill
  - secondary skill
  - third skill
  - max 4 items

achievements:
  - "Key achievement 1"
  - "Key achievement 2"
  - "Key achievement 3"

brief_bio: "Brief 1-2 sentence summary of the founder's key contribution or unique positioning. Keep under 120 characters for card display."

# === SEO ===
description: "SEO-friendly description of the founder profile page"
keywords: [founder, brandname, expertise, country]
---

# {{ page.name }}: One-Line Powerful Positioning

Opening paragraph introducing the founder and their key achievement. This should immediately establish why this person is noteworthy and their contribution to their industry. (100-150 words)

## Background & Education

2-3 paragraphs about their background, education, or journey to founding their company. Include relevant personal details that make them relatable. (200-250 words)

## Founding Story

2-3 paragraphs about the founding of their company or their key innovation. Include challenges overcome and pivotal moments. (200-250 words)

## Leadership Philosophy

2-3 paragraphs about their leadership style, philosophy, or impact on their industry. Include specific examples. (150-200 words)

## Recognition & Achievements

2-3 paragraphs about company growth, international expansion, awards, or recognition. (150-200 words)

## Vision for the Future

1-2 paragraphs about their vision for the future or current projects. End with forward-looking perspective. (100-150 words)

<!-- Optional: Add a meaningful quote if available -->
<!-- > "Quote text that captures their philosophy." - {{ page.name }} -->
