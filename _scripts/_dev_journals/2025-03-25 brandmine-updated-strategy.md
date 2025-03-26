# Brandmine Updated Strategy & Site Structure

## Executive Summary

This document outlines the refined site structure and content strategy for the Brandmine MVP. The platform is designed to showcase consumer brands from BRICS+ countries through a combination of structured brand profiles and storytelling-focused insights. The architecture prioritizes discoverability through multiple pathways while maintaining a clean, efficient implementation approach.

## Core Site Structure

```
Home
│
├── Brands (comprehensive search & filtering)
│
├── Discover (dropdown menu)
│   ├── Sectors (industry categories)
│   ├── Markets (geographic regions)
│   ├── Attributes (brand qualities)
│   ├── Signals (readiness indicators)
│
├── Insights (storytelling content)
│   ├── Founder's Journeys
│   ├── Brand Spotlights
│   ├── Market Milestones
│   ├── Cultural Signatures
│
└── About
    ├── Our Mission
    ├── Team
    └── Contact
```

## Technical Implementation

The site uses three primary Jekyll collections:

1. **Brands Collection** (`_brands/`)
   - Structured brand profiles
   - Organized by language first

2. **Insights Collection** (`_insights/`)
   - Storytelling-focused content 
   - Four distinct content types
   - Explicitly connected to brands

3. **Tags Collection** (`_tags/`)
   - Taxonomy definitions
   - Four dimensions (Sectors, Markets, Attributes, Signals)

This collection-based approach creates a clean, maintainable structure that supports multilingual content while enabling powerful filtering and discovery.

## Home Page Structure

```
┌─────────────────────────────────────────┐
│                                         │
│               HEADER NAV                │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│            HERO BANNER                  │
│     Discover BRICS+ Consumer Brands     │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│            SEARCH SECTION               │
│    Search + Quick Filter Categories     │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│           FEATURED BRANDS               │
│     [Card] [Card] [Card] [Card]         │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│           DISCOVERY PATHS               │
│   [Sectors] [Markets] [Attributes] [Signals]   │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│            LATEST INSIGHTS              │
│     [Card] [Card] [Card]                │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│               FOOTER                    │
│                                         │
└─────────────────────────────────────────┘
```

**Key Components:**
- Hero banner with clear value proposition
- Search functionality with quick filter options
- Showcased featured brands (4-6)
- Visual representation of the four discovery paths
- Latest insights previews (3)
- Call-to-action for more exploration

## Brands Page Structure

```
┌─────────────────────────────────────────┐
│                                         │
│               HEADER NAV                │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│              PAGE HEADER                │
│          Discover BRICS+ Brands         │
│                                         │
├─────────┬───────────────────────────────┤
│         │ ┌─────────────────────────┐   │
│         │ │   SEARCH WITHIN RESULTS │   │
│         │ └─────────────────────────┘   │
│         │                               │
│         │ ┌─────────────────────────┐   │
│  FILTER │ │   ACTIVE FILTERS        │   │
│  PANEL  │ │   [Tag] [Tag] [Clear]   │   │
│         │ └─────────────────────────┘   │
│ Sectors │                               │
│ [✓] A   │         BRAND RESULTS         │
│ [  ] B  │                               │
│ [✓] C   │   [Rich Card with Logo]       │
│         │   [Essential Information]     │
│ Markets │   [Tags & Indicators]         │
│ [✓] X   │                               │
│ [  ] Y  │   [Rich Card with Logo]       │
│ [  ] Z  │   [Essential Information]     │
│         │   [Tags & Indicators]         │
│ Attributes│                             │
│ [✓] 1   │   [Rich Card with Logo]       │
│ [  ] 2  │   [Essential Information]     │
│         │   [Tags & Indicators]         │
│ Signals │                               │
│ [  ] α  │                               │
│ [✓] β   │      LOAD MORE RESULTS        │
│         │      [Progressive Loading]    │
├─────────┴───────────────────────────────┤
│                                         │
│               FOOTER                    │
│                                         │
└─────────────────────────────────────────┘
```

**Key Filtering & Display Features:**

1. **Multi-dimensional Filtering System**
   - Simultaneous selection across all taxonomy dimensions
   - Checkboxes for easy toggling of multiple filter criteria
   - Visual indication of active filters with one-click removal
   - Filter combinations automatically update results in real-time

2. **Advanced Search Capabilities**
   - Search within already-filtered results
   - Type-ahead suggestions for brand names and keywords
   - Search across multiple fields (name, description, products)
   - Maintains active filters while searching

3. **Rich Brand Card Display**
   - Prominent brand logo and visual identity
   - Essential information displayed at a glance:
     - Brand name and founding year
     - Primary sector and market
     - Key attributes and signals as visual indicators
     - Brief description that captures brand essence
   - Clear visual distinction between regular and premium brands

4. **Optimized Results Loading**
   - Initial fast-loading batch of most relevant results
   - "Load more" functionality instead of traditional pagination
   - Progressive loading of additional results as user scrolls
   - Loading indicators that maintain interface responsiveness

This implementation creates a powerful discovery interface that feels like a specialized database while maintaining the simplicity and performance of a static Jekyll site. The brand results update instantly as filters are applied, allowing users to rapidly narrow down to precisely the brands that match their interest criteria.

## Discover Section Structure

Each discover path follows a similar template:

```
┌─────────────────────────────────────────┐
│                                         │
│               HEADER NAV                │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│              PATH HEADER                │
│     [Sectors/Markets/Attributes/Signals]     │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│           FEATURED ITEMS                │
│     [Card] [Card] [Card] [Card]         │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│            ALL ITEMS GRID               │
│                                         │
│  [Item] [Item] [Item] [Item] [Item]     │
│  [Item] [Item] [Item] [Item] [Item]     │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│          RELATED INSIGHTS               │
│     [Card] [Card]                       │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│               FOOTER                    │
│                                         │
└─────────────────────────────────────────┘
```

**Key Components:**
- Path-specific header
- Featured items in that category
- Complete grid of all items in that category
- Related insights that connect to that discovery path
- Each item links to a detail page showing all brands with that classification

## Insights Home Page Structure

```
┌─────────────────────────────────────────┐
│                                         │
│               HEADER NAV                │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│              PAGE HEADER                │
│         Brandmine Insights              │
│                                         │
├─────────────────────────────────────────┤
│                                         │
│           CONTENT CATEGORIES            │
│                                         │
│ ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐ │
│ │Founder's│ │Brand    │ │Market   │ │Cultural │ │
│ │Journeys │ │Spotlights│ │Milestones│ │Signatures│ │
│ └─────────┘ └─────────┘ └─────────┘ └─────────┘ │
│                                         │
├─────────┬───────────────────────────────┤
│         │                               │
│         │                               │
│         │                               │
│ SIDEBAR │      LATEST INSIGHTS          │
│         │                               │
│Categories│  [Featured Insight Card]      │
│         │                               │
│Sectors  │  [Card] [Card] [Card]         │
│         │  [Card] [Card] [Card]         │
│Markets  │                               │
│         │                               │
│Tags     │                               │
│         │                               │
│         │                               │
├─────────┴───────────────────────────────┤
│                                         │
│               FOOTER                    │
│                                         │
└─────────────────────────────────────────┘
```

**Key Components:**
- Clear Insights header
- Four content categories with descriptions:
  - Founder's Journeys
  - Brand Spotlights
  - Market Milestones
  - Cultural Signatures
- Featured/latest insight
- Grid of recent insights
- Sidebar with category filters and popular tags

## About Section Structure

The About section should include:

1. **Our Mission**
   - Company vision and purpose
   - Problem Brandmine solves
   - Value proposition
   - Audience served

2. **Team**
   - Founder profiles
   - Team member bios
   - Expertise and credentials
   - Photos and background information

3. **Contact**
   - Contact form
   - Email address
   - Social media links
   - Office location (if applicable)

## Insights Content Strategy

The Insights section uses storytelling-focused content across four categories:

1. **Founder's Journeys**
   - The stories behind the brands and the people who created them
   - Focus on origin stories, challenges overcome, and visions

2. **Brand Spotlights**
   - Introducing noteworthy BRICS+ brands gaining momentum
   - Highlighting what makes brands unique and interesting

3. **Market Milestones**
   - Notable achievements and expansion moments for BRICS+ brands
   - Coverage of significant developments, partnerships, and recognition

4. **Cultural Signatures**
   - Distinctive features that give BRICS+ brands their unique identity
   - Highlighting design aesthetics, traditional elements, or techniques

This approach emphasizes narrative over analysis, making content production more accessible while still providing value to users.

## Technical Directory Structure

```
brandmine/
├── _brands/
│   ├── en/
│   │   ├── brand-one.md
│   │   └── ...
│   ├── ru/
│   └── zh/
├── _insights/
│   ├── en/
│   │   ├── founders-journey-one.md
│   │   └── ...
│   ├── ru/
│   └── zh/
├── _tags/
│   ├── en/
│   │   ├── sectors/
│   │   ├── markets/
│   │   ├── attributes/
│   │   └── signals/
│   ├── ru/
│   └── zh/
└── pages/
    ├── en/
    │   ├── index.md
    │   ├── brands.md
    │   ├── discover/
    │   │   ├── index.md
    │   │   ├── sectors.md
    │   │   ├── markets.md
    │   │   ├── attributes.md
    │   │   └── signals.md
    │   ├── insights.md
    │   └── about/
    │       ├── index.md
    │       ├── mission.md
    │       ├── team.md
    │       └── contact.md
    ├── ru/
    └── zh/
```

## Implementation Priorities

For the MVP phase, implementation priorities are:

1. Core navigation and site structure
2. Brand profiles with tagging system
3. Brand filtering functionality
4. Discovery paths implementation
5. Initial insights content across all four categories
6. About section core content

## Next Steps

1. Complete navigation restructuring
2. Implement insights collection and templates
3. Create example content for each category
4. Build brand filtering functionality
5. Establish tag display systems
6. Develop relationships between brands and insights

This phased approach prioritizes the core functionality while establishing the foundation for future expansion.
