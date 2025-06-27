# Carousel Rename Impact Analysis

## Executive Summary

### Summary
- **Total files affected**: 18 production files + documentation
- **Include statements to update**: 2 (self-referential in component)
- **CSS classes to rename**: 15 distinct classes
- **JavaScript references**: 11+ selector references
- **Import statements**: 2 (CSS manifest + JS script tag)
- **Estimated effort**: 4-6 hours (Medium complexity)

### Risk Level: **Medium**
### Breaking Change Potential: **Yes** - All carousel functionality will break if not migrated completely

## Categorized References Found

### A. Include Statements (2 references)
```liquid
{% include components/carousels/universal-carousel.html %}
```
**Files**:
- `_includes/components/carousels/universal-carousel.html` (self-referential examples)

### B. CSS Class References (15 distinct classes)
```scss
.universal-carousel
.universal-carousel--brands
.universal-carousel--founders  
.universal-carousel--insights
.universal-carousel-nav
.universal-carousel-nav-dot
.universal-carousel-cta
.universal-grid
.universal-grid--insights
.universal-grid--founders
.carousel-loading
.carousel-hide-mobile
.carousel-show-mobile
.carousel-fade-in
.carousel-spinner
```

### C. CSS Import Statements (1 reference)
```scss
@import '../components/carousels/universal-carousel';
```
**File**: `assets/css/manifest/components.scss`

### D. JavaScript References (11+ references)
```javascript
document.querySelector('.universal-carousel[data-component-type="..."]')
document.querySelector('.universal-carousel-nav[data-target="..."]')
document.querySelectorAll('.universal-carousel-nav-dot')
```
**Files**:
- `assets/js/components/carousels/universal-carousel.js`
- `assets/js/pages/brands/featured-brands-carousel.js`
- `assets/js/pages/home/case-studies-section.js`
- `assets/js/pages/home/featured-brands-simplified.js`
- `assets/js/main.js`

### E. Data Attributes (Multiple references)
```html
data-component-type="case-studies"
data-component-type="featured-brands-simplified"
data-component-type="founder-focus"
data-target="featured-brands"
data-carousel-id="case-studies"
```

### F. Script Tag References (1 reference)
```html
<script src="{{ '/assets/js/components/carousels/universal-carousel.js' | relative_url }}"></script>
```
**File**: `_layouts/home.html`

### G. Documentation References (2 files)
- `homepage-carousel-analysis.md`
- `brandmine-homepage-architecture-audit.md`

## File-by-File Impact Analysis

### High Impact Files (Immediate Attention Required)

#### 1. `_includes/components/carousels/universal-carousel.html`
**Type**: HTML/Liquid
**References Found**: 6
**Impact Level**: **High**

**Changes Required**:
- Move file to `_includes/components/layout/carousel.html`
- Update self-referential includes
- Update CSS/JS dependency comments

#### 2. `assets/css/components/carousels/universal-carousel.scss`
**Type**: SCSS
**References Found**: 28+ class definitions
**Impact Level**: **High**

**Changes Required**:
- Move file to `assets/css/components/layout/carousel.scss`
- Rename all classes from `universal-carousel` to `carousel`
- Update all mixins to use new naming

#### 3. `assets/js/components/carousels/universal-carousel.js`
**Type**: JavaScript
**References Found**: 5 core selectors
**Impact Level**: **High**

**Changes Required**:
- Move file to `assets/js/components/layout/carousel.js`
- Update all selectors from `.universal-carousel` to `.carousel`
- Update all data attributes references

#### 4. `assets/css/manifest/components.scss`
**Type**: SCSS
**References Found**: 1
**Impact Level**: **High**

**Changes Required**:
```scss
// Line to change:
@import '../components/carousels/universal-carousel';
// Change to:
@import '../components/layout/carousel';
```

#### 5. `_layouts/home.html`
**Type**: HTML
**References Found**: 1
**Impact Level**: **High**

**Changes Required**:
```html
<!-- Line to change: -->
<script src="{{ '/assets/js/components/carousels/universal-carousel.js' | relative_url }}"></script>
<!-- Change to: -->
<script src="{{ '/assets/js/components/layout/carousel.js' | relative_url }}"></script>
```

### Medium Impact Files (HTML References)

#### 6-8. Homepage Section Files
**Files**:
- `_includes/pages/home/case-studies.html`
- `_includes/pages/home/featured-brands-simplified.html`
- `_includes/pages/home/founder-focus.html`

**Changes Required**: Update all class names in HTML

### Low Impact Files (Documentation)

#### 9-10. Documentation Files
**Files**:
- `homepage-carousel-analysis.md`
- `brandmine-homepage-architecture-audit.md`

**Changes Required**: Update references for accuracy

## Directory Structure Changes

### Current Structure:
```
_includes/components/carousels/
└── universal-carousel.html

assets/css/components/carousels/
└── universal-carousel.scss

assets/js/components/carousels/
└── universal-carousel.js
```

### Target Structure:
```
_includes/components/layout/
└── carousel.html

assets/css/components/layout/
└── carousel.scss

assets/js/components/layout/
└── carousel.js
```

## CSS Class Name Changes

### Primary Classes:
- `.universal-carousel` → `.carousel`
- `.universal-carousel-nav` → `.carousel-nav`
- `.universal-carousel-nav-dot` → `.carousel-nav-dot`
- `.universal-carousel-cta` → `.carousel-cta`

### Modifier Classes:
- `.universal-carousel--brands` → `.carousel--brands`
- `.universal-carousel--founders` → `.carousel--founders`
- `.universal-carousel--insights` → `.carousel--insights`

### Grid Classes:
- `.universal-grid` → `.carousel-grid`
- `.universal-grid--insights` → `.carousel-grid--insights`
- `.universal-grid--founders` → `.carousel-grid--founders`

### Data Selectors:
- `.universal-carousel[data-component-type="..."]` → `.carousel[data-component-type="..."]`
- `.universal-carousel-nav[data-target="..."]` → `.carousel-nav[data-target="..."]`

## Migration Checklist

### Pre-Migration Steps
- [x] Complete audit of all references
- [ ] Backup current implementation
- [ ] Test current carousel functionality
- [ ] Document current behavior
- [ ] Create test pages for validation

### File Operations
- [ ] Create new directory structure (`components/layout/`)
- [ ] Copy files to new locations (DO NOT delete originals yet)
- [ ] Update file contents with new naming

### Code Updates (In Order)
1. [ ] Update CSS manifest import (`assets/css/manifest/components.scss`)
2. [ ] Update all CSS classes in `carousel.scss`
3. [ ] Update JavaScript selectors in `carousel.js`
4. [ ] Update HTML include references
5. [ ] Update HTML class names in all templates
6. [ ] Update script tag in `_layouts/home.html`
7. [ ] Update JavaScript page-specific files

### Post-Migration Testing
- [ ] Test all carousels on homepage
- [ ] Test brands page carousels
- [ ] Test responsive behavior
- [ ] Test JavaScript navigation
- [ ] Test accessibility features
- [ ] Validate CSS compilation
- [ ] Check browser console for errors

### Cleanup
- [ ] Remove old files after verification
- [ ] Update documentation
- [ ] Clear Jekyll cache
- [ ] Test production build

## Risk Assessment and Mitigation

### High Risk Areas
1. **JavaScript Functionality** - All carousel interactions will break if selectors not updated completely
2. **CSS Cascade** - Renamed classes might affect specificity and inheritance
3. **Production Build** - Asset paths must be updated in all environments

### Dependencies to Watch
- Page-specific JavaScript files that initialize carousels
- CSS files that extend carousel styles
- Any third-party integrations using carousel classes

### Testing Requirements
- Full regression testing on all pages with carousels
- Cross-browser testing (Chrome, Firefox, Safari, Edge)
- Mobile device testing
- Accessibility testing with screen readers

### Rollback Plan
1. Keep backup of original files
2. Use git to track all changes
3. Test thoroughly in development before production
4. Have quick revert strategy ready

## Implementation Timeline

### Phase 1: Setup (30 minutes)
- Create new directory structure
- Copy files to new locations
- Create test environment

### Phase 2: Core Updates (2 hours)
- Update CSS classes and imports
- Update JavaScript selectors
- Update include statements

### Phase 3: Template Updates (1.5 hours)
- Update all HTML templates
- Update layout files
- Update documentation

### Phase 4: Testing (1.5 hours)
- Functional testing
- Visual regression testing
- Cross-browser testing

### Phase 5: Cleanup (30 minutes)
- Remove old files
- Update documentation
- Final verification

**Total Estimated Time**: 4-6 hours

## Final Recommendations

1. **Execute during low-traffic period** to minimize user impact
2. **Use feature branch** for all changes before merging
3. **Test extensively** before deploying to production
4. **Keep old files** for at least one sprint as backup
5. **Document the change** in release notes for other developers

This rename operation is achievable but requires careful execution due to the number of touchpoints across the codebase. The atomic naming convention will be cleaner and more maintainable long-term.

---

**Generated**: 2025-06-27  
**Author**: Claude Code Audit System  
**Version**: 1.0  
**Status**: Ready for Implementation