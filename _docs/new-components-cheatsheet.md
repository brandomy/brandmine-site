# New Components Usage Cheatsheet

**Quick reference for all components added today**

---

## 🚨 **Error Handling Components**

### Network Error
```liquid
{% include components/errors/network-error.html %}
{% include components/errors/network-error.html title="Connection Lost" retry_action="loadData()" %}
```

### Server Error (500)
```liquid
{% include components/errors/500.html %}
{% include components/errors/500.html title="Service Unavailable" error_id="ERR-2025-001" %}
```

---

## 🎨 **UI Components**

### Alerts
```liquid
<!-- Success alert -->
{% include components/ui/alerts.html type="success" message="Brand saved!" dismissible=true %}

<!-- Error alert -->
{% include components/ui/alerts.html type="error" title="Validation Error" message="Please check your data." %}

<!-- Warning alert -->
{% include components/ui/alerts.html type="warning" message="This feature is in beta." %}

<!-- Info alert -->
{% include components/ui/alerts.html type="info" message="New insights available." %}
```

### Breadcrumbs
```liquid
<!-- Auto-generate from page structure -->
{% include components/ui/breadcrumbs.html %}

<!-- Custom breadcrumbs -->
{% assign custom_items = "Home,/|Brands,/brands|Wine,/discover/sectors/wine" | split: "|" %}
{% include components/ui/breadcrumbs.html items=custom_items %}

<!-- Without home link -->
{% include components/ui/breadcrumbs.html show_home=false separator="/" %}
```

### Loading Spinner
```liquid
<!-- Basic spinner -->
{% include components/ui/loading-spinner.html %}

<!-- Large spinner with text -->
{% include components/ui/loading-spinner.html size="large" text="Loading brands..." %}

<!-- Full-page overlay -->
{% include components/ui/loading-spinner.html overlay=true text="Processing..." %}

<!-- Small white spinner -->
{% include components/ui/loading-spinner.html size="small" color="white" %}
```

### Modal Dialog
```liquid
<!-- Basic modal -->
{% capture modal_content %}
  <p>Are you sure you want to delete this brand?</p>
  <div class="modal-actions">
    <button class="btn btn--danger" onclick="deleteBrand(); closeModal('confirm-modal')">Delete</button>
    <button class="btn btn--outline" onclick="closeModal('confirm-modal')">Cancel</button>
  </div>
{% endcapture %}
{% include components/ui/modal.html id="confirm-modal" title="Confirm Delete" content=modal_content %}

<!-- Open modal with JavaScript -->
<button onclick="openModal('confirm-modal')">Delete Brand</button>
```

### Tooltip
```liquid
<!-- Hover tooltip -->
{% capture tooltip_content %}<button class="help-btn">?</button>{% endcapture %}
{% include components/ui/tooltip.html text="This field helps identify your brand sector" content=tooltip_content %}

<!-- Click tooltip -->
{% capture tooltip_content %}<span class="icon">ℹ️</span>{% endcapture %}
{% include components/ui/tooltip.html text="Click for more information" trigger="click" position="bottom" content=tooltip_content %}
```

---

## 📋 **Form Components**

### Input Fields
```liquid
<!-- Text input -->
{% include components/forms/input-field.html name="brand_name" label="Brand Name" required=true %}

<!-- Email input -->
{% include components/forms/input-field.html name="email" type="email" label="Email" required=true autocomplete="email" %}

<!-- URL input -->
{% include components/forms/input-field.html name="website" type="url" label="Website" placeholder="https://example.com" %}

<!-- Phone input -->
{% include components/forms/input-field.html name="phone" type="tel" label="Phone" help_text="Include country code" %}

<!-- Input with error -->
{% include components/forms/input-field.html name="invalid_field" label="Invalid Field" error_message="This field is required" %}
```

### Textarea Fields
```liquid
<!-- Basic textarea -->
{% include components/forms/textarea-field.html name="description" label="Brand Description" rows=4 %}

<!-- Textarea with character limit -->
{% include components/forms/textarea-field.html name="story" label="Brand Story" maxlength=500 help_text="Tell us about your brand" %}

<!-- Required textarea -->
{% include components/forms/textarea-field.html name="message" label="Message" required=true rows=6 %}
```

### Select Fields
```liquid
<!-- Country selector -->
{% assign countries = "us:United States|ca:Canada|mx:Mexico" | split: "|" %}
{% include components/forms/select-field.html name="country" label="Country" options=countries placeholder="Select country" %}

<!-- Sector selector -->
{% assign sectors = "wine:Wine|beauty:Natural Beauty|food:Gourmet Foods" | split: "|" %}
{% include components/forms/select-field.html name="sector" label="Sector" options=sectors required=true %}

<!-- Multiple select -->
{% include components/forms/select-field.html name="interests" label="Interests" options=sectors multiple=true %}
```

### Complete Contact Form
```liquid
<!-- General contact form -->
{% include components/forms/contact-form.html %}

<!-- Brand submission form -->
{% include components/forms/contact-form.html form_type="brand-submission" %}

<!-- Partnership inquiry form -->
{% include components/forms/contact-form.html form_type="partnership" show_company=true %}

<!-- Custom action -->
{% include components/forms/contact-form.html action="/api/contact" method="POST" %}
```

### Form Validation
```liquid
<!-- Add validation to any form -->
<form id="my-form">
  <!-- Your form fields here -->
</form>
{% include components/forms/validation.html form_id="my-form" %}

<!-- Real-time validation disabled -->
{% include components/forms/validation.html form_id="signup-form" show_realtime=false %}
```

---

## 🛠️ **Development Tools**

### Debug Info Panel
```liquid
<!-- Show in development only -->
{% unless jekyll.environment == "production" %}
  {% include dev/debug-info.html %}
{% endunless %}

<!-- Floating debug panel -->
{% include dev/debug-info.html position="float" show_site_data=false %}

<!-- Minimal debug info -->
{% include dev/debug-info.html show_collections=false show_translations=false %}
```

**Keyboard shortcut:** `Ctrl+Shift+D` to toggle

### Performance Monitor
```liquid
<!-- Full performance monitoring -->
{% unless jekyll.environment == "production" %}
  {% include dev/performance-monitor.html %}
{% endunless %}

<!-- Console logging only -->
{% include dev/performance-monitor.html show_panel=false auto_report=true %}

<!-- Different position -->
{% include dev/performance-monitor.html position="bottom-left" %}
```

### Feature Flags
```liquid
<!-- Simple feature flag -->
{% include dev/feature-flag.html flag="new-search" enabled=true %}
  <div class="new-search">New search interface</div>
{% endcapture %}

<!-- Percentage rollout -->
{% include dev/feature-flag.html flag="beta-features" percentage=25 %}
  <div class="beta-banner">Try our beta features!</div>
{% endcapture %}

<!-- Environment-specific -->
{% include dev/feature-flag.html flag="redesign" environments="development,staging" %}
  <div class="new-design">New layout</div>
{% endcapture %}

<!-- With fallback -->
{% include dev/feature-flag.html flag="advanced-filters" percentage=50 fallback_content="<p>Standard filters</p>" %}
  <div class="advanced-filters">Advanced filtering options</div>
{% endcapture %}
```

---

## 🎯 **Common Usage Patterns**

### Form with Validation and Loading
```liquid
<form id="brand-form">
  {% include components/forms/input-field.html name="name" label="Brand Name" required=true %}
  {% include components/forms/select-field.html name="sector" label="Sector" options=sectors required=true %}
  {% include components/forms/textarea-field.html name="description" label="Description" maxlength=500 %}
  
  <button type="submit" class="btn btn--primary">
    Submit Brand
    {% include components/ui/loading-spinner.html size="small" id="submit-loading" style="display:none;" %}
  </button>
</form>

{% include components/forms/validation.html form_id="brand-form" %}
```

### Error Handling Flow
```liquid
<!-- Show success alert after form submission -->
{% include components/ui/alerts.html type="success" message="Brand submitted successfully!" id="success-alert" style="display:none;" %}

<!-- Show error if something goes wrong -->
{% include components/ui/alerts.html type="error" message="Please try again later." id="error-alert" style="display:none;" %}

<!-- Network error for offline scenarios -->
<div id="network-error" style="display:none;">
  {% include components/errors/network-error.html retry_action="submitForm()" %}
</div>
```

### Modal with Form
```liquid
{% capture modal_content %}
  {% include components/forms/input-field.html name="edit_name" label="Brand Name" %}
  {% include components/forms/textarea-field.html name="edit_description" label="Description" %}
  <div class="modal-actions">
    <button class="btn btn--primary" onclick="saveChanges()">Save</button>
    <button class="btn btn--outline" onclick="closeModal('edit-modal')">Cancel</button>
  </div>
{% endcapture %}
{% include components/ui/modal.html id="edit-modal" title="Edit Brand" content=modal_content %}
```

### Development Layout
```liquid
<!-- Add to your default layout -->
{% unless jekyll.environment == "production" %}
  {% include dev/debug-info.html position="bottom" %}
  {% include dev/performance-monitor.html position="top-right" %}
{% endunless %}
```

---

## 📝 **Quick Reference**

### Component Locations
```
_includes/
├── components/
│   ├── errors/          # Error handling
│   ├── ui/              # UI patterns  
│   └── forms/           # Form components
└── dev/                 # Development tools
```

### CSS Classes (if you need to style)
- `.alert`, `.alert--success`, `.alert--error`, `.alert--warning`, `.alert--info`
- `.breadcrumbs`, `.breadcrumbs__list`, `.breadcrumbs__item`
- `.loading-spinner`, `.loading-overlay`
- `.modal`, `.modal__content`, `.modal__header`
- `.form-field`, `.form-field__label`, `.form-field__input`, `.form-field__error`

### JavaScript Functions
```javascript
// Modals
openModal('modal-id')
closeModal('modal-id')

// Tooltips
showTooltip('tooltip-id')
hideTooltip('tooltip-id')

// Feature flags (check state)
console.log(window.brandmineFeatureFlags)

// Performance metrics
console.log('Performance:', window.performanceMetrics)
```

---

## 🚀 **Getting Started**

1. **For user feedback:** Start with alerts and loading spinners
2. **For forms:** Use contact-form.html or build custom with individual fields
3. **For navigation:** Add breadcrumbs to page layouts
4. **For development:** Add debug-info and performance-monitor to layouts
5. **For testing:** Use feature flags for gradual rollouts

**All components use your centralized translation system and follow your BEM naming conventions!**