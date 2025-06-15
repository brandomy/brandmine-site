=== IMAGE ASSETS AUDIT ===
Date: Sun 15 Jun 2025 13:50:41 +08

## File Naming Pattern Analysis

### Files with underscores (should use hyphens):
assets/images/insights/ru-seven-spices-spotlight/.DS_Store
assets/images/insights/.DS_Store
assets/images/insights/ru-siberian-honey-corridor/.DS_Store
assets/images/insights/ru-teatime-founder-journey/.DS_Store
assets/images/insights/ru-russian-wine-renaissance/.DS_Store
assets/images/.DS_Store
assets/images/brands/.DS_Store
assets/images/brands/ru-teatime/.DS_Store
assets/images/brands/ru-seven-spices/.DS_Store
assets/images/brands/ru-seven-spices/originals/.DS_Store

### Files with uppercase letters (should be lowercase):
assets/images/journal/journal-home/hero1-1200w.jpg
assets/images/journal/journal-home/hero1-400w.jpg
assets/images/journal/journal-home/hero1-800w.jpg
assets/images/journal/journal-home/originals/hero.jpg
assets/images/journal/journal-home/originals/hero2.jpg
assets/images/journal/journal-home/originals/hero1.jpg
assets/images/journal/journal-home/hero-1200w.jpg
assets/images/journal/journal-home/hero2-1200w.jpg
assets/images/journal/journal-home/hero2-400w.jpg
assets/images/journal/journal-home/hero2-800w.jpg

## Directory Structure Analysis

### Main image directories:
drwxr-xr-x@ 12 randaleastman  staff    384 Jun 15 08:17 .
drwxr-xr-x@  9 randaleastman  staff    288 Jun 15 08:17 ..
drwxr-xr-x@ 11 randaleastman  staff    352 Jun 15 08:11 brands
drwxr-xr-x@  7 randaleastman  staff    224 Jun 13 11:08 dimensions
drwxr-xr-x@  9 randaleastman  staff    288 Jun 13 11:07 founders
drwxr-xr-x@  4 randaleastman  staff    128 Jun 13 11:07 icons
drwxr-xr-x@  8 randaleastman  staff    256 Jun 15 08:17 insights
drwxr-xr-x@  6 randaleastman  staff    192 Jun 13 11:07 journal
drwxr-xr-x@  6 randaleastman  staff    192 Jun 13 11:07 people
drwxr-xr-x  21 randaleastman  staff    672 Jun 13 11:07 placeholders
drwxr-xr-x@  7 randaleastman  staff    224 Jun 13 11:07 site

## Template Image Reference Analysis

### Responsive image patterns found:
_includes/components/maps/markets-map.html:  - Contains responsive design adjustments for different screen sizes
_includes/components/insights/latest-insights-grid.html:  - Handles responsive layout across device sizes
_includes/components/ui/modal.html:/* Modal sizes */
_includes/components/images/insight-image.html:  - sizes (optional): String - Override responsive sizes
_includes/components/images/insight-image.html:      {% assign default_sizes = "(max-width: 480px) 100vw, (max-width: 768px) 100vw, (max-width: 1200px) 90vw, 1200px" %}
