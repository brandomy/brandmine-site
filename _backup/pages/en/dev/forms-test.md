---
layout: default
title: "Forms Components Test Page"
description: "Test page for all form components in the Brandmine system"
lang: en
permalink: /en/dev/forms-test/
ref: dev-forms-test
---

# Forms Components Test Page

This page tests all form components in the Brandmine system.

---

## 1. Contact Form - General

### Basic Contact Form
{% include components/forms/contact-form.html %}

---

## 2. Contact Form - Brand Submission

### Brand Submission Form
{% include components/forms/contact-form.html
   form_type="brand-submission"
   show_company=true
   show_country=true %}

---

## 3. Contact Form - Partnership

### Partnership Inquiry Form
{% include components/forms/contact-form.html
   form_type="partnership"
   success_message="Thank you for your partnership inquiry! We'll respond within 48 hours." %}

---

## 4. Newsletter Forms

### Basic Newsletter Form
{% include components/forms/newsletter-form.html %}

### Newsletter Form - Custom
{% include components/forms/newsletter-form.html
   placeholder="Enter your email for BRICS+ insights"
   button_text="Subscribe to Newsletter"
   class_name="newsletter--homepage" %}

---

## 5. Individual Form Components

### Input Fields

#### Text Input
{% include components/forms/input-field.html
   name="test-text"
   type="text"
   label="Text Input"
   placeholder="Enter some text"
   help_text="This is help text for the input" %}

#### Email Input
{% include components/forms/input-field.html
   name="test-email"
   type="email"
   label="Email Address"
   placeholder="you@example.com"
   required=true
   autocomplete="email" %}

#### URL Input
{% include components/forms/input-field.html
   name="test-url"
   type="url"
   label="Website URL"
   placeholder="https://example.com"
   help_text="Include https://" %}

#### Phone Input
{% include components/forms/input-field.html
   name="test-phone"
   type="tel"
   label="Phone Number"
   placeholder="+1 (555) 123-4567"
   pattern="^[\+]?[1-9][\d]{0,15}$" %}

#### Number Input
{% include components/forms/input-field.html
   name="test-number"
   type="number"
   label="Number Input"
   min=1
   max=100
   help_text="Enter a number between 1 and 100" %}

#### Password Input
{% include components/forms/input-field.html
   name="test-password"
   type="password"
   label="Password"
   minlength=8
   required=true
   help_text="Minimum 8 characters" %}

---

### Select Fields

#### Country Selector
{% assign country_options = "us:United States|ca:Canada|uk:United Kingdom|de:Germany|fr:France|jp:Japan|br:Brazil|ru:Russia|cn:China|in:India" | split: "|" %}
{% include components/forms/select-field.html
   name="test-country"
   label="Country"
   options=country_options
   placeholder="Select your country"
   required=true %}

#### Sector Selector
{% assign sector_options = "wine:Wine|natural-beauty:Natural Beauty|gourmet-foods:Gourmet Foods|artisanal-spirits:Artisanal Spirits|hotels-resorts:Hotels & Resorts|other:Other" | split: "|" %}
{% include components/forms/select-field.html
   name="test-sector"
   label="Business Sector"
   options=sector_options
   placeholder="Select your sector" %}

---

### Textarea Fields

#### Basic Textarea
{% include components/forms/textarea-field.html
   name="test-message"
   label="Message"
   placeholder="Tell us more..."
   rows=4 %}

#### Textarea with Validation
{% include components/forms/textarea-field.html
   name="test-description"
   label="Brand Description"
   placeholder="Describe your brand, what makes it unique, and why it should be featured..."
   required=true
   rows=6
   maxlength=1000
   help_text="Maximum 1000 characters. Be specific about your brand's unique value proposition." %}

---

## 6. Form Validation Examples

### Required Fields Test
<form class="test-form">
  {% include components/forms/input-field.html
     name="required-text"
     label="Required Text Field"
     required=true
     error_message="This field is required" %}

  {% include components/forms/input-field.html
     name="required-email"
     type="email"
     label="Required Email"
     required=true %}

  {% include components/forms/textarea-field.html
     name="required-message"
     label="Required Message"
     required=true
     rows=3 %}

  <button type="submit" class="btn btn--primary">Test Validation</button>
</form>

---

## 7. Form States

### Error State Example
{% include components/forms/input-field.html
   name="error-example"
   label="Field with Error"
   value="invalid-email"
   error_message="Please enter a valid email address"
   class_name="form-field--error" %}

### Disabled State Example
{% include components/forms/input-field.html
   name="disabled-example"
   label="Disabled Field"
   value="This field is disabled"
   disabled=true %}

### Readonly State Example
{% include components/forms/input-field.html
   name="readonly-example"
   label="Readonly Field"
   value="This field is readonly"
   readonly=true %}

---

## 8. Custom Styling Examples

### Large Form Field
{% include components/forms/input-field.html
   name="large-field"
   label="Large Input Field"
   placeholder="This is a large input field"
   class_name="form-field--large" %}

### Small Form Field
{% include components/forms/input-field.html
   name="small-field"
   label="Small Input Field"
   placeholder="This is a small input field"
   class_name="form-field--small" %}

---

## 9. Accessibility Features Test

### Screen Reader Optimized Form
<form aria-label="Accessibility test form">
  {% include components/forms/input-field.html
     name="a11y-name"
     label="Full Name"
     required=true
     autocomplete="name"
     help_text="Enter your full name as it appears on official documents" %}

  {% include components/forms/input-field.html
     name="a11y-email"
     type="email"
     label="Email Address"
     required=true
     autocomplete="email"
     help_text="We'll use this to send you important updates" %}

  {% include components/forms/select-field.html
     name="a11y-role"
     label="Your Role"
     options="founder:Brand Founder|investor:Investor|distributor:Distributor|press:Press/Media|other:Other"
     placeholder="Select your role" %}

  <button type="submit" class="btn btn--primary" aria-describedby="submit-help">
    Submit Form
  </button>
  <div id="submit-help" class="form-help">
    Click to submit your information. We'll respond within 24 hours.
  </div>
</form>

---

## Testing Instructions

1. **Visual Testing**: Check that all forms render correctly
2. **Validation Testing**: Try submitting forms with missing required fields
3. **Accessibility Testing**: Navigate forms using only keyboard
4. **Mobile Testing**: Test forms on mobile devices
5. **Multi-language Testing**: Switch languages and verify translations work

## Expected Behavior

- All forms should render without errors
- Required field validation should work
- Form styling should be consistent
- Mobile responsive design should work
- Accessibility features should function properly

---

*Last Updated: 2025-05-25*
