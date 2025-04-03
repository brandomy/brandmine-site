# Brandmine Technical Context

## Project Overview
- **Purpose:** Multilingual platform (EN/RU/ZH) showcasing BRICS+ consumer brands
- **Stack:** Jekyll static site with GitHub Pages deployment
- **Status:** Functioning MVP with ongoing feature implementation

## Technical Structure

### Directory Organization
```
brandmine/
├── _layouts/         # Page templates (default.html, brand.html, etc.)
├── _includes/        # Reusable components (header.html, footer.html, etc.)
├── _brands/          # Brand collection (organized by language)
├── _insights/        # Insights collection (organized by language)
├── _tags/            # Taxonomy collection (organized by language)
├── _data/            # Translation files and tag definitions
├── assets/
│   ├── css/          # Organized by tokens, layout, components, pages
│   ├── js/           # Filtering, search, and UI functionality
│   ├── fonts/        # Multilingual typography support
│   └── images/       # Site and brand images
└── pages/            # Content pages (organized by language)
```

### CSS Architecture
- **Methodology:** BEM (Block Element Modifier)
- **Organization:** Component-based with mobile-first responsive design
- **Key Files:**
  - `tokens/*.css` - Design variables (colors, spacing, typography)
  - `layout/*.css` - Grid and panel systems
  - `components/*.css` - Reusable UI components
  - `pages/*.css` - Page-specific layouts

### JavaScript Functionality
- `brand-filtering.js` - Powers multi-dimensional filtering
- `search.js` - Site-wide search functionality
- `menu.js` - Mobile navigation
- `premium-content.js` - Controls access to premium features

### Multilingual Implementation
- Language-first directory structure (`/en/`, `/ru/`, `/zh/`)
- Translation files in `_data/translations/[lang].yml`
- Consistent file naming across languages

### Responsive Design
- Mobile-first implementation
- Breakpoints defined in CSS variables
- Grid-based layout with flexbox components

## Current Technical Priorities
1. Fix featured brand panel display issues
2. Implement brand filtering functionality
3. Complete discovery path implementation
4. Ensure consistent responsive behavior

## Common Development Challenges
- Maintaining consistency across trilingual site structure
- Balancing responsive design with complex layouts
- Managing CSS specificity with BEM methodology
- Implementing static-site filtering without database

## Jekyll Build Process
- `bundle exec jekyll serve` - Local development
- `bundle exec jekyll build` - Production build
- `JEKYLL_ENV=production bundle exec jekyll build` - For analytics
