# Brandmine Image Guide: Working with Images

*Last updated: May 7, 2025*

This guide documents the workflow for adding, processing, and implementing images across the Brandmine platform.

## 1. Adding New Images to Assets

### Step 1: Prepare Your Image

**Standard Images:**
- Use 3:2 aspect ratio (1200×800px) for normal images
- Optimize file size (<300KB)
- Match appropriate style guideline:
  - Brand content: Textured Minimalism
  - Dimension content: Flat Color Minimalism
  - Data/maps: Geometric Minimalism
  - Team/testimonials: Natural Photography with brand filter

**Portrait/Founder Images:**
- Use 2:3 aspect ratio (800×1200px)
- Higher quality recommended for face details
- Same style guidelines as standard images

**Icons:**
- Create at 512×512px standard size for source files
- Use PNG format for complex icons with transparency
- Use SVG format for simple icons where possible
- Optimize before adding to repository

### Step 2: Name Your Image Properly

Use the purpose-first naming convention:
```
purpose-descriptivename.extension
```

**Standard Purposes:**

| Purpose | Usage | Example Filename |
|---------|-------|------------------|
| `hero` | Main banner images | `hero-storefront.jpg` |
| `founder` | Founder portraits | `founder-portrait.jpg` |
| `team` | Team member portraits | `team-member.jpg` |
| `gallery` | Image collections | `gallery-product.jpg` |
| `logo` | Brand logos | `logo-color.png` |
| `product` | Product imagery | `product-teapot.jpg` |
| `location` | Place imagery | `location-vineyard.jpg` |
| `testimonial` | Customer testimonials | `testimonial-customer.jpg` |
| `certificate` | Certifications | `certificate-organic.jpg` |
| `icon` | UI icons | `icon-export-ready.png` |

**Example input filenames:**
```
hero-storefront.jpg        # Standard image (3:2)
founder-portrait.jpg       # Founder portrait (2:3)
team-member.jpg            # Team portrait (2:3)
logo-color.png             # Logo with transparency
icon-export-ready.svg      # SVG icon
```

### Step 3: Place in Correct Directory

**For Brand Images:**
```
assets/images/brands/[country-code]/[brand-name]/originals/
```

Example:
```
assets/images/brands/ru/teatime/originals/hero-storefront.jpg
```

**For People Images:**
```
assets/images/people/originals/
```

**For Site Images:**
```
assets/images/[category]/originals/
```

Categories: `sectors`, `markets`, `attributes`, `signals`, `insights`, `site`, etc.

Example:
```
assets/images/sectors/originals/hero-wine.jpg
```

**For Icons:**
```
assets/images/icons/originals/          # For raster icons (PNG)
assets/includes/components/icons/       # For vector icons (SVG)
```

### Step 4: Process Images

#### Brand Images

```bash
./_scripts/process_brand_images.sh [country-code] [brand-name]
```

**Parameters:**
- `[country-code]`: Two-letter country code (e.g., `ru`, `in`, `cn`)
- `[brand-name]`: Brand slug/identifier (e.g., `teatime`, `dragonfly`)

**Example:**
```bash
./_scripts/process_brand_images.sh ru teatime
```

**What the script does:**
1. Locates original images in `assets/images/brands/ru/teatime/originals/`
2. Processes each image into multiple responsive sizes (400w, 800w, 1200w)
3. Applies appropriate sizing based on image purpose
4. Checks image proportions and warns if they don't match expected ratios
5. Outputs processed files to `assets/images/brands/ru/teatime/`

**Input vs Output Example:**

*Input:* `assets/images/brands/ru/teatime/originals/hero-storefront.jpg`  
*Outputs:*
- `assets/images/brands/ru/teatime/teatime-hero-storefront-400w.jpg`
- `assets/images/brands/ru/teatime/teatime-hero-storefront-800w.jpg`
- `assets/images/brands/ru/teatime/teatime-hero-storefront-1200w.jpg`

*Input:* `assets/images/brands/ru/teatime/originals/founder-portrait.jpg`  
*Outputs:*
- `assets/images/brands/ru/teatime/teatime-founder-portrait-400w.jpg`
- `assets/images/brands/ru/teatime/teatime-founder-portrait-800w.jpg`
- `assets/images/brands/ru/teatime/teatime-founder-portrait-1200w.jpg`

Note that founder/portrait images will be resized based on height rather than width, and a higher quality setting (90% vs 85%) will be used to preserve facial details.

#### People Images

```bash
./_scripts/process_people_images.sh
```

**What the script does:**
1. Locates original images in `assets/images/people/originals/`
2. Processes each image into multiple responsive sizes
3. Uses higher quality for portraits to preserve facial details
4. Checks image proportions and warns if they don't match the expected 2:3 ratio
5. Outputs processed files to `assets/images/people/`

**Input vs Output Example:**

*Input:* `assets/images/people/originals/team-georgie.jpg`  
*Outputs:*
- `assets/images/people/people-team-georgie-400w.jpg`
- `assets/images/people/people-team-georgie-800w.jpg`
- `assets/images/people/people-team-georgie-1200w.jpg`

#### Site Images

```bash
./_scripts/process_site_images.sh [optional_category]
```

**Parameters:**
- `[optional_category]`: Image category to process (e.g., `sectors`, `markets`)
  - If omitted, processes all categories

**Example:**
```bash
./_scripts/process_site_images.sh sectors
```

**What the script does:**
1. Locates original images in `assets/images/[category]/originals/`
2. Processes each image into multiple responsive sizes
3. Checks image proportions and warns if they don't match expected ratios
4. Outputs processed files to `assets/images/[category]/`

**Input vs Output Example:**

*Input:* `assets/images/sectors/originals/hero-wine.jpg`  
*Outputs:*
- `assets/images/sectors/sectors-hero-wine-400w.jpg`
- `assets/images/sectors/sectors-hero-wine-800w.jpg`
- `assets/images/sectors/sectors-hero-wine-1200w.jpg`

#### Apply Teal Filter to Team Photos

For applying the Brandmine teal brand filter to team/testimonial portraits:

```bash
./_scripts/apply_teal_filter.sh [input_directory] [output_directory]
```

**Example:**
```bash
./_scripts/apply_teal_filter.sh originals/ processed/
```

**What the script does:**
1. Applies a subtle teal (#38B2AC) filter at 12% opacity
2. Adjusts white balance slightly (modulate 100,100,97)
3. Processes all images in the input directory
4. Maintains original filenames in the output directory

Apply this filter to all team and testimonial provider portraits to create consistent brand-aligned imagery.

### Step 5: Add Attribution (if needed)

For third-party images:
```bash
./_scripts/add_image_attribution.py
```

## 2. Adding Images to Pages

### Using Brand Images

```liquid
{% include components/images/brand-image.html 
   country="ru"
   brand="teatime" 
   purpose="hero"
   image="storefront" 
   alt="TeaTime storefront in Moscow" %}
```

Parameters:
- `country`: Country code (required, e.g., "ru", "br", "cn")
- `brand`: Brand slug (required)
- `purpose`: Purpose identifier (required, e.g., "hero", "founder")
- `image`: Image name without purpose prefix (required)
- `alt`: Alt text (required)
- `class`: Additional CSS classes (optional)
- `ext`: File extension (optional, default: "jpg")

### Using Site Images

```liquid
{% include components/images/site-image.html 
   category="sectors"
   purpose="hero"
   image="wine" 
   alt="Wine sector overview" %}
```

Parameters:
- `category`: Image category (required, e.g., "sectors", "markets")
- `purpose`: Purpose identifier (required, e.g., "hero", "feature")
- `image`: Image name without purpose prefix (required)
- `alt`: Alt text (required)
- `class`: Additional CSS classes (optional)

### Using People Images

```liquid
{% include components/images/site-image.html 
   category="people"
   purpose="team"
   image="georgie" 
   alt="Georgie Yam, Founder" %}
```

### Using Icons

**SVG Icons** (inline):
```liquid
{% include components/icons/icon-name.svg %}
```

**PNG Icons** (as images):
```liquid
{% include components/images/site-image.html 
   category="icons"
   purpose="icon"
   image="export-ready" 
   alt="Export Ready Icon" %}
```

## 3. Common Use Cases

### Brand Hero Image
```liquid
{% include components/images/brand-image.html 
   country="ru"
   brand="teatime" 
   purpose="hero"
   image="storefront" 
   alt="TeaTime storefront in Moscow" %}
```

### Founder Portrait
```liquid
{% include components/images/brand-image.html 
   country="ru"
   brand="teatime" 
   purpose="founder"
   image="portrait" 
   alt="Alexei Sokolov, TeaTime founder" %}
```

### Sector Image
```liquid
{% include components/images/site-image.html 
   category="sectors"
   purpose="hero"
   image="overview" 
   alt="Wine sector overview" 
   class="full-width" %}
```

### Gallery Image
```liquid
{% include components/images/brand-image.html 
   country="ru"
   brand="teatime" 
   purpose="gallery"
   image="teapots" 
   alt="Handcrafted ceramic teapots" %}
```

### Team Member Portrait
```liquid
{% include components/images/site-image.html 
   category="people"
   purpose="team"
   image="georgie" 
   alt="Georgie Yam, Founder" %}
```

### SVG Icon (Proper Implementation)

For SVG icons, create a dedicated include file:

```html
<!-- _includes/components/icons/export-ready.svg -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M12 5l0 14M5 12l7-7 7 7"/>
</svg>
```

Then include it directly:

```liquid
{% include components/icons/export-ready.svg %}
```

## 4. Troubleshooting

### Image Not Showing
- Verify the file exists in expected location
- Check if image was processed with correct script
- Double-check parameter spelling in includes
- Confirm country code is correct for brand images

### Wrong Size/Proportions
- Ensure original has correct aspect ratio (3:2 or 2:3)
- Check script output for warnings about unusual proportions
- Re-run processing script after fixing originals

### Image Too Large/Slow
- Optimize original before processing
- Verify you're using the responsive include
- Check network tab in browser for loading speed

### Icons Not Displaying Correctly
- Verify SVG has proper viewBox attribute
- Ensure the viewBox starts at 0 0 and includes the full icon dimensions
- Make sure the icon uses appropriate stroke/fill attributes
- Check PNG transparency is preserved

## 5. Best Practices

1. **Consistency**
   - Follow established naming conventions
   - Use appropriate visual style for content type
   - Maintain standard aspect ratios

2. **Performance**
   - Optimize images before processing
   - Use appropriate formats (JPG for photos, PNG for transparency)
   - Use SVG for icons where possible

3. **Accessibility**
   - Always provide meaningful alt text
   - Don't embed text in images
   - Maintain sufficient color contrast

4. **Quality Control**
   - Check script output for warnings
   - Verify images display correctly on all devices
   - Review image quality before publishing

## 6. Visual Style Reference

| Content Type | Style | Format | Aspect Ratio | Example |
|--------------|-------|--------|--------------|---------|
| Brand Content | Textured Minimalism | JPG | 3:2 | Brand hero images |
| Founder Portraits | Textured Minimalism | JPG | 2:3 | Founder images |
| Dimension Content | Flat Color Minimalism | JPG | 3:2 | Sector cards |
| Data/Maps | Geometric Minimalism | JPG | 3:2 | Location intelligence |
| Team Photos | Natural Photography | JPG | 2:3 | Team members |
| Logos | Varies | PNG | Varies | Brand logos |
| Icons | Flat Color Minimalism | SVG/PNG | 1:1 | UI elements |

For full style details, see `docs/design/image-style-guide.md`.