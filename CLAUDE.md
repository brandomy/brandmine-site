# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This file provides Claude Code and other AI tools with the architectural context and development practices used in the Brandmine website project.

---

# 🧭 Project Overview

**Brandmine** is a multilingual, mobile-first website built with **Jekyll** (using the Minima theme via GitHub Pages) that showcases narrative-rich consumer brands from BRICS+ countries. It emphasizes founder stories, multidimensional tagging, and interactive discovery.

## Business Mission

✨ **To illuminate and elevate exceptional founder-led brands from the BRICS+ countries, breaking through language, cultural, and political barriers to amplify their stories globally and proactively connect them with the people, partners, and capital they need to grow beyond their borders.**

The purpose of this site is to serve as the MVP for Brandmine where we curate a select small percentage of the brands and founders in our database.

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
    brands/             — Brands page sections (hero, impact, filter-interface, etc.)
    discovery/          — Discovery page sections (hero, impact, dimensions-grid, etc.)
    founders/           — Founders page sections (hero, impact, filter-interface, etc.)
    home/               — Home page sections
    insight/            — Insight page sections
    insights/           — Insights page sections (hero, impact, categories, etc.)
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

# 🏗️ Linear Layout Architecture

Brandmine uses a **simplified linear sectioning approach** optimized for MVP development and scalability:

## Core Principles

**"Simple and Clean" Philosophy:** All page layouts use a single, consistent linear sectioning pattern that eliminates complexity while maintaining semantic structure and accessibility.

**No Sidebar Complexity:** The site deliberately avoids grid-based sidebar layouts in favor of linear section flow, making it easier to maintain and scale with thousands of auto-generated profiles.

## Layout Structure

- **Page layouts** use a streamlined section-based architecture:
  - Each page is wrapped in a `.{page-type}-page` container for CSS scoping (e.g., `.founder-profile-page`)
  - Each logical section is wrapped in a semantic `<section>` tag with consistent panel wrapping
  - Sections have standardized class naming: `{page-type}-section--{section-name}`
  - Each section has a unique ID for accessibility: `id="{page-type}-section-{section}"`
  - ARIA attributes support screen reader navigation: `aria-labelledby="heading-{section}"`

- **Section includes** are loaded dynamically based on the page's front matter `sections` array:
  ```liquid
  {% for section in sections_to_render %}
    <section class="{{ page.ref }}-section {{ page.ref }}-section--{{ section }}"
             id="{{ page.ref }}-section-{{ section }}"
             aria-labelledby="heading-{{ section }}">
      <div class="panel panel--light">
        <div class="panel__content">
          {% include pages/{{ page.ref }}/{{ section }}.html %}
        </div>
      </div>
    </section>
  {% endfor %}
  ```

- **Standardized Section Structure**: All topline pages (brands, founders, discovery, insights) follow identical section patterns across all languages:
  ```yaml
  sections:
    - breadcrumbs
    - hero
    - impact          # Translation-driven impact statement
    - content
    - [page-specific sections]
    - contact-cta
  ```

- **Panel System Integration:** All content sections are wrapped in the panel system for consistent visual presentation and spacing.

## Three-Tier Hero Panel System

All pages implement a standardized hero system based on content type:

**Tier 1: Navigation Pages** (Discovery, category listings)
```scss
.panel--hero {
  background: linear-gradient(135deg, var(--primary-400) 0%, var(--primary-600) 100%);
  color: white;
  text-align: center;
}
```

**Tier 2: Individual Profiles** (Brands, founders, dimensions)
```scss
.panel--hero-subtle {
  background: radial-gradient(circle at center, var(--primary-300) 0%, var(--primary-500) 100%);
  color: white;
  text-align: center;
}
```

**Tier 3: Editorial Content** (Insights, articles)
```scss
.panel--hero-image {
  background-size: cover;
  background-position: center;
  position: relative;
  
  &::before {
    content: '';
    background: rgba(0, 0, 0, 0.4);
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
  }
}
```

## Benefits of Linear Architecture

1. **MVP Simplicity:** Single maintainer can manage thousands of profiles without layout complexity
2. **Mobile-First:** Linear flow works perfectly across all device sizes
3. **Consistent UX:** Every page follows the same interaction pattern
4. **Scalable:** Auto-generation friendly with simple template structure
5. **Accessible:** Semantic sectioning improves screen reader navigation
6. **Maintainable:** One layout pattern to learn and debug

This architecture provides semantic HTML structure for accessibility and SEO while maintaining the modular, logic-light approach optimized for rapid development and long-term maintenance.

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

### Sass Partials Convention
- **Underscore Prefix**: Files like `_entry-card.scss` are Sass partials (import-only)
- **Purpose**: Partials won't compile to individual CSS files, only when imported
- **Usage**: Import via `@import 'entry-card';` (no underscore needed in import statement)
- **Organization**: Standard convention throughout project for modular CSS architecture

## HTML
- Semantic HTML5
- BEM class structure
- `id`s used for JS targeting
- ARIA attributes for accessibility
- Use includes for reusable components
- Respect content hierarchy with proper heading levels
- Keep language-specific content in the appropriate language subfolder

## "Logic Light" Approach
**Principle:** Keep templates simple and logic-minimal while maintaining flexibility through structured data and modular includes.

- **Translation strings** in `_data/translations/{lang}.yml`; in templates assign them to a local variable:
   ```liquid
   {% raw %}{% assign t = site.data.translations[current_lang].about %}{% endraw %}
   {{ t.perspective_title | default: "Our Unique Perspective" }}
   ```

- **Impact sections** use standardized translation structure for consistent messaging:
   ```yaml
   # _data/translations/en.yml
   brands:
     impact:
       title: "Discover BRICS+ Brands Ready for Global Markets"
       text: "Brandmine offers unprecedented access to consumer brands..."
   ```

- **Linear sectioning structure** with minimal front matter:
   ```
   pages/en/about.md (minimal front matter with sections array)
   _layouts/about.html (loops through sections array)
   _includes/pages/about/hero.html (wrapped in panels)
   _includes/pages/about/mission.html (wrapped in panels)
   ```

- **Section-based content organization** eliminates complex conditional logic:
   ```liquid
   {% for section in sections_to_render %}
     <section class="{{ page.ref }}-section--{{ section }}">
       <div class="panel panel--light">
         <div class="panel__content">
           {% include pages/{{ page.ref }}/{{ section }}.html %}
         </div>
       </div>
     </section>
   {% endfor %}
   ```

- **Consistent panel wrapping** ensures visual unity while keeping section includes focused on content only.

**Benefits:** Eliminates sidebar complexity, reduces conditional logic, maintains semantic structure, and scales efficiently for auto-generated content.

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

- **Aspect Ratios** (Brandmine Standards):
  - **3:2 horizontal**: Standard content images (1200×800px)
  - **2:3 vertical**: Portrait images (800×1200px)
  - **1:1 square**: Icons and profile images (512×512px source)
  - **Note**: Only these three aspect ratios are used site-wide (no 16:9 or other ratios)

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
- **Insights Blog Platform** - Five standardized article types with full blog functionality:
  1. **Brand Spotlight** - In-depth profiles of noteworthy brands
  2. **Founder's Journey** - Personal stories behind the brands
  3. **Market Momentum** - Achievements, milestones, and expansion moments
  4. **Location Intelligence** - Geographical insights and regional context
  5. **Company News** - Latest updates, announcements, and company developments
- **Blog Features** - Featured articles, pagination, RSS feeds, social sharing

- **Founders' Journal Blog** - Personal blog section documenting the Brandmine journey:
  - **Purpose**: Transparent documentation of building Brandmine and exploring BRICS+ markets
  - **Content Types**: Technical insights, market research learnings, founder reflections
  - **Architecture**: Uses Jekyll posts collection with multilingual support
  - **URL Structure**: `/[lang]/journal/YYYY/MM/DD/post-slug/` for language-specific access
  - **Features**: Featured articles, responsive images with srcset, reusable entry cards
  - **Languages**: Full EN/RU/ZH support with proper language switching via `ref` attributes
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

## Reusable Card Components

**Entry Card Component** (`components/cards/entry-card.html`):
- **Purpose**: Reusable card for displaying content entries (journal posts, insights, articles)
- **Flexibility**: Configurable parameters for different content types and display options
- **Features**: Responsive images with srcset, customizable meta information, fallback support
- **Usage**: `{% include components/cards/entry-card.html item=post show_author=false %}`
- **Image Standards**: Enforces Brandmine's 3:2, 2:3, 1:1 aspect ratio standards
- **Performance**: Lazy loading and optimal image sizes based on viewport

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

## Insights Blog System

The **Insights collection** functions as Brandmine's full-featured blog platform for sharing timely content that supports the mission of amplifying BRICS+ brand stories.

### Content Categories

Insights articles must use one of the five standardized content categories:

1. **Brand Spotlight**: In-depth profiles of noteworthy BRICS+ brands gaining international momentum.
2. **Founder's Journey**: Personal stories behind the brands and the visionaries who created them.
3. **Market Momentum**: Notable achievements, milestones, and expansion moments for emerging BRICS+ brands.
4. **Location Intelligence**: Geographical insights and regional context that shape brand development and opportunities.
5. **Company News**: Latest updates, announcements, and developments from BRICS+ consumer brands.

Each category has defined metadata including recommended length, reading time, and content guidelines (stored in `_data/insights/{lang}.yml`).

### Blog Features

- **Featured Articles**: Hero presentation controlled by `featured: true` in front matter
- **Pagination**: Client-side JavaScript pagination (12 articles per page)
- **RSS Feed**: Available at `/feed/insights.xml` (toggleable via `enable_insights_feed` config)
- **Social Sharing**: LinkedIn, Twitter, Facebook, and Email sharing buttons
- **Multilingual Support**: Full blog functionality across EN/RU/ZH languages
- **Category Navigation**: Filter and browse by content type

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

### Adding Insights Articles
1. Use the insight template from `_templates/insights/insight-template-enhanced.md`
2. Choose one of the five standardized categories
3. Add `featured: true` for hero display on insights home page
4. Process images with `./_scripts/process_images.sh insights [article-slug]`
5. Leverage social sharing and RSS feed distribution

### Managing Blog Features
- **RSS Feed**: Toggle via `enable_insights_feed: true/false` in `_config.yml`
- **Featured Articles**: Control homepage hero with `featured: true` in front matter
- **Pagination**: Automatic when more than 12 articles exist

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

# 🚨 Important Architecture Guidelines

## Linear Layout Requirements

**CRITICAL:** Brandmine has deliberately eliminated sidebar complexity for MVP simplicity. All new layouts must follow the linear sectioning architecture:

- **NO SIDEBAR LAYOUTS:** Do not create grid-based layouts with sidebar components
- **NO BOOTSTRAP GRID:** Avoid complex grid systems in favor of simple section flow  
- **USE PANEL WRAPPING:** All content sections must be wrapped in the panel system
- **SEMANTIC SECTIONS:** Each section must use proper `<section>` tags with IDs and ARIA attributes
- **MOBILE-FIRST:** Linear flow ensures consistent behavior across all devices

## Sidebar Elimination Status

As of May 28, 2025, all functional sidebar references have been removed from the codebase:
- Sidebar CSS files deleted and imports removed
- All layouts converted to linear sectioning
- Section includes updated to use `section-content` and `section-title` classes
- Documentation updated to reflect new architecture

**When adding new content or features, always use the linear sectioning pattern established in existing layouts like `founder-profile.html` and `insight-article.html`.**

## Page Structure Standardization

As of May 28, 2025, all topline pages have been standardized across all languages:

**Standardized Pages:**
- `pages/{lang}/brands.md` - Brand discovery and listings
- `pages/{lang}/founders.md` - Founder discovery and profiles  
- `pages/{lang}/discovery.md` - Dimension-based navigation
- `pages/{lang}/insights.md` - Content and insights hub

**Key Features:**
- **Identical section structure** across EN/RU/ZH languages
- **Impact sections** positioned before content sections for strategic messaging
- **Translation-driven content** eliminates hardcoded HTML
- **Cross-language consistency** ensures maintainable codebase

---

# important-instruction-reminders
Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.
