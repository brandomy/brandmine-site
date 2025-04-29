# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This file provides Claude Code and other AI tools with the architectural context and development practices used in the Brandmine website project.

---

# 🧭 Project Overview

**Brandmine** is a multilingual, mobile-first website built with **Jekyll (no theme)** that showcases narrative-rich consumer brands from BRICS+ countries. It emphasizes founder stories, multidimensional tagging, and interactive discovery.

The site supports:
- **Three languages**: English (`en`), Russian (`ru`), Chinese (`zh`)
- A **dimension-based discovery model** (sector, attribute, signal, market)
- Custom includes for maps, dimension clouds, related brand logic, and language switching
- Integration with MapLibre for interactive maps
- Planned integration with Airtable (flat table structure)

---

# 🗂 Folder Structure

```
/_brands/{lang}/       — One Markdown file per brand
/_dimensions/{lang}/{type}/  — Dimension files per type (sector, signal, etc.)
/_data/                — YAML files for translations, sectors, navigation, social links, market-sectors
/_includes/            — HTML partials (headers, footers, language switcher, dimension lists)
/_layouts/             — Jekyll templates (default, brand, sector, dimension, etc.)
/_insights/{lang}/     — Insight content (curated stories, future blog)
/pages/{lang}/         — Main content pages like brands.md
/assets/               — CSS (BEM), JS, fonts, images
/_docs/templates/      — Styleguide components
_config.yml           — Site config, collections, language routing
index.html            — Redirects to /en/index.html
```

---

# 🏷️ Dimensions System

Dimensions are stored as Markdown files in `_dimensions/{lang}/{type}/`. Each file contains:
- A front matter section with name, slug, type, and optionally description
- Content describing the dimension in more detail

**Valid dimension types** include:
- `sectors` — e.g. natural-beauty, halal-foods, specialty-cheeses, wine
- `attributes` — e.g. founder-led, heritage-brand, sustainability-pioneer
- `signals` — e.g. export-ready, franchise-ready, rapid-growth
- `markets` — e.g. russia, brazil, india, china

Brands reference dimensions in front matter like this:

```yaml
---
title: BioGlow
lang: en
sector: natural-beauty
dimensions: [organic, india, founder-led]
---
```

Rendering includes:
- `dimension-cloud.html`, `dimension-list.html`, `related-brands-list.html`

---

# 📁 Includes Organization

Includes are organized into a structured hierarchy:

```
/_includes/
  collections/          — Collection-specific includes
    brands/             — Brand-related includes
    dimensions/         — Dimension-related includes
    insights/           — Insight-related includes
  components/           — Reusable UI components
    buttons/            — Button components
    cards/              — Card components
    carousels/          — Carousel components
    content/            — Content display components
    forms/              — Form components
    icons/              — Icon components
    images/             — Image handling components
    indicators/         — UI indicators
    maps/               — Map components
    navigation/         — Navigation components
    search/             — Search components
  layout/               — Layout components (header, footer)
  styleguide/           — Styleguide components
  utilities/            — Utility includes
```

This organization mirrors the CSS structure for consistency and maintainability.

---

# 🌐 Multilingual Logic

- **All content exists in language-specific subfolders**: `/en/`, `/ru/`, `/zh/`
- `_data/translations/{lang}.yml` stores UI labels and common text strings
- `_data/navigation/{lang}.yml` configures nav structure per language
- Layouts and includes dynamically pull from `_data/` based on `page.lang`
- Language switcher and all permalinks respect language prefixing

---

# 🗺️ Map Integration

- Using **MapLibre** with **Stadia Maps** for geographic visualization
- Clustering for efficient display of large numbers of brands
- Brand points link to their respective profile pages
- Filtering capabilities aligned with taxonomy system
- Responsive design for mobile and desktop use

---

# 🎨 Brand Display Components

Key components for brand display include:
- `brand-card.html` - Card display for brand listings
- `brand-list-item.html` - List view display for brand listings
- `search-filter.html` - Filter interface for multi-dimensional discovery
- `brand-image.html` - Responsive image handling for brand imagery
- `map-component.html` - Geographic visualization of brands

These components implement a visual taxonomy system using consistent color-coding:
- Sectors -> mint green/olive
- Markets -> light blue
- Attributes -> light orange
- Signals -> light purple/accent

---

# 📊 Two-Tier Content Approach

Brandmine uses a two-tier approach for brand content:
- **Tier 1: Basic Listings** (100+ per sector)
  - Name, location, sector
  - Brief description
  - Basic taxonomy
  - Geographic coordinates

- **Tier 2: Feature Profiles** (2-3 per sector)
  - Rich founder narratives
  - High-quality imagery
  - Complete taxonomy
  - Timeline and milestones

---

# 💡 Development Workflow

## Build Commands
```bash
bundle exec jekyll serve                  # Local dev server  
bundle exec jekyll serve --livereload    # Live reload mode  
bundle exec jekyll serve --host=0.0.0.0  # Mobile device testing  
bundle exec jekyll build                 # Build for dev  
JEKYLL_ENV=production bundle exec jekyll build  # Production build  
npm run start                            # Alias for jekyll serve  
npm run build                            # Alias for jekyll build
```

## Scripts
```bash
./_scripts/check_language_consistency.sh        # Validate i18n coverage
./_scripts/enhanced-site-summary-advanced.sh    # Generate structural summary
./_scripts/process_brand_images.sh [brand_name] # Process brand images (optional brand parameter)
./_scripts/process_site_images.sh               # Process site images
./_scripts/process_people_images.sh             # Process people/team images
./_scripts/add_image_attribution.py             # Add image attribution to _data/image_attributions.yml
```

## Validation
```bash
jekyll doctor       # Check config  
htmlproofer _site   # Validate HTML output (requires html-proofer gem)
```

## Testing & Checking Content
```bash
# Test changes locally before deploying
bundle exec jekyll serve               # Start local server
open http://localhost:4000             # View in browser

# Test multilingual functionality
./_scripts/check_language_consistency.sh # Check if pages exist in all languages

# Check image processing & optimization
identify -format "%f: %wx%h\n" assets/images/**/*.jpg # Verify image dimensions
```

---

# 🎨 Code Style Guidelines

## Layout Width Strategy
- **Home page**: Full-width layout for maximum visual impact
- **Interior pages**: Max-width of 1200px for content areas
- **Panel content**: Standard 1200px max-width for consistency across pages
- **Responsive behavior**: Widths automatically adjust on smaller screens
- This strategy balances:
  - Using screen real estate effectively on modern large displays
  - Maintaining readability for text-heavy content
  - Creating visual hierarchy between landing pages and interior content
  - Providing consistent user experience across different sections

## CSS
- Follows **BEM naming**: `Block__Element--Modifier`
- Mobile-first with defined breakpoints
- Organized with a manifest system for better modularity
- Uses CSS custom properties for design tokens
- File organization:
  - `/assets/css/tokens/` - Design variables, typography, grid definitions
  - `/assets/css/base/` - Core styling elements (layout, typography)
  - `/assets/css/layout/` - Layout components (header, footer, panels)
  - `/assets/css/components/` - UI elements (buttons, cards, etc.) with subdirectories:
    - `/cards/` - Various card components
    - `/carousels/` - Carousel components
    - `/navigation/` - Navigation elements
    - `/search/` - Search interfaces
    - `/dimension/` - Dimension-related components
  - `/assets/css/collections/` - Collection-specific styles:
    - `/brands/` - Brand collection styling
    - `/dimensions/` - Dimension collection styling
    - `/insights/` - Insight collection styling
    - `/markets/` - Market collection styling
  - `/assets/css/pages/` - Page-specific styling
    - `/dimension-specific/` - Styles for specific dimension pages
  - `/assets/css/manifest/` - CSS import manifests that group related styles
  - `/assets/css/utils/` - Utility styles

## HTML
- Semantic HTML5
- BEM class structure
- `id`s used for JS targeting
- ARIA attributes for accessibility
- Use includes for reusable components
- Respect content hierarchy with proper heading levels
- Keep language-specific content in the appropriate language subfolder

## JavaScript
- Vanilla JS only (no frameworks)
- ES6 preferred, backwards-compatible
- Avoid direct DOM manipulation
- Use event delegation for dynamic elements
- Keep scripts modular, limited to specific functionality
- Ensure all scripts are compatible with multilingual content

## Markdown/Front Matter
- Use consistent indentation (2 spaces)
- Include language code in all content files
- Ensure all dimensions are properly referenced and exist as dimension files
- For brand files, include all required frontmatter (title, slug, country, etc.)
- For translated content, keep the same structure across languages

## Error Handling
- Use Jekyll's multilingual fallback system for missing translations
- Validate language consistency with checking script before commits
- Handle missing images gracefully with responsive image component

---

# 🖼️ Image Strategy

- Standardized naming conventions (`purpose-imagename.jpg`)
- **Standard 3:2 aspect ratio** for most content images (1200×800px)
- Responsive image sizes (400w, 800w, 1200w, 1600w)
- Organization by brand in the assets directory
- Processing with ImageMagick for optimization via dedicated scripts:
  - `process_brand_images.sh` for brand assets
  - `process_site_images.sh` for site assets
  - `process_people_images.sh` for people/team images

---

# 📱 Mobile Optimization & Responsive Design

- Mobile-first approach for all components
- Standardized breakpoints used consistently across all CSS:
  - `min-width: 480px` - Small devices
  - `min-width: 768px` - Medium devices (tablets)
  - `min-width: 992px` - Large devices (desktops)
- Write mobile styles first, then enhance for larger screens within media queries
- Critical for Russian and Chinese markets where mobile usage dominates
- Card layouts designed for touch interfaces
- Map controls optimized for smaller screens
- Progressive loading to optimize performance

---

# 💾 Data Management

- Initially using Jekyll collections and front matter
- **Insights Content Categories** - Four standardized article types:
  1. **Brand Spotlight** - In-depth profiles of noteworthy brands
  2. **Founder's Journey** - Personal stories behind the brands
  3. **Market Momentum** - Achievements, milestones, and expansion moments
  4. **Location Intelligence** - Geographical insights and regional context
- Market-sector structured data in `_data/market_sectors/{lang}/{market}.yml`
- Future integration with Airtable using a flat table structure
- JSON for complex data (timelines, products, secondary locations)
- CSV import/export for efficient data management
- Sector-specific fields for specialized information

---

# ✅ Implementation Priorities

1. Enhanced search and filter interface
2. Visual taxonomy representation in brand cards
3. MapLibre integration for geographic discovery
4. Two-tier content approach (100+ listings, 2-3 profiles per sector)
5. Multilingual support from day one

---

# 🤖 AI Onboarding Prompt (use at start of session)

Paste this in Claude or ChatGPT when starting a session:

> This is a Jekyll-based multilingual site (Brandmine) that showcases brands from BRICS+ countries using a four-dimension taxonomy system (sectors, markets, attributes, signals). It features a two-tier content approach with basic listings (100+ per sector) and feature profiles (2-3 per sector). The site uses MapLibre for geographic visualization and has a mobile-first design philosophy. All content exists in three languages (EN/RU/ZH) with consistent URL structures. The design uses BEM naming conventions and CSS custom properties for styling.

---

# 🧩 Sample File Structures and Styling Philosophy

## Brand Markdown Example
```yaml
---
layout: brand
title: "TeaTime"
slug: teatime
country_code: "ru"
lang: en
permalink: /en/brands/ru/teatime/

# Taxonomy
sectors: ["Artisanal Tea", "Gourmet Foods"]
markets: ["Russia", "China"]
attributes: ["Founder-Led", "Heritage Brand", "Artisanal Excellence"]
signals: ["Export Ready", "Rapid Growth"]

# Location
location:
  country: "Russia"
  country_code: "ru"
  region: "Moscow Oblast"
  city: "Moscow"
  coordinates: [37.6173, 55.7558]

# Founder Information
founder:
  name: "Alexei Sokolov"
  position: "CEO & Tea Master"
  story: "Alexei discovered his passion for tea while traveling across Asia..."
  generation: "1st Generation"
  founder_led: true

# Basic Information
founding_year: 1998
website: "https://teatime.ru"
---

# TeaTime: Moscow's Premium Tea Artisans

TeaTime has established itself as Russia's premier artisanal tea brand, combining traditional Chinese and Indian tea cultivation knowledge with distinctly Russian flavors and blending techniques.

## Founder's Journey

Alexei Sokolov discovered his passion for tea while traveling through China...
```

## Visual Taxonomy CSS Example
```css
/* Dimension styling with color coding */
.dimension {
  display: inline-flex;
  padding: var(--space-1) var(--space-2);
  border-radius: var(--radius-sm);
  font-size: var(--text-xs);
  font-weight: var(--font-medium);
}

.dimension--sector {
  background-color: var(--olive-100);
  color: var(--olive-900);
}

.dimension--market {
  background-color: var(--sky-100);
  color: var(--sky-900);
}

.dimension--attribute {
  background-color: var(--secondary-100);
  color: var(--secondary-900);
}

.dimension--signal {
  background-color: var(--accent-100);
  color: var(--accent-900);
}
```

---

# 🧠 Claude Dimension Awareness and Discovery Instruction

This site relies on a **structured dimension system** across four distinct types:

- `sectors` — Industry categories (e.g., natural-beauty, wine, hotels-resorts)
- `attributes` — Brand qualities (e.g., founder-led, heritage-brand, artisanal-excellence)
- `signals` — Growth potential indicators (e.g., export-ready, franchise-ready, rapid-growth)
- `markets` — Regional focus (e.g., russia, brazil, india, china)

Dimensions are defined as individual Markdown files in `_dimensions/{lang}/{type}/`, and referenced in brand front matter using the correct slug.

## Discovery Logic

- The **Discovery section** is driven by these dimension types.
- Do **not create new dimension types**. Always use the four approved ones.
- Dimension filtering occurs on `/brands`, and dimension exploration happens via `/discover`.
- Dimension clouds, related brand logic, and dimension-specific pages all derive from this model.

## Insights Categories

Insights articles must use one of the standardized content categories:

1. **Brand Spotlight**: In-depth profiles of noteworthy BRICS+ brands gaining international momentum.
2. **Founder's Journey**: Personal stories behind the brands and the visionaries who created them.
3. **Market Momentum**: Notable achievements, milestones, and expansion moments for emerging BRICS+ brands.
4. **Location Intelligence**: Geographical insights and regional context that shape brand development and opportunities.

Each category has defined metadata including recommended length, reading time, and content guidelines (stored in `_data/insights/{lang}.yml`).

Claude must align any navigation, filtering, or dimension-related output with this architecture.

---

# 🤖 Your Responses (Reminder)

1. Provide one file at a time, starting with the most foundational or requested item.
2. Wait for my approval or "next" command before continuing with the next file or section.
3. If writing markdown, wrap the file name and content in fenced code blocks (e.g. ```md or ```yaml) and avoid commentary between them.
4. For multi-step tasks, give a preview plan before beginning (e.g., "I'll generate 3 files: X, Y, Z — shall I start with X?")

⚠️ Do not attempt to return more than one document or major block of code in a single response unless I've asked for it explicitly. Wait for confirmation before proceeding.

---

# 📋 Coding Tasks & Workflow

## Recommended Steps When Adding New Content or Features

1. **Check Existing Structure**: Look at similar files or components before creating new ones.
2. **Follow Naming Conventions**: 
   - Files: `kebab-case.html`, `kebab-case.css`, etc.
   - Variables: camelCase for JavaScript, kebab-case for CSS
   - Classes: BEM format `.block__element--modifier`
   
3. **Test in All Languages**: Any new feature should be compatible with all three languages (EN, RU, ZH).
4. **Mobile-First**: Design for mobile view first, then enhance for larger screens.
5. **Component Reuse**: Look for opportunities to reuse existing components.

## Common Tasks

### Adding a New Brand
1. Create brand markdown file in each language folder (`_brands/en/`, `_brands/ru/`, `_brands/zh/`)
2. Ensure the brand references existing dimensions
3. Process brand images with `./_scripts/process_brand_images.sh brandname`
4. Add attributions for images in `_data/image_attributions.yml`

### Adding a New Dimension
1. Create dimension files in appropriate category subfolder for all languages
2. Update any relevant translation files in `_data/`
3. Ensure the dimension matches the established taxonomy

### Updating Styles
1. Identify the appropriate CSS file by component or page
2. Follow BEM naming conventions
3. Use CSS custom properties from tokens
4. Test responsive behavior on multiple screen sizes