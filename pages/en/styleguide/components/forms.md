---
layout: styleguide
title: Forms
description: Brandmine's forms provide consistent, accessible user input components across our platform.
permalink: /en/styleguide/components/forms/
lang: en
---

## Forms Overview

Our forms system provides consistent styling for input elements, form layouts, and third-party form integrations. The system ensures forms are accessible, visually cohesive with our brand, and responsive across all devices.

## Native Form Elements

### Text Inputs

Standard text input fields for collecting various types of data:

<div class="example">
  <div class="example-preview">
    <form style="max-width: 400px;">
      <div style="margin-bottom: var(--space-4);">
        <label style="display: block; margin-bottom: var(--space-2); font-weight: 500; color: var(--neutral-700);">Email Address</label>
        <input type="email" style="width: 100%; padding: var(--space-2); border: 1px solid var(--neutral-300); border-radius: 0.25rem; font-family: var(--font-body); font-size: var(--text-base); color: var(--neutral-700); box-sizing: border-box;" placeholder="example@email.com">
      </div>
    </form>
  </div>
  
  <div class="example-code">
```html
<div class="form-container">
  <form>
    <div>
      <label for="email">Email Address</label>
      <input type="email" id="email" placeholder="example@email.com">
    </div>
    <!-- Additional form fields -->
    <button type="submit" class="btn-primary">Submit</button>
  </form>
</div>
```
  </div>
</div>

### Form Layout

Standard form layout with multiple input types:

<div class="example">
  <div class="example-preview">
    <form style="max-width: 400px;">
      <div style="margin-bottom: var(--space-4);">
        <label style="display: block; margin-bottom: var(--space-2); font-weight: 500; color: var(--neutral-700);">Full Name</label>
        <input type="text" style="width: 100%; padding: var(--space-2); border: 1px solid var(--neutral-300); border-radius: 0.25rem; font-family: var(--font-body); font-size: var(--text-base); color: var(--neutral-700); box-sizing: border-box;" placeholder="Your name">
      </div>
      
      <div style="margin-bottom: var(--space-4);">
        <label style="display: block; margin-bottom: var(--space-2); font-weight: 500; color: var(--neutral-700);">Email Address</label>
        <input type="email" style="width: 100%; padding: var(--space-2); border: 1px solid var(--neutral-300); border-radius: 0.25rem; font-family: var(--font-body); font-size: var(--text-base); color: var(--neutral-700); box-sizing: border-box;" placeholder="example@email.com">
      </div>
      
      <div style="margin-bottom: var(--space-4);">
        <label style="display: block; margin-bottom: var(--space-2); font-weight: 500; color: var(--neutral-700);">Subject</label>
        <select style="width: 100%; padding: var(--space-2); border: 1px solid var(--neutral-300); border-radius: 0.25rem; font-family: var(--font-body); font-size: var(--text-base); color: var(--neutral-700); box-sizing: border-box;">
          <option value="" disabled selected>Select a subject</option>
          <option value="general">General Inquiry</option>
          <option value="support">Support Request</option>
          <option value="partnership">Partnership Opportunity</option>
        </select>
      </div>
      
      <div style="margin-bottom: var(--space-4);">
        <label style="display: block; margin-bottom: var(--space-2); font-weight: 500; color: var(--neutral-700);">Message</label>
        <textarea style="width: 100%; padding: var(--space-2); border: 1px solid var(--neutral-300); border-radius: 0.25rem; font-family: var(--font-body); font-size: var(--text-base); color: var(--neutral-700); box-sizing: border-box; min-height: 100px;" placeholder="Your message"></textarea>
      </div>
      
      <button class="btn-primary" style="background-color: var(--primary-400); color: white; padding: var(--space-2) var(--space-4); border-radius: 0.25rem; text-decoration: none; border: none; cursor: pointer; font-weight: 600;">Submit</button>
    </form>
  </div>
  
  <div class="example-code">
```html
<div class="form-container">
  <form>
    <div>
      <label for="name">Full Name</label>
      <input type="text" id="name" placeholder="Your name">
    </div>
    
    <div>
      <label for="email">Email Address</label>
      <input type="email" id="email" placeholder="example@email.com">
    </div>
    
    <div>
      <label for="subject">Subject</label>
      <select id="subject">
        <option value="" disabled selected>Select a subject</option>
        <option value="general">General Inquiry</option>
        <option value="support">Support Request</option>
        <option value="partnership">Partnership Opportunity</option>
      </select>
    </div>
    
    <div>
      <label for="message">Message</label>
      <textarea id="message" placeholder="Your message"></textarea>
    </div>
    
    <button type="submit" class="btn-primary">Submit</button>
  </form>
</div>
```
  </div>
</div>

### Input Focus States

Form inputs include focus states for improved accessibility:

<div class="example">
  <div class="example-preview">
    <input type="text" style="width: 100%; padding: var(--space-2); border: 1px solid var(--primary-400); border-radius: 0.25rem; font-family: var(--font-body); font-size: var(--text-base); color: var(--neutral-700); box-sizing: border-box; box-shadow: 0 0 0 2px rgba(56, 178, 172, 0.2); outline: none;" placeholder="Input with focus state">
    <div style="margin-top: var(--space-2); font-size: 0.875rem; color: var(--neutral-500);">Example of input with focus state</div>
  </div>
  
  <div class="example-code">
```css
input:focus,
textarea:focus,
select:focus {
  border-color: var(--primary-400);
  outline: none;
  box-shadow: 0 0 0 2px rgba(var(--primary-400-rgb), 0.2);
}
```
  </div>
</div>

## Newsletter Form

Specialized styling for our newsletter signup forms, implemented with MailerLite:

<div class="example">
  <div class="example-preview">
    <div style="background-color: var(--primary-600); border-radius: 0.25rem; padding: var(--space-4); max-width: 400px;">
      <div style="display: flex; flex-direction: column; gap: var(--space-2);">
        <input type="email" style="background-color: white; border: 1px solid var(--primary-400); border-radius: 0.25rem; font-family: var(--font-body); font-size: var(--text-sm); padding: var(--space-2); color: var(--neutral-700); width: 100%; box-sizing: border-box;" placeholder="Your email address">
        <button style="background-color: var(--primary-400); border: 1px solid var(--primary-400); border-radius: 0.25rem; color: white; font-family: var(--font-body); font-size: var(--text-sm); font-weight: 600; padding: var(--space-2) var(--space-4); cursor: pointer; width: 100%;">Subscribe</button>
      </div>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="newsletter-container">
  <div class="ml-embedded">
    <div class="ml-form-embedWrapper">
      <!-- MailerLite form embed code would go here -->
      <!-- This is a simplified representation -->
      <div class="ml-form-embedBody">
        <div class="ml-form-fieldRow">
          <input type="email" placeholder="Your email address">
        </div>
        <div class="ml-form-horizontalRow">
          <button>Subscribe</button>
        </div>
      </div>
    </div>
  </div>
</div>
```
  </div>
</div>

## Contact Form Container

The container for our Tally contact form embeds:

<div class="example">
  <div class="example-preview">
    <div style="max-width: 600px; margin: 0 auto;">
      <div style="width: 100%; background-color: var(--neutral-50); border-radius: 1rem; padding: var(--space-6); box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1); box-sizing: border-box;">
        <div style="background-color: var(--neutral-200); height: 200px; display: flex; align-items: center; justify-content: center; border-radius: 0.5rem;">
          Tally Form Embed
        </div>
      </div>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="mobile-form-wrapper">
  <div class="contact-form-container">
    <iframe
      src="https://tally.so/embed/[YOUR-FORM-ID]"
      width="100%"
      height="500"
      frameborder="0"
      title="Contact Form"
    ></iframe>
  </div>
</div>
```
  </div>
</div>

## Responsive Behavior

Forms are fully responsive, adapting to different screen sizes:

### Desktop (992px+)
- Full width inputs with standard padding
- Side-by-side layout options available
- Embedded forms with larger padding

### Tablet (768px - 991px)
- Maintained layout with adjusted spacing
- Slightly compressed padding

### Mobile (<768px)
- Single-column layout for all forms
- Stacked input/button combinations for newsletter forms
- Optimized padding for touch targets
- Full-width embedded forms

## Implementation Guidelines

### Form Structure Best Practices

1. **Use semantic HTML**:
   - Group related inputs with `<fieldset>` and `<legend>`
   - Use appropriate input types (email, tel, etc.)
   - Include labels for all form controls

2. **Follow accessibility guidelines**:
   - Associate labels with inputs using the `for` attribute
   - Provide meaningful error messages
   - Use ARIA attributes when necessary

3. **Implement validation**:
   - Use HTML5 validation attributes (required, pattern, etc.)
   - Supplement with JavaScript validation when needed
   - Display clear error states

### Newsletter Form Implementation

```html
<div class="newsletter-container">
  <!-- MailerLite embed code goes here -->
</div>
```

### Contact Form Implementation

```html
<div class="mobile-form-wrapper">
  <div class="contact-form-container">
    <!-- Tally.so embed code goes here -->
  </div>
</div>
```

### Common Issues and Solutions

1. **Form spacing in panels**:
   - When placing forms in CTA panels, use the provided spacing classes
   - For newsletter forms in the footer, follow the standard structure

2. **Embedding third-party forms**:
   - Always use the provided container classes
   - Avoid inline styles that conflict with our system
   - Test on all device sizes

3. **Cross-browser compatibility**:
   - Test in multiple browsers
   - Use feature detection for advanced inputs
   - Provide fallbacks for older browsers