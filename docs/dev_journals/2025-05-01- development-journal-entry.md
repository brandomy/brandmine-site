# Development Journal: Image Management Strategy
**Date:** 2025-05-01  
**Topic:** Establishing standardized image organization and naming conventions

## 1. Problem Statement

As Brandmine grows, we needed to establish clear, consistent standards for image management that would:
- Create predictable file organization for scalable content creation
- Standardize naming conventions for automated processing 
- Define appropriate visual styles for different content types
- Document best practices to maintain quality and performance
- Support our multilingual implementation with appropriate accessibility
- Ensure technical consistency across our growing image library

With the site's three distinct visual styles (Textured Minimalism, Flat Color Minimalism, Geometric Minimalism) and varying image purposes, a comprehensive approach was needed to maintain visual coherence while optimizing for performance.

## 2. Approach

We decided to create two complementary documents:
1. **README.md for /assets/images/**: A technical reference document explaining file organization, naming conventions, and implementation details
2. **Image Style Guide**: A higher-level design document explaining our visual approach and style applications

For the image management system itself, we took a structured approach:
- Established a country-first organizational structure for brand images
- Created purpose-driven naming conventions for all images
- Standardized on 3:2 aspect ratio (horizontal) and 2:3 (vertical portraits)
- Defined specific visual styles for different content types
- Documented workflow for image processing and implementation

## 3. Implementation Details

### File Structure
```
assets/images/
├── brands/
│   └── [country-code]/         # Country code first (e.g., ru, in, cn)
│       └── [brand-name]/       # Brand name second
│           ├── originals/      # Original files
│           └── [responsive images]
```

### Naming Convention
Original images: `purpose-descriptive-name.extension`
Processed images: `[country-code]-[brand-name]-[purpose]-[descriptive-name]-[width]w.extension`

### Purpose Identifiers
Established standard purpose identifiers:
```
logo: Brand logos
hero: Main banner images
founder: Founder portraits
team: Group or staff photos
gallery: Image collections
product: Product imagery
location: Place imagery
certificate: Certifications
```

### Image Include Usage
```liquid
{% include components/images/brand-image.html 
   country="in"
   brand="brand-name" 
   image="descriptive-name" 
   purpose="purpose" 
   alt="Descriptive alt text" %}
```

### Dimension Standards
| Image Type | Aspect Ratio | Recommended Size | Generated Sizes |
|------------|--------------|------------------|-----------------|
| Hero Images | 3:2 | 1200×800px | 400w, 800w, 1200w |
| Gallery Images | 3:2 | 1200×800px | 400w, 800w, 1200w |
| Founder/People Portraits | 2:3 | 800×1200px | 400w, 800w, 1200w |
| Icons | - | 512×512px | Scaled as needed |

## 4. Decisions Made

| Decision | Rationale |
|----------|-----------|
| Country-first organization | Prevents brand name collisions across countries; makes it easier to find content |
| Purpose-first naming | Makes file purpose immediately clear; enables filtering and batch processing |
| 3:2 aspect ratio standard | Creates visual consistency; simplifies responsive design; matches camera output |
| Consistent gallery image size (1200×800px) | Allows for full-screen viewing on larger displays; maintains quality for zooming |
| Keeping founder/team images with brands | Simplifies content management; maintains logical association |
| 512×512px icon sources | Future-proofs for high-resolution displays; allows scaling to any size needed |
| JPG for illustrations >300KB | Balances quality with performance; significantly reduces page load times |
| Stylizing all photographs | Creates consistent visual identity; avoids raw photo inconsistencies |
| Maintaining three visual styles for different purposes | Creates clear visual language that differentiates content types |

## 5. Resources

1. Created comprehensive README.md with:
   - Directory structure
   - Naming conventions
   - Processing workflow
   - Best practices
   - Troubleshooting section
   - Image include usage examples

2. Identified existing scripts to reference:
   - `./_scripts/process_brand_images.sh`
   - `./_scripts/process_site_images.sh`
   - `./_scripts/process_people_images.sh`
   - `./_scripts/convert-to-jpg.sh`
   - `./_scripts/add_image_attribution.py`

3. Documented visual style framework with specific applications:
   - Textured Minimalism: For brand narrative content (hero, founder, insights)
   - Flat Color Minimalism: For taxonomy and UI elements
   - Geometric Minimalism: For data/maps/charts visualization

## 6. Insights & Learning

1. **Documentation as code**: Treating documentation as a first-class project artifact (rather than an afterthought) helps maintain consistency and reduce errors. The README.md approach brings documentation directly into the codebase.

2. **Purpose-driven naming**: The purpose-first naming convention creates much clearer organization than purely descriptive names, especially as the project scales. It enables both human browsing and automated processing.

3. **Balance of quality and performance**: The file format guidelines (JPG for most illustrations, PNG for transparency needs) create the right balance between visual quality and performance. The conversion script further helps optimize large files.

4. **Consistency vs. differentiation**: While maintaining visual consistency is important, having clearly differentiated styles for different content types (textured for narrative, flat for UI, geometric for data) creates stronger information hierarchy.

5. **Future-proofing structure**: The country-code organization future-proofs the structure for international expansion, preventing namespace collisions as we add brands from multiple countries.

## 7. Next Actions

1. **Update Image Processing Scripts**:
   - Modify scripts to support the country-code in directory structure
   - Update naming patterns in image processing output

2. **Create Reference Images**:
   - Generate example images for each visual style to serve as references
   - Add to design system documentation

3. **Audit Existing Images**:
   - Review current images for compliance with naming standards
   - Reorganize files that don't follow the country-code structure
   - Convert oversized PNGs to JPGs where appropriate

4. **Add README Files to Other Directories**:
   - Create similar documentation for other key directories
   - Prioritize: /_includes/, /_layouts/, /_data/, /assets/js/

5. **Enhance Component Documentation**:
   - Update brand-image.html include with comprehensive parameter documentation
   - Add examples for common use cases

6. **Visual Style Guide Integration**:
   - Complete the visual style guide that complements the technical README
   - Include examples of each style with specifications
