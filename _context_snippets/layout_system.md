# Brandmine Layout System

## Key Layout Components

### Base Layout (`_layouts/default.html`)

The default layout includes:
- Head section with meta tags and CSS
- Header with navigation
- Main content area
- Footer with newsletter signup

### Page Structure

Most pages use a panel-based layout system:

```html
<div class="full-width-panel light-panel">
  <div class="panel-content">
    <!-- Section content -->
  </div>
</div>
```

Panels can have variants:
- `light-panel`: White background
- `gray-panel`: Light gray background
- `dark-panel`: Dark background with light text
- `colored-panel`: Brand color background

### Content Grids

Content is arranged using CSS Grid or Flexbox:

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: var(--space-6);
}
```

### Hero Sections

Hero sections use the hero-panels component:

```html
<div class="hero-panel">
  <div class="hero-content">
    <h1>{{ page.title }}</h1>
    <p class="hero-description">{{ page.description }}</p>
    <!-- Call to action buttons -->
  </div>
</div>
```

## Responsive Design

- Mobile-first approach
- Breakpoints defined in `tokens/breakpoints.css`
- Media queries reference token variables:
  ```css
  @media (min-width: var(--breakpoint-md)) {
    /* Medium screen styles */
  }
  ```
- Navigation collapses to mobile menu at smaller screen sizes