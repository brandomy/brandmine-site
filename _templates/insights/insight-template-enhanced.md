---
# INSIGHT ARTICLE TEMPLATE - Enhanced for JSON optimization
# This template maintains human readability while optimizing for search and performance

layout: insight-article
ref: insight-slug-here  # Unique identifier for language switching and JSON
lang: en  # Language: en, ru, or zh
title: "Your Insight Title Here"
permalink: /en/insights/insight-slug-here/

# Content Metadata
date: 2025-01-01  # Publication date (YYYY-MM-DD)
author: "author_key"  # Key for author lookup in translations
excerpt: "Brief summary of the insight for search and social sharing (150-200 characters)"
category: "market-momentum"  # Options: market-momentum, brand-spotlight, founders-journey, location-intelligence
reading_time: 7  # Estimated reading time in minutes
word_count: 1200  # Approximate word count (auto-calculated by plugin)

# Content Classification
featured: false  # Featured on homepage and insights main page
premium: false  # Requires registration/payment to read full content
sample_data: false  # Mark as sample/demo content

# Brand & Founder References (for cross-linking and related content)
brands: []  # Array of brand IDs mentioned in article: ["ru-krasnodar-wines", "br-serra-verde"]
founders: []  # Array of founder IDs featured: ["ru-anna-kuznetsova", "br-eduardo-santos"]

# Taxonomy (exact slugs from dimensions - DO NOT TRANSLATE)
sectors: []  # Industry sectors covered: ["wine", "artisan-ceramics", "gourmet-foods"]
markets: []  # Geographic markets discussed: ["russia", "brazil", "china"]
attributes: []  # Brand attributes highlighted: ["heritage-brand", "sustainability-pioneer"]
signals: []  # Market signals analyzed: ["rapid-growth", "export-ready"]

# Content Structure (sections to include in layout) - Using linear layout (no sidebar)
sections:
  - breadcrumbs
  - hero
  - header
  - featured-image
  - content
  - taxonomy
  - brand-info
  - related-brands
  - related-insights
#   - taxonomy-cloud

# SEO & Social
seo:
  title: "Custom SEO title if different from main title"
  description: "Custom meta description for search engines"
  keywords: "keyword1, keyword2, keyword3"
  image: "path/to/social-share-image.jpg"

# Analytics & Tracking
analytics:
  track_reading_progress: true
  track_brand_clicks: true
  track_related_content: true

# Last Modified (auto-updated by plugin)
last_modified: 2025-01-01

---

# Your Insight Content Goes Here

Write your insight article content here using standard Markdown. The content will be automatically processed for search indexing while maintaining full readability for content creators.

## Key Features for Content Creators:

1. **Human-Readable**: All front matter is clear and documented
2. **Auto-Processing**: JSON generation happens automatically
3. **Cross-Linking**: Brand and founder references auto-link
4. **Search Optimized**: Content is indexed for advanced search
5. **Analytics Ready**: Tracking built into template

## Sections You Can Use:

### Brand Spotlight
When featuring specific brands, reference them in the `brands` array above.

### Market Analysis
Reference relevant markets in the `markets` array for geographic filtering.

### Founder Stories
Include founder IDs in the `founders` array for relationship mapping.

## Content Guidelines:

- Use clear, descriptive headings
- Include relevant taxonomy in front matter
- Reference brands and founders by their exact IDs
- Keep excerpt under 200 characters
- Estimate reading time accurately

The plugin will automatically:
- Generate search tags
- Count words
- Create cross-references
- Build related content suggestions
- Optimize for performance

Your content creation workflow remains exactly the same - just write in Markdown with proper front matter!
