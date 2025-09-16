# ARCHIVED LAYOUTS

## insights-type.html
- **Reason**: Legacy layout with zero usage
- **Replaced by**: insight-category.html  
- **Date**: 2025-07-05
- **Analysis**: See insights-architecture-analysis report

### Findings:
- Zero active usage in any page files
- No references in includes or components  
- Uses non-existent URL pattern `/insights/types/`
- No configuration in `page_sections.yml`
- Simple static layout inconsistent with current section-based architecture

### Current Active Layouts:
- `insights.html` - Main insights hub page (3 language variants)
- `insight-category.html` - Category filter pages (12 pages: 4 categories × 3 languages)

Both active layouts use data-driven sections via `page_sections.yml` and follow established architectural patterns.