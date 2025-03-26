# Brandmine Development Workflow

## GitHub Workflow

- Branch: `improve-navigation` (current)
- Last commit: "changed about page hero text colour to beige"
- Repository hosted on GitHub

## Build Process

1. Local development with Jekyll:
   ```
   bundle exec jekyll serve
   ```

2. Access the site at:
   - http://localhost:4000/en/ (English)
   - http://localhost:4000/ru/ (Russian)
   - http://localhost:4000/zh/ (Chinese)

## Adding New Pages

1. Create page in relevant language directory:
   ```
   pages/en/new-page.md
   pages/ru/new-page.md
   pages/zh/new-page.md
   ```

2. Include front matter:
   ```yaml
   ---
   layout: default
   title: Page Title
   description: Page description
   lang: en  # or ru, zh
   ---
   ```

3. Run Jekyll to build the site

## Current Focus

- Improving navigation experience
- Implementing design system documentation
- Enhancing brand discovery features
- Maintaining multilingual functionality