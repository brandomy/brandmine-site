# Page Sections Update Recommendations

This document provides specific line-by-line recommendations for updating `_data/page_sections.yml` based on the section patterns analysis.

## Quick Reference: Changes by Page Type

| Page Type | Action Required | Sections to Change |
|-----------|----------------|-------------------|
| home | Uncomment sections | Enable all 13 commented sections |
| brand-profile | Remove section | Remove `impact` |
| founder-profile | Remove sections | Remove `impact` and `founder-wisdom` |
| insight-article | Remove section | Remove `social-sharing` |
| post | Replace sections | Replace `header` + `taxonomy` with `tag-cloud` |
| brands | Replace section | Replace `filter-interface` with `search` |
| founders | Update sections | Replace `filter-interface` with `search`, remove `founders-grid`, add `contact-cta` |
| insights | Major update | Add `featured-article`, `category-highlights`, `latest-insights-carousel` |
| about | Add section | Add `breadcrumbs` as first section |
| journal | Add section | Add `featured-article` after `impact` |
| error-404 | Remove sections | Remove `hero` and `search-suggestions` |

## Detailed Changes

### 1. Home Page (Lines 9-24)
**Action:** Uncomment all sections
```yaml
home:
  body_class: "home-page"
  default_sections:
    - hero
    - impact-statement          # uncomment
    - discovery-dimensions      # uncomment
    - featured-case-studies
    - how-it-works             # uncomment
    - testimonials             # uncomment
    - featured-brands          # uncomment
    - lead-capture             # uncomment
    - location-intelligence    # uncomment
    - founder-focus            # uncomment
    - brand-owners             # uncomment
    - latest-insights-tagged   # uncomment
    - final-cta                # uncomment
```

### 2. Brand Profile (Lines 321-333)
**Action:** Remove `impact` section
```yaml
brand-profile:
  body_class: "brand-profile-page"
  default_sections:
    - breadcrumbs
    - identity
    # - impact                 # remove this line
    - founder-narrative
    - content
    - business-intelligence
    - location-intelligence
    - connections
```

### 3. Founder Profile (Lines 354-366)
**Action:** Remove `impact` and `founder-wisdom`
```yaml
founder-profile:
  body_class: "founder-profile-page"
  default_sections:
    - breadcrumbs
    - hero
    # - impact                 # remove this line
    - professional-details
    - content
    # - founder-wisdom         # remove this line
    - associated-brands
    - expertise-cloud
    - related-insights
```

### 4. Insight Article (Lines 423-437)
**Action:** Remove `social-sharing`
```yaml
insight-article:
  body_class: "insight-article-page"
  default_sections:
    - breadcrumbs
    - hero
    - header
    - featured-image
    - content
    # - social-sharing         # remove this line
    - taxonomy
    - brand-info
    - related-brands
    - related-insights
```

### 5. Blog Post (Lines 527-538)
**Action:** Replace `header` and `taxonomy` with `tag-cloud`
```yaml
post:
  body_class: "post-page"
  default_sections:
    - breadcrumbs
    - hero
    - tag-cloud                # replace header
    - content
    - social-sharing
    # - taxonomy               # remove this line
    - related-posts
    - author-profile
```

### 6. Brands Page (Lines 59-71)
**Action:** Replace `filter-interface` with `search`, remove `content`
```yaml
brands:
  body_class: "brands-page"
  default_sections:
    - breadcrumbs
    - hero
    - impact
    # - content                # remove this line
    - search                   # replace filter-interface
    - featured-brands
    - latest-brands
    - contact-cta
```

### 7. Founders Page (Lines 97-108)
**Action:** Replace `filter-interface` with `search`, remove `content` and `founders-grid`, add `contact-cta`
```yaml
founders:
  body_class: "founders-page"
  default_sections:
    - breadcrumbs
    - hero
    - impact
    # - content                # remove this line
    - search                   # replace filter-interface
    # - founders-grid          # remove this line
    - featured-founders
    - recent-founders
    - contact-cta              # add this line
```

### 8. Insights Page (Lines 170-184)
**Action:** Major restructure
```yaml
insights:
  body_class: "insights-page"
  default_sections:
    - breadcrumbs
    - hero
    - impact
    - featured-article         # add this line
    - category-navigation
    - category-highlights      # add this line
    - latest-insights-carousel # add this line
    - subscribe                # add this line
    - contact-cta
    # Remove: content, categories, filter-interface, featured-insights, recent-insights
```

### 9. About Page (Lines 286-297)
**Action:** Add `breadcrumbs` as first section
```yaml
about:
  body_class: "about-page"
  default_sections:
    - breadcrumbs              # add this line
    - hero
    - mission
    - perspective
    - problems
    - solutions
    - services
    - team
    - contact
```

### 10. Journal Page (Lines 212-223)
**Action:** Add `featured-article` after `impact`
```yaml
journal:
  body_class: "journal-page"
  default_sections:
    - breadcrumbs
    - hero
    - impact
    - featured-article         # add this line
    - content
    - latest-entries
    - author-profile
    - contact-cta
```

### 11. Error 404 Page (Lines 488-496)
**Action:** Remove `hero` and `search-suggestions`
```yaml
error-404:
  body_class: "error-404-page"
  default_sections:
    - breadcrumbs
    # - hero                   # remove this line
    - content
    # - search-suggestions     # remove this line
```

## Panel Mappings Updates

### For new sections, add these panel mappings:

**For `tag-cloud` in post layout:**
```yaml
tag-cloud:
  type: panel--light
```

**For `search` in brands/founders layouts:**
```yaml
search:
  type: panel--light
```

**For `featured-article` in insights/journal:**
```yaml
featured-article:
  type: panel--amber-soft
```

**For `category-highlights` and `latest-insights-carousel` in insights:**
```yaml
category-highlights:
  type: panel--light
latest-insights-carousel:
  type: panel--amber-soft
subscribe:
  type: panel--cta
  content_classes: panel--centered
```

## Testing Checklist

After making these updates:

1. [ ] Run Jekyll build to ensure no errors
2. [ ] Test each page type in all three languages
3. [ ] Verify panel mappings work correctly
4. [ ] Check that removed sections don't break anything
5. [ ] Validate new sections render properly
6. [ ] Update any affected templates
7. [ ] Remove custom sections from individual files that now match defaults

## Files That Can Remove Custom Sections

After these updates, the following files can have their `sections:` front matter removed:

- All 18 brand profile files
- All 12 founder profile files  
- All 12 insight article files
- All 9 blog post files
- All 3 brands collection pages
- All 3 founders collection pages
- All 3 about pages
- All 3 journal pages
- All 3 404 pages

Total: ~69 files can be simplified