---
layout: insight-article
ref: [country-code]-[article-slug]  # e.g., ru-new-insight
title: "Article Title"
lang: en
permalink: /en/insights/[country-code]-[article-slug]/

date: 2025-MM-DD
author: "randal_eastman"
excerpt: "Brief description for cards and meta"
category: "brand-spotlight"  # or founders-journey, market-momentum, location-intelligence
reading_time: 7

# CRITICAL: Images section - this drives the path generation
images:
  hero:
    name: "context-description"  # ← This creates hero-context-description-800w.jpg
    alt: "Detailed alt text for accessibility"
    ext: "jpg"
  founder:
    name: "portrait"
    alt: "Founder portrait description"
    ext: "jpg"
  logo:
    name: "brand"
    alt: "Brand logo description"
    ext: "png"

# Brand and taxonomy data
brands: [country-brand-slug]
sectors: [exact-slug]
markets: [country-code]
attributes: [exact-slugs]
signals: [exact-slugs]

# Location
location_lng: 0.0000
location_lat: 0.0000
location_city: "City"
location_country: "country-code"
---

Content here...
