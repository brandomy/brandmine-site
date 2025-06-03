# CSS Specificity Guidelines

This document provides guidelines for managing CSS specificity in the Brandmine codebase without relying on `!important` declarations.

## Overview

Following the refactoring completed on 2025-06-03, the Brandmine CSS has been cleaned up to eliminate unnecessary `!important` usage. This guide documents the patterns and best practices for maintaining proper specificity.

## Acceptable Uses of !important

`!important` should only be used in these specific cases:

1. **Accessibility Features**
   ```scss
   @media (prefers-reduced-motion: reduce) {
     .element {
       transform: none !important;
     }
   }
   ```

2. **Third-Party Integration Overrides**
   ```scss
   .mailerlite-form-container {
     width: 100% !important; /* Override MailerLite inline styles */
   }
   ```

3. **JavaScript Inline Style Overrides**
   ```scss
   [style*="display: none"] {
     display: none !important; /* Ensure JS-hidden elements stay hidden */
   }
   ```

4. **Utility Classes** (sparingly)
   ```scss
   .u-hidden {
     display: none !important;
   }
   ```

## Specificity Solutions

### 1. Component Modifiers (BEM)

**Problem:** Different contexts need different styling
```scss
// ❌ Bad: Using !important to override
.recent-founders .founder-card {
  padding: 1rem !important;
}

// ✅ Good: Using BEM modifier
.founder-card--recent {
  padding: 1rem;
}
```

### 2. Increased Selector Specificity

**Problem:** Need to override base styles
```scss
// ❌ Bad: Force override with !important
.icon {
  background: none !important;
}

// ✅ Good: Use more specific selector
.dimension-card__icon.icon {
  background: none;
}
```

### 3. CSS Custom Properties

**Problem:** Need flexible value overrides
```scss
// ❌ Bad: Override with !important
.panel {
  padding: 0 !important;
}

// ✅ Good: Use CSS variables
.panel {
  padding: var(--panel-padding, 2rem);
}

.panel--contained {
  --panel-padding: 0;
}
```

### 4. :is() and :where() Pseudo-classes

**Problem:** Need to target multiple selectors with same specificity
```scss
// ❌ Bad: Repeating selectors
.panel--hero { padding: 0 !important; }
.panel--hero-subtle { padding: 0 !important; }

// ✅ Good: Using :is() for grouped specificity
:is(.panel--hero, .panel--hero-subtle) {
  padding: 0;
}
```

### 5. Cascade Layer (Future Enhancement)

When browser support improves:
```scss
@layer base {
  .component { /* base styles */ }
}

@layer overrides {
  .component { /* override styles */ }
}
```

## Component-Specific Patterns

### Panel System
- Use `panel--contained` modifier for non-full-width panels
- Use specific page classes for context-specific styling
- Panel content padding should be controlled via `.panel__content`

### Card Components
- Create card variants with modifiers (e.g., `founder-card--recent`)
- Pass variant parameter through includes
- Use compound selectors for icon overrides

### Form Components
- Legacy styles should be removed when confirmed unused
- Use semantic class names for form containers
- Responsive styles should use min-width media queries

## Testing Specificity Changes

1. **Visual Regression Testing**
   - Check all major page types
   - Test responsive breakpoints
   - Verify hover/focus states

2. **Browser DevTools**
   - Use "Computed" tab to verify applied styles
   - Check for overridden declarations
   - Ensure cascade order is correct

3. **Cross-Browser Testing**
   - Test in Chrome, Firefox, Safari
   - Verify mobile browsers
   - Check for vendor prefix needs

## Migration Strategy

When encountering new `!important` usage:

1. **Identify the conflict** - What styles are competing?
2. **Determine the intent** - What should take precedence?
3. **Choose a pattern** - Which solution fits best?
4. **Test thoroughly** - Ensure no visual regressions
5. **Document if needed** - Add comments for complex cases

## Code Review Checklist

- [ ] No new `!important` declarations (except approved cases)
- [ ] BEM modifiers used for variants
- [ ] Appropriate selector specificity
- [ ] CSS custom properties for flexible values
- [ ] Comments explain complex specificity needs
- [ ] Tested across breakpoints and browsers

## Maintenance

This guide should be updated when:
- New patterns for specificity management are discovered
- Browser support for CSS features changes
- Team agrees on new conventions
- Complex specificity issues are resolved

Remember: **Specificity wars are a code smell**. If you're fighting specificity, step back and consider the architecture.