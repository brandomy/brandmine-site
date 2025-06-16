# Complete Brandmine Card System Tutorial

**Your comprehensive guide to using the strategic card system effectively**

---

## Table of Contents

1. [Card System Overview](#card-system-overview)
2. [Featured Brand Cards](#featured-brand-cards)
3. [Case Study Cards](#case-study-cards)
4. [Founder Cards](#founder-cards)
5. [Insight Cards](#insight-cards)
6. [Content Creation Workflows](#content-creation-workflows)
7. [Translation Management](#translation-management)
8. [Troubleshooting Guide](#troubleshooting-guide)

---

## Card System Overview

### What Makes Our Cards Strategic

Your Brandmine cards are designed to answer three critical questions in order:

1. **"Why should I care?"** → Value propositions and compelling headlines
2. **"Can I trust this?"** → Business metrics, founder credibility, achievements
3. **"What should I do next?"** → Strategic calls-to-action

### The Four Card Types

| Card Type | Purpose | Effectiveness Rating |
|-----------|---------|---------------------|
| **Featured Brand Cards** | Homepage brand showcase | 8/10 |
| **Case Study Cards** | Success story highlights | 9/10 |
| **Founder Cards** | Personal credibility building | 9/10 |
| **Insight Cards** | Content discovery and engagement | 8/10 |

### Design Principles

- **Mobile-first responsive design**
- **Category-specific color theming**
- **Strategic information hierarchy**
- **Multilingual support (EN/RU/ZH)**
- **Performance optimized (sub-16s build times)**

---

## Featured Brand Cards

### Purpose
Showcase your best brands on the homepage with compelling value propositions, founder credibility, and business metrics.

### Content Structure

**Strategic Elements (in order of importance):**
1. **Value Proposition** - One compelling line explaining why this brand matters
2. **Market Context** - BRICS+ country positioning with economic scale
3. **Brand Title & Basic Info** - Name, location, sector
4. **Founder Integration** - Name, role, and optional avatar
5. **Key Business Metric** - Credibility indicator (markets, scale, growth)
6. **Breakthrough Moment** - Major achievement or milestone
7. **Founder Quote Snippet** - Personal philosophy (optional enhancement)
8. **Strategic Tags** - Prioritized taxonomy (signals > attributes > sectors)

### Where to Add Content

**File:** `_data/featured_content.yml`

**Complete Example:**

```yaml
brands:
  en:
    - ref: "ru-teatime"                    # Must match brand filename
      title: "TeaTime"                     # Display name
      permalink: "/en/brands/ru-teatime/"  # Full URL path
      
      # STRATEGIC CONTENT (Required for 8/10 effectiveness)
      value_proposition: "Moscow's premium tea house bringing authentic Russian tea culture to global markets"
      founder_display_name: "Alexei Sokolov"
      founder_role: "CEO & Tea Master"
      
      # KEY METRIC (Business credibility)
      key_metric:
        label: "International Markets"     # What you're measuring
        value: "23 Countries"             # Impressive number
        period: "Since 2015"              # Time context
      
      # MARKET CONTEXT (BRICS+ positioning)
      market: ["ru"]                      # Country code for market helpers
      founding_year: 1998
      breakthrough_moment: "Featured in Harrods London, reaching 23 countries"
      
      # OPTIONAL ENHANCEMENT
      founder_quote_snippet: "We built a bridge between Russian traditions and global tastes"
      
      # STANDARD FIELDS (Existing system)
      description: "Moscow's premium tea house offering artisanal tea blends"
      sector: "gourmet-foods"             # Must match taxonomy
      featured: true
      featured_level: 2                   # 1=standard, 2=premium
      attributes: ["founder-led", "heritage-brand"]
      signals: ["export-ready", "rapid-growth"]
      images:
        logo: "logo-color.png"
        hero: "hero-storefront.jpg"
        founder: "founder-portrait.jpg"
```

### Writing Effective Value Propositions

**Formula:** [Location/Origin] + [Category] + [Unique Benefit] + [Market Opportunity]

**Good Examples:**
- "Moscow's premium tea house bringing authentic Russian tea culture to global markets"
- "Traditional Siberian honey producer from pristine Altai Mountains with three generations of expertise"
- "Brazil's leading organic producer transforming Atlantic Forest agriculture through sustainable family farming"

**Avoid:**
- Generic statements: "We make great products"
- Industry jargon: "Leading solutions provider"
- Vague benefits: "High quality manufacturer"

### Key Metrics That Work

**Choose metrics that show scale, growth, or achievement:**

```yaml
# Scale indicators
key_metric:
  label: "International Markets"
  value: "23 Countries"
  period: "Since 2015"

# Growth indicators  
key_metric:
  label: "Revenue Growth"
  value: "300% YoY"
  period: "2022-2024"

# Achievement indicators
key_metric:
  label: "Partner Farms"
  value: "28 Families"
  period: "Since 1986"
```

### Breakthrough Moments

**Focus on specific, measurable achievements:**
- "Featured in Harrods London, reaching 23 countries"
- "Achieved organic certification and expanded to 50 beehive locations"
- "First Russian tea brand to achieve international certification"

**Avoid generic statements:**
- "Became very successful"
- "Grew the business significantly"

---

## Case Study Cards

### Purpose
Transform business success stories into compelling narratives that showcase founder-led achievement and measurable results.

### Content Structure

**Strategic Elements:**
1. **Prominent Metrics** - Key results displayed at the top with icons and trends
2. **Founder Integration** - Portrait, role, breakthrough moment, quote snippet
3. **Strategic Title** - Achievement-focused headline
4. **Company Context** - Industry, duration, country positioning
5. **Strategic CTA** - "Read Success Story" vs generic "Read More"

### Where to Add Content

**File:** `_data/case_studies.yml`

**Complete Example:**

```yaml
en:
  - slug: "teatime-global-expansion"
    title: "TeaTime: From Moscow Dorms to 23-Country Global Success"
    client: "TeaTime"
    industry: "Artisanal Beverages"
    duration: "5 years (2015-2020)"
    description: "How a university tea ceremony hobby transformed into Russia's leading tea export brand"
    excerpt: "TeaTime proved that authentic Russian tea culture could compete globally, achieving 23-country distribution and Harrods London placement through strategic founder-led growth."
    permalink: "/en/case-studies/teatime-global-expansion/"
    hero_image: "/assets/images/case-studies/teatime-global/hero-harrods-display.jpg"
    featured: true
    
    # STRATEGIC FOUNDER INTEGRATION
    founder_name: "Alexei Sokolov"
    founder_role: "CEO & Tea Master"
    country: "ru"
    country_context: "Russia's 146M consumer market with rich tea traditions"
    breakthrough_moment: "First Russian tea brand featured in Harrods London premium collection"
    quote_snippet: "We built a bridge between Russian traditions and global tastes"
    founder_portrait: "/assets/images/case-studies/teatime-global/founder-alexei-sokolov.jpg"
    
    # PROMINENT METRICS (displayed at top)
    metrics:
      - label: "International Markets"
        value: "23 Countries"
        trend: "up"
        icon: "globe"
      - label: "Revenue Growth"
        value: "300% YoY"
        trend: "up"
        icon: "trending-up"
      - label: "Export Expansion"
        value: "15x Growth"
        trend: "up"
        icon: "export"
        
    founder_quote:
      text: "Tea is not just a beverage—it's a bridge between cultures. When we share tea, we share stories, traditions, and understanding. Our success proves that authenticity resonates universally."
      attribution: "Alexei Sokolov, Founder & CEO"
```

### Writing Compelling Case Study Titles

**Formula:** [Brand Name]: [Transformation] to [Achievement]

**Examples:**
- "TeaTime: From Moscow Dorms to 23-Country Global Success"
- "Altai Gold: Transforming Siberian Honey into Premium Export Success"
- "Serra Verde: Building Brazil's Largest Organic Farm Network"

### Effective Metrics Display

**Use icons and trends for visual impact:**

| Icon | Usage | Trend Options |
|------|-------|---------------|
| 🌍 `globe` | International expansion | `up`, `down`, `stable` |
| 📈 `trending-up` | Growth metrics | `up`, `down`, `stable` |
| 👥 `users` | People/partners | `up`, `down`, `stable` |
| 🏆 `award` | Achievements | `stable` |
| 📍 `map-pin` | Locations | `up`, `down`, `stable` |
| 🌳 `tree` | Environmental impact | `up`, `down`, `stable` |

---

## Founder Cards

### Purpose
Build personal credibility and connection by highlighting founder achievements, expertise, and business impact.

### Content Structure

**Strategic Elements:**
1. **Achievement Highlighting** - Key accomplishment prominently displayed
2. **Professional Details** - Name, role, company, location
3. **Business Impact Metrics** - Optional quantified contributions
4. **Founder Information** - Bio, expertise, languages, generation
5. **Enhanced CTA** - "Connect with [FirstName]" personalization

### Where to Add Content

**File:** `_founders/{lang}/{country}-{founder-name}.md`

**Example:** `_founders/en/ru-alexei-sokolov.md`

**Complete Front Matter:**

```yaml
---
layout: founder-profile
ref: ru-alexei-sokolov
name: "Alexei Sokolov"
title: "Alexei Sokolov - TeaTime's Visionary"
position: "CEO & Tea Master"
brief_bio: "Tea blending master who revolutionized Russia's premium tea market with unique botanical infusions."
date: 2025-05-02
lang: en
permalink: /en/founders/ru-alexei-sokolov/

# CORE INFORMATION
brands: ["ru-teatime"]
featured: true
generation: "first"                    # first, second, transition
company: "TeaTime"

# LOCATION INFORMATION
location:
  country: "ru"
  region: "Moscow"
  city: "Moscow"

# INTERNATIONAL SCOPE
markets: ["ru", "gb", "fr", "de", "jp", "sg"]
cross_border_expertise: true
languages: ["ru", "en", "fr"]

# IMAGES
portrait_image: true
images:
  portrait:
    name: "portrait"
    ext: "jpg"
  headshot:
    name: "headshot"
    ext: "jpg"

# PROFESSIONAL INFORMATION
expertise: ["tea blending", "beverage innovation", "cultural ambassador", "brand storytelling"]
achievements: ["Featured in Harrods London", "23 countries export presence", "30% annual growth rate"]

# OPTIONAL BUSINESS IMPACT
business_impact:
  primary_metric:
    value: "23 Countries"
    label: "International Expansion"

# SEO
description: "Alexei Sokolov profile - Russian tea entrepreneur who built TeaTime into an international artisanal tea brand with 23-country presence."
keywords: ["alexei sokolov", "russia", "teatime", "tea", "artisanal beverages"]

# SECTION CONTROL
sections:
  - breadcrumbs
  - hero
  - professional-details
  - content
  - associated-brands
  - expertise-cloud
  - related-insights
---

# Your founder content goes here...
```

### Writing Achievement Statements

**Formula:** [Specific accomplishment] + [Measurable impact] + [Industry recognition]

**Effective Examples:**
- "Featured in Harrods London - first Russian tea in their premium collection"
- "Scaled artisanal ceramics studio to $5M annual revenue in 4 years"
- "First Ethiopian honey producer to achieve EU organic certification"

---

## Insight Cards

### Purpose
Differentiate content types with category-specific messaging, reading investment clarity, and strategic CTAs.

### Content Structure

**Strategic Elements:**
1. **Category Badge** - Visual identification with icon and color theme
2. **Reading Investment** - Time commitment and value proposition
3. **Author & Date** - Credibility and currency indicators
4. **Enhanced Title** - Achievement or insight focused
5. **Featured Context** - Related brands/founders for relevance
6. **Strategic CTA** - Category-specific action language

### Where to Add Content

**File:** `_insights/{lang}/{article-slug}.md`

**Example:** `_insights/en/ru-teatime-founder-journey.md`

**Complete Front Matter:**

```yaml
---
layout: insight-article
ref: ru-teatime-founder-journey
title: "Alexei Sokolov: TeaTime's Journey from Moscow Mountains to Global Markets"
lang: en
permalink: /en/insights/ru-teatime-founder-journey/

# BASIC INFORMATION
date: 2025-02-05
author: "randal_eastman"              # Key for translation lookup
excerpt: "The remarkable story of how a software engineer's passion for tea transformed into Russia's leading artisanal tea brand."
category: "founders_journey"          # Must match category options
reading_time: 8                      # Minutes to read

# BRAND INFORMATION
brands: ["ru-teatime"]               # Featured brands
founding_year: 2010
website: "https://teatime.ru"
founders: ["ru-alexei-sokolov"]      # Array of founder keys

# TAXONOMY
sectors: ["gourmet-foods"]
markets: ["russia"]
attributes: ["founder-led", "artisanal-excellence"]
signals: ["rapid-growth", "export-ready"]

# DISPLAY SETTINGS
featured: true
premium: false

# ENHANCED METADATA
hero_image: "/assets/images/insights/ru-teatime-founder-journey/hero-teatime.jpg"

# SECTION CONFIGURATION
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
---

# Your insight content goes here...
```

### Category Options and Themes

| Category | Color Theme | Icon | CTA | Best For |
|----------|-------------|------|-----|----------|
| `brand-spotlight` | Orange | 🏆 | "Discover Success Story" | Brand achievements |
| `founders-journey` | Indigo | 🚀 | "Read Founder Journey" | Personal stories |
| `location-intelligence` | Sky Blue | 🌍 | "Explore Market Intelligence" | Geographic analysis |
| `market-momentum` | Olive | 📈 | "Analyze Market Trends" | Industry insights |

### Value Propositions by Category

**Auto-generated based on category:**
- **Brand Spotlight:** "Success strategies"
- **Founders Journey:** "Leadership lessons"
- **Location Intelligence:** "Market analysis"
- **Market Momentum:** "Industry trends"

---

## Content Creation Workflows

### Adding a New Featured Brand (Complete Process)

**Step 1: Create Brand Profile Files**
```bash
# Use template generator
python3 _scripts/content-creation/generate_brand_template.py ru teatime

# Creates:
# _brands/en/ru-teatime.md
# _brands/ru/ru-teatime.md  
# _brands/zh/ru-teatime.md
```

**Step 2: Add Strategic Content to Featured Content**
Edit `_data/featured_content.yml` and add your brand using the template provided in the Featured Brand Cards section above.

**Step 3: Add Images**
```bash
# Create directory
mkdir -p assets/images/brands/ru/teatime/originals/

# Add these images (3:2 aspect ratio for hero, 2:3 for founder):
# - hero-storefront.jpg
# - founder-portrait.jpg  
# - logo-color.png

# Process images
_scripts/process_images.sh brands ru-teatime
```

**Step 4: Verify and Test**
```bash
# Check build
bundle exec jekyll build --dry-run

# Test locally
bundle exec jekyll serve --livereload
```

### Adding a New Case Study

**Step 1: Add to Case Studies Data**
Edit `_data/case_studies.yml` using the template in the Case Study Cards section.

**Step 2: Create Images Directory**
```bash
mkdir -p assets/images/case-studies/brand-success-story/

# Add:
# - hero-achievement.jpg
# - founder-portrait.jpg
```

**Step 3: Test Implementation**
```bash
bundle exec jekyll build --dry-run
bundle exec jekyll serve --livereload
```

### Adding a New Founder

**Step 1: Create Founder Profile**
```bash
python3 _scripts/content-creation/generate_article_template.py founder ru-alexei-sokolov
```

**Step 2: Add Portrait Images**
```bash
mkdir -p assets/images/people/originals/
# Add: founder-portrait.jpg (2:3 aspect ratio)

# Process images
_scripts/process_images.sh people
```

### Adding a New Insight Article

**Step 1: Generate Template**
```bash
python3 _scripts/content-creation/generate_article_template.py insights new-article-slug
```

**Step 2: Choose Category and Add Metadata**
Use the insight template in the Insight Cards section, choosing the appropriate category.

**Step 3: Add Hero Image**
```bash
mkdir -p assets/images/insights/originals/
# Add: hero-article-name.jpg (3:2 aspect ratio)

# Process images
_scripts/process_images.sh insights
```

---

## Translation Management

### Adding Translations for New Content

**Required Files:**
- `_data/translations/en.yml`
- `_data/translations/ru.yml`
- `_data/translations/zh.yml`

**Key Translation Sections:**

```yaml
# For featured brands
brand_profile:
  impact:
    value_proposition: "Value Proposition"
    breakthrough_moment: "Key Achievement"

# For case studies  
case_studies:
  results: "Key Results"
  success_story: "Success Story"

# For founder profiles
founder_profile:
  achievements:
    highlight: "Key Achievement"
    business_impact: "Business Impact"

# For insights
insights:
  categories:
    brand_spotlight: "Brand Success"
    founders_journey: "Founder Story"
  value_props:
    brand_spotlight: "Success strategies"
    founders_journey: "Leadership lessons"

# For strategic CTAs
actions:
  discover_success: "Discover Success Story"
  read_journey: "Read Founder Journey"
  connect_with: "Connect with"
```

### Translation Workflow

1. **Add English content first**
2. **Create Russian translations** with cultural adaptations
3. **Create Chinese translations** with appropriate terminology
4. **Test all three languages** before publishing

---

## Troubleshooting Guide

### Common Issues

**Build Fails**
```bash
# Check YAML syntax
python3 -c "import yaml; yaml.safe_load(open('_data/featured_content.yml'))"

# Check Jekyll doctor
bundle exec jekyll doctor
```

**Images Not Displaying**
- Verify file paths match exactly
- Check image processing completed: `_scripts/process_images.sh [collection] [identifier]`
- Ensure correct aspect ratios (3:2 for heroes, 2:3 for portraits)

**Cards Not Showing Strategic Content**
- Verify `featured: true` in data files
- Check translation keys exist in all language files
- Ensure proper indentation in YAML files

**Performance Issues**
```bash
# Clean and rebuild if build time > 20 seconds
bundle exec jekyll clean
bundle exec jekyll build

# Check for circular references or large files
```

### Validation Checklist

Before publishing new content:

- [ ] Build completes without errors
- [ ] Strategic content displays on cards
- [ ] All three languages work (EN/RU/ZH)
- [ ] Images load correctly
- [ ] Mobile responsive design maintained
- [ ] CTAs function properly
- [ ] Translation keys are complete

### Quick Fixes

| Problem | Solution |
|---------|----------|
| Missing value proposition | Add to `featured_content.yml` |
| No founder image | Check image processing and file paths |
| Wrong card colors | Verify category matches taxonomy |
| Missing translations | Add keys to all three language files |
| Broken layout | Check YAML indentation and syntax |

---

## Best Practices Summary

### Content Quality
- **Lead with compelling value** - Answer "Why should I care?" immediately
- **Use specific metrics** - "23 countries" vs "many countries"
- **Show founder credibility** - Names, achievements, quotes
- **Emphasize BRICS+ scale** - Market size, economic opportunity

### Technical Standards
- **Mobile-first design** - Test on small screens first
- **Performance optimized** - Keep build times under 20 seconds
- **Multilingual complete** - All content in EN/RU/ZH
- **Strategic hierarchy** - Most important information first

### User Experience
- **Clear next actions** - Strategic CTAs guide users
- **Visual differentiation** - Categories have distinct styling
- **Reading investment** - Time and value clearly communicated
- **Personal connection** - Founder stories build trust

---

**Your strategic card system is now optimized for maximum effectiveness at showcasing BRICS+ founder-led brands. Each card type serves a specific purpose in building credibility, demonstrating opportunity, and driving user engagement.**