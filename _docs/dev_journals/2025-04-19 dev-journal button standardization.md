# Development Journal: Button Styling Standardization
Date: 2025-04-19

## Problem Statement
We identified inconsistent button styling across the Brandmine site that needed to be addressed. Specifically, our multilingual pages (English, Russian, and Chinese) were using a mix of button class naming approaches: some used `btn-primary` style (with a single dash), while others used the proper BEM convention `btn--primary` (with double dashes). This inconsistency caused visual discrepancies and would make future maintenance more difficult. We also had button styles duplicated across multiple CSS files, which needed consolidation.

## Approach
1. Analyzed all button instances across the site to identify inconsistencies
2. Consolidated all button styles into a single buttons.css file using BEM methodology
3. Created a comprehensive button system with consistent naming
4. Updated button classes in all HTML/MD templates to match the new convention
5. Applied the updates across all three languages to ensure consistency

## Implementation Details

### CSS Consolidation
We consolidated all button styles into a single unified buttons.css file, organized as follows:

```css
/* Base button block */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  /* Other shared properties */
}

/* Modifiers for types */
.btn--primary { /* Primary button (teal) */ }
.btn--secondary { /* Secondary button (orange) */ }
.btn--outline-light { /* Outline light button (for dark backgrounds) */ }
.btn--standard { /* Standard neutral button */ }
.btn--primary-cta { /* Enhanced CTA button (teal) */ }
.btn--secondary-cta { /* Enhanced CTA button (orange) */ }

/* Modifiers for sizes */
.btn--sm { /* Small button */ }
.btn--lg { /* Large button */ }
.btn--block { /* Full-width button */ }

/* Button container */
.cta-buttons { /* Container for grouping buttons */ }
```

### HTML Updates
We standardized all button instances to follow the BEM convention:

**Previous code:**
```html
<a href="/link" class="btn-primary">Button Text</a>
```

**Updated code:**
```html
<a href="/link" class="btn btn--primary-cta">Button Text</a>
```

For enhanced CTA buttons, we also consistently wrapped them in the container:

```html
<div class="cta-buttons">
  <a href="/link" class="btn btn--secondary-cta">Button Text</a>
</div>
```

### Key Files Updated
1. English, Russian, and Chinese versions of `brands.md`
2. Multiple discovery pages:
   - `attributes.md`
   - `markets.md`
   - `signals.md`
   - `sectors.md`
   - `russian-sectors.md`
3. Other site pages with buttons:
   - `discover.md`
   - `insights.md`

## Decisions Made

1. **BEM Naming Convention**: We committed to using BEM (Block Element Modifier) naming convention for all styling, using `btn` as the block and double dashes for modifiers (e.g., `btn--primary`).

2. **Button Hierarchy**: We established a clear button hierarchy:
   - Primary CTA buttons (teal) for main actions
   - Secondary CTA buttons (orange) for important but secondary actions
   - Standard buttons for tertiary actions
   - Outline light buttons for actions on colored backgrounds

3. **Container Pattern**: We decided to wrap CTA buttons in a `cta-buttons` container to maintain consistent spacing and alignment, especially when multiple buttons appear together.

4. **Enhanced CTAs**: We created enhanced CTA styles with animations and larger sizing for high-priority actions, especially on landing pages and main sections.

5. **Single Source of Truth**: We removed duplicate button styles from individual page CSS files to maintain a single source of truth in buttons.css.

## Resources

1. **Button CSS**: Complete consolidated button styling in buttons.css
2. **Button Class Updates**: Specific changes needed across discovery pages
3. **Example Reference**: Home page implementation with proper button styling

## Insights & Learning

1. **Inconsistency Creep**: We realized how easy it is for inconsistencies to creep into a multilingual site, especially when adding new languages or pages.

2. **BEM Benefits**: The BEM naming convention provides clear structure and prevents class name collisions, making it easier to maintain consistency across a large site.

3. **CSS Organization**: Organizing CSS by component type rather than by page makes it much easier to maintain consistency and implement site-wide changes.

4. **Multilingual Considerations**: We need to be particularly vigilant with our multilingual pages to ensure they stay in sync with design system changes.

5. **Documentation Importance**: Having a clear reference for our button system will be crucial for maintaining consistency as we add more content and languages.

## Next Actions

1. Complete updates to all discovery pages (attributes, markets, signals, sectors, russian-sectors)
2. Create a button component documentation page in our style guide
3. Add automated checks to catch inconsistent button styling in future updates
4. Create a process for ensuring new pages and translations maintain the proper button convention
5. Review other UI components for similar inconsistencies (cards, panels, forms)
6. Clear any duplicate button styles from home.css and other page-specific stylesheets
7. Test all button styling on mobile devices to ensure responsive behavior works correctly

This standardization will improve the visual consistency of the site and make future maintenance much easier as we continue to add content and languages.
