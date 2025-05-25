# UI Components Styling Guide

## Overview

The UI components folder (`/assets/css/components/ui/`) contains styling for all user interface components that match the includes structure in `/_includes/components/ui/`. This follows the "logic light" approach where CSS structure mirrors the includes organization.

---

## 📁 Component Structure

```
/_includes/components/ui/     ←→     /assets/css/components/ui/
├── alerts.html              ←→     ├── alerts.scss
├── breadcrumbs.html         ←→     ├── breadcrumbs.scss  
├── loading-spinner.html     ←→     ├── loading-spinner.scss
├── modal.html               ←→     ├── modal.scss
├── tooltip.html             ←→     ├── tooltip.scss
└── [future components]      ←→     └── _index.scss (imports all)
```

---

## 🧩 Available Components

### 1. **Breadcrumbs** (`breadcrumbs.scss`)

**Usage in templates:**
```liquid
{% include components/ui/breadcrumbs.html %}
{% include components/ui/breadcrumbs.html separator="/" %}
{% include components/ui/breadcrumbs.html show_home=false %}
```

**CSS Classes:**
- `.breadcrumbs` - Main container
- `.breadcrumbs__list` - Flex list container
- `.breadcrumbs__item` - Individual breadcrumb item
- `.breadcrumbs__link` - Clickable breadcrumb links
- `.breadcrumbs__separator` - Separator between items
- `.breadcrumbs__current` - Current page indicator

**Variants:**
- `.breadcrumbs--light` - Light theme variant
- `.breadcrumbs--dark` - Dark theme variant

### 2. **Alerts** (`alerts.scss`)

**Usage in templates:**
```liquid
{% include components/ui/alerts.html type="info" message="Information message" %}
{% include components/ui/alerts.html type="success" title="Success!" message="Operation completed" %}
```

**CSS Classes:**
- `.alert` - Base alert container
- `.alert__icon` - Alert icon
- `.alert__content` - Alert content wrapper
- `.alert__title` - Alert title
- `.alert__message` - Alert message text
- `.alert__actions` - Action buttons container
- `.alert__close` - Close button

**Variants:**
- `.alert--info` - Information alerts (blue)
- `.alert--success` - Success alerts (green)
- `.alert--warning` - Warning alerts (yellow)
- `.alert--error` - Error alerts (red)
- `.alert--solid` - Solid color variants
- `.alert--minimal` - Minimal styling

### 3. **Loading Spinner** (`loading-spinner.scss`)

**Usage in templates:**
```liquid
{% include components/ui/loading-spinner.html %}
{% include components/ui/loading-spinner.html size="large" text="Loading..." %}
```

**CSS Classes:**
- `.loading-spinner` - Main container
- `.loading-spinner__spinner` - Spinning element
- `.loading-spinner__text` - Loading text

**Variants:**
- `.loading-spinner--small` - Small spinner
- `.loading-spinner--large` - Large spinner
- `.loading-spinner--extra-large` - Extra large spinner
- `.loading-spinner--secondary` - Secondary color
- `.loading-spinner--accent` - Accent color
- `.loading-spinner--overlay` - Full-screen overlay
- `.loading-spinner--inline` - Inline with text
- `.loading-spinner--dots` - Dots animation style

### 4. **Modal** (`modal.scss`)

**Usage in templates:**
```liquid
{% include components/ui/modal.html id="example-modal" title="Modal Title" %}
```

**CSS Classes:**
- `.modal` - Main modal container
- `.modal--open` - Open state modifier
- `.modal__backdrop` - Background overlay
- `.modal__content` - Modal content box
- `.modal__header` - Modal header
- `.modal__title` - Modal title
- `.modal__close` - Close button
- `.modal__body` - Modal body content
- `.modal__footer` - Modal footer

**Variants:**
- `.modal--small` - Small modal (24rem)
- `.modal--medium` - Medium modal (32rem)
- `.modal--large` - Large modal (48rem)
- `.modal--extra-large` - Extra large modal (64rem)
- `.modal--full-screen` - Full screen modal

### 5. **Tooltip** (`tooltip.scss`)

**Usage in templates:**
```liquid
{% include components/ui/tooltip.html text="Tooltip content" position="top" %}
```

**CSS Classes:**
- `.tooltip` - Main tooltip container
- `.tooltip__trigger` - Element that triggers tooltip
- `.tooltip__content` - Tooltip content box

**Variants:**
- `.tooltip--top` - Tooltip above trigger
- `.tooltip--bottom` - Tooltip below trigger
- `.tooltip--left` - Tooltip to the left
- `.tooltip--right` - Tooltip to the right
- `.tooltip--light` - Light color scheme
- `.tooltip--primary` - Primary brand colors
- `.tooltip--small` - Small tooltip
- `.tooltip--large` - Large tooltip

---

## 🎨 Design System Integration

### **Design Tokens Used:**
- **Spacing**: `var(--space-1)` through `var(--space-8)`
- **Colors**: `var(--brand-primary)`, `var(--neutral-*)`, semantic colors
- **Typography**: `var(--text-xs)` through `var(--text-xl)`, `var(--font-*)`
- **Borders**: `var(--radius-sm)`, `var(--radius-md)`, `var(--radius-lg)`

### **Color Variants:**
- **Info**: Sky blue (`var(--sky-*)`)
- **Success**: Emerald green (`var(--emerald-*)`)
- **Warning**: Amber yellow (`var(--amber-*)`)
- **Error**: Red (`var(--red-*)`)

---

## 📱 Responsive Design

All UI components are **mobile-first** and include:

- **Breakpoints**:
  - Mobile: `max-width: 480px`
  - Tablet: `min-width: 768px`
  - Desktop: `min-width: 992px`

- **Touch-Friendly**: Minimum 44px touch targets
- **Reduced Motion**: Respects `prefers-reduced-motion: reduce`
- **High Contrast**: Supports `prefers-contrast: high`

---

## ♿ Accessibility Features

### **Built-in Accessibility:**
- **Focus Management**: Visible focus indicators
- **ARIA Support**: Proper ARIA attributes in HTML components
- **Keyboard Navigation**: Full keyboard support
- **Screen Reader**: Semantic markup and labels
- **Color Contrast**: WCAG AA compliant color combinations

### **Motion Preferences:**
- Respects `prefers-reduced-motion` for animations
- Fallback states for users who prefer static interfaces

---

## 🔧 Adding New UI Components

### **1. Create the Include File:**
```liquid
<!-- _includes/components/ui/new-component.html -->
<div class="new-component {{ include.class_name }}">
  <!-- Component HTML -->
</div>
```

### **2. Create the SCSS File:**
```scss
/* assets/css/components/ui/new-component.scss */
.new-component {
  /* Base styles */
  
  &__element {
    /* Element styles */
  }
  
  &--variant {
    /* Variant styles */
  }
}
```

### **3. Add to Index:**
```scss
/* assets/css/components/ui/_index.scss */
@import 'new-component';
```

---

## 🏗️ Implementation Examples

### **Basic Breadcrumbs:**
```liquid
<!-- Auto-generated breadcrumbs -->
{% include components/ui/breadcrumbs.html %}

<!-- Custom breadcrumbs -->
{% assign custom_items = "Home,/|Brands,/brands|TeaTime" | split: "|" %}
{% include components/ui/breadcrumbs.html items=custom_items %}
```

### **Alert with Actions:**
```liquid
{% include components/ui/alerts.html 
   type="warning" 
   title="Update Available" 
   message="A new version is available." 
   show_actions=true %}
```

### **Loading States:**
```liquid
<!-- Page loading -->
{% include components/ui/loading-spinner.html 
   size="large" 
   text="Loading brands..." 
   overlay=true %}

<!-- Button loading -->
{% include components/ui/loading-spinner.html 
   size="small" 
   inline=true %}
```

### **Modal Dialog:**
```liquid
{% include components/ui/modal.html 
   id="brand-details" 
   title="Brand Details" 
   size="large" %}
```

---

## 🚀 Best Practices

### **1. Consistent Usage:**
- Always use the provided CSS classes
- Don't override component styles directly
- Use design tokens for customization

### **2. Performance:**
- Components are optimized for fast rendering
- CSS is organized for minimal bundle size
- Uses efficient animations

### **3. Maintenance:**
- Each component has its own SCSS file
- Clear naming conventions (BEM methodology)
- Comprehensive documentation in comments

### **4. Testing:**
- Test across all supported browsers
- Verify accessibility with screen readers
- Check responsive behavior on all devices

---

## 📋 Component Checklist

When creating new UI components:

- [ ] Create matching HTML include and SCSS file
- [ ] Follow BEM naming convention
- [ ] Include responsive breakpoints
- [ ] Add accessibility features
- [ ] Support design tokens
- [ ] Include variant classes
- [ ] Test on mobile devices
- [ ] Document usage examples
- [ ] Add to `_index.scss`
- [ ] Update this guide

---

*Last Updated: 2025-05-25*
*Component Count: 5 UI components*