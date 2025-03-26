# 2025-03-14 About Page Styling Improvements

## 1. Problem Statement

After reorganizing our CSS architecture, we encountered several styling issues on the About page that needed attention:

1. **Text Legibility**: The orange text on teal background in the "Contact Us" section had poor contrast, making it difficult to read.
2. **Form Centering**: The Tally contact form was not properly centered, with uneven margins on left and right sides.
3. **Responsive Behavior**: The form container lost its styling and proper centering on small screens.
4. **Container Styling**: We lost the attractive rounded-corner white container around the form after certain CSS changes.
5. **CSS Organization**: We needed to ensure our fixes integrated well with the new component-based CSS architecture.

These issues affected both user experience and brand presentation, particularly for mobile users who represent a significant portion of our audience.

## 2. Approach

We adopted a multi-step approach to systematically resolve each issue:

1. **Text Color Adjustment**: Applied a specific brand color from our palette (`var(--secondary-300)`) to enhance text legibility while maintaining design consistency.
2. **CSS Targeting Strategy**: Used increasingly aggressive CSS selectors to override problematic styles, particularly for the form centering.
3. **Responsive Design Refinement**: Added targeted media queries with specific width percentages for different viewport sizes.
4. **Container Styling Restoration**: Re-implemented the rounded white container with proper shadow and border radius.
5. **Implementation Testing**: Tested solutions across multiple screen sizes and in different language versions (English, Russian, Chinese).

After trying several approaches, we determined that a more aggressive CSS solution with multiple `!important` declarations was necessary to overcome the embedded Tally form styles.

## 3. Implementation Details

### 3.1 Text Color Adjustment

We added an inline style to the lead text paragraph in the contact section, using our secondary-300 color for better contrast:

```html
<p class="lead-text" style="color: var(--secondary-300);">
  Whether you're seeking new brand opportunities or looking to gain international visibility for your BRICS+ brand, we'd love to hear from you.
</p>
```

### 3.2 Form Styling and Centering

After multiple iterations, we implemented this aggressive CSS solution that successfully addressed all issues:

```css
/* --------------------------------------------------------------------------
   TALLY FORM MOBILE FIX - AGGRESSIVE SOLUTION (REFINED)
   -------------------------------------------------------------------------- */

/* Base styling for the contact form container */
.contact-form-container {
  width: 92%;
  max-width: 800px;
  margin: 0 auto !important;
  background-color: var(--neutral-50);
  border-radius: 1rem;
  padding: 1.5rem;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  position: relative;
  left: 0 !important;
  right: 0 !important;
}

/* Ensure the panel content respects our centering */
.cta-panel .panel-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
}

/* Style the iframe itself */
.contact-form-container iframe {
  border: none;
  background-color: white;
  width: 100% !important;
  max-width: 100% !important;
  margin: 0 auto !important;
  display: block !important;
}

/* Force parent element to have full width */
.cta-panel {
  overflow: visible !important;
}

/* Override all Tally-generated specificity issues */
@media (max-width: 767px) {
  /* Force the contact form container to be narrower than its parent */
  .contact-form-container {
    width: 92% !important;
    margin: 0 auto !important;
    box-sizing: border-box !important;
    left: 0 !important;
    position: relative !important;
    transform: none !important;
  }
  
  /* Ensure panel padding doesn't interfere */
  .cta-panel .panel-content {
    padding: 2rem 0 !important;
    width: 100% !important;
    max-width: 100% !important;
    box-sizing: border-box !important;
  }
  
  /* Target the iframe directly with a fixed width and forced margins */
  .contact-form-container iframe {
    width: 100% !important;
    max-width: 100% !important;
    left: 0 !important;
    right: 0 !important;
    position: relative !important;
  }
}

/* Even more specific tweaks for very small screens */
@media (max-width: 480px) {
  .contact-form-container {
    width: 85% !important; /* Even narrower on smallest screens */
    padding: 1rem !important;
  }

  /* Double-force all parent elements to center */
  body .cta-panel .panel-content {
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: center !important;
    width: 100% !important;
  }
}

/* For extremely small screens */
@media (max-width: 360px) {
  .contact-form-container {
    width: 82% !important;
    padding: 0.75rem !important;
  }
}
```

### 3.3 CSS File Placement

We added this code to our `forms.css` file in the components directory, aligning with our component-based CSS architecture:

```
assets/css/components/forms.css
```

### 3.4 HTML Form Reference

We confirmed that the about.md file had a proper form implementation:

```html
<!-- Contact Form Container -->
<div class="contact-form-container">
  <iframe data-tally-src="https://tally.so/embed/3qvVaY?alignLeft=1&hideTitle=0&transparentBackground=0&dynamicHeight=1" loading="lazy" width="100%" height="400" frameborder="0" marginheight="0" marginwidth="0" title="Contact Form"></iframe>
  
  <script>var d=document,w="https://tally.so/widgets/embed.js",v=function(){"undefined"!=typeof Tally?Tally.loadEmbeds():d.querySelectorAll("iframe[data-tally-src]:not([src])").forEach((function(e){e.src=e.dataset.tallySrc}))};if("undefined"!=typeof Tally)v();else if(d.querySelector('script[src="'+w+'"]')==null){var s=d.createElement("script");s.src=w,s.onload=v,s.onerror=v,d.body.appendChild(s);}</script>
</div>
```

### 3.5 Removing Unnecessary References

We removed a problematic reference to an external stylesheet in about.md:

```html
<!-- Remove this line -->
<link rel="stylesheet" href="{{ '/assets/css/tally-styles.css' | relative_url }}">
```

## 4. Decisions Made

### 4.1 CSS Approach

**Decision**: Use an aggressive CSS approach with `!important` declarations and high-specificity selectors.

**Rationale**: The Tally form iframe includes its own embedded styles that were extremely difficult to override with normal CSS techniques. After trying several more traditional approaches without success, we determined that the aggressive approach was necessary to achieve consistent styling across all screen sizes.

### 4.2 Color Selection

**Decision**: Use `var(--secondary-300)` for the lead text in the contact section.

**Rationale**: This color (a vibrant orange from our secondary palette) provides sufficient contrast against the teal background while creating an energetic, warm feel that aligns with our brand personality and works well for the call-to-action section.

### 4.3 Responsive Strategy

**Decision**: Implement progressively narrower container widths at smaller screen sizes.

**Rationale**: This ensures that the form maintains visible margins on all sides, even on the smallest mobile screens. The graduated approach (92% → 85% → 82%) provides a balanced appearance across different device sizes.

### 4.4 CSS File Organization

**Decision**: Add the form styling to `components/forms.css` rather than `pages/about.css`.

**Rationale**: Since this styling is for a component (the Tally form) that might be used elsewhere in the site, it belongs in the components directory according to our CSS architecture. This supports reusability and maintainability.

### 4.5 Use of !important

**Decision**: Use `!important` flags despite their generally discouraged status in CSS best practices.

**Rationale**: When dealing with third-party embedded content like Tally forms, normal CSS specificity rules may be insufficient. The `!important` flags were necessary to override styles that would otherwise be inaccessible due to the iframe boundary and specificity issues.

## 5. Resources

### 5.1 Language Versions Tested

All fixes were verified across three language versions:
- English (`/en/about/`)
- Russian (`/ru/about/`)
- Chinese (`/zh/about/`)

### 5.2 Tally Form IDs

We identified the following Tally form IDs for each language:
- English: `3qvVaY`
- Russian: `wov08x`
- Chinese: `nG5oOk`

### 5.3 CSS Architecture Reference

Our fixes aligned with the component-based CSS architecture outlined in the CSS Organization Guide:

```
assets/css/
├── tokens/              # Design tokens 
│   ├── colors.css       # Color variables including RGB components
│   └── typography.css   # Typography definitions and rules
├── components/          # Reusable UI components
│   ├── buttons.css      # Button styles
│   ├── cards.css        # Card components 
│   ├── features.css     # Feature grid components
│   ├── forms.css        # Form elements and third-party forms
│   └── ...
└── ...
```

## 6. Insights & Learning

### 6.1 Third-Party Integration Challenges

When integrating third-party services like Tally forms, standard CSS approaches often fall short due to:
- Embedded styles within iframes
- Complex specificity issues with dynamically generated content
- Cross-domain restrictions that limit style inheritance

For such cases, a more aggressive CSS approach with explicit width constraints, forced centering, and higher specificity selectors is necessary.

### 6.2 Responsive Design Techniques

Several responsive design techniques proved effective:
- Using percentage-based widths (rather than fixed pixels) for better adaptability
- Implementing different percentage widths at different breakpoints
- Setting both left AND right values to 0 for proper centering
- Using flexbox centering on parent containers to control alignment

### 6.3 CSS Specificity Hierarchy

This project reinforced the importance of understanding CSS specificity:
1. Inline styles (highest)
2. ID selectors
3. Class selectors, attribute selectors, and pseudo-classes
4. Element selectors and pseudo-elements (lowest)

In our case, we needed to use multiple class selectors and !important flags to overcome specificity issues.

### 6.4 Tally Form Configuration

The Tally form iframe accepts several URL parameters that affect its appearance:
- `alignLeft=1`: Aligns form content to the left
- `hideTitle=0`: Shows the form title
- `transparentBackground=0`: Uses a solid background
- `dynamicHeight=1`: Adjusts height based on content

These parameters need to be maintained when updating form embeds.

## 7. Next Actions

### 7.1 Immediate Tasks

- [ ] Apply these form styling fixes to all pages that use Tally forms
- [ ] Test the form functionality to ensure proper submission after styling changes
- [ ] Check form appearance in additional browsers (Safari, Firefox, Edge)

### 7.2 Future Improvements

- [ ] Consider creating a reusable form component in Jekyll that includes all the necessary CSS
- [ ] Explore Tally Pro for enhanced customization options if budget allows
- [ ] Document the approach for styling third-party forms in the development wiki
- [ ] Implement form analytics to track conversion rates across language versions

### 7.3 Open Questions

- Can we further reduce the reliance on `!important` flags if we upgrade to Tally Pro?
- Should we consider alternatives to Tally if styling challenges persist?
- How do we ensure form styling remains consistent if we add more forms to the site?
- Should we create a test suite for visual regression testing of the form across breakpoints?

This journal entry documents our systematic approach to solving the About page styling issues, focusing particularly on the Tally form integration challenges. The solutions we implemented should be maintainable and compatible with our overall CSS architecture while providing a consistent user experience across all devices and languages.
