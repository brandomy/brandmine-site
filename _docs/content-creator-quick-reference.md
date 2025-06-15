# Content Creator Quick Reference

*For Randal & Olya - Adding brands, founders, and insights to Brandmine*

Last updated: June 16, 2025

---

## 🚀 Quick Start: Adding a New Brand

### 1. Prepare Images (5 minutes)
**Required images with context-aware naming:**
```bash
# Place in: assets/images/brands/{brand-slug}/originals/
hero-{scene}.jpg         # Scene only: "storefront", "vineyard", "workshop"
logo-{variant}.png       # Variant only: "color", "mono", "brand"
founder-{context}.jpg    # Context only: "formal", "traditional", "working"
```

**Examples:**
- ✅ `hero-storefront.jpg` (scene description)
- ✅ `logo-color.png` (variant description)  
- ✅ `founder-formal.jpg` (role/context description)
- ❌ `hero-teatime-moscow-storefront.jpg` (location redundancy)
- ❌ `founder-alexei-sokolov-portrait.jpg` (person-specific)

### 2. Process Images (1 minute)
```bash
_scripts/core/process_images.sh brands {brand-slug}
```
This creates responsive variants: 400w, 800w, 1200w

### 3. Create Content Files (10 minutes)
**Use template generator:**
```bash
python3 _scripts/content-creation/generate_brand_template.py {country} {brand-name}
```

**Update front matter in ALL language versions (EN/RU/ZH):**
```yaml
images:
  hero:
    name: "storefront"     # Must match filename minus purpose
    alt: "Descriptive alt text in appropriate language"
    ext: "jpg"
  logo:
    name: "color"
    alt: "Logo description in appropriate language"
    ext: "png"
  founder:
    name: "formal"
    alt: "Founder description in appropriate language"
    ext: "jpg"
```

### 4. Validate (1 minute)
```bash
_scripts/core/pre-commit_check.sh
```
Must show: ✅ Image naming validation – all standards followed

---

## 🎯 Image Naming Rules (MEMORIZE THESE)

### Context-Aware Pattern: `purpose-description.extension`
**Directory provides context, filename describes content only**

| Purpose | Description | Good Examples | Bad Examples |
|---------|-------------|---------------|--------------|
| **hero** | Scene/location only | `storefront`, `vineyard`, `market`, `workshop` | `teatime-storefront`, `moscow-market` |
| **logo** | Variant only | `color`, `mono`, `brand`, `white` | `teatime-logo`, `brand-color` |
| **founder** | Role/context only | `formal`, `traditional`, `working`, `business` | `alexei-sokolov`, `portrait-formal` |

### ✅ CORRECT Examples
```bash
# Brand images
hero-storefront.jpg        # Scene description only
logo-color.png            # Variant description only
founder-formal.jpg        # Role description only

# Founder images  
portrait-traditional.jpg   # Context description only
headshot-business.jpg     # Style description only

# Insight images
hero-vineyard.jpg         # Scene only (not "krasnodar-vineyard")
founder-portrait.jpg      # Generic descriptor (not person name)
logo-brand.png           # Variant only
```

### ❌ INCORRECT Examples (Will Fail Validation)
```bash
# Location redundancy
hero-moscow-spice-market.jpg    # Should be: hero-market.jpg
hero-krasnodar-vineyard.jpg     # Should be: hero-vineyard.jpg

# Person-specific naming
founder-alexei-sokolov.jpg      # Should be: founder-formal.jpg
portrait-maria-kuznetsova.jpg   # Should be: portrait-traditional.jpg

# Legacy front matter keys
founder_portrait:               # Should be: founder:
```

---

## 📝 Front Matter Standards

### Required Keys (Use These Exactly)
```yaml
images:
  hero:           # For main brand/insight images
    name: "..."   # Context-aware descriptor
    alt: "..."    # Descriptive accessibility text
    ext: "jpg"    # File extension
  logo:           # For brand logos
    name: "..."   # Variant descriptor
    ext: "png"    # Usually PNG for logos
  founder:        # For founder images (NOT founder_portrait)
    name: "..."   # Role/context descriptor
    ext: "jpg"    # File extension
```

### Cross-Language Consistency (CRITICAL)
**Image names must be IDENTICAL across EN/RU/ZH versions:**

```yaml
# _brands/en/ru-teatime.md
images:
  hero:
    name: "storefront"    # ← SAME across all languages
    alt: "TeaTime storefront in Moscow"  # ← Different (translated)

# _brands/ru/ru-teatime.md  
images:
  hero:
    name: "storefront"    # ← SAME as EN version
    alt: "Чайная TeaTime в Москве"      # ← Different (translated)

# _brands/zh/ru-teatime.md
images:
  hero:
    name: "storefront"    # ← SAME as EN/RU versions
    alt: "TeaTime在莫斯科的茶室"         # ← Different (translated)
```

---

## 🔧 Common Workflows

### Adding a Russian Brand
```bash
# 1. Create brand directory
mkdir -p assets/images/brands/ru-newbrand/originals/

# 2. Add images with correct naming
cp hero-workshop.jpg assets/images/brands/ru-newbrand/originals/
cp logo-color.png assets/images/brands/ru-newbrand/originals/
cp founder-traditional.jpg assets/images/brands/ru-newbrand/originals/

# 3. Process images
_scripts/core/process_images.sh brands ru-newbrand

# 4. Generate content templates
python3 _scripts/content-creation/generate_brand_template.py ru newbrand

# 5. Update front matter in all 3 language files
# 6. Validate
_scripts/core/pre-commit_check.sh
```

### Adding a Founder Profile
```bash
# 1. Create founder directory
mkdir -p assets/images/founders/ru-newfound/originals/

# 2. Add images
cp portrait-formal.jpg assets/images/founders/ru-newfounder/originals/
cp headshot-business.jpg assets/images/founders/ru-newfounder/originals/

# 3. Process
_scripts/core/process_images.sh founders ru-newfounder

# 4. Generate templates
python3 _scripts/content-creation/generate_article_template.py founder ru-newfounder

# 5. Update front matter (all languages)
# 6. Validate
```

### Adding an Insight Article
```bash
# 1. Create insight directory  
mkdir -p assets/images/insights/new-article/originals/

# 2. Add images with generic naming
cp hero-ceremony.jpg assets/images/insights/new-article/originals/
cp founder-portrait.jpg assets/images/insights/new-article/originals/  # Generic!
cp logo-brand.png assets/images/insights/new-article/originals/

# 3. Process
_scripts/core/process_images.sh insights new-article

# 4. Generate templates
python3 _scripts/content-creation/generate_article_template.py insights new-article

# 5. Update front matter (use "founder:" key, not "founder_portrait:")
# 6. Validate
```

---

## 🚨 Validation & Troubleshooting

### Pre-Commit Validation (Run Before Every Commit)
```bash
_scripts/core/pre-commit_check.sh
```

**Must show these green checkmarks:**
- ✅ No legacy front matter keys found
- ✅ No location redundancy detected
- ✅ No person-specific naming found
- ✅ Cross-language names are consistent
- ✅ All referenced images have corresponding original files

### Common Validation Errors

#### Error: Legacy front matter keys
```
❌ Found legacy 'founder_portrait:' keys (should be 'founder:')
```
**Fix:** Change `founder_portrait:` to `founder:` in front matter

#### Error: Location redundancy
```
❌ Found location redundancy in image names:
name: "moscow-spice-market"
```
**Fix:** Use context-aware naming: `name: "market"`

#### Error: Cross-language inconsistency
```
❌ Inconsistent image names in: ru-teatime.md
EN: name: "storefront"
RU: name: "storefront-moscow"
```
**Fix:** Make image names identical across all language versions

#### Error: Missing original files
```
❌ Missing: assets/images/brands/ru-teatime/originals/hero-storefront.jpg
```
**Fix:** Add missing file or update front matter to match existing files

### Quick Fixes
```bash
# Regenerate responsive images after fixing originals
_scripts/core/process_images.sh brands {brand-slug}

# Check specific collection
_scripts/core/process_images.sh brands  # All brands
_scripts/core/process_images.sh founders  # All founders

# Full site rebuild
bundle exec jekyll build
```

---

## 📊 Quality Checklist

### Before Adding New Content
- [ ] Images follow context-aware naming (no redundancy)
- [ ] Front matter uses standard keys (`founder:` not `founder_portrait:`)
- [ ] All language versions have identical image names
- [ ] Alt text is descriptive and translated appropriately
- [ ] Original files exist in correct directories

### After Adding New Content  
- [ ] Images processed successfully (responsive variants created)
- [ ] Jekyll builds without errors: `bundle exec jekyll build`
- [ ] Validation passes: `_scripts/core/pre-commit_check.sh`
- [ ] Images display correctly on site
- [ ] Cross-language switching works properly

### Performance Check
- [ ] Build time stays under 15 seconds
- [ ] Images load quickly on mobile
- [ ] No broken image links anywhere
- [ ] Alt text displays correctly

---

## 🎯 Success Metrics

**Target Times:**
- **New brand**: <20 minutes total
- **New founder**: <15 minutes total  
- **New insight**: <25 minutes total
- **Image processing**: <2 minutes per collection

**Quality Standards:**
- **Validation**: 100% pass rate (zero tolerance for violations)
- **Consistency**: Identical image names across all languages
- **Performance**: Build time <15 seconds
- **Accessibility**: Descriptive alt text for all images

---

## 🆘 Need Help?

### Common Questions

**Q: What if I need a different image type?**
A: Stick to the three standard purposes: `hero`, `logo`, `founder`. If you need additional images, discuss with tech team first.

**Q: Can I use different image names for different languages?**  
A: NO. Image names must be identical across EN/RU/ZH. Only alt text should be translated.

**Q: What if validation fails?**
A: Fix all errors before committing. The system prevents broken image references.

**Q: Can I skip the originals folder?**
A: NO. Always place source images in originals/ first, then process.

### Emergency Contacts
- **Technical Issues**: Check `_docs/troubleshooting.md`
- **Validation Errors**: Run `_scripts/core/pre-commit_check.sh` for specific guidance
- **Build Failures**: Check Jekyll error messages for file/syntax issues

---

## 📈 Advanced Tips

### Batch Processing
```bash
# Process all brands at once
_scripts/core/process_images.sh brands

# Process everything  
_scripts/core/process_images.sh all
```

### Performance Optimization
- Keep original images under 300KB when possible
- Use JPG for photography, PNG for logos/graphics
- Process images immediately after adding to originals/
- Run validation frequently to catch issues early

### Content Strategy
- Focus on compelling hero images that show the brand in context
- Ensure founder images convey personality and cultural context
- Use consistent visual style within each content type
- Plan image concepts before shooting/sourcing

---

*This guide reflects the 100% standardized image system implemented in June 2025. All patterns shown are enforced by automated validation and required for content acceptance.*