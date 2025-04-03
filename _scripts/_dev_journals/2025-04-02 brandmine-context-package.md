# Brandmine Context Package for Claude

## Essential Context Items

When discussing Brandmine development issues with Claude, provide these key pieces of information for more targeted assistance:

### 1. Technical Architecture

```
brandmine/
├── _layouts/         # Page templates (default.html, brand.html, etc.)
├── _includes/        # Reusable components (header.html, footer.html, etc.)
├── _brands/          # Brand collection (organized by language)
├── _insights/        # Insights collection (organized by language)
├── _tags/            # Taxonomy collection (organized by language)
├── _data/            # Translation files and tag definitions
├── assets/
│   ├── css/          # Organized by tokens, layout, components, pages
│   ├── js/           # Filtering, search, and UI functionality
│   ├── fonts/        # Multilingual typography support
│   └── images/       # Site and brand images
└── pages/            # Content pages (organized by language)
```

### 2. Design System Information

Share your design tokens file (or relevant excerpts) that defines:
- Color variables
- Typography settings
- Spacing scale
- Breakpoint definitions
- Border radius values
- Shadow styles

### 3. Problematic Components

For each component causing responsive issues:
- Share the component HTML and associated CSS
- Describe the expected behavior at each breakpoint
- Explain what's currently breaking
- Include screenshots if possible

### 4. Browser/Device Testing Results

Specify which browsers and devices are exhibiting problems:
- Mobile Safari on iOS
- Chrome on Android
- Desktop browsers with issues
- Specific screen size ranges where problems occur

### 5. Working Examples

Share components that are already responsive:
- HTML/CSS for components working correctly
- Any patterns or techniques used successfully

### 6. Development Constraints

Outline project constraints that might impact solutions:
- Launch timeline requirements
- Browser/device support requirements
- Performance targets
- Maintainability considerations

### 7. Specific Questions

Frame specific questions about:
- CSS architecture approaches
- BEM implementation issues
- Jekyll templating solutions
- JavaScript functionality
- Cross-browser compatibility challenges

## Example Context Snippet

```
I'm having trouble with our Featured Brand panel on mobile devices. Here's the current implementation:

HTML:
```html
<div class="featured-brand-panel panel panel--primary">
  <h2 class="panel__heading-secondary">Featured Brand</h2>
  
  <div class="brand-card">
    <div class="brand-logo">
      <img src="{{ site.baseurl }}/assets/images/brands/teatime/teatime-logo-400w.jpg" alt="TeaTime Logo">
    </div>
    <div class="brand-info">
      <h3>TeaTime</h3>
      <p class="brand-description">Premium tea blending house with authentic Russian samovar traditions and innovative flavors.</p>
      <div class="brand-meta">
        <a href="{{ site.baseurl }}/sectors/gourmet-foods/" class="sector-tag">Gourmet Foods</a>
        <a href="{{ site.baseurl }}/markets/russia/" class="market-tag">Russia</a>
      </div>
      <div class="brand-tags">
        <a href="{{ site.baseurl }}/attributes/heritage-brand/" class="attribute-tag">Heritage Brand</a>
        <a href="{{ site.baseurl }}/signals/export-ready/" class="signal-tag">Export Ready</a>
      </div>
      <a href="{{ site.baseurl }}/brands/teatime/" class="view-profile">View Profile</a>
    </div>
  </div>
</div>
```

CSS:
```css
/* Current CSS that's causing problems */
.featured-brand-panel {
  padding: var(--space-6);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-sm);
}

.brand-card {
  display: flex;
  gap: var(--space-6);
  position: relative;
  z-index: 1;
}

/* Current breakpoint issue: on mobile screens below 768px, the flexbox layout doesn't
   collapse properly, causing overflow and alignment issues */
```

The component looks fine on desktop but breaks on mobile (iPhone SE and similar). 
Our breakpoint variables are:
--breakpoint-xs: 480px;
--breakpoint-sm: 640px;
--breakpoint-md: 768px;
--breakpoint-lg: 1024px;
--breakpoint-xl: 1280px;
```

## Providing This Context

When starting a new session with Claude about Brandmine development, either:

1. Share this document for comprehensive context, or
2. Copy relevant sections specific to your current issue

This will enable Claude to provide more precise, actionable recommendations tailored to your existing codebase and constraints.
