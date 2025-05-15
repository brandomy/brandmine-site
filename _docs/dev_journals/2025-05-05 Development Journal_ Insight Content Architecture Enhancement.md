# Development Journal: Insight Content Architecture Enhancement

**Date:** 2025-05-05  
**Topic:** Restructuring insights collection for multilingual support and consistent taxonomy integration

## 1\. Problem Statement

Our insights collection needed standardization across templates, layouts, and multilingual support. Key issues included:

- Inconsistent field naming (content\_type vs category)  
- Mixed terminology (categories vs types vs dimensions)  
- Incomplete multilingual support for author information  
- Misaligned image structure  
- Taxonomy links using unreliable slugify operations  
- Missing type filter pages for insights navigation

## 2\. Approach

We implemented a comprehensive restructure of the insights system to:

- Standardize on "category" internally and "Type" for user-facing labels  
- Align image handling with brand profile structure  
- Create explicit multilingual author fields  
- Establish filtered type pages for each insight category  
- Properly integrate with existing dimension taxonomy  
- Update all layouts and includes for consistency

## 3\. Implementation Details

### Template Standardization

```
# Updated front matter structure
category: "brand-spotlight"  # Kebab-case for internal use
author_en: "Author Name"
author_ru: "Автор"
author_zh: "作者"
excerpt: "Brief excerpt in the current language"
images:
  hero: "/assets/images/insights/ru/article-slug/hero.jpg"
  founder_portrait: "/assets/images/insights/ru/article-slug/founder-portrait.jpg"
  logo: "/assets/images/insights/ru/article-slug/logo.jpg"
```

### Created Type Filter Pages

- `/en/insights/types/brand-spotlight/`  
- `/en/insights/types/founders-journey/`  
- `/en/insights/types/location-intelligence/`  
- `/en/insights/types/market-momentum/`

### Layout Updates

```
<!-- Changed from content_type to category -->
<div class="insight-type-badge">{{ page.category }}</div>

<!-- Updated language-specific author display -->
<span class="insight-author">
  {% if page.lang == 'en' %}{{ page.author_en }}{% endif %}
  {% if page.lang == 'ru' %}{{ page.author_ru }}{% endif %}
  {% if page.lang == 'zh' %}{{ page.author_zh }}{% endif %}
</span>

<!-- Removed slugify filter for taxonomy links -->
<a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ sector }}/">
```

### Image Structure Enhancement

```
<!-- Updated from single image field to structured images -->
{% if page.images.hero %}
  <img src="{{ page.images.hero | relative_url }}" alt="{{ page.title }}">
{% endif %}
```

## 4\. Decisions Made

| Decision | Rationale |
| :---- | :---- |
| Use "Type" over "Category" for user-facing text | Shorter URL, clearer intent, follows CMS conventions |
| Maintain 2-level URL nesting (`/insights/types/`) | Better scalability, proper namespace for future features |
| Create `insights-type` layout | Separation of concerns, allows type-specific customization |
| Keep dimension taxonomy in sidebar | Valuable cross-navigation, enables discovery across both content types |
| Use exact slugs without filtering | Prevents double-slugification, ensures reliable URLs |

## 5\. Resources

### New Files Created:

- `_layouts/insights-type.html`  
- 4 type pages for English (brand-spotlight.md, founders-journey.md, etc.)  
- Updated `_templates/insights/README.md`  
- Updated sample articles with proper taxonomy

### Modified Files:

- `insight.html` \- Updated field names and structure  
- `insights.html` \- Fixed taxonomy and type references  
- `insight-card.html` \- Updated to use new image/author structure  
- `en.yml` \- Added/removed translation keys

## 6\. Insights & Learning

1. **URL Structure Investment**: The decision to use `/insights/types/` creates scalability for future features like search, filters, and author pages  
     
2. **Field Naming Psychology**: "Type" resonates better with users than "category" for content classification  
     
3. **Multilingual Author Handling**: Explicit language fields for authors prevents CSS and JavaScript complexity while maintaining accuracy  
     
4. **Taxonomy Integration**: Keeping dimension links in insights sidebar creates valuable discovery pathways between content types  
     
5. **Slug Consistency**: Using exact slugs from data files prevents translation errors and ensures URLs work across languages

## 7\. Next Actions

### Immediate:

1. Create RU/ZH versions of type pages  
2. Update RU/ZH translation files with new keys  
3. Create sample insights in RU/ZH languages for testing  
4. Test all taxonomy links work correctly

### Future:

1. Implement type page pagination  
2. Add search functionality across insight types  
3. Create author profile pages  
4. Implement related insights by dimension  
5. Add RSS feeds per insight type

### Follow-up Tasks:

1. Verify all brand references in insights use `ref` field correctly  
2. Test image processing for insight articles  
3. Document multilingual content creation workflow  
4. Create insight creation script for efficiency

## 8\. Critical Dependencies

- Ensure `_data/dimensions/ru.yml` and `_data/dimensions/zh.yml` have complete translations  
- Verify brand collection uses `ref` field for cross-referencing  
- Confirm all sample insights are properly tagged with existing slugs  
- Test that layout inheritance works with new `insights-type` layout

---

This restructuring establishes a solid foundation for scalable multilingual content management while maintaining consistent user experience across all insight types and languages.  
