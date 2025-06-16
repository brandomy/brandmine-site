# Insight Article Creation Tutorial

**Complete guide to creating rich insight articles in the Brandmine blog system**

---

## 🎯 Overview

Insight articles form Brandmine's full-featured blog platform, designed to share timely content that supports the mission of amplifying BRICS+ brand stories. The system features four standardized content categories, multilingual support, RSS feeds, pagination, and social sharing capabilities.

### "Logic Light" Architecture
Insight articles follow Brandmine's data-driven "Logic Light" philosophy:
- **Centralized configuration** via `_data/page_sections.yml` and `_data/component_defaults.yml`
- **Section-based rendering** using `helpers/page-sections.html`
- **Minimal template logic** with maximum configurability
- **Consistent component behavior** across all page types

### Blog Architecture Highlights
- **Four standardized categories** with specific content guidelines
- **Featured article system** for homepage hero display
- **Full blog functionality** with pagination, RSS, and social sharing
- **Multilingual support** across EN/RU/ZH
- **Cross-linking system** with brands and founders
- **Professional SEO** and performance optimization

---

## 🏗️ Insight Article Architecture

### Four Standardized Categories

**1. Brand Spotlight** (`brand_spotlight`)
- **Purpose**: In-depth profiles of noteworthy BRICS+ brands gaining international momentum
- **Recommended length**: 1500 words (7 minutes reading time)
- **Focus**: Brand story, differentiation, market positioning
- **Template**: `insight-article-brand-spotlight.md`

**2. Founder's Journey** (`founders_journey`)
- **Purpose**: Personal stories behind the brands and the visionaries who created them
- **Recommended length**: 2000 words (8 minutes reading time)
- **Focus**: Personal narrative, key decisions, challenges overcome
- **Template**: `insight-article-founders-journey.md`

**3. Market Momentum** (`market_momentum`)
- **Purpose**: Notable achievements, milestones, and expansion moments for emerging BRICS+ brands
- **Recommended length**: 1200 words (6 minutes reading time)
- **Focus**: Market dynamics, growth metrics, breakthrough moments
- **Template**: `insight-article-market-momentum.md`

**4. Location Intelligence** (`location_intelligence`)
- **Purpose**: Geographical insights and regional context that shape brand development
- **Recommended length**: 1800 words (8 minutes reading time)
- **Focus**: Geographic data, regional clustering, location trends
- **Template**: `insight-article-location-intelligence.md`

### Page Structure
```
Layout: insight-article.html → helpers/page-sections.html → pages/insight/[section].html
```

### Available Sections
- `breadcrumbs` - Navigation context
- `hero` - Article title and metadata
- `header` - Author information and publication details
- `featured-image` - Hero image display
- `content` - Main article markdown content
- `social-sharing` - Share buttons (LinkedIn, Twitter, Facebook, Email)
- `taxonomy` - Category and tag cloud
- `brand-info` - Referenced brand information
- `related-brands` - Connected brand profiles
- `related-insights` - Related articles

---

## 📝 Step-by-Step Tutorial: Creating "Russian Wine Renaissance" Article

### Step 1: Choose Category and Template

```bash
# For a brand spotlight article about Russian wine industry
cp _templates/insights/insight-article-brand-spotlight.md _insights/en/ru-russian-wine-renaissance.md
```

### Step 2: Configure Article Front Matter

Edit the article file with comprehensive front matter:

**File: `_insights/en/ru-russian-wine-renaissance.md`**
```yaml
---
layout: insight-article
ref: ru-russian-wine-renaissance
lang: en
title: "Russian Wine Renaissance: From Soviet Legacy to Global Recognition"
permalink: /en/insights/ru-russian-wine-renaissance/

# Content metadata
date: 2025-01-15
author: "research_team"
excerpt: "How Russian winemakers are transforming centuries-old traditions into internationally acclaimed wines, establishing new benchmarks for quality and innovation in unexpected terroirs."
category: "brand_spotlight"
reading_time: 7
word_count: 1500

# Display settings
featured: true     # Featured on homepage hero
premium: false
sample_data: false

# Images (semantic structure - standardized naming)
images:
  hero:
    name: "vineyard"    # Context-aware: vineyard, corridor, ceremony, market
    alt: "Russian vineyards in Krasnodar region showing modern viticulture techniques"
    ext: "jpg"
  founder:
    name: "portrait"    # Generic: portrait (standardized across all content)
    alt: "Anna Kuznetsova, founder of Krasnodar Wines"
    ext: "jpg"
  logo:
    name: "russian-wine"  # Brand-specific: keep actual brand names for logos
    alt: "Russian wine logo"
    ext: "png"

# Cross-linking (use exact slugs)
brands: ["ru-kuban-estates", "ru-abrau-durso", "ru-fanagoria"]
founders: ["ru-viktor-drachev", "ru-pavel-titov"]

# Taxonomy (use exact dimension slugs)
sectors: ["wine"]
markets: ["russia"]
attributes: ["heritage-brand", "innovation-leader"]
signals: ["export-ready", "rapid-growth"]

# === SECTIONS ===
# Section order controlled by _data/page_sections.yml based on layout type
# No sections: array needed in front matter - uses centralized configuration

# Available sections for this content type:
# - breadcrumbs, hero, header, featured-image, content, social-sharing, taxonomy, brand-info, related-brands, related-insights

# SEO optimization
description: "Discover how Russian winemakers are transforming ancient traditions into globally recognized wines, establishing new quality benchmarks in unexpected terroirs."
keywords: ["Russian wine", "BRICS wine industry", "premium winemaking", "terroir", "wine innovation"]

# Social media
social_image: "/assets/images/insights/ru-russian-wine-renaissance/hero-1200w.jpg"
---

# Russian Wine Renaissance: From Soviet Legacy to Global Recognition

*How a new generation of Russian winemakers is transforming centuries-old traditions into internationally acclaimed wines, establishing unexpected terroirs as global benchmarks for quality and innovation.*

The rolling hills of Russia's Black Sea coast tell a story of remarkable transformation. Where Soviet-era collective vineyards once prioritized quantity over quality, a new generation of passionate winemakers is crafting wines that compete on the world stage, winning international awards and changing global perceptions of Russian viticulture.

## Breaking Historical Assumptions

For decades, Russian wine meant sweet, fortified beverages more suited to ceremonial toasts than fine dining. The Soviet system's focus on volume production left Russian wines with a reputation that persisted long after the political system that created it had collapsed.

"When I tell sommeliers in London or New York that we make serious wine in Russia, I see the surprise in their eyes," explains **Viktor Drachev**, founder of Kuban Estates. "But once they taste our Pinot Noir from the Taman Peninsula, that surprise turns to genuine interest."

This transformation didn't happen overnight. It required a fundamental shift in philosophy, from industrial agriculture to artisanal winemaking, from domestic consumption to international standards.

## The Terroir Revolution

### Discovering Hidden Potential

Russia's winemaking regions, primarily concentrated in the southern territories of Krasnodar Krai, Stavropol, and Rostov, benefit from unique microclimates that create unexpected opportunities for premium viticulture.

The **Taman Peninsula**, surrounded by the Black Sea and Sea of Azov, offers limestone-rich soils similar to those found in Burgundy. The maritime influence provides the temperature moderation essential for developing complex flavors in both red and white varietals.

**Key Terroir Advantages:**
- **Maritime Climate**: Black Sea influence moderates extreme temperatures
- **Limestone Soils**: Excellent drainage and mineral complexity
- **Extended Growing Season**: Long, warm autumns allow for optimal ripening
- **Elevation Variation**: Hillside vineyards benefit from ideal sun exposure

### Pioneering Modern Techniques

Leading Russian wineries have invested heavily in modern equipment and techniques while respecting traditional knowledge passed down through generations of local winemakers.

**Abrau-Durso**, Russia's oldest sparkling wine producer (established 1870), exemplifies this balanced approach. Their new facility combines cutting-edge fermentation technology with traditional bottle aging in underground cellars carved into limestone cliffs.

## Brand Spotlight: Leading the Renaissance

### Kuban Estates: Boutique Excellence

Founded in 2008 by Viktor Drachev, Kuban Estates represents the artisanal end of Russian winemaking. Their limited production focuses on single-vineyard expressions that showcase specific terroirs within the Taman Peninsula.

**Signature Achievement**: Their 2019 Pinot Noir won Bronze at the Decanter World Wine Awards, the first Russian still wine to receive international recognition in over two decades.

### Fanagoria: Scale with Quality

At the other end of the spectrum, Fanagoria demonstrates that quality doesn't require sacrificing scale. This family-owned winery produces over 20 million bottles annually while maintaining strict quality standards throughout their range.

**Innovation Focus**: Fanagoria has pioneered sustainable viticulture practices in Russia, including organic certification for 15% of their vineyards and experimental biodynamic farming methods.

### Abrau-Durso: Heritage Meets Innovation

The grand dame of Russian winemaking continues to evolve. While maintaining their historical reputation for premium sparkling wines, Abrau-Durso has expanded into still wines that compete internationally.

**Global Recognition**: Their Imperial Brut received 91 points from Wine Spectator, establishing Russian sparkling wine as a serious category worthy of international attention.

## Market Momentum: Export Success Stories

### International Breakthrough

Russian wine exports have grown 340% since 2015, though from a small base. The key markets showing strong growth include:

- **China**: 45% of Russian wine exports, driven by luxury positioning
- **Germany**: Premium restaurant and retail channels
- **United Kingdom**: Specialty wine shops and sommelier programs
- **United States**: Limited but growing presence in major metropolitan areas

### Premium Positioning Strategy

Russian winemakers have deliberately positioned their products in the premium segment, avoiding competition with mass-market wines. This strategy leverages the novelty factor while building a reputation for quality.

**Price Points:**
- Domestic market: $15-45 per bottle for premium wines
- Export markets: $25-80 per bottle, competing with established European wines
- Ultra-premium selections: $100+ for reserve and limited editions

## Innovation and Sustainability

### Climate Change Adaptation

Russian winemakers are turning climate change challenges into opportunities. Warmer temperatures have extended the viable growing season and allowed experimentation with grape varieties previously impossible in the region.

**New Varietals Being Tested:**
- Syrah and Grenache (traditionally Mediterranean varieties)
- Italian varietals like Sangiovese and Nebbiolo
- Hybrid varieties developed for cold-climate resilience

### Sustainable Practices

Environmental consciousness drives many operational decisions:

- **Water Management**: Advanced irrigation systems reduce water usage by 30%
- **Organic Farming**: Growing percentage of certified organic vineyards
- **Carbon Footprint**: Local production reduces transportation-related emissions for domestic consumption
- **Biodiversity**: Cover crops and natural pest management preserve ecosystem health

## Challenges and Opportunities

### Overcoming Perceptions

The biggest challenge remains changing global perceptions of Russian wine quality. This requires consistent international marketing and continued quality improvements.

**Strategies Being Employed:**
- International sommelier education programs
- Participation in major wine competitions
- Strategic partnerships with respected wine importers
- Food and wine pairing showcases in key markets

### Investment in Infrastructure

Many Russian wineries are family-owned businesses that require significant capital investment to compete internationally. Government support programs and private investment are helping bridge this gap.

## The Next Chapter

As Russian winemakers continue to refine their craft and expand international presence, the renaissance shows no signs of slowing. New wineries are establishing operations, existing producers are increasing quality standards, and international recognition is growing.

The story of Russian wine renaissance represents broader themes of transformation, quality focus, and global ambition that characterize the best of BRICS+ entrepreneurship. These winemakers are not just producing beverages—they're crafting cultural ambassadors that tell the story of modern Russia's commitment to excellence and innovation.

**Key Takeaways for Entrepreneurs:**
- Quality over quantity can transform entire industry perceptions
- Geographic disadvantages can become competitive advantages
- International recognition requires sustained commitment to excellence
- Traditional knowledge combined with modern techniques creates differentiation
- Export success requires premium positioning and consistent quality

As these Russian wines grace tables from Moscow to Manhattan, they carry with them the ambitions of a new generation of entrepreneurs determined to rewrite their industry's narrative on the global stage.

---

*This article is part of Brandmine's Brand Spotlight series, highlighting exceptional BRICS+ brands that are redefining their industries through innovation, quality, and international ambition.*
```

**File: `_insights/ru/ru-russian-wine-renaissance.md`**
```yaml
---
layout: insight-article
ref: ru-russian-wine-renaissance
lang: ru
title: "Ренессанс российского виноделия: От советского наследия к мировому признанию"
permalink: /ru/insights/ru-russian-wine-renaissance/

# [Same structure as EN with Russian translations]
date: 2025-01-15
author: "research_team"
excerpt: "Как российские виноделы превращают многовековые традиции в признанные на международном уровне вина, устанавливая новые стандарты качества и инноваций в неожиданных терруарах."
category: "brand_spotlight"
reading_time: 7
word_count: 1500

featured: true
brands: ["ru-kuban-estates", "ru-abrau-durso", "ru-fanagoria"]
founders: ["ru-viktor-drachev", "ru-pavel-titov"]
sectors: ["wine"]
markets: ["russia"]
attributes: ["heritage-brand", "innovation-leader"]
signals: ["export-ready", "rapid-growth"]

# [Russian content translation...]
---

# Ренессанс российского виноделия: От советского наследия к мировому признанию

[Russian content translation...]
```

**File: `_insights/zh/ru-russian-wine-renaissance.md`**
```yaml
---
layout: insight-article
ref: ru-russian-wine-renaissance
lang: zh
title: "俄罗斯葡萄酒复兴：从苏联遗产到全球认可"
permalink: /zh/insights/ru-russian-wine-renaissance/

# [Same structure with Chinese translations]
date: 2025-01-15
author: "research_team"
excerpt: "俄罗斯酿酒师如何将数百年的传统转化为国际认可的葡萄酒，在意想不到的风土中建立质量和创新的新基准。"
category: "brand_spotlight"
reading_time: 7
word_count: 1500

featured: true
brands: ["ru-kuban-estates", "ru-abrau-durso", "ru-fanagoria"]
founders: ["ru-viktor-drachev", "ru-pavel-titov"]
sectors: ["wine"]
markets: ["russia"]
attributes: ["heritage-brand", "innovation-leader"]
signals: ["export-ready", "rapid-growth"]

# [Chinese content translation...]
---

# 俄罗斯葡萄酒复兴：从苏联遗产到全球认可

[Chinese content translation...]
```

### Step 3: Set Up Image Structure

Create image directories:
```bash
mkdir -p assets/images/insights/ru-russian-wine-renaissance/originals/
```

Add source images following Brandmine standards:
- `hero-vineyard.jpg` - 3:2 aspect ratio (1200×800px), JPG for featured display (context-aware naming)
- `founder-portrait.jpg` - 2:3 aspect ratio for founder portraits (generic naming)
- `logo-russian-wine.png` - 1:1 aspect ratio for brand logos (brand-specific naming)

### Step 4: Process Images

```bash
# Process all insight images with responsive versions
_scripts/core/process_images.sh insights ru-russian-wine-renaissance
```

This generates:
- `hero-vineyard-400w.jpg`, `hero-vineyard-800w.jpg`, `hero-vineyard-1200w.jpg`
- `founder-portrait-400w.jpg`, `founder-portrait-800w.jpg`, `founder-portrait-1200w.jpg`
- `logo-russian-wine-400w.png`, `logo-russian-wine-800w.png`, `logo-russian-wine-1200w.png`

### Step 5: Update Data Indexes

```bash
# Generate updated insights JSON index
python3 _scripts/core/generate-all-json.py
```

This updates `_data/insights.json` with your new article.

### Step 6: Test Featured Article Display

Since `featured: true` is set, this article will appear as the hero on the insights homepage. Only one article should be featured at a time.

---

## 🎛️ Section Control Guide

### Core Sections (Always Include)
- `breadcrumbs` - Navigation context
- `hero` - Article title and metadata
- `content` - Main article content

### Enhancement Sections
- `header` - Author information and publication details
- `featured-image` - Hero image display
- `social-sharing` - Share buttons for social media
- `taxonomy` - Category badge and tag cloud

### Relationship Sections
- `brand-info` - Referenced brand information cards
- `related-brands` - Connected brand profiles
- `related-insights` - Related articles and content

### Section Order Best Practices
**Section order is automatically controlled by `_data/page_sections.yml` for the `insight-article` layout type:**

1. **breadcrumbs** - Always first (navigation context)
2. **hero** - Article title and metadata
3. **header** - Author information and publication details
4. **featured-image** - Hero image display
5. **content** - Main article markdown content
6. **social-sharing** - Share buttons for social media
7. **taxonomy** - Category badge and tag cloud
8. **brand-info** - Referenced brand information cards
9. **related-brands** - Connected brand profiles
10. **related-insights** - Related articles and content

**No configuration needed** - the system automatically renders sections in optimal order for mobile-first design.

---

## 🏗️ Architecture Note: "Logic Light" Section Control

Brandmine uses a sophisticated **centralized section control system** that eliminates complexity while maintaining full configurability:

### How It Works
- **Section order** is controlled by `_data/page_sections.yml` based on your layout type
- **Component behavior** is configured in `_data/component_defaults.yml`
- **No template logic** required in individual content files
- **Consistent rendering** across all content types

### Benefits
- **70% faster builds** (reduced from 40+ seconds to 12-13 seconds)
- **Zero section configuration** needed in front matter
- **Consistent behavior** across all content types
- **Easy maintenance** - change section order globally in one file
- **Mobile-first guarantee** - linear flow ensures consistent mobile behavior

### Performance Achievements
The "Logic Light" architecture delivers measurable benefits:

- **Build Time**: 70% reduction (from 40+ seconds to 12-13 seconds)
- **Template Complexity**: 90% reduction in conditional logic
- **Maintenance Overhead**: Centralized configuration eliminates scattered section management
- **Mobile Consistency**: Linear layout ensures optimal mobile behavior without responsive complexity
- **Developer Experience**: Content creators focus on content, not configuration

**Real-World Impact**: These optimizations enable rapid content creation while maintaining sophisticated functionality across three languages and multiple content types.

### What This Means for Content Creators
You don't need to specify `sections:` arrays in your front matter. Simply use the correct layout type, and the system automatically renders the appropriate sections in the optimal order.

---

## 📋 Required Front Matter Fields

### Essential Fields
```yaml
layout: insight-article     # Required: layout type
ref: article-slug          # Required: global article ID for language switching
lang: en                   # Required: language code
title: "Article Title"     # Required: display title
permalink: /en/insights/article-slug/  # Required: full URL path

# Content metadata
date: 2025-01-15          # Required: publication date
author: "author_key"      # Required: author identifier
excerpt: "Brief summary"  # Required: article summary (150-200 chars)
category: "brand_spotlight" # Required: one of four categories
reading_time: 7           # Required: estimated reading time
word_count: 1500          # Required: approximate word count
```

### Enhancement Fields
```yaml
# Display settings
featured: false           # Set true for homepage hero
premium: false           # Premium content flag
sample_data: false       # Mark as sample/demo content

# Images (standardized structure)
images:
  hero:
    name: "vineyard"      # Context-aware: vineyard, corridor, ceremony, market
    alt: "Hero image description"
    ext: "jpg"
  founder:
    name: "portrait"      # Generic: portrait (standardized across all content)
    alt: "Founder portrait description"
    ext: "jpg"
  logo:
    name: "brand-name"    # Brand-specific: keep actual brand names
    alt: "Brand logo description"
    ext: "png"

# Cross-linking
brands: ["brand-slug"]   # Referenced brands
founders: ["founder-id"] # Referenced founders

# Taxonomy (use exact dimension slugs)
sectors: ["wine", "gourmet-foods"]
markets: ["russia", "china"]
attributes: ["founder-led", "heritage-brand"]
signals: ["export-ready", "rapid-growth"]

# SEO optimization
description: "Meta description for search engines"
keywords: ["keyword1", "keyword2", "keyword3"]
social_image: "/assets/images/insights/article/hero-1200w.jpg"

# === SECTIONS ===
# Section order controlled by _data/page_sections.yml based on layout type
# No sections: array needed in front matter - uses centralized configuration

# Available sections for this content type:
# - breadcrumbs, hero, header, featured-image, content, social-sharing, taxonomy, brand-info, related-brands, related-insights
```

---

## 📚 Four Category Guidelines

### Brand Spotlight
**Focus**: In-depth brand analysis and positioning
**Content Structure**:
- Brand history and evolution
- Market differentiation
- Product innovation
- Growth strategies
- International expansion

**Example Topics**:
- "How Russian Tea Masters Are Conquering Asian Markets"
- "Brazilian Organic Beauty: Global Expansion Strategy"
- "Chinese Artisan Ceramics: Premium Positioning Success"

### Founder's Journey
**Focus**: Personal narratives and entrepreneurial insights
**Content Structure**:
- Early life and inspiration
- Key decision points
- Challenges overcome
- Lessons learned
- Vision for the future

**Example Topics**:
- "From Family Recipe to Global Brand: A Founder's 20-Year Journey"
- "Third-Generation Entrepreneur: Modernizing Ancient Traditions"
- "Cross-Border Success: How One Founder Bridged Three Markets"

### Market Momentum
**Focus**: Market dynamics and breakthrough moments
**Content Structure**:
- Market analysis and trends
- Growth metrics and milestones
- Competitive landscape
- Success factors
- Future opportunities

**Example Topics**:
- "BRICS+ Natural Beauty: $2.3B Market Reaches Tipping Point"
- "Export Breakthrough: Russian Brands Achieve 40% Growth"
- "Investment Surge: Premium Food Brands Attract Global Capital"

### Location Intelligence
**Focus**: Geographic insights and regional trends
**Content Structure**:
- Regional market analysis
- Geographic clustering
- Cultural influences
- Trade relationships
- Infrastructure impact

**Example Topics**:
- "The Silk Road Effect: How Geography Shapes Brand Success"
- "Black Sea Corridor: Emerging Trade Route for Premium Brands"
- "Urban vs. Rural: Location Impact on BRICS+ Brand Development"

---

## 🖼️ Image Standards & Processing

### Image Types & Specifications

**Hero Images (Featured Display)**
- **Aspect ratio**: 3:2 horizontal
- **Source size**: 1200×800px minimum
- **Format**: JPG
- **Style**: Textured Minimalism (TM)
- **Naming**: `hero-[context-aware-description].jpg` (e.g., vineyard, corridor, ceremony, market)
- **Usage**: Article hero, social sharing, featured displays

**Founder Portrait Images**
- **Aspect ratio**: 2:3 vertical  
- **Source size**: 800×1200px minimum
- **Format**: JPG
- **Style**: Natural photography with teal filter
- **Naming**: `founder-portrait.jpg` (generic naming for all founders)
- **Usage**: Founder references within articles

**Logo Images**
- **Aspect ratio**: 1:1 square
- **Source size**: 512×512px minimum  
- **Format**: PNG with transparency
- **Style**: Brand-specific design
- **Naming**: `logo-[brand-name].png` (brand-specific naming)
- **Usage**: Brand references, article logos

### Image Processing Workflow

1. **Place originals** in `assets/images/insights/[article-slug]/originals/`
2. **Run processing script**: `_scripts/core/process_images.sh insights [article-slug]`
3. **Verify outputs** with responsive versions (400w, 800w, 1200w)

### Visual Style Guidelines

- **Textured Minimalism (TM)**: Hero images, primary storytelling
- **Natural Photography + Teal Filter**: Founder portraits, supporting visuals
- **Consistent branding**: All images follow Brandmine aesthetic standards

### Image Naming Standardization

**CRITICAL: Front Matter Key Standardization**
Always use `founder:` (not `founder_portrait:`) for consistency with other content types:

```yaml
# ✅ CORRECT - Standardized key
images:
  founder:
    name: "portrait"
    
# ❌ INCORRECT - Legacy key  
images:
  founder_portrait:
    name: "portrait"
```

**Context-Aware Hero Naming Strategy**: Use semantic descriptions that focus on the scene/content:

**✅ Good Examples:**
- `hero: name: "vineyard"` (describes the scene)
- `hero: name: "corridor"` (describes the space/concept)
- `hero: name: "ceremony"` (describes the activity)
- `hero: name: "market"` (describes the setting)

**❌ Avoid Location-Specific Names:**
- `hero: name: "krasnodar-vineyard"` (too location-specific)
- `hero: name: "siberian-honey"` (location redundant with context)
- `hero: name: "moscow-spice-market"` (location already implied)

**Generic Founder Naming**: All founder portraits use the same name for consistency:
```yaml
founder:
  name: "portrait"    # ✅ Always use "portrait" for all founders
```

**Cross-Language Consistency**: All three language versions (EN/RU/ZH) must use identical image names:
```yaml
# _insights/en/article.md
hero: name: "vineyard"
founder: name: "portrait"

# _insights/ru/article.md  
hero: name: "vineyard"    # ✅ Same names
founder: name: "portrait"

# _insights/zh/article.md
hero: name: "vineyard"    # ✅ Same names
founder: name: "portrait"
```

---

## 🌐 Blog Functionality

### Featured Article System

**Homepage Hero Display**:
- Set `featured: true` in one article's front matter
- Only one article should be featured at a time
- Featured article displays on insights homepage hero
- Automatic fallback to most recent article if no featured article

**Featured Article Management**:
```bash
# To feature a new article, update the old featured article:
# Change featured: true to featured: false in previous article
# Set featured: true in new article
```

### RSS Feed

**Configuration**: Enable in `_config.yml`:
```yaml
enable_insights_feed: true
```

**Feed URL**: `/feed/insights.xml`
**Features**:
- Last 20 articles included
- Multilingual content support
- Category and author metadata
- Full content or excerpt options

### Pagination

**Client-Side Pagination**:
- 12 articles per page by default
- JavaScript-powered navigation
- Responsive pagination controls
- Filter integration support
- Category-specific pagination

### Category Navigation

**Filter Interface**:
- Horizontal category filter bar
- Dynamic article counting per category
- Responsive design for mobile
- Integration with pagination system

### Social Sharing

**Supported Platforms**:
- LinkedIn (professional audience)
- Twitter (quick sharing)
- Facebook (broader reach)
- Email (direct sharing)

**Implementation**:
```liquid
{% comment %} Uses centralized component defaults {% endcomment %}
{% include pages/insight/social-sharing.html %}

{% comment %} Component behavior configured in _data/component_defaults.yml {% endcomment %}
{% comment %} Override defaults with include parameters as needed {% endcomment %}
```

---

## 🔗 Cross-Linking System

### Brand References
```yaml
# In article front matter
brands: ["ru-teatime", "ru-herbal-harmony"]
```

**Display**: `brand-info` section shows brand cards with:
- Brand logos and descriptions
- Taxonomy tags
- Links to full brand profiles

### Founder References
```yaml
# In article front matter
founders: ["ru-alexei-sokolov", "ru-maria-petrov"]
```

**Display**: Inline founder mentions with:
- Founder portraits and names
- Position and company
- Links to full founder profiles

### Related Articles

**Automatic Connections**: Based on shared:
- Categories
- Referenced brands/founders
- Taxonomy overlap (sectors, markets, attributes, signals)

**Manual Connections**: Can be specified in front matter if needed

---

## 🧪 Testing & Validation

### Build and Test
```bash
# Start development server
bundle exec jekyll serve --livereload

# Test URLs
# EN: http://localhost:4000/en/insights/ru-russian-wine-renaissance/
# RU: http://localhost:4000/ru/insights/ru-russian-wine-renaissance/
# ZH: http://localhost:4000/zh/insights/ru-russian-wine-renaissance/

# Test blog homepage
# http://localhost:4000/en/insights/
```

### Validation Checks
```bash
# Validate YAML syntax
_scripts/validation/validate_yaml.sh

# Check language consistency
_scripts/validation/language_consistency_checker.py

# Validate brand/founder cross-references
python3 _scripts/core/generate-all-json.py

# Run full validation suite
_scripts/core/pre-commit_check.sh
```

### Quality Checklist
- [ ] Article created in all three languages
- [ ] Front matter validates successfully
- [ ] Category is one of four approved options
- [ ] Word count matches category guidelines
- [ ] Images processed and responsive
- [ ] **Image names identical across all languages**
- [ ] **Uses `founder:` key (not `founder_portrait:`)**
- [ ] **Hero names use context-aware patterns (vineyard, corridor, ceremony)**
- [ ] **Founder images use generic "portrait" naming**
- [ ] Cross-references exist (brands/founders)
- [ ] Featured article setting managed properly
- [ ] Content renders correctly in all sections
- [ ] Social sharing works
- [ ] SEO metadata complete

### Architecture Validation
```bash
# Verify no legacy section arrays (should return 0)
grep -r "sections:" _insights/ | wc -l

# Confirm centralized section control
cat _data/page_sections.yml | grep -A 15 "insight-article:"

# Check component defaults configuration
cat _data/component_defaults.yml | grep -A 10 "cards:"
```

### Image Standardization Validation
```bash
# Check cross-language image consistency for insights
grep -A 6 "images:" _insights/en/article-slug.md _insights/ru/article-slug.md _insights/zh/article-slug.md

# Verify correct key usage (should show "founder:", not "founder_portrait:")
grep -r "founder:" _insights/en/ | wc -l
grep -r "founder_portrait:" _insights/en/ | wc -l  # Should be 0

# Verify context-aware hero naming
grep -r "hero:" _insights/en/ | grep "name:"

# Check for location-specific names (should find none)
grep -r "krasnodar\|siberian\|moscow" _insights/*/
```

---

## 🚀 Advanced Features

### Premium Content
```yaml
premium: true
```
Marks content for potential paywall or membership features.

### Author System
```yaml
author: "research_team"
```
References author data in `_data/authors.yml` for author bio display.

### Custom Section Content
Override default sections by creating:
- `_includes/pages/insight/content-featured.html` for featured article content
- `_includes/pages/insight/brand-info-spotlight.html` for brand spotlight specific displays

### Analytics Integration
Articles automatically include:
- Google Analytics tracking
- Reading time measurement
- Social sharing analytics
- Category performance metrics

---

## 📋 Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| Article not showing in category | Check category field matches approved values |
| Featured article not displaying | Only one article can be featured at a time |
| Images not displaying | Check file paths and run image processing |
| Cross-references broken | Validate brand/founder slugs exist |
| RSS feed not updating | Check enable_insights_feed config |
| Pagination not working | Verify JavaScript files are loading |

### Debug Commands
```bash
# Check article structure
find _insights/ -name "*.md" | head -10

# Verify category values
grep -r "category:" _insights/en/ | head -5

# Test image paths
ls assets/images/insights/article-slug/

# Check featured articles
grep -r "featured: true" _insights/en/
```

---

## 📚 Reference Files

### Key Templates
- **Enhanced template**: `_templates/insights/insight-template-enhanced.md`
- **Category templates**: `_templates/insights/insight-article-[category].md`
- **Layout**: `_layouts/insight-article.html`
- **Blog layout**: `_layouts/insights.html`

### Component Files
- **Article sections**: `_includes/pages/insight/[section].html`
- **Blog sections**: `_includes/pages/insights/[section].html`
- **Card components**: `_includes/components/cards/insight-card.html`

### Configuration Files
- **Category definitions**: `_data/insights/{lang}.yml`
- **Page sections**: `_data/page_sections.yml`
- **Author data**: `_data/authors.yml`

### Scripts
- **Image processing**: `_scripts/core/process_images.sh`
- **JSON generation**: `_scripts/core/generate-all-json.py`
- **Template generator**: `_scripts/content-creation/generate_article_template.py`

This comprehensive tutorial provides everything needed to create professional insight articles that leverage Brandmine's full blog functionality while maintaining consistency across languages and delivering value to readers interested in BRICS+ brand stories.