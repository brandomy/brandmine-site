# Card Usage Analysis by Page Type

## Executive Summary

**Key Findings:**
- **4 MVP Cards Active**: brand-card, brand-card-featured, founder-card, founder-card-featured
- **Universal Card Still Dominant**: 15+ instances across brands/founders pages
- **Container Pattern**: Carousel containers for featured cards, grid containers for standard cards
- **Critical Issue**: Mixed universal-card and optimized card usage on same pages

---

## Page-by-Page Card Usage

### 🏠 Homepage Cards
**Status**: Clean, optimized implementation
```
✅ brand-card-featured.html     → carousel container
✅ founder-card-featured.html   → carousel container
✅ testimonial-card.html        → grid container
✅ founder-card-focus.html      → custom container
✅ insight-latest-card.html     → grid container
```

### 🏢 Brands Pages
**Status**: Mixed implementation (optimized + universal)
```
✅ brand-card.html              → brands-grid container
❌ universal-card.html          → 6 instances in carousel/grid containers
   - featured-brands-carousel-big.html
   - featured-brands-carousel-small.html
   - brand-carousel-test.html
   - brand-grid-test.html
   - featured-brands-grid.html
```

### 👥 Founders Pages
**Status**: Mixed implementation (optimized + universal)
```
✅ founder-card.html            → founders-grid container
✅ founder-card-featured.html   → carousel container
❌ universal-card.html          → 8 instances in carousel/grid containers
   - founders-carousel.html
   - featured-founders-simple.html
   - founders-grid.html
   - recent-founders-backup.html
   - featured-founders-backup.html
```

### 📰 Insights Pages
**Status**: Specialized cards only
```
✅ insight-card.html            → carousel container
✅ featured-insight-card.html   → grid container
```

### 🎯 Dimensions Pages
**Status**: No dimension-specific pages exist

---

## Container Pattern Analysis

### 🎠 Carousel Containers
**Purpose**: Featured content with navigation
```
<div class="carousel" data-component-type="featured-[type]">
  <div class="carousel-card">
    {% include components/cards/[type]-card-featured.html %}
  </div>
</div>
```

**Used by:**
- brand-card-featured.html
- founder-card-featured.html

### 📊 Grid Containers
**Purpose**: Standard content display
```
<div class="[content]-grid">
  <div class="[content]-grid__item">
    {% include components/cards/[type]-card.html %}
  </div>
</div>
```

**Used by:**
- brand-card.html
- founder-card.html
- testimonial-card.html

### 🎯 Hero Containers
**Purpose**: Large featured content
```
<div class="hero-section">
  <!-- Hero cards not actively used -->
</div>
```

**Status**: hero-brand-card.html exists but no active usage found

---

## Critical Issues Identified

### ❌ Issue 1: Mixed Card Systems
**Problem**: Same page uses both optimized and universal cards
```
founders-carousel.html uses:
- universal-card.html (4 instances)
- Should use: founder-card.html
```

### ❌ Issue 2: Test Files in Production
**Problem**: Test files still exist and may be active
```
- brand-carousel-test.html
- brand-grid-test.html
- featured-founders-backup.html
- recent-founders-backup.html
```

### ❌ Issue 3: Backup Files Active
**Problem**: Backup files still referenced
```
- latest-insights-backup.html (still has card references)
- Should be: deleted or archived
```

---

## Recommendations

### 🎯 Phase 1: Eliminate Mixed Usage
1. Replace universal-card.html with optimized cards in:
   - All brands page components
   - All founders page components

### 🧹 Phase 2: Clean Test Files
1. Delete or archive test files:
   - `*-test.html` files
   - `*-backup.html` files

### 📏 Phase 3: Standardize Containers
1. Ensure consistent container patterns:
   - Carousel → Featured cards
   - Grid → Standard cards
   - Hero → Specialized large cards

---

## Next Steps

1. **Immediate**: Replace universal-card usage with optimized cards
2. **Short-term**: Delete test/backup files
3. **Long-term**: Implement consistent container patterns

**Target State**: 4 MVP cards, consistent container patterns, zero universal-card usage