# Deprecated Components Log

This document tracks all deprecated components, their reasons for deprecation, and migration paths.

## Active Deprecations

### components/helpers/taxonomy-tag.html
- **Deprecated**: 2025-06-25
- **Reason**: Inconsistent formatting and poor multilingual support compared to standard approach
- **Replacement**: `helpers/dimension-name.html` with manual `<a>` wrapper
- **Migration Guide**: See `MIGRATION-taxonomy-tags.md`
- **Planned Removal**: 2025-07-15
- **Impact**: 32 total occurrences (17 component + 15 test files)
- **Status**: 🚧 **PHASE 1 COMPLETE** - High priority components migrated

#### Migration Progress
**✅ PHASE 1 COMPLETE** (2025-06-25)
- brand-card.html (4 uses) → MIGRATED
- featured-brand-card.html (4 uses) → MIGRATED
- related-brand-card.html (1 use) → MIGRATED
- **Subtotal**: 9 uses migrated ✅

**🚧 PHASE 2 IN PROGRESS** (2025-06-25)
- taxonomy/display.html (8 uses) → IN PROGRESS
- **Target**: Complete complex search/filter displays

**📋 PHASE 3 PLANNED**
- 15 test/development file uses → LOW PRIORITY
- **Target**: Final cleanup before removal (2025-07-15)

## Future Deprecations

### components/helpers/bem-taxonomy-tag.html
- **Assessment**: Similar issues to taxonomy-tag.html
- **Recommendation**: Review for potential deprecation after taxonomy-tag migration complete
- **Status**: 🔍 Under review

## Completed Deprecations

*No completed deprecations at this time.*

---

## Deprecation Process

1. **Mark as deprecated** with clear warning comments in component file
2. **Create migration documentation** with before/after examples
3. **Update this log** with deprecation details
4. **Systematic migration** of all usages
5. **Testing and verification** across all language versions
6. **Component removal** after 3-week buffer period

## Guidelines for New Deprecations

- **Clear timeline**: 3-week minimum between deprecation and removal
- **Comprehensive documentation**: Migration guide with examples
- **Impact assessment**: Count all usages and affected pages
- **Backwards compatibility**: Deprecated component continues to work
- **Communication**: Update team/documentation about changes

---

**Last Updated**: 2025-06-25
**Next Review**: 2025-07-15
