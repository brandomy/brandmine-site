# Brandmine Image Handling Cheat Sheet

*Last updated: May 14, 2025*

## 1. Image Preparation

### Standard Dimensions
- **Regular Images**: 1200×800px (3:2 ratio)
- **Portraits**: 800×1200px (2:3 ratio)
- **Square Images**: 1200×1200px (1:1 ratio)
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
- `portrait` - General portrait images
- `founder` - Founder-specific portraits (use `founder-portrait.jpg`)
- `headshot` - Small team/testimonial photos
- `logo` - Brand logos
- `gallery` - Product collection images
- `product` - Individual product images
- `location` - Venue or regional images
- `team` - Team member photos
- `icon` - UI or taxonomy icons
- `thumbnail` - Preview images
- `feature` - Featured content images

## 3. Place in Correct Directory

### Collection-Based Structure:
```
assets/images/[collection]/[slug]/originals/
```

**Examples:**
```
# Brands (using full slug)
assets/images/brands/ru-teatime/originals/hero-storefront.jpg
assets/images/brands/br-serraverde/originals/founder-portrait.jpg

# People with categories
assets/images/people/team/olya-eastman/originals/headshot-professional.jpg
assets/images/people/testimonials/georgie-yam/originals/portrait-casual.jpg

# Sectors
assets/images/sectors/wine/originals/hero-vineyard.jpg
assets/images/sectors/hotels-resorts/originals/icon-category.png

# Insights
assets/images/insights/wine-trends-2025/originals/hero-market.jpg
```

## 4. Process Images (Run Script)

### Unified processing script:
```bash
# Process specific brand
./_scripts/process_images.sh brands ru-teatime

# Process all founders
./_scripts/process_images.sh founders

# Process specific sector
./_scripts/process_images.sh sectors wine

# Process everything
./_scripts/process_images.sh all
```

## 5. Use in Templates (NEW UNIFIED COMPONENT)

### All images now use the same component:

#### Brand Hero:
```liquid
{% include components/images/collection-image.html 
   collection="brands" 
   slug="ru-teatime" 
   purpose="hero"
   name="storefront"
   aspect="landscape"
   alt="TeaTime storefront in Moscow" %}
```

#### Founder Portrait:
```liquid
{% include components/images/collection-image.html 
   collection="brands" 
   slug="ru-teatime" 
   purpose="founder"
   aspect="portrait"
   alt="Alexei Sokolov, TeaTime founder" %}
```

#### Team Headshot:
```liquid
{% include components/images/collection-image.html 
   collection="people"
   category="team"
   slug="olya-eastman"
   purpose="headshot"
   aspect="square"
   alt="Olya Eastman" %}
```

#### Sector Hero:
```liquid
{% include components/images/collection-image.html 
   collection="sectors"
   slug="wine"
   purpose="hero"
   alt="Wine sector overview" %}
```

#### Logo:
```liquid
{% include components/images/collection-image.html 
   collection="brands"
   slug="ru-teatime"
   purpose="logo"
   aspect="square"
   ext="png"
   alt="TeaTime logo" %}
```

## 6. Parameter Reference

For the unified `collection-image.html` component:

- **`collection`**: Collection name (required) - brands, people, sectors, etc.
- **`category`**: Optional subcategory - team, testimonials, etc.
- **`slug`**: Unique identifier (required) - uses full slug like `ru-teatime`
- **`purpose`**: Image purpose (required) - hero, portrait, headshot, etc.
- **`name`**: Optional additional identifier - storefront, casual, etc.
- **`aspect`**: Aspect ratio (optional, default: landscape) - landscape, portrait, square
- **`alt`**: Alt text (required)
- **`ext`**: File extension (optional, default: jpg)
- **`loading`**: Loading priority (optional, default: lazy) - lazy, eager
- **`class`**: Additional CSS classes (optional)

## 7. Example Workflow

1. Prepare image at correct dimensions
2. Stylize using appropriate style
3. Name as `hero-storefront.jpg`
4. Place in `assets/images/brands/ru-teatime/originals/`
5. Run `./scripts/process_images.sh brands ru-teatime`
6. Use in template:
   ```liquid
   {% include components/images/collection-image.html 
      collection="brands"
      slug="ru-teatime" 
      purpose="hero"
      name="storefront"
      alt="TeaTime storefront" %}
   ```
7. Generated filenames:
   - `hero-storefront-400w.jpg`
   - `hero-storefront-800w.jpg`
   - `hero-storefront-1200w.jpg`

## 8. Mobile-First Considerations

The new component automatically handles responsive sizing based on purpose and aspect ratio:

- **Hero images**: Full width on mobile, progressively smaller on tablets/desktop
- **Portraits**: Optimized for smaller display on mobile
- **Thumbnails**: Small fixed sizes for efficient loading
- **Logos**: Consistent small sizes across breakpoints

Use `loading="eager"` for above-the-fold images:
```liquid
{% include components/images/collection-image.html 
   collection="brands"
   slug="ru-teatime"
   purpose="hero"
   loading="eager"
   alt="Hero image" %}
```


