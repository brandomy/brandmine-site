# Brandmine Multilingual Implementation Checklist

This document identifies key files and components that should be reviewed after implementing the new multilingual navigation structure.

## Review Status

| Component | Status | Notes |
|-----------|--------|-------|
| Header/Navigation | ✅ Complete | Fixed in today's implementation |
| Footer | ✅ Already Compatible | Uses `page.lang` correctly |
| Language Selector | ✅ Already Compatible | Works with `page.lang` |
| Insights Layout | ✅ Already Compatible | Uses `page.lang` correctly |
| Collections | 🔍 To Review | Need to check template usage |
| Discovery Paths | 🔄 To Implement | Can use similar approach as navigation |

## Required Changes

### 1. No Immediate Changes Needed

Based on the inspection of key files, the good news is that the most critical templates already use `page.lang` consistently:

- **Footer** correctly uses `{{ site.data.translations[page.lang].footer.* }}` 
- **Language Selector** works with page.lang
- **Insight Layout** correctly references `page.lang`

### 2. Recommended Improvements

Although the site appears to be working properly with the current changes, these optimizations would make maintenance easier:

#### Footer Navigation

Consider implementing a data-driven footer navigation similar to the main navigation:

1. Create `_data/footer_navigation/` with language-specific files
2. Update the footer template to iterate through these items
3. This would make footer links easier to manage across languages

#### Discovery System

The discovery system (sectors, markets, attributes) could benefit from a similar data-driven approach:

1. Create `_data/discovery/` with language-specific configuration
2. Define discovery paths, featured items, and other structured data
3. Update templates to use this consistent data structure

## Collection Compatibility

For `_insights` and `_brands` collections, verify:

1. All collection items have proper language front matter (`lang: en` etc.)
2. Template references use `page.lang` consistently
3. Related item filtering uses language filtering:
   ```liquid
   {% assign related_items = site.brands | where: "lang", page.lang | where: "sector", page.sector | limit: 3 %}
   ```

## CSS and JS File Review

The following assets should be checked for proper multilingual support:

- **assets/js/header.js**: Already appears to work with the new navigation
- **assets/css/components/navigation.css**: No changes needed
- **assets/css/components/header.css**: No changes needed

## Testing Checklist

- [x] Main navigation appears and works in English
- [ ] Navigation works in Russian
- [ ] Navigation works in Chinese
- [ ] Dropdowns function correctly on desktop
- [ ] Mobile menu functions correctly
- [ ] Language switching maintains correct page context
- [ ] Collection pages filter by current language
- [ ] Related items shown are appropriate to current language

## Next Steps

1. Complete full site testing in all three languages
2. Consider implementing data-driven approach for footer navigation
3. Consider implementing data-driven discovery system
4. Document the multilingual implementation for future reference
5. Update contributor guidelines to ensure multilingual consistency