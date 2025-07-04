---
layout: default
title: "Insight Category NEW Component Test"
permalink: /test/insight-category-new-test/
language: en
---

# Insight Category NEW Component Test

Simple test of the new BEM-based insight category component with inline styles.

## All Categories

{% include components/ui/insight-category-new.html category="brand-spotlight" %}
{% include components/ui/insight-category-new.html category="founders-journey" %}
{% include components/ui/insight-category-new.html category="location-intelligence" %}
{% include components/ui/insight-category-new.html category="market-momentum" %}

## Unknown Category Test

{% include components/ui/insight-category-new.html category="unknown-test" %}

## Size Variants

### Small
{% include components/ui/insight-category-new.html category="brand-spotlight" size="sm" %}

### Medium (Default)
{% include components/ui/insight-category-new.html category="brand-spotlight" %}

### Large
{% include components/ui/insight-category-new.html category="brand-spotlight" size="lg" %}

## Expected Results

- **Brand Spotlight**: Light orange background with brown text and star icon
- **Founder's Journey**: Light indigo background with dark indigo text and person icon  
- **Location Intelligence**: Light sky blue background with dark blue text and location icon
- **Market Momentum**: Light olive background with dark olive text and chart icon
- **Unknown**: Light gray background with dark gray text, no icon