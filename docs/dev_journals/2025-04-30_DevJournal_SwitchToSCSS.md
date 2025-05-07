# Development Journal — Migrating from CSS to SCSS in Jekyll

## 1. Problem Statement
We transitioned from static CSS files to a modular SCSS (Sass) architecture to enable better maintainability, theming, and reuse across the Brandmine site. However, this introduced a series of critical build and runtime errors, breaking site rendering and causing all styles to disappear.

## 2. Approach
The strategy involved:
- Moving from individual `.css` files to a structured `.scss` architecture (tokens, components, layout, etc.).
- Compiling SCSS via Jekyll's built-in `jekyll-sass-converter` using `main.scss` in the `assets/` directory.
- Ensuring `main.scss` properly imports all SCSS modules through `@import` statements and is output as `main.css` in the built site.
- Cleaning the `_site/` and `.jekyll-metadata` directories to eliminate stale builds and rebuild fresh.

## 3. Implementation Details

### SCSS File Setup
- We placed all partial SCSS files in subdirectories:
  - `assets/css/tokens/`
  - `assets/css/components/`
  - `assets/css/layout/`
  - `assets/css/pages/`
  - `assets/css/collections/`

### Example `main.scss`:
```scss
---
---

@import "tokens/tokens";
@import "tokens/grid";
@import "layout/panels";
@import "components/buttons";
@import "components/forms";
@import "components/text";
// more imports as needed...
```

### `_config.yml` updates
We ensured that the `sass:` block was present:
```yaml
sass:
  style: compressed
```

### Output Paths
Jekyll automatically compiled `main.scss` from `assets/` into `assets/main.css` in `_site/`.

## 4. Decisions Made

- **SCSS Partial Naming**: All imported partials were renamed to start with `_` (e.g. `_buttons.scss`) per SCSS conventions.
- **No External Frameworks**: We opted to keep things custom and clean rather than bring in full frameworks (e.g. Bootstrap).
- **Manual Imports Only**: We decided against using glob imports or dynamic loading to keep things explicit and easy to trace.

## 5. Resources
- [Jekyll Sass Docs](https://jekyllrb.com/docs/assets/#sassscss)
- Sass error messages from terminal output (multiple cases)
- Debugging via `jekyll build --trace` and manual line-by-line inspection of offending SCSS files

## 6. Insights & Learning

- Jekyll’s SCSS compiler is **strict** and surfaces even small formatting issues that browsers would otherwise ignore (e.g. missing `;` or unclosed `{` blocks).
- Syntax errors in **any** imported file will crash the entire SCSS compilation, meaning even deeply nested modules must be pristine.
- Escape characters like `\n` do **not** create visual line breaks in HTML and must be handled with `<br>`, not within SCSS.

Common issues encountered:
- `File to import not found or unreadable: tokens/tokens` — caused by incorrect path or missing `_tokens.scss`.
- `expected ";"` — from style declarations missing semicolons.
- `expected "}"` — from improperly closed nested blocks.

## 7. Next Actions

- ✅ Audit and fix remaining SCSS syntax errors across all partials
- ⏳ Replace older CSS includes with proper `@import` statements in `main.scss`
- ✅ Clean all stale Jekyll build artifacts with `bundle exec jekyll clean`
- 🧪 Consider writing a Sass linter script or using an extension to auto-detect issues before build
- 🧩 Eventually refactor imports to use `@use` and `@forward` (when switching to Dart Sass)