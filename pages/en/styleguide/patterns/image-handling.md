---
layout: styleguide
title: Image Handling
description: Brandmine's comprehensive image management system for consistent, high-performance visuals.
permalink: /en/styleguide/patterns/image-handling/
lang: en
---

## Image Handling Overview

Our image handling system ensures consistent, high-quality visuals across the platform while maintaining optimal performance. This system covers organization, naming conventions, responsive sizing, optimization, and implementation.

## Image Organization Structure

Images are organized by purpose and content type in a structured directory system:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="font-family: monospace; font-size: 0.875rem; background-color: var(--neutral-100); padding: var(--space-4); border-radius: 4px; line-height: 1.5; white-space: pre; overflow-x: auto;">
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
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">text</span>
    <pre><code class="language-text">assets/
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
        └── [other sectors]/</code></pre>
  </div>
</div>

### Brand Image Organization

Brand images are organized by brand name, with each brand having its own directory:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="font-family: monospace; font-size: 0.875rem; background-color: var(--neutral-100); padding: var(--space-4); border-radius: 4px; line-height: 1.4;">
      assets/images/brands/teatime/<br>
      ├── originals/<br>
      │   ├── hero-storefront.jpg<br>
      │   ├── gallery-teapot.jpg<br>
      │   └── profile-founder.jpg<br>
      ├── teatime-hero-storefront-400w.jpg<br>
      ├── teatime-hero-storefront-800w.jpg<br>
      ├── teatime-hero-storefront-1200w.jpg<br>
      ├── teatime-gallery-teapot-400w.jpg<br>
      └── ... etc
    </div>
  </div>
</div>

## Image Naming Conventions

### Brand Image Naming

Brand images follow this standardized naming pattern:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>purpose-imagename.jpg</code>
      <div>Original image naming pattern</div>
      
      <code>brandname-purpose-imagename-widthw.jpg</code>
      <div>Generated responsive image naming pattern</div>
    </div>
    
    <div style="margin-top: var(--space-4); margin-bottom: var(--space-2); font-weight: 600;">Examples:</div>
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>hero-storefront.jpg</code>
      <div>Original hero image of a storefront</div>
      
      <code>teatime-hero-storefront-800w.jpg</code>
      <div>Responsive version at 800px width</div>
    </div>
  </div>
</div>

### Standard Purpose Identifiers

Common purpose identifiers for image naming:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>hero</code>
      <div>Large banner images at the top of pages</div>
      
      <code>gallery</code>
      <div>Images shown in product or brand galleries</div>
      
      <code>profile</code>
      <div>Portraits of founders or team members</div>
      
      <code>thumbnail</code>
      <div>Smaller preview images for listings</div>
      
      <code>feature</code>
      <div>Images highlighting specific features</div>
      
      <code>logo</code>
      <div>Brand logos (preferably transparent PNG)</div>
      
      <code>detail</code>
      <div>Close-up shots showing product details</div>
      
      <code>location</code>
      <div>Photos of facilities, factories, or stores</div>
      
      <code>product</code>
      <div>Product photography</div>
    </div>
  </div>
</div>

### Non-Brand Image Naming

Non-brand images follow a similar pattern but may omit the brand component:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>category-purpose-name-widthw.jpg</code>
      <div>Non-brand image naming pattern</div>
    </div>
    
    <div style="margin-top: var(--space-4); margin-bottom: var(--space-2); font-weight: 600;">Examples:</div>
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>home-hero-banner-1200w.jpg</code>
      <div>Hero banner for the homepage</div>
      
      <code>sector-hotels-header-800w.jpg</code>
      <div>Header image for the hotels sector page</div>
      
      <code>ui-button-primary-400w.png</code>
      <div>UI element for a primary button</div>
    </div>
  </div>
</div>

## Responsive Image Sizes

All responsive images are generated in these standard widths:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>400w</strong>
      <div>Mobile devices</div>
      
      <strong>800w</strong>
      <div>Tablets and smaller desktops</div>
      
      <strong>1200w</strong>
      <div>Standard desktop displays</div>
      
      <strong>1600w</strong>
      <div>(Optional) Large desktop displays and hero images</div>
    </div>
  </div>
</div>

### Recommended Aspect Ratios

To maintain visual consistency across the platform, use these standard aspect ratios:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>16:9</strong>
      <div>Hero banners, wide feature images</div>
      
      <strong>4:3</strong>
      <div>Standard content images, product shots</div>
      
      <strong>1:1</strong>
      <div>Profile pictures, thumbnails, gallery previews</div>
      
      <strong>3:4</strong>
      <div>Portrait-oriented images</div>
      
      <strong>2:1</strong>
      <div>Wide panoramic headers</div>
    </div>
  </div>
</div>

### Special Case: Logo Images

Logo images should be:
- Provided in PNG format with transparency
- Available in both light and dark versions when applicable
- Sized appropriately for various use cases (header, footer, social sharing)

## Image Optimization Process

### Automation Workflow

The image processing workflow uses a custom script to generate responsive versions automatically:

<div class="example-wrapper">
  <div class="example-preview">
    <ol style="font-size: 0.875rem; line-height: 1.4; margin-top: 0;">
      <li>Place original high-resolution images in appropriate <code>originals/</code> folder</li>
      <li>Name them according to the purpose-based naming convention</li>
      <li>Run the image processing script (<code>scripts/resize_images.sh</code>)</li>
      <li>Responsive versions are automatically generated in the correct sizes</li>
    </ol>
  </div>
</div>

### Image Processing Script

The script, located at `scripts/resize_images.sh`, automatically:
- Detects the purpose from the filename
- Creates multiple responsive sizes
- Applies appropriate optimization
- Places files in the correct directory
- Maintains consistent naming patterns

{% include styleguide/code-example.html language="bash" preview=false
code='# Process images for a specific brand
./scripts/resize_images.sh teatime

# Process all brand images
./scripts/resize_images.sh

# Process all image categories
./scripts/process_all_images.sh' %}

### Quality Settings

Standard quality settings for optimal balance between file size and appearance:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>JPEG quality</strong>
      <div>85% (good balance of quality and file size)</div>
      
      <strong>PNG compression</strong>
      <div>Optimized for file size</div>
      
      <strong>SVG</strong>
      <div>Minified when used for UI elements</div>
    </div>
  </div>
</div>

{% include styleguide/code-example.html language="bash" preview=false
code='# From resize_images.sh script
convert "$IMG" -resize "${SIZE}x" -quality 85 "$BRAND_DIR/$OUTPUT_FILENAME"' %}

## Implementation in Jekyll

### Responsive Image Includes

Jekyll includes make it easy to use responsive images throughout the site:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>brand-image.html</code>
      <div>For brand-specific imagery</div>
      
      <code>site-image.html</code>
      <div>For site-wide design elements and other images</div>
    </div>
  </div>
</div>

{% capture example_code %}
<!-- For brand images -->
{% raw %}
{% include brand-image.html 
   brand="teatime" 
   image="storefront" 
   purpose="hero"
   alt="TeaTime storefront in Moscow" 
   class="featured-image" %}
{% endraw %}

<!-- For non-brand images -->
{% raw %}
{% include site-image.html 
   category="home"
   image="banner" 
   purpose="hero"
   alt="Brandmine connecting BRICS consumers" 
   class="full-width" %}
{% endraw %}
{% endcapture %}

{% include styleguide/code-example.html 
   language="liquid" 
   preview=false
   code=example_code %}

### Brand Image Include Implementation

The brand image include automatically generates all the necessary HTML for responsive images:

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">{% comment %}
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

&lt;img src="{{ base_path | append: brand | append: "-" | append: purpose | append: "-" | append: image | append: "-" | append: widths_array[0] | append: "w.jpg" | relative_url }}"
     srcset="{% for width in widths_array %}{{ base_path | append: brand | append: "-" | append: purpose | append: "-" | append: image | append: "-" | append: width | append: "w.jpg" | relative_url }} {{ width }}w{% unless forloop.last %}, {% endunless %}{% endfor %}"
     sizes="{{ sizes }}"
     alt="{{ alt }}"
     {% if class %}class="{{ class }}"{% endif %}
     loading="lazy"&gt;</code></pre>
  </div>
</div>

### Usage Examples

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr; gap: var(--space-4);">
      <div>
        <div style="font-weight: 600; margin-bottom: var(--space-2);">Basic Usage:</div>
        <div style="font-size: 0.875rem; font-family: monospace; background-color: var(--neutral-100); padding: var(--space-2); border-radius: 4px; line-height: 1.4;">
          {% raw %}{% include brand-image.html 
   brand="teatime" 
   image="storefront" 
   purpose="hero"
   alt="TeaTime storefront in Moscow" %}{% endraw %}
        </div>
      </div>
      
      <div>
        <div style="font-weight: 600; margin-bottom: var(--space-2);">With Custom Classes:</div>
        <div style="font-size: 0.875rem; font-family: monospace; background-color: var(--neutral-100); padding: var(--space-2); border-radius: 4px; line-height: 1.4;">
          {% raw %}{% include brand-image.html 
   brand="teatime" 
   image="teapot" 
   purpose="gallery"
   alt="Signature teapot collection" 
   class="rounded shadow-sm" %}{% endraw %}
        </div>
      </div>
      
      <div>
        <div style="font-weight: 600; margin-bottom: var(--space-2);">With Custom Sizes:</div>
        <div style="font-size: 0.875rem; font-family: monospace; background-color: var(--neutral-100); padding: var(--space-2); border-radius: 4px; line-height: 1.4;">
          {% raw %}{% include brand-image.html 
   brand="teatime" 
   image="founder" 
   purpose="profile"
   alt="Alexei Sokolov, TeaTime founder" 
   sizes="(max-width: 768px) 100vw, 50vw" %}{% endraw %}
        </div>
      </div>
    </div>
  </div>
</div>

## Image Processing Tools

Several tools are available for image processing and optimization:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr auto; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>ImageMagick</strong>
      <div>Command-line tool for batch processing</div>
      <div>Used in our automation scripts</div>
      
      <strong>Squoosh.app</strong>
      <div>Browser-based tool for manual optimization</div>
      <div>Excellent UI</div>
      
      <strong>TinyPNG</strong>
      <div>Web service for simple compression</div>
      <div>Good for quick batch optimization</div>
      
      <strong>XnConvert</strong>
      <div>Desktop app for batch processing</div>
      <div>GUI for those who prefer visual tools</div>
      
      <strong>GIMP</strong>
      <div>Full image editor with batch capabilities</div>
      <div>Good for editing and scripting</div>
    </div>
  </div>
</div>

## Image Requirements by Context

Different contexts require specific image characteristics:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>Hero images</strong>
      <div>1600+ pixels wide, 16:9 aspect ratio, primary subject clearly visible</div>
      
      <strong>Brand logos</strong>
      <div>PNG format with transparency, available in light and dark versions</div>
      
      <strong>Headshots</strong>
      <div>1:1 aspect ratio, consistent framing (head and shoulders), neutral background</div>
      
      <strong>Product images</strong>
      <div>Clean background, consistent lighting, accurate colors</div>
      
      <strong>Gallery images</strong>
      <div>4:3 aspect ratio, minimum 1200px wide, consistent style within sets</div>
      
      <strong>Blog featured images</strong>
      <div>16:9 aspect ratio, minimum 1200px wide, relevant to the content</div>
    </div>
  </div>
</div>

## SEO Best Practices

For optimal SEO with images:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>Descriptive filenames</strong>
      <div>Use relevant keywords separated by hyphens</div>
      
      <strong>Alt text</strong>
      <div>Provide meaningful alternative text for all images</div>
      
      <strong>Proper sizing</strong>
      <div>Avoid layout shifts by specifying dimensions</div>
      
      <strong>Image compression</strong>
      <div>Optimize file sizes for faster loading</div>
      
      <strong>Lazy loading</strong>
      <div>Implement for images below the fold</div>
      
      <strong>Structured data</strong>
      <div>Include schema markup for product images when appropriate</div>
    </div>
  </div>
</div>

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Example of SEO-optimized image --&gt;
&lt;img src="/assets/images/brands/teatime/teatime-product-premium-darjeeling-800w.jpg"
     alt="TeaTime Premium Darjeeling Tea - Organic loose leaf black tea from Darjeeling, India"
     width="800"
     height="600"
     loading="lazy"&gt;</code></pre>
  </div>
</div>

## Troubleshooting Common Issues

### Image Processing Script Issues

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>"Command not found" error</strong>
      <div>Install ImageMagick with <code>brew install imagemagick</code> or relevant package manager</div>
      
      <strong>No images processed</strong>
      <div>Check that images are in correct <code>originals/</code> folders with proper extensions</div>
      
      <strong>Permission denied</strong>
      <div>Make script executable with <code>chmod +x scripts/resize_images.sh</code></div>
      
      <strong>Images not appearing correct size</strong>
      <div>Check CSS for any styling overriding dimensions</div>
    </div>
  </div>
</div>

### Jekyll Include Issues

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>Images not displaying</strong>
      <div>Verify paths and make sure <code>relative_url</code> filter is being used</div>
      
      <strong>Wrong sizes loading</strong>
      <div>Check the <code>sizes</code> attribute is appropriate for your layout</div>
      
      <strong>Missing images</strong>
      <div>Ensure image naming follows expected pattern in include</div>
      
      <strong>Images not responsive</strong>
      <div>Verify srcset is properly implemented and not overridden by CSS</div>
    </div>
  </div>
</div>

## Implementation Guidelines

### Best Practices for Image Implementation

1. **Responsive images**
   - Always use the responsive image includes
   - Provide appropriate `sizes` attribute for complex layouts
   - Test rendering on various device sizes

2. **Image quality**
   - Start with high-quality source images
   - Keep original images in the `originals/` folder
   - Let the optimization process handle resizing and compression

3. **Naming conventions**
   - Follow the established purpose-based naming patterns
   - Use descriptive, keyword-rich filenames
   - Be consistent with naming across the site

4. **Alt text**
   - Provide meaningful alternative text for all images
   - Include relevant keywords naturally
   - Describe the image content and purpose

5. **Performance optimization**
   - Implement lazy loading for images below the fold
   - Avoid unnecessarily large images
   - Use appropriate image formats (JPEG for photos, PNG for logos)

6. **Process automation**
   - Use the provided scripts for image processing
   - Maintain the directory structure
   - Follow the workflow for adding new images