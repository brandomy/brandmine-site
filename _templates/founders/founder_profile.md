---
# FOUNDER PROFILE TEMPLATE
# Uses centralized section control via _data/page_sections.yml

layout: founder-profile
ref: xx-firstname-lastname  # Global founder ID (country-firstname-lastname format)
name: "Full Name"
title: "Full Name - Brief Positioning"  # e.g., "Alexei Sokolov - Moscow's Tea Master"
position: "CEO & Founder"  # Their primary role/title
brief_bio: "Brief 1-2 sentence summary of the founder's key contribution or unique positioning. Keep under 120 characters for card display."
date: YYYY-MM-DD  # Date profile was created or updated
lang: en  # Language of this file
permalink: /en/founders/xx-firstname-lastname/

# JSON Generation Control
generate_json: true  # Set to true to include in founders.json output
sample_data: true    # Flag for sample/test data

# === LAYOUT CONTROL ===
# Page sections automatically loaded from _data/page_sections.yml
# Layout: founder-profile determines which sections appear and in what order
# No manual section configuration required

# === CORE INFORMATION ===
# Basic Information
brands: ["xx-brand-slug"]  # Array of associated brand slugs
featured: false  # Is this a featured founder?
generation: "first"  # Options: "first", "second", "transition"
company: "Brand/Company Name"  # Primary company association

# Location Information (flattened structure)
country: "xx"      # ISO country code
region: "Region/State"   # Optional: specific region or state
city: "City Name"

# Professional Information
expertise: ["primary skill", "secondary skill", "third skill"]  # Max 4 items
achievements: ["Key achievement 1", "Key achievement 2", "Key achievement 3"]

# International Scope
markets: ["xx"]  # Array of country codes where they operate
cross_border_expertise: false  # Has international experience?
languages: ["en", "xx"]  # Languages they speak (ISO 639-1 codes)

# === IMAGES (Semantic structure that works with collection-image) ===
portrait_image: true  # Flag indicating portrait image exists
images:
  portrait:
    name: "portrait"     # Becomes founder-portrait-400w.jpg
    ext: "jpg"
  headshot:
    name: "headshot"     # Optional: becomes founder-headshot-400w.jpg
    ext: "jpg"

# === SOCIAL MEDIA (Flattened structure for easier data handling) ===
social_instagram: ""  # Username only
social_linkedin: ""   # Username only
social_telegram: ""   # Username only
social_twitter: ""    # Username only
social_wechat: ""     # Username only
social_vk: ""         # Username only (for Russian founders)

# === QUOTES ===
# Inspirational quotes from the founder that capture their philosophy, vision, or insights
# Up to 3 quotes will be displayed in the founder-wisdom section
quotes:
  - text: "Sample inspirational quote that captures the founder's philosophy or vision"
    type: "philosophy"  # Options: "vision", "philosophy", "advice", "insight"
    context: "Context about when or why this was said"
  - text: "Another quote showing business insight or advice"
    type: "advice"
    context: "Context for this advice"

# === SEO ===
description: "SEO-friendly description of the founder profile page"
keywords: ["founder", "brandname", "expertise", "country"]

# === MULTILINGUAL APPROACH ===
# We create separate files for each language:
# _founders/en/xx-firstname-lastname.md (this file)
# _founders/ru/xx-firstname-lastname.md (complete Russian translation)
# _founders/zh/xx-firstname-lastname.md (complete Chinese translation)
---

## Architecture Notes

This template uses Brandmine's centralized section control system:

- **Layout**: founder-profile automatically loads appropriate sections
- **Configuration**: Section order and behavior defined in `_data/page_sections.yml`
- **Consistency**: All founder profiles use identical section structure

No manual section configuration is needed in the front matter.

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
