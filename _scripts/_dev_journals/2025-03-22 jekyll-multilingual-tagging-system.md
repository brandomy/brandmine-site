# 2025-03-22: Implementing a Multi-Language Tag Translation System

## Problem Statement

The Brandmine website used a scattered approach for multilingual tag management, with tag translations spread across multiple files and locations. This created several challenges:

1. **Inconsistency risks**: Without a central reference, translations could become inconsistent across the site
2. **Maintenance complexity**: Updates to tag names required changes in multiple locations
3. **Expansion difficulties**: Adding new tags or languages was cumbersome and error-prone
4. **Duplication**: The same translations were often repeated in multiple files

The site had four distinct tag dimensions that needed to be managed across three languages (English, Russian, Chinese):

- 16 sector tags (product categories)
- 8 attribute tags (brand qualities)
- 4 growth signal tags (business readiness indicators)
- 5 country tags (BRICS nations)

This resulted in 33 unique tags that needed 99 total translations, making a more efficient system necessary.

## Approach

We implemented a centralized tag translation system using a single YAML file as the source of truth for all tag translations. This approach:

1. Creates a dedicated `tag_translations.yml` file in the `_data` directory
2. Organizes tags hierarchically by category (sectors, attributes, growth, countries)
3. Uses hyphenated tag IDs (e.g., `export-ready`) consistently throughout the system
4. Provides translations for all tags in all supported languages
5. Removes duplicate translations from language-specific files
6. Maintains UI text labels in language files

This centralized system creates a clear separation of concerns:
- Tag-specific translations go in `tag_translations.yml`
- UI labels and general text go in language-specific translation files

## Implementation Details

### 1. Created centralized tag_translations.yml

The core of the implementation is a comprehensive `_data/tag_translations.yml` file that organizes all tags hierarchically:

```yaml
sectors:
  hotels-resorts:
    en: "Hotels & Resorts"
    ru: "Отели и курорты"
    zh: "酒店与度假村"
  # ...other sector tags...

attributes:
  founder-led:
    en: "Founder-Led"
    ru: "Под руководством основателя"
    zh: "创始人领导"
  # ...other attribute tags...

growth:
  export-ready:
    en: "Export Ready"
    ru: "Готов к экспорту"
    zh: "出口就绪"
  # ...other growth tags...

countries:
  russia:
    en: "Russia"
    ru: "Россия"
    zh: "俄罗斯"
  # ...other country tags...
```

### 2. Updated templates to use the centralized system

We modified the tag display templates to use this centralized system:

#### Tag list include (`_includes/tags/tag-list.html`):

```html
<div class="tag-list">
  {% if include.tags %}
    {% assign sector_tags = "" | split: "" %}
    {% assign attribute_tags = "" | split: "" %}
    {% assign growth_tags = "" | split: "" %}
    {% assign country_tags = "" | split: "" %}
    
    {% for tag_id in include.tags %}
      {% for tag_type in site.data.tag_translations %}
        {% if site.data.tag_translations[tag_type.first][tag_id] %}
          {% if tag_type.first == "sectors" %}
            {% assign sector_tags = sector_tags | push: tag_id %}
            {% break %}
          {% elsif tag_type.first == "attributes" %}
            {% assign attribute_tags = attribute_tags | push: tag_id %}
            {% break %}
          {% elsif tag_type.first == "growth" %}
            {% assign growth_tags = growth_tags | push: tag_id %}
            {% break %}
          {% elsif tag_type.first == "countries" %}
            {% assign country_tags = country_tags | push: tag_id %}
            {% break %}
          {% endif %}
        {% endif %}
      {% endfor %}
    {% endfor %}
    
    <!-- Display sector tags -->
    {% if sector_tags.size > 0 %}
      <div class="sector-tags">
        {% for tag_id in sector_tags %}
          <a href="{{ site.baseurl }}/{{ page.lang }}/tags/sectors/{{ tag_id }}/" class="tag sector-tag">
            {{ site.data.tag_translations.sectors[tag_id][page.lang] }}
          </a>
        {% endfor %}
      </div>
    {% endif %}
    
    <!-- Similar blocks for other tag types... -->
  {% endif %}
</div>
```

#### Tag cloud include (`_includes/tags/tag-cloud.html`):

```html
<div class="tag-cloud">
  <h3>{{ site.data.translations[page.lang].tags.sectors }}</h3>
  <div class="sector-cloud">
    {% for tag in site.data.tag_translations.sectors %}
      <a href="{{ site.baseurl }}/{{ page.lang }}/tags/sectors/{{ tag[0] }}/" class="tag sector-tag">
        {{ tag[1][page.lang] }}
      </a>
    {% endfor %}
  </div>
  
  <!-- Similar blocks for other tag types... -->
  
  <h3>{{ site.data.translations[page.lang].tags.countries }}</h3>
  <div class="country-cloud">
    {% for tag in site.data.tag_translations.countries %}
      <a href="{{ site.baseurl }}/{{ page.lang }}/tags/countries/{{ tag[0] }}/" class="tag country-tag">
        {{ tag[1][page.lang] }}
      </a>
    {% endfor %}
  </div>
</div>
```

### 3. Updated translation files

We removed specific tag translations from language files while maintaining UI labels:

For example, in `_data/translations/en.yml`:

```yaml
tags:
  sector: "Sector"
  attribute: "Brand Attribute"
  growth: "Growth Pathway"
  sectors: "Sectors"
  attributes: "Brand Attributes"
  growth: "Growth Pathways"
  countries: "Countries"  # Added to ensure UI headers display properly
```

Similar updates were made to `ru.yml` and `zh.yml`.

### 4. Added CSS for country tags

We added styling for country tags to ensure consistent display:

```css
/* Country tag styling */
.country-tag {
  background-color: var(--accent-50);
  color: var(--accent-800);
  border: 1px solid var(--accent-100);
}

.country-tag:hover {
  background-color: var(--accent-100);
  color: var(--accent-900);
}

.country-cloud {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  margin-bottom: var(--space-6);
}

.country-tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  margin-bottom: var(--space-2);
}
```

## Decisions Made

### 1. Using Hyphens vs. Underscores in Tag IDs

We decided to use hyphens in tag IDs (e.g., `export-ready` instead of `export_ready`) for several reasons:

- Hyphens are more URL-friendly and common in web paths
- They maintain consistency with the existing Jekyll naming conventions
- They're easier to read in both code and URLs

This required converting any existing underscored tags to hyphenated format in both tag files and blog post front matter.

### 2. Separating UI Labels from Tag Data

We decided to maintain a clear separation between:

- **Tag translations** (specific tag names) in `tag_translations.yml`
- **UI labels** (category headings like "Sectors" or "Countries") in language-specific files

This separation follows the principle of having the right data in the right place, making the system more maintainable over time.

### 3. Pluralization of Tag Categories

We standardized on plural forms for tag categories in the centralized file:
- `sectors` (not `sector`)
- `attributes` (not `attribute`)
- `growth` (stays singular due to its nature)
- `countries` (not `country`)

This ensures consistency throughout the system and aligns with conventional naming practices.

### 4. Complete vs. Partial Migration

We chose a complete migration approach, moving all tag translations to the centralized file rather than implementing a hybrid system. This eliminates duplication and creates a simpler mental model for maintaining the system.

## Resources

### 1. Tag Translation Data

A complete `tag_translations.yml` file was created with all 33 tags translated into 3 languages.

### 2. Updated Translation Files

The `countries` key was added to all language files to ensure proper display of the Countries header:

For `ru.yml`:
```yaml
countries: "Страны"
```

For `zh.yml`:
```yaml
countries: "国家"
```

### 3. CSS for Country Tags

CSS for styling country tags was provided to maintain visual consistency with the existing tag system.

## Insights & Learning

### 1. Centralized Data Management

This implementation demonstrates the power of centralized data management in multilingual systems. By having a single source of truth for tag translations, we eliminate inconsistencies and simplify maintenance.

### 2. Separation of Concerns

The system now clearly separates:
- **Data** (tag translations)
- **UI text** (category labels)
- **Presentation** (template logic and CSS)

This separation makes the system more maintainable and easier to extend.

### 3. Jekyll Data Files as a Database

This implementation leverages Jekyll's data files as a simple database, showing how even static sites can implement sophisticated data management strategies without requiring a traditional database.

### 4. URL-Friendly Naming Conventions

Using hyphenated tag IDs emphasizes the importance of URL-friendly naming conventions in web development. Hyphens are more readable in URLs and align with common web practices.

### 5. Template Efficiency

The templates now use more efficient logic to categorize and display tags, reducing redundancy and improving maintainability.

## Next Actions

1. **Update existing content**: Convert any remaining underscore-based tags in blog posts and tag files to use the hyphenated format.

2. **Documentation**: Create a comprehensive guide for content creators explaining the new tag system and how to properly tag content.

3. **Testing**: Thoroughly test the tag display in all languages to ensure proper function and appearance.

4. **URL structure consideration**: Review whether tag URLs could be further optimized (e.g., `/en/tags/sectors/hotels-resorts/` vs. potentially shorter alternatives).

5. **Scalability planning**: Consider how the system will handle expansion to additional BRICS+ countries and potentially more languages in the future.

6. **SEO impact**: Analyze how the tag system affects SEO and whether additional metadata should be added to tag pages to improve discoverability.

This new multilingual tag translation system provides a solid foundation for Brandmine's content strategy, enabling efficient management of a complex taxonomy across multiple languages while maintaining clarity and consistency throughout the site.
