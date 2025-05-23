---
layout: simple
title: "Components Demo"
permalink: /en/dev/components-demo/
---

# New Components Demo

## Error Handling Components

### 404 Error
{% include components/errors/404.html title="Brand Not Found" message="The brand you're looking for doesn't exist." %}

### Network Error
{% include components/errors/network-error.html %}

## UI Components

### Alerts
{% include components/ui/alerts.html type="success" message="Brand saved successfully!" dismissible=true %}
{% include components/ui/alerts.html type="error" title="Validation Error" message="Please check your form data." %}
{% include components/ui/alerts.html type="warning" message="This feature is in beta." %}
{% include components/ui/alerts.html type="info" message="New insights available." %}

### Breadcrumbs
{% include components/ui/breadcrumbs.html %}

### Loading Spinner
{% include components/ui/loading-spinner.html size="large" text="Loading brands..." %}

## Form Components

### Contact Form
{% include components/forms/contact-form.html form_type="brand-submission" %}

### Individual Form Fields
{% include components/forms/input-field.html name="email" type="email" label="Email Address" required=true %}
{% include components/forms/textarea-field.html name="message" label="Message" rows=4 maxlength=500 %}

## Development Tools

{% include dev/debug-info.html %}
{% include dev/performance-monitor.html %}