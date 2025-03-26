## Hero Panel System Implementation Guide

After reviewing your CSS files, I've created a reorganized approach that maintains your modular structure while eliminating duplication. Here's how to implement these changes:

### 1. File Organization

Place the CSS files in the following locations to maintain your modular structure:

```
assets/
└── css/
    ├── components/
    │   └── hero-panels.css   <- The enhanced hero panel system
    └── layout/
        └── panels.css        <- The updated base panel system (without hero styles)
```

### 2. Implementation Steps

1. **Replace panels.css**:
   - Replace the content of `assets/css/layout/panels.css` with the updated version that removes hero panel specific styles

2. **Add hero-panels.css**:
   - Create `assets/css/components/hero-panels.css` with the enhanced hero panel system
   - This file contains all hero-specific styles consolidated from panels.css and your new hero panel system

3. **Update CSS imports**:
   - Ensure both files are imported in your `_layouts/default.html`:

```html
<!-- In your default.html head section -->
<link rel="stylesheet" href="{{ '/assets/css/layout/panels.css' | relative_url }}">
<link rel="stylesheet" href="{{ '/assets/css/components/hero-panels.css' | relative_url }}">
```

### 3. Key Benefits of This Approach

- **Clear separation of concerns**:
  - `panels.css` handles the base panel system
  - `hero-panels.css` provides specialized hero panel styling

- **Eliminated duplication**:
  - Removed overlapping hero styles from panels.css
  - Consolidated all hero styling in one place

- **Enhanced modularity**:
  - Maintained your component-based structure
  - Each file has a single, clear purpose

- **Future scalability**:
  - Easy to add new hero panel variants
  - Clear structure for implementing new design patterns

### 4. Using the Hero Panel System

The example code shows how to use the hero panel system with different variants:

- Use different color variants: `hero-panel--primary`, `hero-panel--secondary`, etc.
- Use different size variants: `hero-panel--large`, `hero-panel--small`
- Use different layout variants: `hero-panel--centered`, `hero-panel--left`, etc.
- Use different effect variants: `hero-panel--pattern`, `hero-panel--gradient`
- Use impact statement variants: `hero-panel--display`, `hero-panel--display-contrast`

These can be mixed and matched to create a variety of hero panels while maintaining visual consistency.

### 5. Browser Testing

After implementation, be sure to test in various browsers and at different viewport sizes to ensure the responsive behavior works as expected.

### 6. Documentation

Consider adding comments to your Jekyll templates where you're using these panels to help future developers understand your class naming approach.