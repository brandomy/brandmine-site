# Development Journal: Multilingual Content Structure Enhancement
Date: 2025-04-27

## Problem Statement
We needed to establish a clear, consistent structure for our multilingual insights articles across English, Russian, and Chinese versions. The existing content had inconsistencies in front matter fields, varying levels of completeness, and confusion about which fields should be translated versus maintained in English. Additionally, we needed to update our data organization to better differentiate between insights categories and content taxonomy dimensions.

## Approach
1. Analyzed existing insight article samples to identify inconsistencies and structural issues
2. Created a new data organization for insights categories with clear separation from taxonomy dimensions
3. Standardized front matter fields across all three languages, with clear guidelines on translation
4. Developed complete article versions in all three languages to serve as templates
5. Implemented consistent excerpt formatting from article content rather than placeholder text

## Implementation Details

### Data Structure Updates
Created an insights data structure separate from dimensions:
```
_data/
  insights/
    en.yml  # Insights categories in English
    ru.yml  # Insights categories in Russian
    zh.yml  # Insights categories in Chinese
```

Each file contains a consistent structure:
```yaml
categories:
  - id: brand_spotlight
    name: "Brand Spotlight"  # Translated per language
    plural: "Brand Spotlights"  # Translated per language
    description: "In-depth profiles of noteworthy BRICS+ brands gaining international momentum."
    icon: "brand-spotlight"
```

### Front Matter Standardization
Standardized the front matter structure across all languages:
```yaml
layout: insight
title: "Title in appropriate language"
category: "Category in appropriate language"
secondary_categories: []  # Empty array syntax instead of empty string
date: 2025-03-15
author: "Author Name in appropriate language"
excerpt: "Actual excerpt from article content, not placeholder text"
sectors: [Gourmet Foods]  # Always in English 
markets: [Russia]  # Always in English
attributes: [Heritage Brand, Founder-Led]  # Always in English
signals: [Export Ready, Investment Ready]  # Always in English
brands: [teatime]  # Always in English
image: /assets/images/insights/teatime-founder.jpg
featured: true
premium: false
permalink: /en/insights/teatime-founders-journey/  # Language code changes
lang: en  # Language code changes
reading_time: 7  # New field added
```

### Key Decisions

**Fields to translate:**
- `title` - Article title
- `category` - Category name
- `secondary_categories` - Category names if present
- `author` - Author name
- `excerpt` - Article summary in appropriate language

**Fields to maintain in English:**
- All taxonomy values: `sectors`, `markets`, `attributes`, `signals`
- Technical identifiers: `brands`, `layout`, etc.
- Boolean flags: `featured`, `premium`

**Technical improvements:**
- Used empty array syntax `[]` for empty collections instead of empty strings
- Added `reading_time` field for better user experience
- Removed `primary_dimension` field as redundant for our current implementation
- Used actual article content for excerpts instead of placeholder text

## Resources
1. Full article templates in three languages:
   - `founders-journey-sample-en.md`
   - `founders-journey-sample-ru.md`
   - `founders-journey-sample-zh.md`
   - `brand-spotlight-sample-en.md`
   - `brand-spotlight-sample-ru.md`
   - `brand-spotlight-sample-zh.md`
   - `market-momentum-sample-en.md`
   - `market-momentum-sample-ru.md`
   - `market-momentum-sample-zh.md`
   - `location-intelligence-sample-en.md`
   - `location-intelligence-sample-ru.md`
   - `location-intelligence-sample-zh.md`

2. Insights category data files:
   - `_data/insights/en.yml`
   - `_data/insights/ru.yml`
   - `_data/insights/zh.yml`

## Insights & Learning

1. **Consistent YAML Structure**: Using consistent YAML patterns (like empty arrays `[]` instead of empty strings) prevents subtle bugs in template processing.

2. **Translation Boundaries**: Clearly delineating which fields to translate and which to keep in English is crucial for multilingual site maintenance. This should be documented and enforced consistently.

3. **Excerpt Management**: Using actual article content for excerpts rather than placeholder text improves SEO and user experience. This is especially important in multilingual contexts where translations might not match word-for-word.

4. **Data vs. Content Organization**: Separating category configuration (in data files) from category content (in Markdown files) creates a cleaner architecture that's easier to maintain and extend.

5. **Standard Templates Value**: Having complete, standardized article examples in all three languages serves both as documentation and as templates for content creators, reducing the likelihood of structural inconsistencies.

## Next Actions

1. **Update Existing Content**: Apply these structural changes to all existing insight articles to ensure consistency.

2. **Documentation**: Create formal documentation on multilingual content creation, specifying which fields to translate and which to keep in English.

3. **Template Generation**: Set up template generation for new articles to ensure they follow the standardized structure.

4. **Front Matter Validation**: Implement validation checks in the build process to catch inconsistencies in front matter structure.

5. **Content Creator Training**: Provide training to content team on the standardized approach to multilingual content creation.

6. **Insight Category Enhancement**: Consider expanding the insights category data structure with additional metadata like related dimensions, recommended length, etc.
