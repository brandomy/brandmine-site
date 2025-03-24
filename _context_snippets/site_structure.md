# Brandmine Site Structure

## Core Directories

- `_layouts/`: Template layouts
  - `default.html`: Main site layout
  - `post.html`: Blog post layout
  - `tag.html`: Tag page layout
  - `category.html`: Category page layout
  - `styleguide.html` and `styleguide-standalone.html`: Design system documentation layouts

- `_includes/`: Reusable components
  - `header.html`: Site header with navigation
  - `footer.html`: Site footer with newsletter signup
  - `language-selector.html`: Language switching component
  - `brand-image.html`: Brand image handling include
  - `responsive-image.html`: Responsive image handling
  - `site-image.html`: Site-wide image handling
  - `/tags/`: Tag-related includes
  - `/styleguide/`: Style guide components

- `_data/`: Data files
  - `sectors.yml`: Sector definitions
  - `tag_translations.yml`: Tag translation mappings
  - `/translations/`: Language files (en.yml, ru.yml, zh.yml)

- `assets/`: Static assets
  - `/css/`: CSS files (see CSS Architecture)
  - `/js/`: JavaScript files
  - `/fonts/`: Font files for all languages
  - `/images/`: Site images

- `pages/`: Content pages organized by language
  - `/en/`: English pages
  - `/ru/`: Russian pages
  - `/zh/`: Chinese pages

## Main Page Types

1. **Home page**: Main landing page (`/en/index.html`, etc.)
2. **Brands**: Brand listing and filtering
3. **Discover**: Hub page for exploration paths
   - Sectors: Industry categories
   - Markets: Geographic regions
   - Attributes: Brand qualities
   - Signals: Business readiness indicators
4. **About**: Site information
5. **Style Guide**: Design system documentation

## Multilingual Structure

Each content page exists in three language versions:
- English: `/en/page-name.md`
- Russian: `/ru/page-name.md`
- Chinese: `/zh/page-name.md`

URL structure follows the pattern: `/{language}/{page-name}/`