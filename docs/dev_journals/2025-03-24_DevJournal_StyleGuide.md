# Development Journal: Style Guide Implementation
**Date**: March 24, 2025

## 1. Problem Statement

We needed to create a comprehensive style guide for the Brandmine design system with the following requirements:

1. A standalone navigation experience separate from the main site navigation
2. Proper display of component examples (especially Hero Panels)
3. Consistent layout with a sidebar and main content area
4. Responsive design for different device sizes
5. Fix an issue where the sidebar was overlapping the main content

## 2. Approach

We implemented a standalone style guide using a dual-track strategy:

1. **Standalone Layout**: Created a dedicated layout template (`styleguide-standalone.html`) that doesn't inherit from the default layout, allowing complete control over the style guide's structure.

2. **Component Documentation**: Developed detailed documentation pages for Colors and Hero Panels, with examples showing variants and usage.

3. **Layout System**: Evaluated different approaches (flex, table, grid) and selected CSS Grid as the most professional and maintainable option for the sidebar/content layout.

4. **Navigation System**: Implemented a sidebar navigation with collapsible sections for foundations, components, and patterns.

## 3. Implementation Details

### Standalone Layout Template

```html
<!-- _layouts/styleguide-standalone.html -->
<!DOCTYPE html>
<html lang="{% if page.lang %}{{ page.lang }}{% else %}en{% endif %}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ page.title }} | Brandmine Design System</title>
  
  <!-- Include CSS files -->
  <link rel="stylesheet" href="{{ '/assets/css/tokens/colors.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/tokens/typography.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/tokens/breakpoints.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/tokens/spacing.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/layout/panels.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components/hero-panels.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/styleguide.css' | relative_url }}">
  <!-- Other head content -->
</head>
<body class="styleguide-page">
  <!-- Page structure -->
</body>
</html>
```

### CSS Grid Layout Implementation

```css
/* Professional Grid Layout for Style Guide */
.styleguide-container {
  display: grid;
  grid-template-columns: 200px 1fr;
  grid-template-areas: "sidebar content";
  min-height: calc(100vh - 60px);
  margin-top: 60px;
}

.styleguide-nav {
  grid-area: sidebar;
  background-color: var(--neutral-800);
  color: white;
  padding: var(--space-6);
  overflow-y: auto;
  position: sticky;
  top: 60px;
  height: calc(100vh - 60px);
}

.styleguide-content {
  grid-area: content;
  padding: var(--space-8);
  background-color: white;
  min-width: 0; /* Prevents overflow issues */
}

/* Responsive adjustments */
@media (max-width: var(--breakpoint-lg)) {
  .styleguide-container {
    grid-template-columns: 1fr;
    grid-template-areas: "content";
  }
  
  .styleguide-nav {
    position: fixed;
    width: 100%;
    z-index: 100;
    transform: translateY(-100%);
    transition: transform 0.3s ease;
  }
  
  .styleguide-nav.is-open {
    transform: translateY(0);
  }
}
```

### Component Example Styling

```css
/* Component examples */
.example-wrapper {
  margin: var(--space-6) 0;
  border: 1px solid var(--neutral-200);
  border-radius: 0.5rem;
  overflow: hidden;
}

.example-panel {
  /* Constrain examples */
  width: 100% !important;
  margin-left: 0 !important;
  margin-right: 0 !important;
  left: 0 !important;
  right: 0 !important;
  min-height: 20vh !important;
}

.example-code {
  padding: var(--space-4);
  background-color: var(--neutral-100);
  border-top: 1px solid var(--neutral-200);
  overflow-x: auto;
}
```

## 4. Decisions Made

1. **CSS Grid over Other Approaches**: We chose CSS Grid for the layout instead of fixed positioning, table layout, or flexbox because:
   - It's the industry standard for modern design systems
   - Provides clearer separation of layout from content
   - Naturally handles responsive design
   - Prevents common layout issues like sidebar overlap

2. **Standalone Layout vs. Extending Default**: We created a completely standalone layout rather than extending the site's default layout to:
   - Avoid inheritance issues from the main site's styles
   - Have complete control over the style guide's presentation
   - Create a focused experience for design system documentation

3. **Component CSS Loading**: We decided to load component CSS files directly in the style guide layout instead of relying on the base layout to ensure proper example rendering.

4. **200px Sidebar Width**: We reduced the sidebar width from the original 250px to 200px to:
   - Provide more room for content
   - Match common industry conventions for documentation sidebars
   - Improve readability on smaller screens

5. **Available Documentation Section**: Added a highlighted section on the home page to show which parts of the documentation are currently available.

## 5. Resources

### Styleguide Directory Structure

```
/en/styleguide/
├── index.html                 # Main style guide page
├── foundations/               # Design Foundations
│   ├── colors.md              # Color system
│   ├── typography.md          # Typography system (planned)
│   ├── spacing.md             # Spacing system (planned)
│   └── layouts.md             # Layout patterns (planned)
├── components/                # UI Components
│   ├── hero-panels.md         # Hero panels documentation
│   ├── buttons.md             # Button styles (planned)
│   ├── cards.md               # Card components (planned)
│   └── forms.md               # Form elements (planned)
└── patterns/                  # Design Patterns (planned)
```

### Layout Comparison

| Approach | Pros | Cons | Recommendation |
|----------|------|------|----------------|
| Fixed/Absolute | Simple, common | Can have overflow issues | Avoid for complex layouts |
| Table Layout | Reliable, good compatibility | Outdated, less flexible | Not recommended |
| Flexbox | Modern, flexible | Complex for 2D layouts | Good for components |
| CSS Grid | Modern, purpose-built for layouts | Slightly more complex | **Recommended** |

## 6. Insights & Learning

1. **Layout System Evolution**: Modern web layout systems have evolved significantly, with CSS Grid now being the preferred approach for professional design systems. This represents a move away from older methods like table layouts and even flexbox for overall page structure.

2. **Component Example Styling**: Creating examples of components within documentation requires special handling to prevent the components' natural behaviors (like full-width panels) from breaking the documentation layout.

3. **Standalone vs. Integrated**: For design system documentation, creating a standalone experience separate from the main site provides better focus and clarity for users.

4. **Documentation Navigation**: Effective design system documentation requires a persistent navigation system that allows users to quickly move between related components and concepts.

5. **Responsive Considerations**: Design system documentation needs to be responsive itself, adapting to different screen sizes while still maintaining usability.

## 7. Next Actions

1. **Complete Foundation Pages**: Create documentation for Typography, Spacing, and Layouts.

2. **Add Component Documentation**: Develop pages for Buttons, Cards, and Forms.

3. **Improve Example Display**: Add a copy-to-clipboard feature for component code examples.

4. **Add Usage Guidelines**: Enhance component documentation with best practices and accessibility considerations.

5. **Create Interactive Examples**: Consider adding interactive component configuration options to let users explore variants.

6. **Standardize Navigation**: Ensure consistent hierarchy and naming across all documentation pages.

7. **Implement Version Tracking**: Add version information to track when components were last updated.
