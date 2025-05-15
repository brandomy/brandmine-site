# Development Journal: Brand Relationship Terminology Changes
**Date:** March 27, 2025

## 1. Problem Statement

We identified inconsistent terminology in our codebase regarding how we reference brands within our insight articles. Currently, we use `related_brands` in the front matter of insight articles to list brands mentioned in the content. This creates confusion because:

1. The term "related" is ambiguous and doesn't clearly indicate that these are brands directly mentioned in the article
2. We use similar terminology for genuinely "related" brands in our brand profiles
3. We should strive for simple, clear naming patterns that follow our existing conventions

We needed to standardize this terminology by changing `related_brands` to `brands` in our insight articles while ensuring we properly handle the distinction between brands mentioned in insights and related brands shown on brand profiles.

## 2. Approach

After analyzing the codebase, we determined we should:

1. Change all instances of `related_brands` to `brands` in insight article front matter
2. Update all templates, includes, and translation files to reflect this change
3. Maintain distinct terminology in our UI and code to differentiate between brands mentioned in insights and genuinely related brands shown on brand profiles
4. Ensure consistent naming in all three languages (English, Russian, Chinese)

This approach simplifies our data model while maintaining clear semantics about different relationship types.

## 3. Implementation Details

### Front Matter Changes

**Before:**
```yaml
---
title: "The Ritual of Sweetness: How Bushe Bakeries Blend Soviet Nostalgia with Contemporary Cafe Culture"
content_type: "Cultural Signature"
related_brands: [bushe]
---
```

**After:**
```yaml
---
title: "The Ritual of Sweetness: How Bushe Bakeries Blend Soviet Nostalgia with Contemporary Cafe Culture"
content_type: "Cultural Signature"
brands: [bushe]
---
```

### Template Changes

In `insights-feed.html`, we updated the CSS class from `related-brands` to `featured-brands` to better reflect what these brands represent:

**Before:**
```liquid
{% if post.brands %}
  <div class="related-brands">
    {% for brand in post.brands %}
      <span class="brand-tag">{{ brand }}</span>
    {% endfor %}
  </div>
{% endif %}
```

**After:**
```liquid
{% if post.brands %}
  <div class="featured-brands">
    {% for brand in post.brands %}
      <span class="brand-tag">{{ brand }}</span>
    {% endfor %}
  </div>
{% endif %}
```

For `related-brands-list.html`, we kept the file name as is since it correctly describes its purpose, but updated the usage comment:

**Before:**
```liquid
{% comment %}
  Usage:
  {% include related-brands-list.html brands=page.related_brands %}
{% endcomment %}
```

**After:**
```liquid
{% comment %}
  Usage:
  {% include related-brands-list.html brands=page.brands %}
{% endcomment %}
```

### Translation File Changes

We updated all three language files to maintain consistency:

**In en.yml:**
```yaml
insights:
  # Other keys...
  related_brands: "Featured Brands"  # Changed to:
  brands: "Featured Brands"
```

**In ru.yml:**
```yaml
insights:
  # Other keys...
  related_brands: "Упомянутые бренды"  # Changed to:
  brands: "Упомянутые бренды"
```

**In zh.yml:**
```yaml
insights:
  # Other keys...
  related_brands: "相关品牌"  # Changed to:
  brands: "相关品牌"
```

### Brand Template Changes

In all three language versions of our brand templates, we changed:

```yaml
related_brands: []
```

to:

```yaml
brands: []
```

## 4. Decisions Made

1. **Term Selection:** We chose `brands` over `related_brands` for insight articles because it's simpler, more direct, and follows our established pattern of using simple plural nouns for taxonomies (`sectors`, `markets`, `attributes`, `signals`).

2. **CSS Class Naming:** We decided to rename the CSS class from `related-brands` to `featured-brands` in our insight feed template to better reflect that these are brands featured in the article, not necessarily related to each other.

3. **File Naming:** We chose to keep the `related-brands-list.html` include name unchanged, as it accurately describes its function of listing brands related to another brand. Changing it would require significant refactoring for little semantic benefit.

4. **Translation Keys:** We maintained parallel translation keys across all three languages to ensure consistent behavior regardless of the selected language.

## 5. Resources

### Updated Translation Keys

**English:**
```yaml
insights:
  brands: "Featured Brands"
```

**Russian:**
```yaml
insights:
  brands: "Упомянутые бренды"
```

**Chinese:**
```yaml
insights:
  brands: "相关品牌"
```

### Files Changed
- All insight article markdown files
- `insights-feed.html`
- `en.yml`, `ru.yml`, `zh.yml` translation files
- Brand template files (`brand-en.md`, `brand-ru.md`, `brand-zh.md`)
- Any templates that include `related-brands-list.html` with the old parameter name

## 6. Insights & Learning

This refactoring highlighted several important lessons about maintaining a multilingual, content-rich platform:

1. **Clear Terminology Matters:** Precise, unambiguous naming is crucial for maintainability. The term "related" was overloaded in our codebase, referring to different concepts in different contexts.

2. **Front Matter Consistency:** Keeping front matter fields consistent across content types simplifies templates and reduces cognitive load when creating new content.

3. **Multilingual Considerations:** When making terminology changes, we need to consider all language versions to maintain a consistent experience across the platform.

4. **CSS Class Names Are Part of Your API:** Classes used for styling are also part of your codebase's semantics and should reflect the purpose of the elements they style.

5. **Content vs. Structure Distinction:** There's an important difference between content relationships (brands mentioned in an article) and structural relationships (brands related to another brand). Our naming should reflect this distinction.

## 7. Next Actions

1. Run a comprehensive search to identify any remaining instances of `related_brands` in our codebase
2. Test the changes in all three languages to ensure everything displays correctly
3. Update any documentation that references the old terminology
4. Consider adding validation to our content creation process to enforce the new naming convention
5. Review other areas of our codebase for similar terminology inconsistencies

This change improves the clarity of our codebase while maintaining the semantic distinction between brands mentioned in insights and brand relationships. The updated terminology is more intuitive and follows our established naming conventions, making the system easier to understand for both content creators and developers.
