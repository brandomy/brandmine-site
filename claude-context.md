# Brandmine Jekyll Website Context
Generated: 2025-03-18 08:24

## Focus Area: Styling

This context is focused on the styling aspects of the website.

## Site Configuration
## Configuration Details
```yaml
title: Brandmine
email: randal@brandmine.io
description: Amplifying consumer brands of the BRICS+
# Change this line
baseurl: "" # Empty for local development

...
collections:
  brands:
    output: true
    permalink: /:collection/:path/
...
defaults:
  - scope:
      path: ""
    values:
      layout: default
  - scope:
...
```


## Site Structure
### Directories
```
- _layouts/ (       1 files)
  - default.html
- _includes/ (       4 files)
  - footer.html
  - google-analytics.html
  - header.html
  - language-selector.html
- _data/ (       4 files)
  - _data/sectors.yml
  - _data/translations/en.yml
  - _data/translations/ru.yml
  - _data/translations/zh.yml
- assets/ (      59 files total)
  - assets/css/ (      22 CSS files)
    - assets/css/layout/panels.css
    - assets/css/main.css
    - assets/css/components/team.css
    - assets/css/components/features.css
    - assets/css/components/solutions.css
    - assets/css/components/text.css
    - assets/css/components/forms.css
    - assets/css/components/navigation.css
    - assets/css/components/mobile-fixes.css
    - assets/css/components/buttons.css
    - assets/css/components/cards.css
    - assets/css/components/layouts.css
    - assets/css/pages/home.css
    - assets/css/pages/markets.css
    - assets/css/pages/sectors.css
    - assets/css/pages/brands.css
    - assets/css/pages/about.css
    - assets/css/pages/russian-sectors.css
    - assets/css/tokens/typography.css
    - assets/css/tokens/spacing.css
    - assets/css/tokens/breakpoints.css
    - assets/css/tokens/colors.css
  - assets/fonts/ (      22 font files)
    - assets/fonts/pt-serif_caption-regular.woff2
    - assets/fonts/pt-sans_regular.woff2
    - assets/fonts/NotoSerifSC-Regular.woff2
    - assets/fonts/pt-mono_bold.woff2
    - assets/fonts/pt-serif_italic.woff2
    - assets/f
...(truncated)...

## Key Styling Files

### ./_site/assets/css/main.css
```
/* Basic styles */
body {
  line-height: 1.6;
  color: var(--neutral-600);
  margin: 0;
  padding: 0;
}

body, html {
  margin: 0;
  padding: 0;
  width: 100%;
  overflow-x: hidden; /* Prevents horizontal scrolling */
}

.wrapper {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--space-4); /* 1rem = 16px, closest to 20px */
}```

### ./assets/css/main.css
```
/* Basic styles */
body {
  line-height: 1.6;
  color: var(--neutral-600);
  margin: 0;
  padding: 0;
}

body, html {
  margin: 0;
  padding: 0;
  width: 100%;
  overflow-x: hidden; /* Prevents horizontal scrolling */
}

.wrapper {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--space-4); /* 1rem = 16px, closest to 20px */
}```

### ./_site/assets/css/components/team.css
```
/* ==========================================================================
   Team Components
   ==========================================================================
   Styles for team member profiles, sections, and related elements.
*/

/* Team section layout */
.team-section {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-8); /* 2rem */
  margin: var(--space-8) 0; /* 2rem 0 */
}

/* Individual team member cards */
.team-member {
  flex: 1;
  min-width: 300px;
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  padding: var(--space-8); /* 2rem */
  border: 1px solid var(--neutral-200);
}

/* Team member photo */
.team-photo {
  width: 180px;
  height: 180px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: var(--space-6); /* 1.5rem */
  border: 3px solid var(--primary-400);
  display: block;
  margin-left: auto;
  margin-right: auto;
}

/* Team member details */
.team-member h3 {
  margin-top: 0;
  margin-bottom: var(--space-2); /* 0.5rem */
  color: var(--neutral-800);
  text-align: center;
}

.team-title {
  color: var(--primary-600);
  font-weight: 600;
  margin-top: 0;

...(truncated)...
```

### ./_site/assets/css/components/features.css
```
/* ==========================================================================
   Feature Components
   ==========================================================================
   Styles for feature grids, feature items, and icons used to display 
   feature lists throughout the site.
*/

/* === Feature Grid System === */
/* 
 * The feature grid creates a 3-column layout on desktop with vertically arranged
 * feature items (icon on top, text below). On mobile screens (<990px), it switches
 * to a single column with horizontally arranged items (icon on left, text on right).
 */
 .feature-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* 3 columns on desktop */
  gap: var(--space-8); /* 2rem */
  margin: var(--space-8) 0; /* 2rem 0 */
  margin-top: var(--space-12); /* 2.5rem is closest to var(--space-12) */
}

.feature-item {
  display: flex;
  flex-direction: column; /* Vertical arrangement on desktop */
  text-align: center;
  align-items: center;
  margin-left: auto;
  margin-right: auto;
  max-width: 800px;     /* Prevent excessive stretching */
}

.feature-icon {
  background-color: white;
  color: var(--secondary-700);
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto var(--space-4); /* 0 auto 1rem */
  transition: transform 0.3s ease;
}

.feature-item:hover .feature-icon {
  transform: scale(1.1);
}

.feature-icon svg {
  width: 2rem;

...(truncated)...
```

## Recent Styling Development

## 2025-03-11: Implemented Multilingual Newsletter Forms



## Content Summary
- Languages:        3 (en ru zh )
  - en:        6 pages
  - ru:        6 pages
  - zh:        6 pages
- Blog posts:        1
  - Date range:  to 
- Translation files:        3
  - Translation coverage:
    - en (primary):       30 keys
    - ru:       30 keys (100% coverage)
    - zh:       30 keys (100% coverage)


## Environment & Dependencies
- Jekyll version: 3.10.0
- Ruby version: 3.4.2
- Key dependencies:
  -   github-pages
  -   http_parser.rb (~> 0.6.0)
  -   jekyll-feed (~> 0.12)
  -   minima (~> 2.5)
  -   tzinfo (>= 1, < 3)
  -   tzinfo-data
  -   wdm (~> 0.1)
  - BUNDLED WITH
  -    2.6.5



## Working with Claude

When helping with this Jekyll website, please:

1. Consider the multilingual structure (EN, RU, ZH) in all solutions
2. Provide complete code when suggesting changes
3. Maintain the existing file structure and naming conventions
4. Explain the reasoning behind technical decisions
5. Consider mobile responsiveness in layout changes

When writing code, use:
- Liquid templating for Jekyll
- Modern CSS practices
- Vanilla JavaScript where possible
