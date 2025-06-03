# Phased Dimensions Implementation Guide

## Mission Context
Implement hero images and optimize the dimensions discovery system for customer discovery. The system should feature strategic dimensions (Russia market, founder-led attributes) while maintaining scalable architecture across all BRICS+ content.

## Strategic Approach: Featured Dimensions
- **Markets page**: Feature "Russia" (primary focus) and "Malaysia" (operational base)
- **Attributes page**: Feature "Founder-Led" (core mission) and "Heritage Brand" (differentiation)
- **Sectors page**: Feature key Russian sectors like "Wine" and "Artisanal Spirits"
- **Signals page**: Feature "Export Ready" and "Investment Ready" (partner value)

---

## Phase 1: Foundation Setup & Critical Fixes
**Goal**: Fix naming issues and prepare infrastructure  
**Time**: 30 minutes  
**Validation**: No errors, consistent naming

### 1.1 Fix Naming Inconsistencies
```bash
# Navigate to your project root directory first

# Fix ceramics icon naming (if file exists)
if [ -f "assets/images/icons/png/dimensions/sectors/artisanal-ceramics.png" ]; then
    mv assets/images/icons/png/dimensions/sectors/artisanal-ceramics.png assets/images/icons/png/dimensions/sectors/artisan-ceramics.png
    echo "✅ Fixed ceramics icon naming"
else
    echo "ℹ️  Ceramics icon already correctly named or doesn't exist"
fi

# Fix Indonesia image capitalization (if file exists)
if [ -f "assets/images/dimensions/markets/originals/Indonesia.jpg" ]; then
    mv assets/images/dimensions/markets/originals/Indonesia.jpg assets/images/dimensions/markets/originals/indonesia.jpg
    echo "✅ Fixed Indonesia image capitalization"
else
    echo "ℹ️  Indonesia image already correctly named or doesn't exist"
fi
```

### 1.2 Create Missing Assets
```bash
# Create missing honey-bee-products icon (copy from similar sector)
if [ ! -f "assets/images/icons/png/dimensions/sectors/honey-bee-products.png" ]; then
    if [ -f "assets/images/icons/png/dimensions/sectors/natural-supplements.png" ]; then
        cp assets/images/icons/png/dimensions/sectors/natural-supplements.png assets/images/icons/png/dimensions/sectors/honey-bee-products.png
        echo "✅ Created placeholder honey-bee-products icon (update with proper design later)"
    else
        echo "⚠️  Need to create honey-bee-products.png icon"
    fi
fi
```

### 1.3 Validation Check
```bash
# Verify critical files exist
echo "Checking critical files..."
ls -la assets/images/dimensions/sectors/wine-*.jpg
ls -la assets/images/dimensions/markets/russia-*.jpg
ls -la _dimensions/en/sectors/wine.md
ls -la _dimensions/en/markets/russia.md
```

**Success Criteria**: All expected files exist, no naming inconsistencies

---

## Phase 2: Hero Image Integration
**Goal**: Connect hero images to dimension templates  
**Time**: 1 hour  
**Validation**: Hero images display on dimension pages

### 2.1 Update Dimension Layout Template
Modify `_layouts/dimension.html` to include hero image support:

```liquid
---
layout: default
---
{% comment %}
  Enhanced Dimension Layout with Hero Image Support
{% endcomment %}

{% assign page_dimension = page %}

<div class="dimension-page">
  {% comment %} Hero section with image {% endcomment %}
  <section class="dimension-section dimension-section--hero" 
           id="dimension-section-hero" 
           aria-labelledby="heading-hero">
    <div class="panel panel--hero-image"
         style="background-image: url('{{ site.baseurl }}/assets/images/dimensions/{{ page.category }}/{{ page.dimension }}-1200w.jpg');">
      <div class="panel__content">
        <div class="hero-content">
          <h1 class="hero-title">{{ page.title }}</h1>
          {% if page.description %}
            <p class="hero-description">{{ page.description }}</p>
          {% endif %}
        </div>
      </div>
    </div>
  </section>

  {% comment %} Use existing data-driven section rendering for other sections {% endcomment %}
  {% assign remaining_sections = page.sections | default: "breadcrumbs,content,featured-brands,related-insights" | split: "," %}
  {% for section in remaining_sections %}
    {% unless section == "hero" %}
      <section class="dimension-section dimension-section--{{ section }}"
               id="dimension-section-{{ section }}"
               aria-labelledby="heading-{{ section }}">
        <div class="panel panel--light">
          <div class="panel__content">
            {% include pages/dimension/{{ section }}.html %}
          </div>
        </div>
      </section>
    {% endunless %}
  {% endfor %}
</div>

<script src="{{ '/assets/js/pages/dimension/dimension-filtering.js' | relative_url }}"></script>
```

### 2.2 Add Hero Image CSS Support
Create/update `assets/css/pages/dimension.scss`:

```scss
// Dimension page hero image styles
.dimension-page {
  .panel--hero-image {
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    position: relative;
    min-height: 60vh;
    
    // Dark overlay for text readability
    &::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0, 0, 0, 0.4);
      z-index: 1;
    }
    
    .panel__content {
      position: relative;
      z-index: 2;
      display: flex;
      align-items: center;
      min-height: 60vh;
    }
    
    .hero-content {
      color: white;
      text-align: center;
      width: 100%;
      
      .hero-title {
        font-size: 3rem;
        font-weight: bold;
        margin-bottom: 1rem;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        
        @media (max-width: 768px) {
          font-size: 2rem;
        }
      }
      
      .hero-description {
        font-size: 1.25rem;
        max-width: 600px;
        margin: 0 auto;
        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
        
        @media (max-width: 768px) {
          font-size: 1rem;
        }
      }
    }
  }
}
```

### 2.3 Test Implementation
```bash
# Build and test locally
bundle exec jekyll serve

# Visit test pages:
# http://localhost:4000/en/discover/markets/russia/
# http://localhost:4000/en/discover/sectors/wine/
# http://localhost:4000/en/discover/attributes/founder-led/
```

**Success Criteria**: Hero images display properly with text overlay, responsive design works

---

## Phase 3: Featured Dimensions Strategy
**Goal**: Implement strategic dimension highlighting  
**Time**: 45 minutes  
**Validation**: Featured dimensions appear prominently in discovery

### 3.1 Update Dimension Front Matter
Add `featured: true` to strategic dimensions:

```yaml
# _dimensions/en/markets/russia.md
---
lang: en
ref: market-russia
layout: dimension
title: "Russia"
dimension: russia
category: market
featured: true  # Add this line
priority: 1     # Add this line for ordering
permalink: /en/discover/markets/russia/
---
```

Apply to these dimensions:
- **Markets**: `russia.md`, `malaysia.md`
- **Attributes**: `founder-led.md`, `heritage-brand.md`
- **Sectors**: `wine.md`, `artisanal-spirits.md`
- **Signals**: `export-ready.md`, `investment-ready.md`

### 3.2 Update Discovery Grid Components
Modify `_includes/components/dimensions/discovery-dimensions-grid.html`:

```liquid
{% comment %} Enhanced grid with featured dimensions priority {% endcomment %}
<div class="dimensions-grid">
  {% for type in types %}
    <div class="dimensions-group">
      <h3 class="dimensions-group__title">{{ type | capitalize }}</h3>
      
      {% comment %} Get dimensions and sort by featured status and priority {% endcomment %}
      {% assign dimensions_array = site.data[type][type] %}
      {% assign featured_dimensions = dimensions_array | where: "featured", true | sort: "priority" %}
      {% assign other_dimensions = dimensions_array | where: "featured", false %}
      
      <div class="dimensions-grid__items">
        {% comment %} Show featured dimensions first {% endcomment %}
        {% for dimension in featured_dimensions %}
          {% include components/cards/dimension-card.html 
             dimension=dimension 
             type=type 
             featured=true %}
        {% endfor %}
        
        {% comment %} Show remaining dimensions {% endcomment %}
        {% for dimension in other_dimensions limit: 4 %}
          {% include components/cards/dimension-card.html 
             dimension=dimension 
             type=type 
             featured=false %}
        {% endfor %}
      </div>
    </div>
  {% endfor %}
</div>
```

### 3.3 Enhanced Dimension Cards
Update `_includes/components/cards/dimension-card.html`:

```liquid
{% comment %} Enhanced dimension card with featured styling and icons {% endcomment %}
{% assign card_class = "dimension-card" %}
{% if include.featured %}
  {% assign card_class = card_class | append: " dimension-card--featured" %}
{% endif %}

<div class="{{ card_class }} dimension-card--{{ include.type | replace: 's', '' }}">
  {% comment %} Icon integration {% endcomment %}
  {% if site.data.icons.dimensions[include.type][include.dimension.id] %}
    <div class="dimension-card__icon">
      <img src="{{ site.baseurl }}/assets/images/icons/png/dimensions/{{ include.type }}/{{ include.dimension.id }}.png"
           alt="{{ include.dimension.translations[page.lang].name }} icon"
           loading="lazy">
    </div>
  {% endif %}
  
  {% comment %} Card content {% endcomment %}
  <div class="dimension-card__content">
    <h4 class="dimension-card__title">
      <a href="{{ site.baseurl }}/{{ page.lang }}/discover/{{ include.type }}/{{ include.dimension.id }}/">
        {{ include.dimension.translations[page.lang].name }}
      </a>
    </h4>
    
    {% if include.dimension.translations[page.lang].short_description %}
      <p class="dimension-card__description">
        {{ include.dimension.translations[page.lang].short_description }}
      </p>
    {% endif %}
    
    {% if include.featured %}
      <span class="dimension-card__badge">Featured</span>
    {% endif %}
  </div>
</div>
```

**Success Criteria**: Strategic dimensions appear first with featured styling

---

## Phase 4: Icon Integration System
**Goal**: Add icons to navigation and cards  
**Time**: 30 minutes  
**Validation**: Icons display consistently across components

### 4.1 Icon Helper Component
Create `_includes/components/icons/dimension-icon.html`:

```liquid
{% comment %}
  Dimension Icon Component
  Parameters: type, dimension_id, size (optional)
{% endcomment %}
{% assign icon_size = include.size | default: "24" %}
{% assign icon_path = "/assets/images/icons/png/dimensions/" | append: include.type | append: "/" | append: include.dimension_id | append: ".png" %}

<img src="{{ site.baseurl }}{{ icon_path }}"
     alt="{{ include.dimension_id | replace: '-', ' ' | capitalize }} icon"
     width="{{ icon_size }}"
     height="{{ icon_size }}"
     loading="lazy"
     class="dimension-icon dimension-icon--{{ include.type | replace: 's', '' }}">
```

### 4.2 Update Dimension Cloud with Icons
Modify `_includes/components/dimensions/dimension-cloud.html`:

```liquid
{% comment %} Enhanced dimension cloud with icons {% endcomment %}
<div class="dimension-cloud">
  {% for type in types %}
    {% assign dimensions_array = site.data[type][type] %}
    {% if dimensions_array and dimensions_array.size > 0 %}
      <div class="dimension-cloud__group">
        <h3 class="dimension-cloud__label">{% include helpers/t.html key=group_key fallback=fallback_text %}</h3>
        <div class="dimension-cloud__dimensions">
          {% for dimension in dimensions_array %}
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/{{ type }}/{{ dimension.id }}/"
               class="dimension dimension--{{ type | replace: 's', '' }}">
              {% include components/icons/dimension-icon.html 
                 type=type 
                 dimension_id=dimension.id 
                 size="16" %}
              {{ dimension.translations[page.lang].name }}
            </a>
          {% endfor %}
        </div>
      </div>
    {% endif %}
  {% endfor %}
</div>
```

### 4.3 Icon Styling
Add to `assets/css/components/dimensions.scss`:

```scss
// Dimension icon styles
.dimension-icon {
  display: inline-block;
  vertical-align: middle;
  margin-right: 0.5rem;
  
  &--sector { filter: hue-rotate(120deg); }
  &--market { filter: hue-rotate(200deg); }
  &--attribute { filter: hue-rotate(30deg); }
  &--signal { filter: hue-rotate(280deg); }
}

// Enhanced dimension cards with icons
.dimension-card {
  &__icon {
    text-align: center;
    margin-bottom: 1rem;
    
    img {
      width: 48px;
      height: 48px;
    }
  }
  
  &--featured {
    border: 2px solid var(--primary-500);
    background: linear-gradient(135deg, var(--primary-50), var(--primary-100));
    
    .dimension-card__badge {
      background: var(--primary-500);
      color: white;
      padding: 0.25rem 0.5rem;
      border-radius: 0.25rem;
      font-size: 0.75rem;
      font-weight: bold;
      text-transform: uppercase;
    }
  }
}
```

**Success Criteria**: Icons display in dimension cards, clouds, and navigation

---

## Phase 5: Mongolia Decision & Cleanup
**Goal**: Resolve orphaned content and outdated files  
**Time**: 15 minutes  
**Validation**: No orphaned assets, clean file structure

### 5.1 Mongolia Decision
Choose one approach:

**Option A: Create Mongolia Dimensions** (if expanding to Mongolia market)
```bash
# Copy existing market template for each language
cp _dimensions/en/markets/malaysia.md _dimensions/en/markets/mongolia.md
cp _dimensions/ru/markets/malaysia.md _dimensions/ru/markets/mongolia.md
cp _dimensions/zh/markets/malaysia.md _dimensions/zh/markets/mongolia.md

# Update each file with Mongolia-specific content
# Then run: python3 _scripts/generate_search_index.py
```

**Option B: Remove Mongolia Assets** (recommended for MVP focus)
```bash
# Remove orphaned Mongolia assets
rm -f assets/images/dimensions/markets/mongolia-*.jpg
rm -f assets/images/dimensions/markets/originals/mongolia.jpg
rm -f assets/images/icons/png/dimensions/markets/mongolia.png
echo "✅ Removed orphaned Mongolia assets"
```

### 5.2 Cleanup Outdated Files
```bash
# Remove or update outdated structure file
if [ -f "_dimensions/dimensions_structure.txt" ]; then
    mv _dimensions/dimensions_structure.txt _dimensions/_legacy_structure_reference.txt
    echo "✅ Moved outdated structure file to legacy reference"
fi
```

**Success Criteria**: No orphaned assets, clean file structure

---

## Validation & Testing

### Complete System Test
```bash
# 1. Build without errors
bundle exec jekyll build

# 2. Test featured dimension pages
echo "Testing featured dimensions..."
curl -s -o /dev/null -w "%{http_code}" http://localhost:4000/en/discover/markets/russia/
curl -s -o /dev/null -w "%{http_code}" http://localhost:4000/en/discover/attributes/founder-led/

# 3. Validate image loading
echo "Checking hero image availability..."
ls -la assets/images/dimensions/markets/russia-1200w.jpg
ls -la assets/images/dimensions/attributes/founder-led-1200w.jpg

# 4. Check icon integration
ls -la assets/images/icons/png/dimensions/markets/russia.png
ls -la assets/images/icons/png/dimensions/attributes/founder-led.png
```

### Success Criteria Checklist
- [ ] All naming inconsistencies resolved
- [ ] Hero images display on dimension pages  
- [ ] Featured dimensions appear prominently in discovery
- [ ] Icons integrated in cards and navigation
- [ ] No orphaned assets remain
- [ ] Site builds without errors
- [ ] Mobile responsive design works
- [ ] All three languages supported

---

## Next Steps (Future Phases)

### Phase 6: Advanced Features (Optional)
- **Image optimization**: Implement WebP format with fallbacks
- **Search integration**: Add dimension-based filtering to search
- **Analytics**: Track which dimensions drive most engagement
- **Content management**: Create admin interface for dimension updates

### Phase 7: Performance & SEO
- **Schema markup**: Add structured data for dimension pages
- **Performance**: Implement lazy loading for dimension grids
- **SEO**: Optimize dimension page URLs and meta descriptions
- **Internationalization**: Add hreflang tags for dimension pages

---

**Implementation Guide Created**: June 2, 2025  
**Estimated Total Time**: 3 hours 30 minutes  
**Complexity**: Medium (requires template and CSS updates)  
**Risk Level**: Low (non-breaking changes with rollback options)