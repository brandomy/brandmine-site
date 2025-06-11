# Section Migration Audit Report

This report identifies all markdown files with `sections:` in their front matter that need to be updated to fully implement the centralized section management system.

## Overview

The centralized section management system uses `_data/page_sections.yml` to define default sections and panel mappings for each page type. Pages can still override sections using front matter, but defaults should be removed from individual files to leverage the centralized configuration.

## Migration Status Summary

- **Total files with sections:** 85 files
- **Files matching defaults:** 6 files (can remove sections immediately)
- **Files with custom sections:** 79 files (need review)
- **Files without sections:** 67 files (already using defaults)

### ✅ Files Ready for Immediate Section Removal

These 6 files have sections that exactly match the defaults and can have their `sections:` removed:

```
pages/ru/search.md
pages/ru/discovery.md
pages/zh/search.md
pages/zh/discovery.md
pages/en/search.md
pages/en/discovery.md
```

### 🔄 Files with Custom Sections (Need Review)

#### Home Pages (All 3 languages)
All home pages use extensive custom sections instead of the minimal defaults:
- **Default sections:** `hero, featured-case-studies`
- **Actual sections:** 13 sections including impact-statement, discovery-dimensions, testimonials, etc.
- **Recommendation:** Update `page_sections.yml` defaults to match current usage

#### Brand Collection Pages (All 3 languages)
All brands pages have replaced `filter-interface` with `search`:
- **Changes:** Added `search`, removed `content` and `filter-interface`
- **Recommendation:** Consider updating defaults or keeping as custom

#### Founders Collection Pages (All 3 languages)
All founders pages have similar modifications:
- **Changes:** Added `search` and `contact-cta`, removed `content`, `filter-interface`, and `founders-grid`
- **Recommendation:** Update defaults to match actual usage

#### About Pages (All 3 languages)
All about pages add `breadcrumbs` to the beginning:
- **Change:** Added `breadcrumbs` as first section
- **Recommendation:** Update defaults to include breadcrumbs

#### Insights Pages (All 3 languages)
Significant customization across all languages:
- **Changes:** Added `featured-article`, `category-highlights`, `latest-insights-carousel`
- **Removed:** `content`, `categories`, `filter-interface`, `featured-insights`, `recent-insights`
- **Recommendation:** Update defaults to match current structure

#### Journal Pages (All 3 languages)
All journal pages add `featured-article`:
- **Change:** Added `featured-article` after `impact`
- **Recommendation:** Consider adding to defaults

#### 404 Error Pages (All 3 languages)
All 404 pages use minimal sections:
- **Current:** Only `breadcrumbs` and `content`
- **Defaults include:** `hero` and `search-suggestions`
- **Recommendation:** Either update pages or defaults

### 📊 Content Collections Pattern Analysis

#### Brand Profiles (18 files across 3 languages)
**All brand profiles consistently remove the `impact` section:**
- Pattern: All use same sections minus `impact`
- Recommendation: Remove `impact` from brand-profile defaults

#### Founder Profiles (12 files across 3 languages)
**All founder profiles remove `impact` and `founder-wisdom`:**
- Pattern: Consistent removal across all files
- Recommendation: Update defaults to match actual usage

#### Insight Articles (12 files across 3 languages)
**All insight articles remove `social-sharing`:**
- Pattern: Consistent removal (except one adds `market-chart`)
- Recommendation: Remove `social-sharing` from defaults

#### Blog Posts (9 files)
**All posts replace `header` and `taxonomy` with `tag-cloud`:**
- Pattern: Consistent changes across all posts
- Recommendation: Update post defaults

#### Dimension Category Pages
**All use extensive custom sections instead of minimal defaults:**
- Default: Only `breadcrumbs` and `content`
- Actual: 6-7 custom sections for markets, sectors, attributes, signals
- Recommendation: Create specific configs for each dimension type

## 🎯 Recommended Actions

### Immediate Actions (Quick Wins)
1. Remove sections from the 6 files that match defaults
2. Update `page_sections.yml` to fix obvious mismatches:
   - Add `breadcrumbs` to about pages
   - Remove `impact` from brand-profile
   - Remove `impact` and `founder-wisdom` from founder-profile
   - Remove `social-sharing` from insight-article

### Configuration Updates Needed
1. **Home page:** Update defaults to match the 13-section structure
2. **Brands/Founders pages:** Decide on search vs filter-interface
3. **Insights page:** Update to match current structure
4. **Post layout:** Update to use tag-cloud instead of taxonomy
5. **Dimension categories:** Create type-specific configurations

### Migration Strategy
1. **Phase 1:** Update `page_sections.yml` to match actual usage patterns
2. **Phase 2:** Remove sections from files that will match new defaults
3. **Phase 3:** Document any intentional overrides
4. **Phase 4:** Update templates and creation scripts

## Benefits of Migration

1. **Consistency**: All pages of same type have consistent sections
2. **Maintainability**: Single source of truth for section order
3. **Flexibility**: Can still override when needed
4. **Performance**: Slightly faster builds with less front matter parsing
5. **Developer Experience**: Less boilerplate in content files

## Next Steps

1. Back up `_data/page_sections.yml`
2. Update defaults based on analysis above
3. Remove sections from files that will match new defaults
4. Test all pages in all three languages
5. Update documentation and templates