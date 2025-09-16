# Brandmine Technical Standards

**Purpose:** Define mandatory standards, recommended guidelines, and common patterns for Brandmine development.
**Audience:** Developers, designers, and contributors.
**Principle:** *Logic-light, configuration-driven architecture.*

---

## Legend

| Type       | Meaning               | Language         |
|------------|-----------------------|------------------|
| **Standard** | Must be followed       | MUST / MUST NOT  |
| **Guideline** | Recommended default   | SHOULD / SHOULD NOT |
| **Pattern**   | Example implementation | MAY              |

---

## 1. Architecture Standards

### 1.1 Logic-Light Three-Layer Architecture
**Standard (MUST):** Use data-driven configuration → processing → styling.
**Rationale:** Separation of concerns, maintainability, performance.

**Implementation Flow:**
`page_sections.yml` → `page-sections.html` → `panel-types.scss` → Beautiful UI

**Do / Don't:**
- ✅ Define panel types in `_data/page_sections.yml`
- ❌ Add conditional logic in templates

### 1.2 Directory Structure (MUST Follow)
```
_includes/pages/[page]/[section].html    # Page sections
_layouts/[page-type].html                # Page templates
_data/page_sections.yml                  # Section configuration
_data/component_defaults.yml             # Component defaults
_data/translations/[lang].yml            # UI text
```

### 1.3 Content Collections (MUST Follow)
```
_brands/[lang]/[country]-[brand].md      # Brand profiles
_founders/[lang]/[founder-id].md         # Founder profiles
_dimensions/[lang]/[type]/[slug].md      # Taxonomy definitions
_insights/[lang]/[article-slug].md       # Blog articles
_journal/[lang]/[article-slug].md        # Internal blog
_pages/[lang]/[page-slug].md             # Static pages
```

---

## 2. Presentation Standards

### 2.1 BEM Panel System (MUST Use)
**Standard:** Use `.panel` + BEM modifiers for all page sections.

**Implementation:**
```html
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary--hero">Title</h1>
    <p class="panel__subtitle--hero">Subtitle</p>
  </div>
</div>
```

**Available Panel Types:**
- `.panel--hero` - Navigation pages
- `.panel--hero-subtle` - Profile pages
- `.panel--light` - White background
- `.panel--secondary-soft` - Light orange
- `.panel--accent-soft` - Light purple

### 2.2 Official Color Standards (MUST NOT Change)
| Type       | Color      | CSS Variable    | Usage |
|------------|-----------|-----------------|-------|
| Sectors    | Olive      | `--olive-*`     | Industry categories |
| Markets    | Sky Blue   | `--sky-*`       | Geographic regions |
| Attributes | Orange     | `--secondary-*` | Brand qualities |
| Signals    | Indigo     | `--accent-*`    | Growth indicators |

**Guideline:** Insight categories SHOULD reuse same palette for semantic alignment.

### 2.3 Responsive Strategy (MUST Use)
**Standard:** Mobile-first with `min-width` breakpoints only.
- Mobile: Base styles (no media query)
- Tablet: `@media (min-width: 768px)`
- Desktop: `@media (min-width: 1024px)`

**Rationale:** Progressive enhancement, better performance.

### 2.4 Content Width Standards
| Content Type | Max Width | Usage |
|--------------|-----------|-------|
| Editorial    | 700px (`--form-max-width`) | Long-form reading |
| Profile      | 1024px container + 700px narrative | Mixed layout |
| Grid         | 1200px (`--content-width-xl`) | Navigation, discovery |

---

## 3. Component Standards

### 3.1 CSS File Organization (MUST Match)
**Standard:** Every HTML component MUST have a matching CSS file.
```
_includes/components/cards/brand-card.html
assets/css/components/cards/brand-card.scss
```

**Rationale:** Style isolation, easier debugging, clear ownership.

### 3.2 Component Variants (SHOULD Use)
**Guideline:** Express variants via parameters, not separate files.
```liquid
{% include components/cards/brand-card.html brand=brand %}                    <!-- Standard -->
{% include components/cards/brand-card.html brand=brand variant="featured" %} <!-- Featured -->
```

### 3.3 CSS Boundary Rules (MUST Follow)
**Cards Handle (Intrinsic):** Typography, padding, colors, borders
**Layouts Handle (Extrinsic):** Positioning, margins, grid structure

**Do / Don't:**
- ✅ Card handles internal spacing and styling
- ❌ Card handles external margins or grid placement

### 3.4 Image Components (SHOULD Use)
**Guideline:** Use responsive image includes for consistency.
```liquid
{% include components/images/brand-image.html
   country="ru" brand="teatime" purpose="hero" image="storefront"
   alt="TeaTime storefront" %}
```

---

## 4. Performance Standards

### 4.1 Build Performance Targets
| Build Type    | Target |
|---------------|--------|
| Development   | <25s   |
| Production    | <25s   |
| Clean rebuild | <30s   |
| Incremental   | ≤6s    |

### 4.2 Optimization Requirements (MUST Implement)
- **Pre-generated data:** Language maps, navigation cache
- **File placement:** Large files in `_docs/` (excluded from Jekyll)
- **Asset organization:** Clean `assets/` directory structure

### 4.3 CSS Architecture (MUST Follow)
```
assets/css/
├── tokens/      # Design tokens
├── base/        # Reset, typography
├── layout/      # Header, panels, grid
├── components/  # Reusable UI
├── collections/ # Collection-specific
├── pages/       # Page-specific
└── manifest/    # Imports
```

---

## 5. Data & Taxonomy Standards

### 5.1 Dimension Types (MUST NOT Create New)
**Standard:** Only four dimension types allowed:
- Markets (geographic regions)
- Sectors (industries)
- Attributes (brand qualities)
- Signals (growth indicators)

### 5.2 Front Matter Schema (MUST Include)
```yaml
---
layout: brand-profile           # Required
title: "Brand Name"            # Required
slug: "brand-slug"             # Required
lang: en                       # Required
country_code: "ru"             # Required
permalink: /en/brands/ru-brand/ # Required

sectors: ["wine"]              # Use existing slugs only
markets: ["russia"]
attributes: ["founder-led"]
signals: ["export-ready"]
---
```

### 5.3 Translation System (MUST Use)
**Standard:** Use centralized translation helper for all UI text.
```liquid
{% include helpers/t.html key="brands.hero_title" fallback="Discover Brands" %}
```

---

## 6. Development Standards

### 6.1 File Naming Conventions (MUST Follow)
- **Components:** kebab-case (`brand-card.html`)
- **Collections:** `[country]-[brand].md` (`ru-teatime.md`)
- **Images:** purpose-first (`hero-storefront.jpg`)

### 6.2 Include Parameters (SHOULD Be Explicit)
```liquid
{% include components/cards/brand-card.html
   brand=brand                    # Required
   show_location=true            # Override default
   class="featured-brand" %}     # Additional CSS
```

### 6.3 Typography System (SHOULD Use Tokens)
- **Fonts:** `--font-heading` (PT Serif), `--font-body` (PT Sans)
- **Sizes:** `--text-base`, `--text-lg`, `--text-xl`, `--text-2xl`, `--text-3xl`
- **Spacing:** `--space-4`, `--space-6`, `--space-8`

---

## 7. Quality Assurance

### 7.1 Seamless Section Flow (MUST Maintain)
**Standard:** Use internal padding, not external margins for section spacing.
```scss
/* ✅ CORRECT */
.section-content { padding-bottom: var(--space-4); }

/* ❌ INCORRECT */
.section-content { margin-bottom: var(--space-4); }
```

### 7.2 Validation Scripts (SHOULD Run)
```bash
_scripts/validation/check_section_margins.sh
_scripts/core/pre-commit_check.sh
_scripts/validation/validate_yaml.sh
```

### 7.3 Nuclear Fix Protocol
**When 3+ incremental fixes fail:**
1. Rebuild component completely
2. Document in `_archives/reports/`
3. Ship working solution
4. Avoid further modifications

---

## 8. Documentation Standards

### 8.1 Include File Documentation (MUST Follow)
**Standard:** All include files MUST contain comprehensive documentation header blocks.

**Required Elements:**
```liquid
{% comment %}
================================================================================
COMPONENT: [Component Name]
PATH: [Full path from _includes]
PURPOSE: [Clear description of functionality]
CREATED: [YYYY-MM-DD] | VERSION: [Number]
================================================================================

Features:
- [Key capability 1]
- [Key capability 2]

Parameters:
- param_name (required): Type - Description. Default: value
- complex_object (optional): Object containing:
  - sub_param: Type - Description

Dependencies:
- CSS: [path to stylesheet]
- Data: [required data files]
- Helpers: [helper includes]

Usage Examples:
{% include component basic_usage %}
{% include component advanced_usage %}

Real-world Usage:
[Context-specific examples from site]

BEM Structure: (if applicable)
- .block (base component)
- .block__element (child elements)
- .block--modifier (variants)

Accessibility/Performance Notes:
[Special considerations for UX]
================================================================================
{% endcomment %}
```

### 8.2 Parameter Documentation (MUST Specify)
**Standard:** All parameters MUST be documented with:
- **Type specification:** String, Boolean, Integer, Object, Array
- **Required/Optional status:** Clearly marked
- **Default values:** Documented when applicable
- **Complex object structure:** Sub-parameters detailed

**Guideline:** Use consistent parameter naming:
- `variant` for component variations
- `show_*` for boolean display options
- `*_lang` for language parameters

### 8.3 Usage Examples (SHOULD Provide)
**Guideline:** Include multiple usage scenarios:
- **Basic usage:** Minimal required parameters
- **Advanced usage:** Full parameter demonstration
- **Real-world examples:** Actual site implementation references

### 8.4 Code Organization (MUST Structure)
**Standard:** Organize include files in consistent sections:
1. **Documentation header block**
2. **Parameter validation and defaults**
3. **Business logic with comments**
4. **Rendering section**

**Pattern Example:**
```liquid
{% comment %} Parameter validation and defaults {% endcomment %}
{% assign variant = include.variant | default: "standard" %}
{% assign show_icon = include.show_icon | default: false %}

{% comment %} Business logic {% endcomment %}
{% if variant == "featured" %}
  {% assign css_classes = "component component--featured" %}
{% else %}
  {% assign css_classes = "component" %}
{% endif %}

{% comment %} Rendering {% endcomment %}
<div class="{{ css_classes }}">
  <!-- Component content -->
</div>
```

### 8.5 Maintenance Documentation (SHOULD Track)
**Guideline:** Include version tracking and update history:
- Creation date and initial version
- Major feature additions
- Breaking changes noted
- Dependencies updated

---

# Appendices

## Appendix A – Implementation Examples

### A.1 Panel System Examples
```html
<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary--hero">Page Title</h1>
    <p class="panel__subtitle--hero">Page subtitle</p>
  </div>
</div>

<!-- Color Panel -->
<div class="panel panel--secondary-soft">
  <div class="panel__content--secondary-soft">
    <h2 class="panel__heading-secondary--secondary-soft">Section</h2>
    <p class="panel__lead-text--secondary-soft">Content</p>
  </div>
</div>
```

### A.2 Responsive Images
```liquid
{% include components/images/brand-image.html
   country="ru" brand="teatime" purpose="hero" image="storefront"
   alt="TeaTime storefront" %}
```

Generates:
```html
<img src="assets/images/brands/ru/teatime/teatime-hero-storefront-800w.jpg"
     srcset="...400w.jpg 400w, ...800w.jpg 800w, ...1200w.jpg 1200w"
     sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
     alt="TeaTime storefront" loading="lazy">
```

### A.3 Mobile-First CSS
```scss
/* Mobile base styles */
.component {
  width: 100%;
  padding: var(--space-4);
}

/* Tablet and up */
@media (min-width: 768px) {
  .component {
    width: var(--card-width-standard);
    padding: var(--space-6);
  }
}

/* Desktop and up */
@media (min-width: 1024px) {
  .component {
    width: var(--card-width-featured);
  }
}
```

---

## Appendix B – Performance & Compliance Metrics

### B.1 Current Performance
| Area            | Target | Current Status |
|-----------------|--------|----------------|
| BEM compliance  | 100%   | 94% (improving) |
| Build time      | <25s   | 12-13s (achieved) |
| Incremental     | ≤6s    | 5.5s (achieved) |
| Section flow    | 100%   | 85% (monitored) |

### B.2 Optimization Results
- **Before optimization:** 40-42 seconds
- **After optimization:** 12-13 seconds (70% improvement)
- **JavaScript cleanup:** 41 → 30 files (26% reduction)

### B.3 Component Architecture
- **CSS-HTML matched pairs:** 73 components
- **Orphaned CSS files:** 40 (identified for cleanup)
- **Missing CSS files:** 45 components (prioritized)

---

## Appendix C – Change Log

### 2025-09-15
- **JavaScript cleanup:** Removed 11 unreferenced files (76K saved)
- **Asset audit:** Comprehensive usage analysis completed
- **Documentation:** Technical standards streamlined

### 2025-07-09
- **BEM compliance:** Updated to 94% (target 100%)
- **Panel system:** Comprehensive BEM documentation
- **Performance:** Sub-5 second incremental builds achieved

### Legacy

---

## 9. Script Documentation Standards

### 9.1 Documentation Requirements (MUST Follow)

**Standard:** All scripts MUST include comprehensive documentation matching business importance.

**Documentation Tiers:**
- **High-value scripts** (Core, Content Creation): 74+ documentation lines
- **Medium-value scripts** (Validation, Utilities): 40+ documentation lines
- **Low-value scripts** (Legacy, Experimental): 20+ documentation lines

### 9.2 Shell Script Documentation Template (MUST Follow)

```bash
#!/bin/bash
# =============================================================================
# [SCRIPT_NAME] - [ONE_LINE_PURPOSE]
# =============================================================================
#
# PURPOSE:
#   [Detailed explanation of business purpose and technical function]
#
# BUSINESS VALUE:
#   [High/Medium/Low] - [Why this script matters to operations]
#
# USAGE:
#   [command] [arguments] [options]
#
#   Arguments:
#     arg1    Description
#     arg2    Description (optional)
#
#   Options:
#     --flag  Description
#
# EXAMPLES:
#   [command] example1
#   [command] --option example2
#
# REQUIREMENTS:
#   - Dependency 1
#   - Dependency 2
#
# INTEGRATION:
#   - Called by: [other scripts/processes]
#   - Calls: [dependencies/other scripts]
#   - Data sources: [input files/directories]
#   - Outputs: [generated files/logs]
#
# AUTHOR: [Name/Team]
# CREATED: [Date]
# LAST_UPDATED: [Date] - [Brief change description]
#
# =============================================================================
```

### 9.3 Python Script Documentation Template (MUST Follow)

```python
#!/usr/bin/env python3
"""
[Script Name] - [One Line Purpose]

[Detailed description of functionality, business purpose, and integration context]

Business Value: [High/Medium/Low] - [Explanation of importance to operations]

Usage:
    python script.py [--options] arguments
    python script.py --help

Arguments:
    argument1    Description of required argument
    argument2    Description (optional, default: value)

Options:
    --option     Description of optional flag
    --verbose    Enable detailed output
    --dry-run    Show what would be done without executing

Examples:
    python script.py basic_example
    python script.py --verbose --option advanced_example

Requirements:
    - Python 3.6+
    - pip install requirement1 requirement2
    - File dependencies: path/to/file

Integration:
    - Called by: [processes that invoke this script]
    - Dependencies: [other scripts/data this relies on]
    - Outputs: [files/data generated]
    - Frequency: [how often this runs - daily/on-demand/etc]

Author: [Name/Team]
Created: [Date]
Last Updated: [Date] - [Change description]
"""
```

### 9.4 Documentation Quality Standards (MUST Include)

**Mandatory Components:**
- **Business Value Statement**: High/Medium/Low with justification
- **Integration Context**: How script fits in workflow
- **Real Working Examples**: Copy-paste ready commands
- **Complete Requirements**: All dependencies listed
- **Error Handling**: What happens when things go wrong

**Quality Metrics:**
- **Line counts** verified with documentation audit
- **Business context** clearly explained
- **Usage examples** tested and working
- **Dependencies** complete and accurate

### 9.5 Implementation Guidelines (SHOULD Follow)

**New Script Creation:**
1. Choose appropriate template (shell vs Python)
2. Fill all mandatory sections before implementation
3. Test all examples provided in documentation
4. Verify business value rating with stakeholders

**Existing Script Updates:**
1. Read existing documentation first
2. Update LAST_UPDATED field with changes
3. Maintain consistency with established patterns
4. Add new examples for new functionality

**Documentation Verification:**
```bash
# Count documentation lines (target: 74+ for high-value)
head -100 script.sh | grep -c "^#"
awk '/^"""$/,/^"""$/ {count++} END {print count}' script.py

# Verify script functionality
bash -n script.sh && echo "✅ Syntax valid"
python3 -m py_compile script.py && echo "✅ Syntax valid"
```

### 9.6 Current Documentation Status

**Fully Documented (Enterprise Grade):**
- `core/process_images.sh` - 46 lines (Gold Standard)
- `core/pre-commit_check.sh` - 74 lines
- `content-creation/generate_page_section.py` - 88 lines
- `data-generation/generate-brands-json.py` - 112 lines
- `content-creation/generate_brand_template.py` - 130 lines

**Total Documentation Added**: 351+ lines of professional documentation

**Pattern Established**: All new scripts MUST follow these standards

---
- **Nuclear fixes:** brand-card--insight (documented in archives)
- **Section flow:** 85% cleanup (595 → 87 violations)
- **Architecture:** Logic-light 3-layer system established

---

**Status:** ✅ **Standards Streamlined** - Ready for Development Team Use