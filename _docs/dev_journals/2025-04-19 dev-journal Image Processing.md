# Development Journal: Image Processing System
Date: 2025-04-19

## Problem Statement
We needed to implement a comprehensive image processing system for the Brandmine platform that adheres to our established Image Strategy document. This system needed to handle different types of images (brands, people, site graphics) and create responsive versions for optimal web performance. The immediate catalyst was fixing placeholder testimonial images on the homepage, but this evolved into developing a more robust solution for managing all site imagery.

## Approach
1. Analyzed our existing image strategy document to understand the intended organization structure
2. Evaluated current image includes (`brand-image.html` and `site-image.html`) to determine required file paths
3. Developed shell scripts to automate the processing of original images into responsive versions
4. Created a logical folder structure that separates brand assets from other types of images
5. Implemented separate scripts for brand and non-brand images to handle their different requirements
6. Tested the scripts with real images for testimonials (Dragonfly logo and Georgie Yam headshot)

## Implementation Details

### Directory Structure
We implemented a clear separation between brand assets and other site images:

```
assets/images/
├── brands/
│   ├── dragonfly/
│   │   ├── originals/
│   │   │   └── logo-color.png
│   │   ├── dragonfly-logo-color-400w.png
│   │   ├── dragonfly-logo-color-800w.png
│   │   └── dragonfly-logo-color-1200w.png
│   └── [other brands]/
├── people/
│   ├── originals/
│   │   └── georgie-yam.jpg
│   ├── people-profile-georgie-yam-400w.jpg
│   ├── people-profile-georgie-yam-800w.jpg
│   └── people-profile-georgie-yam-1200w.jpg
└── [other categories]/
```

### Image Processing Scripts
We created three specialized scripts:

1. **`process_brand_images.sh`** (renamed from `resize_images.sh`)
   - Processes brand-specific images from `assets/images/brands/*/originals/`
   - Creates responsive versions following pattern: `brandname-purpose-image-widthw.ext`
   - Preserves the original file extension (PNG, JPG, etc.)

2. **`process_people_images.sh`**
   - Specialized script for processing profile/headshot images
   - Creates responsive versions following pattern: `people-profile-name-widthw.ext`

3. **`process_site_images.sh`** (comprehensive version of `process_all_images.sh`)
   - Processes all non-brand image categories
   - Creates responsive versions following pattern: `category-purpose-image-widthw.ext`

### Image Include Templates
We enhanced the two image include templates to provide more flexibility:

1. **`brand-image.html`**
   - Used for brand assets (logos, product images, etc.)
   - Generates responsive `<img>` tags with `srcset` and `sizes` attributes
   - Added support for purpose parameter and file extension specification
   - Example: `{% include brand-image.html brand="dragonfly" image="color" purpose="logo" ext="png" alt="Dragonfly logo" %}`

2. **`site-image.html`**
   - Used for all non-brand images (people, site graphics, etc.)
   - Generates responsive `<img>` tags with appropriate paths
   - Example: `{% include site-image.html category="people" image="georgie-yam" purpose="profile" alt="Georgie Yam headshot" %}`

### Implementation for Testimonials
We updated the testimonial card images on the homepage from placeholder images to properly processed images:

1. **Dragonfly logo**:
   ```html
   <div class="testimonial-card__author-image">
     {% include brand-image.html 
        brand="dragonfly" 
        image="color" 
        purpose="logo"
        ext="png"
        alt="Dragonfly Therapeutic Retreats logo" %}
   </div>
   ```

2. **Georgie Yam headshot**:
   ```html
   <div class="testimonial-card__author-image">
     {% include site-image.html 
        category="people"
        image="georgie-yam" 
        purpose="profile"
        alt="Georgie Yam founder photo" %}
   </div>
   ```

### CSS Styling for Testimonial Images
We adjusted the CSS to increase the size of the testimonial images for better visibility:

```css
.testimonial-card__author-image {
  width: 80px;  /* Increased from 48px */
  height: 80px; /* Increased from 48px */
  border-radius: 50%;
  overflow: hidden;
  margin-right: var(--space-3);
  border: 2px solid var(--primary-100);
}
```

## Decisions Made

1. **Separate Scripts for Different Image Types**
   - We chose to maintain separate scripts for brand vs. non-brand images rather than one unified script
   - This separation provides greater flexibility and clarity, especially as our image needs grow more complex
   - Renamed scripts to use a consistent naming convention (`process_X_images.sh`)

2. **People Category for Founder Images**
   - We decided to place founder/people images in a separate `people` category rather than within brand folders
   - This approach avoids duplication if a person is associated with multiple brands
   - Enables specialized processing for portrait-style images

3. **Standardized Purpose Classifications**
   - For brand images: purpose is derived from filename prefixes (e.g., `logo-color.png` → purpose is "logo")
   - For people images: purpose is standardized as "profile" for all headshots
   - For other image types: purpose is extracted from filename or defaults to "general"

4. **Processing on Demand vs. Batch**
   - Current implementation processes all images in a category each time
   - We chose simplicity over optimization at this stage
   - Future enhancement: track modified dates to only process new/changed images

5. **Modern ImageMagick Command**
   - Updated scripts to use `magick` instead of deprecated `convert` command
   - Ensures compatibility with newer ImageMagick versions

## Resources

1. **Updated Scripts**
   - `_scripts/process_brand_images.sh` - For brand-specific images
   - `_scripts/process_people_images.sh` - For profile/headshot images
   - `_scripts/process_site_images.sh` - Comprehensive script for all non-brand images

2. **Include Templates**
   - `_includes/brand-image.html` - For brand assets
   - `_includes/site-image.html` - For all non-brand images

3. **Example Images**
   - Dragonfly logo in brand assets
   - Georgie Yam headshot in people category

## Insights & Learning

1. **Path Consistency is Critical**
   - The path structure in image includes must exactly match what the processing scripts generate
   - Misalignments can cause images to fail silently

2. **Script Organization Matters**
   - Clear, purpose-focused scripts are easier to maintain than generic multi-purpose ones
   - Descriptive naming prevents confusion, especially for future contributors

3. **Image Processing Optimizations**
   - Current implementation reprocesses all images each time
   - For large image sets, implementing change detection would improve performance

4. **Include Design**
   - The existing includes are well-designed, using responsive image techniques
   - The separation of brand vs. site includes aligns well with our directory structure

5. **CSS Compatibility**
   - Our CSS already properly targeted the image structure used in includes
   - This made integration seamless without CSS modifications

## Next Actions

1. **Enhancement Scripts**
   - Add optimization to only process new or modified images
   - Create script documentation for the development team

2. **Image Standards Documentation**
   - Document the expected naming conventions for original images
   - Create a quick reference guide for adding new image categories

3. **Additional Image Categorization**
   - Implement additional specialized image categories as needed
   - Consider standardizing image categories across the site

4. **Performance Testing**
   - Measure page load performance with responsive images
   - Test across different device types and connection speeds

5. **Automated Integration**
   - Consider implementing GitHub Actions for automated image processing on commit
   - This would eliminate manual script execution

By implementing this robust image processing system, we've established a foundation for efficient image management across the Brandmine platform that will scale well as our content grows.