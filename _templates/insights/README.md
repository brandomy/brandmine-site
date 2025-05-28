# Insight Articles Templates Usage Guide

This directory contains templates for creating insight articles across the four insight categories.

## Available Templates

- `insight-article-brand-spotlight.md` - In-depth profiles of noteworthy brands
- `insight-article-founders-journey.md` - Personal stories behind brands and their visionaries  
- `insight-article-market-momentum.md` - Notable achievements, milestones, and expansion moments
- `insight-article-location-intelligence.md` - Geographical insights and regional context
- `insight-template-enhanced.md` - General template with all options

## Insight Categories

### 1. Brand Spotlight
**Purpose**: In-depth profiles of noteworthy BRICS+ brands gaining international momentum
**Recommended length**: 800-1200 words
**Reading time**: 4-6 minutes
**Focus**: Company story, unique value proposition, market impact

### 2. Founder's Journey  
**Purpose**: Personal stories behind the brands and the visionaries who created them
**Recommended length**: 1000-1500 words
**Reading time**: 5-8 minutes
**Focus**: Personal background, founding story, leadership philosophy

### 3. Market Momentum
**Purpose**: Notable achievements, milestones, and expansion moments for emerging brands
**Recommended length**: 600-900 words
**Reading time**: 3-5 minutes
**Focus**: Growth metrics, market expansion, business milestones

### 4. Location Intelligence
**Purpose**: Geographical insights and regional context that shape brand development
**Recommended length**: 700-1000 words
**Reading time**: 4-6 minutes
**Focus**: Regional characteristics, local market dynamics, geographic advantages

## Using the Templates

### 1. Choose the Right Template
Select the template that matches your insight category and content focus.

### 2. Replace Placeholders
All templates use `[PLACEHOLDER]` format. Replace with actual values:

```
[BRAND_SLUG] → kebab-case-identifier (e.g., "ru-teatime")
[INSIGHT_TITLE] → Article title (e.g., "Russian Wine Renaissance")
[CATEGORY] → One of: brand-spotlight, founders-journey, market-momentum, location-intelligence
etc.
```

### 3. Configure Sections
Each template includes a `sections` array that controls which content blocks appear:

```yaml
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
```

**Toggle sections on/off** by commenting out or removing lines.

### 4. Hero Images (Optional)
Add a hero image to any insight article:

```yaml
hero_image: "/assets/images/insights/[slug]/hero-image.jpg"
```

**If no `hero_image` is specified**, the article will use the standard teal gradient hero panel.

### 5. File Placement
Save completed files to:
```
_insights/en/[insight-slug].md
```

Examples:
- `_insights/en/ru-russian-wine-renaissance.md`
- `_insights/en/br-eduardo-santos-journey.md`
- `_insights/en/china-tea-market-expansion.md`

## Required Front Matter Fields

### Core Information
```yaml
layout: insight-article
title: "Article Title"
lang: en
permalink: /en/insights/[slug]/
date: YYYY-MM-DD
category: brand-spotlight  # Must match one of the four categories
reading_time: 5  # Estimated minutes
```

### Brand & Founder Information
```yaml
brands: [brand-slug]  # Associated brand slugs
founders: [founder-slug]  # Associated founder slugs
founder_led: true  # Boolean
```

### Taxonomy (Optional)
```yaml
sectors: [wine, gourmet-foods]
markets: [russia, china]
attributes: [founder-led, heritage-brand]
signals: [export-ready, rapid-growth]
```

### Images (Optional)
```yaml
hero_image: "/assets/images/insights/[slug]/hero-image.jpg"
logo: "/assets/images/insights/[slug]/logo.jpg"
founder_portrait: "/assets/images/insights/[slug]/founder.jpg"
```

### Location (Optional)
```yaml
location_lng: 37.6173
location_lat: 55.7558
location_city: "Moscow"
location_region: "Moscow Oblast"
location_country: "ru"
```

## Content Guidelines

### Brand Spotlight Articles
- Focus on company story and unique value proposition
- Include business metrics and market impact
- Highlight what makes the brand distinctive
- Emphasize international potential

### Founder's Journey Articles
- Personal background and motivation
- Founding story with specific challenges and pivots
- Leadership philosophy and vision
- Personal quotes and anecdotes

### Market Momentum Articles
- Specific growth metrics and milestones
- Market expansion details
- Revenue/export growth data
- Investment or partnership announcements

### Location Intelligence Articles
- Regional market characteristics
- Geographic advantages or challenges
- Local consumer behavior insights
- Cultural context and opportunities

## Section Descriptions

### Linear Layout Sections

**Full-width sections** (appear before main content):
- `breadcrumbs` - Navigation breadcrumbs
- `hero` - Hero panel with title, category, meta info (uses hero image if specified)
- `header` - Additional context and author info
- `featured-image` - Large article image (separate from hero)

**Content sections** (wrapped in light panels):
- `content` - Main article content from markdown
- `taxonomy` - Tag display for sectors, markets, attributes, signals
- `brand-info` - Information about featured brands
- `related-brands` - Links to related brand profiles
- `related-insights` - Links to related articles

## Quick Creation Checklist

- [ ] Choose appropriate template for insight category
- [ ] Replace all `[PLACEHOLDERS]` with actual values
- [ ] Set correct `category` (must match: brand-spotlight, founders-journey, market-momentum, location-intelligence)
- [ ] Add `hero_image` if available (recommended for featured articles)
- [ ] Include associated `brands` and `founders` slugs
- [ ] Add relevant taxonomy tags (`sectors`, `markets`, `attributes`, `signals`)
- [ ] Customize sections array for desired content blocks
- [ ] Set appropriate `reading_time` estimate
- [ ] Save to `_insights/en/[slug].md`
- [ ] Add images to `assets/images/insights/[slug]/` if available
- [ ] Test article generation and layout
- [ ] Create RU and ZH versions once English is finalized

## Hero Image Requirements

When adding hero images to insight articles:

- **Minimum resolution**: 1200×600px
- **Aspect ratio**: 2:1 (recommended)
- **File format**: JPG or PNG
- **Optimized file size**: < 500KB
- **High contrast areas**: Ensure text overlay readability
- **Visual style**: Follow Brandmine's Textured Minimalism (TM) guidelines

## Advanced Customization

### Custom Sections
You can override the default sections completely:

```yaml
sections:
  - breadcrumbs
  - hero
  - content
  - custom-section-name
  - taxonomy
```

Just ensure the corresponding include exists at:
`_includes/pages/insight/custom-section-name.html`

### Additional Front Matter
Add any custom fields needed for your specific article:

```yaml
special_field: "Custom value"
custom_data:
  - item1
  - item2
```

Access in templates with `{{ page.special_field }}` or `{{ page.custom_data }}`.

### Translation Support
Add translation overrides for multilingual content:

```yaml
translations:
  ru:
    title: "Заголовок на русском"
    excerpt: "Краткое описание"
  zh:
    title: "中文标题"
    excerpt: "中文摘要"
```

## Content Quality Standards

### Writing Guidelines
- **Clear, engaging headlines** that explain the value proposition
- **Strong opening paragraph** that hooks the reader
- **Specific examples and data** rather than generic statements
- **Quotes from founders/executives** when possible
- **Forward-looking conclusion** that emphasizes potential

### Editorial Standards
- **Fact-check all business metrics** and claims
- **Verify brand and founder information** matches profile data
- **Ensure consistent terminology** across related articles
- **Proofread for grammar and clarity**
- **Optimize for SEO** with relevant keywords

---

*These templates follow the "logic-light" architecture and unified hero system established for the Brandmine site. All insights use linear layout (no sidebar) for MVP simplicity and maintainability.*