
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
  - `related-brand-card.html` - Card for related brand display
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
  - `collection-image.html` - Unified responsive image component for all collections
  - `image-attribution.html` - Attribution display for images

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

### components/brand/
Brand-specific components:
- `founder-info.html` - Display founder information with portrait

### components/pages/
Page-specific components:
- **about/**
  - `team.html` - Team member display
- **brand/**
  - `gallery.html` - Brand gallery display
  - `header.html` - Brand page header
  - `hero.html` - Brand hero image
  - `related-brands.html` - Related brands section
- **home/**
  - `testimonials.html` - Testimonials section

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
{% include components/dimensions/discovery-navigation.html
   active_type=page.discovery_path
   container_class=discovery_class %}
```

### Unified Image Component

```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug=page.slug
   purpose="hero"
   name="main"
   aspect="landscape"
   alt=page.title %}
```

Examples for different collections:

```liquid
<!-- Brand hero image -->
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   name="storefront"
   aspect="landscape"
   loading="eager"
   alt="TeaTime storefront" %}

<!-- Team headshot -->
{% include components/images/collection-image.html
   collection="people"
   category="team"
   slug="olya-eastman"
   purpose="headshot"
   aspect="square"
   alt="Olya Eastman" %}

<!-- Sector image -->
{% include components/images/collection-image.html
   collection="sectors"
   slug="wine"
   purpose="hero"
   alt="Wine sector overview" %}
```

## Layout Relationships

The following layouts rely heavily on specific includes:

- **brand.html** - Uses collection-image.html, icon.html components
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
- The unified image component (`collection-image.html`) handles all image types
- Language handling uses the `page.lang` variable throughout
- Image slugs should include full identifiers (e.g., `ru-teatime` for brands)

## Additional Documentation

- See [Component Relationships Map](../docs/component-relationships.md) for a detailed map of how these includes are used across layouts
- See `includes_structure.txt` for a breakdown of the folder and file structure of our includes


