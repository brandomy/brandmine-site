# Brandmine Assets

This directory contains all frontend assets for the Brandmine website, including CSS, JavaScript, fonts, and images. The assets are organized to maintain scalability and consistent implementation across the multilingual platform.

## Directory Structure

```
assets/
├── css/               # Stylesheet files organized by purpose
│   ├── base/          # Core styles (typography, layout)
│   ├── collections/   # Collection-specific styles
│   ├── components/    # UI component styles
│   ├── layout/        # Site layout styles
│   ├── manifest/      # Import manifests
│   ├── pages/         # Page-specific styles
│   └── tokens/        # Design tokens and variables
├── fonts/             # Web fonts for multiple languages
├── images/            # Image assets organized by content type
│   ├── attributes/    # Attribute taxonomy images
│   ├── brands/        # Brand-specific images
│   ├── icons/         # Icon assets
│   ├── insights/      # Insight article images
│   ├── markets/       # Market-specific images
│   ├── people/        # Team member and founder images
│   ├── sectors/       # Sector taxonomy images
│   ├── signals/       # Signal taxonomy images
│   └── site/          # Site-wide images and favicons
└── js/                # JavaScript files
```

## CSS Organization

The CSS is organized in a modular architecture using SCSS:

### Main Structure

1. **Tokens** (`/css/tokens/`) - Design variables and shared settings
   - `tokens.scss` - Color system, spacing, typography variables
   - `grid.scss` - Grid system definitions
   - `icons.scss` - Icon system styles

2. **Base** (`/css/base/`) - Foundational elements
   - `typography.scss` - Font definitions, sizes, and text styles
   - `layout.scss` - Basic layout patterns and utilities

3. **Components** (`/css/components/`) - Reusable UI elements
   - Organized by component type (cards, navigation, etc.)
   - Uses BEM methodology (`block__element--modifier`)
   - Each component typically has its own SCSS file

4. **Collections** (`/css/collections/`) - Collection-specific styling
   - Styles specific to Jekyll collections (brands, dimensions, insights)

5. **Pages** (`/css/pages/`) - Page-specific styling
   - Page-specific overrides for components
   - Organized by page type (home, about, etc.)

6. **Layout** (`/css/layout/`) - Site structure components
   - `header.scss` - Header styles
   - `footer.scss` - Footer styles
   - `panels.scss` - Content panel system

### Key Principles

1. **Mobile-First Approach**: Base styles target mobile, with `@media (min-width)` queries for larger screens
2. **BEM Naming**: Block__Element--Modifier pattern for consistent class naming
3. **Component Encapsulation**: Components styles are self-contained where possible
4. **Design Tokens**: Colors and other variables defined in tokens.scss
5. **Targeted CSS**: Page-specific styles kept to a minimum and properly scoped

For detailed CSS guidelines, see the [Brandmine CSS Style Guide](../docs/css-style-guide.md).

## JavaScript Files

The `js/` directory contains JavaScript functionality for the site:

- `brand-filtering.js` - Brand filtering, sorting, and search logic
- `header.js` - Header behaviors, mobile menu, etc.
- `premium-content.js` - Logic for premium content handling
- `styleguide.js` - Style guide documentation functionality

All JavaScript follows the principle of progressive enhancement, ensuring content works without JS, then enhancing functionality where available.

## Fonts

The `fonts/` directory contains web fonts in WOFF2 format for optimal performance:

- **PT Serif/Sans** - Primary Latin fonts (en, ru)
- **Noto Sans/Serif SC** - Primary Chinese fonts (zh)
- **Source Code Pro** - Monospace for code examples
- **PT Mono** - Alternative monospace font

The typography system is designed to maintain consistent reading experiences across all three languages, with specific font choices for each language-script combination.

## Images

The `images/` directory contains a comprehensive system of images organized by purpose and content type. For detailed documentation on image organization, processing, and implementation, see:

- [Images README](/assets/images/README.md) - Complete image documentation including:
  - Directory structure and organization
  - Naming conventions
  - Visual style framework
  - Image processing workflow
  - File format guidelines
  - Best practices and troubleshooting

## Usage Guidelines

### Using CSS

1. **Component-First Approach**: Use and extend existing components when possible
2. **Mobile-First Development**: Start with mobile styling, then enhance for larger screens
3. **Follow BEM Methodology**: Maintain consistent class naming
4. **Use Design Tokens**: Reference variables from tokens.scss

### Using JavaScript

1. **Progressive Enhancement**: Ensure content works without JS
2. **Load Efficiently**: JavaScript is placed at the end of the document
3. **Keep Modular**: Each file should have a focused purpose

### Using Fonts

1. **Font Loading Strategy**: Custom fonts are preloaded in head
2. **Language-Specific Fonts**: Use language-specific font stacks
3. **Fallback Fonts**: Always provide web-safe fallbacks

### Using Images

For detailed image usage guidance, refer to the [Images README](/assets/images/README.md).

## Responsive Design Strategy

The Brandmine asset system supports a consistent responsive approach:

1. **Breakpoints**:
   - 480px - Mobile (xs)
   - 640px - Small (sm)
   - 768px - Medium (md)
   - 992px - Large (lg)
   - 1200px - Extra Large (xl)

2. **Mobile-First CSS**:
   ```css
   /* Base styles for mobile */
   .component { 
     /* Mobile styles */ 
   }

   /* Enhancements for larger screens */
   @media (min-width: 768px) {
     .component { 
       /* Medium screen enhancements */ 
     }
   }
   ```

3. **Responsive Images**:
   - 400w - Mobile sizes
   - 800w - Tablet/medium sizes
   - 1200w - Desktop sizes

## Multilingual Design Considerations

The asset system is designed to support three languages with different writing systems:

1. **Font Selection**:
   - English/Russian: PT Serif/Sans
   - Chinese: Noto Serif/Sans SC

2. **Text Flow**:
   - All languages use left-to-right flow
   - Chinese text typically requires more vertical space
   - Russian text typically runs 15-20% longer than English

3. **Typography Adjustments**:
   - Adjusted line heights for Chinese
   - Larger font sizes for Russian on small screens

## Best Practices

1. **Optimize Assets**:
   - Compress images before adding
   - Minify CSS in production
   - Bundle JS appropriately
   - Preload critical fonts

2. **Maintain Structure**:
   - Follow established organization patterns
   - Create new partial files for significant components
   - Document new components as they are created

3. **Test Thoroughly**:
   - Test all assets across breakpoints
   - Validate in all three languages
   - Ensure appropriate fallbacks

## Related Documentation

- [Brandmine CSS Style Guide](../docs/css-style-guide.md)
- [Brandmine JS Guidelines](../docs/js-guidelines.md)
- [Brandmine Image Style Guide](../docs/design/image-style-guide.md)
- [Component Development Guidelines](../docs/component-dev-guidelines.md)