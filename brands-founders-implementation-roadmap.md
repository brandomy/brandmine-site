# Brands & Founders Pages Implementation Roadmap

## Implementation Strategy: Simple 2-Card System

**Goal:** Implement Brands and Founders pages using clean 2-card architecture, avoiding universal card complexity.

## Phase 1: Founder Cards BEM Standardization (30 min)

### Step 1.1: Rename Founder Cards to BEM Convention
```bash
# Rename simplified-founder-card.html to match brand pattern
mv _includes/components/cards/simplified-founder-card.html _includes/components/cards/founder-card-featured.html

# Update all references
grep -r "simplified-founder-card" _includes/ _layouts/ _data/
# Replace with "founder-card-featured"
```

### Step 1.2: Update CSS Classes to BEM
```bash
# Update founder-card-featured.html CSS classes
# From: simplified-founder-card → founder-card-featured
# From: simplified-founder-card__* → founder-card-featured__*

# Rename CSS file if needed
mv assets/css/pages/home/simplified-founder-card.scss assets/css/pages/home/founder-card-featured.scss
```

### Step 1.3: Verify Basic Founder Card
```bash
# Ensure founder-card.html is ready for grid use
# Check if it needs optimization (currently 226 lines)
# Target: ~150 lines for consistency with brand-card.html (140 lines)
```

## Phase 2: Brands Page Implementation (45 min)

### Step 2.1: Design Brands Page Layout
**Required sections for MVP:**
- **Hero section:** Brand discovery introduction
- **Featured Brands Carousel:** 6-8 featured brands using `brand-card-featured.html`
- **All Brands Grid:** Full brand listing using `brand-card.html`
- **Contact CTA:** Lead generation

### Step 2.2: Create Brands Page Sections
```bash
# Update _includes/pages/brands/ sections
# - featured-brands.html (carousel using brand-card-featured.html)
# - latest-brands.html (grid using brand-card.html)
# - hero.html (brands-specific hero)
# - contact-cta.html (lead generation)
```

### Step 2.3: Configure Brands Page Data
```bash
# Update _data/page_sections.yml for brands page
# Simplify sections list to core MVP requirements:
# - hero, featured-brands, latest-brands, contact-cta

# Test data filtering for featured vs. standard brands
# Ensure brand.featured flag works correctly
```

## Phase 3: Founders Page Implementation (45 min)

### Step 3.1: Design Founders Page Layout  
**Required sections for MVP:**
- **Hero section:** Founder discovery introduction
- **Featured Founders Carousel:** 6-8 featured founders using `founder-card-featured.html`
- **All Founders Grid:** Full founder listing using `founder-card.html`
- **Contact CTA:** Lead generation

### Step 3.2: Create Founders Page Sections
```bash
# Update _includes/pages/founders/ sections
# - featured-founders.html (carousel using founder-card-featured.html)
# - recent-founders.html (grid using founder-card.html)
# - hero.html (founders-specific hero)
# - contact-cta.html (lead generation)
```

### Step 3.3: Configure Founders Page Data
```bash
# Update _data/page_sections.yml for founders page
# Simplify sections list to core MVP requirements:
# - hero, featured-founders, recent-founders, contact-cta

# Test data filtering for featured vs. standard founders
# Ensure founder.featured flag works correctly
```

## Phase 4: Page Layout & Styling (30 min)

### Step 4.1: Responsive Grid System
```bash
# Ensure grid layouts work properly:
# Mobile: 1 column
# Tablet: 2 columns  
# Desktop: 3 columns

# Carousel layouts:
# Mobile: 1 card
# Desktop: 2 cards (matching current featured-brands pattern)
```

### Step 4.2: Page-Specific Styling
```bash
# Create/update page-specific CSS:
# - assets/css/pages/brands.scss
# - assets/css/pages/founders.scss

# Include card component styles:
# @import 'components/cards/brand-card';
# @import 'components/cards/brand-card-featured';
# @import 'components/cards/founder-card';
# @import 'components/cards/founder-card-featured';
```

## Card Architecture Summary

### Final 2-Card System Per Content Type

**Brand Cards:**
```
_includes/components/cards/
├── brand-card.html              # Grid display (140 lines)
└── brand-card-featured.html     # Carousel display (116 lines)
```

**Founder Cards:**
```
_includes/components/cards/
├── founder-card.html            # Grid display (~150 lines after optimization)
└── founder-card-featured.html   # Carousel display (124 lines)
```

### Usage Patterns
- **Carousels:** Use featured variants (`*-card-featured.html`)
- **Grids:** Use basic variants (`*-card.html`)
- **Hero sections:** Use featured variants with enhanced styling
- **Sidebars/Related:** Use basic variants

## Page Structure

### Brands Page (`/brands/`)
```
sections:
  - hero (brand discovery intro)
  - featured-brands (carousel with brand-card-featured.html)
  - latest-brands (grid with brand-card.html)
  - contact-cta (lead generation)
```

### Founders Page (`/founders/`)
```
sections:
  - hero (founder discovery intro) 
  - featured-founders (carousel with founder-card-featured.html)
  - recent-founders (grid with founder-card.html)
  - contact-cta (lead generation)
```

## Success Metrics

### Technical Goals
- ✅ **4 cards total** (2 brands + 2 founders) instead of 23 variants
- ✅ **~130 lines average** per card instead of 977-line universal system
- ✅ **BEM naming** consistent across all cards
- ✅ **No configuration complexity** (direct implementation)

### User Experience Goals  
- ✅ **Fast loading** Brands/Founders pages
- ✅ **Responsive** grid/carousel layouts  
- ✅ **Clear content hierarchy** (featured → standard)
- ✅ **Consistent card styling** across both pages

### Development Goals
- ✅ **Simple maintenance** (4 focused cards vs. complex universal system)
- ✅ **Clear patterns** (featured for carousels, basic for grids)
- ✅ **Easy extension** (add new content types with same 2-card pattern)

## Testing Requirements

### Visual Testing
- [ ] Brands page carousel displays correctly on mobile/desktop
- [ ] Brands page grid shows appropriate number of columns
- [ ] Founders page carousel displays correctly on mobile/desktop  
- [ ] Founders page grid shows appropriate number of columns
- [ ] Card hover states work consistently
- [ ] Images load correctly with fallbacks

### Functional Testing
- [ ] Featured brands filter works correctly
- [ ] Featured founders filter works correctly
- [ ] Pagination works on grid sections (if needed)
- [ ] Contact CTAs link correctly
- [ ] All internal links work properly

### Performance Testing  
- [ ] Page load times <3 seconds
- [ ] Image loading optimized
- [ ] CSS/JS bundle sizes reasonable
- [ ] No console errors

## Risk Mitigation

### Low Risk Items
- Card components already exist and work
- BEM naming follows established patterns
- Page structure follows existing patterns

### Medium Risk Items
- Data filtering for featured vs. standard content
- Responsive layout edge cases
- CSS conflicts during migration

### High Risk Items  
- None identified (simple architecture minimizes risk)

**Mitigation Strategy:** Implement incrementally, test each phase before proceeding.