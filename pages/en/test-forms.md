---
layout: simple
title: "Form Testing & Airtable Integration"
description: "Test page for all form components and Airtable integration setup"
permalink: /en/test-forms/
lang: en
ref: test-forms
---

# Form Testing & Integration Page

This page contains all the forms we plan to implement, ready for Airtable integration testing.

---

## 1. Contact Form (General)

{% include components/forms/contact-form.html
   variant="general"
   title="General Contact"
   description="Get in touch with our team" %}

---

## 2. Brand Submission Form

{% include components/forms/contact-form.html
   variant="brand-submission"
   title="Submit Your Brand"
   description="Tell us about your brand for potential inclusion" %}

---

## 3. Partnership Inquiry Form

{% include components/forms/contact-form.html
   variant="partnership"
   title="Partnership Inquiry"
   description="Interested in partnering with Brandmine?" %}

---

## 4. Newsletter Subscription

{% include components/forms/newsletter-form.html %}

---

## 5. Search Feedback Form

{% include components/forms/feedback-form.html
   type="search"
   title="Search Experience Feedback" %}

---

## Form Testing Checklist

- [ ] Test form validation (required fields)
- [ ] Test error handling (invalid email formats)
- [ ] Test success states
- [ ] Test responsive design on mobile
- [ ] Test accessibility (keyboard navigation, screen readers)
- [ ] Test Airtable data submission
- [ ] Test multilingual forms (create RU/ZH versions)

---

## Airtable Integration Notes

**Required Environment Variables:**
- `AIRTABLE_API_KEY` or `AIRTABLE_PERSONAL_ACCESS_TOKEN`
- `AIRTABLE_BASE_ID`
- `AIRTABLE_CONTACTS_TABLE_ID`
- `AIRTABLE_BRANDS_TABLE_ID`
- `AIRTABLE_PARTNERSHIPS_TABLE_ID`

**Form Processing Endpoints:**
- `/api/contact` - General contact submissions
- `/api/brand-submission` - Brand submission form
- `/api/partnership` - Partnership inquiries
- `/api/newsletter` - Newsletter subscriptions
- `/api/feedback` - Search and site feedback

Each form will POST to its respective endpoint for processing and Airtable storage.
