# Brandmine CSS Directory

This directory contains all stylesheet files for the Brandmine website. The CSS is organized using a modular SCSS architecture that prioritizes maintainability, scalability, and responsive design.

## Directory Structure

```
css/
├── base/                  # Foundational styles
│   ├── layout.scss        # Base layout principles
│   └── typography.scss    # Typography foundations
├── collections/           # Collection-specific styles
│   ├── brands/            # Brand collection styling
│   │   └── featured-brand.scss
│   ├── dimensions/        # Taxonomy dimension styling
│   │   └── dimensions.scss
│   ├── insights/          # Insight content styling
│   │   ├── insights-feed.scss
│   │   ├── insights-grid-categories.scss
│   │   ├── insights-grid.scss
│   │   ├── insights.scss
│   │   └── latest-insights-grid.scss
│   └── markets/           # Market-specific styling
│       └── market-sector.scss
├── components/            # Reusable UI components
│   ├── buttons.scss       # Button styles and variants
│   ├── cards/             # Card component styles
│   │   ├── brand-card.scss
│   │   ├── cards.scss
│   │   ├── insight-card.scss
│   │   └── sector-cards.scss
│   ├── carousels/         # Carousel components
│   │   └── featured-brands-carousel.scss
│   ├── dimension/         # Dimension visualization components
│   │   ├── dimension-cloud.scss
│   │   ├── dimension-list.scss
│   │   ├── dimension.scss
│   │   ├── discovery-dimensions-grid.scss
│   │   └── discovery-tooltips.scss
│   ├── forms.scss         # Form elements
│   ├── image.scss         # Image styling
│   ├── layouts.scss       # Layout components
│   ├── mobile-fixes.scss  # Mobile-specific adjustments
│   ├── navigation/        # Navigation components
│   │   ├── discovery-navigation.scss
│   │   └── navigation.scss
│   ├── search/            # Search interface components
│   │   ├── search-box.scss
│   │   └── search-filter.scss
│   ├── solutions.scss     # Solution display components
│   ├── taxonomy-icon.scss # Taxonomy icon system
│   ├── team.scss          # Team member components
│   └── text.scss          # Text components and formatting
├── debug.scss             # Debug tools (not used in production)
├── layout/                # Site structure components
│   ├── footer.scss        # Site footer styling
│   ├── header.scss        # Site header styling
│   └── panels.scss        # Content panel system
├── manifest/              # Import manifests
│   ├── collections.scss   # Collection component imports
│   ├── components.scss    # UI component imports
│   ├── layout.scss        # Layout component imports
│   └── pages.scss         # Page-specific imports
├── pages/                 # Page-specific styles
│   ├── 404.scss           # Error page
│   ├── about.scss         # About page
│   ├── brands.scss        # Brands listing page
│   ├── dimension-page.scss # Generic dimension page
│   ├── dimension-specific/ # Specialized dimension pages
│   │   ├── discover-attributes.scss
│   │   ├── discover-markets.scss
│   │   ├── discover-sectors.scss
│   │   ├── discover-signals.scss
│   │   └── russian-sectors.scss
│   ├── discovery-hub.scss # Discovery landing page
│   ├── discovery.scss     # Discovery section
│   ├── home.scss          # Homepage
│   ├── insights.scss      # Insights listing page
│   └── search.scss        # Search results page
├── styleguide.scss        # Style guide specific styles
└── tokens/                # Design variables
    ├── grid.scss          # Grid system definitions
    ├── icons.scss         # Icon system
    └── tokens.scss        # Color variables and spacing
```

## Architecture Philosophy

The CSS architecture follows these principles:

1. **Component-Based Design**: Each UI component has its own SCSS file
2. **Mobile-First Approach**: Base styles for mobile with media queries for larger screens
3. **BEM Methodology**: Block__Element--Modifier pattern for predictable CSS
4. **Design Token System**: Colors, spacing, and other values defined as CSS custom properties
5. **Progressive Enhancement**: Core functionality works without advanced CSS
6. **Minimal Specificity**: Avoiding deep nesting and keeping specificity low
7. **Visual Consistency**: Maintaining consistent visual language through tokens
8. **Multilingual Support**: Accommodating three languages with different writing systems

## BEM Naming Convention

```css
/* Block */
.brand-card { }

/* Element (part of the block) */
.brand-card__image { }
.brand-card__title { }

/* Modifier (variant of block or element) */
.brand-card--featured { }
.brand-card__title--large { }
```

## Design Token System

All visual design values are managed through a comprehensive token system in `tokens.scss`:

### Color System

```css
:root {
  /* Primary color (Teal) with variants */
  --primary-50: #E6FFFA;
  --primary-100: #B2F5EA;
  /* ...additional variants... */
  --primary-900: #1D4044;
  
  /* Secondary color (Orange) with variants */
  --secondary-50: #FFF7ED;
  --secondary-100: #FFEDD5;
  /* ...additional variants... */
  
  /* Additional color palettes: Neutral, Accent, etc. */
}
```

### Dimension Colors

Each taxonomy dimension has a dedicated color scheme:

```css
:root {
  /* Sectors (Olive Green) */
  --olive-50: #F7FAEB;
  --olive-500: #A3B763; /* Base olive */
  
  /* Markets (Sky Blue) */
  --sky-50: #F0F9FF;
  --sky-500: #0EA5E9; /* Base sky */
  
  /* Attributes (Orange) */
  /* See secondary colors above */
  
  /* Signals (Indigo) */
  --accent-50: #EEF2FF;
  --accent-500: #6366F1; /* Base accent */
}
```

### Typography

```css
:root {
  /* Font families */
  --font-heading-en: 'PT Serif', Georgia, serif;
  --font-body-en: 'PT Sans', Arial, sans-serif;
  --font-heading-zh: 'Noto Serif SC', serif;
  --font-body-zh: 'Noto Sans SC', sans-serif;
  
  /* Font sizes */
  --text-xs: 0.75rem;   /* 12px */
  --text-sm: 0.875rem;  /* 14px */
  --text-base: 1rem;    /* 16px */
  --text-lg: 1.125rem;  /* 18px */
  --text-xl: 1.25rem;   /* 20px */
  --text-2xl: 1.5rem;   /* 24px */
  --text-3xl: 1.875rem; /* 30px */
  --text-4xl: 2.25rem;  /* 36px */
  
  /* Line heights */
  --leading-none: 1;
  --leading-tight: 1.25;
  --leading-normal: 1.5;
  --leading-relaxed: 1.625;
}
```

### Spacing

```css
:root {
  --space-1: 0.25rem;  /* 4px */
  --space-2: 0.5rem;   /* 8px */
  --space-3: 0.75rem;  /* 12px */
  --space-4: 1rem;     /* 16px */
  --space-6: 1.5rem;   /* 24px */
  --space-8: 2rem;     /* 32px */
  --space-10: 2.5rem;  /* 40px */
  --space-12: 3rem;    /* 48px */
  --space-16: 4rem;    /* 64px */
  --space-20: 5rem;    /* 80px */
}
```

## Responsive Design

### Breakpoints

```
xs: 480px  (Extra small - larger phones)
sm: 640px  (Small - tablets portrait)
md: 768px  (Medium - tablets landscape)
lg: 992px  (Large - small desktops)
xl: 1200px (Extra large - large desktops)
```

### Media Query Pattern

```scss
/* Mobile-first approach */
.component {
  /* Base styles for mobile */
  
  /* Medium devices (md) and up */
  @media (min-width: 768px) {
    /* Tablet+ enhancements */
  }
  
  /* Large devices (lg) and up */
  @media (min-width: 992px) {
    /* Desktop enhancements */
  }
}
```

### Responsive Grid System

The grid system is defined in `tokens/grid.scss`:

```scss
:root {
  --grid-column-count: 12;
  --grid-gap: 1rem;
  --grid-max-width: 1200px;
}

.row {
  display: flex;
  flex-wrap: wrap;
  margin: 0 calc(var(--grid-gap) / -2);
}

.col-md-4 {
  width: 100%; /* Full width on mobile */
  padding: 0 calc(var(--grid-gap) / 2);
  
  @media (min-width: 768px) {
    width: 33.333%; /* 4/12 = 33.333% on tablet+ */
  }
}

/* Additional column classes defined similarly */
```

## Key Components

### Panels

Panel system (`layout/panels.scss`) creates full-width content sections with consistent internal spacing:

```scss
.panel {
  width: 100vw;
  margin-left: -50vw;
  margin-right: -50vw;
  position: relative;
  left: 50%;
  right: 50%;
  padding: var(--space-8) 0;
}

.panel__content {
  max-width: var(--grid-max-width);
  margin: 0 auto;
  padding: 0 var(--space-4);
}
```

Panels have various modifiers for background styles:
- `.panel--light` - White background
- `.panel--primary` - Primary color light background
- `.panel--olive-soft` - Olive (sectors) light background
- `.panel--secondary-soft` - Secondary (attributes) light background
- `.panel--accent-soft` - Accent (signals) light background
- `.panel--sky-soft` - Sky (markets) light background

### Brand Cards

Brand cards (`components/cards/brand-card.scss`) display consistent brand previews:

```scss
.brand-card {
  border-radius: var(--radius-md);
  overflow: hidden;
  box-shadow: var(--shadow-sm);
  background-color: white;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.brand-card:hover {
  transform: translateY(-3px);
  box-shadow: var(--shadow-md);
}

.brand-card__image {
  aspect-ratio: 3/2;
  background-color: var(--neutral-100);
}

/* Additional elements defined similarly */
```

### Dimension Discovery Navigation

The navigation tabs for discovery section (`components/navigation/discovery-navigation.scss`):

```scss
.discovery-tabs {
  display: flex;
  border-bottom: 1px solid var(--neutral-200);
  margin-bottom: var(--space-6);
  overflow-x: auto;
}

.discovery-tab {
  padding: var(--space-3) var(--space-4);
  white-space: nowrap;
  position: relative;
}

.discovery-tab--active::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  right: 0;
  height: 3px;
  background-color: var(--primary-500);
}

/* Dimension-specific active tabs */
.discovery-tab--sectors.discovery-tab--active::after {
  background-color: var(--olive-500);
}

.discovery-tab--markets.discovery-tab--active::after {
  background-color: var(--sky-500);
}

/* ...etc for other dimensions */
```

## Manifest Files

SCSS partials are imported via manifest files:

```scss
// manifest/components.scss
@import '../components/buttons.scss';
@import '../components/cards/cards.scss';
@import '../components/cards/brand-card.scss';
// ...additional imports
```

These manifest files are then imported in the main SCSS file:

```scss
// main.scss
@import 'manifest/tokens.scss';
@import 'manifest/base.scss';
@import 'manifest/components.scss';
@import 'manifest/collections.scss';
@import 'manifest/layout.scss';
@import 'manifest/pages.scss';
```

## Using CSS Components

When implementing components in HTML/Jekyll templates:

### Brand Card Example

```html
<div class="brand-card {% if brand.featured %}brand-card--featured{% endif %}">
  <div class="brand-card__image">
    {% include components/images/brand-image.html 
       country=brand.country_code
       brand=brand.slug
       image="thumbnail"
       purpose="hero"
       alt=brand.brand_name %}
  </div>
  <div class="brand-card__content">
    <h3 class="brand-card__title">{{ brand.brand_name }}</h3>
    <div class="brand-card__meta">
      {% if brand.country %}
      <span class="brand-card__location">{{ brand.country }}</span>
      {% endif %}
      
      {% if brand.sector %}
      <span class="brand-card__sector">{{ brand.sector }}</span>
      {% endif %}
    </div>
    <p class="brand-card__description">{{ brand.description | truncate: 120 }}</p>
  </div>
</div>
```

### Panel Component Example

```html
<div class="panel panel--olive-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">{{ section_title }}</h2>
    <p class="panel__lead-text">{{ section_description }}</p>
    
    <!-- Panel content -->
  </div>
</div>
```

## Best Practices

### Writing CSS

1. **Follow BEM Naming**:
   - Keep names descriptive and aligned with BEM pattern
   - Use kebab-case for multi-word block names

2. **Mobile-First Approach**:
   - Write base styles for mobile viewports first
   - Add media queries for larger screens using `min-width`

3. **Use Design Tokens**:
   - Reference CSS variables for colors, spacing, etc.
   - Avoid hardcoding values that should be consistent

4. **Minimize Specificity**:
   - Avoid deep nesting of selectors
   - Use BEM naming to avoid specificity issues
   - Limit use of `!important` to override utility classes only

5. **Component Encapsulation**:
   - Keep component styles self-contained
   - Avoid dependencies between unrelated components

6. **File Organization**:
   - Place styles in appropriate directories
   - Create new files for significant components
   - Update manifest imports when adding files

### Multilingual Handling

1. **Font Stack Adjustments**:
   - Use `html[lang="zh"]` selector for Chinese-specific adjustments:
     ```css
     html[lang="zh"] {
       --font-heading: var(--font-heading-zh);
       --font-body: var(--font-body-zh);
     }
     ```

2. **Text Length Variations**:
   - Account for different text lengths across languages
   - Provide sufficient space for Russian (typically 15-20% longer)
   - Use flexible layouts when possible

3. **Writing System Considerations**:
   - Adjust line heights for Chinese script
   - Account for different font metrics across scripts

## Modifying and Extending CSS

### Adding a New Component

1. Create a new SCSS file in the appropriate directory:
   ```
   touch css/components/new-component.scss
   ```

2. Add the import to the relevant manifest file:
   ```scss
   // manifest/components.scss
   @import '../components/new-component.scss';
   ```

3. Follow the BEM naming pattern in the new file:
   ```scss
   .new-component {
     /* Base component styles */
   }
   
   .new-component__element {
     /* Element styles */
   }
   
   .new-component--modifier {
     /* Modifier styles */
   }
   ```

4. Test across breakpoints and languages.

### Modifying Existing Components

1. Locate the component's SCSS file
2. Make targeted changes to the specific BEM classes
3. Avoid modifying base variables unless necessary
4. Test changes across all affected views

## Troubleshooting

### Common Issues

1. **Styles not applying**:
   - Check selector specificity
   - Verify class names match exactly
   - Check if styles are being overridden elsewhere

2. **Responsive issues**:
   - Verify media query syntax
   - Check for conflicting breakpoints
   - Test with browser dev tools responsive mode

3. **Layout breaks in certain languages**:
   - Test with actual or sample content in all languages
   - Adjust for different text lengths or character heights
   - Use flexible layouts where possible

### Debug Tools

During development, you can enable debug.scss:

```html
<link rel="stylesheet" href="{{ '/assets/css/debug.css' | relative_url }}">
```

This adds visual helpers like grid overlays and box outlines.

## Related Documentation

- [Main Assets README](../README.md) - Overview of all assets
- [Brandmine UI Kit](../../docs/design/ui-kit.md) - Visual design system documentation
- [Component Development Guide](../../docs/component-dev-guide.md) - Component creation workflow