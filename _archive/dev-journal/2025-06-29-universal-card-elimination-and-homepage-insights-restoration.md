=== DEV JOURNAL ENTRY ===

**Date:** June 29, 2025
**Task:** Universal Card Elimination and Homepage Insights Restoration
**Status:** Completed

**Problem Statement**
- The site had a bloated 45KB universal-card.html component (977 lines) with 122 conditionals that was overkill for MVP
- Build was failing due to missing critical page sections and YAML syntax errors
- Homepage latest-insights section was displaying generic placeholders instead of beautiful custom content
- Multiple missing template files were preventing successful site builds
- Universal card elimination had broken several page sections and components

**Implementation Summary**
- Files created: 
  - `_includes/pages/brands/latest-brands.html` - Brand directory grid section
  - `_includes/pages/discovery/latest-insights.html` - Discovery insights carousel
  - `_includes/pages/insights/latest-insights-carousel.html` - Insights page carousel
- Files modified: 
  - `_data/component_defaults.yml` - Removed 79 lines of orphaned universal card config
  - `_includes/components/layout/grid.html` - Updated to use existing insight-card.html
  - `_includes/pages/home/latest-insights.html` - Restored original category-based logic with rich content
  - `pages/en/dev/founders-test.md` - Fixed malformed Liquid syntax to use proper founder objects
  - `CLAUDE.md` - Updated documentation to reflect MVP card system
- Files moved/deleted:
  - Deleted: `_includes/components/cards/universal-card.html` (45KB, 977 lines)
  - Restored: `_includes/components/insights/latest-insights-grid2.html` - Custom insights component
  - Restored: Original homepage insights with category-specific content

**Technical Decisions**
- Chose MVP card architecture (4 core cards) over bloated universal system for maintainability
- Used git restoration approach rather than recreation to preserve original fine-tuned styling
- Maintained atomic design principle: grid handles layout, cards handle content display
- Preserved configuration-driven behavior through component_defaults.yml cleanup
- Implemented category-based insights filtering to show diverse content types

**Code Changes**
- New components/helpers created:
  - Brand directory section with grid layout and pagination support
  - Discovery insights carousel with filtering and navigation
  - Insights page carousel with category filtering options
- Integration points modified:
  - Grid component updated to use working card components
  - Page sections configuration verified across all page types
  - Helper selectors updated to use optimized cards instead of universal card
- Dependencies or relationships affected:
  - Removed universal card dependencies across entire codebase
  - Restored original insights content pipeline with category filtering
  - Fixed founder connections page to use founder-card.html

**Testing Results**
- Commands run to verify changes:
  - `bundle exec jekyll build` - Successful builds in ~15 seconds
  - `python3 -c "import yaml; yaml.safe_load(open('_data/component_defaults.yml'))"` - YAML validation passed
  - `find _includes/components/cards/ -name "*-card.html" | wc -l` - Confirmed MVP cards present
- What worked as expected:
  - Site builds successfully with simplified card architecture
  - Homepage displays rich insight content: "Seven Spices", "Alexei Sokolov: TeaTime's Journey"
  - All page types (home, discovery, brands, insights, journal) render correctly
  - Grid and carousel components function with MVP cards
- Any issues discovered:
  - Initial build failures due to cascading missing file dependencies
  - Homepage was showing placeholders instead of custom content until git restoration
  - Some test files had malformed Liquid syntax requiring manual fixes

**Future Considerations**
- Potential improvements or optimizations:
  - Consider implementing lazy loading for insight images to improve performance
  - Add error handling for empty insight categories to prevent placeholder content
  - Evaluate if additional card variants are needed for specific use cases
- Related tasks that might be needed:
  - Complete documentation update to reflect simplified architecture
  - Review other page sections for similar optimization opportunities
  - Add automated tests to prevent regression to bloated component patterns
- Maintenance considerations:
  - Monitor build times to ensure they stay under 15 seconds
  - Regular audit of component complexity to prevent architecture drift
  - Maintain category-based insights approach for content diversity

**Key Insights**
- The universal card was eliminated successfully, reducing codebase complexity by ~45KB
- Original beautiful insights design was preserved through git restoration rather than recreation
- MVP card architecture (brand-card, founder-card, insight-card, + featured variants) proved sufficient
- Configuration-driven approach through component_defaults.yml enables flexibility without bloat
- Category-based insight filtering ensures diverse, rich content display on homepage

**Build Performance**
- Before: Bloated universal card with 122 conditionals
- After: Clean MVP architecture with 4 optimized cards
- Build time: Maintained ~15 seconds with simplified components
- Content quality: Rich, diverse insights with custom styling restored

=== END JOURNAL ===