# Development Journal: Brand Templates Restructuring
Date: 2025-05-01

## Problem Statement
We needed to restructure and standardize our brand templates to better support a range of content-creation scenarios while maintaining consistency across the platform. The existing template was comprehensive but overwhelming, making it difficult to quickly create new brand entries with limited information. Additionally, we identified several technical issues that needed to be addressed: missing language switcher references, founder image handling inconsistencies, and outdated content sections that didn't align with our current information architecture (specifically separating "Location Intelligence" from "Market Presence").

## Approach
1. Created a three-tiered template system matching our two-tier content strategy:
   - Core template (minimal fields for rapid data entry)
   - Lite template (essential fields and sections for standard profiles)
   - Full template (comprehensive fields for featured brands)
2. Reviewed existing sample profiles and aligned them with the new template structure
3. Ensured proper multilingual support by creating translated versions of templates (Russian, Chinese)
4. Added missing technical fields like "ref" to support the language switcher functionality
5. Reconsidered our image handling approach for founder portraits
6. Identified necessary updates to our Jekyll includes and layout files

## Implementation Details

### 1. Three-Tiered Template System
Created templates with appropriate content levels:

**Core Template** (minimal):
```yaml
# Core identification
layout: brand
title: "BRAND NAME"
slug: brand-slug
ref: brand-slug  # Added for language switcher
country_code: "xx"
lang: en
permalink: /en/brands/{{ page.country_code }}/{{ page.slug }}/

# Core categorization (essential)
sectors: [Primary Sector]
markets: [Primary Market]
description: "Brief brand description (1-2 sentences)."

# Basic essentials
founding_year: YYYY
website: "https://example.com"

# Founder information (minimal)
founder:
  name: "Founder Name"
  founder_led: true

# Location (required for map)
location:
  country: "Country Name" 
  city: "City Name"
  coordinates: [longitude, latitude]

# Basic image assets
logo: "/assets/images/brands/brand-slug/originals/logo-color.png"
hero_image: "/assets/images/brands/brand-slug/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/brand-slug/originals/founder-portrait.jpg"

# Content status
languages: [en]
featured: false
featured_level: 0  # Basic listing
```

**Lite Template** included moderate-level fields and sections above core, and **Full Template** included all possible fields and sections.

### 2. Image Handling for Founders
Decided to keep founder portraits with brand assets rather than in a separate people directory for:
- Simplified image management for MVP stage
- More intuitive content creation process
- Clear association between founders and their brands
- Reduces complexity in image processing

Path structure:
```
/assets/images/brands/brand-name/originals/founder-portrait.jpg
```

### 3. Language Switcher Support
Added the missing `ref:` field to all templates and sample files, using the same value as the `slug` field to ensure consistency across language versions.

### 4. Content Section Reorganization
Modified the template content sections to:
- Remove the standalone "Location Intelligence" section
- Integrate location context information into the "Market Presence" section
- Maintain consistent structure across all template levels

### 5. Required Layout Updates
Identified necessary changes to the `brand.html` layout:
- Add conditional handling for founder portraits
- Update market presence section to incorporate location intelligence content
- Ensure consistent labeling and styling across different profile types
- Add proper handling for different template levels (core/lite/full)

## Decisions Made

1. **Tiered Template Approach**: Chose a three-level system rather than a single customizable template to:
   - Provide clear guidance on what's required for each content level
   - Simplify content creation for different use cases
   - Map directly to our two-tier content strategy with an additional "core" level for rapid data entry

2. **Founder Portrait Location**: Decided to keep founder portraits with brand assets rather than creating a separate people directory:
   - Pros: Simplifies MVP implementation, clearer relationship, more intuitive
   - Cons: Potential duplication if founder has multiple brands, less scalable
   - Decision: Choose simplicity for MVP stage, revisit later if needed

3. **Reference Field Addition**: Added `ref: brand-slug` to all templates for language switching:
   - Used slug as the reference value for consistency
   - Added to all three template levels and sample files
   - This simple addition enables proper language navigation

4. **Layout Organization**: Consolidated "Location Intelligence" into "Market Presence":
   - Reduces redundancy in content organization
   - Creates clearer narrative flow in brand profiles
   - Still preserves all relevant location-based information

5. **Template Documentation**: Added extensive comments and documentation:
   - HTML comments at the top explaining template purpose and usage
   - YAML comments explaining field requirements
   - README.md file for the templates directory
   - Added to CLAUDE.md for project-wide documentation

## Resources

1. **Template Files Created**:
   - `_templates/brands/brand-core.md`
   - `_templates/brands/brand-lite.md`
   - `_templates/brands/brand-full.md`
   - `_templates/brands/README.md`

2. **Sample Files Updated**:
   - Serra Verde: Updated to core profile format
   - TeaTime: Updated to lite profile format
   - Taiga Spirits: Updated to full profile format
   - Sojourn Hotels: Updated to full profile format

3. **Multilingual Versions**:
   - Russian and Chinese versions of all sample files
   - Each following the appropriate template level

4. **Layout Updates Identified**:
   - brand.html: Needs update for founder portraits and section reorganization
   - brand-image.html: Needs update for founder portrait handling

## Insights & Learning

1. **Template Complexity Balance**: Found that having different template levels significantly reduces the barrier to entry for content creation while still maintaining the option for comprehensive profiles. This balances speed with completeness.

2. **Image Organization Trade-offs**: The decision about where to store founder portraits highlighted the tension between theoretical ideal organization (separate people directory) and practical implementation needs (keeping images with brands). For MVP stages, practical simplicity often trumps theoretical purity.

3. **Language Switching Dependencies**: The missing `ref` field demonstrated how seemingly small technical details can have significant impacts on core functionality. The language switcher is a critical multilingual feature that depends on consistent references across translations.

4. **Content Redundancy**: The overlap between "Market Presence" and "Location Intelligence" showed how content organization can evolve to become more logical and streamlined over time. Regular reviews of content structure are valuable to identify and eliminate redundancies.

5. **Documentation Importance**: The creation of comprehensive documentation across multiple levels (template comments, README file, CLAUDE.md updates) is essential for maintaining knowledge as the project grows and ensuring that all team members understand the templates.

## Next Actions

1. **Update Layout Files**:
   - Modify brand.html to handle founder portraits
   - Update section organization to reflect template changes
   - Add conditional logic for different profile types (core/lite/full)

2. **Update Include Files**:
   - Enhance brand-image.html to handle founder portraits
   - Update any related components that reference brand data

3. **Move Dev Journals**:
   - Create docs/dev_journals directory
   - Move existing journals from _scripts
   - Add README explaining their historical nature

4. **Image Script Updates**:
   - Ensure process_brand_images.sh correctly processes founder portraits
   - Update any related image handling scripts

5. **Documentation Updates**:
   - Create comprehensive guide for content creators on when to use each template
   - Update project documentation to reflect new template structure
   - Create visual flowchart for content creation process

6. **Testing**:
   - Test language switcher with updated ref fields
   - Verify each template level renders correctly
   - Test multilingual versions display properly