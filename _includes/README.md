# Brandmine Includes Directory

This directory contains all reusable components for the Brandmine Jekyll site, organized by function and purpose.

## Directory Structure Overview

The includes are organized into these main categories:

### collections/
Components specific to handling collections of content across the site:

- **brands/** - Components for displaying brand collections
  - `related-brands-list.html` - Displays related brands based on taxonomy

- **dimensions/** - Components for taxonomy dimension displays
  - `dimension-cloud.html` - Tag cloud visualization for dimensions
  - `dimension-list.html` - List view of dimension items
  - `discovery-dimensions-grid.html` - Grid display of dimension categories
  - `discovery-navigation.html` - Navigation tabs for discovery section

- **insights/** - Components for insight article collections
  - `insights-feed.html` - Feed-style listing of insights
  - `latest-insights-grid.html` - Grid display of latest insights

### components/
Reusable UI components across the site:

- **buttons/**
  - `button.html` - Standard button component with variants

- **cards/** - Content card components
  - `brand-card.html` - Standard brand display card
  - `featured-brand.html` - Enhanced card for featured brands
  - `insight-card.html` - Card for insight article previews
  - `market-sector-card.html` - Card for market-sector combinations
  - `sector-card.html` - Card for sector display

- **carousels/**
  - `featured-brands-carousel.html` - Carousel for featured brands

- **content/**
  - `featured-content.html` - Display component for featured content

- **forms/**
  - `form.html` - Standard form component

- **icons/** - SVG icons organized by taxonomy dimension
  - `icon.html` - Core icon include that handles all icon types
  - `taxonomy-icon.html` - Icons specific to taxonomy display
  - Subdirectories containing SVG icons for:
    - attributes/
    - markets/
    - sectors/
    - signals/

- **images/** - Image handling components
  - `brand-image.html` - Responsive image component for brand assets
  - `image-attribution.html` - Attribution display for images
  - `responsive-image.html` - General responsive image component
  - `site-image.html` - Component for site-wide imagery

- **indicators/**
  - `content-type-indicator.html` - Visual indicator for content types

- **maps/** - Map integration components
  - `map.html` - General map component
  - `markets-map.html` - Map focused on market locations

- **navigation/** - Navigation components
  - `language-selector.html` - Language switching component
  - `navigation.html` - Main site navigation
  - `pagination.html` - Pagination controls

- **search/** - Search functionality
  - `search-filter.html` - Advanced search with filtering
  - `simple-search.html` - Basic search interface

### layout/
Core site structure components:
- `footer.html` - Site footer
- `header.html` - Site header

### styleguide/
Components used for the design system documentation:
- `code-example.html` - Code syntax highlighting
- `color-swatch.html` - Color palette display
- `type-sample.html` - Typography samples

### utilities/
Utility functions and components:
- `google-analytics.html` - Google Analytics integration

### Special Components
- `market-sector-highlight.html` - Displays market-sector relationships
- `translate-name.html` - Handles multi-language name translation

## Common Usage Patterns

### Brand Card

```liquid
{% include components/cards/brand-card.html 
   brand=brand 
   featured=false %}
```

### Dimension Navigation

```liquid
{% include collections/dimensions/discovery-navigation.html 
   active_type=page.discovery_path 
   container_class=discovery_class %}
```

### Responsive Brand Image

```liquid
{% include components/images/brand-image.html 
   country=page.country_code
   brand=page.slug
   image="main"
   purpose="hero"
   alt=page.title %}
```

## Layout Relationships

The following layouts rely heavily on specific includes:

- **brand.html** - Uses brand-image.html, icon.html components
- **dimension.html** - Uses discovery-navigation.html, dimension-list.html
- **insights.html** - Uses insight-card.html, latest-insights-grid.html
- **discover.html/discovery.html** - Uses discovery-navigation.html, discovery-dimensions-grid.html

## Naming Conventions

- Files use `kebab-case.html` naming
- Parameters use `snake_case` for consistency with Jekyll conventions
- BEM methodology is used for CSS classes (Block__Element--Modifier)
- Icon filenames match taxonomy slugs for automation

## Notes for Developers

- Components generally expect specific parameters; check component headers for requirements
- Most components accept an optional `class` parameter for additional styling
- The icon system uses standardized naming tied to taxonomy dimensions
- Language handling uses the `page.lang` variable throughout

## Additional Documentation

- See [Component Relationships Map](../docs/component-relationships.md) for a detailed map of how these includes are used across layouts
- See `includes_structure.txt` for a breakdown of the folder and file structure of our includes