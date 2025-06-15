# Daily Workflows

**Find any workflow in <30 seconds**

## Content Creation

### Adding a New Brand

**1. Create brand files (all languages):**
```bash
# Use template generator
python3 _scripts/content-creation/generate_brand_template.py ru teatime

# Creates:
# _brands/en/ru-teatime.md
# _brands/ru/ru-teatime.md
# _brands/zh/ru-teatime.md
```

**2. Add images:**
```bash
# Create directory structure
mkdir -p assets/images/brands/ru/newbrand/originals/

# Place original images:
# - hero-storefront.jpg (3:2 aspect ratio)
# - founder-portrait.jpg (2:3 aspect ratio)
# - logo-color.png

# Process images
_scripts/process_images.sh brands ru-teatime
```

**3. Verify and publish:**
```bash
# Check consistency
_scripts/validation/language_consistency_checker.py

# Update search indexes
_scripts/generate-all-json.py

# Test locally
bundle exec jekyll serve
```

### Adding a Founder Profile

```bash
# Generate founder template
python3 _scripts/content-creation/generate_article_template.py founder ru-alexei-sokolov

# Add portrait images
mkdir -p assets/images/people/originals/
# Place: founder-portrait.jpg

# Process images
_scripts/process_images.sh people
```

### Adding an Insight Article

```bash
# Generate insight template
python3 _scripts/content-creation/generate_article_template.py insights new-article-slug

# Choose category: brand-spotlight, founders-journey, market-momentum, location-intelligence

# Add hero image
mkdir -p assets/images/insights/originals/
# Place: hero-article-name.jpg

# Process images
_scripts/process_images.sh insights
```

### Adding a New Dimension

**1. Add to central configuration:**
```bash
# Edit _data/dimensions_config.yml
# Add new dimension with proper order number under appropriate type:
dimensions:
  sectors:  # or markets, attributes, signals
    items:
      - slug: new-dimension-slug
        order: 17  # Next sequential number
```

**2. Create dimension files (all languages):**
```bash
# Create markdown files for all languages
touch _dimensions/en/sectors/new-dimension-slug.md
touch _dimensions/ru/sectors/new-dimension-slug.md  
touch _dimensions/zh/sectors/new-dimension-slug.md

# Add front matter and content to each file:
# ---
# name: "Dimension Name"
# slug: "new-dimension-slug"
# type: "sector"  # or market, attribute, signal
# description: "Brief description"
# ---
```

**3. Add translations:**
```bash
# Add dimension name to translation files
# _data/translations/en.yml:
dimensions:
  sectors:
    new-dimension-slug: "Dimension Display Name"

# Repeat for ru.yml and zh.yml
```

**4. Automatic integration:**
- **No template updates needed** - dimensions automatically appear in:
  - Discovery page grids
  - Search filters
  - Dimension navigation
  - Brand/founder taxonomy displays
- Order controlled by `order` field in `dimensions_config.yml`
- Display names driven by translation files

## Image Processing

### Standard Image Workflow

**1. Prepare originals (correct aspect ratios):**
- **Content images**: 3:2 (1200×800px)
- **Portraits**: 2:3 (800×1200px)
- **Icons**: 1:1 (512×512px)

**2. Place in originals directory:**
```bash
# Brand images
assets/images/brands/[country]/[brand]/originals/

# Site images
assets/images/[category]/originals/

# People images
assets/images/people/originals/
```

**3. Process with appropriate script:**
```bash
# Brand images
_scripts/process_images.sh brands [country]-[brand]

# Site images (sectors, markets, etc.)
_scripts/process_images.sh [category]

# People images (team, testimonials)
_scripts/process_images.sh people
```

**4. Apply brand filter (team photos only):**
```bash
_scripts/image-processing/apply_teal_filter.sh originals/ processed/
```

### Image Implementation

**Brand images:**
```liquid
{% include components/images/brand-image.html
   country="ru" brand="teatime" purpose="hero" image="storefront"
   alt="TeaTime storefront in Moscow" %}
```

**Site images:**
```liquid
{% include components/images/site-image.html
   category="sectors" purpose="hero" image="wine"
   alt="Wine sector overview" %}
```

## Data Management

### Update Search Indexes
```bash
# Generate all JSON data files
_scripts/generate-all-json.py

# Individual generators
_scripts/data-generation/generate-brands-json.py
_scripts/data-generation/generate-founders-json.py
```

### Translation Management
```bash
# Check translation consistency
_scripts/validation/language_consistency_checker.py

# Find missing translation keys
_scripts/validation/find_translation_keys.py
```

## Testing & Validation

### Pre-Commit Checks
```bash
# Run full validation suite
_scripts/pre-commit_check.sh

# Individual checks
_scripts/validation/validate_yaml.sh
_scripts/validation/language_consistency_checker.py
bundle exec jekyll doctor
```

### Performance Testing
```bash
# Test build time (should be ~12-13s)
time JEKYLL_ENV=production bundle exec jekyll build

# If slow, regenerate optimizations:
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
```

### Mobile Testing
```bash
# Serve for mobile device testing
bundle exec jekyll serve --host=0.0.0.0

# Access from mobile: http://[your-ip]:4000
```

## Deployment

### GitHub Pages Deploy
```bash
# Production build
JEKYLL_ENV=production bundle exec jekyll build

# Verify _site directory
ls -la _site/

# Commit and push (auto-deploys via GitHub Pages)
git add .
git commit -m "Update content"
git push origin main
```

## Development Shortcuts

### Quick Commands
```bash
# Start development server
bundle exec jekyll serve --livereload

# Production build
JEKYLL_ENV=production bundle exec jekyll build

# Quick syntax check
bundle exec jekyll doctor
```

### VS Code Snippets
Create `.vscode/snippets.json`:
```json
{
  "brand-image": {
    "prefix": "brand-img",
    "body": [
      "{% include components/images/brand-image.html",
      "   country=\"$1\" brand=\"$2\" purpose=\"$3\" image=\"$4\"",
      "   alt=\"$5\" %}"
    ]
  }
}
```

## File Naming Conventions

### Content Files
- **Brands**: `[country-code]-[brand-name].md` (e.g., `ru-teatime.md`)
- **Founders**: `[country-code]-[founder-name].md` (e.g., `ru-alexei-sokolov.md`)
- **Images**: `[purpose]-[description].[ext]` (e.g., `hero-storefront.jpg`)

### Directory Structure
```
_brands/[lang]/[country-code]-[brand-name].md
_founders/[lang]/[country-code]-[founder-name].md
_insights/[lang]/[article-slug].md
_dimensions/[lang]/[type]/[dimension-slug].md
```

## Troubleshooting Quick Fixes

| Issue | Quick Fix |
|-------|-----------|
| Build fails | Run `bundle exec jekyll doctor` |
| Images not showing | Check file paths and run image processing scripts |
| Translation missing | Check `_data/translations/[lang].yml` |
| Slow build | Run `bundle exec jekyll clean` |
| Layout broken | Check section includes in `_includes/pages/` |

---

**Next**: [Technical Reference →](technical-reference.md)
