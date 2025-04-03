# 2025-04-02 Development Journal: Jekyll Assets Troubleshooting

## Problem Statement
We attempted to optimize CSS loading and management for the Brandmine site by implementing the jekyll-assets plugin to consolidate multiple CSS files into a single request. This effort encountered several compatibility issues with Ruby 3.4.2.

## Approach
1. Install jekyll-assets plugin in Gemfile
2. Configure asset sources in _config.yml
3. Create a site.css file with @import statements for all CSS files
4. Update default.html to use the {% asset site.css %} tag instead of multiple link elements

## Implementation Details
### Gemfile Modifications
```ruby
group :jekyll_plugins do
  gem 'jekyll-assets', '~> 3.0.12'
  gem "jekyll-feed", "~> 0.12"
end

gem "bigdecimal", "~> 3.1"  # Added to address Ruby 3.4 dependencies
```

### Configuration Updates (_config.yml)
```yaml
plugins:
  - jekyll-assets

assets:
  sources:
    - assets/css
    - assets/css/pages
    - assets/css/components
    - assets/css/layout
    - assets/css/tokens
  compress:
    css: true
  autoprefixer:
    browsers:
      - "last 2 versions"
      - "IE > 9"
```

### CSS Management (site.css)
```css
/* Import all other CSS files */
/* Tokens & Base */
@import "tokens/tokens.css";
@import "tokens/grid.css";
@import "tokens/typography.css";
@import "main.css";

/* Components */
@import "components/navigation.css";
/* ... additional imports ... */
```

## Challenges Encountered
1. Initial error: Missing bigdecimal gem (Ruby 3.4.0 dependency change)
2. After adding bigdecimal: Method signature incompatibility with forwardable-extended gem
3. Complex dependency chain making troubleshooting difficult:
   - liquid-tag-parser → forwardable-extended → Ruby 3.4 API changes

## Decisions Made
1. **Revert to previous working approach**: The jekyll-assets plugin is incompatible with our Ruby environment
2. **Keep individual CSS files**: Continue using multiple link elements in default.html
3. **Maintain file organization**: Keep the existing component-based CSS structure
4. **Add bigdecimal gem**: Required for Ruby 3.4 compatibility with Jekyll

## Next Actions
1. Remove jekyll-assets from Gemfile
2. Restore default.html from backup (remove .backup extension)
3. Remove assets configuration from _config.yml
4. Keep bigdecimal gem to address Ruby 3.4 requirements
5. Consider alternative CSS optimization approaches in the future:
   - Manual CSS concatenation and minification
   - External build tools like Gulp/Grunt if needed
   - GitHub Pages compatible Jekyll plugins

## Insights & Learning
1. The jekyll-assets plugin (3.0.12) is not compatible with Ruby 3.4.2
2. Ruby 3.4.0 removed bigdecimal from default gems, requiring explicit inclusion
3. GitHub Pages has limitations on which plugins are supported, making some optimizations challenging
4. Focus on working implementations for MVP rather than potentially risky optimizations
5. Keep backups before implementing significant changes (the backup of default.html saved significant work)
6. Component-based CSS organization provides maintainability without requiring build tools

This experience reinforces the importance of prioritizing the MVP's stability over premature optimization. Our existing approach with individual CSS files is working well and supports the incremental development process needed for the Brandmine project.