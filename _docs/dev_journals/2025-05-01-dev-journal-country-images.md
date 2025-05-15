# Development Journal: Brand Image System Integration
**Date:** 2025-05-01  
**Topic:** Adding Country-Based Structure to Brand Image System

## 1. Problem Statement

We needed to implement a more robust image management system for Brandmine that would scale with our growing multi-country brand directory. The existing structure wasn't organized by country, which created potential naming conflicts as brands in different countries could have the same name. We also needed to standardize image processing, particularly for portraits and logos, while ensuring our templates reflected the updated organization.

## 2. Approach

We implemented a country-first organization approach with these key components:

1. **Directory Structure**: Reorganize brand images from `/assets/images/brands/[brand-slug]/` to `/assets/images/brands/[country_code]/[brand-slug]/`
2. **Data Connections**: Add country code references to our market YAMLs, connecting them to our countries reference file
3. **Template Updates**: Update all brand templates (core, lite, full) to use country codes in image paths
4. **Image Processing**: Modify our processing scripts to handle the country-based organization
5. **Include Update**: Update our brand-image.html include to require country parameter

## 3. Implementation Details

### Brand Image Directory Structure

```
assets/images/brands/[country_code]/[brand-slug]/originals/
```

### Data Structure Connections

Added `country_code` field to all markets in `_data/markets/en.yml`:

```yaml
- id: russia
  icon: russia
  country_code: ru
  short_description: "Content focusing on Russian brands..."
```

### Updated brand-image.html Include

```liquid
{% assign country = include.country %}
{% assign brand = include.brand %}
{% assign base_path = "/assets/images/brands/" | append: country | append: "/" | append: brand | append: "/" %}
```

### Template Image Path Updates

```yaml
# Image assets
logo: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/logo-color.png"
hero_image: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/hero-main.jpg"
founder_portrait: "/assets/images/brands/{{ page.country_code }}/{{ page.slug }}/originals/portrait-founder.jpg"
```

### Process Script Modifications

Updated scripts to handle country-specific directories and handle PNGs differently to preserve transparency:

```bash
if [[ "$EXT" == "png" ]]; then
  # For PNG, preserve transparency
  magick "$IMG" $RESIZE_OPT "$BRAND_DIR/$OUTPUT_FILENAME"
else
  # For JPG and other formats, optimize with quality setting
  magick "$IMG" $RESIZE_OPT -quality 85 "$BRAND_DIR/$OUTPUT_FILENAME"
fi
```

## 4. Decisions Made

| Decision | Rationale |
|----------|-----------|
| Added country_code field to markets | Creates clear relationship between markets and countries data |
| Used "portrait" instead of "profile" | More accurate industry terminology for vertical-oriented person images |
| Changed resize approach for portrait images | Better handles 2:3 aspect ratio for portraits vs. 3:2 for landscapes |
| Special handling for PNG files | Ensures transparency is preserved for logos and other transparent images |
| Required country parameter in brand-image.html | Makes the country code explicit to prevent errors |

## 5. Resources

1. **Updated Files**:
   - brand-image.html
   - process_brand_images.sh, process_people_images.sh, process_site_images.sh
   - brand templates (core, lite, full)
   - markets YAML files (en, ru, zh)

2. **Documentation**:
   - Updated README.md with country-specific image storage explanation
   - Added country code to processing instructions in template comments

## 6. Insights & Learning

1. **Data Relationship Management**: Creating explicit relationships between data entities (markets->countries) improves system clarity and prevents inconsistencies.

2. **Image Processing Considerations**: Different image types (portraits vs. landscapes, transparent vs. opaque) need different processing approaches for optimal results.

3. **Template Evolution**: Templates need to evolve alongside system architecture changes to maintain consistency.

4. **Script Optimization**: Adding conditionals to image processing based on file type improves output quality without requiring separate scripts.

5. **Internationalization Structure**: Language-specific considerations extend beyond content to data organization and relationships.

## 7. Next Actions

1. **Migration Plan**: Create a migration plan for existing brand images to move them to the country-specific structure.

2. **Testing Process**: Test the updated system with both new and migrated brands across all three languages.

3. **Documentation Updates**: Create comprehensive documentation for content creators on the new image system.

4. **Multi-Country Brands**: Consider handling for brands that exist in multiple countries (global brands).

5. **Image Optimization Audit**: Conduct an audit of image sizes and optimization to ensure optimal performance.

6. **Template Review**: Review all templates for other potential areas needing country code integration.
