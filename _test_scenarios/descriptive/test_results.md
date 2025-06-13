# Descriptive Naming Test Results

## Test Brand: cn-dragon-tea

### Simulated Image Files:
- `hero-dragon-ceremony-400w.jpg`
- `hero-dragon-ceremony-800w.jpg`
- `hero-dragon-ceremony-1200w.jpg`
- `founder-portrait-li-ming-400w.jpg`
- `founder-portrait-li-ming-800w.jpg`
- `founder-portrait-li-ming-1200w.jpg`
- `logo-color-400w.png`
- `logo-color-800w.png`
- `logo-color-1200w.png`

### Test 1: Using brand-image.html helper

**Current State Analysis:**
1. The helper has a hardcoded switch statement mapping brand IDs to image names
2. For a new brand "cn-dragon-tea", we would need to:
   - Add a new case to the switch statement (lines 40-86)
   - Map the brand ID to the specific image name "dragon-ceremony"
   - Map the founder portrait to founder ID

**Code Changes Required:**
```liquid
{% when 'cn-dragon-tea' %}
  {% if include.image_type == 'hero' %}
    {% assign image_name = "dragon-ceremony" %}
  {% elsif include.image_type == 'logo' %}
    {% assign image_name = "color" %}
  {% endif %}
```

**Workflow Steps:**
1. Process images with descriptive names
2. Edit `_includes/helpers/brand-image.html` to add the case
3. Add founder mapping in the portrait section
4. Test the brand page renders correctly

### Test 2: Using collection-image.html directly

**Direct Usage Example:**
```liquid
{% include components/images/collection-image.html
   collection="brands"
   slug="cn-dragon-tea"
   purpose="hero"
   name="dragon-ceremony"
   alt="Dragon Tea ceremony showcase"
   aspect="landscape" %}
```

**Analysis:**
- Works immediately without any code changes
- Requires passing the `name` parameter with "dragon-ceremony"
- Falls back gracefully to generic naming if descriptive file not found

### Complexity Score: HIGH
- Requires manual code updates for each new brand
- Risk of typos in switch statement
- Maintenance burden grows with each brand
- Debugging requires checking multiple places