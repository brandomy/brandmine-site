# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This file provides Claude Code and other AI tools with the architectural context and development practices used in the Brandmine website project.

---

# 🧭 Project Overview

**Brandmine** is a multilingual, mobile-first website built with **Jekyll** (using the Minima theme via GitHub Pages) that showcases narrative-rich consumer brands from BRICS+ countries. It emphasizes founder stories, multidimensional tagging, and interactive discovery.

The site supports:
- **Three languages**: English (`en`), Russian (`ru`), Chinese (`zh`)
- A **dimension-based discovery model** (market, sector, attribute, signal)
- Custom includes for maps, dimension clouds, related brand logic, and language switching
- Integration with MapLibre for interactive maps

---

# 🗂 Folder Structure

```
_brands/{lang}/       — One Markdown file per brand
_founders/{lang}/     — One Markdown file per founder
_dimensions/{lang}/{type}/  — Dimension definition files per type (markets, sectors, attributes, signals)
_data/                — YAML/JSON data (translations, navigation, social, market_sectors, etc.)
_includes/            — Reusable partials (collections, components, layout, pages)
_layouts/             — Jekyll layouts (default, brand, sector, dimension, etc.)
_insights/{lang}/     — Insight article content
pages/{lang}/         — Main content pages (about, brands, discovery, etc.)
assets/               — CSS, JS, fonts, images
_docs/                — Project documentation and guidelines
_templates/{type}/    — Markdown and HTML templates for scaffolding
_scripts/             — CLI scripts (validation, scaffolding, image processing, etc.)
_exports/             — Exported artifacts (search index, reports)
_site/                — Generated site output (Jekyll build directory)
_config.yml           — Site config, collections, language routing
index.html            — Entry point redirect to /en/index.html
```

---

# 🏷️ Dimensions System

Dimensions are stored as Markdown files in `_dimensions/{lang}/{type}/`. Each file contains:
- A front matter section with name, slug, type, and optionally description
- Content describing the dimension in more detail

**Valid dimension types** include (slugs match filenames in `_dimensions/{lang}/{type}/`):
- `markets` — e.g. brazil, china, egypt, ethiopia, india, indonesia, iran, russia, south-africa, uae
- `sectors` — e.g. artisan-ceramics, artisan-confectionery, artisanal-spirits, cured-meats
- `attributes` — e.g. artisanal-excellence, cultural-bridge, founder-led, heritage-brand, innovation-leader, premium-positioning, regional-icon, sustainability-pioneer
- `signals` — e.g. export-ready, franchise-ready, investment-ready, rapid-growth
You can review the full set of valid slugs in the corresponding `_dimensions/{lang}/{type}/` directories.

Brands reference dimensions in front matter like this:

```yaml
---
title: ru-BioGlow
ref: ru-bioglow
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
    founders/           — Founder-related includes
    insights/           — Insight-related includes
  components/           — Reusable UI components
    buttons/            — Button components
    cards/              — Card components
    carousels/          — Carousel components
    content/            — Content display components
    forms/              — Form components (modular: input, textarea, select, contact, newsletter, validation, custom alternatives)
    helpers/            - Small components
    icons/              — Icon components
    images/             — Image handling components
      collection-image.html — Unified image component for collections
    indicators/         — UI indicators
    maps/               — Map components
    navigation/         — Navigation components
    search/             — Search components (simple search, multi-column filters, advanced search)
    ui/                 — UI components (alerts, breadcrumbs, loading spinner, modal, tooltip)
  layout/               — Layout components (header, footer)
  pages/                — Page-specific includes organized by page
    about/              — About page sections (hero, mission, team, etc.)
    brand/              — Brand page sections
    founders/           — Founders page sections
    home/               — Home page sections
    insight/            — Insight page sections
```
We use small, focused section includes under `_includes/pages/<page>/<section>.html` to keep templates logic-light.

This organization mirrors the CSS structure for consistency and maintainability.

---

# 🌐 Multilingual Logic

- **All content exists in language-specific subfolders**: `/en/`, `/ru/`, `/zh/`
- `_data/translations/{lang}.yml` stores UI labels and common text strings
- `_data/navigation/{lang}.yml` configures nav structure per language
- Layouts and includes dynamically pull from `_data/` based on `page.lang`
- Language switcher and all permalinks respect language prefixing
- JSON files (`_data/countries.json`, `_data/languages.json`) provide structured data for use across languages

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
- `collection-image.html` - Unified responsive image handling for all collections
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

# 🏗️ Page Sectioning Architecture

Brandmine uses a semantic sectioning approach for page layouts:

- **Page layouts** use a section-based architecture where:
  - Each page is wrapped in a `.{page-type}-page` container for CSS scoping (e.g., `.brands-page`)
  - Each logical section is wrapped in a semantic `<section>` tag
  - Sections have standardized class naming: `{page-type}-section--{section-name}` (e.g., `brands-section--hero`)
  - Each section has a unique ID for accessibility and deep linking: `id="{page-type}-section-{section}"`
  - ARIA attributes improve screen reader navigation: `aria-labelledby="heading-{section}"`

- **Section includes** are loaded dynamically based on the page's front matter `sections` array:
  ```liquid
  {% for section in page.sections %}
    <section class="{{ page.ref }}-section {{ page.ref }}-section--{{ section }}"
             id="{{ page.ref }}-section-{{ section }}"
             aria-labelledby="heading-{{ section }}">
      {% include pages/{{ page.ref }}/{{ section }}.html %}
    </section>
  {% endfor %}
  ```

- **CSS scoping** follows a consistent pattern:
  ```scss
  .{page-type}-page {
    .{page-type}-section--{section-name} {
      /* Section-specific styles */
    }
  }
  ```

This architecture provides semantic HTML structure for accessibility and SEO while maintaining the modular, logic-light approach.

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
All helper scripts live in the `_scripts/` directory. Key examples:
- **check_language_consistency.sh**: Ensure content exists in all language folders.
- **validate_multilingual.sh**: Verify translation key consistency across languages.
- **process_images.sh [collection] [identifier]**: Optimize and generate responsive images.
- **generate_brand_template.py [country_code] [brand_slug]**: Scaffold new brand markdown files.
- **generate_article_template.py [lang] [slug]**: Scaffold a new insight article.
- **generate_search_index.py**: Build or update the `search.json` index.
- **add_image_attribution.py [collection] [identifier]**: Add entries to `_data/image_attributions.yml`.
 - **apply_teal_filter.sh**: Apply the teal brand filter to team photos.
 - **import_from_airtable.rb**: Import data from Airtable flat tables.
 - **yml_to_json_converter.py**: Convert YAML data (e.g. market sectors) to JSON files.
 - **claude-session-init.py**: Initialize AI sessions with project context and prompts.
 - **custom-forms.js**: JavaScript for custom contact and newsletter forms (validation, submission, state management).
 - *(See `_scripts/` for the full list of available helper scripts.)*

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

## CSS Organization
- Mobile-first and responsive, using **BEM** naming (`Block__Element--Modifier`) and CSS custom properties for design tokens.
- Styles are organized under `/assets/css/` directories:
  - `tokens/`, `base/`, `layout/`, `components/`, `collections/`, `pages/`, `manifest/`
- Each component and page has its own SCSS file for modularity.
- **"Logic Light" Architecture**: CSS component structure mirrors includes organization
- **Modular Components**: Forms, UI, and Search components organized in subdirectories with centralized `_index.scss` files
- **Component Independence**: Each component can be modified independently without affecting others

## HTML
- Semantic HTML5
- BEM class structure
- `id`s used for JS targeting
- ARIA attributes for accessibility
- Use includes for reusable components
- Respect content hierarchy with proper heading levels
- Keep language-specific content in the appropriate language subfolder

## "Logic Light" Approach
- Translation strings in `_data/translations/{lang}.yml`; in templates assign them to a local variable:
   ```liquid
   {% raw %}{% assign t = site.data.translations[current_lang].about %}{% endraw %}
   {{ t.perspective_title | default: "Our Unique Perspective" }}
   ```
 - Example structure:
   ```
   pages/en/about.md (minimal front matter)
   _layouts/about.html (loads section includes)
   _includes/pages/about/hero.html
   _includes/pages/about/mission.html
   ```

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
- Organization by collection type in the assets directory
- Processing with ImageMagick for optimization via unified script:
  - `process_images.sh` for all collection types
  - Specialized scripts for specific collections

## Image Organization and Processing

- **Directory Structure**: Organized by collection type:
  - `assets/images/brands/[country-code]-[brand-name]/` for brand assets
  - `assets/images/founders/[founder-id]/` for founder assets
  - `assets/images/people/` for team members and testimonials
  - `assets/images/icons/dimensions/` for dimension taxonomy icons
  - `assets/images/icons/insights/` for insights category icons
  - `assets/images/[category]/` for site-wide assets (sectors, markets, etc.)

- **Naming Convention**:
  - Brand images: `founder-portrait.jpg`, `founder-headshot.jpg`, `logo.png`, etc.
  - Founder images: `portrait.jpg`, `headshot.jpg`
  - Processed files include width indicators: `[identifier]-[image-type]-[width]w.extension`

- **Aspect Ratios**:
  - Standard content: 3:2 horizontal (1200×800px)
  - Portraits: 2:3 vertical (800×1200px)
  - Icons: 1:1 square (512×512px source)

- **Processing Scripts**:
  - `process_images.sh [collection] [identifier]` - Unified image processing
  - `apply_teal_filter.sh` for team photos branding

- **Implementation Includes**:
  - `collection-image.html` for unified responsive image handling
  - `brand-image.html` for brand-specific imagery
  - `site-image.html` for site-wide imagery
  - `taxonomy-icon.html` for dimension taxonomy icons

  - **Documentation**:
    - Comprehensive image guide at `_docs/design/image-guide.md`
    - Image style guide at `_docs/design/image-style-guide.md`

## Visual Style Strategy

Brandmine applies a structured visual language for all imagery based on content type:

- **Textured Minimalism (TM):**
  Used for brand profile hero images, insights article hero images, and country-specific dimension pages (e.g., Russian sectors, Brazilian markets).
  Characteristics: simplified forms, subtle textures, gentle shadows, rich muted colors, no embedded text.

- **Muted Pastel Textured Minimalism (MPTM):**
  Used for inline illustrations within insights articles and brand profiles to create emotional breathing spaces.
  Characteristics: pastel-based color palette, soft textures, lighter emotional tone, clean simplified forms.

- **Flat Colour Minimalism:**
  Used for generic dimension pages (e.g., global sector overviews, signals, attributes, markets).
  Characteristics: bold flat colors, geometric abstraction, no textures, clean edges, strong contrast for quick discovery.

- **Textured Images + Teal Filter:**
  Used for team members and testimonial providers.
  Characteristics: professional, natural photography with clean backgrounds and subtle brand filter (20% teal).

General Rule:
- Use TM for primary storytelling heroes.
- Use MPTM for secondary storytelling illustrations.
- Use Flat Colour Minimalism for taxonomy navigation and abstract dimension discovery.
- Use Natural Photography (with brand filter) for team/testimonial portraits.

⚠️ Avoid mixing raw unprocessed photographs with stylized or illustrated content directly side-by-side. All imagery must maintain consistent visual processing to preserve Brandmine's premium, editorial aesthetic.

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
- Market-sector structured data in `_data/market-sectors/{lang}/{market}.yml`
- Structured data in JSON files (`countries.json`, `languages.json`, `market_sector_map.json`, `market-country-map.json`, `markets.json`) as the primary source.
- JSON for complex data (timelines, products, secondary locations)
- CSV import/export for efficient data management
- Sector-specific fields for specialized information

## Search Index Automation

**Automated Generation:**
- `generate_search_index.py` - Builds complete JSON search indexes from markdown collections
- Generates `_data/brands.json` and `_data/founders.json` with multilingual content
- Includes complete metadata: taxonomy, location, founding year, website URLs
- Auto-generates from Jekyll collections when content is added/modified

**Manual Steps Required:**
- Translation files (`_data/translations/{lang}.yml`) - Manual editing only
- Market-sector content (`_data/market-sectors/{lang}/{market}.yml`) - Currently empty placeholders

**Update Search Indexes:**
```bash
python3 _scripts/generate_search_index.py
```

---

# 🎛️ Forms & UI Components Architecture

## "Logic Light" Component System

Following the "logic light" principle, CSS component structure mirrors the includes organization for maximum maintainability and developer experience.

### Forms Components Structure
```
_includes/components/forms/          CSS: assets/css/components/forms/
├── form.html                      ↔ form.scss
├── input-field.html               ↔ input-field.scss
├── textarea-field.html            ↔ textarea-field.scss
├── select-field.html              ↔ select-field.scss
├── contact-form.html              ↔ contact-form.scss
├── newsletter-form.html           ↔ newsletter-form.scss
├── feedback-form.html             ↔ feedback-form.scss
├── validation.html                ↔ validation.scss
├── custom-contact-form.html       ↔ custom-contact-form.scss
└── custom-newsletter.html         ↔ custom-newsletter.scss
```

### UI Components Structure
```
_includes/components/ui/            CSS: assets/css/components/ui/
├── alerts.html                   ↔ alerts.scss
├── breadcrumbs.html              ↔ breadcrumbs.scss
├── loading-spinner.html          ↔ loading-spinner.scss
├── modal.html                    ↔ modal.scss
└── tooltip.html                  ↔ tooltip.scss
```

### Search Components Structure
```
_includes/components/search/        CSS: assets/css/components/search/
├── simple-search.html            ↔ search-box.scss
├── search-filter.html            ↔ search-filter.scss
└── (advanced search planned)     ↔ advanced-search.scss
```

## Custom Form Alternatives

**Custom Contact Form** (`custom-contact-form.html`):
- Alternative to Tally forms with full control
- Real-time validation, loading states, success/error feedback
- Accessibility features (ARIA labels, screen reader support)
- Multilingual support using translation files

**Custom Newsletter Form** (`custom-newsletter.html`):
- Alternative to MailerLite with multiple layout variants
- Variants: default, inline, minimal, compact
- Email validation with responsive design

**JavaScript Integration** (`custom-forms.js`):
- Handles validation, submission, and state management
- Auto-initialization on DOM ready
- Modular design for easy extension

## Search & Filter System

**Multi-Column Filter Layout:**
- CSS Grid implementation for better space utilization
- Responsive stacking on mobile devices
- All 16 sectors displayed (previously limited to 8)

**Dynamic Country Loading:**
- Sorted alphabetically using `countries.json`
- Multilingual country names based on current language
- Proper display names instead of slugs

**Enhanced JavaScript:**
- Debounced search for better performance
- Proper filter counting and result display
- Grid/list view toggle functionality
- Complete filter reset capabilities

## Component Documentation

Comprehensive guides available:
- `_docs/cheat_sheets/forms-components-guide.md` - Complete forms documentation
- `_docs/cheat_sheets/search-components-guide.md` - Search functionality guide
- `_docs/cheat_sheets/ui-components-guide.md` - UI components documentation

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
permalink: /en/brands/ru-teatime/

# Taxonomy
sectors: ["Artisanal Spirits", "Gourmet Foods"]
markets: ["Russia", "China"]
attributes: ["Founder-Led", "Heritage Brand", "Artisanal Excellence"]
signals: ["Export Ready", "Growth Ready"]

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
3. Process brand images with `./_scripts/process_images.sh brands [country_code]-[brand_name]`
4. Add attributions for images in `_data/image_attributions.yml`

### Adding a New Founder
1. Create founder markdown file in each language folder (`_founders/en/`, `_founders/ru/`, `_founders/zh/`)
2. Process founder images with `./_scripts/process_images.sh founders [founder-id]`
3. Add attributions for images in `_data/image_attributions.yml`

### Adding a New Dimension
1. Create dimension files in appropriate category subfolder for all languages
2. Update any relevant translation files in `_data/`
3. Ensure the dimension matches the established taxonomy

### Updating Styles
1. Identify the appropriate CSS file by component or page
2. Follow BEM naming conventions
3. Use CSS custom properties from tokens
4. Test responsive behavior on multiple screen sizes

## Brand Profile Templates

Two template options are available for creating brand profiles:


1. **Basic Template** (`_templates/brands/brand_profile.md`):
   - Basic profile with essential sections
   - Use when moderate information is available
   - Contains founder details, basic timeline, and key attributes
   - Good for non-featured brands that need more than basic listing

2. **Full Template** (`_templates/brands/brand_profile_full.md`):
   - Comprehensive profile with all possible fields
   - Use for featured brands or when extensive information is available
   - Includes complete taxonomy, social media, certifications, timeline, etc.
   - Supports rich storytelling and detailed brand information

Always process brand images after creation using:
```bash
./_scripts/process_images.sh brands [country_code]-[brand_name]
```

I've added a new section titled "🏗️ Page Sectioning Architecture" after the "Two-Tier Content Approach" section. This new section explains the semantic sectioning approach we've implemented, including:

1. The structure of using semantic `<section>` tags
2. The consistent class naming pattern (`{page-type}-section--{section-name}`)
3. The use of IDs and ARIA attributes for accessibility
4. The pattern for dynamically loading section includes
5. The corresponding CSS scoping approach

This addition maintains the existing structure and style of the CLAUDE.md file while providing clear guidance on the new semantic sectioning architecture.
