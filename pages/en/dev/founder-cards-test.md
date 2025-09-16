---
layout: default
title: "Founder Cards Test Page"
description: "Isolated testing environment for founder card styling and variants"
permalink: /en/dev/founder-cards-test/
lang: en
---

# Founder Cards Test Environment

Focused testing environment for the two main founder card components with consistent data comparison across different layout configurations.

**Test Data**: {{ site.founders | size }} total founders, {{ site.founders | where: "lang", "en" | size }} English founders
**Reference Data**: Eduardo Santos (Brazil's Organic Pioneer) used consistently across all tests

{% assign test_founders = site.founders | where: "lang", "en" | limit: 4 %}
{% assign reference_founder = test_founders[0] %}

## Card Inventory

<style>
.comparison-table {
  width: 100%;
  border-collapse: collapse;
  font-family: system-ui, -apple-system, sans-serif;
  margin: 1rem 0;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.comparison-table th,
.comparison-table td {
  border: 2px solid #e1e5e9;
  padding: 12px 16px;
  text-align: left;
  vertical-align: top;
}

.comparison-table th {
  background-color: #f8f9fa;
  font-weight: 600;
  color: #2d3748;
  border-bottom: 3px solid #cbd5e0;
}

.comparison-table tbody tr:nth-child(even) {
  background-color: #f7fafc;
}

.comparison-table tbody tr:hover {
  background-color: #edf2f7;
}

.comparison-table td:first-child {
  font-weight: 600;
  background-color: #f8f9fa;
  border-right: 3px solid #cbd5e0;
}

.comparison-table code {
  background-color: #f1f5f9;
  padding: 2px 6px;
  border-radius: 4px;
  font-family: 'Monaco', 'Consolas', monospace;
  font-size: 0.9em;
}
</style>

<table class="comparison-table">
  <thead>
    <tr>
      <th><strong>Attribute</strong></th>
      <th><strong>Featured Founder Card</strong></th>
      <th><strong>Standard Founder Card</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Card Type</strong></td>
      <td>Featured Card</td>
      <td>Standard Card</td>
    </tr>
    <tr>
      <td><strong>Filename</strong></td>
      <td><code>founder-card-featured.html</code></td>
      <td><code>founder-card.html</code></td>
    </tr>
    <tr>
      <td><strong>Available Variants</strong></td>
      <td>featured only</td>
      <td>standard, featured, compact</td>
    </tr>
    <tr>
      <td><strong>Currently Used On</strong></td>
      <td>Homepage, founder profiles</td>
      <td>Founder listings, grids</td>
    </tr>
    <tr>
      <td><strong>Primary Purpose</strong></td>
      <td>Homepage showcase, emotional impact</td>
      <td>General grid layouts, listings</td>
    </tr>
    <tr>
      <td><strong>Layout Structure</strong></td>
      <td>Horizontal 50/50 split</td>
      <td>Vertical compact layout</td>
    </tr>
    <tr>
      <td><strong>Image Type</strong></td>
      <td>Portrait photo (displayed landscape aspect in 50% width)</td>
      <td>Headshot photo (displayed circular)</td>
    </tr>
    <tr>
      <td><strong>Image Element</strong></td>
      <td><code>.founder-card-featured__portrait-image</code></td>
      <td><code>.founder-card__headshot</code></td>
    </tr>
    <tr>
      <td><strong>Content Elements</strong></td>
      <td>name, position, location, achievement, bio, tags, CTA</td>
      <td>name, position, company-location, description, tags, link</td>
    </tr>
    <tr>
      <td><strong>Biography Display</strong></td>
      <td>Full bio text</td>
      <td>Truncated bio (120 characters)</td>
    </tr>
    <tr>
      <td><strong>Expertise Tags</strong></td>
      <td>4 tags maximum</td>
      <td>3 tags maximum</td>
    </tr>
    <tr>
      <td><strong>Location Display</strong></td>
      <td>City + country flag</td>
      <td>Company • City, Country (translated)</td>
    </tr>
    <tr>
      <td><strong>Achievement Section</strong></td>
      <td>Key achievement badge with icon</td>
      <td>Professional background in description</td>
    </tr>
    <tr>
      <td><strong>Call to Action</strong></td>
      <td><code>Meet [Name] →</code> button</td>
      <td><code>Meet [FirstName] →</code> link</td>
    </tr>
    <tr>
      <td><strong>CSS Classes</strong></td>
      <td><code>.founder-card-featured</code></td>
      <td><code>.founder-card</code>, <code>.founder-card--standard</code></td>
    </tr>
    <tr>
      <td><strong>Schema.org</strong></td>
      <td>No microdata</td>
      <td>Person microdata (itemscope/itemtype)</td>
    </tr>
    <tr>
      <td><strong>Generation Marker</strong></td>
      <td>"1st Gen" badge</td>
      <td>None</td>
    </tr>
    <tr>
      <td><strong>Brand Integration</strong></td>
      <td>Linked brand name in location</td>
      <td>Company name in meta</td>
    </tr>
    <tr>
      <td><strong>Placeholder Fallback</strong></td>
      <td>Portrait icon SVG</td>
      <td>Initials from name</td>
    </tr>
  </tbody>
</table>

## Individual Card Testing

### Featured Founder Card Testing

#### 1.1 Featured card - no grid (standalone)

<div style="border: 2px dashed #6366F1; padding: 1.5rem; margin: 1rem 0; border-radius: 8px; background: #f8f9fa;">
  {% include components/cards/founder-card-featured.html founder=reference_founder %}
</div>

#### 1.2 Featured card - 1x2 grid

<div style="border: 2px dashed #6366F1; padding: 1.5rem; margin: 1rem 0; border-radius: 8px; background: #f8f9fa;">
  <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem; width: 100%;">
    {% assign grid_founders = test_founders | slice: 0, 2 %}
    {% for founder in grid_founders %}
    <div style="min-width: 0;">
      {% include components/cards/founder-card-featured.html founder=founder %}
    </div>
    {% endfor %}
  </div>
</div>

#### 1.3 Featured card - 1x3 grid

<div style="border: 2px dashed #6366F1; padding: 1.5rem; margin: 1rem 0; border-radius: 8px; background: #f8f9fa;">
  <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 1rem; margin-top: 1rem; width: 100%;">
    {% for founder in test_founders limit: 3 %}
    <div style="min-width: 0;">
      {% include components/cards/founder-card-featured.html founder=founder %}
    </div>
    {% endfor %}
  </div>
</div>

#### 1.4 Featured card - 1x4 grid

<div style="border: 2px dashed #6366F1; padding: 1.5rem; margin: 1rem 0; border-radius: 8px; background: #f8f9fa;">
  <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr; gap: 1rem; margin-top: 1rem; width: 100%;">
    {% for founder in test_founders %}
    <div style="min-width: 0;">
      {% include components/cards/founder-card-featured.html founder=founder %}
    </div>
    {% endfor %}
  </div>
</div>

### Standard Founder Card Testing

#### 2.1 Standard card - no grid (standalone)

<div style="border: 2px dashed #38B2AC; padding: 1.5rem; margin: 1rem 0; border-radius: 8px; background: #f8f9fa;">
  {% include components/cards/founder-card.html founder=reference_founder variant='standard' %}
</div>

#### 2.2 Standard card - 1x2 grid

<div style="border: 2px dashed #38B2AC; padding: 1.5rem; margin: 1rem 0; border-radius: 8px; background: #f8f9fa;">
  <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1rem; width: 100%;">
    {% for founder in test_founders limit: 2 %}
    <div style="min-width: 0;">
      {% include components/cards/founder-card.html founder=founder variant='standard' %}
    </div>
    {% endfor %}
  </div>
</div>

#### 2.3 Standard card - 1x3 grid

<div style="border: 2px dashed #38B2AC; padding: 1.5rem; margin: 1rem 0; border-radius: 8px; background: #f8f9fa;">
  <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 1rem; margin-top: 1rem; width: 100%;">
    {% for founder in test_founders limit: 3 %}
    <div style="min-width: 0;">
      {% include components/cards/founder-card.html founder=founder variant='standard' %}
    </div>
    {% endfor %}
  </div>
</div>

#### 2.4 Standard card - 1x4 grid

<div style="border: 2px dashed #38B2AC; padding: 1.5rem; margin: 1rem 0; border-radius: 8px; background: #f8f9fa;">
  <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr; gap: 1rem; margin-top: 1rem; width: 100%;">
    {% for founder in test_founders %}
    <div style="min-width: 0;">
      {% include components/cards/founder-card.html founder=founder variant='standard' %}
    </div>
    {% endfor %}
  </div>
</div>