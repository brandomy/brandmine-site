# Brandmine Site Structure & Content Strategy

## Overview

This document outlines the information architecture, content strategy, and technical implementation for the Brandmine site. The platform aims to showcase consumer brands from BRICS+ countries, with a focus on helping international partners discover brands with cross-border potential.

## Core Site Structure

The Brandmine site is organized around five primary sections:

1. **Home** - Entry point and overview of the platform
2. **Brands** - Comprehensive database of brand profiles with filtering
3. **Discover** - Multiple taxonomy-based discovery paths
4. **Insights** - Storytelling content that highlights brands and markets
5. **About** - Company information and contact details

## Technical Implementation

The site is built using a Jekyll-based architecture with three primary collections:

1. **Brands Collection** (`_brands/`)
   - Core product information - what people search for
   - Organized by language first, then by brand
   - Contains structured data about each brand

2. **Insights Collection** (`_insights/`)
   - Storytelling content that highlights brands
   - Organized by language first, then by content type
   - Contains long-form content with metadata

3. **Tags Collection** (`_tags/`)
   - Taxonomy definitions that power filtering
   - Organized by language first, then by tag type
   - Contains metadata about each classification term

This collection-based approach creates a clean, maintainable structure that supports multilingual content (English, Russian, Chinese) while enabling powerful filtering and discovery.

## Taxonomy System

The Brandmine taxonomy consists of four dimensions that are applied consistently across brands and insights:

1. **Sectors** - Industry categories (e.g., Hotels & Resorts, Gourmet Foods)
2. **Markets** - Geographic regions (primarily BRICS+ countries)
3. **Attributes** - Distinctive brand qualities (e.g., Heritage Brand, Founder-Led)
4. **Signals** - Business readiness indicators (e.g., Export Ready, Investment Ready)

This taxonomy powers the filtering system throughout the site and connects brands to relevant insights.

## Discovery Paths

The "Discover" section provides four pathways for exploring content:

1. **By Sector** - Finding brands in specific industry categories
2. **By Market** - Exploring brands from particular geographic regions
3. **By Attribute** - Discovering brands with specific qualities or characteristics
4. **By Signal** - Identifying brands with particular business readiness indicators

Each discovery path has its own landing page with featured content and filtering options.

## Insights Content Strategy

The Insights section is focused on storytelling rather than deep analysis, organized into four content categories:

1. **Founder's Journeys**
   - The stories behind the brands and the people who created them
   - Focus on origin stories, challenges overcome, and visions
   - Example: "From University Project to Market Leader: TeaTime's Story"

2. **Brand Spotlights**
   - Introducing noteworthy BRICS+ brands gaining momentum
   - Highlighting what makes brands unique and interesting
   - Example: "Rising Star: How This Boutique Moscow Hotel Is Redefining Luxury"

3. **Market Milestones**
   - Notable achievements and expansion moments for BRICS+ brands
   - Coverage of significant developments, partnerships, and recognition
   - Example: "Russian Spirits Brand Secures Major European Distribution Deal"

4. **Cultural Signatures**
   - Distinctive features that give BRICS+ brands their unique identity
   - Highlighting design aesthetics, traditional elements, or techniques
   - Example: "The Art of the Samovar: How Russian Tea Brands Maintain Traditions"

Each insight is tagged with relevant sectors, markets, attributes, and signals, creating connections to brand profiles and enabling rich filtering.

## Content Relationships

The site creates connections between content through:

1. **Taxonomy-Based Relationships**
   - Brands and insights sharing the same tags are automatically related
   - Users can filter by any combination of tags

2. **Explicit Brand References**
   - Insights can explicitly reference specific brands
   - Brand profiles can show insights that mention them

3. **Category Pages**
   - Users can browse all content within a specific category
   - Summary statistics showcase the breadth of content

These relationships enable multiple discovery paths and create a network of connections that guide users through the content.

## Premium Content Strategy

The site will implement a tiered content approach:

1. **Free Access**
   - Basic brand information
   - General insights content
   - Basic filtering capabilities

2. **Premium Access**
   - Signal data (business readiness indicators)
   - In-depth brand information
   - Advanced filtering capabilities
   - Exclusive insights content

This approach establishes clear value differentiation while providing free users with enough content to understand the platform's value.

## Multilingual Implementation

All content is organized by language first, with parallel structures for:

- English (`/en/`)
- Russian (`/ru/`)
- Chinese (`/zh/`)

Each language has its own complete set of brands, insights, and tags, with consistent URLs and navigation structure.

## Technical Directory Structure

```
brandmine/
├── _brands/
│   ├── en/
│   │   ├── teatime.md
│   │   └── ...
│   ├── ru/
│   └── zh/
├── _insights/
│   ├── en/
│   │   ├── teatime-founders-journey.md
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
    │   ├── insights.md
    │   └── about.md
    ├── ru/
    └── zh/
```

## Implementation Priorities

For the MVP phase, implementation priorities are:

1. Core structure and navigation setup
2. Brand profiles with basic filtering
3. Discovery paths with taxonomy-based organization
4. Initial insights content across all four categories
5. Multilingual framework for all content types

This phased approach prioritizes the core functionality while establishing the foundation for future expansion.

## Content Production Strategy

For the initial MVP launch:

1. **Brands:** Focus on 15-20 high-quality brand profiles across 3-4 sectors
2. **Insights:** Create 2-3 pieces of content for each of the four categories
3. **Tags:** Establish the complete taxonomy structure even before all content exists

This focused approach creates a compelling demonstration of the platform's value while keeping content production manageable.

## Business Value Alignment

This structure aligns with Brandmine's business value in several ways:

1. **Lead Generation:** Insights content attracts potential partners while brand profiles provide specific leads
2. **Value Demonstration:** Tag-based organization showcases the depth of knowledge and connections
3. **Monetization Pathways:** Premium content model creates clear revenue opportunities
4. **Efficiency:** Collection-based structure minimizes technical complexity while maximizing content value

The focus on storytelling leverages Brandmine's unique ability to bring visibility to brands that are currently hidden behind language, cultural, and information barriers.
