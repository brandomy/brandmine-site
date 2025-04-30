# Development Journal: Image System Implementation
Date: 2025-04-20

## Problem Statement
We needed to implement a comprehensive image management system for the Brandmine platform that would handle various image types (brands, people, site graphics), maintain proper attribution for external sources, and ensure responsive versions for optimal performance. The immediate catalyst was fixing placeholder images on the site, particularly with testimonials, but this evolved into developing a robust solution for all site imagery.

## Approach
1. Analyzed our existing image structure and identified inconsistencies
2. Established a clear directory organization with originals folders
3. Created specialized image processing scripts for different content types
4. Implemented attribution tracking for external image sources
5. Enhanced Jekyll includes for consistent image implementation
6. Developed multilingual image credits pages
7. Set up automation for improved workflow efficiency

## Implementation Details

### 1. Directory Structure Reorganization
We established a clear hierarchy that separates different image types:
- `assets/images/brands/[brand-name]/originals/` - For brand-specific images
- `assets/images/people/originals/` - For people/team photos (moving from team folder)
- `assets/images/site/originals/` - For site-wide design elements
- `assets/images/sectors/originals/` - For sector-specific imagery
- Added directories for collections: `assets/images/insights/` and `assets/images/tags/`

### 2. Image Processing Scripts
We implemented three specialized scripts:
- `process_brand_images.sh` - Processes brand-specific images
- `process_people_images.sh` - Processes people images with standardized "profile" purpose
- `process_site_images.sh` - Processes all other site images, updated to include our collection folders

Sample script update:
```bash
# Updated CATEGORIES array in process_site_images.sh
CATEGORIES=("site" "pages" "posts" "sectors" "insights" "tags")
```

### 3. Image Includes Implementation
We standardized on two include patterns:
- `brand-image.html` for brand-specific imagery
- `site-image.html` for all non-brand images

This dual approach balances specificity with simplicity, avoiding unnecessary complexity.

Example implementation:
```html
<!-- Updated team member image from direct <img> to include -->
<div class="team-member">
  {% include site-image.html 
     category="people"
     image="randal-eastman" 
     purpose="profile"
     alt="Randal Eastman"
     class="team-photo" %}
  <h3>Randal Eastman</h3>
  <p class="team-title">Founder & CEO</p>
  <!-- rest of content -->
</div>
```

### 4. Attribution System
We developed a comprehensive attribution system for external images:
- Created `_data/image_attributions.yml` for centralized attribution storage
- Implemented `_scripts/add_image_attribution.py` script for managing attributions
- Enhanced the script to support multiple image processing in one session
- Created multilingual image credits pages at `/[lang]/image-credits/`

Example attribution data:
```yaml
images:
  - filename: "moscow-gum.jpg"
    original_name: "andrew-konstantinov-y2kSjuA4Y4E-unsplash.jpg"
    source: "Unsplash"
    creator: "Andrew Konstantinov"
    url: "https://unsplash.com/photos/y2kSjuA4Y4E"
    license: "Unsplash License"
    path: "assets/images/sectors/originals/moscow-gum.jpg"
    category: "sectors"
```

### 5. GitHub Actions Workflow
We set up a GitHub Actions workflow for automating image processing:
- Created `.github/workflows/image-resize.yml`
- Configured it to trigger on changes to originals folders
- Set up the workflow to process images and commit the results
- Documented troubleshooting steps for future reference

## Decisions Made

1. **Two-include System vs. Three-include System**
   - We decided to use two includes (`brand-image.html` and `site-image.html`) rather than creating a separate `people-image.html`
   - This approach simplifies implementation while maintaining logical separation between brand assets and everything else
   - Using the `category` parameter in `site-image.html` provides sufficient differentiation

2. **Standardized "profile" Purpose for People Images**
   - We standardized on using "profile" as the purpose for all people/headshot images
   - This simplifies the processing script and creates predictable output paths
   - Considered but rejected additional purposes like "full" and "action" to keep the MVP simple

3. **Collection-specific Image Folders**
   - Added dedicated image folders for collections (`insights/`, `tags/`)
   - This aligns with our Jekyll collection structure and simplifies organization
   - Will help prevent confusion as content grows

4. **Attribution System Design**
   - Decided to keep clean filenames and store attribution metadata separately
   - Chose YAML for attribution data as it integrates well with Jekyll
   - Created multilingual credits pages rather than a single page for better user experience

5. **Enhanced Attribution Script**
   - Added multi-image processing capability to the attribution script
   - Implemented automatic extraction of Unsplash attribution from filenames
   - Used clear prompts and defaults for improved user experience

## Resources

1. **Updated Processing Scripts**
   - Enhanced `process_site_images.sh` with additional categories
   - Standardized `process_people_images.sh` with "profile" purpose

2. **New Attribution Script**
   - Created `add_image_attribution.py` with multi-image support
   - Added Unsplash attribution extraction

3. **Image Credits Templates**
   - Created multilingual image credits templates for EN, RU, and ZH
   - Added footer link structure in `_data/footer/[lang].yml` files

4. **GitHub Actions Workflow**
   - Implemented image processing workflow
   - Created debugging documentation

5. **Updated Image Strategy Document**
   - Comprehensive documentation of our image system
   - Reference for future development

## Insights & Learning

1. **Directory Structure Matters**
   - Clear, logical organization is critical as the site grows
   - The originals-based approach creates a consistent pattern for all image types
   - Having dedicated folders for collections aligns with our broader content structure

2. **Automation Improves Consistency**
   - Script-based image processing ensures consistent output
   - The attribution script maintains accurate record-keeping
   - GitHub Actions can automate the workflow but requires careful configuration

3. **Separation of Concerns**
   - Keeping brand images separate from other assets creates clearer organization
   - The two-include system maintains simplicity while supporting different use cases
   - The attribution system separates metadata from filenames for better maintainability

4. **Multilingual Considerations**
   - Image credits pages need language-specific implementations
   - Leveraging our existing translation system requires consistent key naming
   - Using the same attribution data across languages simplifies maintenance

5. **Attribution Importance**
   - Proper attribution is both legally required and ethically important
   - A centralized system makes compliance easier to maintain
   - The credits page provides transparency for users and protection for the site

## Next Actions

1. **Complete Image Migration**
   - Move all team photos to people/originals folder
   - Process with the people script
   - Update all team member template instances

2. **Implement Multilingual Credits Pages**
   - Create the image credits pages for all three languages
   - Add required translation keys
   - Update footer links in all language versions

3. **Attribution System Integration**
   - Begin using the attribution script for all new external images
   - Backfill attribution data for existing external images
   - Test the image-attribution.html include in appropriate contexts

4. **GitHub Actions Troubleshooting**
   - Revisit GitHub Actions workflow when more mission-critical
   - Apply the suggested debugging enhancements
   - Test with manual triggers

5. **Documentation Updates**
   - Create a quick reference guide for the team
   - Update our style guide with image implementation examples
   - Consider creating template snippet examples for common use cases

This implementation establishes a solid foundation for managing images across the Brandmine platform, balancing immediate needs with future scalability.
