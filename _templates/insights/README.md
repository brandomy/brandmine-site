# Brandmine Insights Templates

This directory contains templates for creating insight articles across four categories. These templates ensure consistent structure and proper taxonomy usage throughout the Brandmine platform.

## Available Templates

### 1. Brand Spotlight (insight-brand-spotlight.md)
- **Purpose**: In-depth profiles of noteworthy BRICS+ brands gaining international momentum
- **Typical Length**: 1,500 words
- **Reading Time**: 7 minutes
- **Focus**: Brand story, differentiation, and market positioning

### 2. Founders Journey (insight-founders-journey.md)
- **Purpose**: Personal stories behind the brands and the visionaries who created them
- **Typical Length**: 2,000 words
- **Reading Time**: 8 minutes
- **Focus**: Founder narrative, key decisions, challenges, and vision

### 3. Location Intelligence (insight-location-intelligence.md)
- **Purpose**: Geographical insights and regional context that shape brand development
- **Typical Length**: 1,800 words
- **Reading Time**: 6 minutes
- **Focus**: Geographic analysis, regional clustering, spatial opportunities

### 4. Market Momentum (insight-market-momentum.md)
- **Purpose**: Notable achievements, milestones, and expansion moments for BRICS+ brands
- **Typical Length**: 1,200 words
- **Reading Time**: 7 minutes
- **Focus**: Market trends, growth metrics, future trajectory

## Usage Instructions

### 1. Creating a New Insight Article

1. Copy the appropriate template to `_insights/en/ru/` (adjust path for other markets)
2. Fill in all required YAML front matter fields
3. Write your content following the provided structure
4. Process images after completing the article

### 2. Directory Structure

Articles should be organized by language and then market:
```
_insights/
├── en/
│   ├── ru/
│   │   ├── article-slug-1.md
│   │   └── article-slug-2.md
│   ├── cn/
│   └── br/
├── ru/
└── zh/
```

### 3. Image Organization

Images follow the same pattern as brand profiles:
```
assets/images/insights/[market]/[article-slug]/originals/
├── hero-[description].jpg
├── founder-portrait-[name].jpg (optional)
└── logo-[brand-name].jpg (optional)
```

**Image Naming Convention:**
- Format: `purpose-description.jpg`
- Examples:
  - `hero-teatime-moscow-headquarters.jpg`
  - `founder-portrait-alexei-sokolov.jpg`
  - `logo-sibirskaya-premium-edition.jpg`

### 4. Front Matter Requirements

#### Required Fields:
- `layout`: Always "insight"
- `title`: Article title
- `category`: Must match insights/en.yml id in kebab-case
- `country_code`: Two-letter code (ru, cn, br, etc.)
- `date`: Publication date (YYYY-MM-DD)
- `author_en`: Author name in English
- `author_ru`: Author name in Russian
- `author_zh`: Author name in Chinese
- `excerpt`: Brief summary (1-2 sentences)
- `permalink`: Article URL path
- `lang`: Article language (en, ru, zh)
- `reading_time`: Estimated minutes
- `ref`: For language switcher

#### Taxonomy Fields (All Optional):
- `sectors`: Array of sector slugs from dimensions/en.yml
- `markets`: Array of market slugs from dimensions/en.yml
- `attributes`: Array of attribute slugs from dimensions/en.yml
- `signals`: Array of signal slugs from dimensions/en.yml
- `brands`: Array of brand slugs

**IMPORTANT**: Use exact slugs from the data files - no variations!

#### Image Field:
```yaml
images:
  hero: "/path/to/hero-image.jpg"
  founder_portrait: "/path/to/founder-portrait.jpg"  # Optional
  logo: "/path/to/logo-image.jpg"  # Optional
```

### 5. Processing Images

After placing original images in the appropriate folder:
```bash
./_scripts/process_site_images.sh
```

### 6. Category Values

Use these exact category values (kebab-case):
- `brand-spotlight`
- `founders-journey`
- `location-intelligence`
- `market-momentum`

### 7. Slug Reference Chart

**Sectors** (from dimensions/en.yml):
- `artisan-confectionery`
- `artisanal-spirits`
- `fashion-accessories`
- `fermented-dairy`
- `gourmet-foods`
- `halal-foods`
- `honey-bee-products`
- `hotels-resorts`
- `jewelry-watches`
- `mineral-waters`
- `natural-beauty`
- `natural-supplements`
- `artisan-ceramics`
- `cured-meats`
- `specialty-cheeses`
- `wine`

**Markets**:
- `brazil`, `china`, `egypt`, `ethiopia`, `india`, `indonesia`, `iran`, `russia`, `south-africa`, `uae`

**Attributes**:
- `artisanal-excellence`, `cultural-bridge`, `founder-led`, `heritage-brand`, `innovation-leader`, `premium-positioning`, `regional-icon`, `sustainability-pioneer`

**Signals**:
- `export-ready`, `franchise-ready`, `investment-ready`, `rapid-growth`

## Best Practices

1. **Always use exact slugs** from data files to prevent errors
2. **Include descriptive image names** for better asset management
3. **Follow content structure** in templates for consistency
4. **Add translations incrementally** - write in English first
5. **Test articles** before publishing
6. **Keep excerpts concise** (1-2 sentences) for better card display

## Common Errors to Avoid

1. ❌ Using spaces or capitalization in slugs
2. ❌ Creating new category values not in insights/en.yml
3. ❌ Mixing up taxonomy slugs
4. ❌ Forgetting to process images
5. ❌ Using placeholder values in required fields

## Translation Workflow

1. Create English version first
2. Add Russian version with same `ref` value
3. Add Chinese version with same `ref` value
4. Ensure all versions are in correct language directories

## File Naming

Article files should use descriptive slugs that indicate content:
- `7-spices-spotlight.md` (not `article1.md`)
- `teatime-founders-journey.md` (not `founder-story.md`)
- `siberian-honey-corridor.md` (not `location-analysis.md`)

## Support

For questions about these templates, consult:
- CLAUDE.md for site architecture
- _data/dimensions/en.yml for taxonomy reference
- _data/insights/en.yml for category reference
- Component documentation for display includes