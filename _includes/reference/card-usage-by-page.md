# Card Usage Analysis by Page Type

## Executive Summary

**Current Component Architecture:**
- **Purpose-Built Cards**: Specialized BEM-compliant components for each content type
- **Variant System**: Each card supports multiple variants via parameters
- **Container Pattern**: Carousel containers for featured cards, grid containers for standard cards
- **Status**: Universal card system completely eliminated (June 2025)

---

## Page-by-Page Card Usage

### 🏠 Homepage Cards
**Status**: Fully implemented with purpose-built components
```
✅ brand-card.html (variant="featured")    → carousel container
✅ founder-card.html (variant="featured")  → carousel container
✅ testimonial-card.html                   → grid container
✅ founder-quote-card.html                 → founder focus section
✅ insight-card.html                       → latest insights grid
```

### 🏢 Brands Pages
**Status**: Fully migrated to component cards
```
✅ brand-card.html (variant="standard")    → brands-grid container
✅ brand-card.html (variant="featured")    → featured-brands sections
✅ Helper: brand-card-selector.html        → Intelligent variant selection
```

### 👥 Founders Pages
**Status**: Fully migrated to component cards
```
✅ founder-card.html (variant="standard")  → founders-grid container
✅ founder-card.html (variant="featured")  → carousel sections
✅ Helper: founder-card-selector.html      → Intelligent variant selection
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

**Status**: hero-brand-card.html removed, use brand-card.html with variant="featured"

---

## Current Card Components

### Core Content Cards
```
✅ brand-card.html         → Variants: standard, featured, insight
✅ founder-card.html       → Variants: standard, featured
✅ insight-card.html       → Variants: standard, featured, tagged, related
✅ testimonial-card.html   → Standard testimonial display
```

### Specialized Cards
```
✅ dimension-category-card.html  → Dimension category displays
✅ founder-quote-card.html       → Founder focus sections
✅ team-member-card.html         → Team displays
✅ author-card.html              → Author attribution
✅ entry-card.html               → Journal entries
```

### Helper Components
```
✅ brand-card-selector.html      → Intelligent brand card variant selection
✅ founder-card-selector.html    → Intelligent founder card variant selection
✅ case-study-card-selector.html → Case study card selection
```

---

## Implementation Patterns

### Variant Usage
```liquid
{% comment %} Standard card in grid {% endcomment %}
{% include components/cards/brand-card.html brand=brand %}

{% comment %} Featured card in carousel {% endcomment %}
{% include components/cards/brand-card.html brand=brand variant="featured" %}

{% comment %} Insight context variant {% endcomment %}
{% include components/cards/brand-card.html brand=brand variant="insight" %}
```

### Container Patterns
- **Carousels**: Use featured variants
- **Grids**: Use standard variants
- **Lists**: Use compact or standard variants
- **Hero sections**: Use featured variants

---

## Architecture Benefits

1. **Maintainability**: Each card type has focused responsibility
2. **Performance**: No complex conditionals or massive template files
3. **Flexibility**: Variants handle different contexts without duplication
4. **Consistency**: BEM methodology ensures predictable styling

**Current State**: Purpose-built cards fully implemented, universal card system eliminated