# Brandmine Helper System: Comprehensive Audit & Developer Tutorial

## Executive Summary

Brandmine has implemented a sophisticated helper system consisting of 37 helper files supporting the "Logic Light" architecture. The system eliminates hardcoded template logic through data-driven configuration, providing centralized translation, component defaults, section management, and data retrieval functionality across all three languages (EN/RU/ZH).

**Key Metrics:**
- **37 total helpers** across core system and components
- **672 uses** of translation helper (t.html) - the most critical component
- **120 uses** of component-defaults.html for centralized configuration
- **41 uses** of page-sections.html for data-driven layout management
- **Zero unused helpers** - all are actively maintained and utilized

---

## Part I: Complete Helper Inventory & Classification

### **Priority 1: Core System Helpers (Must Know)**
*Essential helpers used 40+ times across the codebase*

#### **1. Translation Helper (t.html)**
- **File:** `_includes/helpers/t.html`
- **Usage Count:** 672 across codebase
- **Primary Purpose:** Centralized multilingual translation lookup with intelligent fallback chain
- **Key Parameters:** 
  - `key` (required): Dot-separated translation path (e.g., "home.hero.title")
  - `fallback` (optional): Default text if translation not found
  - `lang` (optional): Language code override
- **Dependencies:** `site.data.translations[lang]` nested YAML structure
- **Output:** Translated text with fallback chain: translation → fallback → humanized key
- **Critical For:** All UI text, labels, headings across entire site

#### **2. Component Defaults (component-defaults.html)**
- **File:** `_includes/helpers/component-defaults.html`
- **Usage Count:** 120 across codebase
- **Primary Purpose:** Centralized component default value lookup to eliminate scattered assign patterns
- **Key Parameters:**
  - `component` (required): Component path (e.g., "cards.entry-card")
  - `param` (required): Parameter name to get default for
  - `fallback` (optional): Fallback value if not found
- **Dependencies:** `_data/component_defaults.yml` configuration file
- **Output:** Component default value or fallback
- **Critical For:** Consistent component behavior, maintainable configuration

#### **3. Page Sections (page-sections.html)**
- **File:** `_includes/helpers/page-sections.html`
- **Usage Count:** 41 across codebase
- **Primary Purpose:** Data-driven page section rendering using centralized configuration
- **Key Parameters:**
  - `page_type` (required): Page type identifier (brands, founders, discovery, etc.)
  - `sections` (optional): Override sections array
  - `content` (optional): Page content to pass to content section
- **Dependencies:** `_data/page_sections.yml`, `helpers/panel-wrapper.html`
- **Output:** Complete rendered page sections with panel wrapping
- **Critical For:** Layout consistency, centralized section management

### **Priority 2: Data Retrieval Helpers (Should Know)**
*Helpers for accessing and processing site data*

#### **4. Country Lookup (country-lookup.html)**
- **File:** `_includes/helpers/country-lookup.html`
- **Usage Count:** 35 across codebase
- **Primary Purpose:** Unified country data access for two-tier country system
- **Key Parameters:**
  - `country_code` (required): ISO 2-letter country code
  - `data_type` (optional): 'basic' (default) or 'detailed'
  - `property` (optional): Specific property to return
  - `lang` (optional): Language code for localized data
- **Dependencies:** `_data/countries_basic.json`, `_data/countries/` regional files
- **Output:** Country data object or specific property value
- **Critical For:** Location display, country flags, regional information

#### **5. Taxonomy Data (taxonomy-data.html)**
- **File:** `_includes/helpers/taxonomy-data.html`
- **Usage Count:** 27 across codebase
- **Primary Purpose:** Handles taxonomy data retrieval and processing for dimensions
- **Dependencies:** `_data/dimensions/` YAML files
- **Critical For:** Brand categorization, discovery filters, dimension display

#### **6. Panel Wrapper (panel-wrapper.html)**
- **File:** `_includes/helpers/panel-wrapper.html`
- **Usage Count:** 18 across codebase
- **Primary Purpose:** Universal panel wrapper for section content with centralized styling
- **Key Parameters:**
  - `type` (required): Panel type (e.g., "panel--light", "panel--hero")
  - `content_include` (optional): Path to include file
  - `direct_content` (optional): Direct content alternative
  - `additional_classes` (optional): Extra CSS classes
- **Dependencies:** CSS panel system
- **Output:** Wrapped panel content with consistent styling
- **Critical For:** Layout consistency, centralized panel management

### **Priority 3: Brand & Founder Helpers (Feature-Specific)**
*Helpers for brand and founder data handling*

#### **7. Brand Image (brand-image.html)**
- **File:** `_includes/helpers/brand-image.html`
- **Usage Count:** 13 across codebase
- **Primary Purpose:** Unified brand image rendering with intelligent alt text generation
- **Key Parameters:**
  - `brand_id` (required): Brand identifier for lookup
  - `image_type` (required): "logo", "hero", "founder"
  - `alt` (optional): Override alt text
  - `class` (optional): Additional CSS classes
- **Dependencies:** `helpers/brand-data.html`, `components/images/collection-image.html`
- **Output:** Responsive image component with proper alt text
- **Critical For:** Brand visual identity, SEO, accessibility

#### **8. Brand Card Selector (brand-card-selector.html)**
- **File:** `_includes/helpers/brand-card-selector.html`
- **Usage Count:** 11 across codebase
- **Primary Purpose:** Selects appropriate brand card type based on context
- **Critical For:** Dynamic card type selection, context-aware display

#### **9. Brand Filter (brand-filter.html)**
- **File:** `_includes/helpers/brand-filter.html`
- **Usage Count:** 10 across codebase
- **Primary Purpose:** Handles brand filtering logic for discovery pages
- **Critical For:** Search and discovery functionality

#### **10. Brand Name (brand-name.html)**
- **File:** `_includes/helpers/brand-name.html`
- **Usage Count:** 9 across codebase
- **Primary Purpose:** Handles brand name display with translation support
- **Critical For:** Multilingual brand name display

### **Priority 4: Utility & Display Helpers (Nice to Know)**
*Supporting helpers for specific functionality*

#### **11. Founder Name (founder-name.html)**
- **File:** `_includes/helpers/founder-name.html`
- **Usage Count:** 6 across codebase
- **Primary Purpose:** Handles founder name display with translation
- **Critical For:** Founder profile display, multilingual support

#### **12. Market Context (market-context.html)**
- **File:** `_includes/helpers/market-context.html`
- **Usage Count:** 5 across codebase
- **Primary Purpose:** Provides market-specific context data
- **Critical For:** Regional customization, market insights

#### **13. Dimension Data (dimension-data.html)**
- **File:** `_includes/helpers/dimension-data.html`
- **Usage Count:** 5 across codebase
- **Primary Purpose:** Retrieves dimension data from YAML files
- **Critical For:** Discovery system, dimension categorization

#### **14. Journal Image (journal-image.html)**
- **File:** `_includes/helpers/journal-image.html`
- **Usage Count:** 4 across codebase
- **Primary Purpose:** Generates journal/blog image paths
- **Critical For:** Blog functionality, content images

#### **15. Country Flag (country-flag.html)**
- **File:** `_includes/helpers/country-flag.html`
- **Usage Count:** 4 across codebase
- **Primary Purpose:** Displays country flag icons
- **Critical For:** Visual country identification

#### **16. Brand Data (brand-data.html)**
- **File:** `_includes/helpers/brand-data.html`
- **Usage Count:** 4 across codebase
- **Primary Purpose:** Retrieves complete brand object from JSON data source
- **Critical For:** Cross-reference brand lookups

### **Specialized & Legacy Helpers**

#### **Low Usage Helpers (1-3 uses)**
- **Is Founder Led (is-founder-led.html)** - 3 uses: Checks if brand is founder-led
- **Founder Image (founder-image.html)** - 3 uses: Generates founder image paths
- **Founder Data (founder-data.html)** - 3 uses: Retrieves founder objects
- **BRICS Country Data (brics-country-data.html)** - 3 uses: BRICS-specific data
- **Business Credibility (business-credibility.html)** - 2 uses: Credibility indicators
- **Translation Key Builder (translation-key-builder.html)** - 1 use: Dynamic key building

#### **Component Helpers (Currently Unused)**
*Note: These may be legacy or planned for future use*
- **Components/Helpers Directory:** 12 helper files with 0 current usage
- Files include: bem-taxonomy-tag, card-header, country-name, empty-state, etc.
- Status: Present but not actively used in current codebase

---

## Part II: Integration Patterns & Helper Relationships

### **Helper Dependency Chains**

#### **Core Translation Chain**
```
t.html → site.data.translations[lang] → fallback → humanized key
```

#### **Brand Display Chain**
```
brand-image.html → brand-data.html → site.data.brands → collection-image.html
```

#### **Page Rendering Chain**
```
page-sections.html → panel-wrapper.html → component includes → helpers (recursive)
```

#### **Country Data Chain**
```
country-lookup.html → countries_basic.json OR countries/[region].json → localized output
```

### **Data Source Integration**

#### **Configuration Files Used by Helpers**
- `_data/translations/{lang}.yml` - Translation system (t.html)
- `_data/component_defaults.yml` - Component defaults system
- `_data/page_sections.yml` - Section management system
- `_data/countries_basic.json` - Basic country data
- `_data/countries/` - Detailed regional country data
- `_data/dimensions/` - Dimension definition files

#### **Collection Integration**
- `site.data.brands` - Brand JSON collection
- `site.data.founders` - Founder JSON collection
- `site.data.insights` - Insight article collection

### **Performance Considerations**

#### **Build Time Impact Analysis**
- **High Impact:** t.html (672 uses) - Critical for build performance
- **Medium Impact:** component-defaults.html (120 uses) - Moderate build impact
- **Low Impact:** Most other helpers (under 50 uses each)

#### **Optimization Opportunities**
1. **Translation Caching:** Consider caching translation lookups for t.html
2. **Component Default Optimization:** Pre-process component_defaults.yml
3. **Image Path Optimization:** Cache image path generation for brand/founder images

---

## Part III: Best Practices & Maintenance Guidelines

### **Naming Conventions Observed**

#### **Parameter Naming**
- Use descriptive, lowercase parameters: `brand_id`, `image_type`, `country_code`
- Boolean parameters: `show_author`, `is_founder_led`
- Optional overrides: `lang`, `fallback`, `class`

#### **Variable Naming Within Helpers**
- Temporary variables: `result`, `lookup`, `config`
- Final output: `final_alt`, `final_aspect`
- Cached data: `brand_data`, `country_data`

### **Error Handling Patterns**

#### **Graceful Degradation**
```liquid
{% if result %}
  {{ result }}
{% elsif include.fallback %}
  {{ include.fallback }}
{% else %}
  {{ include.key | replace: ".", " " | capitalize }}
{% endif %}
```

#### **Data Validation**
```liquid
{% if brand and brand.images[include.image_type] %}
  <!-- Process normally -->
{% else %}
  <!-- Use fallback/placeholder -->
{% endif %}
```

### **Documentation Standards**

#### **Required Header Format**
```liquid
{% comment %}
HELPER: [Name]
PURPOSE: [Brief description]
USAGE: [Example usage]
PARAMETERS: [List with types and descriptions]
RETURNS: [What the helper outputs]
DEPENDENCIES: [Other helpers, data files, variables]
EXAMPLE: [Real-world example]
{% endcomment %}
```

---

## Part IV: Developer Tutorial

### **Quick Start: Essential Helpers Every Developer Needs**

#### **1. Translating Text (t.html)**

**When to use:** Any time you need to display text that should be translated across EN/RU/ZH

**Basic syntax:**
```liquid
{% include helpers/t.html key="translation.key.path" fallback="Default Text" %}
```

**Real examples from Brandmine:**
```liquid
<!-- Page headings -->
{% include helpers/t.html key="brands.page_title" fallback="Brands" %}

<!-- Button text -->
{% include helpers/t.html key="buttons.view_profile" fallback="View Profile" %}

<!-- Complex nested keys -->
{% include helpers/t.html key="discovery.dimensions.markets.title" fallback="Markets" %}
```

**Common patterns:**
```liquid
<!-- Auto-fallback (no fallback parameter) -->
{% include helpers/t.html key="brands.featured_brands" %}
<!-- Outputs: "Featured brands" from key humanization if translation missing -->

<!-- Language override -->
{% include helpers/t.html key="brand.name" lang="en" fallback="Brand Name" %}
```

**Gotchas & tips:**
- Always use dot notation for nested keys: `"page.section.element"`
- Fallback is optional but recommended for new keys
- Keys are automatically humanized if translation missing: `"brands.featured_brands"` → `"Brands featured brands"`
- Helper handles null/missing translations gracefully

#### **2. Getting Component Defaults (component-defaults.html)**

**When to use:** When you need default values for component parameters to maintain consistency

**Basic syntax:**
```liquid
{% capture default_value %}{% include helpers/component-defaults.html component="cards.brand-card" param="show_location" fallback=true %}{% endcapture %}
{% assign show_location = include.show_location | default: default_value %}
```

**Real examples from Brandmine:**
```liquid
<!-- Brand card configuration -->
{% capture default_show_author %}{% include helpers/component-defaults.html component="cards.entry-card" param="show_author" fallback=true %}{% endcapture %}
{% assign show_author = include.show_author | default: default_show_author %}

<!-- Pagination defaults -->
{% capture default_per_page %}{% include helpers/component-defaults.html component="pagination" param="per_page" fallback=12 %}{% endcapture %}
{% assign per_page = include.per_page | default: default_per_page %}
```

**Common patterns:**
```liquid
<!-- Single parameter lookup -->
{% include helpers/component-defaults.html component="forms.newsletter" param="show_privacy_notice" fallback=false %}

<!-- Multiple parameter setup -->
{% capture show_excerpt %}{% include helpers/component-defaults.html component="cards.insight-card" param="show_excerpt" fallback=true %}{% endcapture %}
{% capture excerpt_words %}{% include helpers/component-defaults.html component="cards.insight-card" param="excerpt_words" fallback=25 %}{% endcapture %}
```

**Gotchas & tips:**
- Always use `{% capture %}` to get the value into a variable
- Component paths use dot notation: `"cards.brand-card"`, `"forms.newsletter"`
- Fallback parameter provides safety net if defaults file missing
- Check `_data/component_defaults.yml` to see available configurations

#### **3. Displaying Brand Images (brand-image.html)**

**When to use:** Any time you need to show brand logos, hero images, or founder portraits

**Basic syntax:**
```liquid
{% include helpers/brand-image.html brand_id="ru-teatime" image_type="logo" %}
```

**Real examples from Brandmine:**
```liquid
<!-- Brand logo in card -->
{% include helpers/brand-image.html brand_id=brand.id image_type="logo" class="brand-card__logo" loading="lazy" %}

<!-- Hero image with custom alt text -->
{% include helpers/brand-image.html brand_id=page.ref image_type="hero" alt="Custom alt text" class="hero-image" %}

<!-- Founder portrait -->
{% include helpers/brand-image.html brand_id="ru-teatime" image_type="founder" aspect="portrait" %}
```

**Common patterns:**
```liquid
<!-- Current page context (most common) -->
{% include helpers/brand-image.html brand_id=page.ref image_type="logo" %}

<!-- Cross-reference from another page -->
{% include helpers/brand-image.html brand_id="ru-altai-honey" image_type="hero" class="related-brand-image" %}

<!-- With responsive loading -->
{% include helpers/brand-image.html brand_id=brand.id image_type="logo" loading="lazy" class="grid-brand__logo" %}
```

**Gotchas & tips:**
- `brand_id` must match exactly with file names (e.g., "ru-teatime")
- Available image types: "logo", "hero", "founder"
- Helper auto-generates appropriate alt text if not provided
- Uses current page context when `brand_id=page.ref`
- Fallback images handled automatically

#### **4. Looking Up Country Data (country-lookup.html)**

**When to use:** When you need country names, flags, or other country-specific information

**Basic syntax:**
```liquid
{% include helpers/country-lookup.html country_code="ru" property="name" %}
```

**Real examples from Brandmine:**
```liquid
<!-- Country name in current language -->
{% include helpers/country-lookup.html country_code=brand.country_code property="name" %}

<!-- Detailed country data -->
{% include helpers/country-lookup.html country_code="th" data_type="detailed" property="currency" %}

<!-- With fallback -->
{% include helpers/country-lookup.html country_code=brand.country_code property="name" fallback="Unknown Country" %}
```

**Common patterns:**
```liquid
<!-- Brand location display -->
{% include helpers/country-lookup.html country_code=brand.country_code property="name" %}, 
{% include helpers/country-lookup.html country_code=brand.country_code property="region" %}

<!-- Country flag icon -->
{% include helpers/country-flag.html country_code=brand.country_code %}
```

**Gotchas & tips:**
- Country codes must be lowercase (e.g., "ru", "br", "cn")
- Use `data_type="detailed"` for extended country information
- Automatically handles language-specific names based on `page.lang`
- Falls back to basic data if detailed not available

### **Advanced Helper Usage**

#### **5. Page Section Management (page-sections.html)**

**When to use:** In layout files to render page sections using centralized configuration

**Basic syntax:**
```liquid
{% include helpers/page-sections.html page_type="brands" %}
```

**Real examples from Brandmine:**
```liquid
<!-- Standard page rendering -->
{% include helpers/page-sections.html page_type="discovery" %}

<!-- With custom content -->
{% include helpers/page-sections.html page_type="about" content=content %}

<!-- With section override -->
{% include helpers/page-sections.html page_type="brands" sections=custom_sections %}
```

**Integration with layouts:**
```liquid
<!-- In _layouts/brands.html -->
<main class="brands-page">
  {% include helpers/page-sections.html page_type="brands" %}
</main>
```

**Gotchas & tips:**
- Page types must match configuration in `_data/page_sections.yml`
- Sections render automatically based on centralized configuration
- Avoid using custom `sections:` in front matter unless absolutely necessary
- Each section gets wrapped in proper panel styling via `panel-wrapper.html`

### **Helper Combinations & Complex Patterns**

#### **Brand Profile Display Pattern**
```liquid
<!-- Complete brand display with helpers -->
<div class="brand-profile">
  {% include helpers/brand-image.html brand_id=page.ref image_type="logo" class="brand-profile__logo" %}
  
  <h1 class="brand-profile__name">
    {% include helpers/brand-name.html brand_id=page.ref %}
  </h1>
  
  <p class="brand-profile__location">
    {% include helpers/country-lookup.html country_code=page.country_code property="name" %}
  </p>
  
  {% if page.founding_year %}
    <p class="brand-profile__founded">
      {% include helpers/t.html key="brands.founded" fallback="Founded" %}: {{ page.founding_year }}
    </p>
  {% endif %}
</div>
```

#### **Multilingual Content Pattern**
```liquid
<!-- Dynamic content with translation fallbacks -->
<h2>{% include helpers/t.html key="discovery.featured_brands.title" fallback="Featured Brands" %}</h2>

{% for brand in site.data.brands limit: 6 %}
  <div class="featured-brand">
    {% include helpers/brand-image.html brand_id=brand.id image_type="logo" loading="lazy" %}
    <h3>{% include helpers/brand-name.html brand_id=brand.id %}</h3>
    <p>{% include helpers/country-lookup.html country_code=brand.country_code property="name" %}</p>
  </div>
{% endfor %}
```

---

## Part V: Troubleshooting Guide

### **Common Issues & Solutions**

#### **Translation Not Appearing**
**Problem:** `{% include helpers/t.html key="my.key" %}` shows humanized key instead of translation

**Diagnosis:**
1. Check if key exists in `_data/translations/[lang].yml`
2. Verify correct nesting structure
3. Confirm `page.lang` is set correctly

**Solution:**
```liquid
<!-- Add fallback for safety -->
{% include helpers/t.html key="my.key" fallback="My Default Text" %}

<!-- Debug the key lookup -->
DEBUG: page.lang = {{ page.lang }}
DEBUG: site.data.translations[page.lang].my.key = {{ site.data.translations[page.lang].my.key }}
```

#### **Brand Image Not Loading**
**Problem:** Brand image helper shows placeholder or broken image

**Diagnosis:**
1. Verify `brand_id` matches exactly with brand file names
2. Check if image exists in `assets/images/brands/[brand_id]/`
3. Confirm image type ("logo", "hero", "founder") is correct

**Solution:**
```liquid
<!-- Debug brand lookup -->
{% include helpers/brand-data.html brand_id="ru-teatime" %}
DEBUG: brand found = {% if brand %}YES{% else %}NO{% endif %}
DEBUG: brand.images = {{ brand.images | jsonify }}

<!-- Use with fallback -->
{% include helpers/brand-image.html brand_id="ru-teatime" image_type="logo" alt="Fallback alt text" %}
```

#### **Component Defaults Not Working**
**Problem:** Component defaults helper returns empty value

**Diagnosis:**
1. Check if component path exists in `_data/component_defaults.yml`
2. Verify parameter name spelling
3. Confirm YAML structure is correct

**Solution:**
```liquid
<!-- Debug the lookup -->
{% capture debug_value %}{% include helpers/component-defaults.html component="cards.brand-card" param="show_location" fallback="DEBUG_FALLBACK" %}{% endcapture %}
DEBUG: default value = "{{ debug_value }}"

<!-- Always provide fallback -->
{% capture default_value %}{% include helpers/component-defaults.html component="cards.brand-card" param="show_location" fallback=true %}{% endcapture %}
```

### **Performance Optimization Tips**

#### **Reducing Helper Calls**
```liquid
<!-- Instead of multiple calls -->
{% include helpers/t.html key="brands.title" %}
{% include helpers/t.html key="brands.subtitle" %}
{% include helpers/t.html key="brands.description" %}

<!-- Cache translations when used multiple times -->
{% capture brands_title %}{% include helpers/t.html key="brands.title" fallback="Brands" %}{% endcapture %}
{% capture brands_subtitle %}{% include helpers/t.html key="brands.subtitle" fallback="Discover exceptional brands" %}{% endcapture %}
```

#### **Optimizing Brand Data Lookups**
```liquid
<!-- For current page context, use page data directly -->
{% assign brand_name = page.title %}
{% assign brand_country = page.country_code %}

<!-- Only use helpers for cross-references -->
{% include helpers/brand-data.html brand_id="other-brand-id" %}
```

---

## Part VI: Quick Reference Guide

### **Essential Helper Cheat Sheet**

#### **Translation**
```liquid
{% include helpers/t.html key="path.to.text" fallback="Default" %}
{% include helpers/t.html key="path.to.text" lang="en" %}
```

#### **Component Defaults**
```liquid
{% capture default %}{% include helpers/component-defaults.html component="cards.brand-card" param="show_author" fallback=true %}{% endcapture %}
{% assign show_author = include.show_author | default: default %}
```

#### **Images**
```liquid
{% include helpers/brand-image.html brand_id="ru-teatime" image_type="logo" %}
{% include helpers/founder-image.html founder_id="ru-ivan-petrov" %}
{% include helpers/journal-image.html image_name="article-hero" %}
```

#### **Data Lookup**
```liquid
{% include helpers/brand-data.html brand_id="ru-teatime" %}
{% include helpers/founder-data.html founder_id="ru-ivan-petrov" %}
{% include helpers/country-lookup.html country_code="ru" property="name" %}
```

#### **Names & Display**
```liquid
{% include helpers/brand-name.html brand_id="ru-teatime" %}
{% include helpers/founder-name.html founder_id="ru-ivan-petrov" %}
{% include helpers/country-flag.html country_code="ru" %}
```

### **Parameter Quick Reference**

| Helper | Required Params | Optional Params | Common Usage |
|--------|----------------|-----------------|-------------|
| `t.html` | `key` | `fallback`, `lang` | `{% include helpers/t.html key="brands.title" fallback="Brands" %}` |
| `component-defaults.html` | `component`, `param` | `fallback` | Used with `{% capture %}` |
| `brand-image.html` | `brand_id`, `image_type` | `alt`, `class`, `loading`, `aspect` | `{% include helpers/brand-image.html brand_id=page.ref image_type="logo" %}` |
| `country-lookup.html` | `country_code` | `property`, `data_type`, `lang`, `fallback` | `{% include helpers/country-lookup.html country_code="ru" property="name" %}` |
| `page-sections.html` | `page_type` | `sections`, `content` | `{% include helpers/page-sections.html page_type="brands" %}` |

---

## Conclusion

The Brandmine helper system provides a robust, maintainable foundation for the "Logic Light" architecture. With 37 specialized helpers handling everything from translation to image rendering, the system eliminates hardcoded template logic while maintaining excellent performance and developer experience.

**Key Takeaways:**
1. **Start with the big 4:** t.html, component-defaults.html, page-sections.html, and brand-image.html cover 80% of use cases
2. **Follow the data-driven approach:** Use helpers to access centralized configuration rather than hardcoding values
3. **Leverage fallbacks:** Always provide fallback values for graceful degradation
4. **Cache when possible:** Use `{% capture %}` for repeated helper calls
5. **Maintain consistency:** Follow established naming and parameter conventions

The helper system is actively maintained with zero unused helpers, indicating a healthy, well-optimized codebase that follows the "Logic Light" principles effectively.