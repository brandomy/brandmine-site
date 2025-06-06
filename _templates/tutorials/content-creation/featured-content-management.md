# Featured Content Management Tutorial - Strategic Content Edition

## Overview

The Brandmine site uses a centralized YAML file system for managing featured content that appears on the homepage. This system has been enhanced with strategic content fields that transform cards from data displays into conversion tools that answer "Why should I care?" in 3 seconds.

**🎯 Strategic Goals:**
- Lead with compelling value propositions
- Showcase founder credibility and BRICS+ market context
- Display business metrics for legitimacy
- Use context-specific calls-to-action

## File Locations

- **Main Configuration**: `_data/featured_content.yml`
- **Case Studies Data**: `_data/case_studies.yml`
- **Translations**: `_data/translations/{lang}.yml`

---

## 1. Adding Featured Brands

### Location: `_data/featured_content.yml` → `brands` section

### Strategic Structure (NEW REQUIREMENTS)
```yaml
brands:
  en:
    - ref: "brand-slug"
      title: "Brand Display Name"
      permalink: "/en/brands/brand-slug/"
      
      # 🎯 STRATEGIC CONTENT (Required for optimal display)
      value_proposition: "One compelling line explaining why this brand matters"
      founder_display_name: "Full Founder Name"
      founder_role: "Founder & CEO"
      
      # 📊 KEY METRIC (Business credibility)
      key_metric:
        label: "International Expansion"
        value: "12 Countries"
        period: "2020-2024"
      
      # 🌍 BRICS+ MARKET CONTEXT
      market: ["country_code"]        # Enables market context display
      
      # 🏆 ENHANCED CREDIBILITY (Optional but recommended)
      founding_year: 2020
      breakthrough_moment: "Specific achievement or milestone"
      credibility_signals:
        - "Export certified"
        - "Heritage techniques"
      
      # Standard fields (existing)
      sector: "sector-slug"
      featured_level: 2
      attributes: ["attribute1", "attribute2"]
      signals: ["signal1", "signal2"]
      images:
        logo: "logo-color.png"
        hero: "hero-image.jpg"
        founder: "founder-portrait.jpg"
```

### Example: Adding a New Featured Brand (STRATEGIC VERSION)
```yaml
brands:
  en:
    - ref: "in-ayurveda-naturals"
      title: "Ayurveda Naturals"
      permalink: "/en/brands/in-ayurveda-naturals/"
      
      # 🎯 Strategic content that answers "Why should I care?"
      value_proposition: "India's heritage Ayurveda laboratory bringing 5,000-year-old wellness wisdom to modern global markets"
      founder_display_name: "Dr. Priya Sharma"
      founder_role: "Founder & Chief Ayurvedic Formulator"
      
      # 📊 Business credibility metric
      key_metric:
        label: "Export Markets"
        value: "18 Countries"
        period: "Since 2019"
      
      # 🌍 BRICS+ market context (enables "5th largest economy, 1.4B consumers" display)
      market: ["in"]
      
      # 🏆 Enhanced credibility signals
      founding_year: 2018
      breakthrough_moment: "First Ayurvedic brand to achieve EU organic certification"
      credibility_signals:
        - "EU organic certified"
        - "5,000-year heritage"
        - "Clinical research backed"
      
      # Standard taxonomy (existing)
      sector: "natural-beauty"
      featured_level: 2
      attributes: ["founder-led", "sustainability-pioneer", "heritage-brand"]
      signals: ["export-ready", "rapid-growth"]
      images:
        logo: "logo-color.png"
        hero: "hero-wellness-center.jpg"
        founder: "founder-portrait.jpg"
```

### Required Fields
- `ref`: Unique identifier (matches brand filename)
- `title`: Display name
- `permalink`: Full URL path
- `sector`: Must match existing sector slug
- `market`: Array of country codes

### Optional Fields
- `founding_year`: Number
- `featured_level`: 1 or 2 (2 = premium)
- `attributes`: Array of attribute slugs
- `signals`: Array of signal slugs
- `images`: Object with logo, hero, founder paths

### Multi-Language Setup
**Important**: Add the same brand to all three languages (en, ru, zh) with translated titles:

```yaml
brands:
  en:
    - ref: "in-ayurveda-naturals"
      title: "Ayurveda Naturals"
      # ... rest of config
  
  ru:
    - ref: "in-ayurveda-naturals"
      title: "Аюрведа Натуралс"
      permalink: "/ru/brands/in-ayurveda-naturals/"
      # ... same config with Russian permalink
  
  zh:
    - ref: "in-ayurveda-naturals"
      title: "阿育吠陀天然"
      permalink: "/zh/brands/in-ayurveda-naturals/"
      # ... same config with Chinese permalink
```

---

## 2. Managing Case Studies

### Location: `_data/case_studies.yml`

### Strategic Structure (ENHANCED FOR FOUNDER INTEGRATION)
```yaml
en:
  - slug: "case-study-slug"
    title: "Case Study Title"
    client: "Client Name"
    industry: "Industry Category"
    duration: "X years (YYYY-YYYY)"
    description: "Brief description of the case study"
    excerpt: "Longer excerpt for detailed view"
    permalink: "/en/case-studies/case-study-slug/"
    hero_image: "/assets/images/case-studies/slug/hero.jpg"
    featured: true
    
    # 🎯 STRATEGIC FOUNDER INTEGRATION (New Requirements)
    founder_name: "Full Founder Name"
    country: "country_code"                    # Enables BRICS+ economic context
    country_context: "Market description"     # e.g., "China's competitive beauty market"
    breakthrough_moment: "Key achievement"    # Specific, measurable milestone
    quote_snippet: "Memorable founder quote"  # Keep under 15 words
    founder_portrait: "/path/to/founder.jpg"  # For overlay display
    
    # Enhanced metrics (existing)
    metrics:
      - label: "Metric Name"
        value: "Value"
        trend: "up|down|stable"
    founder_quote:
      text: "Longer quote for full case study"
      attribution: "Person Name"
```

### Example: Adding a New Case Study
```yaml
en:
  - slug: "eco-fashion-revolution"
    title: "EcoFashion: Sustainable Style Goes Global"
    client: "EcoFashion Co."
    industry: "Sustainable Fashion"
    duration: "5 years (2019-2024)"
    description: "How a small sustainable fashion startup disrupted fast fashion through innovative materials and ethical production"
    excerpt: "EcoFashion proved that sustainable fashion could be both profitable and scalable, reaching 50+ countries while maintaining zero-waste production."
    permalink: "/en/case-studies/eco-fashion-revolution/"
    hero_image: "/assets/images/case-studies/eco-fashion/hero.jpg"
    featured: true
    metrics:
      - label: "Countries Reached"
        value: "50+"
        trend: "up"
      - label: "Waste Reduction"
        value: "95%"
        trend: "up"
      - label: "Revenue Growth"
        value: "$10M"
        trend: "up"
      - label: "Carbon Footprint"
        value: "-80%"
        trend: "down"
    founder_quote:
      text: "We proved that you don't have to choose between profit and planet. Our success shows that consumers are ready for sustainable alternatives."
      attribution: "Maya Patel, Founder & CEO"
```

### Multi-Language Case Studies
Add the same case study to all languages with translated content:

```yaml
ru:
  - slug: "eco-fashion-revolution"
    title: "ЭкоМода: Устойчивый стиль завоевывает мир"
    client: "ЭкоМода Ко."
    # ... translated content with /ru/ permalink
```

---

## 3. Featured Content Order & Display

### Carousel Display Order
Items appear in the order they're listed in the YAML file. To reorder:

1. Cut and paste entries in the desired order
2. First item = leftmost in carousel
3. `featured: true` items appear in case studies carousel

### Featured Levels for Brands
- `featured_level: 1` = Standard featured
- `featured_level: 2` = Premium featured (highlighted styling)

### Case Study Featuring
Only case studies with `featured: true` appear in the homepage carousel.

---

## 4. Adding Featured Insights

### Location: `_data/featured_content.yml` → `insights` section

### Structure
```yaml
insights:
  en:
    - ref: "insight-slug"
      title: "Insight Title"
      permalink: "/en/insights/insight-slug/"
      category: "category_slug"
      date: "YYYY-MM-DD"
      author: "author_key"
      excerpt: "Brief description"
      reading_time: 5
      featured: true
```

### Example
```yaml
insights:
  en:
    - ref: "brics-trade-boom"
      title: "BRICS+ Trade Volume Hits Record $5.2 Trillion"
      permalink: "/en/insights/brics-trade-boom/"
      category: "market_momentum"
      date: "2025-06-01"
      author: "randal_eastman"
      excerpt: "Analysis of how BRICS+ countries are reshaping global trade patterns with unprecedented growth in South-South commerce."
      reading_time: 6
      featured: true
```

---

## 5. Translation Management

### Adding New Translation Keys

When adding new featured content sections, add corresponding translation keys:

#### File: `_data/translations/en.yml`
```yaml
home:
  featured_new_section:
    title: "Section Title"
    subtitle: "Section subtitle"
```

#### File: `_data/translations/ru.yml`
```yaml
home:
  featured_new_section:
    title: "Заголовок секции"
    subtitle: "Подзаголовок секции"
```

#### File: `_data/translations/zh.yml`
```yaml
home:
  featured_new_section:
    title: "部分标题"
    subtitle: "部分副标题"
```

---

## 6. Quick Reference Commands

### Validate YAML Syntax
```bash
# Check YAML syntax
_scripts/validation/validate_yaml.sh

# Build test
bundle exec jekyll build --quiet
```

### Update After Changes
```bash
# Regenerate JSON files (if needed)
python3 _scripts/core/generate-all-json.py

# Test build
bundle exec jekyll serve --livereload
```

---

## 7. Troubleshooting

### Common Issues

**Build Errors**
- Check YAML indentation (use 2 spaces, no tabs)
- Ensure all required fields are present
- Verify permalink format matches `/lang/section/slug/`

**Missing Translations**
- Ensure all three languages (en/ru/zh) have the same entries
- Check translation keys exist in all language files

**Images Not Displaying**
- Verify image paths in `images` section
- Ensure images exist in `/assets/images/` directory
- Check image naming conventions

**Content Not Appearing**
- Verify `featured: true` for case studies
- Check item order in YAML file
- Ensure proper indentation

### Validation Checklist

Before committing changes:

- [ ] YAML syntax is valid
- [ ] All three languages updated
- [ ] Build completes without errors
- [ ] Content displays correctly on homepage
- [ ] Images load properly
- [ ] Links work correctly

---

## 8. Best Practices

### Content Guidelines
- Keep titles under 60 characters for mobile display
- Limit excerpts to 200 characters
- Use consistent image aspect ratios (3:2 recommended)
- Include meaningful metrics for case studies

### Maintenance
- Review featured content monthly
- Rotate case studies to keep content fresh
- Monitor performance metrics
- Update translations when adding new content

### Performance
- Limit featured brands to 6-8 items
- Limit case studies to 4-6 items
- Optimize images before adding
- Use appropriate featured levels

---

## File Structure Summary

```
_data/
├── featured_content.yml     # Main featured content config
├── case_studies.yml         # Case studies data
└── translations/
    ├── en.yml              # English translations
    ├── ru.yml              # Russian translations
    └── zh.yml              # Chinese translations
```

## Need Help?

- Check existing entries for reference patterns
- Review `_docs/troubleshooting.md` for common issues
- Test changes with `bundle exec jekyll serve --livereload`
- Validate YAML syntax before committing