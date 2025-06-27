# Homepage Carousel Pattern Analysis

## Objective
Analyze the three working homepage carousels to understand implementation patterns and card component behavior within carousel contexts.

## 1. Carousel Structure Comparison Table

| Component | Case Studies | Featured Brands | Founder Focus | Notes |
|-----------|--------------|-----------------|---------------|-------|
| **Container Class** | `.universal-carousel` | `.universal-carousel` | `.universal-carousel` | ✅ **IDENTICAL** |
| **Data Attributes** | `data-component-type="case-studies"` | `data-component-type="featured-brands-simplified"` | `data-component-type="founder-focus"` | Same pattern, different types |
| **Navigation Structure** | `<div class="universal-carousel-nav" data-carousel-id="case-studies"></div>` | `<div class="universal-carousel-nav" data-target="featured-brands-simplified">` with generated dots | `<div class="founder-focus__navigation"><div class="founder-focus__dots">` with generated buttons | ❌ **3 DIFFERENT IMPLEMENTATIONS** |
| **Content Source** | `site.data.case_studies[page.lang]` | `filtered_brands` (via brand-filter helper) | `site.founders \| where: "lang", page.lang \| where: "featured", true \| limit: 4` | 3 different data access patterns |
| **JavaScript Targeting** | `.universal-carousel[data-component-type="case-studies"]` | `.universal-carousel[data-component-type="featured-brands-simplified"]` | `.universal-carousel[data-component-type="founder-focus"]` | Same pattern, different component types |

## 2. Card Component Analysis Table

| Aspect | Case Studies Cards | Brand Cards | Founder Cards | Analysis |
|--------|-------------------|-------------|---------------|----------|
| **Include Path** | ❌ **INLINE HTML** (no separate component) | `components/cards/simplified-brand-card.html` | `components/cards/founder-focus-card.html` | Case studies bypass component system |
| **Parameters Passed** | N/A (inline) | `brand=brand` | `founder=founder` | Standard parameter pattern |
| **Card Structure** | `<div class="test-card">` with inline HTML | `<article class="simplified-brand-card">` | `<div class="founder-focus-card">` | Different wrapper elements |
| **Content Elements** | Hero image, metrics badge, title, description, taxonomy tags, CTA | Hero image, metrics badge, title, meta info, description, taxonomy tags, CTA | Portrait image, name, location, achievement, company, tags, description, CTA | Similar complexity, different layouts |
| **Styling Classes** | `.test-card-*` classes | `.simplified-brand-card-*` classes | `.founder-focus-card-*` classes | Component-specific class naming |

## 3. Carousel vs Card Interaction Analysis

### 1. Is carousel just a wrapper?
**YES** - The carousel is purely a container wrapper. Analysis reveals:

- **Carousel provides**: Layout structure (`.universal-carousel`), scroll behavior, navigation
- **Cards are independent**: Each card component has its own complete styling and functionality
- **No carousel-specific card styling**: Cards don't adapt their internal styling based on carousel context
- **Responsive behavior**: Handled by carousel container CSS, not individual cards

### 2. Card adaptation patterns:
- **No different variants/sizes**: Cards maintain their intrinsic dimensions regardless of carousel context
- **No carousel-specific parameters**: Cards receive the same parameters whether in carousel, grid, or standalone
- **Responsive behavior**: Carousel container handles responsive layout (1 card mobile, 2 cards tablet+), cards remain fixed size

### 3. Content filtering differences:
- **Case Studies**: Direct access to data file `site.data.case_studies[page.lang]` - no filtering
- **Featured Brands**: Uses helper `brand-filter.html` with `featured=true` parameter
- **Founder Focus**: Direct Jekyll collection filtering `site.founders | where: "featured", true | limit: 4`

## 4. JavaScript Integration Analysis

### Initialization patterns:
All carousels use the same targeting pattern:
```javascript
document.querySelector('.universal-carousel[data-component-type="SPECIFIC-TYPE"]')
```

### Event handling differences:
- **Case Studies**: Dynamic dot generation based on content count, complex scroll position calculation
- **Featured Brands**: Pre-generated dots with data-slide attributes, simpler click handling
- **Founder Focus**: Auto-advance functionality, pause on interaction, accessibility features

### Responsive behavior:
- **Case Studies**: `window.innerWidth <= 991 ? 1 : 2` cards per view
- **Featured Brands**: Similar responsive breakpoints
- **Founder Focus**: Single card focus with auto-advance

### Performance patterns:
- **Case Studies**: Throttled scroll event handling (100ms delay)
- **Featured Brands**: Basic scroll event handling
- **Founder Focus**: Multiple timers for auto-advance and pause functionality

## 5. CSS Architecture Analysis

### Shared styles:
```scss
.universal-carousel {
    display: flex;
    flex-wrap: nowrap;
    overflow-x: auto;
    scroll-behavior: smooth;
    gap: var(--space-6);
    // ... common carousel properties
}
```

### Specific styles:
- **Case Studies**: `.universal-carousel[data-component-type="case-studies"]` + `.test-card` styles
- **Featured Brands**: `.universal-carousel[data-component-type="featured-brands-simplified"]` + `.simplified-brand-card` styles  
- **Founder Focus**: `.universal-carousel[data-component-type="founder-focus"]` + `.founder-focus-card` styles

### Responsive patterns:
All use mobile-first approach:
- Mobile: 1 card (100% width)
- Tablet+: 2 cards (50% width minus gap)
- Special case: Founder Focus uses fixed 900px width on desktop

### Card styling context:
Cards are **completely independent** of carousel context. No conditional styling based on container.

## 6. Implementation Recommendations

### What should be universal:
1. **Carousel container structure**: `.universal-carousel` with `data-component-type` attribute
2. **Basic CSS patterns**: Flex layout, scroll behavior, gap spacing
3. **JavaScript initialization pattern**: Target by `data-component-type` attribute
4. **Responsive breakpoints**: Mobile (1 card) → Tablet+ (2 cards)

### What should be parameterized:
1. **Content source**: Data file vs collection vs filtered collection
2. **Card component path**: Different card components for different content types
3. **Navigation implementation**: Different nav structures require different approaches
4. **JavaScript behavior**: Auto-advance, pause, scroll calculation methods

### What should remain separate:
1. **Card component styling**: Each card type has completely different layout requirements
2. **Navigation JavaScript**: Three different implementations with different complexity levels
3. **Content filtering logic**: Different data sources require different access patterns

### Simplification opportunities:
1. **Standardize navigation structure**: Use consistent DOM structure across all carousels
2. **Unify JavaScript event handling**: Consolidate scroll calculation and dot management
3. **Consistent content filtering**: Create standard helper pattern for all content types

## Key Findings

### 1. Are the carousels fundamentally similar?
**YES** - All three carousels use identical container structure (`.universal-carousel`) and similar responsive patterns. The differences are in content access, card components, and navigation JavaScript.

### 2. What makes each carousel unique?
- **Content access patterns**: Data file vs collection vs filtered collection
- **Card component complexity**: Inline HTML vs simple component vs complex component
- **Navigation JavaScript**: Basic vs complex vs auto-advance functionality

### 3. How do card components adapt in carousel contexts?
**They don't** - Cards are completely independent components that maintain their styling regardless of context. The carousel is purely a layout container.

### 4. What patterns can be safely universalized?
- **Container structure**: `.universal-carousel` with `data-component-type`
- **Basic responsive behavior**: Mobile 1 card, tablet+ 2 cards
- **Content iteration pattern**: Loop through content and include card component
- **Navigation structure**: Can be standardized to use consistent DOM pattern

## Universal Carousel Implementation Strategy

**The working pattern is:**
```html
<div class="universal-carousel" data-component-type="CONTENT-TYPE">
  {% for item in content_collection %}
    <!-- Optional card wrapper for specific styling -->
    {% include components/cards/CONTENT-TYPE-card.html item=item %}
  {% endfor %}
</div>
<div class="universal-carousel-nav" data-target="CONTENT-TYPE">
  <!-- Generate dots based on content count -->
</div>
```

**Success requires:**
1. Copy this exact structure
2. Parameterize only: content_collection, CONTENT-TYPE, card component path
3. Maintain identical CSS class names and JavaScript targeting
4. Don't abstract away what works