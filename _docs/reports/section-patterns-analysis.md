# Section Patterns Analysis & Recommendations

Based on the section migration audit, this document identifies the most common section configurations for each page type and recommends updates to `_data/page_sections.yml`.

## Executive Summary

The audit reveals significant mismatches between default section configurations and actual usage patterns across the site. Most page types require updates to their defaults to match consistent patterns found in actual usage.

## Key Findings by Page Type

### 1. Home Page
**Current Defaults:** 2 sections (hero, featured-case-studies)  
**Actual Usage:** 13 sections consistently across all languages  
**Most Common Pattern:**
```yaml
- hero
- impact-statement
- discovery-dimensions
- featured-case-studies
- how-it-works
- testimonials
- featured-brands
- lead-capture
- location-intelligence
- founder-focus
- brand-owners
- latest-insights-tagged
- final-cta
```
**Recommendation:** Update defaults to include all 13 sections (currently commented out in page_sections.yml)

### 2. Brand Profile
**Current Defaults:** 8 sections including `impact`  
**Actual Usage:** All 18 brand profiles consistently remove `impact`  
**Most Common Pattern:**
```yaml
- breadcrumbs
- identity
- founder-narrative
- content
- business-intelligence
- location-intelligence
- connections
```
**Recommendation:** Remove `impact` from brand-profile defaults

### 3. Founder Profile
**Current Defaults:** 9 sections including `impact` and `founder-wisdom`  
**Actual Usage:** All 12 founder profiles remove both `impact` and `founder-wisdom`  
**Most Common Pattern:**
```yaml
- breadcrumbs
- hero
- professional-details
- content
- associated-brands
- expertise-cloud
- related-insights
```
**Recommendation:** Remove `impact` and `founder-wisdom` from founder-profile defaults

### 4. Insight Article
**Current Defaults:** 10 sections including `social-sharing`  
**Actual Usage:** All 12 insight articles remove `social-sharing`  
**Most Common Pattern:**
```yaml
- breadcrumbs
- hero
- header
- featured-image
- content
- taxonomy
- brand-info
- related-brands
- related-insights
```
**Recommendation:** Remove `social-sharing` from insight-article defaults

### 5. Blog Post
**Current Defaults:** Uses `header`, `taxonomy`, and other sections  
**Actual Usage:** All 9 posts replace `header` and `taxonomy` with `tag-cloud`  
**Most Common Pattern:**
```yaml
- breadcrumbs
- hero
- tag-cloud  # replaces header and taxonomy
- content
- social-sharing
- related-posts
- author-profile
```
**Recommendation:** Update post defaults to use `tag-cloud` instead of `header` and `taxonomy`

### 6. Brands Collection Page
**Current Defaults:** Uses `filter-interface`  
**Actual Usage:** All brands pages replace `filter-interface` with `search`  
**Most Common Pattern:**
```yaml
- breadcrumbs
- hero
- impact
- search  # replaces filter-interface
- featured-brands
- latest-brands
- contact-cta
```
**Recommendation:** Replace `filter-interface` with `search` in brands defaults

### 7. Founders Collection Page
**Current Defaults:** Uses `filter-interface` and `founders-grid`  
**Actual Usage:** All founders pages add `search` and `contact-cta`, remove several sections  
**Most Common Pattern:**
```yaml
- breadcrumbs
- hero
- impact
- search  # replaces filter-interface
- featured-founders
- recent-founders
- contact-cta  # added
```
**Recommendation:** Update defaults to match actual usage

### 8. Insights Page
**Current Defaults:** Multiple sections that don't match usage  
**Actual Usage:** Significant customization across all languages  
**Most Common Pattern:**
```yaml
- breadcrumbs
- hero
- impact
- featured-article  # new
- category-navigation
- category-highlights  # new
- latest-insights-carousel  # new
- subscribe
- contact-cta
```
**Recommendation:** Major update needed to match current structure

### 9. About Page
**Current Defaults:** Missing `breadcrumbs`  
**Actual Usage:** All about pages add `breadcrumbs` as first section  
**Recommendation:** Add `breadcrumbs` to about page defaults

### 10. Journal Page
**Current Defaults:** Standard sections  
**Actual Usage:** All journal pages add `featured-article`  
**Most Common Pattern:**
```yaml
- breadcrumbs
- hero
- impact
- featured-article  # added
- content
- latest-entries
- author-profile
- contact-cta
```
**Recommendation:** Add `featured-article` to journal defaults

### 11. 404 Error Page
**Current Defaults:** 4 sections (breadcrumbs, hero, content, search-suggestions)  
**Actual Usage:** Only 2 sections (breadcrumbs, content)  
**Recommendation:** Remove `hero` and `search-suggestions` from defaults

### 12. Dimension Category Pages
**Current Defaults:** Only 2 sections (breadcrumbs, content)  
**Actual Usage:** 6-7 custom sections for each dimension type  
**Common Patterns by Type:**

**Markets:**
```yaml
- breadcrumbs
- hero
- impact
- header
- navigation
- featured-brands
- all-brands
- market-highlights
- related-insights
```

**Sectors/Attributes/Signals:**
```yaml
- breadcrumbs
- hero
- impact
- header
- featured-brands
- all-brands
- related-insights
```

**Recommendation:** Create specific configurations for each dimension type or update dimension-category with more comprehensive defaults

## Priority Recommendations

### High Priority (Affecting Most Pages)
1. **Home page:** Uncomment all 13 sections in defaults
2. **Brand-profile:** Remove `impact` section
3. **Founder-profile:** Remove `impact` and `founder-wisdom` sections
4. **Insight-article:** Remove `social-sharing` section
5. **About:** Add `breadcrumbs` as first section

### Medium Priority (Collection Pages)
1. **Brands:** Replace `filter-interface` with `search`
2. **Founders:** Update to match actual usage pattern
3. **Insights:** Major restructure needed
4. **Post:** Replace `header` and `taxonomy` with `tag-cloud`

### Low Priority (Less Critical)
1. **Journal:** Add `featured-article` section
2. **404:** Simplify to just breadcrumbs and content
3. **Dimension-category:** Consider type-specific configurations

## Implementation Steps

1. **Backup current configuration:**
   ```bash
   cp _data/page_sections.yml _data/page_sections.yml.backup
   ```

2. **Update page_sections.yml** with recommended changes

3. **Remove sections from individual files** that will now match defaults

4. **Test all pages** in all three languages

5. **Update documentation** and content creation templates

## Expected Benefits

- **Reduced maintenance:** 79 files can have their custom sections removed
- **Consistency:** All pages of the same type will have identical section ordering
- **Performance:** Slightly faster builds with less front matter parsing
- **Developer experience:** Less boilerplate in content files
- **Easier updates:** Single source of truth for section configuration

## Migration Impact

- **Immediate wins:** 6 files already match defaults (search and discovery pages)
- **After updates:** ~85% of files with custom sections can use defaults
- **Remaining overrides:** Only truly custom pages will need section overrides