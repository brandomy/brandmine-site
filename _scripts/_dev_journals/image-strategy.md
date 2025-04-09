# Brandmine Image Strategy: Organization & Implementation Guide

## Executive Summary

This document outlines a comprehensive image strategy for the Brandmine platform, focusing on organization, optimization, and implementation. The strategy is designed to ensure consistent, high-quality imagery across the platform while maintaining optimal performance and scalability as the site grows. It establishes naming conventions, folder structures, and automation processes that enable efficient management of brand imagery and site assets.

## 1. Image Organization Structure

### 1.1 Primary Directory Architecture

```
assets/
└── images/
    ├── brands/             # Brand-specific images
    │   └── [brand-name]/   # Each brand gets its own folder
    │       ├── originals/  # Original high-res images
    │       └── [generated responsive images]
    │
    ├── site/               # Site-wide design elements
    │   ├── layout/         # Layout elements (headers, backgrounds)
    │   ├── icons/          # UI icons and small graphics
    │   ├── logos/          # Site logos and logomarks
    │   └── ui/             # UI elements (buttons, decorations)
    │
    ├── pages/              # Page-specific images
    │   ├── home/           # Homepage images
    │   ├── about/          # About page images
    │   └── [other pages]/  # Other main sections
    │
    ├── posts/              # Blog post images
    │   └── YYYY-MM-DD-post-slug/  # Folder per post
    │
    ├── people/             # Team/people images
    │   ├── headshots/      # Professional portraits
    │   └── team/           # Group photos
    │
    └── sectors/            # Sector/industry imagery
        ├── hotels/         # Hotel sector images
        ├── spirits/        # Spirits sector images
        └── [other sectors]/
```

### 1.2 Brand Image Organization

Brand images are organized by brand name, with each brand having its own directory:

```
assets/images/brands/teatime/
├── originals/
│   ├── hero-storefront.jpg
│   ├── gallery-teapot.jpg
│   └── profile-founder.jpg
├── teatime-hero-storefront-400w.jpg
├── teatime-hero-storefront-800w.jpg
├── teatime-hero-storefront-1200w.jpg
├── teatime-gallery-teapot-400w.jpg
... etc
```

## 2. Image Naming Conventions

### 2.1 Brand Image Naming

Brand images follow this standardized naming pattern:

**Original files:**
```
purpose-imagename.jpg
```

**Examples:**
- `hero-storefront.jpg`
- `gallery-blue_teapot.jpg`
- `profile-founder.jpg`
- `logo-color.png`

**Generated responsive files:**
```
brandname-purpose-imagename-widthw.jpg
```

**Examples:**
- `teatime-hero-storefront-400w.jpg`
- `teatime-gallery-blue_teapot-800w.jpg`
- `teatime-profile-founder-1200w.jpg`

### 2.2 Standard Purpose Identifiers

Common purpose identifiers include:

| Identifier | Usage |
|------------|-------|
| `hero` | Large banner images at the top of pages |
| `gallery` | Images shown in product or brand galleries |
| `profile` | Portraits of founders or team members |
| `thumbnail` | Smaller preview images for listings |
| `feature` | Images highlighting specific features |
| `logo` | Brand logos (preferably transparent PNG) |
| `detail` | Close-up shots showing product details |
| `location` | Photos of facilities, factories, or stores |
| `product` | Product photography |

### 2.3 Non-Brand Image Naming

Non-brand images follow a similar pattern but may omit the brand component:

```
category-purpose-name-widthw.jpg
```

**Examples:**
- `home-hero-banner-1200w.jpg`
- `sector-hotels-header-800w.jpg`
- `ui-button-primary-400w.png`

## 3. Responsive Image Sizes

### 3.1 Standard Image Widths

All responsive images are generated in these standard widths:

- **400w**: Mobile devices
- **800w**: Tablets and smaller desktops
- **1200w**: Standard desktop displays
- **1600w**: Large desktop displays and hero images (optional)

### 3.2 Recommended Aspect Ratios

To maintain visual consistency across the platform, use these standard aspect ratios:

| Aspect Ratio | Typical Usage |
|--------------|---------------|
| 16:9 | Hero banners, wide feature images |
| 4:3 | Standard content images, product shots |
| 1:1 | Profile pictures, thumbnails, gallery previews |
| 3:4 | Portrait-oriented images |
| 2:1 | Wide panoramic headers |

### 3.3 Special Case: Logo Images

Logo images should be:
- Provided in PNG format with transparency
- Available in both light and dark versions when applicable
- Sized appropriately for various use cases (header, footer, social sharing)

## 4. Image Optimization Process

### 4.1 Automation Workflow

The image processing workflow uses a custom script to generate responsive versions automatically:

1. Place original high-resolution images in the appropriate `originals/` folder
2. Name them according to purpose-based naming convention
3. Run the image processing script
4. Responsive versions are automatically generated and placed in the parent directory

### 4.2 Image Processing Script

The script, located at `scripts/resize_images.sh`, automatically:
- Detects the purpose from the filename
- Creates multiple responsive sizes
- Applies appropriate optimization
- Places files in the correct directory
- Maintains consistent naming patterns

### 4.3 Quality Settings

Standard quality settings for optimal balance between file size and appearance:

- **JPEG quality**: 85% (good balance of quality and file size)
- **PNG compression**: Optimized for file size
- **SVG**: Minified when used for UI elements

## 5. Implementation in Jekyll

### 5.1 Responsive Image Include

The following Jekyll include makes it easy to use responsive images throughout the site:

```html
{% comment %}
  Responsive Brand Image Include
  
  Usage:
  {% include brand-image.html 
     brand="teatime" 
     image="storefront" 
     purpose="hero"
     alt="TeaTime storefront in Moscow" 
     class="featured-image" %}
{% endcomment %}

{% assign brand = include.brand %}
{% assign image = include.image %}
{% assign purpose = include.purpose %}
{% assign alt = include.alt %}
{% assign class = include.class %}
{% assign sizes = include.sizes | default: "(max-width: 600px) 400px, (max-width: 1200px) 800px, 1200px" %}
{% assign widths = include.widths | default: "400,800,1200" %}
{% assign widths_array = widths | split: "," %}
{% assign base_path = "/assets/images/brands/" | append: brand | append: "/" %}

<img src="{{ base_path | append: brand | append: "-" | append: purpose | append: "-" | append: image | append: "-" | append: widths_array[0] | append: "w.jpg" | relative_url }}"
     srcset="{% for width in widths_array %}{{ base_path | append: brand | append: "-" | append: purpose | append: "-" | append: image | append: "-" | append: width | append: "w.jpg" | relative_url }} {{ width }}w{% unless forloop.last %}, {% endunless %}{% endfor %}"
     sizes="{{ sizes }}"
     alt="{{ alt }}"
     {% if class %}class="{{ class }}"{% endif %}
     loading="lazy">
```

### 5.2 Usage Examples

**Basic Usage:**
```liquid
{% include brand-image.html 
   brand="teatime" 
   image="storefront" 
   purpose="hero"
   alt="TeaTime storefront in Moscow" %}
```

**With Custom Classes:**
```liquid
{% include brand-image.html 
   brand="teatime" 
   image="teapot" 
   purpose="gallery"
   alt="Signature teapot collection" 
   class="rounded shadow-sm" %}
```

**With Custom Sizes:**
```liquid
{% include brand-image.html 
   brand="teatime" 
   image="founder" 
   purpose="profile"
   alt="Alexei Sokolov, TeaTime founder" 
   sizes="(max-width: 768px) 100vw, 50vw" %}
```

### 5.3 Non-Brand Images Include

For non-brand images, use a similar include:

```html
{% comment %}
  Responsive Non-Brand Image Include
  
  Usage:
  {% include site-image.html 
     category="home"
     image="banner" 
     purpose="hero"
     alt="Brandmine connecting BRICS consumers" 
     class="full-width" %}
{% endcomment %}

{% assign category = include.category %}
{% assign image = include.image %}
{% assign purpose = include.purpose %}
{% assign alt = include.alt %}
{% assign class = include.class %}
{% assign sizes = include.sizes | default: "(max-width: 600px) 400px, (max-width: 1200px) 800px, 1200px" %}
{% assign widths = include.widths | default: "400,800,1200" %}
{% assign widths_array = widths | split: "," %}
{% assign base_path = "/assets/images/" | append: category | append: "/" %}

<img src="{{ base_path | append: category | append: "-" | append: purpose | append: "-" | append: image | append: "-" | append: widths_array[0] | append: "w.jpg" | relative_url }}"
     srcset="{% for width in widths_array %}{{ base_path | append: category | append: "-" | append: purpose | append: "-" | append: image | append: "-" | append: width | append: "w.jpg" | relative_url }} {{ width }}w{% unless forloop.last %}, {% endunless %}{% endfor %}"
     sizes="{{ sizes }}"
     alt="{{ alt }}"
     {% if class %}class="{{ class }}"{% endif %}
     loading="lazy">
```

## 6. Image Processing Tools

### 6.1 Recommended Tools

Several tools are available for image processing and optimization:

| Tool | Best Use Case | Notes |
|------|---------------|-------|
| **ImageMagick** | Batch processing via script | Command-line tool, very powerful |
| **Squoosh.app** | Manual optimization | Browser-based, excellent UI |
| **TinyPNG** | Simple compression | Good for quick batch optimization |
| **XnConvert** | Desktop batch processing | GUI for those who prefer visual tools |
| **GIMP** | Image editing + batch processing | Full image editor with scripting |

### 6.2 ImageMagick Installation

**Mac (using Homebrew):**
```bash
brew install imagemagick
```

**Ubuntu/Debian:**
```bash
sudo apt-get install imagemagick
```

**Windows:**
Download and install from [ImageMagick's website](https://imagemagick.org/script/download.php)

## 7. Automation Scripts

### 7.1 Core Image Processing Script

The main script for processing brand images (`scripts/resize_images.sh`):

```bash
#!/bin/bash
# Project-wide resize_images.sh
# Place this script in your project root

# Base directory for all brand images
BASE_DIR="assets/images/brands"

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Process a specific brand, or all brands if none specified
if [ -n "$1" ]; then
    BRANDS=("$1")
    echo "Processing brand: $1"
else
    # Get all brand directories
    BRANDS=()
    for DIR in "$BASE_DIR"/*/; do
        BRAND=$(basename "$DIR")
        BRANDS+=("$BRAND")
    done
    echo "Processing all brands: ${BRANDS[*]}"
fi

# Process each brand
for BRAND in "${BRANDS[@]}"; do
    BRAND_DIR="$BASE_DIR/$BRAND"
    ORIGINALS_DIR="$BRAND_DIR/originals"
    
    # Skip if originals directory doesn't exist
    if [ ! -d "$ORIGINALS_DIR" ]; then
        echo "No originals directory found for $BRAND, skipping."
        continue
    fi
    
    echo "Processing brand: $BRAND"
    
    # Process each original image
    for IMG in "$ORIGINALS_DIR"/*.{jpg,jpeg,png}; do
        # Skip if no files match the pattern
        [ -e "$IMG" ] || continue
        
        # Extract the filename without extension
        FILENAME=$(basename "$IMG")
        NAME="${FILENAME%.*}"
        EXT="${FILENAME##*.}"
        
        # Extract purpose if present in filename (format: purpose-name.jpg)
        if [[ "$NAME" == *-* ]]; then
            PURPOSE=$(echo "$NAME" | cut -d- -f1)
            IMAGE=$(echo "$NAME" | cut -d- -f2-)
        else
            PURPOSE="general"
            IMAGE="$NAME"
        fi
        
        echo "  Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"
        
        # Create each size
        for SIZE in 400 800 1200; do
            # Output format: brandname-purpose-image-width.jpg
            OUTPUT_FILENAME="${BRAND}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
            echo "    Creating $OUTPUT_FILENAME..."
            convert "$IMG" -resize "${SIZE}x" -quality 85 "$BRAND_DIR/$OUTPUT_FILENAME"
        done
    done
done

echo "All images have been processed!"
```

### 7.2 Extended Script for All Image Categories

For processing images in other categories beyond brands:

```bash
#!/bin/bash
# Process all image categories
# Place in scripts/process_all_images.sh

# Process brand images
echo "Processing brand images..."
./scripts/resize_images.sh

# Define additional image categories
CATEGORIES=("site" "pages" "posts" "people" "sectors")

# Process each category
for CATEGORY in "${CATEGORIES[@]}"; do
    CATEGORY_DIR="assets/images/$CATEGORY"
    
    # Skip if category doesn't exist
    if [ ! -d "$CATEGORY_DIR" ]; then
        echo "Category directory $CATEGORY_DIR not found, skipping."
        continue
    fi
    
    echo "Processing category: $CATEGORY"
    
    # Process each subcategory
    for SUBCAT_DIR in "$CATEGORY_DIR"/*/; do
        SUBCAT=$(basename "$SUBCAT_DIR")
        ORIGINALS_DIR="$SUBCAT_DIR/originals"
        
        # Skip if originals directory doesn't exist
        if [ ! -d "$ORIGINALS_DIR" ]; then
            continue
        fi
        
        echo "  Processing subcategory: $SUBCAT"
        
        # Process each original image
        for IMG in "$ORIGINALS_DIR"/*.{jpg,jpeg,png}; do
            # Skip if no files match the pattern
            [ -e "$IMG" ] || continue
            
            # Extract the filename without extension
            FILENAME=$(basename "$IMG")
            NAME="${FILENAME%.*}"
            EXT="${FILENAME##*.}"
            
            # Extract purpose if present in filename
            if [[ "$NAME" == *-* ]]; then
                PURPOSE=$(echo "$NAME" | cut -d- -f1)
                IMAGE=$(echo "$NAME" | cut -d- -f2-)
            else
                PURPOSE="general"
                IMAGE="$NAME"
            fi
            
            echo "    Processing: $FILENAME (Purpose: $PURPOSE, Image: $IMAGE)"
            
            # Create each size
            for SIZE in 400 800 1200; do
                OUTPUT_FILENAME="${CATEGORY}-${SUBCAT}-${PURPOSE}-${IMAGE}-${SIZE}w.${EXT}"
                echo "      Creating $OUTPUT_FILENAME..."
                convert "$IMG" -resize "${SIZE}x" -quality 85 "$SUBCAT_DIR/$OUTPUT_FILENAME"
            done
        done
    done
done

echo "All image categories have been processed!"
```

### 7.3 Script Usage Instructions

To use the scripts:

1. Save in your project's `scripts/` directory
2. Make executable with `chmod +x scripts/resize_images.sh`
3. Run from project root:
   ```bash
   # Process all brands
   ./scripts/resize_images.sh
   
   # Process a specific brand
   ./scripts/resize_images.sh teatime
   
   # Process all image categories
   ./scripts/process_all_images.sh
   ```

## 8. GitHub Action Integration (Future Implementation)

For future implementation, a GitHub Action can automate image processing whenever images are added to the repository.

### 8.1 GitHub Action Configuration

Create a file at `.github/workflows/image-resize.yml`:

```yaml
name: Resize Brand Images

on:
  push:
    paths:
      - 'assets/images/brands/*/originals/**'
      - 'assets/images/*/*/originals/**'

jobs:
  resize:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Set up ImageMagick
        run: sudo apt-get update && sudo apt-get install -y imagemagick
        
      - name: Process images
        run: |
          ./scripts/process_all_images.sh
          
      - name: Commit changes
        uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: "Automatically resize and optimize images"
          file_pattern: "assets/images/**/*.jpg assets/images/**/*.png"
```

### 8.2 Benefits of GitHub Action Implementation

When implemented, this GitHub Action will:
1. Automatically detect new images added to any `originals/` folder
2. Process them to create responsive versions
3. Commit the generated images back to the repository
4. Maintain consistent image naming and optimization across the project
5. Free team members from manual image processing

## 9. Best Practices for Image Management

### 9.1 General Guidelines

1. **Start with high-quality originals**: Always begin with images that are larger than needed and let the optimization process downsample them
2. **Use descriptive filenames**: Ensure filenames reflect content clearly
3. **Be consistent with naming conventions**: Follow the established patterns for all images
4. **Compress before uploading**: Consider compressing large originals before adding them to the repository
5. **Use appropriate image formats**:
   - JPEG for photographs
   - PNG for logos and images requiring transparency
   - SVG for icons and simple graphics
   - WebP for better compression (when browser support is not a concern)

### 9.2 Brand Image Requirements

For brand imagery specifically:

1. **Minimum dimensions**: Original images should be at least 1200px wide
2. **Maximum file size**: Keep original images under 5MB when possible
3. **Required images per brand**:
   - Hero image (16:9 aspect ratio)
   - Logo (with transparency)
   - At least 3 product/service images
   - Founder or team photo (when available)

### 9.3 SEO Best Practices

For optimal SEO:

1. **Use descriptive alt text** for all images
2. **Include relevant keywords** in filenames and alt text
3. **Ensure proper image sizing** to avoid layout shifts
4. **Implement lazy loading** for images below the fold
5. **Include structured data** for product images when appropriate

## 10. Image Display Examples

### 10.1 Brand Profile Hero Section

```html
<section class="brand-hero">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6">
        <h1>{{ brand.name }}</h1>
        <p class="lead">{{ brand.tagline }}</p>
        <div class="brand-meta">
          <span class="location">{{ brand.location }}</span>
          <span class="sector">{{ brand.sector }}</span>
        </div>
      </div>
      <div class="col-md-6">
        {% include brand-image.html 
          brand=brand.slug 
          image="storefront" 
          purpose="hero"
          alt=brand.name | append: " storefront in " | append: brand.location
          class="rounded shadow-lg" %}
      </div>
    </div>
  </div>
</section>
```

### 10.2 Brand Gallery Section

```html
<section class="brand-gallery">
  <div class="container">
    <h2>Product Gallery</h2>
    <div class="row">
      {% for product in brand.products limit:3 %}
        <div class="col-md-4">
          <div class="gallery-item">
            {% include brand-image.html 
              brand=brand.slug 
              image=product.slug 
              purpose="gallery"
              alt=product.name | append: " by " | append: brand.name
              class="img-fluid rounded" %}
            <h3>{{ product.name }}</h3>
            <p>{{ product.description | truncate: 100 }}</p>
          </div>
        </div>
      {% endfor %}
    </div>
  </div>
</section>
```

### 10.3 Sector Page Header

```html
<header class="sector-header">
  {% include site-image.html 
    category="sectors"
    image=sector.slug 
    purpose="hero"
    alt=sector.name | append: " sector"
    class="sector-hero-image" %}
  
  <div class="sector-title-container">
    <div class="container">
      <h1>{{ sector.name }}</h1>
      <p class="lead">{{ sector.description }}</p>
    </div>
  </div>
</header>
```

## 11. Troubleshooting Common Issues

### 11.1 Image Processing Script Issues

| Issue | Possible Solution |
|-------|------------------|
| "Command not found" error | Install ImageMagick with `brew install imagemagick` or relevant package manager |
| No images processed | Check that images are in correct `originals/` folders with proper extensions |
| Permission denied | Make script executable with `chmod +x scripts/resize_images.sh` |
| Images not appearing correct size | Check CSS for any styling overriding dimensions |

### 11.2 Jekyll Include Issues

| Issue | Possible Solution |
|-------|------------------|
| Images not displaying | Verify paths and make sure `relative_url` filter is being used |
| Wrong sizes loading | Check the `sizes` attribute is appropriate for your layout |
| Missing images | Ensure image naming follows expected pattern in include |
| Images not responsive | Verify srcset is properly implemented and not overridden by CSS |

## 12. Recommended Next Steps

1. **Implement the base directory structure** as outlined in section 1
2. **Set up the core image processing script** from section 7.1
3. **Create the Jekyll includes** for responsive images from section 5
4. **Develop documentation** for team members on image preparation
5. **Prepare templates** for common image use cases
6. **Create a brand image checklist** for consistent brand profiles

## 13. Conclusion

This image strategy provides a comprehensive framework for managing all imagery within the Brandmine platform. By following these guidelines and implementing the provided scripts and includes, the site will maintain high-quality, performant, and consistent images across all content types, contributing to a professional and cohesive user experience.

The strategy balances immediate needs for the MVP with consideration for future scalability, allowing the image management system to grow alongside the platform. By emphasizing automation and standardization, it reduces manual effort while ensuring consistent visual quality throughout the site.
