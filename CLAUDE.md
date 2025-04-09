# CLAUDE.md

This file provides Claude Code and other AI tools with the architectural context and development practices used in the Brandmine website project.

---

# 🧭 Project Overview

**Brandmine** is a multilingual, mobile-first website built with **Jekyll (no theme)** that showcases narrative-rich consumer brands from BRICS+ countries. It emphasizes founder stories, multidimensional tagging, and interactive discovery.

The site supports:
- **Three languages**: English (`en`), Russian (`ru`), Chinese (`zh`)
- A **tag-based discovery model** (sector, attribute, signal, market)
- Custom includes for maps, tag clouds, related brand logic, and language switching
- Integration with MapLibre for interactive maps
- Planned future integration with Airtable

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
- `sectors` — e.g. natural-beauty, halal-foods, specialty-cheeses
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
```

## Validation
```bash
jekyll doctor       # Check config  
htmlproofer _site   # Validate HTML output (requires html-proofer gem)
```

---

# 🎨 Code Style Guidelines

## CSS
- Follows **BEM naming**: `Block__Element--Modifier`
- Mobile-first with defined breakpoints
- Organized by purpose: tokens, layout, components, pages
- Uses CSS custom properties for design tokens

## HTML
- Semantic HTML5
- BEM class structure
- `id`s used for JS targeting
- ARIA attributes for accessibility

## JavaScript
- Vanilla JS only (no frameworks)
- ES6 preferred, backwards-compatible
- Avoid direct DOM manipulation
- Use event delegation for dynamic elements

---

# ✅ Best Practices

- Follow BEM and layout structure when adding components
- Test all changes in **all three languages**
- Validate responsive design using browser tools and real mobile devices
- Keep includes modular and reusable
- Maintain consistency between `_data/`, `_tags/`, and `_brands/` front matter

---

# 🤖 AI Onboarding Prompt (use at start of session)

Paste this in Claude or ChatGPT when starting a session:

> This is a Jekyll-based multilingual site (Brandmine) that uses `/en`, `/ru`, and `/zh` subfolders. Brands and tags are stored as Markdown files; tag types include `sectors`, `attributes`, `signals`, and `markets`. UI text is stored in `_data/translations`, and navigation is defined in `_data/navigation`. Layouts and includes handle rendering logic for brand cards, tag clouds, and multilingual navigation. Refer to CLAUDE.md if you need the complete structure.

---

# 🧩 Sample File Structures and Styling Philosophy

## Brand Markdown Example
Each brand is represented by a detailed Markdown file in `_brands/{lang}/`.  
Files include structured front matter (title, sector, attributes, markets, signals, etc.) and narrative content about the founder, products, export strategy, and awards【51†source】.

## Attribute Tag Example
Tags are defined as individual Markdown files with structured front matter (`tag`, `tag_type`, `description`, `badge_type`, `verification_required`) and a detailed narrative of what the tag means. These reside in `_tags/{lang}/{type}/`【52†source】.

## Layout Template (`default.html`)
- The `default` layout sets up the page’s structure and loads:
  - Language-aware HTML elements
  - SEO tags from `page.excerpt` and `_data/translations`
  - Extensive CSS: design tokens, base styles, components, and page-specific overrides
  - Font preloads and conditional Chinese font loads
  - Google Analytics, MailerLite, and Tally embeds
- Layout wraps the content using shared includes: `header.html`, `footer.html`, and responsive layout blocks【53†source】.

## Design Tokens (`tokens.css`)
- Centralized in `assets/css/tokens/tokens.css`
- Defines color palettes (primary, secondary, neutral, accent, olive, sky, amber)
- Language-specific font variables and breakpoints
- Typography scale, spacing units, layout widths, z-index levels, shadow, border, and card system tokens
- Used across all components and layout styles for design consistency【54†source】.

## Page Example (`about.md`)
- Located in `/pages/{lang}/`, uses `default` layout
- Combines panels for structured storytelling (mission, problem, solution, team, etc.)
- Styled with modular BEM components like `panel--hero`, `panel--mission`, and `team-member` cards
- Content is localized using `page.lang` and matched to appropriate CSS files (e.g., `/pages/about.css`) via layout logic【55†source】.


## Your Responses
1.  Provide one file at a time, starting with the most foundational or requested item.
2.  Wait for my approval or “next” command before continuing with the next file or section.
3.  If writing markdown, wrap the file name and content in fenced code blocks (e.g. ```md or ```yaml) and avoid commentary between them.
4.  For multi-step tasks, give a preview plan before beginning (e.g., “I’ll generate 3 files: X, Y, Z — shall I start with X?”)
⚠️ Do not attempt to return more than one document or major block of code in a single response unless I’ve asked for it explicitly. Wait for confirmation before proceeding.

---

# 🧠 Claude Tag Awareness and Discovery Instruction

This site relies on a **structured tag system** across four distinct types:

- `sectors` — Industry categories (e.g., natural-beauty, halal-foods)
- `attributes` — Brand qualities (e.g., founder-led, premium, sustainable)
- `signals` — Growth potential indicators (e.g., export-ready, rapid-growth)
- `markets` — Regional focus (e.g., brazil, india, china)

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
2. Wait for my approval or “next” command before continuing with the next file or section.
3. If writing markdown, wrap the file name and content in fenced code blocks (e.g. ```md or ```yaml) and avoid commentary between them.
4. For multi-step tasks, give a preview plan before beginning (e.g., “I’ll generate 3 files: X, Y, Z — shall I start with X?”)

⚠️ Do not attempt to return more than one document or major block of code in a single response unless I’ve asked for it explicitly. Wait for confirmation before proceeding.


---

# 🏷️ Tag System Architecture (Expanded for Claude)

## Valid Tag Types (DO NOT invent others)
- `sectors`: Industry/category (e.g., natural-beauty)
- `attributes`: Brand traits (e.g., founder-led, artisanal-excellence)
- `signals`: Growth indicators (e.g., export-ready, rapid-growth)
- `markets`: Country/regional relevance (e.g., brazil, russia)

## Storage & Routing
- Each tag is stored as a markdown file in `_tags/{lang}/{type}/`
- Tags use a consistent **slug across all languages**
- Permalinks follow this pattern: `/en/discover/sectors/halal-foods/`

## Tag Front Matter (required fields)
```yaml
---
tag: artisanal-excellence
tag_type: attributes
description: Brands known for high craftsmanship and authenticity
badge_icon: /assets/img/badges/artisan.svg
badge_type: tier2
verification_required: true
---
```

## Tag Usage
- Brands use tags in front matter: `tags: [founder-led, china, premium]`
- Tags are referenced with their **slug only** (not full path or label)
- All tag references must correspond to actual files in `_tags/{lang}/{type}/`

## Badge Preparation Logic
- Tags can evolve into badges if they include:
  - `badge_icon`: Path to SVG or PNG
  - `badge_type`: tier1, tier2 (for visual hierarchy)
  - `verification_required`: `true`/`false` (trust signal)

---

# 📁 Tag-Based Templates and Rendering Includes

## Templates
- `tag.html`: Displays tag description + filtered brand list
- `tag-list.html`: Renders tag list (flat or nested)
- `tag-cloud.html`: Renders weighted cloud or color-coded grid
- `related-brands-list.html`: Reuses tag logic for "See Also" panels

## CSS Tag Classes (example)
```css
.tag {
  padding: 0.2em 0.4em;
  border-radius: 4px;
  font-size: 0.85em;
}

.tag--sector { background: var(--color-sky); }
.tag--attribute { background: var(--color-olive); }
.tag--signal { background: var(--color-amber); }
.tag--market { background: var(--color-neutral); }
```

---

# 🌐 Tag Internationalization

- All tags use the **same slug across all languages**
- The `tag` file is translated per language (`_tags/ru/signals/export-ready.md`)
- Claude must **not generate duplicate tag slugs** with different labels

