# Development Journal: Implementing Country Tags and Multilingual Tag System

**Date:** March 22, 2025  
**Project:** Brandmine Multilingual Blog  
**Focus:** Extension of tagging system with country dimension and translation improvements

## 1. Problem Statement

Our Brandmine platform has been successfully using a three-dimensional tagging system (sectors, attributes, growth signals) across three languages (English, Russian, Chinese). However, as we expand to cover all BRICS+ nations, we needed to:

1. Add a fourth dimension of tags specifically for countries, starting with the original BRICS nations (Brazil, Russia, India, China, South Africa)
2. Ensure these new country tags have consistent visual styling distinct from other tag types
3. Maintain proper multilingual support for all tags across our three languages
4. Improve our translation management system to handle the growing complexity of our tag taxonomy

The underlying problem is that our tag management was becoming increasingly complex, with translations distributed across multiple files, creating challenges for consistency, maintenance, and scalability as we continue to add more countries and potentially more languages.

## 2. Approach

We decided on a two-phase approach:

### Phase 1: Implement Country Tags 
1. Create a new tag type called "country" within our existing tag collection
2. Set up the directory structure and individual tag files for each country in each language
3. Update translation files to include country tag terminology
4. Create a distinctive styling for country tags (purple/violet) to differentiate from other tag types
5. Modify templates to properly display and filter country tags

### Phase 2: Create a Centralized Tag Translation System
1. Develop a centralized tag translation YAML file that reorganizes translations by tag ID first, then by language
2. Create helper includes to look up translations from this new structure
3. Update templates to use the new translation system
4. Maintain backward compatibility with existing language files for other site text

This approach allowed us to solve the immediate need for country tags while laying groundwork for more scalable tag management as our platform grows.

## 3. Implementation Details

### Creating the Country Tag Directory Structure

```bash
mkdir -p _tags/en/countries _tags/ru/countries _tags/zh/countries
```

### Sample Country Tag File Structure

Here's an example for Russia in English (`_tags/en/countries/russia.md`):

```yaml
---
layout: tag
title: "Russia"
tag: russia
tag_type: country
description: "Content focusing on Russian brands, markets, and consumer trends in one of the founding BRICS nations with a rich cultural heritage and diverse consumer economy."
badge_type: country
badge_icon: russia-flag.svg
permalink: /en/tags/countries/russia/
lang: en
---

Content tagged with "Russia" explores the dynamic landscape of Russian consumer brands, market dynamics, cultural context, and export opportunities. This tag highlights stories, analysis, and brand profiles specifically related to the Russian market and Russian brands with international potential.

## Key Market Characteristics

Russia offers a unique combination of European sophistication and Eurasian cultural richness...

[Additional content continues...]
```

### Adding Country Tag Styling

Added to `assets/css/components/tags.css`:

```css
/* Country tag styling */
.country-tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  margin-bottom: var(--space-2);
}

.country-tag {
  background-color: var(--country-100);
  color: var(--country-700);
  border: 1px solid var(--country-200);
}

.country-tag:hover {
  background-color: var(--country-200);
  color: var(--country-800);
}

/* Add to tag cloud styling */
.country-cloud {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  margin-bottom: var(--space-6);
}
```

### Adding Country Color Variables

Added to `assets/css/tokens/colors.css`:

```css
:root {
  /* Existing color variables... */
  
  /* Country colors (purple/violet) */
  --country-50: #F5F3FF;
  --country-100: #EDE9FE;
  --country-200: #DDD6FE;
  --country-300: #C4B5FD;
  --country-400: #A78BFA;
  --country-500: #8B5CF6;
  --country-600: #7C3AED;
  --country-700: #6D28D9;
  --country-800: #5B21B6;
  --country-900: #4C1D95;
}
```

### Updating Translation Files

Added to each language file (e.g., `_data/translations/en.yml`):

```yaml
tags:
  # Existing tags...
  country: "Country"
  countries: "Countries"
  brazil: "Brazil"
  russia: "Russia"
  india: "India"
  china: "China"
  south_africa: "South Africa"
```

### Updating Tag List Template

Modified `_includes/tags/tag-list.html` to include country tags:

```html
<div class="tag-list">
  {% if include.tags %}
    {% assign sector_tags = "" | split: "" %}
    {% assign attribute_tags = "" | split: "" %}
    {% assign growth_tags = "" | split: "" %}
    {% assign country_tags = "" | split: "" %}
    
    {% for tag in include.tags %}
      {% assign tag_path = tag | slugify %}
      
      {% for site_tag in site.tags %}
        {% if site_tag.tag == tag %}
          {% if site_tag.tag_type == "sector" %}
            {% assign sector_tags = sector_tags | push: site_tag %}
            {% break %}
          {% elsif site_tag.tag_type == "attribute" %}
            {% assign attribute_tags = attribute_tags | push: site_tag %}
            {% break %}
          {% elsif site_tag.tag_type == "growth" %}
            {% assign growth_tags = growth_tags | push: site_tag %}
            {% break %}
          {% elsif site_tag.tag_type == "country" %}
            {% assign country_tags = country_tags | push: site_tag %}
            {% break %}
          {% endif %}
        {% endif %}
      {% endfor %}
    {% endfor %}
    
    <!-- Existing tag sections... -->
    
    {% if country_tags.size > 0 %}
      <div class="country-tags">
        {% for tag in country_tags %}
          <a href="{{ tag.url | relative_url }}" class="tag country-tag">{{ tag.title }}</a>
        {% endfor %}
      </div>
    {% endif %}
  {% endif %}
</div>
```

### Multilingual Tag Translation Table

Created `_data/tag_translations.yml` with the following structure:

```yaml
# Sector tags
sectors:
  hotels-resorts:
    en: "Hotels & Resorts"
    ru: "Отели и курорты"
    zh: "酒店与度假村"
  # More sector tags...

# Attribute tags
attributes:
  founder-led:
    en: "Founder-Led"
    ru: "Управляемый основателем"
    zh: "创始人领导"
  # More attribute tags...

# Growth tags
growth:
  export-ready:
    en: "Export Ready"
    ru: "Готов к экспорту"
    zh: "出口就绪"
  # More growth tags...

# Country tags
countries:
  brazil:
    en: "Brazil"
    ru: "Бразилия"
    zh: "巴西"
  russia:
    en: "Russia"
    ru: "Россия"
    zh: "俄罗斯"
  # More country tags...
```

### Tag Translation Helper Include

Created `_includes/tag-translation.html` for simplified lookup:

```html
{% comment %}
  Includes a tag translation based on provided parameters:
  - tag_type: The type of tag (sectors, attributes, growth, countries)
  - tag_id: The identifier of the tag (e.g., "russia", "export-ready")
  - lang: The language code (defaults to page.lang if not provided)
{% endcomment %}

{% assign lang = include.lang | default: page.lang %}
{% assign translation = site.data.tag_translations[include.tag_type][include.tag_id][lang] %}

{% if translation %}
  {{ translation }}
{% else %}
  {{ include.tag_id }}
{% endif %}
```

### Fixing Blog Post URLs with Language Prefixes

Updated `_config.yml` to ensure blog posts have language-specific permalinks:

```yaml
defaults:
  # Post language defaults
  - scope:
      path: "_posts/en"
      type: "posts"
    values:
      layout: "post"
      lang: "en"
      show_author: true
      show_date: true
      show_time: false
      permalink: /en/:categories/:year/:month/:day/:title/
  - scope:
      path: "_posts/ru"
      type: "posts"
    values:
      layout: "post"
      lang: "ru"
      show_author: true
      show_date: true
      show_time: false
      permalink: /ru/:categories/:year/:month/:day/:title/
  - scope:
      path: "_posts/zh"
      type: "posts"
    values:
      layout: "post"
      lang: "zh"
      show_author: true
      show_date: true
      show_time: false
      permalink: /zh/:categories/:year/:month/:day/:title/
```

## 4. Decisions Made

### Country Tag Styling

We chose a purple/violet color scheme for country tags to complement our existing color scheme:
- Sectors: Teal (primary colors)
- Attributes: Orange (secondary colors) 
- Growth: Indigo (accent colors)
- Countries: Purple/Violet (new color set)

This creates visual distinction while maintaining a harmonious overall design.

### Author Translation System

We implemented a new author translation system that allows consistent display of author names across languages:

```yaml
# In language files (e.g., _data/translations/en.yml)
authors:
  randal_eastman: "Randal Eastman"
  olya_eastman: "Olya Eastman"

# In Russian (ru.yml)
authors:
  randal_eastman: "Рэндал Истман"
  olya_eastman: "Ольга Истман"

# In Chinese (zh.yml)
authors:
  randal_eastman: "伊仁德"
  olya_eastman: "欧丽雅"
```

This replaces hardcoded author names with a translation system using an `author_id` in post front matter.

### Post Display Flexibility

We implemented a configurable display system for post metadata, allowing each post to control whether to show:
- Author name (`show_author: true/false`)
- Date (`show_date: true/false`)
- Time (`show_time: true/false`)

This gives greater flexibility for different content types.

### Centralized Tag Translation System

We decided to implement a centralized tag translation table while keeping general site text in language-specific files. This hybrid approach maintains the benefits of our existing system while adding a more structured approach for tags specifically.

### Tag Translation Lookup Method

We chose to implement a helper include for tag translation lookups rather than directly referencing the translation table in templates. This approach:
- Centralizes the lookup logic
- Provides cleaner fallbacks when translations are missing
- Makes template code more readable
- Simplifies future changes to the translation system

## 5. Resources Created

### Country Tag Files (15 total)

We created tag files for all 5 BRICS countries in 3 languages:
- English: `_tags/en/countries/[country].md`
- Russian: `_tags/ru/countries/[country].md`
- Chinese: `_tags/zh/countries/[country].md`

### Translation Tables

We enhanced our language files with country tags and author translations:
- `_data/translations/en.yml`
- `_data/translations/ru.yml`
- `_data/translations/zh.yml`

And created a central tag translation file:
- `_data/tag_translations.yml`

### Helper Includes

We created a new include file for tag translation:
- `_includes/tag-translation.html`

### Implementation Documentation

We produced comprehensive documentation for the multilingual tag translation system:
- Implementation guide with step-by-step instructions
- Code examples for each component
- Maintenance guidelines

## 6. Insights & Learning

### Multilingual Design Patterns

This implementation demonstrates an effective pattern for managing translations in a multilingual site with complex taxonomy:

1. **Organize by identification first, then language**: This makes it easier to ensure all items have translations in all languages.

2. **Use helper functions for lookups**: Centralizing translation lookup logic simplifies templates and ensures consistent fallback behavior.

3. **Balance structured and flexible approaches**: While structured data (like tag translations) benefits from rigorous organization, general site text can remain in language-specific files for easier context.

### CSS Organization for Visual Taxonomy

The implementation reinforces the value of a systematic approach to CSS organization:

1. **Token-based design system**: Defining color variables in a central location makes the system maintainable.

2. **Consistent naming conventions**: Using parallel structure (sector-tag, attribute-tag, growth-tag, country-tag) creates predictable CSS.

3. **Visual distinction with harmony**: Using different color families for each tag type creates visual separation while maintaining a cohesive design language.

### Jekyll Configuration Techniques

The implementation highlighted several important Jekyll configuration techniques:

1. **Language-specific permalink patterns**: Using front matter defaults to specify language-prefixed permalinks ensures consistent URL structure.

2. **Collection configuration**: Properly configuring tag collections with appropriate defaults simplifies content creation.

3. **Include parameters**: Using parameterized includes with defaults and fallbacks creates flexible, reusable components.

## 7. Next Actions

1. **Implement the centralized tag translation system**:
   - Create the `tag-translation.html` include file
   - Update templates to use the new translation system
   - Test thoroughly across all three languages

2. **Fix blog post URLs**:
   - Update `_config.yml` with language-specific permalink patterns
   - Check that existing posts have the correct language prefix
   - Consider redirects for any existing links to posts without language prefixes

3. **Create tag landing pages**:
   - Create a dedicated "Countries" page for each language
   - Update navigation to include links to these pages

4. **Plan for BRICS+ expansion**:
   - Prepare for adding the remaining five BRICS+ nations
   - Create a tag template for streamlined creation of new country tags

5. **Consider further enhancements**:
   - Tag relationship visualization to show connections between tags
   - Tag prioritization for controlling display order
   - Tag metadata for additional information about each tag

6. **Documentation updates**:
   - Update content creation guidelines to reference the new country tag system
   - Create a reference document for tag IDs and their meanings

7. **Performance review**:
   - Evaluate the impact of the expanded tag system on site build times
   - Consider optimization strategies if needed

This implementation sets a solid foundation for Brandmine's continued growth as we expand our coverage of BRICS+ nations and potentially add more languages in the future.
