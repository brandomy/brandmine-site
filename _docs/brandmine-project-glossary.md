# Brandmine Project Glossary

## 🏷️ Taxonomy & Classification

**Dimensions** - The 4-type classification system for organizing brands: markets, sectors, attributes, signals

**Markets** - Geographic regions/countries (e.g., russia, brazil, china, india)

**Sectors** - Industry categories (e.g., artisanal-spirits, natural-beauty, wine)

**Attributes** - Brand characteristics (e.g., founder-led, heritage-brand, sustainability-pioneer)

**Signals** - Growth/investment indicators (e.g., export-ready, franchise-ready, rapid-growth)

**Taxonomy Tag** - Visual label displaying dimension information with color coding

**Dimension Cloud** - Tag cluster display showing related dimensions for a brand/founder

## 🎨 Design & Layout

**Panel System** - Standardized content wrapper with variants (light, hero, hero-subtle, hero-image)

**Linear Architecture** - Single-column, section-based layout (no sidebars)

**Hero Tiers** - 3-level hero system: navigation pages, profiles, editorial content

**BEM** - CSS naming convention: Block__Element--Modifier

**Logic Light** - Template philosophy minimizing conditional logic, maximizing data-driven content

**Visual Taxonomy** - Color-coded system: sectors=mint, markets=blue, attributes=orange, signals=purple

## 📊 Content Structure

**Two-Tier Approach** - Basic listings (100+) vs. featured profiles (2-3) per sector

**Collection Types** - Jekyll collections: brands, founders, dimensions, insights, posts

**Ref System** - Cross-language content linking via `ref` attribute

**Sectioning** - Page structure using `sections` array in front matter

**Impact Section** - Standardized messaging section on topline pages

## 🌐 Multilingual System

**Language Codes** - `en` (English), `ru` (Russian), `zh` (Chinese)

**Translation Files** - YAML files in `_data/translations/{lang}.yml`

**Current Lang** - Active language context for template rendering

**Fallback System** - Default to English when translations missing

**Language Switcher** - Navigation component for switching between languages

## 🖼️ Image Standards

**Aspect Ratios** - 3:2 (content), 2:3 (portraits), 1:1 (icons/profiles)

**Responsive Sizes** - 400w, 800w, 1200w, 1600w variants

**Processing Scripts** - ImageMagick automation for optimization

**Image Styles** - TM (Textured Minimalism), MPTM (Muted Pastel), Flat Colour, Teal Filter

**Collection Image** - Unified responsive image component

## 📝 Content Categories

**Brand Spotlight** - In-depth brand profiles (insights category)

**Founder's Journey** - Personal founder stories (insights category)

**Market Momentum** - Brand achievements/milestones (insights category)

**Location Intelligence** - Geographic context articles (insights category)

**Founders' Journal** - Personal blog documenting Brandmine development (includes company news)

## 🔧 Development Terms

**Jekyll Doctor** - Built-in Jekyll validation tool

**Bundle Exec** - Ruby gem execution prefix

**SCSS Partials** - Files prefixed with underscore (import-only)

**Liquid Templating** - Jekyll's template language

**Front Matter** - YAML metadata at top of Markdown files

**Site Data** - Global data accessible via `site.data`

## 🏢 Business Context

**BRICS+** - Brazil, Russia, India, China, South Africa + additional emerging economies

**Founder-Led** - Brands where founders remain actively involved

**Emerging Markets** - Developing economies with growth potential

**Heritage Brand** - Brands with significant historical/cultural legacy

**Artisanal Excellence** - Handcrafted, small-batch production approach

## 🎯 Discovery & Navigation

**Discovery Section** - Main taxonomy exploration page

**Cross-Navigation** - Links between related dimensions

**Universal Search** - Site-wide search functionality

**Filter Interface** - Multi-dimensional brand filtering

**Breadcrumbs** - Hierarchical navigation trail

**Related Brands** - Algorithmically suggested similar brands

## 📋 Technical Processes

**Pre-commit Checks** - Validation scripts run before Git commits

**Image Attribution** - Credit tracking in `_data/image_attributions.yml`

**JSON Generation** - Automated creation of search indexes

**Language Consistency** - Cross-language content validation

**Responsive Testing** - Multi-device compatibility verification