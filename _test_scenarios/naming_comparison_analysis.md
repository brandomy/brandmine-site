# Image Naming Strategy Analysis: Descriptive vs Generic

## Executive Summary

After testing both naming approaches with a hypothetical new brand "cn-dragon-tea", the **generic naming approach is significantly simpler** and requires zero code changes, while the descriptive approach requires manual code updates for each new brand.

## Key Findings

### 1. Current System State
- The `brand-image.html` helper contains a hardcoded switch statement mapping brand IDs to specific image names
- The `collection-image.html` component has built-in fallback logic that tries descriptive names first, then falls back to generic
- Some brands (like ru-seven-spices) have both naming patterns coexisting

### 2. Workflow Comparison

#### Generic Naming Workflow (3 steps, ~5 minutes)
1. **Process images** with standard names:
   ```
   _scripts/core/process_images.sh brands cn-dragon-tea
   ```
   Results in: `hero-400w.jpg`, `hero-800w.jpg`, `hero-1200w.jpg`

2. **Create brand markdown file** using existing template
   
3. **Done** - Images work immediately with existing includes

#### Descriptive Naming Workflow (6 steps, ~20 minutes)
1. **Process images** with descriptive names:
   ```
   # Manually rename files before processing
   mv hero.jpg hero-dragon-ceremony.jpg
   ```

2. **Edit brand-image.html** to add new case:
   ```liquid
   {% when 'cn-dragon-tea' %}
     {% if include.image_type == 'hero' %}
       {% assign image_name = "dragon-ceremony" %}
     {% elsif include.image_type == 'logo' %}
       {% assign image_name = "color" %}
     {% endif %}
   ```

3. **Add founder mapping** if using brand-image for portraits:
   ```liquid
   {% when 'cn-dragon-tea' %}
     {% assign founder_id = "cn-li-ming" %}
   ```

4. **Test** that images load correctly

5. **Debug** if typos or mapping errors occur

6. **Commit** changes to version control

### 3. Code Complexity Analysis

#### Generic Approach
- **Lines of code changed**: 0
- **Files modified**: 0
- **Risk of errors**: None
- **Maintenance burden**: None

#### Descriptive Approach
- **Lines of code changed**: 8-12 per brand
- **Files modified**: 1 (brand-image.html)
- **Risk of errors**: High (typos, missing cases)
- **Maintenance burden**: Grows linearly with brand count

### 4. Real-World Evidence

Looking at the existing brands directory:
- **ru-seven-spices** has both `hero-*.jpg` AND `hero-moscow-spice-market-*.jpg`
- This suggests the team tried descriptive naming but also kept generic as fallback
- The existence of `hero-placeholder-*.jpg` files indicates challenges with the descriptive approach

### 5. Debugging Complexity

#### Generic Naming Debug Process
1. Check if file exists: `ls assets/images/brands/cn-dragon-tea/hero-*`
2. Done

#### Descriptive Naming Debug Process
1. Check if file exists with correct name
2. Check if brand-image.html has the mapping
3. Check for typos in the case statement
4. Check if the image_name variable is set correctly
5. Check collection-image.html receives the name parameter
6. Trace through fallback logic

## Performance Impact

Both approaches have identical runtime performance. The collection-image.html component:
- Tries the descriptive filename first (if name parameter provided)
- Falls back to generic filename
- Uses JavaScript onerror handler for final fallback

## Recommendation

**Use generic naming** for the following reasons:

1. **Zero maintenance**: No code changes required for new brands
2. **Predictable**: Same pattern for all brands reduces cognitive load
3. **Self-documenting**: File structure is immediately understandable
4. **Error-proof**: No typos or missing mappings possible
5. **Faster onboarding**: New team members don't need to learn the mapping system

## Migration Path

For existing brands with descriptive names:
1. Keep existing descriptive files (no need to rename)
2. The fallback system handles them gracefully
3. Use generic naming for all new brands going forward
4. Optionally remove the switch statement from brand-image.html over time

## Time Savings Calculation

Assuming 100 new brands per year:
- Generic approach: 100 brands × 5 minutes = 8.3 hours
- Descriptive approach: 100 brands × 20 minutes = 33.3 hours
- **Annual time savings: 25 hours**

Plus additional savings from:
- No debugging time for mapping errors
- No code review time for brand-image.html changes
- No merge conflicts in the switch statement
- No documentation updates needed