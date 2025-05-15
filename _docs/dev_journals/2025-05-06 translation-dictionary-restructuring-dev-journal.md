# Development Journal: Translation Dictionary Restructuring
**Date:** 2025-05-06  
**Topic:** Restructuring multilingual translation dictionaries for improved organization and maintenance

## 1. Problem Statement

The translation dictionary files (`_data/translations/*.yml`) for our trilingual site had grown organically, resulting in several issues:
- Inconsistent organization across language versions (EN, RU, ZH)
- Duplicate entries for social media platforms in different sections
- Redundant structures for related concepts (e.g., generation types under `brand` instead of in dedicated sections)
- Lack of clear visual separation between logical content groupings
- Unclear ordering of people and entity names
- Missing translations in some language versions

We needed to establish a clean, consistent organization across all language files to:
1. Make ongoing translation maintenance easier
2. Provide better documentation for translators
3. Ensure all translations exist in all languages
4. Remove redundant entries
5. Group related translations logically

## 2. Approach

We approached the restructuring in phases:

1. **Analysis Phase**
   - Examined all three language files to identify inconsistencies
   - Identified duplicate structures (like social media platform listings)
   - Looked for missing translations across language versions
   - Analyzed usage of translation keys in templates

2. **Structure Design Phase**
   - Created logical groupings for translations
   - Developed a consistent header structure with descriptive comments
   - Reorganized translations into these logical groups
   - Moved entity names (people, companies) to the end for better scalability

3. **Implementation Phase**
   - Restructured the English (EN) file first as the source of truth
   - Applied the same structure to Russian (RU) and Chinese (ZH) files
   - Added missing translations wherever found
   - Removed redundant entries

4. **Verification Phase**
   - Checked that no translations were lost during restructuring
   - Ensured consistent organization across all language files
   - Verified that keys used in templates still existed in restructured files

## 3. Implementation Details

### Core Organization Strategy

We organized the translation files into these major sections:

```yaml
# SITE-WIDE ELEMENTS
# General labels used throughout the site

# PAGE-SPECIFIC CONTENT
# Labels and content specific to individual pages

# DIMENSIONS TAXONOMY
# The four-dimensional taxonomy that drives site organization and discovery

# BRAND PROFILE ELEMENTS
# Components displayed on brand profile pages

# INSIGHTS CONTENT
# Blog posts and analytical content

# SOCIAL MEDIA
# Social media platform labels

# PROPER NAMES AND ENTITIES
# Names requiring careful translation across languages
```

### Key Changes Implemented

1. **Moved social media entries to a dedicated section**
   ```yaml
   social: 
     # Social media platforms
     facebook: "Facebook"
     instagram: "Instagram"
     # etc.
   ```

2. **Removed duplicate social media entries under `brand`**
   ```yaml
   # Removed these redundant entries
   brand:
     social_instagram: "Instagram"
     social_facebook: "Facebook"
     # etc.
   ```

3. **Reorganized `brand` section with logical subgroups**
   ```yaml
   brand:
     # Basic information
     about: "About"
     slogan: "Slogan"
     
     # Founder information
     founder: "Founder"
     # etc.
   ```

4. **Moved generation types to their own section**
   ```yaml
   # Generation types
   generation:
     first: "First Generation"
     second: "Second Generation"
     transition: "Transitional Generation"
   ```

5. **Moved image credits to site-wide elements**
   ```yaml
   # Image credits
   image_credits:
     creator: "Creator"
     source: "Source"
     # etc.
   ```

6. **Organized proper names at the end of the file**
   ```yaml
   # Content authors (order alphabetically)
   authors:
     olya_eastman: "Olya Eastman"
     # etc.

   # Testimonials
   testimonials:
     georgie_yam: "Georgie Yam"
     # etc.

   # Brand founders (order alphabetically)
   founders:
     alexei-sokolov: "Alexei Sokolov"
     # etc.

   # Brand names (order alphabetically)
   brand_names:
     altai-honey: "Altai Premium Honey"
     # etc.
   ```

7. **Added market-sector section for intersection content**
   ```yaml
   # Market-sector intersection pages
   market_sectors:
     market_sector_subtitle: "%sector% in the %market% Market"
     # etc.
   ```

8. **Added comprehensive commenting throughout**
   - Added section dividers with descriptive titles
   - Added explanatory comments for subsections
   - Added organization instructions (keep alphabetical)

## 4. Decisions Made

1. **Section Ordering**
   - Started with site-wide elements that appear across all pages
   - Grouped page-specific content by type (home, about, etc.)
   - Organized dimensions taxonomy together since they're related
   - Kept brand and insights sections separate due to their size
   - Placed proper names at the end for easier expansion

2. **Entity Name Organization**
   - Kept testimonials above brand founders and brand names
   - Added explicit alphabetical ordering comment
   - Organized all name groups with consistent structure

3. **Image Credits Placement**
   - Moved from the proper names section to site-wide elements
   - This recognizes that image credits aren't proper names but rather UI elements

4. **Translation Key Structure**
   - Maintained existing kebab-case for IDs (e.g., `brand-slug`)
   - Maintained existing snake_case for translation keys (e.g., `reading_time_filter`)
   - Grouped related keys under namespace prefixes (e.g., `brand.`, `insights.`)

5. **Comment Format**
   - Used thick dividers for major sections
   - Used consistent comment style throughout
   - Added usage context in comments

## 5. Resources

### Section Structure Reference

```yaml
# =============================================================================
# MAJOR SECTION
# Brief description of the section's purpose
# =============================================================================

# Subsection
section:
  # Group comment
  key1: "Value 1"
  key2: "Value 2"
```

### Order of Sections

1. Site-wide elements
2. Page-specific content
3. Dimensions taxonomy
4. Brand profile elements
5. Insights content
6. Social media
7. Proper names and entities

### Proper Names Ordering

1. Content authors
2. Testimonials
3. Brand founders
4. Brand names

## 6. Insights & Learning

1. **Translation File Evolution**: Translation files tend to grow organically rather than systematically, requiring periodic restructuring to maintain coherence.

2. **Single Source of Truth**: Using English as the single source of truth simplifies maintenance but requires vigilance to ensure other language files remain aligned with its structure.

3. **Documentation Importance**: Clear section headers and comments significantly improve maintainability, especially for files maintained by multiple contributors.

4. **Logical Grouping Benefits**: Organizing related translations together (rather than chronologically as they were added) makes the files much easier to navigate and update.

5. **Redundancy Avoidance**: The redundant social media entries were a clear example of how translation files can accumulate duplicate structures when adding features incrementally.

6. **Names at the End**: Placing proper names at the end of the file was a good decision, as these sections will grow significantly as we add more brands and founders.

## 7. Next Actions

1. **Update Chinese Name Translations**: Some Chinese translations of brand and founder names may need professional review to ensure cultural appropriateness.

2. **Create Translation Documentation**: Develop a formal guide for translators explaining the file structure and translation conventions.

3. **Implement Missing Sectors/Markets Translations**: Add market-sector intersection section to Chinese and Russian files with appropriate translations.

4. **Convert Existing Brand Tags**: Update any brand files using the old social media structure to use the new centralized structure.

5. **Add Translation Validation**: Create a script to verify that all keys in the English file exist in the other language files to prevent missing translations.

6. **Automate Alphabetical Ordering**: Consider a script to ensure the proper names sections remain alphabetically ordered as they grow.

7. **Monitor Template Usage**: Watch for any template breaking changes during the next site build due to key restructuring.
