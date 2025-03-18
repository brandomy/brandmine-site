# Brandmine Site Summary
Generated on Tue 18 Mar 2025 08:24:12 +08

## Repository Status
Current branch: main
Last commit: Refactor homepage styles for improved organization and responsiveness
Last commit date: 2025-03-18 06:21
Modified files:        5
Recent activity:
- 2025-03-18: Refactor homepage styles for improved organization and responsiveness
- 2025-03-18: Streamlined our font strategy for each language version.
- 2025-03-18: Update site summary and remove redundant font-family declaration
- 2025-03-18: Improved mobile responsiveness and fixed hero panel vertical centering
- 2025-03-17: Force rebuild of site

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
    - assets/fonts/NotoSansSC-Bold.woff2
    - assets/fonts/pt-serif_bold.woff2
    - assets/fonts/NotoSerifSC-Bold.woff2
    - assets/fonts/pt-sans_caption-regular.woff2
    - assets/fonts/pt-sans_bold.woff2
    - ... and 12 more font files
  - assets/images/ (       9 image files)
- pages/ structure
  - pages/en/ (       6 pages)
    - pages/en/brands.md
    - pages/en/markets.md
    - pages/en/index.html
    - pages/en/sectors.md
    - pages/en/russian-sectors.md
    - pages/en/about.md
  - pages/ru/ (       6 pages)
    - pages/ru/brands.md
    - pages/ru/markets.md
    - pages/ru/index.html
    - pages/ru/sectors.md
    - pages/ru/russian-sectors.md
    - pages/ru/about.md
  - pages/zh/ (       6 pages)
    - pages/zh/brands.md
    - pages/zh/markets.md
    - pages/zh/index.html
    - pages/zh/sectors.md
    - pages/zh/russian-sectors.md
    - pages/zh/about.md
```

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

## Key File Contents
### _layouts/default.html (Structure)
```html
<!DOCTYPE html>
<html lang="{% if page.lang %}{{ page.lang }}{% else %}en{% endif %}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{% if page.title %}{{ page.title }}{% else %}{{ site.data.translations[page.lang].site.title }}{% endif %}</title>
  <meta name="description" content="{% if page.excerpt %}{{ page.excerpt | strip_html | strip_newlines | truncate: 160 }}{% else %}{{ site.data.translations[page.lang].site.description }}{% endif %}">

  <!-- Favicon -->
  <link rel="apple-touch-icon" sizes="180x180" href="{{ '/assets/images/apple-touch-icon.png' | relative_url }}">
  <link rel="icon" type="image/png" sizes="32x32" href="{{ '/assets/images/favicon-32x32.png' | relative_url }}">
  <link rel="icon" type="image/png" sizes="16x16" href="{{ '/assets/images/favicon-16x16.png' | relative_url }}">
  <link rel="shortcut icon" href="{{ '/assets/images/favicon.ico' | relative_url }}">
  <link rel="manifest" href="{{ '/assets/images/site.webmanifest' | relative_url }}">


  <!-- Style Sheets --> 
   
  <!-- 1. Design Tokens -->
  <link rel="stylesheet" href="{{ '/assets/css/tokens/colors.css' | relative_url }}">
... (truncated for brevity) ...
```

### _includes/header.html (Navigation)
```html
<header class="site-header">
  <div class="wrapper">
    <a class="site-title" href="{{ site.baseurl }}/{{ page.lang }}/">{{ site.data.translations[page.lang].site.title }}</a>
    <nav class="site-nav">
      <a href="{{ site.baseurl }}/{{ page.lang }}/">{{ site.data.translations[page.lang].nav.home }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/brands/">{{ site.data.translations[page.lang].nav.brands }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/sectors/">{{ site.data.translations[page.lang].nav.sectors }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/markets/">{{ site.data.translations[page.lang].nav.markets }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/about/">{{ site.data.translations[page.lang].nav.about }}</a>
    </nav>
    {% include language-selector.html %}
  </div>
</header>... (truncated for brevity) ...
```

### _includes/footer.html (Newsletter Forms)
```html
        <div class="newsletter-container">
          {% if page.lang == 'ru' %}
            <div class="ml-embedded" data-form="WVRNPI"></div>
          {% elsif page.lang == 'zh' %}
            <div class="ml-embedded" data-form="WRga0a"></div>
          {% else %}
            <div class="ml-embedded" data-form="480swE"></div>
          {% endif %}
        </div>
      </div>
    </div>
... (truncated for brevity) ...
```

### assets/css/main.css (Styling)
```css
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

... (truncated for brevity) ...
```

## Build Performance
- Build time (clean): 1.104 seconds.
- Generated HTML pages:       24
- Total site size:  31M

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

## Recent Development Activity
### Recent Commits
- **2025-03-18**: Refactor homepage styles for improved organization and responsiveness (Randal Eastman)
- **2025-03-18**: Streamlined our font strategy for each language version. (Randal Eastman)
- **2025-03-18**: Update site summary and remove redundant font-family declaration (Randal Eastman)
- **2025-03-18**: Improved mobile responsiveness and fixed hero panel vertical centering (Randal Eastman)
- **2025-03-17**: Force rebuild of site (Randal Eastman)
- **2025-03-17**: fixed some problems with centering p text (Randal Eastman)
- **2025-03-17**: add mobile-fixes.css and adjust other css (Randal Eastman)
- **2025-03-16**: Made use of new variables for spacing and breakpoints. (Randal Eastman)
- **2025-03-16**: Add breakpoint and spacing variables (Randal Eastman)
- **2025-03-16**: Adding comments to breakpoints (Randal Eastman)

### Recently Modified Files
- assets/css/components/mobile-fixes.css
- assets/css/layout/panels.css
- assets/css/main.css
- assets/css/pages/home.css
- assets/css/tokens/typography.css
- site-summary.md


### Project Log Entries (Last 2)

## 2025-03-11: Implemented Multilingual Newsletter Forms

### Changes Made
- Created separate Mailerlite forms for each language (EN, RU, ZH)
- Updated `_includes/footer.html` to display language-specific forms based on page.lang
- Maintained consistent styling across all forms

### Technical Decisions
- Chose separate forms over JS translation for better control of language-specific success messages
- Used Jekyll Liquid conditionals to select the appropriate form
- Created reference documentation at `docs/newsletter-implementation.md`

### Files Modified
- `_includes/footer.html`
- `_layouts/default.html` (added Mailerlite universal script)

### Next Steps
- Set up analytics tracking for form submissions
- Create language-specific confirmation emails
... (see full PROJECT_LOG.md for complete history) ...

## Getting Started
1. Run `bundle install` to install dependencies
2. Run `bundle exec jekyll serve` to start the development server
3. Visit http://localhost:4000 to view the site

### Testing Multilingual Support
- English: http://localhost:4000/en/
- Russian: http://localhost:4000/ru/
- Chinese: http://localhost:4000/zh/

Generated by enhanced-site-summary script
