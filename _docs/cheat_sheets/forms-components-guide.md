# Forms Components Guide

This guide covers all form components in the Brandmine website, following the "logic light" principle where CSS structure mirrors the includes organization.

## 📁 Structure

```
_includes/components/forms/          CSS: assets/css/components/forms/
├── form.html                      ↔ form.scss
├── input-field.html               ↔ input-field.scss
├── textarea-field.html            ↔ textarea-field.scss
├── select-field.html              ↔ select-field.scss
├── contact-form.html              ↔ contact-form.scss
├── newsletter-form.html           ↔ newsletter-form.scss
├── feedback-form.html             ↔ feedback-form.scss
└── validation.html                ↔ validation.scss
```

## 🎯 Component Overview

### 1. Base Form (`form.scss`)
**Purpose**: Provides base form styles, containers, and general form layout.

**Key Classes**:
- `.form-container` - Standard form wrapper
- `.mobile-form-wrapper` - Responsive form container
- `.cta-panel` - Form integration with CTA panels

**Usage**:
```liquid
{% include components/forms/form.html 
   form_id="contact-form"
   form_class="form-container" %}
```

### 2. Input Field (`input-field.scss`)
**Purpose**: Styles for text, email, password, search, and tel input fields.

**Key Classes**:
- `.input-field--small` - Compact input variant
- `.input-field--large` - Large input variant
- `.input-field--error` - Error state styling
- `.input-field--success` - Success state styling

**Supported Input Types**:
```html
<input type="text">
<input type="email">
<input type="password">
<input type="search">
<input type="tel">
```

**Usage**:
```liquid
{% include components/forms/input-field.html 
   field_id="email"
   field_type="email"
   field_label="Email Address"
   field_required=true %}
```

### 3. Textarea Field (`textarea-field.scss`)
**Purpose**: Multi-line text input areas with proper sizing and variants.

**Key Classes**:
- `.textarea-field--small` - Compact textarea (80px min-height)
- `.textarea-field--large` - Large textarea (200px min-height)
- `.textarea-field--no-resize` - Disable resizing
- `.textarea-field--auto-resize` - Auto-expanding textarea

**Usage**:
```liquid
{% include components/forms/textarea-field.html 
   field_id="message"
   field_label="Your Message"
   field_rows="5"
   field_required=true %}
```

### 4. Select Field (`select-field.scss`)
**Purpose**: Dropdown selectors with custom styling and multiple select support.

**Key Features**:
- Custom dropdown arrow
- Multiple select support
- Consistent styling with other form elements
- Size variants (small, large)

**Usage**:
```liquid
{% include components/forms/select-field.html 
   field_id="country"
   field_label="Country"
   field_options=site.data.countries
   field_required=true %}
```

### 5. Contact Form (`contact-form.scss`)
**Purpose**: Tally embedded contact forms with proper iframe handling.

**Key Classes**:
- `.contact-form-container` - Main container for Tally forms
- `.contact-form--compact` - Smaller padding variant
- `.contact-form--full-width` - Full-width variant
- `.contact-form--floating` - Elevated card style
- `.contact-form-loading` - Loading state overlay
- `.contact-form-success` - Success feedback
- `.contact-form-error` - Error feedback

**Usage**:
```liquid
{% include components/forms/contact-form.html 
   form_url="https://tally.so/r/your-form-id"
   form_height="600"
   form_class="contact-form--floating" %}
```

### 6. Newsletter Form (`newsletter-form.scss`)
**Purpose**: MailerLite newsletter subscription forms with multiple layouts.

**Key Classes**:
- `.newsletter-form--inline` - Horizontal layout
- `.newsletter-form--minimal` - Clean, borderless style
- `.newsletter-form--compact` - Smaller size variant

**Integration**: Handles MailerLite embed code styling with custom overrides.

**Usage**:
```liquid
{% include components/forms/newsletter-form.html 
   form_variant="inline"
   form_title="Subscribe to Updates"
   form_description="Get the latest BRICS+ brand insights" %}
```

### 7. Feedback Form (`feedback-form.scss`)
**Purpose**: User feedback collection with rating system and form states.

**Key Features**:
- Star rating component
- Form validation integration
- Loading and success states
- Responsive design

**Key Classes**:
- `.feedback-form` - Main container
- `.feedback-form__rating` - Star rating system
- `.feedback-form__actions` - Button area
- `.feedback-form--loading` - Loading state
- `.feedback-form--success` - Success state

**Usage**:
```liquid
{% include components/forms/feedback-form.html 
   form_title="How was your experience?"
   show_rating=true
   submit_text="Send Feedback" %}
```

### 8. Validation (`validation.scss`)
**Purpose**: Form validation states, error messages, and real-time feedback.

**Key Classes**:
- `.form-field--error` - Error state for field groups
- `.form-field--success` - Success state for field groups
- `.form-field--warning` - Warning state for field groups
- `.form-message` - Validation message container
- `.validation-summary` - Error summary component
- `.form-field-indicator` - Icon indicators for validation states

**Validation States**:
```scss
// Field states
.form-field--error    // Red border, error messaging
.form-field--success  // Green border, success messaging
.form-field--warning  // Yellow border, warning messaging
.form-field--validating // Blue border, loading indicator
```

**Usage**:
```liquid
{% include components/forms/validation.html 
   field_id="email"
   validation_state="error"
   validation_message="Please enter a valid email address" %}
```

## 🎨 Design Tokens

Forms use these CSS custom properties:

```scss
/* Form-specific tokens */
--form-input-padding: var(--space-3);
--form-border-color: var(--neutral-300);
--form-focus-border-color: var(--primary-500);
--form-element-spacing: var(--space-4);
--form-max-width: 600px;
--form-wrapper-padding: var(--space-6);
--form-card-shadow: var(--shadow-sm);
--form-button-bg: var(--primary-600);
--form-button-hover-bg: var(--primary-700);
--focus-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
```

## 📱 Responsive Behavior

All form components are mobile-first and responsive:

- **Small devices (≤640px)**: Stack elements vertically, adjust padding
- **Medium devices (641px-767px)**: Optimize spacing and sizing
- **Large devices (≥768px)**: Full desktop layout with optimal spacing

## 🛠️ Integration Examples

### Basic Contact Form
```liquid
<section class="contact-section">
  <div class="form-container">
    {% include components/forms/contact-form.html 
       form_url="https://tally.so/r/contact"
       form_height="600"
       form_class="contact-form--floating" %}
  </div>
</section>
```

### Newsletter Signup
```liquid
<div class="newsletter-container">
  {% include components/forms/newsletter-form.html 
     form_variant="inline"
     form_title="Stay Updated"
     form_description="Get BRICS+ brand insights" %}
</div>
```

### Custom Form with Validation
```liquid
<form class="feedback-form">
  {% include components/forms/input-field.html 
     field_id="name"
     field_label="Your Name"
     field_required=true %}
  
  {% include components/forms/validation.html 
     field_id="name"
     validation_state="error"
     validation_message="Name is required" %}
  
  {% include components/forms/textarea-field.html 
     field_id="feedback"
     field_label="Your Feedback"
     field_rows="4" %}
</form>
```

## 🔧 Customization

### Adding New Form Variants
1. Create modifier classes in the appropriate component file
2. Follow BEM naming: `.component--variant`
3. Ensure responsive behavior
4. Update this guide with new variants

### Styling Third-Party Forms
- Tally forms: Use `.contact-form-container` wrapper
- MailerLite: Use `.ml-embedded` overrides
- Other embeds: Create specific wrapper classes

## ✅ Best Practices

1. **Always use form containers** for consistent spacing
2. **Include validation feedback** for better UX
3. **Test on mobile devices** to ensure responsive behavior
4. **Use semantic HTML** for accessibility
5. **Follow established naming conventions** when adding new styles
6. **Include loading states** for async form submissions
7. **Provide clear success/error feedback** to users

## 🔍 Troubleshooting

### Common Issues:
- **Forms not responsive**: Check container classes and viewport meta tag
- **Styling conflicts**: Ensure CSS specificity is appropriate
- **Validation not working**: Verify JavaScript and validation classes
- **Third-party embed issues**: Check wrapper classes and iframe settings

### Debug Steps:
1. Check browser developer tools for CSS conflicts
2. Verify form HTML structure matches expected patterns
3. Test form submission in different browsers
4. Validate responsive behavior at different breakpoints