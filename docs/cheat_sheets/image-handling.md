# Brandmine Image Handling Cheat Sheet

*Last updated: May 2, 2025*

## 1. Image Preparation

### Standard Dimensions
- **Regular Images**: 1200×800px (3:2 ratio)
- **Portraits**: 800×1200px (2:3 ratio)
- **Icons**: 512×512px (1:1 ratio)

### File Formats
- **Photos**: JPG (max 300KB)
- **Logos/Icons**: PNG with transparency
- **Simple Graphics**: SVG when possible

## 2. Naming Convention (ALWAYS USE THIS)

```
purpose-descriptivename.extension
```

### Common Purposes:
- `hero` - Main banner images
- `founder` - Founder portraits
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

### For Brand Images:
```bash
./_scripts/process_brand_images.sh ru teatime
```

### For People Images:
```bash
./_scripts/process_people_images.sh
```

### For Other Images:
```bash
./_scripts/process_site_images.sh sectors
```

### For Taxonomy Icons:
```bash
./_scripts/process_icons.sh dimensions
```

## 5. Use in Templates

### Brand Images:
```liquid
{% include components/images/brand-image.html 
   country="ru"
   brand="teatime" 
   image="storefront" 
   purpose="hero"
   alt="TeaTime storefront in Moscow" %}
```

### Site Images:
```liquid
{% include components/images/site-image.html 
   category="sectors"
   image="wine" 
   purpose="hero"
   alt="Wine sector overview" %}
```

### Taxonomy Icons:
```liquid
{% include components/taxonomy-icon.html 
   system="dimensions"
   type="sectors" 
   name="wine" %}
```

## 6. Troubleshooting

- **Images not showing**: Check original exists in correct folder
- **Wrong size/dimensions**: Ensure correct aspect ratio in original
- **Process script error**: Verify file permissions and ImageMagick installation
- **Missing parameters**: Double-check all include parameters

## 7. Example Workflow

1. Prepare image at 1200×800px named `hero-storefront.jpg`
2. Place in `assets/images/brands/ru/teatime/originals/`
3. Run `./scripts/process_brand_images.sh ru teatime`
4. Use in template:
   ```liquid
   {% include components/images/brand-image.html 
      country="ru"
      brand="teatime" 
      image="storefront" 
      purpose="hero"
      alt="TeaTime storefront in Moscow" %}
   ```
5. Final output filenames will be:
   - `teatime-hero-storefront-400w.jpg`
   - `teatime-hero-storefront-800w.jpg`
   - `teatime-hero-storefront-1200w.jpg`