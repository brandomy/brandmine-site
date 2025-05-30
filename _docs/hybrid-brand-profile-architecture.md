# Hybrid Brand Profile Architecture

## Executive Summary

The Brandmine platform implements a **hybrid YAML + JSON architecture** for rendering multilingual brand profiles that showcase founder-led brands from BRICS+ countries. This system supports two distinct profile types:

- **Curated YAML Profiles**: Rich, human-curated brand stories with founder narratives, detailed content, and complete business intelligence
- **JSON-Only Profiles**: Scalable basic profiles imported from Airtable or similar data sources for rapid content expansion

The architecture uses a single `brand-profile.html` layout with intelligent data source detection, consistent section rendering, and graceful fallback handling. This enables immediate scaling with thousands of basic profiles while maintaining the ability to showcase premium brands with compelling narratives.

**Key Benefits:**
- Scale rapidly with automated JSON imports
- Maintain narrative quality for featured brands  
- Consistent presentation across profile types
- Seamless upgrade path from basic to curated profiles
- Full trilingual support (EN/RU/ZH)

---

## Brand Profile Layout (`_layouts/brand-profile.html`)

```liquid
---
layout: default
---
{% comment %}
  Hybrid Brand Profile Layout
  
  Supports both:
  1. Curated YAML profiles (rich content + structured data)
  2. JSON-only profiles (basic structured data only)
  
  Data source detection:
  - YAML profiles have page.title defined
  - JSON-only profiles use page.ref to lookup site.data.brands
{% endcomment %}

{% comment %} Determine data source and create unified brand object {% endcomment %}
{% if page.title %}
  {% comment %} This is a curated YAML brand profile {% endcomment %}
  {% assign brand = page %}
  {% assign data_source = "curated" %}
  {% assign brand_ref = page.ref %}
{% else %}
  {% comment %} This is a basic JSON-only brand {% endcomment %}
  {% assign brand_ref = page.ref %}
  {% assign brand = site.data.brands.brands | where: "ref", brand_ref | first %}
  {% assign data_source = "basic" %}
{% endif %}

{% comment %} Fallback if brand not found in either source {% endcomment %}
{% unless brand %}
  <div class="panel panel--light">
    <div class="panel__content">
      <h1>Brand Not Found</h1>
      <p>The requested brand profile could not be located.</p>
      <a href="{{ site.baseurl }}/{{ page.lang }}/brands/" class="btn btn--primary">← Back to Brands</a>
    </div>
  </div>
  {% assign brand = null %}
{% endunless %}

{% if brand %}
  {% comment %} Set sections based on data completeness and availability {% endcomment %}
  {% if data_source == "curated" %}
    {% assign default_sections = "identity,founder-narrative,content,business-intelligence,location-intelligence,connections" | split: "," %}
    {% assign sections_to_render = page.sections | default: default_sections %}
  {% else %}
    {% assign sections_to_render = "identity,business-intelligence,location-intelligence,connections" | split: "," %}
  {% endif %}

  {% comment %} Add breadcrumbs for all profiles {% endcomment %}
  {% include components/ui/breadcrumbs.html %}

  <div class="brand-profile brand-profile--{{ data_source }}">
    {% for section in sections_to_render %}
      {% if section == "content" and data_source == "curated" %}
        {% comment %} Display markdown content for curated profiles only {% endcomment %}
        <section class="brand-section brand-section--content">
          <div class="panel panel--light">
            <div class="panel__content">
              <div class="brand-content">
                {{ content }}
              </div>
            </div>
          </div>
        </section>
      {% else %}
        {% comment %} Display structured data sections {% endcomment %}
        <section class="brand-section brand-section--{{ section }}" 
                 id="brand-section-{{ section }}"
                 aria-labelledby="heading-{{ section }}">
          {% include pages/brand/{{ section }}.html 
            brand=brand 
            data_source=data_source 
            brand_ref=brand_ref %}
        </section>
      {% endif %}
    {% endfor %}
  </div>

  {% comment %} Conditional scripts based on section presence {% endcomment %}
  {% if sections_to_render contains 'location-intelligence' %}
    <script src="{{ '/assets/js/pages/brand/brand-map.js' | relative_url }}"></script>
  {% endif %}
{% endif %}
```

---

## Include File Definitions

### Identity Section (`_includes/pages/brand/identity.html`)

```liquid
{% comment %}
  Brand Identity Section
  Displays: Brand name, tagline, founding info, basic meta
  Supports: Both YAML and JSON data sources
{% endcomment %}

{% assign brand = include.brand %}
{% assign data_source = include.data_source | default: "curated" %}

{% comment %} Field mapping: YAML → JSON fallback {% endcomment %}
{% assign brand_name = brand.title | default: brand.name %}
{% assign brand_description = brand.description %}
{% assign brand_slogan = brand.slogan %}
{% assign founding_year = brand.founding_year | default: brand.founded %}
{% assign website = brand.website %}

<div class="panel panel--hero">
  <div class="panel__content">
    <div class="brand-identity">
      <div class="brand-identity__header">
        <h1 id="heading-identity" class="brand-identity__name">{{ brand_name }}</h1>
        {% if brand_slogan %}
          <p class="brand-identity__slogan">{{ brand_slogan }}</p>
        {% endif %}
        {% if brand_description %}
          <p class="brand-identity__description">{{ brand_description }}</p>
        {% endif %}
        
        {% comment %} Data source indicator {% endcomment %}
        {% if data_source == "basic" %}
          <span class="data-badge data-badge--basic">Basic Profile</span>
        {% endif %}
      </div>
      
      <div class="brand-identity__meta">
        {% if founding_year %}
        <div class="meta-item">
          <span class="meta-label">{{ site.data.translations[brand.lang].brand.founding_year | default: "Founded" }}:</span>
          <span class="meta-value">{{ founding_year }}</span>
        </div>
        {% endif %}
        
        {% if brand.location %}
        <div class="meta-item">
          <span class="meta-label">{{ site.data.translations[brand.lang].brand.location | default: "Location" }}:</span>
          <span class="meta-value">
            {{ brand.location.city }}{% if brand.location.region %}, {{ brand.location.region }}{% endif %}
          </span>
        </div>
        {% endif %}
        
        {% if website %}
        <div class="meta-item">
          <span class="meta-label">{{ site.data.translations[brand.lang].brand.website | default: "Website" }}:</span>
          <a href="{{ website }}" target="_blank" class="meta-value meta-link">{{ website | remove: 'https://' | remove: 'http://' }}</a>
        </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>
```

### Founder Narrative Section (`_includes/pages/brand/founder-narrative.html`)

```liquid
{% comment %}
  Founder Narrative Section
  Displays: Founder information, leadership status, generational context
  Supports: Both YAML and JSON data sources
{% endcomment %}

{% assign brand = include.brand %}
{% assign data_source = include.data_source | default: "curated" %}

{% comment %} Check if we have founder information {% endcomment %}
{% assign has_founders = false %}
{% if brand.founders and brand.founders.size > 0 %}
  {% assign has_founders = true %}
{% endif %}

{% if has_founders or brand.founder_led %}
<div class="panel panel--secondary-soft">
  <div class="panel__content">
    <h2 id="heading-founder-narrative" class="panel__heading-secondary">
      {{ site.data.translations[brand.lang].brand.founders_journey | default: "Founder Leadership" }}
    </h2>
    
    <div class="founder-narrative">
      {% if has_founders %}
        <div class="founder-list">
          {% for founder_key in brand.founders %}
            {% comment %} Look up founder in founders.json {% endcomment %}
            {% assign founder = site.data.founders.founders | where: "ref", founder_key | first %}
            {% if founder %}
            <div class="founder-card">
              <div class="founder-card__header">
                <h3 class="founder-card__name">{{ founder.name }}</h3>
                {% if founder.position %}
                  <p class="founder-card__title">{{ founder.position }}</p>
                {% endif %}
              </div>
              
              {% if founder.brief_bio %}
                <p class="founder-card__bio">{{ founder.brief_bio }}</p>
              {% endif %}
              
              {% if founder.generation %}
              <div class="founder-card__meta">
                <span class="meta-label">{{ site.data.translations[brand.lang].brand.generation | default: "Generation" }}:</span>
                <span class="meta-value">{{ founder.generation | capitalize }}</span>
              </div>
              {% endif %}
            </div>
            {% endif %}
          {% endfor %}
        </div>
      {% endif %}
      
      {% if brand.founder_led %}
        <div class="founder-status">
          <span class="status-badge status-badge--active">
            {{ site.data.translations[brand.lang].attributes.founder-led | default: "Founder-Led" }}
          </span>
        </div>
      {% endif %}
    </div>
  </div>
</div>
{% endif %}
```

### Business Intelligence Section (`_includes/pages/brand/business-intelligence.html`)

```liquid
{% comment %}
  Business Intelligence Section
  Displays: Growth signals, export readiness, business opportunities
  Supports: Both YAML and JSON data sources
{% endcomment %}

{% assign brand = include.brand %}
{% assign data_source = include.data_source | default: "curated" %}

<div class="panel panel--accent-soft">
  <div class="panel__content">
    <h2 id="heading-business-intelligence" class="panel__heading-secondary">
      {{ site.data.translations[brand.lang].discover.business_opportunities | default: "Business Opportunities" }}
    </h2>
    
    <div class="business-intelligence">
      {% comment %} Export Readiness {% endcomment %}
      {% if brand.export_ready or brand.export_markets %}
      <div class="business-signal business-signal--export">
        <h3 class="business-signal__title">
          {{ site.data.translations[brand.lang].brand.export_ready | default: "Export Ready" }}
        </h3>
        {% if brand.export_markets and brand.export_markets.size > 0 %}
          <p class="business-signal__description">
            {{ site.data.translations[brand.lang].brand.currently_exporting | default: "Currently exporting to" }}:
            {% for market_code in brand.export_markets %}
              {% assign market_name = site.data.countries.countries[market_code].name[brand.lang] | default: market_code %}
              {{ market_name }}{% unless forloop.last %}, {% endunless %}
            {% endfor %}
          </p>
        {% endif %}
      </div>
      {% endif %}
      
      {% comment %} Growth Signals {% endcomment %}
      {% if brand.signals and brand.signals.size > 0 %}
      <div class="growth-signals">
        <h3 class="growth-signals__title">
          {{ site.data.translations[brand.lang].tags.signals | default: "Growth Signals" }}
        </h3>
        <div class="growth-signals__list">
          {% for signal in brand.signals %}
            <span class="tag tag--signal">
              {{ site.data.translations[brand.lang].signals[signal] | default: signal | replace: '-', ' ' | capitalize }}
            </span>
          {% endfor %}
        </div>
      </div>
      {% endif %}
      
      {% comment %} Distribution Models {% endcomment %}
      {% if brand.distribution_models and brand.distribution_models.size > 0 %}
      <div class="distribution-info">
        <h3 class="distribution-info__title">
          {{ site.data.translations[brand.lang].brand.distribution_models | default: "Distribution Models" }}
        </h3>
        <div class="distribution-info__list">
          {% for model in brand.distribution_models %}
            <span class="tag tag--distribution">
              {{ site.data.translations[brand.lang].distribution_models[model] | default: model | replace: '-', ' ' | capitalize }}
            </span>
          {% endfor %}
        </div>
      </div>
      {% endif %}
    </div>
  </div>
</div>
```

### Location Intelligence Section (`_includes/pages/brand/location-intelligence.html`)

```liquid
{% comment %}
  Location Intelligence Section
  Displays: Interactive map, geographic context, regional significance
  Supports: Both YAML and JSON data sources
{% endcomment %}

{% assign brand = include.brand %}
{% assign data_source = include.data_source | default: "curated" %}

{% if brand.location and brand.location.lat and brand.location.lng %}
<div class="panel panel--sky-soft">
  <div class="panel__content">
    <h2 id="heading-location-intelligence" class="panel__heading-secondary">
      {{ site.data.translations[brand.lang].discover.location_intelligence | default: "Location Intelligence" }}
    </h2>
    
    <div class="location-intelligence">
      <div class="brand-map" 
           data-lat="{{ brand.location.lat }}" 
           data-lng="{{ brand.location.lng }}"
           data-brand-name="{{ brand.title | default: brand.name }}"
           data-brand-ref="{{ include.brand_ref }}">
        <div class="brand-map__container" id="brand-map-{{ include.brand_ref }}">
          <!-- Map will be initialized by JavaScript -->
        </div>
        <div class="brand-map__fallback">
          <p>{{ site.data.translations[brand.lang].discover.map_loading | default: "Loading interactive map..." }}</p>
        </div>
      </div>
      
      <div class="location-context">
        <div class="location-context__primary">
          <h3 class="location-context__title">
            {{ brand.location.city }}{% if brand.location.region %}, {{ brand.location.region }}{% endif %}
          </h3>
          <p class="location-context__country">
            {% assign country_name = site.data.countries.countries[brand.location.country].name[brand.lang] %}
            {{ country_name | default: brand.location.country }}
          </p>
        </div>
        
        {% if brand.location.coordinates %}
        <div class="location-context__coordinates">
          <span class="coordinates-label">{{ site.data.translations[brand.lang].brand.coordinates | default: "Coordinates" }}:</span>
          <span class="coordinates-value">{{ brand.location.lat }}, {{ brand.location.lng }}</span>
        </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>
{% endif %}
```

### Connections Section (`_includes/pages/brand/connections.html`)

```liquid
{% comment %}
  Connections Section
  Displays: Related brands, relevant insights, contact information
  Supports: Both YAML and JSON data sources
{% endcomment %}

{% assign brand = include.brand %}
{% assign data_source = include.data_source | default: "curated" %}

<div class="panel panel--light">
  <div class="panel__content">
    <h2 id="heading-connections" class="panel__heading-secondary">
      {{ site.data.translations[brand.lang].discover.connections | default: "Connections & Discovery" }}
    </h2>
    
    <div class="connections">
      {% comment %} Related Brands {% endcomment %}
      {% if brand.sectors or brand.markets or brand.attributes %}
      <div class="connections__section">
        <h3 class="connections__title">
          {{ site.data.translations[brand.lang].brand.related_brands | default: "Related Brands" }}
        </h3>
        
        {% comment %} Find brands with overlapping taxonomy {% endcomment %}
        {% assign related_brands = site.data.brands.brands | where_exp: "b", "b.ref != include.brand_ref" %}
        {% assign matching_brands = "" | split: "" %}
        
        {% for related_brand in related_brands limit: 6 %}
          {% assign has_match = false %}
          
          {% comment %} Check for sector overlap {% endcomment %}
          {% if brand.sectors %}
            {% for sector in brand.sectors %}
              {% if related_brand.sectors contains sector %}
                {% assign has_match = true %}
                {% break %}
              {% endif %}
            {% endfor %}
          {% endif %}
          
          {% comment %} Check for market overlap {% endcomment %}
          {% unless has_match %}
            {% if brand.markets %}
              {% for market in brand.markets %}
                {% if related_brand.markets contains market %}
                  {% assign has_match = true %}
                  {% break %}
                {% endif %}
              {% endfor %}
            {% endif %}
          {% endunless %}
          
          {% if has_match %}
            {% assign matching_brands = matching_brands | push: related_brand %}
          {% endif %}
        {% endfor %}
        
        {% if matching_brands.size > 0 %}
        <div class="related-brands">
          {% for related_brand in matching_brands limit: 3 %}
            <div class="brand-card brand-card--compact">
              <h4 class="brand-card__name">
                <a href="{{ site.baseurl }}/{{ brand.lang }}/brands/{{ related_brand.ref }}/">
                  {{ related_brand.name }}
                </a>
              </h4>
              {% if related_brand.description %}
                <p class="brand-card__description">{{ related_brand.description | truncate: 100 }}</p>
              {% endif %}
            </div>
          {% endfor %}
        </div>
        {% endif %}
      </div>
      {% endif %}
      
      {% comment %} Contact Information {% endcomment %}
      <div class="connections__section">
        <h3 class="connections__title">
          {{ site.data.translations[brand.lang].brand.contact | default: "Contact Information" }}
        </h3>
        
        <div class="contact-info">
          {% if brand.website %}
          <div class="contact-item">
            <span class="contact-label">{{ site.data.translations[brand.lang].brand.website | default: "Website" }}:</span>
            <a href="{{ brand.website }}" target="_blank" class="contact-link">{{ brand.website }}</a>
          </div>
          {% endif %}
          
          {% if brand.social_media %}
            {% for social_item in brand.social_media %}
              {% if social_item[1] and social_item[1] != "" %}
              <div class="contact-item">
                <span class="contact-label">{{ site.data.translations[brand.lang].social[social_item[0]] | default: social_item[0] | capitalize }}:</span>
                <a href="{{ social_item[1] }}" target="_blank" class="contact-link social-link social-link--{{ social_item[0] }}">
                  {{ social_item[1] | remove: 'https://' | remove: 'http://' }}
                </a>
              </div>
              {% endif %}
            {% endfor %}
          {% endif %}
        </div>
      </div>
    </div>
  </div>
</div>
```

---

## Front Matter Examples

### Curated YAML Profile Example

```yaml
---
layout: brand-profile
ref: ru-teatime
title: "TeaTime"
description: "Moscow's premium tea destination offering artisanal blends and exceptional tea ceremonies."
slogan: "Experience Tea, Authentically"
lang: en
permalink: /en/brands/ru-teatime/

# Section control - determines layout and content order
sections:
  - identity
  - founder-narrative
  - content              # Displays markdown content
  - business-intelligence
  - location-intelligence
  - connections

# Core Information
founding_year: 1998
website: "https://teatime.ru"
founders: ["ru-alexei-sokolov"]
founder_led: true

# Taxonomy
sectors: ["gourmet-foods"]
markets: ["russia"]
attributes: ["founder-led", "artisanal-excellence"]
signals: ["export-ready"]

# Location
location:
  lat: 55.7558
  lng: 37.6173
  city: "Moscow"
  region: "Moscow Oblast"
  country: "ru"

# Business Information
export_ready: true
export_markets: ["gb", "fr", "de", "jp", "sg"]
distribution_models: ["direct-export", "distributors"]

# Display Settings
featured: true
featured_level: 2
---

## About TeaTime

TeaTime has established itself as Moscow's premier artisanal tea brand, offering exceptional blends that combine traditional Russian tea culture with contemporary flavors and presentation...

## Founder's Journey

Alexei Sokolov discovered his passion for tea while traveling through China and India as a young entrepreneur...

## Market Presence

The brand operates three flagship tea houses in Moscow's cultural districts, along with a growing wholesale business...
```

### JSON-Only Basic Profile Example

```yaml
---
layout: brand-profile
ref: ru-brand-example  # Must match entry in site.data.brands.brands
lang: en
permalink: /en/brands/ru-brand-example/
---
```

**Corresponding JSON entry in `_data/brands.json`:**

```json
{
  "brands": [
    {
      "ref": "ru-brand-example",
      "name": "Example Russian Brand",
      "description": "Traditional Russian manufacturer of specialty products",
      "founded": 2010,
      "website": "https://example-brand.ru",
      "location": {
        "city": "Moscow",
        "region": "Moscow Oblast",
        "country": "ru",
        "lat": 55.7558,
        "lng": 37.6173
      },
      "sectors": ["gourmet-foods"],
      "markets": ["russia"],
      "attributes": ["founder-led"],
      "signals": ["export-ready"],
      "data_source": "basic"
    }
  ]
}
```

---

## Data Consistency & Upgrade Path

### Shared Field Names

| YAML Profile | JSON Data | Purpose |
|--------------|-----------|---------|
| `title` | `name` | Brand display name |
| `founding_year` | `founded` | Year established |
| `founders[]` | `founders[]` | Array of founder references |
| `sectors[]` | `sectors[]` | Business sectors (taxonomy) |
| `markets[]` | `markets[]` | Geographic markets (taxonomy) |
| `attributes[]` | `attributes[]` | Brand attributes (taxonomy) |
| `signals[]` | `signals[]` | Growth signals (taxonomy) |
| `location{}` | `location{}` | Geographic coordinates and address |

### Upgrade Process

To upgrade a brand from JSON-only to curated YAML profile:

1. **Create YAML file**: `_brands/en/ru-brand-example.md`
2. **Copy JSON data** into YAML front matter
3. **Add rich content**: founder narrative, detailed sections, markdown content
4. **Maintain same `ref`**: Preserves URL consistency (`/en/brands/ru-brand-example/`)
5. **Update sections**: Add "content" and other rich sections
6. **Keep JSON entry**: Can serve as fallback or for API endpoints

The hybrid system automatically detects YAML presence and renders the curated version while maintaining all links and references.

---

## Implementation Roadmap

### Phase 1: Core Infrastructure (Week 1-2)
- [ ] Implement `brand-profile.html` layout with hybrid detection
- [ ] Create core section includes (`identity.html`, `business-intelligence.html`)
- [ ] Test with existing YAML brand profiles
- [ ] Verify section rendering and data fallback logic

### Phase 2: JSON Integration (Week 3-4)
- [ ] Structure `_data/brands.json` with required fields
- [ ] Create JSON-only brand page templates
- [ ] Test hybrid data augmentation and field mapping
- [ ] Implement related brands discovery logic

### Phase 3: Enhanced Features (Week 5-6)
- [ ] Add `location-intelligence.html` with MapLibre integration
- [ ] Implement `connections.html` with related content discovery
- [ ] Add visual indicators for profile types and data completeness
- [ ] Create founder lookup integration with `founders.json`

### Phase 4: Scale & Polish (Week 7-8)
- [ ] Import large datasets from Airtable to JSON
- [ ] Implement upgrade workflows from JSON to YAML
- [ ] Add multi-language support for all field mappings
- [ ] Performance optimization for large brand datasets

---

## Final Notes

### Multilingual Support
- All section includes support `brand.lang` for translation lookup
- Field names remain consistent across languages
- Translation keys follow established patterns in `_data/translations/`

### Future Integrations
- **Airtable API**: JSON structure ready for direct import from structured data sources
- **MapLibre Integration**: Location intelligence section prepared for interactive maps
- **Search & Filtering**: Consistent taxonomy structure supports advanced filtering

### Data Quality Management
- Clear visual indicators distinguish curated vs. basic profiles
- Graceful handling of missing fields prevents layout breaks
- Upgrade path maintains SEO and link integrity

This architecture provides the foundation for both immediate scaling with automated imports and long-term editorial excellence with curated brand storytelling.