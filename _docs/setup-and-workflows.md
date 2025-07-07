# Setup and Workflows Guide

**Complete workflow consolidation for content creation and development**

---

## 🚀 Environment Setup

### Prerequisites
```bash
# Verify required tools
ruby --version        # 2.7+ required
bundle --version      # Bundler gem manager
node --version        # 16+ recommended (for scripts)
python3 --version     # 3.8+ (for automation scripts)
```

### Installation Steps
```bash
# 1. Install Jekyll and Ruby dependencies
bundle install

# 2. Install Node.js dependencies (for scripts)
npm install

# 3. Start development server
bundle exec jekyll serve --livereload

# 4. Verify installation
open http://localhost:4000
```

### Development Commands
```bash
# Development server with live reload
bundle exec jekyll serve --livereload

# Mobile testing (access from other devices)
bundle exec jekyll serve --host=0.0.0.0

# Production build (target: <15 seconds)
JEKYLL_ENV=production bundle exec jekyll build

# Complete validation suite (includes section margin validation)
_scripts/core/pre-commit_check.sh

# Section margin compliance check
_scripts/validation/check_section_margins.sh
```

---

## 🔍 Section Spacing Compliance

### Daily Development Workflow

**Always use internal spacing (padding) for sections:**
```scss
/* ✅ CORRECT - Creates seamless section flow */
.my-section {
  padding-bottom: var(--space-4);
}

/* ❌ INCORRECT - Creates unwanted gaps */
.my-section {
  margin-bottom: var(--space-4);
}
```

### Validation Commands
```bash
# Check current section margin compliance
_scripts/validation/check_section_margins.sh

# Monthly compliance audit with detailed breakdown
_scripts/utilities/section_margin_audit.sh

# Update documentation with current violation statistics
_scripts/utilities/update_violation_docs.sh

# Full pre-commit validation (includes section margins)
_scripts/core/pre-commit_check.sh
```

### Standards Achievement
- **85% site-wide cleanup** completed (595 → 87 violations)
- **100% page consistency** across all user touchpoints
- **Automated prevention** system active via pre-commit hooks
- **6x better success rate** on page-level vs component-level cleanup

### Architecture Benefits
- **Professional presentation** on every customer-facing page
- **Consistent visual rhythm** across all content types
- **Seamless section flow** without artificial spacing gaps
- **Sustainable quality** through automated monitoring

---

## 📝 Content Creation Workflows

### Brand Creation Workflow

**Time Target: 20 minutes end-to-end**

#### Step 1: Generate Template Files
```bash
# Create template files in all languages
python3 _scripts/content-creation/generate_brand_template.py [country-code] [brand-name]

# Example: Russian tea brand
python3 _scripts/content-creation/generate_brand_template.py ru teatime

# This creates:
# _brands/en/ru-teatime.md
# _brands/ru/ru-teatime.md
# _brands/zh/ru-teatime.md
```

#### Step 2: Configure Brand Front Matter
```yaml
---
layout: brand-profile
title: "TeaTime"
ref: "ru-teatime"
lang: en
country_code: "ru"
permalink: /en/brands/ru-teatime/

# Location and contact
location: "Moscow, Russia"
coordinates: [55.7558, 37.6176]
website: "https://teatime.ru"
contact_email: "contact@teatime.ru"

# Taxonomy (use existing dimension slugs only)
sectors: ["artisanal-spirits"]
markets: ["russia"]
attributes: ["founder-led", "heritage-brand"]
signals: ["export-ready"]

# Standardized image structure
images:
  hero:
    name: "storefront"     # Scene only
    alt: "TeaTime's flagship tearoom in Moscow's historic Arbat district"
    ext: "jpg"
  logo:
    name: "color"          # Variant only
    alt: "TeaTime logo featuring elegant Cyrillic lettering"
    ext: "png"
  founder:
    name: "formal"         # Context only
    alt: "Alexei Sokolov, founder of TeaTime"
    ext: "jpg"

# Business data
founding_year: 2018
employee_count: "25-50"
annual_revenue: "$500K-$1M"
export_markets: ["Kazakhstan", "Belarus"]

# SEO
description: "Premium Russian tea house bringing traditional ceremonies to modern Moscow"
featured: false
---

# Brand Story Content

Your rich markdown content here...
```

#### Step 3: Add Images
```bash
# Create directory and add originals
mkdir -p assets/images/brands/ru-teatime/originals

# Add images following context-aware naming:
# - hero-storefront.jpg (scene only)
# - logo-color.png (variant only)
# - founder-formal.jpg (context only)

# Process all images
_scripts/core/process_images.sh brands ru-teatime
```

#### Step 4: Validate and Test
```bash
# Run complete validation
_scripts/core/pre-commit_check.sh

# Test all languages work correctly
open http://localhost:4000/en/brands/ru-teatime/
open http://localhost:4000/ru/brands/ru-teatime/
open http://localhost:4000/zh/brands/ru-teatime/
```

---

### Founder Profile Workflow

**Time Target: 15 minutes end-to-end**

#### Step 1: Generate Template Files
```bash
# Create founder profile templates
python3 _scripts/content-creation/generate_article_template.py founder ru-alexei-sokolov

# This creates trilingual founder profiles
```

#### Step 2: Configure Founder Front Matter
```yaml
---
layout: founder-profile
title: "Alexei Sokolov"
ref: "ru-alexei-sokolov"
lang: en
permalink: /en/founders/ru-alexei-sokolov/

# Basic information
position: "Founder & CEO"
company: "TeaTime"
location: "Moscow, Russia"
generation: "2nd"  # 1st, 2nd, 3rd, Transition

# Professional details
languages: ["Russian", "English", "Chinese"]
markets_of_expertise: ["russia", "central-asia"]
professional_background: "Hospitality & Cultural Heritage"
achievements: ["Heritage Preservation Award 2023", "Young Entrepreneur Moscow 2022"]

# Social media
linkedin: "https://linkedin.com/in/alexei-sokolov"
instagram: "@teatime_moscow"

# Standardized image structure
portrait_image: true
images:
  portrait:
    name: "formal"         # Context/role only
    alt: "Alexei Sokolov preparing traditional Russian tea ceremony"
    ext: "jpg"
  headshot:
    name: "business"       # Style only
    alt: "Professional headshot of Alexei Sokolov"
    ext: "jpg"

# Brand associations
associated_brands: ["ru-teatime"]

# Skills/expertise cloud
expertise_tags: ["Traditional Tea Ceremonies", "Russian Heritage", "Hospitality Management", "Cultural Preservation"]

# SEO
description: "Second-generation entrepreneur revitalizing Russian tea culture in Moscow"
---

# Founder Story Content

Personal narrative and journey content...
```

---

### Insight Article Workflow

**Time Target: 25 minutes end-to-end**

#### Step 1: Choose Category and Generate Template
```bash
# Four standardized categories available:
# - brand_spotlight (1500 words, 7 min read)
# - founders_journey (2000 words, 8 min read)
# - market_momentum (1200 words, 6 min read)
# - location_intelligence (1800 words, 8 min read)

python3 _scripts/content-creation/generate_insight_template.py market_momentum ru-wine-renaissance
```

#### Step 2: Configure Article Front Matter
```yaml
---
layout: insight-article
title: "Russian Wine Renaissance: A New Chapter in Krasnodar"
ref: "ru-wine-renaissance"
lang: en
permalink: /en/insights/ru-wine-renaissance/

# Article metadata
category: "market_momentum"
author: "Brandmine Research Team"
reading_time: 6
publication_date: 2025-06-17

# Content associations
featured_brands: ["ru-krasnodar-wines"]
featured_founders: ["ru-anna-kuznetsova"]
related_markets: ["russia"]
related_sectors: ["wine"]

# Standardized image structure
images:
  hero:
    name: "vineyard"       # Scene only
    alt: "Russian vineyards in Krasnodar region showing modern viticulture"
    ext: "jpg"
  founder:
    name: "portrait"       # Generic descriptor
    alt: "Anna Kuznetsova, founder of Krasnodar Wines"
    ext: "jpg"
  logo:
    name: "brand"          # Variant only
    alt: "Russian wine logo"
    ext: "png"

# SEO and social
description: "How Russian winemakers in Krasnodar are gaining international recognition"
featured: false
social_sharing: true
---

# Article Content

Rich markdown content for the article...
```

---

## 🖼️ Image Processing Workflows

### Universal Processing Pattern
```bash
# Single content item
_scripts/core/process_images.sh [collection] [identifier]

# Examples:
_scripts/core/process_images.sh brands ru-teatime
_scripts/core/process_images.sh founders ru-alexei-sokolov
_scripts/core/process_images.sh insights ru-wine-renaissance

# Entire collection
_scripts/core/process_images.sh brands
_scripts/core/process_images.sh founders
_scripts/core/process_images.sh insights
```

### Context-Aware Naming Standards
```bash
# CORRECT ✅ - Context-aware naming
hero-storefront.jpg        # Scene only
logo-color.png            # Variant only
founder-formal.jpg         # Context only

# INCORRECT ❌ - Old redundant patterns
hero-teatime-storefront-moscow.jpg
logo-teatime-brand.png
founder-alexei-sokolov-portrait.jpg
```

### Image Directory Structure
```
assets/images/
├── brands/{brand-id}/
│   ├── originals/           # Source images
│   │   ├── hero-storefront.jpg
│   │   ├── logo-color.png
│   │   └── founder-formal.jpg
│   ├── {brand-id}-hero-storefront-400w.jpg    # Auto-generated
│   ├── {brand-id}-hero-storefront-800w.jpg
│   └── {brand-id}-hero-storefront-1200w.jpg
├── founders/{founder-id}/
└── insights/{insight-id}/
```

---

## 🌐 Translation Management

### Cross-Language Consistency
```bash
# Language consistency validation
_scripts/validation/language_consistency_checker.py

# Check all languages have matching content
_scripts/validation/check_language_consistency.sh

# Find missing translation keys
_scripts/validation/find_translation_keys.py
```

### Translation Workflow
1. **Create content in English first** (primary language)
2. **Copy front matter exactly** to RU and ZH versions
3. **Translate content only** - keep all technical data identical
4. **Use identical image references** across all languages
5. **Validate consistency** before publishing

### Translation Helpers
```liquid
# Use centralized translation system
{% include helpers/t.html key="brands.hero_title" fallback="Discover Brands" %}

# Translation files location:
# _data/translations/en.yml
# _data/translations/ru.yml
# _data/translations/zh.yml
```

---

## 🔧 Development Workflows

### Universal Card Implementation

**All card displays use the universal system:**
```liquid
{% include components/cards/universal-card.html
   item=content_object
   type="brand|insight|founder|testimonial"
   variant="standard|featured|compact|quote-focus"
   context="grid|carousel|connections"
   config_set="universal-card" %}
```

### Card Type Reference
| Content Type | Type Parameter | Common Variants | Features |
|-------------|----------------|-----------------|----------|
| **Brands** | `type="brand"` | standard, featured | Metric overlays, split footers |
| **Insights** | `type="insight"` | standard, compact | Category borders, badges |
| **Founders** | `type="founder"` | compact, quote-focus | Generation badges, achievements |
| **Testimonials** | `type="testimonial"` | quote-focus | Quote emphasis, attribution |

### Component Development Pattern
```liquid
{% comment %} CURRENT PATTERN - Use this {% endcomment %}
{% include helpers/page-sections.html page_type="brands" %}

{% comment %} DEPRECATED - No longer used {% endcomment %}
{% for section in page.sections %}
  {% include pages/brands/{{ section }}.html %}
{% endfor %}
```

---

## 🧪 Testing and Validation

### Pre-Commit Validation
```bash
# Complete validation suite
_scripts/core/pre-commit_check.sh

# Individual checks:
_scripts/validation/validate_yaml.sh
_scripts/validation/check_language_consistency.sh
_scripts/validation/find_translation_keys.py
```

### Performance Testing
```bash
# Build time test (target: <15 seconds)
time JEKYLL_ENV=production bundle exec jekyll build

# Regenerate performance optimizations
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
```

### Content Validation
```bash
# Generate updated search data
python3 _scripts/core/generate-all-json.py

# Check for missing images
find assets/images -name "originals" -exec ls -la {} \;

# Verify responsive images generated
ls assets/images/brands/*/
```

---

## 📊 Data Management

### JSON Generation
```bash
# Update all search indexes and JSON data
_scripts/core/generate-all-json.py

# This creates:
# _data/brands.json     - All brand data with metadata
# _data/founders.json   - All founder profiles
# _data/insights.json   - All insight articles
```

### Performance Optimization
```bash
# Language mapping (eliminates expensive page lookups)
_scripts/utilities/generate-language-map.py

# Navigation cache (eliminates translation lookups)
_scripts/utilities/generate-navigation-cache.py
```

---

## 🧩 Component Creation Workflows

### Founder Card Development Pattern
**Proven methodology from Phase 1B standardization:**

#### Step 1: Choose Component Architecture
**Decision framework:**
- **Separate component**: If fundamentally different structure/behavior
- **Variant system**: If similar structure with styling differences

**Example Decision:**
- `founder-card` vs `founder-card-featured` → **Separate** (different purposes)
- Standard vs compact founder card → **Variant** (same structure, different styling)

#### Step 2: Establish BEM Namespace
```html
<!-- Separate Component Pattern -->
<div class="component-name">
  <div class="component-name__header">
  <div class="component-name__content">
</div>

<!-- Variant Pattern -->
<div class="component-name component-name--{{ variant }}">
  <div class="component-name__header">
  <div class="component-name__content">
</div>
```

#### Step 3: CSS Boundary Compliance
**Create component CSS file following boundary rules:**
```scss
/* component-name.scss - ONLY intrinsic properties */
.component-name {
  background: var(--color-background);
  padding: var(--space-4);
  border-radius: var(--radius-md);
}

.component-name__header {
  font-size: var(--text-xl);
  margin-bottom: var(--space-2);
}

/* DO NOT include layout properties */
/* Positioning, margins, grid behavior belong in layout files */
```

#### Step 4: Implementation Validation
```bash
# Boundary violation check
grep -E "(margin|grid|flex.*basis)" assets/css/components/component-name.scss

# Should return no results - violations must be fixed
```

### JavaScript Integration Pattern
**Standard selector patterns for new components:**
```javascript
// Use consistent BEM selectors
const cards = document.querySelectorAll('.component-name');
const featuredCards = document.querySelectorAll('.component-name--featured');

// Avoid hardcoded selectors that break with changes
// Always match actual HTML component classes
```

---

## 🎯 Quality Standards

### Time Targets
- **New Brand**: 20 minutes total
- **New Founder**: 15 minutes total
- **New Insight**: 25 minutes total
- **Image Processing**: 2 minutes per collection

### Validation Checklist
- [ ] Content validates without errors (`pre-commit_check.sh`)
- [ ] All three languages created and consistent
- [ ] Images processed and displaying correctly
- [ ] Universal card components used throughout
- [ ] Cross-references working (brands ↔ founders ↔ insights)
- [ ] Performance targets met (<15s build time)

### Build Performance Targets
- **Development builds**: <25 seconds
- **Production builds**: <15 seconds
- **Clean rebuilds**: <30 seconds

---

**Cross-References:**
- **Technical Standards**: See [technical-standards.md](technical-standards.md) for architecture patterns and visual guidelines
- **Troubleshooting**: See [troubleshooting-and-tools.md](troubleshooting-and-tools.md) for issue resolution
- **Operational Tutorials**: See `_templates/tutorials/` for detailed step-by-step workflows
