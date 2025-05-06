# Brandmine Layouts Directory

This directory contains all Jekyll layout templates for the Brandmine site. Each layout defines the structure and presentation for specific page types while delegating component rendering to includes.

## Directory Structure

```
_layouts/
├── brand.html                # Individual brand profile layout
├── brands.html               # Brand listing/index layout
├── dimension-specific/       # Specialized dimension layouts
│   ├── attributes.html       # Attributes dimension layout
│   ├── markets.html          # Markets dimension layout
│   ├── sectors.html          # Sectors dimension layout
│   └── signals.html          # Signals dimension layout
├── dimension.html            # Generic dimension tag layout
├── discover.html             # Discover section layout
├── discovery.html            # Discovery hub layout
├── insight.html              # Individual insight article layout
├── insights-type.html        # Insight type listing layout
├── insights.html             # Insights index layout
├── market-sector.html        # Market-sector intersection layout
└── styleguide.html           # Design system documentation layout
```

## Layout Purposes & Dependencies

### Base Layout

#### default.html (implied)
The base layout that all other layouts extend.

**Purpose**: Provides the core HTML structure including `<head>`, navigation, and footer.

**Used for**: All pages (indirectly, as all other layouts extend this one)

**Key includes**:
- `layout/header.html`
- `layout/footer.html`

**Key content sections**:
- `<title>{% if page.title %}{{ page.title }}{% else %}{{ site.data.translations[page.lang].site.title }}{% endif %}</title>`
- Various CSS file inclusions based on page type
- `{{ content }}` (main content insertion)

### Brand Layouts

#### brand.html
**Purpose**: Displays individual brand profiles with metadata, content sections, and related information.

**Used for**: Individual brand profile pages (`_brands/{lang}/{brand}.md`)

**Key includes**:
- `components/images/brand-image.html`
- `components/icons/icon.html`

**Key content sections**:
- Brand header with metadata
- Brand description content (`{{ content }}`)
- Sidebar with attributes and contact
- Conditional sections based on `featured_level`

#### brands.html
**Purpose**: Lists all brands with search, filtering, and sorting capabilities.

**Used for**: Brand directory pages (`pages/{lang}/brands.md`)

**Key includes**:
- `components/cards/brand-card.html`
- `components/search/search-filter.html`
- `components/cards/featured-brand.html`

**Key content sections**:
- Search interface
- Filtering/sorting controls
- Brand card grid
- Featured brands section
- Recently added brands

### Discovery Layouts

#### discover.html
**Purpose**: Wrapper for the discover section dimensions overview.

**Used for**: Main discover section pages (`pages/{lang}/discover.md`)

**Key includes**:
- `collections/dimensions/discovery-navigation.html`

**Key content sections**:
- Discovery navigation tabs
- `{{ content }}` (page-specific content)

#### discovery.html
**Purpose**: Higher-level hub for the discovery landing page.

**Used for**: Discovery hub pages (`pages/{lang}/discovery.md`)

**Key includes**:
- `collections/dimensions/discovery-navigation.html`

**Key content sections**:
- Discovery navigation tabs
- `{{ content }}` (main content insertion)

#### dimension.html
**Purpose**: Generic layout for individual taxonomy tags (e.g., a specific sector, market, etc.).

**Used for**: Tag detail pages like `/en/discover/sectors/wine/`

**Key includes**:
- `collections/dimensions/discovery-navigation.html`
- `market-sector-highlight.html`
- `collections/brands/related-brands-list.html`

**Key content sections**:
- Dimension-type navigation
- Tag description content (`{{ content }}`)
- Featured brands section
- Related brands listing
- Related insights

#### dimension-specific/sectors.html, markets.html, etc.
**Purpose**: Specialized layouts for dimension-type index pages.

**Used for**: Dimension index pages like `/en/discover/sectors/`

**Key includes**:
- Dimension-specific components
- `collections/dimensions/dimension-list.html`

**Key content sections**:
- Dimension listing
- Dimension-specific content

### Insight Layouts

#### insight.html
**Purpose**: Displays individual insight articles with metadata and related content.

**Used for**: Individual insight articles (`_insights/{lang}/{insight}.md`)

**Key includes**:
- `components/indicators/content-type-indicator.html`
- `components/images/responsive-image.html`

**Key content sections**:
- Article metadata header
- Main article content (`{{ content }}`)
- Taxonomy tags
- Related content sidebar

#### insights.html
**Purpose**: Main insights listing page with filtering capabilities.

**Used for**: Insights index pages (`pages/{lang}/insights.md`)

**Key includes**:
- `components/cards/insight-card.html`
- `collections/insights/latest-insights-grid.html`

**Key content sections**:
- Latest insights grid
- Filtering sidebar
- Category lists

#### insights-type.html
**Purpose**: Displays insights filtered by a specific type/category.

**Used for**: Category-filtered insight pages (`pages/{lang}/insights/types/{type}.md`)

**Key includes**:
- `components/cards/insight-card.html`

**Key content sections**:
- Category description
- Filtered insights listing

### Specialized Layouts

#### market-sector.html
**Purpose**: Displays the intersection of a specific market and sector.

**Used for**: Market-sector intersection pages like `/en/discover/markets/russia/sectors/wine/`

**Key includes**:
- `components/cards/brand-card.html`
- `components/icons/icon.html`

**Key content sections**:
- Market-sector description
- Key highlights
- Regional information
- Related brands
- Navigation links

#### styleguide.html
**Purpose**: Design system documentation and component showcase.

**Used for**: Design system documentation pages

**Key includes**:
- `styleguide/code-example.html`
- `styleguide/color-swatch.html`
- `styleguide/type-sample.html`

**Key content sections**:
- Component examples
- Design token documentation
- Usage guidelines

## Front Matter Variables

These are common front matter variables used across layouts:

| Variable | Type | Used In | Purpose |
|----------|------|---------|---------|
| `layout` | String | All markdown files | Specifies which layout to use |
| `title` | String | All layouts | Page title (falls back to site title) |
| `lang` | String | All layouts | Language code (en, ru, zh) |
| `permalink` | String | All layouts | Custom URL path |
| `discovery_path` | String | Discovery layouts | Current dimension path |
| `tag_type` | String | dimension.html | Type of dimension tag |
| `featured` | Boolean | Multiple layouts | Whether content is featured |
| `featured_level` | Number | brand.html | Level of feature detail (0-2) |
| `premium` | Boolean | Multiple layouts | Whether content is premium |

## Multilingual Support

All layouts support multilingual functionality via:

- Language-specific templates and includes
- `{{ site.data.translations[page.lang] }}` for UI text
- `{{ site.data.dimensions[page.lang] }}` for taxonomy translations
- Language-aware permalinks

## Layout-specific JavaScript

Some layouts include embedded JavaScript:

- `brand.html`: Map initialization for location display
- `brands.html`: Filtering and sorting functionality
- `dimension.html`: Filtering and carousel behavior

## Best Practices for Using These Layouts

1. **Always set the language**: Ensure `lang` is set in front matter for proper translations
2. **Use consistent permalinks**: Follow the pattern `/{lang}/{section}/{slug}/`
3. **Minimize logic in content files**: Keep Liquid logic in layouts or includes
4. **Pass explicit parameters**: When using includes, pass named parameters
5. **Document dependencies**: Note which includes each layout requires

## Adding New Layouts

When adding new layouts:

1. Extend `default.html` or another appropriate base
2. Follow established naming conventions
3. Extract complex logic to includes
4. Document the layout in this README
5. Test with all supported languages

## Related Documentation

- See `_includes/README.md` for documentation on available includes
- See `docs/component-relationships.md` for mapping between layouts and includes
- See `_layouts/layouts_structure.txt` for a tree diagram of the layouts directory