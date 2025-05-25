---
layout: styleguide
title: Image Handling
description: Brandmine's comprehensive image management system for consistent, high-performance visuals.
permalink: /en/styleguide/patterns/image-handling/
lang: en
ref: styleguide-patterns-image-handling
---

## Image Handling Overview

Our image handling system ensures consistent, high-quality visuals across the platform while maintaining optimal performance. The system uses a unified component approach that covers organization, naming conventions, responsive sizing, optimization, and implementation.

## Unified Image Component System

Brandmine uses a single, unified image component (`collection-image.html`) to handle all image types across the platform. This approach ensures consistency and makes image management straightforward.

### Collection-Based Organization

Images are organized by collection type, with optional categories and unique identifiers:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="font-family: monospace; font-size: 0.875rem; background-color: var(--neutral-100); padding: var(--space-4); border-radius: 4px; line-height: 1.5; white-space: pre; overflow-x: auto;">
assets/images/
├── brands/                 # Brand collection
│   └── [slug]/             # Full brand slug (e.g., ru-teatime)
│       ├── originals/      # Original high-res images
│       └── [responsive]    # Generated responsive images
│
├── founders/               # Founder collection
│   └── [slug]/             # Founder identifier
│       ├── originals/
│       └── [responsive]
│
├── people/                 # People collection
│   ├── team/               # Team category
│   │   └── [slug]/
│   └── testimonials/       # Testimonials category
│       └── [slug]/
│
├── sectors/                # Sector collection
│   └── [slug]/
│       ├── originals/
│       └── [responsive]
│
├── markets/                # Market collection
│   └── [slug]/
│       ├── originals/
│       └── [responsive]
│
├── insights/               # Insights collection
│   └── [slug]/
│       ├── originals/
│       └── [responsive]
│
└── site/                   # Site-wide elements
    ├── ui/                 # UI components
    ├── icons/              # General icons
    └── layout/             # Layout elements
    </div>
  </div>
</div>

## Image Naming Conventions

### Unified Naming Pattern

All images follow a purpose-based naming pattern:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>purpose-descriptivename.extension</code>
      <div>Original image naming pattern</div>

      <code>purpose-descriptivename-[width]w.extension</code>
      <div>Generated responsive image naming pattern</div>
    </div>

    <div style="margin-top: var(--space-4); margin-bottom: var(--space-2); font-weight: 600;">Examples:</div>
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>hero-storefront.jpg</code>
      <div>Original hero image of a storefront</div>

      <code>hero-storefront-800w.jpg</code>
      <div>Responsive version at 800px width</div>

      <code>founder-portrait.jpg</code>
      <div>Standard founder portrait</div>

      <code>logo-color.png</code>
      <div>Color version of a logo</div>
    </div>
  </div>
</div>

### Standard Purpose Identifiers

Common purpose identifiers used across all collections:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <code>hero</code>
      <div>Main banner images</div>

      <code>portrait</code>
      <div>General portrait images</div>

      <code>founder</code>
      <div>Founder-specific portraits</div>

      <code>headshot</code>
      <div>Small portraits for teams/testimonials</div>

      <code>gallery</code>
      <div>Product collection images</div>

      <code>logo</code>
      <div>Brand logos</div>

      <code>product</code>
      <div>Individual product images</div>

      <code>thumbnail</code>
      <div>Preview images</div>

      <code>feature</code>
      <div>Featured content images</div>

      <code>icon</code>
      <div>UI or taxonomy icons</div>
    </div>
  </div>
</div>

## Responsive Image Generation

The unified processing script generates three standard sizes:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>400w</strong>
      <div>Mobile devices and small screens</div>

      <strong>800w</strong>
      <div>Tablets and medium screens</div>

      <strong>1200w</strong>
      <div>Desktop displays</div>
    </div>

    <div style="margin-top: var(--space-4); margin-bottom: var(--space-2); font-weight: 600;">Orientation-Based Processing:</div>
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>Portrait images</strong>
      <div>Scale by height, 90% quality</div>

      <strong>Landscape images</strong>
      <div>Scale by width, 85% quality</div>
    </div>
  </div>
</div>

## Unified Processing Script

The image processing is handled by a single script that works across all collections:

{% include styleguide/code-example.html language="bash" preview=false
code='# Process specific collection and slug
./_scripts/process_images.sh brands ru-teatime

# Process entire collection
./_scripts/process_images.sh sectors

# Process all images
./_scripts/process_images.sh all' %}

### Processing Features

<div class="example-wrapper">
  <div class="example-preview">
    <ol style="font-size: 0.875rem; line-height: 1.4; margin-top: 0;">
      <li>Automatically detects image orientation (portrait vs landscape)</li>
      <li>Applies appropriate quality settings</li>
      <li>Portrait images scale by height to avoid oversizing</li>
      <li>Landscape images scale by width</li>
      <li>Preserves originals if they're smaller than target size</li>
      <li>Works consistently across all collections</li>
    </ol>
  </div>
</div>

## Using the Unified Component

All images use the same `collection-image.html` component:

{% capture basic_usage %}
<!-- Basic usage -->
{% raw %}
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   alt="TeaTime storefront" %}
{% endraw %}
{% endcapture %}

{% include styleguide/code-example.html
   language="liquid"
   preview=false
   code=basic_usage %}

### Component Parameters

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>Parameter</strong>
      <strong>Required</strong>
      <strong>Description</strong>

      <code>collection</code>
      <div>Yes</div>
      <div>Collection name (brands, people, sectors, etc.)</div>

      <code>slug</code>
      <div>Yes</div>
      <div>Unique identifier (e.g., ru-teatime)</div>

      <code>purpose</code>
      <div>Yes</div>
      <div>Image purpose (hero, portrait, logo, etc.)</div>

      <code>alt</code>
      <div>Yes</div>
      <div>Alt text for accessibility</div>

      <code>category</code>
      <div>No</div>
      <div>Optional subcategory (team, testimonials)</div>

      <code>name</code>
      <div>No</div>
      <div>Additional identifier (storefront, casual)</div>

      <code>aspect</code>
      <div>No</div>
      <div>Aspect ratio (landscape, portrait, square)</div>

      <code>ext</code>
      <div>No</div>
      <div>File extension (default: jpg)</div>

      <code>loading</code>
      <div>No</div>
      <div>Loading priority (default: lazy)</div>

      <code>class</code>
      <div>No</div>
      <div>Additional CSS classes</div>
    </div>
  </div>
</div>

### Common Usage Patterns

{% capture common_patterns %}
<!-- Brand hero image -->
{% raw %}
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   name="storefront"
   aspect="landscape"
   loading="eager"
   alt="TeaTime storefront in Moscow" %}
{% endraw %}

<!-- Founder portrait -->
{% raw %}
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="founder"
   aspect="portrait"
   alt="Alexei Sokolov, TeaTime founder" %}
{% endraw %}

<!-- Team headshot -->
{% raw %}
{% include components/images/collection-image.html
   collection="people"
   category="team"
   slug="olya-eastman"
   purpose="headshot"
   aspect="square"
   alt="Olya Eastman" %}
{% endraw %}

<!-- Sector hero -->
{% raw %}
{% include components/images/collection-image.html
   collection="sectors"
   slug="wine"
   purpose="hero"
   alt="Russian wine industry" %}
{% endraw %}

<!-- Logo -->
{% raw %}
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="logo"
   aspect="square"
   ext="png"
   alt="TeaTime logo" %}
{% endraw %}
{% endcapture %}

{% include styleguide/code-example.html
   language="liquid"
   preview=false
   code=common_patterns %}

## Mobile-First Responsive Behavior

The component implements mobile-first sizes based on purpose and aspect ratio:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>Hero images</strong>
      <div>100vw on mobile → 50vw on desktop</div>

      <strong>Portraits</strong>
      <div>50vw on mobile → 33vw on desktop</div>

      <strong>Thumbnails</strong>
      <div>45vw on mobile → fixed 250px on desktop</div>

      <strong>Logos</strong>
      <div>Fixed small sizes across all breakpoints</div>

      <strong>Gallery images</strong>
      <div>45vw on mobile → 25vw on desktop</div>
    </div>
  </div>
</div>

### Loading Priority

Use `loading="eager"` for above-the-fold images:

{% capture loading_example %}
<!-- Above-the-fold hero image -->
{% raw %}
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   loading="eager"
   alt="Hero image" %}
{% endraw %}

<!-- Below-the-fold gallery image (default lazy loading) -->
{% raw %}
{% include components/images/collection-image.html
   collection="brands"
   slug="ru-teatime"
   purpose="gallery"
   name="product"
   alt="Product gallery" %}
{% endraw %}
{% endcapture %}

{% include styleguide/code-example.html
   language="liquid"
   preview=false
   code=loading_example %}

## Workflow Example

Here's a complete workflow for adding a new brand image:

<div class="example-wrapper">
  <div class="example-preview">
    <ol style="font-size: 0.875rem; line-height: 1.4; margin-top: 0;">
      <li>Prepare image at correct dimensions (1200×800px for landscape)</li>
      <li>Apply appropriate style if needed</li>
      <li>Name as <code>hero-storefront.jpg</code></li>
      <li>Place in <code>assets/images/brands/ru-teatime/originals/</code></li>
      <li>Run <code>./scripts/process_images.sh brands ru-teatime</code></li>
      <li>Use in template:
        <div style="font-family: monospace; font-size: 0.875rem; background-color: var(--neutral-100); padding: var(--space-2); margin-top: var(--space-2); border-radius: 4px;">
          {% raw %}{% include components/images/collection-image.html
     collection="brands"
     slug="ru-teatime"
     purpose="hero"
     name="storefront"
     alt="TeaTime storefront" %}{% endraw %}
        </div>
      </li>
      <li>Generated filenames will be:
        <ul style="font-size: 0.875rem; margin-top: var(--space-1);">
          <li><code>hero-storefront-400w.jpg</code></li>
          <li><code>hero-storefront-800w.jpg</code></li>
          <li><code>hero-storefront-1200w.jpg</code></li>
        </ul>
      </li>
    </ol>
  </div>
</div>

## Best Practices

### 1. Use Full Slugs
Always use complete slugs that include all necessary identifiers:
- Brands: `ru-teatime` (includes country code)
- Founders: `br-eduardo-santos`
- People: Full name slugs like `olya-eastman`

### 2. Specify Aspect Ratio
Include the `aspect` parameter for better responsive handling:
- `landscape` for hero images
- `portrait` for founder portraits
- `square` for logos and headshots

### 3. Consider Loading Priority
Use `loading="eager"` for critical above-the-fold images to improve perceived performance.

### 4. Proper Alt Text
Always provide meaningful alt text for accessibility and SEO benefits.

### 5. File Organization
Keep originals in the `originals/` subdirectory to maintain a clean structure.

## Troubleshooting

### Common Issues and Solutions

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>Images not appearing</strong>
      <div>Check collection and slug parameters match directory structure</div>

      <strong>Wrong responsive behavior</strong>
      <div>Add appropriate <code>aspect</code> parameter</div>

      <strong>Processing errors</strong>
      <div>Ensure originals are in correct directory with proper naming</div>

      <strong>Performance issues</strong>
      <div>Use appropriate <code>loading</code> attribute and optimize source images</div>

      <strong>Missing images in production</strong>
      <div>Verify all generated sizes exist after processing</div>
    </div>
  </div>
</div>

### Script Issues

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>ImageMagick not found</strong>
      <div>Install with <code>brew install imagemagick</code> or appropriate package manager</div>

      <strong>Permission denied</strong>
      <div>Make script executable: <code>chmod +x _scripts/process_images.sh</code></div>

      <strong>No images processed</strong>
      <div>Check that images are in <code>originals/</code> folders with correct extensions</div>
    </div>
  </div>
</div>

## Migration from Old System

If migrating from the old system:

1. Update all image includes to use `collection-image.html`
2. Change parameter names:
   - `brand` → `slug`
   - `image` → `name` (when needed)
   - Add `collection` parameter
   - Add `aspect` for optimal sizing
3. Run the unified processing script on all collections
4. Test responsive behavior across devices

## SEO Best Practices

The unified component maintains SEO best practices:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
      <strong>Descriptive filenames</strong>
      <div>Purpose-based naming with descriptive elements</div>

      <strong>Alt text</strong>
      <div>Required parameter ensures all images have alt text</div>

      <strong>Responsive images</strong>
      <div>Appropriate sizes for all devices</div>

      <strong>Lazy loading</strong>
      <div>Default behavior for below-fold images</div>

      <strong>Performance optimization</strong>
      <div>Automated compression and sizing</div>
    </div>
  </div>
</div>
