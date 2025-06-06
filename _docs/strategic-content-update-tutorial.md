# Strategic Content Update Tutorial

**Purpose:** Complete guide for preparing and updating content to work with the new strategic card components  
**Target Audience:** Content creators, editors, and site administrators  
**Prerequisites:** Basic understanding of YAML and Jekyll file structure

## Overview

The strategic card redesign requires new content fields that transform how brands, founders, case studies, and insights are presented. This tutorial walks you through updating all content types to take advantage of the enhanced card capabilities.

## Quick Start Checklist

Before diving into detailed instructions, here's your priority checklist:

### Immediate Actions Required
- [ ] Update `_data/featured_content.yml` with strategic fields
- [ ] Add value propositions to featured brands
- [ ] Populate key metrics for business credibility
- [ ] Add founder display names and roles
- [ ] Enhance case studies with founder integration

### Medium Priority
- [ ] Update brand profiles with breakthrough moments
- [ ] Add business credibility indicators
- [ ] Enhance insight articles with market context
- [ ] Update founder profiles with achievement highlights

### Long-term Goals
- [ ] Complete translation coverage for all new fields
- [ ] Add business metrics where available
- [ ] Optimize images for founder portraits and overlays

## Part 1: Featured Content Enhancement

### 1.1 Understanding the New Featured Content Structure

The new `_data/featured_content.yml` file is the heart of strategic content display. Here's the complete structure:

```yaml
brands:
  en:
    - ref: "brand-slug"                    # Required: matches brand file
      title: "Brand Display Name"          # Required: public brand name
      permalink: "/en/brands/brand-slug/"  # Required: full URL path
      
      # STRATEGIC CONTENT (new requirements)
      value_proposition: "One compelling line that explains why this brand matters"
      founder_display_name: "Full Founder Name"
      founder_role: "Founder & CEO"
      
      # KEY METRIC (business credibility)
      key_metric:
        label: "International Expansion" 
        value: "12 Countries"
        period: "2020-2024"
      
      # MARKET CONTEXT
      market: ["ru"]                       # Country codes for market context
      
      # ENHANCED FIELDS (optional but recommended)
      founding_year: 2015
      breakthrough_moment: "First Russian tea brand to export globally"
      credibility_signals: 
        - "Export certified"
        - "Heritage techniques"
      
      # STANDARD FIELDS (existing)
      description: "Traditional description for fallback"
      featured: true
      featured_level: 2                    # 1=featured, 2=premium
```

### 1.2 Step-by-Step Featured Content Update

**Step 1: Open the featured content file**
```bash
nano _data/featured_content.yml
```

**Step 2: Add strategic fields to each featured brand**

For each brand in your featured list, add these required fields:

```yaml
# BEFORE (old format)
- ref: "ru-teatime"
  title: "TeaTime"
  description: "Premium Russian tea company"
  featured: true

# AFTER (strategic format)
- ref: "ru-teatime"
  title: "TeaTime"
  permalink: "/en/brands/ru-teatime/"
  
  # Strategic content
  value_proposition: "Moscow's premium tea house bringing authentic Russian tea culture to global markets"
  founder_display_name: "Maria Kuznetsova"
  founder_role: "Founder & Master Tea Blender"
  
  # Business credibility
  key_metric:
    label: "International Markets"
    value: "8 Countries"
    period: "Since 2018"
  
  # Market positioning
  market: ["ru"]
  founding_year: 2015
  breakthrough_moment: "First Moscow tea house to achieve international certification"
  
  # Fallback
  description: "Premium Russian tea company specializing in traditional blends"
  featured: true
  featured_level: 2
```

**Step 3: Validate your changes**
```bash
bundle exec jekyll build --dry-run
```

### 1.3 Writing Effective Value Propositions

Your value proposition is the most important new field. It should answer "Why should I care?" in one compelling line.

**Formula:** [Location/Origin] + [Category] + [Unique Benefit] + [Market Opportunity]

**Examples:**
```yaml
# Good value propositions
value_proposition: "Brazil's leading artisanal coffee roaster bringing traditional fazenda methods to premium global markets"

value_proposition: "China's first digital-native beauty brand proving local innovation can compete with international giants"

value_proposition: "Ethiopia's heritage honey producer connecting ancient beekeeping traditions with modern export standards"

# Avoid these patterns
value_proposition: "We make great products"           # Too generic
value_proposition: "Leading company in our industry"  # No differentiation
value_proposition: "High quality Russian manufacturer" # No compelling benefit
```

**Templates by sector:**
```yaml
# Food & Beverage
value_proposition: "[Country]'s [heritage/innovative] [product] producer bringing [traditional/modern] [methods/flavors] to [global/premium] markets"

# Fashion & Beauty
value_proposition: "[Country]'s [category] [pioneer/leader] proving [local/cultural] [innovation/heritage] can compete with [international/luxury] brands"

# Manufacturing & Industry
value_proposition: "[Country]'s [category] specialist combining [traditional/advanced] expertise with [modern/export] capabilities for [global/B2B] expansion"
```

## Part 2: Brand Profile Enhancement

### 2.1 Updating Brand Markdown Files

Each brand profile in `_brands/{lang}/` needs strategic content fields added to the front matter.

**File location:** `_brands/en/ru-teatime.md`

**Enhanced front matter:**
```yaml
---
layout: brand-profile
title: "TeaTime"
slug: "ru-teatime"
lang: en
country_code: "ru"
permalink: /en/brands/ru-teatime/

# Existing taxonomy
sectors: ["specialty-teas"]
markets: ["russia"] 
attributes: ["heritage-brand", "artisanal-excellence"]
signals: ["export-ready"]

# NEW STRATEGIC CONTENT
value_proposition: "Moscow's premium tea house bringing authentic Russian tea culture to global markets"
founder_display_name: "Maria Kuznetsova"
founder_role: "Founder & Master Tea Blender"

# Business credibility
key_metric:
  label: "International Markets"
  value: "8 Countries"
  period: "Since 2018"

breakthrough_moment: "First Moscow tea house to achieve international certification"

# Enhanced business data (optional)
credibility_signals:
  - "Export certified"
  - "Heritage techniques"
  - "Family recipes"

# Business metrics (if available)
annual_revenue: "$2.5M"
employees: "25"
locations: "3"
export_markets: ["de", "fr", "us", "ca", "jp", "au", "se", "fi"]

# Images
images:
  hero: "hero-storefront.jpg"
  logo: "logo-main.jpg"
  founder: "founder-portrait.jpg"    # NEW: for founder integration
---

# Your existing brand content...
```

### 2.2 Founder Integration Fields

**Required for founder integration:**
- `founder_display_name`: Full name as it should appear on cards
- `founder_role`: Title/position (keep concise)
- `images.founder`: Path to founder image

**Optional but recommended:**
- `breakthrough_moment`: Key achievement or milestone
- `credibility_signals`: Array of trust indicators

### 2.3 Business Credibility Fields

Add these fields when data is available:

```yaml
# Scale indicators
annual_revenue: "$2.5M"      # Use consistent format
employees: "25"              # Number or range "20-50"
locations: "3"               # Physical locations

# Growth indicators
growth_rate: "150%"          # Year-over-year or period
market_share: "12%"          # In primary market
market_ranking: 3            # Position in market

# Export indicators
export_markets: ["de", "fr", "us"]  # Country codes
international_presence: true
certifications: ["ISO9001", "Organic", "Fair Trade"]
```

## Part 3: Case Study Enhancement

### 3.1 Updating Case Studies Data

**File:** `_data/case_studies.yml`

**Enhanced structure for each case study:**
```yaml
en:
  - slug: "brand-success-story"
    title: "Brand Name: Achievement Description"
    client: "Brand Name"
    industry: "Industry Category"
    
    # STRATEGIC FOUNDER INTEGRATION
    founder_name: "Full Founder Name"
    country: "country_code"
    country_context: "Market description for context"
    breakthrough_moment: "Key achievement or milestone"
    quote_snippet: "Memorable founder quote (keep under 15 words)"
    founder_portrait: "/path/to/founder-image.jpg"
    
    # Standard fields
    description: "Case study description"
    duration: "Project timeframe"
    permalink: "/en/case-studies/slug/"
    hero_image: "/path/to/hero.jpg"
    featured: true
    
    metrics:
      - label: "Revenue Growth"
        value: "300%"
        trend: "up"
      - label: "Market Expansion" 
        value: "12 Countries"
        trend: "up"
```

### 3.2 Writing Effective Case Study Content

**Breakthrough Moments:**
Focus on specific, measurable achievements:
```yaml
# Good breakthrough moments
breakthrough_moment: "First Chinese beauty brand to go public on NYSE"
breakthrough_moment: "Achieved carbon-neutral production across all facilities"
breakthrough_moment: "Expanded to 25 countries in 18 months"

# Avoid generic statements
breakthrough_moment: "Became very successful"
breakthrough_moment: "Grew the business significantly" 
```

**Quote Snippets:**
Keep quotes under 15 words and personality-driven:
```yaml
# Effective quotes
quote_snippet: "Product is king. Great products make great companies."
quote_snippet: "We wanted to change how young women think about beauty."
quote_snippet: "Africa can create world-class products that compete anywhere."

# Too long or generic
quote_snippet: "We are very proud of what we have accomplished and hope to continue growing our business in the future."
```

### 3.3 Founder Portrait Requirements

**Image specifications:**
- **Format:** JPG or PNG
- **Size:** 400x400px minimum (square aspect ratio)
- **Quality:** High resolution for overlay display
- **Background:** Professional setting preferred
- **Naming:** `founder-portrait-400.jpg`

**File placement:**
```
assets/images/case-studies/brand-slug/
├── hero.jpg
├── founder-portrait-400.jpg    # NEW
└── other-images.jpg
```

## Part 4: Insight Article Enhancement

### 4.1 Adding Market Context to Insights

**File location:** `_insights/{lang}/article-slug.md`

**Enhanced front matter:**
```yaml
---
layout: insight-article
title: "Article Title"
category: "brand-spotlight"  # or founders-journey, location-intelligence, market-momentum
lang: en
permalink: /en/insights/article-slug/

# NEW MARKET CONTEXT
primary_market: "ru"         # Country code for market context
read_time: 5                 # Reading time in minutes
author: "Author Name"        # For author display

# Enhanced metadata
excerpt: "Compelling summary that draws readers in"
featured: true
tags: ["relevant", "keywords"]

# Images
hero_image: "/assets/images/insights/article-slug/hero.jpg"
---

# Your article content...
```

### 4.2 Context-Specific CTA Optimization

The enhanced cards automatically generate context-specific CTAs based on category:

| Category | Generated CTA | Best Use Case |
|----------|---------------|---------------|
| `brand-spotlight` | "Discover Brand" | Brand feature articles |
| `founders-journey` | "Read Journey" | Founder story articles |
| `location-intelligence` | "Explore Market" | Market analysis articles |
| `market-momentum` | "View Analysis" | Industry trend articles |

**Choosing the right category:**
```yaml
# Use brand-spotlight for
category: "brand-spotlight"
title: "TeaTime: How Moscow's Tea House Conquered European Markets"

# Use founders-journey for
category: "founders-journey" 
title: "From Engineer to Beauty Mogul: Vineeta Singh's Digital Revolution"

# Use location-intelligence for
category: "location-intelligence"
title: "Why Ethiopia is Becoming Africa's Coffee Innovation Hub"

# Use market-momentum for
category: "market-momentum"
title: "BRICS+ Beauty Brands: The $50B Opportunity Investors Are Missing"
```

## Part 5: Founder Profile Enhancement

### 5.1 Strategic Founder Content

**File location:** `_founders/{lang}/founder-slug.md`

**Enhanced front matter:**
```yaml
---
layout: founder-profile
name: "Full Founder Name"
slug: "founder-slug"
lang: en
permalink: /en/founders/founder-slug/

# Location with market context support
location:
  city: "Moscow"
  country: "ru"              # Enables BRICS+ market context

# STRATEGIC ACHIEVEMENT HIGHLIGHTING
achievements:
  - "First Russian tea entrepreneur to achieve EU organic certification"
  - "Expanded family tea business to 8 international markets"
  - "Featured in Forbes 30 Under 30 Europe"

# Brand connections
brands: ["ru-teatime"]
role: "Founder & Master Tea Blender"

# Enhanced profile data
brief_bio: "Maria combines four generations of Russian tea expertise with modern business acumen to bring authentic Moscow tea culture to global markets."

expertise:
  - "Traditional Russian tea blending"
  - "International market expansion"
  - "Organic certification processes"
  - "Heritage brand development"

languages: ["ru", "en", "de"]
generation: "fourth"           # For family business context

# Images
images:
  headshot: "headshot-400.jpg" # For card display
  portrait: "portrait-800.jpg" # For profile page

# Contact information
contact:
  email: "founder@brand.com"
  linkedin: "linkedin-profile"
---

# Your founder content...
```

### 5.2 Writing Compelling Achievement Statements

**Formula:** [Specific accomplishment] + [Measurable impact] + [Industry recognition]

```yaml
# Effective achievements
achievements:
  - "First Ethiopian honey producer to achieve EU organic certification"
  - "Scaled artisanal ceramics studio to $5M annual revenue in 4 years"
  - "Featured as 'Emerging Market Innovator' by Financial Times"

# Avoid generic statements
achievements:
  - "Very successful entrepreneur"
  - "Built a great company"
  - "Respected in the industry"
```

### 5.3 Founder Image Requirements

**Headshot specifications:**
- **Format:** JPG preferred
- **Size:** 400x400px minimum (1:1 aspect ratio)
- **Quality:** Professional headshot
- **Background:** Clean, professional
- **Naming:** `headshot-400.jpg`

**Portrait specifications:**
- **Format:** JPG preferred
- **Size:** 800x1200px (2:3 aspect ratio)
- **Quality:** High resolution for profile pages
- **Style:** Professional or contextual (in workspace/environment)
- **Naming:** `portrait-800.jpg`

## Part 6: Translation Management

### 6.1 Maintaining Multilingual Consistency

**Required translation coverage:**
```yaml
# English (_data/translations/en.yml)
business_credibility:
  credentials: "Business Credentials"
  employees: "employees"
  revenue: "revenue"
  # ... all business terms

# Russian (_data/translations/ru.yml)  
business_credibility:
  credentials: "Бизнес-репутация"
  employees: "сотрудников"
  revenue: "выручка"
  # ... matching Russian terms

# Chinese (_data/translations/zh.yml)
business_credibility:
  credentials: "商业信誉"
  employees: "员工"
  revenue: "营收"
  # ... matching Chinese terms
```

### 6.2 Content Localization Strategy

**Value propositions:** Adapt for cultural context while maintaining core message
```yaml
# English
value_proposition: "Moscow's premium tea house bringing authentic Russian tea culture to global markets"

# Russian  
value_proposition: "Премиальный московский чайный дом, представляющий подлинную русскую чайную культуру на мировых рынках"

# Chinese
value_proposition: "莫斯科高端茶馆将正宗俄式茶文化带向全球市场"
```

**Breakthrough moments:** Localize context while keeping achievements consistent
```yaml
# English
breakthrough_moment: "First Moscow tea house to achieve international certification"

# Russian
breakthrough_moment: "Первый московский чайный дом с международной сертификацией"

# Chinese  
breakthrough_moment: "首家获得国际认证的莫斯科茶馆"
```

## Part 7: Validation and Testing

### 7.1 Content Validation Checklist

**Before publishing any updates:**

- [ ] **YAML syntax validation**
  ```bash
  bundle exec jekyll build --dry-run
  ```

- [ ] **Required fields present**
  - [ ] `value_proposition` for all featured brands
  - [ ] `founder_display_name` and `founder_role`
  - [ ] `key_metric` with label, value, period
  - [ ] `permalink` paths are correct

- [ ] **Translation consistency**
  ```bash
  # Check for missing translations
  grep -r "fallback" _site/ | grep -v "assets"
  ```

- [ ] **Image file validation**
  ```bash
  # Check that referenced images exist
  find assets/images -name "*founder*" -type f
  ```

### 7.2 Testing New Content

**Step 1: Build and serve locally**
```bash
bundle exec jekyll serve --livereload
```

**Step 2: Test card display**
- Navigate to pages with card components
- Verify strategic content displays correctly
- Check mobile responsiveness
- Test hover interactions

**Step 3: Cross-language validation**
- Test `/en/`, `/ru/`, and `/zh/` versions
- Verify translations display correctly
- Check for broken layouts

### 7.3 Common Issues and Solutions

**Issue: Cards showing fallback content**
```yaml
# Problem: Missing strategic fields
value_proposition: ""           # Empty value

# Solution: Add compelling content
value_proposition: "Moscow's premium tea house bringing authentic Russian tea culture to global markets"
```

**Issue: Broken images**
```yaml
# Problem: Incorrect path
images:
  founder: "founder.jpg"        # Missing path

# Solution: Full relative path
images:
  founder: "founder-portrait.jpg"  # Correct filename
```

**Issue: YAML parsing errors**
```yaml
# Problem: Unescaped quotes
value_proposition: "Brand's "premium" products"

# Solution: Escape quotes or use single quotes
value_proposition: "Brand's \"premium\" products"
# OR
value_proposition: 'Brand\'s "premium" products'
```

## Part 8: Ongoing Maintenance

### 8.1 Content Update Workflow

**Monthly review checklist:**
- [ ] Update featured content rotation
- [ ] Add new strategic fields to recent brands
- [ ] Review and update value propositions
- [ ] Check for new business metrics to add
- [ ] Validate image quality and update as needed

**Quarterly enhancement:**
- [ ] Analyze card performance metrics
- [ ] Update market context data
- [ ] Refresh breakthrough moments
- [ ] Add new credibility signals

### 8.2 Performance Monitoring

**Key metrics to track:**
- Card click-through rates by content type
- User engagement with strategic CTAs
- Mobile vs desktop interaction patterns
- Language-specific performance differences

**Jekyll build performance:**
```bash
# Monitor build time
time bundle exec jekyll build

# Target: <20 seconds for full build
# Target: <5 seconds for incremental
```

## Conclusion

This strategic content update transforms how Brandmine showcases BRICS+ brands by focusing on credibility, founder stories, and market opportunity. The enhanced card components require more strategic content preparation, but the result is a significantly more compelling user experience that answers "Why should I care?" immediately.

Remember: Every piece of content should reinforce the message that BRICS+ brands represent massive opportunity, not emerging market risk. Use specific metrics, founder credibility, and market scale to build this positioning consistently across all content types.

**Next Steps:**
1. Start with featured content updates for immediate impact
2. Gradually enhance brand profiles with strategic fields  
3. Add founder integration to case studies
4. Monitor performance and refine messaging based on user engagement

For questions or technical issues, refer to the implementation report or contact the development team.