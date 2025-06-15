# Brandmine Naming Convention Audit Report

**Date:** June 15, 2025  
**Audit Scope:** Comprehensive underscore vs hyphen usage analysis  
**Critical Issue:** CSS selector failures due to category naming mismatches

## Executive Summary

### ✅ Good News: File Architecture is Consistent
- **Include-to-SCSS mapping:** Perfect alignment, no naming mismatches
- **File naming conventions:** 100% kebab-case compliance across components
- **Import statements:** All correct and functional
- **Build system:** Working properly with no import errors

### ❌ Critical Issue Identified: Insight Category Classes
**Root Cause:** Content uses underscores, CSS expects hyphens for insight categories

**Impact:** Category-specific styling completely broken for insight cards across the site

---

## 1. Documented Strategy vs Reality

### Stated Strategy (from CLAUDE.md)
```yaml
File Naming: kebab-case.html, kebab-case.scss ✅
CSS Classes: .block__element--modifier (BEM) ✅
Front Matter Keys: snake_case (country_code, founding_year) ✅
URLs/Slugs: kebab-case (export-ready, founder-led) ✅
```

### Reality Check: ✅ Documentation Matches Implementation
- **File names:** 100% kebab-case compliance
- **CSS classes:** Proper BEM with kebab-case
- **Front matter:** Consistent snake_case for keys
- **URLs:** Proper kebab-case slugs

---

## 2. Critical Mismatch Analysis

### The Core Problem

**Content Category Values (underscores):**
```yaml
# In _insights/en/ content
category: "brand_spotlight"
category: "founders_journey" 
category: "location_intelligence"
category: "market_momentum"
```

**Dynamic Class Generation (preserves underscores):**
```liquid
<!-- tagged-insight-card.html line 33 -->
<article class="insight-card insight-card--{{ include.insight.category }}">
<!-- Results in: insight-card--brand_spotlight -->

<!-- insight-card.html line 36 -->
<article class="insight-card insight-card--{{ include.insight.category | default: 'default' }}">
<!-- Results in: insight-card--brand_spotlight -->
```

**CSS Selectors (expect hyphens):**
```scss
// tagged-insight-card.scss lines 198-237
.insight-card--brand-spotlight { border-color: var(--secondary-500); }
.insight-card--founders-journey { border-color: var(--accent-500); }
.insight-card--market-momentum { border-color: var(--olive-500); }
.insight-card--location-intelligence { border-color: var(--sky-500); }
```

### Mismatch Table

| Content Category | Generated Class | CSS Selector | Status |
|------------------|----------------|--------------|---------|
| `brand_spotlight` | `.insight-card--brand_spotlight` | `.insight-card--brand-spotlight` | ❌ **BROKEN** |
| `founders_journey` | `.insight-card--founders_journey` | `.insight-card--founders-journey` | ❌ **BROKEN** |
| `location_intelligence` | `.insight-card--location_intelligence` | `.insight-card--location-intelligence` | ❌ **BROKEN** |
| `market_momentum` | `.insight-card--market_momentum` | `.insight-card--market-momentum` | ❌ **BROKEN** |

### Visual Impact
- ❌ Category-specific border colors not applied
- ❌ Category-specific badge styling not applied  
- ❌ Category-specific visual hierarchies broken
- ❌ Brand consistency compromised

---

## 3. File System Audit Results

### ✅ Perfect Compliance Areas

**Include Files:**
- `/components/cards/`: 100% kebab-case (21 files)
- `/components/helpers/`: 100% kebab-case (8 files)
- `/pages/`: 100% kebab-case (45 files)

**SCSS Files:**
- `/assets/css/components/`: 100% kebab-case (65 files)
- `/assets/css/pages/`: 100% kebab-case (34 files)
- `/assets/css/layout/`: 100% kebab-case (12 files)

**Content Files:**
- `_brands/`: 100% kebab-case (7 files)
- `_founders/`: 100% kebab-case (4 files)
- `_insights/`: 100% kebab-case (4 files)
- `_dimensions/`: 100% kebab-case (125+ files)

### Include-to-SCSS Mapping: 100% Success Rate

| Include File | SCSS File | Status |
|--------------|-----------|--------|
| `tagged-insight-card.html` | `tagged-insight-card.scss` | ✅ Perfect match |
| `brand-card.html` | `brand-card.scss` | ✅ Perfect match |
| `insight-card.html` | `insight-card.scss` | ✅ Perfect match |
| `hero-brand-card.html` | `hero-brand-card.scss` | ✅ Perfect match |
| `latest-insights-tagged.html` | `latest-insights-tagged.scss` | ✅ Perfect match |

**Import Verification:**
```scss
// assets/css/components/cards/_index.scss
@import "tagged-insight-card";    // ✅ Exists
@import "brand-card";             // ✅ Exists  
@import "insight-card";           // ✅ Exists
```

---

## 4. Affected Components Analysis

### Broken Components (Category-Dependent Styling)

1. **Tagged Insight Card** (`tagged-insight-card.html`)
   - **Lines affected:** 33 (main class), 198-237 (CSS selectors)
   - **Impact:** Border colors, badge styling
   - **Files to fix:** Template + CSS

2. **Standard Insight Card** (`insight-card.html`)
   - **Lines affected:** 36 (main class), 182-220 (CSS selectors)  
   - **Impact:** Border colors, badge styling
   - **Files to fix:** Template + CSS

3. **Featured Insight Card** (`featured-insight-card.html`)
   - **Lines affected:** 42 (main class), 140-179 (CSS selectors)
   - **Impact:** Border colors, visual hierarchy
   - **Files to fix:** Template + CSS

### Working Components (No Category Dependencies)

✅ **Brand Cards:** Use dimension taxonomy (markets, sectors, attributes, signals) - all properly hyphenated  
✅ **Founder Cards:** No dynamic class generation issues  
✅ **Navigation:** Static classes, no issues  
✅ **Layout Components:** No dynamic dependencies

---

## 5. Content Analysis

### Front Matter Consistency

**✅ Proper snake_case for multi-word keys:**
```yaml
country_code: "ru"
founding_year: 1995
social_facebook: "https://..."
reading_time: 8
```

**✅ Proper kebab-case for taxonomy values:**
```yaml
sectors: ["artisanal-spirits", "gourmet-foods"]
markets: ["russia", "brazil"] 
attributes: ["founder-led", "heritage-brand"]
signals: ["export-ready", "investment-ready"]
```

**❌ Inconsistent category values:**
```yaml
# Should be kebab-case to match CSS
category: "brand_spotlight"     # ❌ Uses underscore
category: "founders_journey"    # ❌ Uses underscore
category: "location_intelligence" # ❌ Uses underscore
category: "market_momentum"     # ❌ Uses underscore
```

### Translation Keys (Currently Consistent)
```yaml
# _data/translations/en.yml
insights:
  categories:
    brand_spotlight: "Brand Spotlight"      # ✅ Matches content
    founders_journey: "Founder's Journey"   # ✅ Matches content
    location_intelligence: "Location Intelligence" # ✅ Matches content
    market_momentum: "Market Momentum"      # ✅ Matches content
```

---

## 6. Liquid Transformation Patterns

### Inconsistent Transformation Logic Found

**In tagged-insight-card.html:**
```liquid
<!-- Line 60: Converting underscores TO hyphens for icon filename -->
{% assign icon_name = include.insight.category | replace: "_", "-" %}

<!-- Line 62: Converting hyphens TO underscores for translation key -->
{% assign normalized_category = include.insight.category | replace: "-", "_" %}
```

**Problem:** Shows awareness of the mismatch but applies transformations inconsistently

### Missing Transformations
```liquid
<!-- BROKEN: Line 33 -->
class="insight-card--{{ include.insight.category }}"

<!-- SHOULD BE: -->
class="insight-card--{{ include.insight.category | replace: '_', '-' }}"
```

---

## 7. Web Development Best Practices Assessment

### ✅ Following Best Practices
- **File naming:** Kebab-case for all web files
- **CSS classes:** BEM methodology with kebab-case
- **URLs:** Proper kebab-case slugs
- **YAML keys:** Appropriate snake_case

### ❌ Violating Best Practices
- **CSS class values:** Should be kebab-case for consistency
- **Mixed transformations:** Inconsistent handling of naming conversions

---

## 8. Risk Assessment

### High Risk (Immediate Action Required)
- **Visual Brand Consistency:** Category styling completely broken
- **User Experience:** Inconsistent visual hierarchy 
- **Developer Confusion:** Mixed patterns cause ongoing issues

### Medium Risk
- **Future Content:** New insights will have same styling issues
- **Maintenance:** Developers unsure which pattern to follow

### Low Risk  
- **Build System:** Currently functional despite content issues
- **SEO:** URLs properly slugified regardless of content values

---

## 9. Recommendations

### Option A: Fix Content (Recommended)
**Change category values to use hyphens**
- Update 4 insight files' front matter
- Maintain CSS as-is (already correct)
- Update translation keys to match

### Option B: Fix CSS
**Change CSS selectors to use underscores**  
- Violates BEM and web standards
- Not recommended

### Option C: Transform in Templates
**Add replace filter to class generation**
- Quick fix but doesn't address root inconsistency
- Temporary solution only

---

## Next Steps

1. **Immediate:** Implement template transformation fix for urgent styling restoration
2. **Short-term:** Standardize content category values to kebab-case
3. **Long-term:** Add validation to prevent future inconsistencies

**Priority:** High - Visual brand consistency is compromised across all insight content