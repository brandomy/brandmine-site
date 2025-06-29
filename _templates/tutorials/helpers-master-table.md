# Helpers Master Reference Table

## Essential Helpers for Cards & Pages

### 🌐 Translation & Localization

| Helper | Location | Parameters | Usage | Example |
|--------|----------|------------|-------|---------|
| `t.html` | `helpers/t.html` | `key` (required), `fallback` (optional) | Multi-language text display | `{% include helpers/t.html key="common.actions.view_profile" fallback="View Profile" %}` |
| `country-flag.html` | `helpers/country-flag.html` | `country_code` (required) | Display country flag emoji | `{% include helpers/country-flag.html country_code=brand.country %}` |
| `country-lookup.html` | `helpers/country-lookup.html` | `code` (required), `lang` (optional) | Get country name from code | Used internally by other helpers |
| `dimension-name.html` | `helpers/dimension-name.html` | `type` (required), `id` (required) | Resolve dimension display names | `{% include helpers/dimension-name.html type="sectors" id=sector %}` |

### 📍 Location & Geography

| Helper | Location | Parameters | Usage | Example |
|--------|----------|------------|-------|---------|
| `country-name.html` | `components/helpers/country-name.html` | `code` (required), `lang` (optional) | Display full country name | `{% include components/helpers/country-name.html code=founder.country lang=page.lang %}` |
| `location-display.html` | `components/helpers/location-display.html` | `city`, `country`, `format` | Standardized location formatting | `{% include components/helpers/location-display.html city=brand.city country=brand.country %}` |

### 🖼️ Images & Media

| Helper | Location | Parameters | Usage | Example |
|--------|----------|------------|-------|---------|
| `collection-image.html` | `components/images/collection-image.html` | `collection`, `slug`, `purpose`, `name`, `alt`, `class`, `sizes` | Responsive images for brands/founders | `{% include components/images/collection-image.html collection="brands" slug=brand.ref purpose="hero" %}` |
| `brand-image.html` | `helpers/brand-image.html` | `brand`, `size`, `class` | Brand-specific image helper | `{% include helpers/brand-image.html brand=brand size="400w" %}` |
| `founder-image.html` | `helpers/founder-image.html` | `founder`, `type`, `class` | Founder portrait/headshot helper | `{% include helpers/founder-image.html founder=founder type="portrait" %}` |

### 🏷️ Taxonomy & Tags

| Helper | Location | Parameters | Usage | Example |
|--------|----------|------------|-------|---------|
| `bem-taxonomy-tag.html` | `components/helpers/bem-taxonomy-tag.html` | `type`, `value`, `class_prefix` | BEM-style taxonomy tags | `{% include components/helpers/bem-taxonomy-tag.html type="sector" value=sector class_prefix="brand-card" %}` |
| `founder-tags.html` | `components/helpers/founder-tags.html` | `founder`, `limit` | Display founder expertise tags | `{% include components/helpers/founder-tags.html founder=founder limit=3 %}` |

### 📊 Data & Content

| Helper | Location | Parameters | Usage | Example |
|--------|----------|------------|-------|---------|
| `component-defaults.html` | `helpers/component-defaults.html` | `component`, `param`, `fallback` | Get configurable default values | `{% include helpers/component-defaults.html component="cards.brand-card" param="tag_limit" fallback=4 %}` |
| `founding-year.html` | `components/helpers/founding-year.html` | `year`, `format` | Format founding year display | `{% include components/helpers/founding-year.html year=brand.founding_year %}` |
| `founder-check.html` | `components/helpers/founder-check.html` | `brand`, `class_name` | Check if brand is founder-led | `{% include components/helpers/founder-check.html brand=brand class_name="brand-card" %}` |

### 🎨 UI Components

| Helper | Location | Parameters | Usage | Example |
|--------|----------|------------|-------|---------|
| `card-header.html` | `components/helpers/card-header.html` | `brand`, `class_name`, `show_location` | Standardized card header | `{% include components/helpers/card-header.html brand=brand class_name="brand-card" %}` |
| `empty-state.html` | `components/helpers/empty-state.html` | `message`, `icon`, `action` | No results messaging | `{% include components/helpers/empty-state.html message="No brands found" %}` |
| `load-more-button.html` | `components/helpers/load-more-button.html` | `url`, `text`, `class` | Pagination/load more UI | `{% include components/helpers/load-more-button.html url="/brands/" text="View All Brands" %}` |

## 🔄 Data Filters & Processing

| Helper | Location | Parameters | Usage | Example |
|--------|----------|------------|-------|---------|
| `brand-filter.html` | `helpers/brand-filter.html` | `lang`, `featured`, `limit`, `sector` | Filter brands by criteria | `{% include helpers/brand-filter.html lang=page.lang featured=true limit=10 %}` |
| `founder-data.html` | `helpers/founder-data.html` | `ref`, `lang` | Get founder data by reference | `{% include helpers/founder-data.html ref=founder_ref lang=page.lang %}` |
| `brand-data.html` | `helpers/brand-data.html` | `ref`, `lang` | Get brand data by reference | `{% include helpers/brand-data.html ref=brand_ref lang=page.lang %}` |

## 📱 Layout & Structure

| Helper | Location | Parameters | Usage | Example |
|--------|----------|------------|-------|---------|
| `page-sections.html` | `helpers/page-sections.html` | `page_type` | Render page sections from config | `{% include helpers/page-sections.html page_type="home" %}` |
| `panel-wrapper.html` | `helpers/panel-wrapper.html` | `type`, `content_classes`, `additional_classes` | Wrap content in panels | `{% include helpers/panel-wrapper.html type="panel--light" %}` |

## 🎯 Most Commonly Used in Cards

### For Brand Cards:
1. **`t.html`** - All UI text ("View Profile", etc.)
2. **`dimension-name.html`** - Sector, market, attribute names
3. **`collection-image.html`** - Brand hero images
4. **`country-flag.html`** - Location display
5. **`card-header.html`** - Standardized headers

### For Founder Cards:
1. **`t.html`** - All UI text
2. **`collection-image.html`** - Founder portraits
3. **`country-name.html`** - Location display
4. **`founder-tags.html`** - Expertise display
5. **`founding-year.html`** - Company founding

### For Page Sections:
1. **`page-sections.html`** - Section rendering
2. **`brand-filter.html`** - Content filtering
3. **`panel-wrapper.html`** - Layout structure
4. **`empty-state.html`** - No results handling

## 💡 Usage Patterns

### Basic Card Helper Pattern:
```liquid
{% include helpers/t.html key="common.actions.view_profile" fallback="View Profile" %}
{% include helpers/dimension-name.html type="sectors" id=sector %}
{% include helpers/country-flag.html country_code=brand.country %}
```

### Image Helper Pattern:
```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug=brand.ref
   purpose="hero"
   name=brand.images.hero.name
   alt=brand.images.hero.alt
   class="brand-card__img" %}
```

### Data Filtering Pattern:
```liquid
{% include helpers/brand-filter.html lang=page.lang featured=true limit=10 %}
{% assign brands = filtered_brands %}
```

## ⚠️ Important Notes

- **Always include fallback text** for `t.html` helper
- **Use semantic image purposes** (hero, portrait, logo) for collection-image
- **Limit taxonomy tags** in card displays (3-4 max)
- **Check for data existence** before using helpers (e.g., `{% if brand.country %}`)
- **Use consistent class naming** when passing `class` parameters to helpers