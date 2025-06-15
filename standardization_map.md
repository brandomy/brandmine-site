=== STANDARDIZATION MAPPING ===
## Current Image Usage Patterns Found:

### 1. INSIGHT-CARD.HTML - Direct Path Building (Line 43)
```liquid
{% assign image_base = '/assets/images/insights/' | append: include.insight.images.hero.name %}
```
- ISSUE: Builds path directly, does not use responsive variants
- BREAKS: When images.hero.name changes from 'moscow-spice-market' to 'market'

### 2. FOUNDER-CARD.HTML - Hardcoded Path Building (Line 90)
```liquid
src="{{ site.baseurl }}/assets/images/founders/{{ image_base }}/headshot-400w.jpg"
```
- ISSUE: Hardcoded filename pattern, assumes headshot-400w.jpg
- BREAKS: When files renamed to headshot-business-400w.jpg

## Critical Issues Identified:

### MAJOR PROBLEM: Cards Build Paths Directly!
- **insight-card.html**: Bypasses collection-image.html system
- **founder-card.html**: Hardcodes filename patterns
- **brand-card.html**: References brand-image.html helper (GOOD)

### Required Changes BEFORE File Renaming:
1. **Fix insight-card.html** to use collection-image.html
2. **Fix founder-card.html** to use collection-image.html or founder-image.html
3. **Test all cards** with current files
4. **Only then** proceed with file renaming

## Test Sample Analysis:

### Current Front Matter vs New Standard
| Collection | Slug | Current Name | New Name | Component Issue |
|------------|------|--------------|----------|-----------------|
| brands | ru-teatime | hero: 'storefront' | hero: 'storefront' | ✅ No change needed |
| brands | ru-teatime | logo: 'color' | logo: 'color' | ✅ No change needed |
| founders | ru-alexei-sokolov | portrait: 'portrait' | portrait: 'formal' | ❌ founder-card hardcoded |
| founders | ru-alexei-sokolov | headshot: 'headshot' | headshot: 'business' | ❌ founder-card hardcoded |
| insights | ru-seven-spices-spotlight | hero: 'moscow-spice-market' | hero: 'market' | ❌ insight-card direct path |
| insights | ru-seven-spices-spotlight | founder_portrait: 'maria-kuznetsova' | founder: 'portrait' | ❌ insight-card direct path |

