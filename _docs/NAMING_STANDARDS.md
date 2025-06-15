# Brandmine Naming Standards & Conventions

**Date:** June 15, 2025  
**Purpose:** Establish clear, consistent naming conventions following web development best practices  
**Scope:** All file types, CSS classes, front matter, and URLs

---

## 🎯 Core Principles

### 1. **Consistency Over Familiarity**
Use the same pattern everywhere within a domain, even if it feels unfamiliar initially.

### 2. **Web Standards First**
Follow established web development conventions for maximum compatibility and SEO.

### 3. **Framework Requirements Second**
Respect Jekyll/Ruby conventions only where required by the framework.

### 4. **Transformation Clarity**
When transformations are needed, make them explicit and consistent.

---

## 📁 File Naming Standards

### ✅ Use kebab-case for ALL web files

```bash
# Correct ✅
hero-section.html
brand-card.scss
market-analysis.md
founder-portrait.jpg

# Incorrect ❌
hero_section.html
brandCard.scss
marketAnalysis.md
founder_portrait.jpg
```

**Rationale:**
- Universal web standard
- URL-safe without encoding
- Readable and scannable
- Consistent with Jekyll best practices

**Applies to:**
- HTML templates and includes
- SCSS/CSS files
- Markdown content files
- Image and asset files
- JavaScript files

**Exception:** Jekyll special directories use underscores by framework requirement (`_includes/`, `_layouts/`, etc.)

---

## 🎨 CSS Class Naming Standards

### ✅ BEM Methodology with kebab-case

```scss
/* Block */
.insight-card { }

/* Elements */
.insight-card__title { }
.insight-card__meta { }
.insight-card__badge { }

/* Modifiers */
.insight-card--featured { }
.insight-card--brand-spotlight { }
.insight-card--founders-journey { }
```

**BEM Structure:**
- **Block:** `.block-name`
- **Element:** `.block-name__element-name`
- **Modifier:** `.block-name--modifier-name`

**Dynamic Class Generation:**
```liquid
<!-- Correct ✅ -->
class="insight-card insight-card--{{ include.insight.category | replace: '_', '-' }}"

<!-- Results in: insight-card--brand-spotlight -->
```

**Rationale:**
- Official BEM specification
- CSS-compatible (no escaping needed)
- Improved readability
- Standard across all major frameworks

---

## 📄 Front Matter Standards

### ✅ Context-Appropriate Naming

**YAML Keys (Multi-word fields):**
```yaml
# Use snake_case for YAML keys ✅
country_code: "ru"
founding_year: 1995
social_facebook: "https://facebook.com/brand"
reading_time: 8
```

**YAML Values (IDs, slugs, categories):**
```yaml
# Use kebab-case for values that become CSS classes or URLs ✅
category: "brand-spotlight"          # Becomes CSS class
ref: "ru-golden-ring-vodka"         # Becomes URL slug
sectors: ["artisanal-spirits"]      # Becomes URL and CSS
markets: ["russia"]                 # Becomes URL and CSS
attributes: ["founder-led"]         # Becomes URL and CSS
signals: ["export-ready"]           # Becomes URL and CSS
```

**Rationale:**
- YAML keys: Follow Ruby/Jekyll convention (snake_case)
- YAML values: Match their end usage (CSS classes, URLs = kebab-case)
- Clear distinction between data structure and data content

---

## 🔗 URL and Permalink Standards

### ✅ Use kebab-case for ALL URLs

```yaml
# Correct ✅
permalink: /en/brands/ru-golden-ring-vodka/
permalink: /en/insights/brand-spotlight/market-analysis/
permalink: /en/discover/sectors/artisanal-spirits/
```

```liquid
<!-- Correct ✅ -->
<a href="/en/discover/{{ sector | slugify }}/">{{ sector | capitalize }}</a>
<!-- Results in: /en/discover/artisanal-spirits/ -->
```

**Rationale:**
- SEO best practice
- URL-safe without encoding
- Consistent with modern web standards
- Better user experience (readable URLs)

---

## 🔄 Translation Key Standards

### ✅ Match front matter structure

```yaml
# _data/translations/en.yml
insights:
  categories:
    brand-spotlight: "Brand Spotlight"        # Matches front matter value
    founders-journey: "Founder's Journey"     # Matches front matter value
    market-momentum: "Market Momentum"        # Matches front matter value
    location-intelligence: "Location Intelligence" # Matches front matter value
```

**Template Usage:**
```liquid
<!-- Correct ✅ -->
{% assign category_key = include.insight.category %}
{% assign display_name = site.data.translations[page.lang].insights.categories[category_key] %}
```

**Rationale:**
- Direct mapping between data and translations
- No transformation logic needed in templates
- Easier maintenance and debugging

---

## 🖼️ Image Naming Standards

### ✅ Purpose-first, kebab-case

```bash
# Correct ✅
hero-storefront.jpg
founder-portrait.jpg
product-packaging.jpg
team-group-photo.jpg

# Incorrect ❌
storefront_hero.jpg
portrait-founder.jpg
packagingProduct.jpg
team_group_photo.JPG
```

**Structure:** `purpose-description.extension`

**Rationale:**
- Purpose-first sorting in file systems
- Consistent with file naming standards
- Better asset organization

---

## ⚙️ CSS Custom Properties

### ✅ Use kebab-case

```scss
/* Correct ✅ */
:root {
  --primary-color: #007a7a;
  --font-size-large: 1.25rem;
  --border-radius-small: 0.25rem;
  --transition-duration-fast: 0.15s;
}

/* Incorrect ❌ */
:root {
  --primary_color: #007a7a;
  --fontSize_large: 1.25rem;
  --borderRadius_small: 0.25rem;
}
```

**Rationale:**
- CSS specification standard
- Consistent with CSS property naming
- Better tooling support

---

## 🔧 Liquid Transformation Standards

### ✅ Explicit and Consistent Transformations

**For CSS Classes:**
```liquid
<!-- Always transform to kebab-case for CSS -->
class="insight-card--{{ include.insight.category | replace: '_', '-' }}"
class="brand-tag--{{ sector | replace: '_', '-' }}"
```

**For Translation Keys:**
```liquid
<!-- Preserve original format for translation lookup -->
{% assign translation_key = include.insight.category %}
{{ site.data.translations[page.lang].insights.categories[translation_key] }}
```

**For URLs:**
```liquid
<!-- Use slugify for URL safety -->
href="/en/insights/{{ include.insight.category | slugify }}/"
```

**For File References:**
```liquid
<!-- Transform for file naming consistency -->
{% assign icon_file = include.insight.category | replace: '_', '-' %}
<img src="/assets/images/icons/{{ icon_file }}.svg">
```

---

## 📊 Quick Reference Table

| Domain | Convention | Example | Rationale |
|--------|------------|---------|-----------|
| **File Names** | kebab-case | `brand-card.html` | Web standard |
| **CSS Classes** | kebab-case (BEM) | `.insight-card--brand-spotlight` | BEM specification |
| **URLs** | kebab-case | `/brand-spotlight/` | SEO best practice |
| **YAML Keys** | snake_case | `country_code:` | YAML/Ruby convention |
| **YAML Values** | kebab-case | `"brand-spotlight"` | End-usage matching |
| **CSS Properties** | kebab-case | `--primary-color` | CSS specification |
| **Directories** | underscore | `_includes/` | Jekyll requirement |

---

## 🚫 Common Anti-Patterns to Avoid

### ❌ Mixed Naming in Same Domain
```liquid
<!-- Don't mix conventions -->
class="insight-card insight_card--{{ category }}"
```

### ❌ Transformations in CSS
```scss
/* Don't put transformation logic in CSS */
.insight-card--brand_spotlight { } /* Wrong source format */
```

### ❌ Inconsistent Transformations
```liquid
<!-- Don't apply different transformations in different templates -->
{{ category | replace: '_', '-' }}  <!-- Template A -->
{{ category }}                      <!-- Template B -->
```

### ❌ Framework-Style Naming for Web Content
```yaml
# Don't use framework naming for web-facing content
category: "brand_spotlight"  # Wrong for CSS
permalink: "/brand_spotlight/" # Wrong for URLs
```

---

## ✅ Migration Strategy

### Phase 1: Immediate Fixes (Template Transformations)
- Add `| replace: '_', '-'` to dynamic class generation
- Restore visual functionality immediately

### Phase 2: Content Standardization  
- Update front matter values to kebab-case
- Update translation keys to match
- Remove transformation logic from templates

### Phase 3: Validation Implementation
- Add pre-commit checks for naming consistency
- Implement automated validation tools

---

## 🎯 Success Metrics

### ✅ Visual Consistency Restored
- All category-specific styling works
- Brand visual hierarchy maintained

### ✅ Developer Clarity
- Clear conventions for each domain
- No confusion about which pattern to use

### ✅ Future-Proof Standards
- Aligned with web development best practices
- Scalable for new content and features

---

**Remember:** When in doubt, follow web standards first, then adapt for framework requirements only where necessary.