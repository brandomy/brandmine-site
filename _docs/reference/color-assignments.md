# Color Assignment Reference Guide

This document provides a comprehensive reference for color assignments across Brandmine's dimension types and content categories to ensure consistent visual taxonomy and reduce development time.

## Color System Overview

Brandmine uses a structured color system with CSS custom properties (variables) defined in `assets/css/tokens/tokens.scss`. Each color family includes multiple shades (50-950) following modern design token practices.

## Insights Categories Color Assignments

Insights articles are organized into four standardized categories, each with distinct color coding:

### Brand Spotlight
- **Color Family**: Secondary (Orange)
- **Header Color**: `var(--secondary-700)` 
- **Card Badge**: `var(--secondary-100)` background, `var(--secondary-800)` text
- **Card Border**: `var(--secondary-400)` left border
- **Usage**: In-depth profiles of noteworthy BRICS+ brands
- **Implementation**: `assets/css/pages/insights/category-highlights.scss`, `assets/css/components/cards/insight-card.scss`

### Founder's Journey  
- **Color Family**: Accent (Indigo) + Primary (Teal) headers
- **Header Color**: `var(--primary-700)`
- **Card Badge**: `var(--accent-100)` background, `var(--accent-800)` text
- **Card Border**: `var(--accent-400)` left border
- **Usage**: Personal stories behind brands and visionaries
- **Implementation**: `assets/css/pages/insights/category-highlights.scss`, `assets/css/components/cards/insight-card.scss`

### Location Intelligence
- **Color Family**: Sky (Blue) 
- **Header Color**: `var(--sky-700)`
- **Card Badge**: `var(--sky-100)` background, `var(--sky-800)` text
- **Card Border**: `var(--sky-400)` left border
- **Usage**: Geographical insights and regional context
- **Implementation**: `assets/css/pages/insights/category-highlights.scss`, `assets/css/components/cards/insight-card.scss`

### Market Momentum
- **Color Family**: Olive (Green)
- **Header Color**: `var(--olive-700)`
- **Card Badge**: `var(--olive-100)` background, `var(--olive-800)` text
- **Card Border**: `var(--olive-400)` left border
- **Usage**: Achievements, milestones, and expansion moments
- **Implementation**: `assets/css/pages/insights/category-highlights.scss`, `assets/css/components/cards/insight-card.scss`

## Dimension Types Color Assignments

The four-dimensional taxonomy system uses distinct color families for visual categorization:

### Sectors
- **Color Family**: Primary (Teal)
- **Background**: `var(--primary-100)`
- **Text**: `var(--primary-800)`
- **Border**: `var(--primary-200)`
- **Hover**: `var(--primary-200)` background
- **Usage**: Industry categories (e.g., natural-beauty, wine, hotels-resorts)
- **Examples**: Artisan Ceramics, Wine, Natural Beauty
- **Implementation**: `assets/css/components/dimensions/dimension.scss`

### Markets
- **Color Family**: Sky (Blue)
- **Background**: `var(--sky-100)`
- **Text**: `var(--sky-800)`
- **Border**: `var(--sky-200)`
- **Hover**: `var(--sky-200)` background
- **Usage**: Regional focus areas (e.g., russia, brazil, india, china)
- **Examples**: Russia, Brazil, China, India
- **Implementation**: `assets/css/components/dimensions/dimension.scss`

### Attributes
- **Color Family**: Amber (Gold)
- **Background**: `var(--amber-100)`
- **Text**: `var(--amber-800)`
- **Border**: `var(--amber-200)`
- **Hover**: `var(--amber-200)` background
- **Usage**: Brand qualities (e.g., founder-led, heritage-brand, artisanal-excellence)
- **Examples**: Founder-Led, Heritage Brand, Premium Positioning
- **Implementation**: `assets/css/components/dimensions/dimension.scss`

### Signals
- **Color Family**: Accent (Indigo)
- **Background**: `var(--accent-100)`
- **Text**: `var(--accent-800)`
- **Border**: `var(--accent-200)`
- **Hover**: `var(--accent-200)` background
- **Usage**: Growth potential indicators (e.g., export-ready, franchise-ready, rapid-growth)
- **Examples**: Export Ready, Investment Ready, Rapid Growth
- **Implementation**: `assets/css/components/dimensions/dimension.scss`

## Color Values Reference

### Primary Colors (Teal)
```scss
--primary-50: #f0fdfa;
--primary-100: #ccfbf1;
--primary-200: #99f6e4;
--primary-300: #5eead4;
--primary-400: #2dd4bf;
--primary-500: #14b8a6;
--primary-600: #0d9488;
--primary-700: #0f766e;
--primary-800: #115e59;
--primary-900: #134e4a;
--primary-950: #042f2e;
```

### Secondary Colors (Orange)
```scss
--secondary-50: #fff7ed;
--secondary-100: #ffedd5;
--secondary-200: #fed7aa;
--secondary-300: #fdba74;
--secondary-400: #fb923c;
--secondary-500: #f97316;
--secondary-600: #ea580c;
--secondary-700: #c2410c;
--secondary-800: #9a3412;
--secondary-900: #7c2d12;
--secondary-950: #431407;
```

### Sky Colors (Blue)
```scss
--sky-50: #f0f9ff;
--sky-100: #e0f2fe;
--sky-200: #bae6fd;
--sky-300: #7dd3fc;
--sky-400: #38bdf8;
--sky-500: #0ea5e9;
--sky-600: #0284c7;
--sky-700: #0369a1;
--sky-800: #075985;
--sky-900: #0c4a6e;
--sky-950: #082f49;
```

### Amber Colors (Gold)
```scss
--amber-50: #fffbeb;
--amber-100: #fef3c7;
--amber-200: #fde68a;
--amber-300: #fcd34d;
--amber-400: #fbbf24;
--amber-500: #f59e0b;
--amber-600: #d97706;
--amber-700: #b45309;
--amber-800: #92400e;
--amber-900: #78350f;
--amber-950: #451a03;
```

### Olive Colors (Green)
```scss
--olive-50: #f7f8f4;
--olive-100: #e9ecdc;
--olive-200: #d4dabc;
--olive-300: #b9c393;
--olive-400: #9eab6f;
--olive-500: #869455;
--olive-600: #687142;
--olive-700: #525937;
--olive-800: #434630;
--olive-900: #3a3d2b;
--olive-950: #1f2016;
```

### Accent Colors (Indigo)
```scss
--accent-50: #eef2ff;
--accent-100: #e0e7ff;
--accent-200: #c7d2fe;
--accent-300: #a5b4fc;
--accent-400: #818cf8;
--accent-500: #6366f1;
--accent-600: #4f46e5;
--accent-700: #4338ca;
--accent-800: #3730a3;
--accent-900: #312e81;
--accent-950: #1e1b4b;
```

## Implementation Guidelines

### Adding New Content with Colors

1. **For Insights Articles**: Assign one of the four insight categories and use corresponding color variables
2. **For Dimension Tags**: Use the appropriate dimension type color (sector=teal, market=blue, attribute=amber, signal=indigo)
3. **For Custom Components**: Reference this guide rather than hardcoding colors

### CSS Best Practices

- Always use CSS custom properties: `var(--primary-700)` instead of hex codes
- Maintain contrast ratios for accessibility (use 700+ shades for text on light backgrounds)
- Use 100-level backgrounds with 900-level text for optimal readability
- Apply colors consistently across related components

### Common Mistakes to Avoid

- **Don't mix insight and dimension colors**: Insights use secondary/primary/sky/olive, dimensions use primary/sky/amber/accent
- **Don't use raw hex values**: Always reference CSS custom properties
- **Don't create new color assignments**: Use existing taxonomy colors to maintain visual consistency

## File Locations

- **Color Tokens**: `assets/css/tokens/tokens.scss`
- **Dimension Colors**: `assets/css/components/dimensions/dimension.scss`
- **Insight Category Colors**: `_includes/pages/insights/category-highlights.scss`
- **Color Variables**: All CSS files using `var(--color-name-shade)`

## Quick Reference

| Content Type | Color Family | Background | Text | Border/Left Border | Use Case |
|-------------|--------------|------------|------|--------------------|----------|
| **Dimensions** |
| Sectors | Primary (Teal) | `--primary-100` | `--primary-800` | `--primary-200` | Industry categories |
| Markets | Sky (Blue) | `--sky-100` | `--sky-800` | `--sky-200` | Regional focus |
| Attributes | Amber (Gold) | `--amber-100` | `--amber-800` | `--amber-200` | Brand qualities |
| Signals | Accent (Indigo) | `--accent-100` | `--accent-800` | `--accent-200` | Growth indicators |
| **Insights Categories** |
| Brand Spotlight | Secondary (Orange) | `--secondary-100` | `--secondary-800` | `--secondary-400` | Brand profiles |
| Founder's Journey | Accent (Indigo) | `--accent-100` | `--accent-800` | `--accent-400` | Founder stories |
| Location Intelligence | Sky (Blue) | `--sky-100` | `--sky-800` | `--sky-400` | Geographic insights |
| Market Momentum | Olive (Green) | `--olive-100` | `--olive-800` | `--olive-400` | Growth milestones |

**Note**: Insights category headers use different colors: Brand Spotlight (`--secondary-700`), Founder's Journey (`--primary-700`), Location Intelligence (`--sky-700`), Market Momentum (`--olive-700`).

---

*Last updated: May 27, 2025*
*For questions or updates to this guide, consult the development team or update this document directly.*