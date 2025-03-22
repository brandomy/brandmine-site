# Brandmine Jekyll Website Context
Generated: 2025-03-22 13:32

## Focus Area: Layout

This context is focused on the layout aspects of the website.

## Site Configuration
## Configuration Details
```yaml
title: Brandmine
email: randal@brandmine.io
description: Amplifying leading consumer brands of the BRICS+
# Change this line
baseurl: "" # Empty for local development

...
collections:
  brands:
    output: true
    permalink: /:collection/:path/
...
defaults:
  # Global defaults
  - scope:
      path: ""
    values:
      layout: default
...
```


## Site Structure
### Directories
```
- _layouts/ (       4 files)
  - category.html
  - default.html
  - post.html
  - tag.html
- _includes/ (       5 files)
  - footer.html
  - google-analytics.html
  - header.html
  - language-selector.html
  - tags
- _data/ (       6 files)
  - _data/.DS_Store
  - _data/sectors.yml
  - _data/tag_translations.yml
  - _data/translations/en.yml
  - _data/translations/ru.yml
  - _data/translations/zh.yml
- assets/ (      82 files total)
  - assets/css/ (      26 CSS files)
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
    - assets/css/components/tags.css
    - assets/css/components/layouts.css
    - assets/css/pages/growth-signals.css
    - assets/css/pages/home.css
    - assets/css/pages/markets.css
    - assets/css/pages/sectors.css
    - assets/css/pages/brands.css
    - assets/css/pages/about.css
    - assets/css/pages/countries.css
    - assets/css/pages/russian-sectors.css
    - assets/css/pages/insights.css
    - assets/css/tokens/typography.css
    - assets/css/tokens/spacing.css
    - assets/css/tokens/breakpoints.css
    - assets/css/tokens/colors.css
  - assets/j
...(truncated)...

## Key Layout Files

### ./_layouts/default.html
```
<!DOCTYPE html>
<html lang="{% if page.lang %}{{ page.lang }}{% else %}en{% endif %}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{% if page.title %}{{ page.title }}{% else %}{{ site.data.translations[page.lang].site.title }}{% endif %}</title>
  <meta name="description" content="{% if page.excerpt %}{{ page.excerpt | strip_html | strip_newlines | truncate: 160 }}{% else %}{{ site.data.translations[page.lang].site.description }}{% endif %}">

  <!-- Favicon -->
  <link rel="apple-touch-icon" sizes="180x180" href="{{ '/assets/images/favicons/apple-touch-icon.png' | relative_url }}">
  <link rel="icon" type="image/png" sizes="32x32" href="{{ '/assets/images/favicons/favicon-32x32.png' | relative_url }}">
  <link rel="icon" type="image/png" sizes="16x16" href="{{ '/assets/images/favicons/favicon-16x16.png' | relative_url }}">
  <link rel="shortcut icon" href="{{ '/assets/images/favicons/favicon.ico' | relative_url }}">
  <link rel="manifest" href="{{ '/assets/images/favicons/site.webmanifest' | relative_url }}">

  <!-- Style Sheets --> 
   
  <!-- 1. Design Tokens -->
  <link rel="stylesheet" href="{{ '/assets/css/tokens/colors.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/tokens/typography.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/tokens/breakpoints.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/tokens/spacing.css' | relative_url }}">

  <!-- 2. Base Styles -->
  <link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
 
  <!-- 3. Component Styles -->
  <link rel="stylesheet" href="{{ '/assets/css/components/buttons.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/cards.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/features.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/forms.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/layouts.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/navigation.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/solutions.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/team.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/text.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/buttons.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/tags.css' | relative_url }}">

  <!-- 4. Layout Styles -->
  <link rel="stylesheet" href="{{ '/assets/css/layout/panels.css' | relative_url }}">

  <!-- 5. Page-Specific Styles (conditionally loaded) -->
  {% if page.permalink == '/en/' or page.permalink == '/ru/' or page.permalink == '/zh/' %}
    <link rel="stylesheet" href="{{ '/assets/css/pages/home.css' | relative_url }}">
  {% endif %}

  {% if page.permalink contains '/about/' %}
    <link rel="stylesheet" href="{{ '/assets/css/pages/about.css' | relative_url }}">
  {% endif %}

...(truncated)...
```

## Recent Layout Development

## 2025-03-22: Add country tags and content for Brazil, India, China, and South Africa in Chinese and English [Layout]

## 2025-03-18: Implement mobile hamburger menu functionality and styles [Layout]

## 2025-03-18: Enhance mobile footer layout and hide scroll indicator on small phones [Layout]

## Content Summary
- Languages:        3 (en ru zh )
  - en:        9 pages
  - ru:        8 pages
  - zh:        8 pages
- Blog posts:        4
  - Date range: 2025/03/21 to 2025/03/21
- Translation files:        3
  - Translation coverage:
    - en (primary):       67 keys
    - ru:       67 keys (100% coverage)
    - zh:       67 keys (100% coverage)


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
