# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This file provides Claude Code and other AI tools with the architectural context and development practices used in the Brandmine website project.

---

# 🧭 Project Overview

**Brandmine** is a multilingual, mobile-first website built with **Jekyll (no theme)** that showcases narrative-rich consumer brands from BRICS+ countries. It emphasizes founder stories, multidimensional tagging, and interactive discovery.

The site supports:
- **Three languages**: English (`en`), Russian (`ru`), Chinese (`zh`)
- A **tag-based discovery model** (sector, attribute, signal, market)
- Custom includes for maps, tag clouds, related brand logic, and language switching
- Integration with MapLibre for interactive maps
- Planned integration with Airtable (flat table structure)

---

# 🗂 Folder Structure

```
/_brands/{lang}/       — One Markdown file per brand
/_tags/{lang}/{type}/  — Tag files per type (sector, signal, etc.)
/_data/                — YAML files for translations, sectors, navigation, social links
/_includes/            — HTML partials (headers, footers, language switcher, tag lists)
/_layouts/             — Jekyll templates (default, brand, sector, tag, etc.)
/_insights/{lang}/     — Insight content (curated stories, future blog)
/pages/{lang}/         — Main content pages like brands.md
/assets/               — CSS (BEM), JS, fonts, images
/_docs/templates/      — Styleguide components
_config.yml            — Site config, collections, language routing
index.html             — Redirects to /en/index.html
```

---

# 🏷️ Tagging System

Tags are stored as Markdown files in `_tags/{lang}/{type}/`. Each file contains:
- A front matter section with name, slug, type, and optionally description
- Content describing the tag in more detail

**Valid tag types** include:
- `sectors` — e.g. natural-beauty, halal-foods, specialty-cheeses, wine
- `attributes` — e.g. founder-led, heritage-brand, sustainability-pioneer
- `signals` — e.g. export-ready, franchise-ready, rapid-growth
- `markets` — e.g. russia, brazil, india, china

Brands reference tags in front matter like this:

```yaml
---
title: BioGlow
lang: en
sector: natural-beauty
tags: [organic, india, founder-led]
---
```

Rendering includes:
- `tag-cloud.html`, `tag-list.html`, `related-brands-list.html`

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
- Organized by purpose: tokens, layout, components, pages
- Uses CSS custom properties for design tokens
- File organization:
  - `/assets/css/tokens/` - Design variables, typography, grid definitions
  - `/assets/css/layout/` - Page structure, panels, grid implementations
  - `/assets/css/components/` - UI elements (buttons, cards, forms, etc.)
  - `/assets/css/pages/` - Page-specific styling

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
- Ensure all tags are properly referenced and exist as tag files
- For brand files, include all required frontmatter (title, slug, country, etc.)
- For translated content, keep the same structure across languages

## Error Handling
- Use Jekyll's multilingual fallback system for missing translations
- Validate language consistency with checking script before commits
- Handle missing images gracefully with responsive image component

---

# 🖼️ Image Strategy

- Standardized naming conventions (`purpose-imagename.jpg`)
- Responsive image sizes (400w, 800w, 1200w, 1600w)
- Consistent aspect ratios (16:9, 4:3, 1:1, etc.)
- Organization by brand in the assets directory
- Processing with ImageMagick for optimization

---

# 📱 Mobile Optimization Focus

- Mobile-first approach for all components
- Critical for Russian and Chinese markets where mobile usage dominates
- Card layouts designed for touch interfaces
- Map controls optimized for smaller screens
- Progressive loading to optimize performance

---

# 💾 Data Management

- Initially using Jekyll collections and front matter
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
/* Tag styling with color coding */
.tag {
  display: inline-flex;
  padding: var(--space-1) var(--space-2);
  border-radius: var(--radius-sm);
  font-size: var(--text-xs);
  font-weight: var(--font-medium);
}

.tag--sector {
  background-color: var(--olive-100);
  color: var(--olive-900);
}

.tag--market {
  background-color: var(--sky-100);
  color: var(--sky-900);
}

.tag--attribute {
  background-color: var(--secondary-100);
  color: var(--secondary-900);
}

.tag--signal {
  background-color: var(--accent-100);
  color: var(--accent-900);
}
```

---

# 🧠 Claude Tag Awareness and Discovery Instruction

This site relies on a **structured tag system** across four distinct types:

- `sectors` — Industry categories (e.g., natural-beauty, wine, hotels-resorts)
- `attributes` — Brand qualities (e.g., founder-led, heritage-brand, artisanal-excellence)
- `signals` — Growth potential indicators (e.g., export-ready, franchise-ready, rapid-growth)
- `markets` — Regional focus (e.g., russia, brazil, india, china)

Tags are defined as individual Markdown files in `_tags/{lang}/{type}/`, and referenced in brand front matter using the correct slug.

## Discovery Logic

- The **Discovery section** is driven by these tag types.
- Do **not create new tag types**. Always use the four approved ones.
- Tag filtering occurs on `/brands`, and tag exploration happens via `/discover`.
- Tag clouds, related brand logic, and tag-specific pages all derive from this model.

Claude must align any navigation, filtering, or tag-related output with this tag architecture.

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
2. Ensure the brand references existing tags
3. Process brand images with `./_scripts/process_brand_images.sh brandname`
4. Add attributions for images in `_data/image_attributions.yml`

### Adding a New Tag
1. Create tag files in appropriate category subfolder for all languages
2. Update any relevant translation files in `_data/`
3. Ensure the tag matches the established taxonomy

### Updating Styles
1. Identify the appropriate CSS file by component or page
2. Follow BEM naming conventions
3. Use CSS custom properties from tokens
4. Test responsive behavior on multiple screen sizes
