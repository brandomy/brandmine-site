# Brandmine Jekyll Configuration

## Key Configuration Elements

- **Site Information**:
  - `title`: "Brandmine"
  - `description`: "Amplifying leading consumer brands of the BRICS+"
  - `baseurl`: "" (empty for local development)

- **Collections**:
  ```yaml
  collections:
    brands:
      output: true
      permalink: /:collection/:path/
  ```

- **Default Values**:
  ```yaml
  defaults:
    # Global defaults
    - scope:
        path: ""
      values:
        layout: default
  ```

- **URL Structure**: Language-first URLs (`/en/`, `/ru/`, `/zh/`)

- **Front Matter**: All pages include:
  ```yaml
  ---
  layout: default
  title: Page Title
  lang: en  # or ru, zh
  ---
  ```

## Build Process

- **Local Development**: `bundle exec jekyll serve`
- **Production**: Deployed via GitHub Pages