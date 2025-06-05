# Featured Content Migration Rollback Documentation

## Overview
This document provides rollback instructions for the featured_content.yml migration that replaced Jekyll collection filtering with static data to resolve build errors.

## Migration Changes Made

### Phase 1: Setup & Structure
- **File Created**: `_data/featured_content.yml`
- **Purpose**: Centralized featured content management
- **Structure**: brands, insights, founders sections with multilingual data

### Phase 2: Brands Carousel Migration
- **File Modified**: `_includes/components/carousels/featured-brands-carousel.html`
- **Backup Created**: `featured-brands-carousel.html.backup`
- **Change**: Replaced `site.brands` collection filtering with `site.data.featured_content.brands[page.lang]`

### Phase 3: Brands Home Section Migration
- **File Modified**: `_includes/helpers/brand-filter.html`
- **Backup Created**: `brand-filter.html.backup`
- **Change**: Updated centralized brand filtering to use static data approach

### Phase 4: Featured Article Migration
- **File Modified**: `_includes/pages/insights/featured-article.html`
- **Backup Created**: `featured-article.html.backup`
- **Change**: Replaced collection filtering with static data for featured insights

## Rollback Instructions

### Complete Rollback (All Phases)
To revert all changes and return to collection-based filtering:

```bash
# 1. Restore backup files
cp _includes/components/carousels/featured-brands-carousel.html.backup _includes/components/carousels/featured-brands-carousel.html
cp _includes/helpers/brand-filter.html.backup _includes/helpers/brand-filter.html
cp _includes/pages/insights/featured-article.html.backup _includes/pages/insights/featured-article.html

# 2. Remove featured content data file
rm _data/featured_content.yml

# 3. Test build
bundle exec jekyll build --quiet
```

### Partial Rollback (Individual Components)

#### Rollback Featured Brands Carousel Only
```bash
cp _includes/components/carousels/featured-brands-carousel.html.backup _includes/components/carousels/featured-brands-carousel.html
```

#### Rollback Brand Filter Only
```bash
cp _includes/helpers/brand-filter.html.backup _includes/helpers/brand-filter.html
```

#### Rollback Featured Article Only
```bash
cp _includes/pages/insights/featured-article.html.backup _includes/pages/insights/featured-article.html
```

## Original Error Context
The migration was implemented to resolve Jekyll build errors related to:
- Integer vs String type comparison in Liquid filters
- Collection filtering performance issues
- Build errors in `_includes/components/carousels/featured-case-studies-carousel.html`

## Alternative Solutions
If rollback is needed due to static data limitations:

1. **Hybrid Approach**: Keep static data for featured content but maintain collection fallbacks
2. **Type Conversion**: Add explicit string conversion in collection filters
3. **Featured Flags**: Add explicit `featured: true` flags to collection items

## Performance Impact
- **Before Migration**: ~21+ seconds build time with filtering errors
- **After Migration**: ~20.7 seconds build time, stable builds
- **Rollback Impact**: May return to original build errors

## Files to Monitor Post-Rollback
- `_includes/components/carousels/featured-case-studies-carousel.html`
- Any components using collection filtering with integer/string comparisons
- Build logs for Liquid type comparison errors

## Contact
For questions about this migration or rollback procedures, refer to CLAUDE.md project instructions.