---
sitemap: false
---

# Jekyll Optimization Guide for Enhanced Includes

## Performance Optimization Opportunities

While all enhanced files are fully compliant, here are optimization patterns that could be applied if performance becomes a concern:

### 1. Data Access Optimization (page-sections.html)

**Current Pattern**:
```liquid
{% raw %}{% assign sections_config = site.data.page_sections[page_type] %}{% endraw %}
```

**Optimized Pattern** (if needed):
```liquid
{% raw %}{% comment %} Cache data access outside of loops {% endcomment %}
{% unless page_sections_cache %}
  {% assign page_sections_cache = site.data.page_sections %}
{% endunless %}
{% assign sections_config = page_sections_cache[page_type] %}{% endraw %}
```

### 2. String Operation Optimization (page-sections.html)

**Current Pattern**:
```liquid
{% raw %}{% assign section_as_string = section_item | append: "" %}{% endraw %}
```

**Alternative Pattern** (if performance critical):
```liquid
{% raw %}{% comment %} Use capture for complex string building {% endcomment %}
{% capture section_as_string %}{{ section_item }}{% endcapture %}{% endraw %}
```

### 3. Loop Optimization (brand-card.html)

**Current Pattern**:
```liquid
{% raw %}{% for market in brand.markets limit:1 %}
  {% include components/helpers/taxonomy-tag.html %}
{% endfor %}{% endraw %}
```

**Optimized Pattern** (avoids loop for single item):
```liquid
{% raw %}{% if brand.markets.first %}
  {% include components/helpers/taxonomy-tag.html
     type="market"
     value=brand.markets.first
     class_name="brand-card" %}
{% endif %}{% endraw %}
```

### 4. Variable Assignment Optimization (dimension-name.html)

**Current Pattern**:
```liquid
{% raw %}{% assign dimension = dimensions | where: "id", include.id | first %}{% endraw %}
```

**Note**: This is already optimal for Jekyll. The `where` filter is efficient.

## Jekyll 3.9.5 to 4.x Migration Checklist

When ready to upgrade to Jekyll 4.x:

### ✅ Already Compatible
- [ ] Modern include syntax with named parameters
- [ ] Proper Liquid tag spacing
- [ ] No deprecated filters
- [ ] Proper comment blocks

### 🔄 Review During Migration
- [ ] Check for new Jekyll 4.x optimizations
- [ ] Test incremental regeneration features
- [ ] Verify collection handling improvements
- [ ] Check new caching mechanisms

### 📊 Performance Monitoring

Add these to track performance:
```liquid
{% raw %}{% comment %} Add timing markers if needed {% endcomment %}
{% assign start_time = "now" | date: "%s" %}
<!-- component logic here -->
{% assign end_time = "now" | date: "%s" %}
{% comment %} Log: {{ end_time | minus: start_time }}ms {% endcomment %}{% endraw %}
```

## Build Time Optimization Tips

1. **Use `--incremental` flag during development**:
   ```bash
   bundle exec jekyll serve --incremental
   ```

2. **Exclude unnecessary files in _config.yml**:
   ```yaml
   exclude:
     - node_modules
     - vendor
     - .git
     - _scripts
     - _docs
   ```

3. **Use Jekyll 3.9.5 `--profile` flag**:
   ```bash
   bundle exec jekyll build --profile
   ```

## Conclusion

The enhanced files are already well-optimized. These suggestions are only needed if:
- Build times exceed 30 seconds
- Large data sets are introduced
- Complex nested includes are added

Current performance is excellent for the site's scale.