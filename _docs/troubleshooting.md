# Troubleshooting Guide

**Resolve issues in <2 minutes**

## Build Issues

### Jekyll Build Fails

**Symptoms**: Build stops with error, site won't generate

**Diagnostics**:
```bash
# Run full validation
_scripts/core/pre-commit_check.sh

# Check Jekyll configuration
bundle exec jekyll doctor

# Verbose build output
JEKYLL_ENV=production bundle exec jekyll build --verbose
```

**Common causes**:
- **YAML syntax errors**: Check front matter formatting
- **Missing includes**: Verify include file paths are correct
- **Liquid syntax errors**: Check for unclosed tags
- **Missing translation keys**: Run `_scripts/validation/find_translation_keys.py`

### Slow Build Performance

**Symptoms**: Build takes >20 seconds (normal: 12-13s)

**Quick fix**:
```bash
# Regenerate performance optimizations
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py

# Test build time
time JEKYLL_ENV=production bundle exec jekyll build
```

**If still slow**:
- Clear `_site/` directory: `rm -rf _site`
- Check for large images: `find assets/images -size +1M`
- Verify image processing completed correctly

### Development Server Won't Start

**Symptoms**: `bundle exec jekyll serve` fails

**Diagnostics**:
```bash
# Check port availability
lsof -i :4000

# Check bundle status
bundle check

# Full reinstall if needed
bundle install --redownload
```

## Content Issues

### Images Not Displaying

**Symptoms**: Broken image links, missing images

**Step 1 - Check file exists**:
```bash
# Verify processed images exist
ls assets/images/brands/ru/teatime/

# Should see files like:
# teatime-hero-storefront-400w.jpg
# teatime-hero-storefront-800w.jpg  
# teatime-hero-storefront-1200w.jpg
```

**Step 2 - Check include syntax**:
```liquid
{% comment %} Verify all required parameters {% endcomment %}
{% include components/images/brand-image.html 
   country="ru"              # Must match directory
   brand="teatime"           # Must match directory
   purpose="hero"            # Must match filename prefix
   image="storefront"        # Must match filename suffix
   alt="Description" %}      # Required for accessibility
```

**Step 3 - Re-process if needed**:
```bash
_scripts/image-processing/process_images.sh brands ru-teatime
```

### Translation Missing

**Symptoms**: English text appears in non-English pages

**Quick diagnosis**:
```bash
# Find missing keys
_scripts/validation/find_translation_keys.py

# Check specific language file
cat _data/translations/ru.yml | grep -i "missing_key"
```

**Fix process**:
1. Add missing key to `_data/translations/[lang].yml`
2. Use proper YAML nesting structure
3. Test with `bundle exec jekyll serve`

### Wrong Layout/Section Order

**Symptoms**: Page sections appear in wrong order or missing

**Check configuration**:
```yaml
# _data/page_sections.yml
brands:
  sections: ["hero", "impact", "content", "contact-cta"]  # Order matters
  hero:
    panel_type: "panel--hero"
```

**Verify section files exist**:
```bash
ls _includes/pages/brands/
# Should contain: hero.html, impact.html, content.html, contact-cta.html
```

## Language Issues

### Language Switcher Broken

**Symptoms**: Language links don't work or show wrong URLs

**Regenerate language mapping**:
```bash
_scripts/utilities/generate-language-map.py
```

**Check page language setup**:
```yaml
# All content files need:
lang: en                    # Language code
ref: page-identifier       # Same across languages for linking
permalink: /en/page-path/   # Language-specific URL
```

### Content Not Available in All Languages

**Quick check**:
```bash
_scripts/validation/check_language_consistency.sh
```

**Typical output**:
```
❌ Missing: _brands/ru/ru-new-brand.md
❌ Missing: _brands/zh/ru-new-brand.md
✅ Complete: _brands/en/ru-new-brand.md
```

**Fix**: Create missing files using templates:
```bash
python3 _scripts/content-creation/generate_brand_template.py ru new-brand
```

## Performance Issues

### Map Won't Load

**Symptoms**: MapLibre map shows blank or error

**Check console errors** (browser dev tools):
- API key issues: Verify Stadia Maps configuration
- Data loading: Check if `brands.json` loads correctly
- JavaScript errors: Look for console.log messages

**Test data generation**:
```bash
_scripts/data-generation/generate-brands-json.py
cat _data/brands.json | head -20  # Verify JSON format
```

### Search Not Working

**Symptoms**: Search returns no results or errors

**Regenerate search indexes**:
```bash
_scripts/data-generation/generate-all-json.py
```

**Check search.json format**:
```bash
curl http://localhost:4000/search.json | jq '.' | head -20
```

## Development Environment

### Bundle Install Fails

**Common errors and fixes**:

**Error**: `Gem::Ext::BuildError`
```bash
# Install development tools
xcode-select --install        # macOS
sudo apt-get install build-essential  # Ubuntu
```

**Error**: Ruby version mismatch
```bash
# Check Ruby version
ruby --version                # Should be 2.7+

# Install correct Ruby with rbenv
rbenv install 3.0.0
rbenv local 3.0.0
```

### Script Execution Issues

**Error**: Permission denied
```bash
chmod +x _scripts/core/pre-commit_check.sh
```

**Error**: Python script fails
```bash
# Check Python version
python3 --version            # Should be 3.8+

# Install if missing
brew install python3         # macOS
sudo apt-get install python3 # Ubuntu
```

## Data Generation Issues

### JSON Generation Fails

**Symptoms**: Scripts exit with errors, empty JSON files

**Debug process**:
```bash
# Run with verbose output
python3 _scripts/data-generation/generate-brands-json.py --verbose

# Check YAML syntax in content files
_scripts/validation/validate_yaml.sh
```

**Common issues**:
- Invalid YAML front matter in brand/founder files
- Missing required fields (title, slug, lang)
- Incorrect dimension references

### Validation Fails

**Symptoms**: Pre-commit check shows errors

**Step-by-step resolution**:
```bash
# 1. YAML validation
_scripts/validation/validate_yaml.sh
# Fix any syntax errors in .yml and .md files

# 2. Language consistency  
_scripts/validation/check_language_consistency.sh
# Create missing language versions

# 3. Translation keys
_scripts/validation/find_translation_keys.py
# Add missing translation keys

# 4. Full check
_scripts/core/pre-commit_check.sh
```

## Emergency Recovery

### Site Completely Broken

**Quick recovery steps**:
```bash
# 1. Check git status
git status

# 2. Stash changes if needed
git stash

# 3. Return to last working commit
git log --oneline -10        # Find recent good commit
git checkout [commit-hash]

# 4. Test basic functionality
bundle exec jekyll serve

# 5. If working, create recovery branch
git checkout -b recovery-[date]
```

### Performance Completely Degraded

**Nuclear option - regenerate all optimizations**:
```bash
# Clear all generated data
rm -f _data/language_map.json
rm -f _data/navigation_cache.json
rm -f _data/brands.json
rm -f _data/founders.json

# Regenerate everything
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
_scripts/data-generation/generate-all-json.py

# Test performance
time JEKYLL_ENV=production bundle exec jekyll build
```

## Quick Reference Commands

| Problem | Quick Fix Command |
|---------|-------------------|
| Build fails | `_scripts/core/pre-commit_check.sh` |
| Images missing | `_scripts/image-processing/process_images.sh [type] [id]` |
| Translations missing | `_scripts/validation/find_translation_keys.py` |
| Performance slow | `_scripts/utilities/generate-language-map.py` |
| Content inconsistent | `_scripts/validation/check_language_consistency.sh` |
| Data outdated | `_scripts/data-generation/generate-all-json.py` |

---

**Documentation complete** - Return to [README](README.md) for navigation