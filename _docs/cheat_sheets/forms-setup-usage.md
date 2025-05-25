# Brandmine Forms Setup & Usage Cheat Sheet

## Overview
This guide covers how to set up and use the standardized form system in Brandmine, including validation, accessibility, and integration with external services.

---

## 🎯 Form Components Architecture

### Available Form Components
```
_includes/components/forms/
├── contact-form.html      # Complete contact form with validation
├── newsletter-form.html   # Email subscription form  
├── feedback-form.html     # User feedback collection
├── form.html             # Generic form wrapper
├── input-field.html      # Text/email/password inputs
├── textarea-field.html   # Multi-line text areas
├── select-field.html     # Dropdown selects
└── validation.html       # Form validation helpers
```

### Form Integration Points
```
_includes/pages/about/contact.html     # Contact page integration
_includes/pages/home/lead-capture.html # Newsletter signup
_includes/layout/footer.html           # Footer newsletter
```

---

## 🛠️ Basic Form Setup

### 1. Simple Contact Form
```liquid
{% include components/forms/contact-form.html %}
```

### 2. Custom Contact Form
```liquid
{% include components/forms/contact-form.html 
   form_type="brand-submission"
   show_company=true
   show_country=true
   action="/api/submit"
   success_message="Thank you! We'll be in touch soon." %}
```

### 3. Newsletter Form
```liquid
{% include components/forms/newsletter-form.html 
   placeholder="Enter your email"
   button_text="Subscribe"
   class_name="newsletter--homepage" %}
```

---

## 🎨 Form Field Components

### Input Field
```liquid
{% include components/forms/input-field.html 
   name="email"
   type="email"
   label="Email Address"
   placeholder="you@example.com"
   required=true
   autocomplete="email"
   help_text="We'll never share your email"
   class_name="form-field--large" %}
```

**Available Input Types**:
- `text` (default)
- `email`
- `password`
- `tel`
- `url` 
- `number`

**Available Parameters**:
- `name` (required)
- `type` (optional, default: "text")
- `label` (optional)
- `placeholder` (optional)
- `value` (optional)
- `required` (optional, default: false)
- `disabled` (optional, default: false)
- `readonly` (optional, default: false)
- `autocomplete` (optional)
- `pattern` (optional, regex validation)
- `min/max` (optional, for numbers)
- `minlength/maxlength` (optional)
- `help_text` (optional)
- `error_message` (optional)
- `class_name` (optional)

### Textarea Field
```liquid
{% include components/forms/textarea-field.html 
   name="message"
   label="Your Message"
   placeholder="Tell us more..."
   required=true
   rows=5
   maxlength=1000
   help_text="Maximum 1000 characters" %}
```

### Select Field
```liquid
{% assign country_options = "us:United States|ca:Canada|uk:United Kingdom" | split: "|" %}
{% include components/forms/select-field.html 
   name="country"
   label="Country"
   options=country_options
   placeholder="Select your country"
   required=true %}
```

---

## 🎯 Pre-configured Form Types

### 1. General Contact Form
```liquid
{% include components/forms/contact-form.html form_type="general" %}
```
**Fields**: First/Last Name, Email, Subject, Message

### 2. Brand Submission Form
```liquid
{% include components/forms/contact-form.html form_type="brand-submission" %}
```
**Additional Fields**: Company, Country, Sector, Website

### 3. Partnership Inquiry Form
```liquid
{% include components/forms/contact-form.html form_type="partnership" %}
```
**Custom Labels**: Partnership-focused language and fields

---

## 🔧 Form Configuration Options

### Contact Form Parameters
```liquid
{% include components/forms/contact-form.html 
   action="/contact"              # Form submission URL
   method="POST"                  # HTTP method
   form_type="general"            # Form variant
   show_company=true              # Show company field
   show_country=true              # Show country selector
   success_message="Custom success message"
   class_name="contact-form--homepage" %}
```

### Newsletter Form Parameters
```liquid
{% include components/forms/newsletter-form.html 
   action="/newsletter"           # Subscription endpoint
   placeholder="Your email address"
   button_text="Join Newsletter"
   success_message="Welcome to our newsletter!"
   error_message="Please enter a valid email"
   class_name="newsletter--sidebar" %}
```

---

## 🌐 Multi-language Support

### Translation Keys
Forms use translation keys from `_data/translations/{lang}.yml`:

```yaml
forms:
  contact_title: "Get in Touch"
  brand_submission_title: "Submit Your Brand"
  partnership_title: "Partnership Inquiry"
  privacy_notice: "We respect your privacy and will never share your information."
  
common:
  actions:
    submit: "Send Message"
    subscribe: "Subscribe"
```

### Language-Aware Forms
```liquid
{% assign current_lang = page.lang | default: 'en' %}
{% include components/forms/contact-form.html %}
<!-- Automatically uses translations for current language -->
```

---

## ✅ Form Validation

### Client-Side Validation
Forms include built-in JavaScript validation:

```javascript
// Automatic validation on form submission
document.addEventListener('DOMContentLoaded', function() {
  const form = document.querySelector('.contact-form');
  
  form.addEventListener('submit', function(e) {
    e.preventDefault();
    
    // Validate required fields
    const requiredFields = form.querySelectorAll('[required]');
    let isValid = true;
    
    requiredFields.forEach(field => {
      if (!field.value.trim()) {
        isValid = false;
        field.classList.add('form-field--error');
      }
    });
    
    if (isValid) {
      // Submit form or show success
    }
  });
});
```

### Custom Validation Rules
```liquid
{% include components/forms/input-field.html 
   name="phone"
   type="tel"
   pattern="^[\+]?[1-9][\d]{0,15}$"
   error_message="Please enter a valid phone number" %}
```

### Validation States
- **Normal**: Default state
- **Error**: `.form-field--error` class applied
- **Success**: `.form-field--success` class applied

---

## 🔌 External Service Integration

### Tally.so Integration (Current)
```liquid
<!-- In _includes/pages/about/contact.html -->
<iframe 
  data-tally-src="https://tally.so/embed/3qvVaY?alignLeft=1&hideTitle=0&transparentBackground=0&dynamicHeight=1" 
  loading="lazy" 
  width="100%" 
  height="400" 
  frameborder="0" 
  title="{% include helpers/t.html key='about.contact_form_title' fallback='Contact Form' %}">
</iframe>
```

### Custom API Integration
```javascript
// Custom form submission handler
function submitForm(formData) {
  fetch('/api/contact', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(formData)
  })
  .then(response => response.json())
  .then(data => {
    if (data.success) {
      showSuccessMessage();
    } else {
      showErrorMessage(data.message);
    }
  })
  .catch(error => {
    showErrorMessage('Sorry, there was an error. Please try again.');
  });
}
```

---

## 🎨 Form Styling & Themes

### CSS Classes
```scss
// Form containers
.contact-form { }
.newsletter-form { }
.feedback-form { }

// Form fields
.form-field { }
.form-field--error { }
.form-field--success { }
.form-field--large { }

// Form elements
.form-field__label { }
.form-field__input { }
.form-field__help-text { }
.form-field__error-message { }
```

### Custom Styling
```liquid
{% include components/forms/contact-form.html 
   class_name="contact-form--dark-theme" %}
```

```scss
.contact-form--dark-theme {
  background: var(--color-dark);
  
  .form-field__label {
    color: var(--color-light);
  }
  
  .form-field__input {
    background: var(--color-dark-lighter);
    border-color: var(--color-border-dark);
  }
}
```

---

## 🚀 Implementation Examples

### 1. Homepage Lead Capture
```liquid
<!-- _includes/pages/home/lead-capture.html -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <h2>Stay Updated on BRICS+ Opportunities</h2>
    <p>Subscribe to receive curated insights about emerging brands and market trends</p>
    
    {% include components/forms/newsletter-form.html 
       placeholder="Enter your email address"
       button_text="Subscribe Now"
       class_name="newsletter--homepage" %}
  </div>
</div>
```

### 2. Contact Page
```liquid
<!-- pages/en/contact.md -->
---
layout: default
title: Contact
sections:
  - contact
---

<!-- _includes/pages/about/contact.html -->
<div class="contact-section">
  <div class="contact-section__form">
    {% include components/forms/contact-form.html 
       form_type="general"
       success_message="Thank you for your message! We'll get back to you within 24 hours." %}
  </div>
</div>
```

### 3. Brand Submission Page
```liquid
<div class="brand-submission">
  <h1>Submit Your Brand</h1>
  <p>Tell us about your brand and we'll consider featuring it on Brandmine.</p>
  
  {% include components/forms/contact-form.html 
     form_type="brand-submission"
     show_company=true
     show_country=true %}
</div>
```

---

## 🐛 Troubleshooting

### Common Issues

**Form Not Submitting**:
- Check `action` parameter is set correctly
- Verify JavaScript is loading
- Check browser console for errors

**Validation Not Working**:
- Ensure `required` attributes are set
- Check field names match validation script
- Verify form classes are correct

**Styling Issues**:
- Check CSS classes are applied correctly
- Verify custom CSS doesn't conflict
- Test responsive behavior

**Translation Missing**:
- Check `_data/translations/{lang}.yml` has required keys
- Verify fallback text is provided
- Test all supported languages

### Testing Checklist
- [ ] Form displays correctly in all languages
- [ ] Required field validation works
- [ ] Success/error messages appear
- [ ] Mobile responsive design works
- [ ] Accessibility (screen readers, keyboard navigation)
- [ ] Integration with external service works
- [ ] Email notifications are sent (if applicable)

---

## 📱 Mobile & Accessibility

### Mobile Optimization
- All forms are responsive by default
- Touch-friendly input sizes
- Optimized keyboard types (`type="email"`, `type="tel"`)
- Proper viewport scaling

### Accessibility Features
- Semantic HTML structure
- ARIA labels and descriptions
- Keyboard navigation support
- Screen reader compatibility
- High contrast support
- Focus indicators

### Testing Commands
```bash
# Test mobile view locally
bundle exec jekyll serve --host=0.0.0.0
# Then visit http://YOUR_IP:4000 on mobile device

# Accessibility testing
# Use browser dev tools Lighthouse audit
# Test with screen reader software
```

---

*Last Updated: 2025-05-25*
*For questions: Review form component files or check browser dev tools for errors*