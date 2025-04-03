# Brandmine Consolidated Strategy & Site Structure

## Executive Summary

This document outlines the comprehensive strategy and structure for the Brandmine platform. The site showcases consumer brands from BRICS+ countries through structured brand profiles and storytelling-focused insights. The architecture prioritizes discoverability through multiple pathways while supporting multilingual content (English, Russian, Chinese).

## Core Site Structure

```
Home
├── Brands (comprehensive search & filtering)
├── Discover (dropdown menu)
│   ├── Sectors (industry categories)
│   ├── Markets (geographic regions)
│   ├── Attributes (brand qualities)
│   ├── Signals (readiness indicators)
├── Insights (storytelling content)
│   ├── Founder's Journeys
│   ├── Brand Spotlights
│   ├── Market Milestones
│   ├── Cultural Signatures
└── About
    ├── Our Mission
    ├── Team
    └── Contact
```

## Technical Implementation

### Collections Architecture

The site uses three primary Jekyll collections:

1. **Brands Collection** (`_brands/`)
   - Core product information organized by language
   - Contains structured metadata and content

2. **Insights Collection** (`_insights/`)
   - Storytelling content with four distinct types
   - Explicitly connected to brands through tags

3. **Tags Collection** (`_tags/`)
   - Four dimensions: Sectors, Markets, Attributes, Signals
   - Powers filtering and discovery functionality

### JSON Data Generation

A critical technical component is the JSON data file that enables search and filtering:

```
{
  "brands": [
    {
      "name": "Brand Name",
      "url": "/en/brands/brand-name/",
      "description": "Brand description...",
      "sector": "Hotels & Resorts",
      "country": "Russia",
      "attributes": ["Heritage Brand", "Regional Icon"],
      "signals": ["Investment Ready"],
      "logo": "/assets/images/brands/brand-logo.png",
      "premium": false,
      "language": "en"
    }
  ],
  "sectors": [...],
  "markets": [...],
  "attributes": [...],
  "signals": [...]
}
```

### Client-Side Search & Filtering

Key implementation features:
- Fetch JSON data on page load
- Filter by multiple taxonomy dimensions simultaneously
- Search across brand names and descriptions
- Update results in real-time with visual feedback
- Progressive loading for performance optimization

### Premium Content Controls

Premium content is managed through:
- Content marking with classes and front matter flags
- Client-side access verification via localStorage
- Visual indicators for premium content
- Clear upgrade pathways for users

### Image Strategy

The site implements a comprehensive image approach:
- Organized directory structure by brand and content type
- Standardized naming conventions with purpose identifiers
- Responsive image sizes (400w, 800w, 1200w, 1600w)
- Automated image processing for consistency
- Jekyll includes for responsive image implementation

## Content Relationships

The site creates connections through:

1. **Taxonomy-Based Relationships**: Brands and insights sharing the same tags
2. **Explicit Brand References**: Direct connections between content
3. **Category Pages**: Unified views of content by classification

## UI Layout Structures

### Home Page

```
┌─────────────────────────────────────────┐
│               HEADER NAV                │
├─────────────────────────────────────────┤
│            HERO BANNER                  │
├─────────────────────────────────────────┤
│            SEARCH SECTION               │
├─────────────────────────────────────────┤
│           FEATURED BRANDS               │
├─────────────────────────────────────────┤
│           DISCOVERY PATHS               │
├─────────────────────────────────────────┤
│            LATEST INSIGHTS              │
├─────────────────────────────────────────┤
│               FOOTER                    │
└─────────────────────────────────────────┘
```

### Brands Page

Multi-dimensional filtering system with:
- Simultaneous selection across taxonomy dimensions
- Search within filtered results
- Rich brand card display
- Progressive loading of results

### Discover Section

Template for each discovery path with:
- Path-specific header
- Featured items in category
- Complete grid of all items
- Related insights connections

### Insights Section

Content organized into four storytelling categories with real examples:
- **Founder's Journeys**: "From University Project to Market Leader: TeaTime's Story"
- **Brand Spotlights**: "Rising Star: How This Boutique Moscow Hotel Is Redefining Luxury"
- **Market Milestones**: "Russian Spirits Brand Secures Major European Distribution Deal"
- **Cultural Signatures**: "The Art of the Samovar: How Russian Tea Brands Maintain Traditions"

## Technical Considerations

### Performance
- Minimize DOM size with pagination
- Use efficient filtering methods
- Implement lazy loading for images
- Cache filter results when possible

### Accessibility
- Maintain proper focus management
- Ensure keyboard navigation
- Use ARIA attributes appropriately
- Provide sufficient color contrast

### Security
- Sanitize user inputs
- Avoid XSS vulnerabilities
- Secure premium content access
- Protect sensitive API endpoints

## Premium Content Strategy

Two-tiered content approach:
1. **Free Access**: Basic information and filtering
2. **Premium Access**: Detailed signals data, advanced filtering, exclusive insights

## Multilingual Implementation

Organization by language first:
- English (`/en/`)
- Russian (`/ru/`)
- Chinese (`/zh/`)

Each language has parallel content with consistent file naming across languages.

## Technical Directory Structure

```
brandmine/
├── _brands/                # Brand collection by language
├── _insights/              # Insights collection by language
├── _tags/                  # Taxonomy collection by language
├── _data/                  # Translation files and data
├── _includes/              # Reusable components
├── _layouts/               # Page templates
├── assets/                 # Static assets (CSS, JS, images)
└── pages/                  # Content pages by language
```

## Content Production Strategy

Initial MVP targets:
1. **Brands**: 15-20 profiles across 3-4 sectors
2. **Insights**: 2-3 pieces for each category
3. **Tags**: Complete taxonomy structure

## Business Value Alignment

1. **Lead Generation**: Insights attract partners while profiles provide leads
2. **Value Demonstration**: Tag-based organization showcases knowledge
3. **Monetization**: Clear premium content pathways
4. **Efficiency**: Collection structure balances simplicity and power

## Implementation Priorities

1. Core navigation and structure
2. Brand profiles with tagging
3. Filtering functionality
4. Discovery paths
5. Initial insights content
6. About section

## Next Steps

1. Complete navigation restructuring
2. Implement insights templates
3. Create example content
4. Build filtering functionality
5. Establish tag systems
6. Develop content relationships
