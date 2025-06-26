# Practical Demonstration: Adding Brand "cn-dragon-tea"

## Scenario: Adding a new Chinese tea brand to the site

### Approach 1: Generic Naming (Recommended)

#### Step 1: Prepare images
```bash
# Place original images in the originals directory
mkdir -p assets/images/brands/cn-dragon-tea/originals
cp ~/Desktop/dragon-tea-photos/storefront.jpg assets/images/brands/cn-dragon-tea/originals/hero.jpg
cp ~/Desktop/dragon-tea-photos/logo.png assets/images/brands/cn-dragon-tea/originals/logo.png
```

#### Step 2: Process images
```bash
_scripts/core/process_images.sh brands cn-dragon-tea
```

#### Result: Files created automatically
```
assets/images/brands/cn-dragon-tea/
├── hero-400w.jpg
├── hero-800w.jpg
├── hero-1200w.jpg
├── logo-400w.png
├── logo-800w.png
└── logo-1200w.png
```

#### Step 3: Use in templates - IT JUST WORKS!
```liquid
<!-- In any template or page -->
{% include helpers/brand-image.html 
   brand_id="cn-dragon-tea" 
   image_type="hero" %}

<!-- Or use collection-image directly -->
{% include components/images/collection-image.html
   collection="brands"
   slug="cn-dragon-tea"
   purpose="hero"
   alt="Dragon Tea storefront" %}
```

**Total time: ~5 minutes**
**Code changes: 0**

---

### Approach 2: Descriptive Naming (Current problematic pattern)

#### Step 1: Prepare images with descriptive names
```bash
mkdir -p assets/images/brands/cn-dragon-tea/originals
# Must rename files BEFORE processing
cp ~/Desktop/dragon-tea-photos/storefront.jpg assets/images/brands/cn-dragon-tea/originals/hero-dragon-ceremony.jpg
cp ~/Desktop/dragon-tea-photos/logo.png assets/images/brands/cn-dragon-tea/originals/logo-color.png
```

#### Step 2: Process with specific names
```bash
# Process each file individually with correct naming
_scripts/utilities/process_single_image.sh assets/images/brands/cn-dragon-tea/originals/hero-dragon-ceremony.jpg
```

#### Result: Descriptively named files
```
assets/images/brands/cn-dragon-tea/
├── hero-dragon-ceremony-400w.jpg
├── hero-dragon-ceremony-800w.jpg
├── hero-dragon-ceremony-1200w.jpg
├── logo-color-400w.png
├── logo-color-800w.png
└── logo-color-1200w.png
```

#### Step 3: Update brand-image.html (REQUIRED!)
```liquid
<!-- Edit _includes/helpers/brand-image.html -->
<!-- Find the switch statement around line 40 and add: -->
{% when 'cn-dragon-tea' %}
  {% if include.image_type == 'hero' %}
    {% assign image_name = "dragon-ceremony" %}
  {% elsif include.image_type == 'logo' %}
    {% assign image_name = "color" %}
  {% endif %}
```

#### Step 4: If it doesn't work, debug
- Did you spell "dragon-ceremony" correctly in both places?
- Is the case statement in the right place?
- Did you save the file?
- Clear Jekyll cache and rebuild

**Total time: ~20 minutes (if no debugging needed)**
**Code changes: 1 file, 8 lines**

---

## What Happens If You Skip The Code Update?

### With Generic Naming
✅ Everything works perfectly - no code update needed

### With Descriptive Naming
❌ Images fail to load
❌ Browser console shows 404 errors
❌ The component tries to load "hero-400w.jpg" but file is named "hero-dragon-ceremony-400w.jpg"

## Proof: How collection-image.html Actually Works

Looking at lines 41-45 of collection-image.html:
```liquid
{% assign generic_filename = include.purpose %}
{% if include.name %}
  {% assign descriptive_filename = include.purpose | append: "-" | append: include.name %}
{% endif %}
```

And lines 76-82:
```liquid
{% if include.name %}
  {% assign primary_filename = descriptive_filename %}
  {% assign fallback_filename = generic_filename %}
{% else %}
  {% assign primary_filename = generic_filename %}
{% endif %}
```

**This means:**
1. If no `name` parameter → uses generic filename (hero-400w.jpg)
2. If `name` parameter provided → tries descriptive first, falls back to generic

**The brand-image.html helper's job is to provide that `name` parameter, which requires manual mapping for each brand!**

---

## The Hidden Cost: Maintenance Debt

Every brand with descriptive naming adds to a growing switch statement:

```liquid
{% case include.brand_id %}
  {% when 'ru-teatime' %}
    {% assign image_name = "storefront" %}
  {% when 'ru-seven-spices' %}
    {% assign image_name = "moscow-spice-market" %}
  {% when 'ru-altai-honey' %}
    {% assign image_name = "siberian-apiaries" %}
  {% when 'ru-taiga-spirits' %}
    {% assign image_name = "distillery" %}
  {% when 'br-serra-verde' %}
    {% assign image_name = "farm-view" %}
  {% when 'br-sojourn-hotels' %}
    {% assign image_name = "paraty-view" %}
  {% when 'cn-dragon-tea' %}
    {% assign image_name = "dragon-ceremony" %}
  <!-- This list grows forever... -->
{% endcase %}
```

With 100 brands, this file becomes a 400+ line maintenance nightmare!