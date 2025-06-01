# Implementation Specification: Journal Image Migration

## Objective
Migrate journal image organization from permalink-based to ref-based structure for proper multilingual support.

## Current State
```
assets/images/journal/2025-05-23-maplibre-journey/hero.jpg
_posts/2025-05-23-maplibre-journey.md (ref: maplibre-journey)
_posts/2025-05-23-maplibre-journey-ru.md (ref: maplibre-journey)
```

## Target State
```
assets/images/journal/maplibre-journey/hero.jpg
Both language posts reference same image directory via ref
```

## Required Changes

### File Operations
1. **MOVE** `assets/images/journal/2025-05-23-maplibre-journey/` to `assets/images/journal/maplibre-journey/`

2. **CREATE** `_includes/helpers/journal-image.html` with content from artifact "journal_image_helper"

3. **MODIFY** journal layout files to use new helper instead of direct image paths:
   - Update `_includes/pages/journal/hero.html` 
   - Replace direct image references with `{% include helpers/journal-image.html %}`

4. **MODIFY** journal post front matter (if needed):
   - Ensure `ref` field exists and matches directory name
   - Maintain `images.hero.ext` structure

### Code Changes
- Replace hardcoded image paths with `{% include helpers/journal-image.html image_type="hero" %}`
- Use `page.ref` as directory identifier instead of `page.url` or permalink

## Acceptance Criteria
- [ ] Journal posts display images correctly in all languages
- [ ] Image URLs no longer contain language suffixes (-ru, -zh)
- [ ] Language switcher works without broken images
- [ ] Existing processing scripts work with new directory structure

## Dependencies
- Existing `components/images/collection-image.html` component (no changes needed)
- Existing `process_images.sh` script (no changes needed)
- Posts must have `ref` field in front matter

## Test Cases
1. Navigate to English journal post - hero image displays
2. Switch to Russian language - same image displays  
3. Process images with script - responsive versions generate correctly
4. Add new journal post - follows ref-based pattern

## Notes
- This change affects 3 existing journal posts
- Insights collection already uses correct ref-based structure
- No changes needed to brands/founders collections (already correct)