# Generic Naming Test Results

## Test Brand: cn-dragon-tea

### Simulated Image Files:
- `hero-400w.jpg`
- `hero-800w.jpg`
- `hero-1200w.jpg`
- `portrait-400w.jpg`
- `portrait-800w.jpg`
- `portrait-1200w.jpg`
- `logo-400w.png`
- `logo-800w.png`
- `logo-1200w.png`

### Test 1: Using brand-image.html helper

**Current State Analysis:**
1. The helper falls through to the default case for unknown brands
2. For a new brand "cn-dragon-tea", it would:
   - Use the default behavior (no image_name assigned for hero)
   - Only set image_name = "color" for logos
   - Pass null/undefined as the name parameter to collection-image.html

**Code Changes Required:** NONE

**How It Works:**
- When no `name` parameter is passed to collection-image.html, it uses the generic filename
- The collection-image component builds: `hero-400w.jpg` automatically
- No manual mapping needed

### Test 2: Using collection-image.html directly

**Direct Usage Example:**
```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug="cn-dragon-tea"
   purpose="hero"
   alt="Dragon Tea storefront"
   aspect="landscape" %}
```

**Analysis:**
- Works immediately without any parameters
- No `name` parameter needed
- Automatically constructs generic filenames

### Workflow Steps:
1. Process images with generic names (hero-, logo-, portrait-)
2. Use existing includes without modification
3. No code changes required

### Complexity Score: LOW
- Zero code changes required
- Works with existing infrastructure
- No maintenance burden
- Self-documenting file structure