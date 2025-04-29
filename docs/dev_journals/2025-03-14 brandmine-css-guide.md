# Brandmine CSS Organization Guide

## Overview

This guide outlines a practical approach to organizing CSS for the Brandmine project. It balances good organization with simplicity, making it approachable for novice programmers while providing structure for future growth.

## Core Principles

1. **Logical grouping** - Files grouped by purpose (core, components, pages)
2. **Progressive enhancement** - Start with mobile styles, then add desktop styles
3. **Component-based thinking** - Organize CSS around reusable UI elements
4. **Clear documentation** - Include helpful comments that explain the "why"
5. **Incremental adoption** - Implement this structure gradually, one component at a time

## File Structure

```
assets/css/
├── main.css           # Core styles and variables
├── typography.css     # Font definitions and text styles
├── components/        # Reusable UI components
│   ├── buttons.css    # Button styles
│   ├── cards.css      # Card component styles
│   ├── forms.css      # Form styles
│   └── navigation.css # Header, navigation, footer
├── layout/            # Page structure components
│   └── panels.css     # Full-width panel system
└── pages/             # Page-specific styles
    ├── home.css       # Homepage styles
    ├── about.css      # About page styles
    └── sectors.css    # Sector pages styles
```

## File Contents

### main.css

This is your foundation file containing:
- CSS Custom Properties (variables) for colors, spacing, etc.
- Base reset styles for consistent rendering across browsers
- Fundamental element styles (body, links, etc.)
- Core utility classes

### typography.css

Contains all typography-related styles:
- Font declarations (@font-face)
- Text variables (sizes, weights, line heights)
- Heading styles (h1-h6)
- Text utility classes
- Language-specific typography adjustments

### components/

Individual files for each reusable component type:

- **buttons.css** - All button variations (.btn, .btn-primary, etc.)
- **cards.css** - Card components and variations
- **forms.css** - Form elements, inputs, and form layouts
- **navigation.css** - Site header, navigation, and footer

### layout/

Files for major layout systems:

- **panels.css** - The full-width panel system used throughout the site

### pages/

Page-specific styles that don't belong in the components:

- **home.css** - Homepage-specific styles
- **about.css** - About page-specific styles
- **sectors.css** - Sector pages-specific styles

## HTML Structure

In your default layout file, include the CSS in this order:

```html
<!-- Core styles -->
<link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
<link rel="stylesheet" href="{{ '/assets/css/typography.css' | relative_url }}">

<!-- Component styles -->
<link rel="stylesheet" href="{{ '/assets/css/components/buttons.css' | relative_url }}">
<link rel="stylesheet" href="{{ '/assets/css/components/cards.css' | relative_url }}">
<link rel="stylesheet" href="{{ '/assets/css/components/forms.css' | relative_url }}">
<link rel="stylesheet" href="{{ '/assets/css/components/navigation.css' | relative_url }}">

<!-- Layout styles -->
<link rel="stylesheet" href="{{ '/assets/css/layout/panels.css' | relative_url }}">

<!-- Conditionally include page-specific styles -->
{% if page.permalink == '/en/' or page.permalink == '/ru/' or page.permalink == '/zh/' %}
  <link rel="stylesheet" href="{{ '/assets/css/pages/home.css' | relative_url }}">
{% endif %}

{% if page.permalink contains '/about/' %}
  <link rel="stylesheet" href="{{ '/assets/css/pages/about.css' | relative_url }}">
{% endif %}
```

## Commenting Standard

Use clear, informative comments in each file:

```css
/* ==========================================================================
   Button Components
   ========================================================================== */

/**
 * Primary Button
 *
 * Used for main calls to action. Uses the primary teal color.
 * Hover state uses a lighter shade for feedback.
 */
.btn-primary {
  background-color: var(--primary-400);
  color: white;
  /* Rest of the styles */
}
```

## Variables

Keep all your CSS custom properties (variables) in main.css:

```css
:root {
  /* Colors */
  --primary-400: #38B2AC;
  --primary-500: #319795;
  
  /* Spacing */
  --spacing-1: 0.25rem;
  --spacing-2: 0.5rem;
  --spacing-4: 1rem;
  
  /* Other common variables */
}
```

## Responsive Approach

Follow a mobile-first approach:

```css
/* Base styles for all devices */
.component {
  width: 100%;
}

/* Tablet and up */
@media (min-width: 768px) {
  .component {
    width: 50%;
  }
}

/* Desktop */
@media (min-width: 1024px) {
  .component {
    width: 33.33%;
  }
}
```

## Implementation Strategy

1. Create the directory structure first
2. Extract one component at a time (header, buttons, panels, etc.)
3. Test thoroughly after each extraction
4. Update the HTML includes as you create new files

## Best Practices for Maintainability

1. **Keep selectors simple** - Avoid deep nesting and overly specific selectors
2. **Use consistent naming** - Stick to a naming convention (kebab-case recommended)
3. **Group related styles** - Keep related styles together in the same section
4. **Document design decisions** - Comment on why certain approaches were chosen
5. **Minimize duplication** - Use variables and common classes to reduce repetition

## Tips for Future Collaboration

1. **Maintain a live style guide** - Document your components for new team members
2. **Use meaningful commit messages** - Explain what CSS changes were made and why
3. **Consider CSS formatting tools** - Tools like Prettier can ensure consistent formatting
4. **Review CSS changes carefully** - Check for unintended side effects when merging
5. **Keep performance in mind** - Monitor file size and selector complexity

This guide is meant to evolve with your project. As your team and site grow, you can refine this approach while maintaining its core principles.
