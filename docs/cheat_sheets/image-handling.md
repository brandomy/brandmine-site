# Brandmine Image Handling Cheat Sheet

*Last updated: May 7, 2025*

## 1. Image Preparation

### Standard Dimensions
- **Regular Images**: 1200×800px (3:2 ratio)
- **Portraits**: 800×1200px (2:3 ratio)
- **Icons**: 512×512px (1:1 ratio)

### File Formats
- **Photos**: JPG (max 300KB)
- **Logos/Icons**: PNG with transparency
- **Simple Graphics**: SVG when possible

### Stylization
**Important**: All images must be stylized before being placed in the originals folder.

For hero images, use the **Textured Minimalism** style:
```bash
./stylize_images.sh input.jpg output.jpg standard
```

For founder portraits and interior content, use the **Muted Pastel** style:
```bash
./stylize_images.sh input.jpg output.jpg muted
```

## 2. Naming Convention (ALWAYS USE THIS)

```
purpose-descriptivename.extension
```

### Common Purposes:
- `hero` - Main banner images
- `founder` - Founder portraits (always use `founder-portrait.jpg` for all founder portraits)
- `logo` - Brand logos
- `gallery` - Product collection images
- `product` - Individual product images
- `location` - Venue or regional images
- `team` - Team member photos
- `icon` - UI or taxonomy icons

## 3. Place in Correct Directory

### For Brand Images:
```
assets/images/brands/[country-code]/[brand-name]/originals/
```

**Example:**
```
assets/images/brands/ru/teatime/originals/hero-storefront.jpg
assets/images/brands/ru/teatime/originals/founder-portrait.jpg
assets/images/brands/ru/teatime/originals/logo-color.png
```

### For Site Images:
```
assets/images/[category]/originals/
```

**Example:**
```
assets/images/sectors/originals/hero-wine.jpg
```

## 4. Process Images (Run Script)


### For People Images:
```bash
./_scripts/process_people_images.sh
```

### For Site Images:
```bash
./_scripts/process_site_images.sh sectors
```

### For Taxonomy Icons:
```bash
./_scripts/process_icons.sh dimensions
```

## 5. Use in Templates

### Brand Images:

#### Hero Image:
```liquid
{% include components/images/brand-image.html 
   country="ru"
   brand="teatime" 
   purpose="hero"
   image="storefront" 
   alt="TeaTime storefront in Moscow" %}
```

#### Founder Portrait:
```liquid
{% include components/images/brand-image.html 
   country="ru"
   brand="teatime" 
   purpose="founder"
   image="portrait" 
   alt="Alexei Sokolov, TeaTime founder" %}
```

#### Brand Logo:
```liquid
{% include components/images/brand-image.html 
   country="ru"
   brand="teatime" 
   purpose="logo"
   image="color" 
   ext="png"
   alt="TeaTime logo" %}
```

### Site Images:
```liquid
{% include components/images/site-image.html 
   category="sectors"
   purpose="hero"
   image="wine" 
   alt="Wine sector overview" %}
```


## 6. Parameter Reference

When using the `components/images/brand-image.html` include:

- **`country`**: Country code for the brand (e.g., "ru", "cn")
- **`brand`**: Brand slug/identifier (e.g., "teatime")
- **`purpose`**: Purpose identifier that was prefixed to the original image (e.g., "hero", "founder")
- **`image`**: The descriptive part of the image name *without* the purpose prefix (e.g., "storefront", "portrait")
- **`alt`**: Alt text for accessibility (required)
- **`ext`**: File extension (optional, default: "jpg")
- **`class`**: Additional CSS classes (optional)

The processing scripts handle different image types appropriately:
- Portrait/founder images are resized by height with higher quality (90%)
- Regular images are resized by width with standard quality (85%)
- Logos (PNG) preserve transparency

## 7. Example Workflow

1. Prepare image at the correct dimensions (1200×800px or 800×1200px)
2. Apply appropriate style using `stylize_images.sh`
3. Name as `founder-portrait.jpg` and place in `assets/images/brands/ru/teatime/originals/`
4. Run `./scripts/process_brand_images.sh ru teatime`
5. Use in template:
   ```liquid
   {% include components/images/brand-image.html 
      country="ru"
      brand="teatime" 
      purpose="founder"
      image="portrait"
      alt="Alexei Sokolov, TeaTime founder" %}
   ```
6. Final output filenames will be:
   - `teatime-founder-portrait-400w.jpg`
   - `teatime-founder-portrait-800w.jpg`
   - `teatime-founder-portrait-1200w.jpg`