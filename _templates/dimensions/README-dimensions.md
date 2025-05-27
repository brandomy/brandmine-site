# Dimension Templates Usage Guide

This directory contains templates for creating individual dimension pages across the four dimension categories.

## Available Templates

- `dimension-market.md` - For geographic markets (e.g., Brazil, Russia, China)
- `dimension-sector.md` - For business sectors (e.g., wine, artisan-ceramics, hotels-resorts)  
- `dimension-attribute.md` - For brand attributes (e.g., founder-led, heritage-brand, artisanal-excellence)
- `dimension-signal.md` - For growth signals (e.g., export-ready, franchise-ready, rapid-growth)

## Using the Templates

### 1. Choose the Right Template
Select the template that matches your dimension category.

### 2. Replace Placeholders
All templates use `[PLACEHOLDER]` format. Replace with actual values:

```
[SLUG] → kebab-case-identifier (e.g., "artisan-ceramics")
[MARKET_NAME] → Full display name (e.g., "Brazil")
[SECTOR_NAME] → Full sector name (e.g., "Artisan Ceramics")
etc.
```

### 3. Customize Sections
Each template includes a `sections` array that controls which content blocks appear:

```yaml
sections:
  - breadcrumbs
  - hero
  - header
  - market-highlights
  - featured-brands
  - all-brands
  - related-insights
```

**Toggle sections on/off** by commenting out or removing lines.

### 4. File Placement
Save completed files to:
```
_dimensions/en/[category]/[slug].md
```

Examples:
- `_dimensions/en/markets/brazil.md`
- `_dimensions/en/sectors/artisan-ceramics.md`
- `_dimensions/en/attributes/founder-led.md`
- `_dimensions/en/signals/export-ready.md`

### 5. Required Supporting Files

For each new dimension, ensure these exist:

1. **Translation entries** in `_data/translations/en.yml`:
   ```yaml
   dimensions:
     categories:
       market: "Market"
       sector: "Sector"
       attribute: "Attribute" 
       signal: "Signal"
   ```

2. **Dimension data** (if using market-sectors functionality):
   ```
   _data/market-sectors/en/[market-slug].yml
   ```

3. **Images** (optional):
   ```
   assets/images/[category]/[slug]/
   ```

## Content Guidelines

### Markets
- Focus on economic context, consumer characteristics, business environment
- Include population, GDP, key sectors, cultural context
- Emphasize export opportunities and market access

### Sectors  
- Focus on product characteristics, traditional methods, innovation
- Include market size, growth trends, regional variations
- Emphasize quality standards and international potential

### Attributes
- Focus on brand characteristics, strategic value, competitive advantage
- Include cross-cultural manifestations and development strategies
- Emphasize business impact and market differentiation

### Signals
- Focus on growth readiness, expansion opportunities, investment appeal
- Include assessment criteria, next steps, success metrics
- Emphasize actionable guidance and partnership opportunities

## Quick Creation Checklist

- [ ] Choose appropriate template
- [ ] Replace all `[PLACEHOLDERS]` with actual values
- [ ] Customize sections array for desired content blocks
- [ ] Save to correct `_dimensions/en/[category]/` directory
- [ ] Add translation entries if needed
- [ ] Add images to `assets/images/[category]/[slug]/` if available
- [ ] Test page generation and layout
- [ ] Create RU and ZH versions once English is finalized

## Advanced Customization

### Custom Sections
You can override the default sections completely:

```yaml
sections:
  - breadcrumbs
  - hero
  - custom-section-name
  - all-brands
```

Just ensure the corresponding include exists at:
`_includes/pages/dimension/custom-section-name.html`

### Additional Front Matter
Add any custom fields needed for your specific dimension:

```yaml
special_field: "Custom value"
custom_data:
  - item1
  - item2
```

Access in templates with `{{ page.special_field }}` or `{{ page.custom_data }}`.

---

*These templates follow the "logic-light" architecture and unified hero system established for the Brandmine site.*