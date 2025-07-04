# Troubleshooting and Tools Guide

**Resolve issues in 2 minutes or less**

---

## 🚨 Build Issues

### Jekyll Build Fails

**Symptoms**: Build stops with error, site won't generate

**Quick Diagnostics**:
```bash
# Run complete validation suite
_scripts/core/pre-commit_check.sh

# Check Jekyll configuration
bundle exec jekyll doctor

# Verbose build output for detailed errors
JEKYLL_ENV=production bundle exec jekyll build --verbose
```

**Common Causes and Fixes**:

#### YAML Syntax Errors
```bash
# Check front matter formatting
_scripts/validation/validate_yaml.sh

# Look for:
# - Missing quotes around strings with special characters
# - Incorrect indentation (use 2 spaces, not tabs)
# - Missing colons after keys
# - Unescaped quotes within quoted strings
```

#### Missing Includes
```bash
# Verify include file paths exist
find _includes -name "*.html" | grep -v ".swp"

# Check for typos in include statements:
grep -r "{% include" _layouts/ _includes/ | grep -v ".swp"
```

#### Liquid Syntax Errors
```bash
# Check for unclosed tags
grep -r "{% " _layouts/ _includes/ | grep -v "endcomment\|endif\|endfor\|endcapture"

# Common issues:
# - Missing {% endfor %} or {% endif %}
# - Unmatched {% comment %} / {% endcomment %}
# - Invalid Liquid variable names
```

#### Missing Translation Keys
```bash
# Find missing translation keys
_scripts/validation/find_translation_keys.py

# Add missing keys to:
# _data/translations/en.yml
# _data/translations/ru.yml
# _data/translations/zh.yml
```

---

### Slow Build Performance

**Symptoms**: Build takes >20 seconds (normal target: <15s)

**Quick Performance Fixes**:
```bash
# Regenerate performance optimizations
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py

# Test current build time
time JEKYLL_ENV=production bundle exec jekyll build
```

**If Still Slow**:
```bash
# Clear Jekyll cache
rm -rf _site .jekyll-cache

# Check for oversized images
find assets/images -size +1M -type f

# Verify image processing completed
ls -la assets/images/brands/*/

# Check for development artifacts in assets/
find assets/ -name "*.tmp" -o -name "*.log" -o -name ".DS_Store"
```

**Performance Targets**:
- **Development builds**: <25 seconds
- **Production builds**: <15 seconds
- **Clean rebuilds**: <30 seconds

---

### Development Server Won't Start

**Symptoms**: `bundle exec jekyll serve` fails

**Diagnostics**:
```bash
# Check Ruby and bundle versions
ruby --version        # Should be 2.7+
bundle --version      # Should be latest

# Update dependencies
bundle update

# Check for port conflicts
lsof -i :4000

# Try different port
bundle exec jekyll serve --port 4001
```

**Common Issues**:
- Port 4000 already in use
- Outdated gem dependencies
- Incorrect Ruby version
- Missing system dependencies

---

## 🖼️ Image Issues

### Images Not Displaying

**Symptoms**: Broken image icons, missing images on site

**Quick Diagnostics**:
```bash
# Check if original exists
ls assets/images/brands/[brand-id]/originals/

# Verify processed images were generated
ls assets/images/brands/[brand-id]/

# Check front matter matches filenames
grep -A 10 "images:" _brands/en/[brand-file].md
```

**Common Fixes**:

#### Missing Original Images
```bash
# Verify file exists with correct naming
ls assets/images/brands/[brand-id]/originals/hero-*.jpg

# Should follow context-aware naming:
# hero-storefront.jpg (not hero-brand-name-storefront.jpg)
# logo-color.png (not logo-brand-name-color.png)
```

#### Processing Not Run
```bash
# Process specific brand images
_scripts/core/process_images.sh brands [brand-id]

# Process all brand images
_scripts/core/process_images.sh brands

# Verify ImageMagick is installed
magick -version
```

#### Front Matter Mismatch
```yaml
# Ensure front matter matches filename
images:
  hero:
    name: "storefront"     # Must match hero-storefront.jpg
    alt: "Description"
    ext: "jpg"
```

### Image Processing Fails

**Symptoms**: Processing script errors, no responsive images generated

**Diagnostics**:
```bash
# Check ImageMagick installation
which magick
magick -version

# Test processing with verbose output
_scripts/core/process_images.sh brands [brand-id] --verbose

# Check file permissions
ls -la assets/images/brands/[brand-id]/originals/
```

**Common Issues**:
- ImageMagick not installed or not in PATH
- Incorrect file permissions
- Corrupted source images
- Insufficient disk space

---

## 🌐 Translation Issues

### Missing Translation Keys

**Symptoms**: English text appearing in Russian/Chinese versions

**Quick Fix**:
```bash
# Find all missing translation keys
_scripts/validation/find_translation_keys.py

# Add missing keys to translation files:
# _data/translations/en.yml
# _data/translations/ru.yml
# _data/translations/zh.yml
```

### Language Consistency Problems

**Symptoms**: Different content between language versions

**Validation**:
```bash
# Check language consistency
_scripts/validation/language_consistency_checker.py

# Verify all required language files exist
_scripts/validation/check_language_consistency.sh
```

**Common Issues**:
- Missing language versions of content files
- Different front matter between language versions
- Inconsistent image references across languages

---

## 🧩 Component Issues

### Universal Card Not Displaying

**Symptoms**: Card content not showing or incorrectly formatted

**Quick Checks**:
```liquid
# Verify universal card syntax
{% include components/cards/universal-card.html
   item=content_object              # Must be valid content object
   type="brand"                     # Must be: brand, insight, founder, testimonial
   config_set="universal-card" %}   # Must be exactly this value
```

**Common Issues**:
- Missing or incorrect `type` parameter
- Invalid `item` object (null or undefined)
- Wrong `config_set` value
- Missing configuration in `_data/component_defaults.yml`

### Card Configuration Not Working

**Symptoms**: Default card behavior not matching expected configuration

**Check Configuration**:
```yaml
# Verify _data/component_defaults.yml
cards:
  universal-card:
    brand:
      layout_variant: "full-hero-with-overlay"
      sections:
        header:
          show_metric_overlay: true
        footer:
          enable_split_footer: true
```

**Debug Steps**:
```bash
# Check if configuration file is valid YAML
python3 -c "import yaml; yaml.safe_load(open('_data/component_defaults.yml'))"

# Verify configuration is being loaded
grep -r "component_defaults" _includes/components/
```

---

## 📊 Data and JSON Issues

### Search Data Not Updating

**Symptoms**: New content not appearing in search results

**Quick Fix**:
```bash
# Regenerate all JSON data
python3 _scripts/core/generate-all-json.py

# Check generated files
ls -la _data/*.json

# Verify JSON is valid
python3 -m json.tool _data/brands.json > /dev/null
```

### Language Mapping Issues

**Symptoms**: Language switching not working, wrong URLs

**Regenerate Language Data**:
```bash
# Update language mapping
_scripts/utilities/generate-language-map.py

# Update navigation cache
_scripts/utilities/generate-navigation-cache.py

# Check generated data
cat _data/language_map.json | python3 -m json.tool
```

---

## 🔧 Development Tools

### Pre-Commit Validation

**Complete validation before any commit**:
```bash
# Run full validation suite
_scripts/core/pre-commit_check.sh

# Individual validation components:
_scripts/validation/validate_yaml.sh                    # YAML syntax
_scripts/validation/check_language_consistency.sh       # Cross-language consistency
_scripts/validation/find_translation_keys.py           # Missing translations
```

### Performance Monitoring

**Track build performance**:
```bash
# Time production builds
time JEKYLL_ENV=production bundle exec jekyll build

# Monitor file sizes
du -sh _site/
du -sh assets/images/

# Check asset optimization
find assets/images -name "*.jpg" -exec identify {} \; | grep -v "400w\|800w\|1200w"
```

### Data Management Tools

**Keep data synchronized**:
```bash
# Update all search indexes
python3 _scripts/core/generate-all-json.py

# Regenerate performance optimizations
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py

# Check data consistency
python3 -c "
import json
brands = json.load(open('_data/brands.json'))
print(f'Brands: {len(brands)}')
founders = json.load(open('_data/founders.json'))
print(f'Founders: {len(founders)}')
"
```

---

## 🎯 Quick Command Reference

### Essential Commands
```bash
# Development server
bundle exec jekyll serve

# Production build with timing
time JEKYLL_ENV=production bundle exec jekyll build

# Complete validation
_scripts/core/pre-commit_check.sh

# Process images for specific content
_scripts/core/process_images.sh [collection] [identifier]

# Update all data
python3 _scripts/core/generate-all-json.py
```

### Diagnostic Commands
```bash
# Check Jekyll setup
bundle exec jekyll doctor

# Verify Ruby environment
ruby --version && bundle --version

# Check file permissions
find assets/images -type f ! -perm -644

# Validate YAML files
find . -name "*.yml" -exec python3 -c "import yaml; yaml.safe_load(open('{}'))" \;
```

### Performance Commands
```bash
# Build time analysis
time JEKYLL_ENV=production bundle exec jekyll build

# Asset size analysis
du -sh assets/images/*/

# Cache optimization
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
```

---

## 🆘 Emergency Procedures

### Complete System Reset
```bash
# 1. Clear all caches
rm -rf _site .jekyll-cache

# 2. Reinstall dependencies
bundle install
npm install

# 3. Regenerate all data
python3 _scripts/core/generate-all-json.py
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py

# 4. Rebuild site
JEKYLL_ENV=production bundle exec jekyll build
```

### Rollback Bad Changes
```bash
# Check git status
git status

# Reset to last known good state
git checkout HEAD -- [modified-files]

# Or reset entire working directory
git reset --hard HEAD
```

### Validate Everything
```bash
# Complete system validation
_scripts/core/pre-commit_check.sh

# If validation passes but issues persist:
# 1. Check _logs/ for detailed error information
# 2. Review recent commits for changes
# 3. Test with minimal content set
# 4. Check system dependencies (Ruby, ImageMagick, Node)
```

---

## 📞 Advanced Debugging

### Feature Workflow Templates
**For complex debugging scenarios**: See `_templates/tutorials/workflows/feature-workflow-template.md` for systematic debugging processes

### Build Analysis
```bash
# Analyze build performance bottlenecks
JEKYLL_ENV=production bundle exec jekyll build --profile

# Check for large files affecting build
find . -size +10M -type f | grep -v ".git"

# Monitor memory usage during build
/usr/bin/time -l bundle exec jekyll build
```

### System Status Check
**Current Build Performance**: ~14.4 seconds ✅
**Component System**: Universal Card 100% deployed ✅
**Image System**: 100% standardized ✅
**Cross-Language**: Perfect EN/RU/ZH consistency ✅

---

**Cross-References:**
- **Technical Standards**: See [technical-standards.md](technical-standards.md) for architecture patterns
- **Workflows**: See [setup-and-workflows.md](setup-and-workflows.md) for content creation procedures
- **Master Navigation**: See [brandmine-guide.md](brandmine-guide.md) for complete documentation overview
