# Brandmine Component Relationships

This document maps the relationships between layouts and includes in the Brandmine Jekyll site, showing which components are used by which layouts and their dependencies.

## Layout → Include Relationships

### _layouts/brand.html
Primary layout for individual brand display pages.

**Core Includes:**
- `components/images/brand-image.html` - Used for brand logo and hero image
- `components/icons/icon.html` - Used for various iconography throughout

**Conditional Includes:**
- For premium/featured content:
  - `components/cards/related-brands.html` - Used when related brands exist
  - `components/maps/map.html` - Used when location data is available

**Key Parameters Passed:**
- `country=page.country_code` - To brand-image
- `brand=page.slug` - To brand-image
- `type="sector"` - To icon.html
- `name=sector.slug` - To icon.html

### _layouts/dimension.html
Used for taxonomy dimension pages (sectors, markets, attributes, signals).

**Core Includes:**
- `collections/dimensions/discovery-navigation.html` - Tab navigation
- `collections/dimensions/dimension-list.html` - List of items in dimension
- `collections/brands/related-brands-list.html` - Brands filtered by dimension

**Key Parameters Passed:**
- `active_type=page.discovery_path` - To discovery-navigation
- `container_class=discovery_class` - To discovery-navigation
- `dimension=page.dimension` - To dimension-list
- `filter_by=page.tag_type` - To related-brands-list
- `filter_value=page.tag` - To related-brands-list

### _layouts/discover.html and _layouts/discovery.html
Top-level discovery navigation pages.

**Core Includes:**
- `collections/dimensions/discovery-navigation.html` - Tab navigation
- `collections/dimensions/discovery-dimensions-grid.html` - Grid of dimension types

**Key Parameters Passed:**
- `style_option='b'` - To discovery-navigation
- `active_type=page.discovery_path` - To discovery-navigation

### _layouts/insights.html
Primary layout for insights listing pages.

**Core Includes:**
- `components/cards/insight-card.html` - For rendering each insight
- `collections/insights/latest-insights-grid.html` - For displaying insights grid

**Key Parameters Passed:**
- `insight=insight` - Individual insight object passed to insight-card

### _layouts/insight.html
Layout for individual insight articles.

**Core Includes:**
- `components/indicators/content-type-indicator.html` - For category display
- `components/images/responsive-image.html` - For hero image
- `components/cards/brand-card.html` - For related brands (when applicable)

## Include → Include Dependencies

Some includes depend on or call other includes:

**collections/brands/related-brands-list.html**
- Calls: `components/cards/brand-card.html`

**components/cards/featured-brand.html**
- Calls: `components/images/brand-image.html`
- Calls: `components/icons/taxonomy-icon.html`

**components/maps/markets-map.html**
- Calls: `components/maps/map.html`

**components/navigation/navigation.html**
- Calls: `components/navigation/language-selector.html`

## Critical Include Components

These includes are used across multiple layouts and are critical to site functionality:

1. **discovery-navigation.html** - Used in 3+ layouts, defines main taxonomy navigation
2. **brand-card.html** - Used in 5+ locations, core display component
3. **icon.html** - Used throughout, powers visual taxonomy system
4. **brand-image.html** - Used in 3+ layouts, manages responsive brand imagery
5. **language-selector.html** - Used site-wide, enables multilingual functionality

## JavaScript Dependencies

Some includes have associated JavaScript dependencies:

**components/maps/map.html**
- Requires: `/assets/js/map-initialization.js`

**components/search/search-filter.html**
- Requires: `/assets/js/search-filtering.js`

**components/carousels/featured-brands-carousel.html**
- Requires: `/assets/js/carousel.js`

## Update Impact Analysis

When modifying these includes, consider the impact:

**High Impact (Used Widely)**
- `header.html`
- `footer.html`
- `brand-card.html`
- `icon.html`
- `discovery-navigation.html`

**Medium Impact (Used in Multiple Places)**
- `dimension-list.html`
- `insight-card.html`
- `brand-image.html`
- `map.html`

**Specialized Impact (Limited Usage)**
- `market-sector-highlight.html`
- `featured-brands-carousel.html`
- `content-type-indicator.html`