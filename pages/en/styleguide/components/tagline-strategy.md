---
layout: default
lang: en
title: Tagline Dual Strategy
permalink: /en/styleguide/components/tagline-strategy/
description: Demonstration of Brandmine's dual tagline strategy implementation
---

# Brandmine Tagline Architecture

## Strategic Overview

Brandmine employs a **dual tagline strategy** to maximize both market appeal and professional credibility through context-specific messaging.

---

## Live Examples

{% include components/tagline-dual-strategy-examples.html %}

---

## Implementation Guide

### Primary Tagline (Market-Facing)

**Purpose:** Broad market recognition, social media, brand awareness

```liquid
{% raw %}
<!-- Standard usage -->
{% include components/tagline.html purpose="market" %}

<!-- Short version for footer/mobile -->
{% include components/tagline.html purpose="market" variant="short" %}

<!-- Without emoji for print -->
{% include components/tagline.html purpose="market" show_emoji=false %}
{% endraw %}
```

### Secondary Tagline (Professional)

**Purpose:** B2B contexts, investor presentations, professional networking

```liquid
{% raw %}
<!-- Professional version -->
{% include components/tagline.html purpose="professional" %}

<!-- Professional without emoji -->
{% include components/tagline.html purpose="professional" show_emoji=false %}
{% endraw %}
```

---

## Deployment Guidelines

### When to Use Primary Tagline
- Homepage hero sections
- Social media profiles
- Marketing campaigns
- Brand identity materials
- Footer sections
- Mobile interfaces

### When to Use Professional Tagline
- Business cards
- Email signatures
- LinkedIn profiles
- Investor pitch decks
- Service descriptions
- B2B proposals
- Professional presentations

---

## Technical Implementation

The tagline component supports:
- **Purpose parameter**: `market` (default) or `professional`
- **Variant parameter**: `full` (default) or `short`
- **Language support**: EN, RU, ZH
- **Emoji control**: `show_emoji` parameter
- **Custom CSS classes**: For specific styling needs
- **Full accessibility**: Screen reader support for emoji

---

## Translation Keys

```yaml
# English
footer:
  tagline_market: "🔆 Where Global South brands gain global recognition"
  tagline_professional: "🔆 Illuminating Exceptional Global South Brands"

# Russian
footer:
  tagline_market: "🔆 Где бренды Глобального Юга получают мировое признание"
  tagline_professional: "🔆 Освещаем выдающиеся бренды Глобального Юга"

# Chinese
footer:
  tagline_market: "🔆 全球南方品牌获得全球认可之地"
  tagline_professional: "🔆 照亮全球南方卓越品牌"
```

---

## Success Metrics

- **Primary tagline**: Measured through brand recognition and market appeal
- **Professional tagline**: Measured through professional credibility and service inquiries
- **Combined impact**: Strengthens overall brand position without confusion

---

*This dual tagline strategy reflects Brandmine's evolution from single-message positioning to sophisticated, context-aware brand communications.*