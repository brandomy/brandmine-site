# Development Journal: Brand Templates Enhancement
Date: 2025-04-10

## Problem Statement
We needed to revamp the brand template structure for our Jekyll-based multilingual site to support the "Data-First Implementation Plan". The existing templates were missing critical fields for founder information, location data, timelines, and other structured data needed for advanced filtering and map visualization. Additionally, we needed to standardize the permalink structure to prevent naming conflicts between brands from different countries.

## Approach
1. Analyze existing templates (brand-en.md, brand-ru.md, brand-zh.md)
2. Create enhanced templates with additional structured data fields
3. Reorganize front matter to place core identification at the top
4. Implement a standard permalink structure using explicit country codes
5. Ensure proper translation and localization of all fields in each language
6. Update sample content (teatime.md) to match the new template structure

## Implementation Details

### Core Front Matter Reorganization
We reorganized the front matter to place critical identification fields at the top for easier reference:

```yaml
# Core identification
layout: brand
title: "BRAND NAME"
slug: brand-slug
country_code: "xx"  # ISO country code for permalink
lang: en
permalink: /en/brands/{{ page.country_code }}/{{ page.slug }}/
```

### New Data Fields Added
- `subsectors`: For more precise industry categorization
- `founder` (expanded): Now includes story, generation, transition status, founder_led flag
- `location`: Structured data with country, region, city, and coordinates
- `timeline`: Milestone events with years
- `social_media`: Platform-specific links including country-specific networks
- `certifications` and `awards`: Now include years
- `international`: Export markets and distribution models
- `partnerships`: Partnership opportunities and requirements

### Permalink Structure
We standardized on using explicit country codes in the permalink:
```
/en/brands/ru/teatime/
```
This structure follows the pattern:
`/[language]/brands/[country-code]/[slug]/`

### New Content Sections
Added standard sections across all language templates:
- Founder's Journey
- Market Presence
- Certifications & Recognition
- Location Intelligence

## Decisions Made

1. **Explicit Country Codes**: We decided to use explicit country codes in front matter rather than deriving them from the location country name. This simplifies permalinks and prevents inconsistencies.

2. **Front Matter Organization**: We grouped related fields together and placed core identification at the top for better readability and maintenance.

3. **Structured vs. Flat Data**: We chose a structured approach (nested objects) for related data like founder information, location details, and gallery images with captions.

4. **Multilingual Comment Text**: We added translated comments in each language template to make it easier for content creators working in different languages.

5. **Map Integration**: We added a dedicated "Location Intelligence" section to provide a logical place for the map integration and related geographic content.

## Resources

### Updated Templates
- brand-en.md: English brand template
- brand-ru.md: Russian brand template
- brand-zh.md: Chinese brand template

### Translation Updates
- Added new terms to en.yml, ru.yml, and zh.yml translation files
- Completed sample brand profiles in all three languages (TeaTime)

## Insights & Learning

1. **Front Matter Organization**: Placing core identification fields at the top makes templates more readable and maintenance easier. This is especially important as templates grow more complex.

2. **Permalink Strategy**: Using explicit country codes in permalinks prevents naming conflicts and creates a more predictable URL structure. This is crucial for a multilingual site with brands from multiple countries.

3. **Structured Data Approach**: Nested YAML structures make the data more organized and logical, though they require more careful handling in Jekyll templates.

4. **Translation Consistency**: It's vital to maintain consistency in field naming and structure across languages, even if the content is translated.

5. **Comments in Templates**: Well-commented templates make them more accessible to content creators who may not be developers.

## Next Actions

1. Update all existing brand profiles to match the new template structure
2. Create Jekyll includes for rendering the new structured data fields
3. Implement map visualization in the Location Intelligence section
4. Build filtering functionality based on the enhanced data structure
5. Create documentation for content creators explaining the new template fields
6. Add validation to ensure required fields are populated
7. Consider implementing automation for permalink generation to prevent errors
