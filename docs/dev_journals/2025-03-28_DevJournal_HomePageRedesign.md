# Development Journal: Home Page Redesign
**Date:** 2025-03-28

## 1. Problem Statement
The Brandmine home page needed a comprehensive redesign to better showcase our brand discovery platform's core features in a visually appealing way that aligns with our existing design system. Specifically, we needed to:

- Create a clean, structured layout that puts emphasis on the search functionality
- Design a full-width hero section that matches our About page
- Implement the four discovery paths with proper tabs and styling
- Create dedicated full-width sections for discovery paths and insights
- Add featured brand display with consistent styling
- Ensure all elements use our brand colors and design tokens

## 2. Approach
We decided to implement a modular structure with several distinct sections:

1. **Full-width hero panel** at the top with our main value proposition
2. **Split-panel section** with search tools on the left and featured brand on the right
3. **Full-width discovery section** with tabs for our four discovery paths (Business Sectors, Brand Attributes, Markets, and Growth Signals)
4. **Full-width insights section** displaying our four content categories in a 2×2 grid

The approach focused on reusing existing design patterns from our site (particularly from the About page) to maintain design consistency, while introducing new components specifically for the home page.

## 3. Implementation Details

### Hero Panel
We used our existing hero panel structure that's already implemented on the About page:

```html
<div class="full-width-panel hero-panel">
  <div class="panel-content centered">
    <h1>Discover BRICS+ Consumer Brands</h1>
    <p class="hero-subtitle">The business intelligence hub breaking through language, political, and cultural barriers</p>
  </div>
</div>
```

### Search & Featured Brand Section
We created a split layout with search functionality on the left and featured brand on the right:

```html
<div class="container">
  <div class="top-section">
    <!-- Left side: Search tools -->
    <div class="search-panel">
      <h2>Find Brands</h2>
      
      <div class="search-box">
        <input type="text" id="brand-search" placeholder="Search brands, sectors, or attributes...">
        <button type="button" class="search-button">Search</button>
      </div>
      
      <div class="filter-controls">
        <p class="filter-heading">Filter by:</p>
        
        <!-- Filter groups for Business Sectors, Brand Attributes, Markets, Growth Signals -->
        <!-- Each with proper label and select element -->
        
        <button type="button" class="find-button">Find Brands</button>
      </div>
    </div>
    
    <!-- Right side: Featured brand panel -->
    <div class="featured-brand-panel problem-panel">
      <h2>Featured Brand</h2>
      
      <div class="brand-card">
        <!-- Brand card content -->
      </div>
    </div>
  </div>
</div>
```

### Discovery Path Section
We implemented a full-width solution-panel with tabs for the four discovery paths:

```html
<div class="full-width-panel solution-panel">
  <div class="panel-content">
    <h2>Explore by Discovery Path</h2>
    
    <div class="discovery-tabs">
      <div class="tab-nav">
        <button class="tab-button active" data-tab="sectors">Business Sectors</button>
        <button class="tab-button" data-tab="attributes">Brand Attributes</button>
        <button class="tab-button" data-tab="markets">Markets</button>
        <button class="tab-button" data-tab="signals">Growth Signals</button>
      </div>
      
      <!-- Tab content for each tab -->
    </div>
  </div>
</div>
```

### Insights Section
We created a full-width perspective-panel with a 2×2 grid for the four insight categories:

```html
<div class="full-width-panel perspective-panel">
  <div class="panel-content">
    <h2>Insights</h2>
    
    <div class="insights-grid">
      <!-- Four insight category panels -->
    </div>
  </div>
</div>
```

### Key CSS Components
The most important CSS elements included:

```css
/* Top section layout */
.top-section {
  display: grid;
  grid-template-columns: 40% 60%;
  gap: var(--space-8);
  margin-bottom: var(--space-12);
  margin-top: var(--space-8);
}

/* Full-width panels */
.solution-panel, .perspective-panel {
  background-color: var(--primary-50); /* or accent-50 for perspective */
  position: relative;
  width: 100%;
  padding: var(--space-12) 0;
  margin: 0;
}

/* Pattern overlay */
.solution-panel::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url("data:image/svg+xml,..."); /* SVG pattern */
  opacity: 0.15;
  z-index: 0;
}

/* Insights grid */
.insights-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(2, auto);
  gap: var(--space-6);
}
```

## 4. Decisions Made

### Layout Structure
- **Decision**: Used a modular, vertically-stacked layout with alternating full-width colored sections
- **Rationale**: This creates visual separation between different functional areas of the site, improves scanability, and creates a rhythm as users scroll through the page

### Full-Width Colored Sections
- **Decision**: Used our existing solution-panel (green) and perspective-panel (indigo) styles from the About page
- **Rationale**: Maintains design consistency, leverages established visual language, and creates clear distinction between sections

### Featured Brand Panel
- **Decision**: Used the problem-panel style (orange textured background) for the featured brand
- **Rationale**: Creates visual emphasis and helps the featured brand stand out; reuses existing design pattern

### Tag Cloud vs. List
- **Decision**: Used tag cloud layout for sector/attribute/signal/market tags
- **Rationale**: Better represents the diverse options and allows for scanning categories quickly

### Tab System for Discovery Paths
- **Decision**: Simple tab system with colored indicator for active tab
- **Rationale**: Allows users to switch between discovery paths without page reloads, creating a more interactive experience

## 5. Resources

### Color References
The implementation uses our standard design tokens:
- Primary (teal family): sectors, buttons
- Secondary (orange family): attributes, featured brand
- Accent (indigo family): signals, insights section
- Quaternary (purple family): markets

### Component Categories
1. **Grid Layouts**: top-section, insights-grid
2. **Cards**: featured-brand-panel, insight-category-panel
3. **Interactive Elements**: tabs, buttons, inputs
4. **Full-Width Panels**: hero-panel, solution-panel, perspective-panel

## 6. Insights & Learning

1. **Design System Application**
   - Our existing design tokens and components are flexible enough to build complex layouts
   - The pattern overlays add subtle texture that creates visual interest without distraction

2. **Responsive Considerations**
   - The grid layouts adapt well to different screen sizes
   - We need to be careful with tab systems on mobile screens

3. **Interactive Elements**
   - Simple JavaScript for tab functionality works well and doesn't require complex libraries
   - The search and filtering tools create immediate value even for MVP users

4. **Full-Width Design**
   - Full-width colored sections create strong visual impact
   - Maintaining consistent padding and content width is crucial for readability

## 7. Next Actions

1. **Implement the HTML and CSS** in our Jekyll project
2. **Test responsive behavior** across various device sizes
3. **Add real content** for featured brand and insights
4. **Create dynamic tag generation** from our collections data
5. **Implement search functionality** to actually search through brand data
6. **Add analytics tracking** to monitor user interactions with different sections
7. **Consider implementing** filter state persistence using URL parameters

This home page redesign establishes a solid foundation for Brandmine's web presence, clearly communicating our value proposition while providing multiple entry points for users to discover brands in the way that makes most sense for them.