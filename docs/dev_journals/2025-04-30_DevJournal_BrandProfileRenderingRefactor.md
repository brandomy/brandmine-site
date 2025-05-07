# Development Journal: Brand Profile Rendering Refactor
**Date:** 2025-04-30  
**Topic:** Aligning brand templates and content with updated layout logic (`brand.html`)

---

## 1. Problem Statement

As Brandmine expands support for multilingual, multi-format brand profiles, we needed to ensure:

- Clean, scalable rendering of **core**, **lite**, and **full** brand profiles in `brand.html`
- Clear rules for **premium content**, **map rendering**, and **market presence**
- Consistency in structure, field naming, and layout logic across Markdown files
- Assurance that all profiles display correctly without requiring case-by-case overrides

---

## 2. Approach

We refactored the brand data model and template logic based on the following strategy:

- Treat `core`, `lite`, and `full` profiles as structural tiers, not display priorities
- Use `location_intelligence: true|false` to **manually control map rendering**
- Use `featured_level: 0|1|2` to **control brand visibility and emphasis**, independent of profile depth
- Remove redundant fields like `languages: [en]` from front matter
- Rely solely on `{{ content }}` for rendering narrative blocks like **Market Presence**
- Reserve `gallery`, `partnerships`, and certain premium fields for **full** profiles only

---

## 3. Implementation Details

### 🔧 Key Field Changes in Front Matter
```yaml
# Removed
languages: [en]  # Redundant given lang + folder structure

# Added or clarified
location_intelligence: false  # Suppresses MapLibre unless explicitly set true
featured_level: 0  # (0 = hidden, 1 = map-visible, 2 = full spotlight)
```

### 🧩 Conditional Rendering in `brand.html`
```liquid
{% if page.premium %}
  <!-- Contact, social media, international, signals -->
{% endif %}

{% if page.location.coordinates and page.premium and page.location_intelligence != false %}
  <!-- Location Intelligence (MapLibre map) -->
{% endif %}
```

### 📄 Narrative Sections
Only `{{ content }}` is used to render narrative sections like:

- Market Presence
- Product Range
- Founder’s Journey

These are structured in Markdown using `##` and `###` headings.

---

## 4. Decisions Made

| Decision | Rationale |
|----------|-----------|
| Dropped `languages:` field | Language already handled via `lang:` and folder structure |
| Introduced `location_intelligence:` toggle | Allows precise control over map visibility |
| Made premium logic **user-based**, not file-based | Avoids logic leakage into static content |
| Reserved gallery & partnership blocks for full profiles | Prevents clutter and maintains incentive structure |
| Kept `featured_level:` as display priority signal | Enables editorial control over site emphasis |

---

## 5. Resources

### ✅ Standard Translation Snippets for Market Presence

**RU:**
```markdown
## Присутствие на рынке
Бренд работает локально в своём родном регионе через независимые розничные магазины.
```

**ZH:**
```markdown
## 市场覆盖
该品牌在其本地市场通过独立零售商运营。
```

---

## 6. Insights & Learning

- Separating **profile depth** (core/lite/full) from **display logic** (featured level, premium) creates a more modular, future-proof structure
- Letting `{{ content }}` carry the narrative avoids overengineering the layout with extra front matter blocks
- Boolean flags (`location_intelligence`) are more intuitive and flexible than deriving logic from content presence

---

## 7. Next Actions

- [ ] ✅ Apply same cleanup across all brand content in RU and ZH directories
- [ ] ✅ Audit for placeholder or missing fields (e.g. empty timelines or contact emails)
- [ ] 🔄 Build a Jekyll lint/validation script to auto-flag missing required fields by profile type
- [ ] 🗺 Begin phased integration of MapLibre for profiles with `location_intelligence: true`
- [ ] 📦 Establish versioning or changelog system for templates to track ongoing improvements

---
