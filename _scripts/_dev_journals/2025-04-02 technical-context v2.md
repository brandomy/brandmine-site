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
│   └── images/       # Site and brand images (organized by brand/purpose)
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
- `brand-filtering.js` - Multi-dimensional filtering system
- `search.js` - Site-wide search with language context
- `menu.js` - Mobile navigation
- `premium-content.js` - Access control for premium features

### JSON Data Structure
- Generated JSON powers filtering and search
- Contains all brands, tags, and relationships
- Organized by language and category
- Updated when content changes

### Multilingual Implementation
- Language-first directory structure (`/en/`, `/ru/`, `/zh/`)
- Translation files in `_data/translations/[lang].yml`
- Consistent file naming across languages
- Language-specific tag and category pages

### Image System
- Brand images organized by brand name
- Standardized naming with purpose identifiers
- Responsive sizes (400w, 800w, 1200w)
- Automation for image processing
- Dedicated includes for responsive images

### Responsive Design
- Mobile-first implementation
- Breakpoints defined in CSS variables
- Grid-based layout with flexbox components
- Adaptive components for various screen sizes

## Current Technical Priorities
1. Fix featured brand panel display issues
2. Implement brand filtering functionality
3. Complete discovery path implementation
4. Ensure consistent responsive behavior
5. Set up image processing automation
6. Optimize for page load performance

## Common Development Challenges
- Maintaining consistency across trilingual site
- Balancing responsive design with complex layouts
- Managing CSS specificity with BEM methodology
- Implementing static-site filtering without database
- Ensuring image optimization across all content
- Handling edge cases in filtering combinations

## Technical Reference
- **CSS Class Patterns**: `.block__element--modifier`
- **Panel System**: `.panel`, `.panel__content`, `.panel--modifier`
- **JSON Access Pattern**: `data.brands.filter(brand => brand.lang === page.lang)`
- **Translation Access**: `site.data.translations[page.lang].key`

## Jekyll Build Process
- `bundle exec jekyll serve` - Local development
- `bundle exec jekyll build` - Production build
- `JEKYLL_ENV=production bundle exec jekyll build` - For analytics
