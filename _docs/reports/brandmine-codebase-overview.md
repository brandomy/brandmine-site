# Brandmine Codebase Overview

**Brandmine** is a multilingual Jekyll website showcasing narrative-rich consumer brands from BRICS+ countries, built with a mobile-first, dimension-based discovery approach.

## 🎯 Core Mission
Elevate exceptional founder-led brands from BRICS+ countries, breaking through language and cultural barriers to connect them with global partners and capital.

## 🏗️ Architecture

### Tech Stack
- **Jekyll** (GitHub Pages compatible)
- **MapLibre** for interactive maps
- **Vanilla JavaScript** (no frameworks)
- **SCSS** with BEM methodology
- **Responsive images** with ImageMagick processing

### Key Features
- **3 languages**: English, Russian, Chinese
- **Linear layout** architecture (no sidebars)
- **4-dimension taxonomy**: markets, sectors, attributes, signals
- **2-tier content** approach (basic listings + featured profiles)
- **Mobile-first** responsive design

## 📁 Structure

```
_brands/          → Brand profiles (multilingual)
_founders/        → Founder profiles  
_dimensions/      → 4-type taxonomy system
_insights/        → Blog/content articles (4 categories)
_posts/           → Journal entries (includes company news)
_data/            → YAML/JSON data files
_includes/        → Modular components
_layouts/         → Page templates
pages/            → Main content pages
assets/           → CSS, JS, images, fonts
_scripts/         → Helper automation scripts
```

## 🌐 Multilingual System
- All content exists in `/en/`, `/ru/`, `/zh/` subfolders
- Translation files in `_data/translations/{lang}.yml`
- Dynamic language switching with consistent URLs
- Fallback system for missing translations

## 🏷️ Dimension Taxonomy
**Fixed 4-type system** (no custom types allowed):
- **Markets**: Geographic regions (russia, brazil, china, etc.)
- **Sectors**: Industries (natural-beauty, wine, artisanal-spirits, etc.)
- **Attributes**: Brand qualities (founder-led, heritage-brand, etc.)
- **Signals**: Growth indicators (export-ready, franchise-ready, etc.)

## 🎨 Design System
- **Panel-based** layout with hero tiers
- **Visual taxonomy** with color coding
- **3:2 aspect ratio** standard for images
- **BEM CSS** with custom properties
- **"Logic light"** templating approach

## 🔧 Development Tools
Key scripts in `_scripts/`:
- `process_images.sh` - Image optimization
- `generate_*_template.py` - Content scaffolding  
- `check_language_consistency.sh` - Validation
- `import_from_airtable.rb` - Data import

## 📊 Content Types

### Brands
- **2-tier system**: Basic listings + featured profiles
- Linked to founders with rich narratives
- Organized by 4-dimension taxonomy

### Founders
- Linked to brands with personal stories
- Expertise and generation tracking
- Cross-language profile consistency

### Insights (4 Categories)
1. **Brand Spotlight** - In-depth brand profiles
2. **Founder's Journey** - Personal founder stories
3. **Market Momentum** - Brand achievements/milestones
4. **Location Intelligence** - Geographic context articles

### Journal (Blog with Posts)
- **Personal development blog** documenting Brandmine journey
- **Company news** content (moved from Insights)
- **Technical insights** and market research learnings
- **Founder reflections** on building Brandmine
- Full multilingual support (EN/RU/ZH)

## 🚀 Recent Developments
- Hero panel system implementation
- Journal/blog sections added with company news integration
- Image migration and standardization
- Search and filter enhancements
- Mobile-first responsive improvements
- Elimination of "Company News" from Insights section

## 🎯 Key Principles
The codebase emphasizes:
- **Simplicity**: Linear layouts over complex grids
- **Scalability**: Data-driven patterns for thousands of profiles
- **Multilingual consistency**: Unified approach across all languages
- **Rich storytelling**: Maintaining narrative focus while scaling efficiently
- **Mobile-first**: Optimized for emerging market mobile usage patterns

## 📈 Performance Characteristics
- **Build time**: ~45 seconds for full site
- **Collections**: Scales to thousands of brand/founder profiles
- **Languages**: Consistent performance across all three languages
- **Images**: Automated responsive image generation
- **Search**: Client-side JavaScript with JSON indexes

The codebase is designed for **maintainability, international scalability, and rich storytelling** while serving emerging market brands seeking global opportunities.