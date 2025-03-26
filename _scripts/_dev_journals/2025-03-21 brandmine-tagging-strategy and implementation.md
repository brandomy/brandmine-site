# Brandmine Blog Tagging Strategy & Implementation Guide

## 1. Tagging Strategy Overview

Our strategy creates a three-dimensional taxonomy system that provides multiple discovery paths while maintaining clear separation between conceptually different tag types:

1. **Sector Tags (16)**: Product and service categories representing key Russian export opportunities, directly mapping to your strategic focus areas
2. **Attribute Tags (8)**: Distinctive brand qualities that shape positioning and narratives
3. **Growth Tags (4)**: Business readiness indicators for specific expansion paths

This three-dimensional approach allows users to discover content through complementary lenses:
- **What** the brand offers (Sectors)
- **How** the brand differentiates itself (Attributes)
- **Where** the brand is headed (Growth)

Each dimension uses distinct visual styling to create clear separation while maintaining a cohesive design language. The system is designed to transition smoothly into the badge system in the future, with each tag potentially mapping to a corresponding badge.

## 2. Brand Attributes Selection

After consolidating the original Brand Essence and Business Attributes lists, we've identified eight distinctive brand attributes that provide clear differentiation:

1. **Founder-Led**
   - Brands where founders remain active leaders with significant influence
   - Signals authentic vision, passionate leadership, and personal quality commitment

2. **Heritage Brand**
   - Brands with 50+ years of history and documented cultural impact
   - Signals proven staying power, cultural authenticity, and traditional expertise

3. **Artisanal Excellence**
   - Brands committed to exceptional handcraft and traditional production methods
   - Signals quality focus, attention to detail, and authentic production approaches

4. **Regional Icon**
   - Brands that authentically represent specific local regions
   - Signals genuine connection to place and strong local reputation

5. **Innovation Leader**
   - Brands blending traditional foundations with forward-thinking approaches
   - Signals dynamism, adaptability, and future-oriented thinking

6. **Premium Positioning**
   - Brands positioned in upper market segments with superior quality
   - Signals exceptional value and upmarket targeting

7. **Cultural Ambassador**
   - Brands actively showcasing distinctive cultural elements
   - Signals rich storytelling potential and authentic cultural insight

8. **Sustainability Pioneer**
   - Brands with exceptional environmental and social practices
   - Signals ethical operations and alignment with contemporary values

These attributes were selected because they:
- Represent distinct and independent qualities (minimal overlap)
- Offer clear qualification criteria for consistent application
- Translate well across languages and cultures
- Map directly to potential future badges
- Balance storytelling elements with business positioning
- Cover the most strategically valuable brand differentiators

## 3. Multilingual Implementation Approach

For multilingual implementation, we recommend language-specific tag pages with consistent tag identifiers:

### Key Elements:

1. **Language-Specific URL Structure**
   - English: `/en/tags/[type]/[tag-name]/`
   - Russian: `/ru/tags/[type]/[tag-name]/`
   - Chinese: `/zh/tags/[type]/[tag-name]/`

2. **Consistent Tag Identifiers**
   - Tag identifiers (`tag` field value) remain consistent across languages
   - Example: `founder-led` identifier used in all languages, even though the displayed title varies

3. **Language-Specific Content**
   - Each tag page has language-appropriate title, description, and content
   - Translations managed through separate files for each language

4. **Language Detection**
   - Tags link to the appropriate language version based on the user's current language context
   - When viewing Russian content, tags link to Russian tag pages

### Directory Structure:

```
_tags/
├── en/
│   ├── sectors/
│   │   └── [16 English sector tags]
│   ├── attributes/
│   │   └── [8 English attribute tags]
│   └── growth/
│       └── [4 English growth tags]
├── ru/
│   ├── sectors/
│   │   └── [16 Russian sector tags]
│   ├── attributes/
│   │   └── [8 Russian attribute tags]
│   └── growth/
│       └── [4 Russian growth tags]
└── zh/
    ├── sectors/
    │   └── [16 Chinese sector tags]
    ├── attributes/
    │   └── [8 Chinese attribute tags]
    └── growth/
        └── [4 Chinese growth tags]
```

This approach:
- Maintains your existing language-first URL structure
- Preserves language context throughout the user journey
- Allows for language-specific SEO optimization
- Enables fully localized content on tag pages
- Scales well for future language additions

## 4. Implementation Guide

### Step 1: Create Tag Directory Structure

```bash
# Create language-specific sector tag directories
mkdir -p _tags/en/sectors _tags/ru/sectors _tags/zh/sectors

# Create language-specific attribute tag directories
mkdir -p _tags/en/attributes _tags/ru/attributes _tags/zh/attributes

# Create language-specific growth tag directories
mkdir -p _tags/en/growth _tags/ru/growth _tags/zh/growth
```

### Step 2: Configure Collection in _config.yml

Add or update the tags collection configuration:

```yaml
collections:
  tags:
    output: true
    permalink: /:collection/:path/
```

Add language-specific defaults to simplify tag file creation:

```yaml
defaults:
  # Other defaults...
  
  # Tag defaults for each language
  - scope:
      path: "_tags/en"
      type: "tags"
    values:
      layout: "tag"
      lang: "en"
  - scope:
      path: "_tags/ru"
      type: "tags"
    values:
      layout: "tag"
      lang: "ru"
  - scope:
      path: "_tags/zh"
      type: "tags"
    values:
      layout: "tag"
      lang: "zh"
```

### Step 3: Create Sample Tag Files

Create a sample sector tag in each language:

**English (_tags/en/sectors/hotels-resorts.md):**
```yaml
---
title: "Hotels & Resorts"
tag: hotels-resorts
tag_type: sector
description: "Russian boutique hotels and resorts offering unique cultural experiences and distinctive hospitality traditions."
permalink: /en/tags/sectors/hotels-resorts/
---

From historic city properties to remote wilderness retreats, Russian boutique hotels and resorts showcase the country's remarkable diversity. These properties represent both experiential consumer offerings and compelling B2B investment opportunities, with many independent gems ripe for consolidation, brand development, and international market positioning.
```

**Russian (_tags/ru/sectors/hotels-resorts.md):**
```yaml
---
title: "Гостиницы и курорты"
tag: hotels-resorts
tag_type: sector
description: "Российские бутик-отели и курорты, предлагающие уникальный культурный опыт и самобытные традиции гостеприимства."
permalink: /ru/tags/sectors/hotels-resorts/
---

От исторических городских объектов до отдаленных природных курортов, российские бутик-отели и курорты демонстрируют удивительное разнообразие страны. Эти объекты представляют собой как потребительские предложения с погружением в культуру, так и привлекательные возможности для бизнес-инвестиций, причем многие независимые жемчужины готовы к консолидации, развитию бренда и международному позиционированию.
```

**Chinese (_tags/zh/sectors/hotels-resorts.md):**
```yaml
---
title: "酒店和度假村"
tag: hotels-resorts
tag_type: sector
description: "提供独特文化体验和特色款待传统的俄罗斯精品酒店和度假村。"
permalink: /zh/tags/sectors/hotels-resorts/
---

从历史悠久的城市物业到偏远的荒野度假村，俄罗斯的精品酒店和度假村展示了该国的非凡多样性。这些物业既代表了体验式消费者产品，也代表了有吸引力的商业投资机会，许多独立的精品物业已经成熟，可以进行整合、品牌发展和国际市场定位。
```

### Step 4: Create Include Files for Tag Display

**Create _includes/tags/tag-list.html:**

```html
<div class="tag-list">
  {% if include.tags %}
    {% assign sector_tags = "" | split: "" %}
    {% assign attribute_tags = "" | split: "" %}
    {% assign growth_tags = "" | split: "" %}
    
    {% for tag in include.tags %}
      {% assign tag_path = tag | slugify %}
      
      {% for site_tag in site.tags %}
        {% if site_tag.tag == tag %}
          {% if site_tag.tag_type == "sector" %}
            {% assign sector_tags = sector_tags | push: site_tag %}
            {% break %}
          {% elsif site_tag.tag_type == "attribute" %}
            {% assign attribute_tags = attribute_tags | push: site_tag %}
            {% break %}
          {% elsif site_tag.tag_type == "growth" %}
            {% assign growth_tags = growth_tags | push: site_tag %}
            {% break %}
          {% endif %}
        {% endif %}
      {% endfor %}
    {% endfor %}
    
    {% if sector_tags.size > 0 %}
      <div class="sector-tags">
        {% for tag in sector_tags %}
          <a href="{{ tag.url | relative_url }}" class="tag sector-tag">{{ tag.title }}</a>
        {% endfor %}
      </div>
    {% endif %}
    
    {% if attribute_tags.size > 0 %}
      <div class="attribute-tags">
        {% for tag in attribute_tags %}
          <a href="{{ tag.url | relative_url }}" class="tag attribute-tag">{{ tag.title }}</a>
        {% endfor %}
      </div>
    {% endif %}
    
    {% if growth_tags.size > 0 %}
      <div class="growth-tags">
        {% for tag in growth_tags %}
          <a href="{{ tag.url | relative_url }}" class="tag growth-tag">{{ tag.title }}</a>
        {% endfor %}
      </div>
    {% endif %}
  {% endif %}
</div>
```

**Create _includes/tags/tag-cloud.html:**

```html
<div class="tag-cloud">
  <h3>{{ site.data.translations[page.lang].tags.sectors }}</h3>
  <div class="sector-cloud">
    {% assign sector_tags = site.tags | where: "tag_type", "sector" | where: "lang", page.lang %}
    {% for tag in sector_tags %}
      <a href="{{ tag.url | relative_url }}" class="tag sector-tag">{{ tag.title }}</a>
    {% endfor %}
  </div>
  
  <h3>{{ site.data.translations[page.lang].tags.attributes }}</h3>
  <div class="attribute-cloud">
    {% assign attribute_tags = site.tags | where: "tag_type", "attribute" | where: "lang", page.lang %}
    {% for tag in attribute_tags %}
      <a href="{{ tag.url | relative_url }}" class="tag attribute-tag">{{ tag.title }}</a>
    {% endfor %}
  </div>
  
  <h3>{{ site.data.translations[page.lang].tags.growth }}</h3>
  <div class="growth-cloud">
    {% assign growth_tags = site.tags | where: "tag_type", "growth" | where: "lang", page.lang %}
    {% for tag in growth_tags %}
      <a href="{{ tag.url | relative_url }}" class="tag growth-tag">{{ tag.title }}</a>
    {% endfor %}
  </div>
</div>
```

### Step 5: Update Tag Layout

Create or update `_layouts/tag.html`:

```html
---
layout: default
---
<div class="full-width-panel light-panel">
  <div class="panel-content">
    <div class="tag-header">
      <span class="tag-type">{{ site.data.translations[page.lang].tags[page.tag_type] }}</span>
      <h1>{{ page.title }}</h1>
      <p class="tag-description">{{ page.description }}</p>
    </div>
    
    <div class="tag-content">
      {{ content }}
    </div>
    
    <div class="tag-posts">
      <h2>{{ site.data.translations[page.lang].blog.related_content }}</h2>
      <div class="post-grid">
        {% assign posts = site.posts | where: "lang", page.lang %}
        {% for post in posts %}
          {% if post.tags contains page.tag %}
            <div class="post-card">
              <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
              <p class="post-meta">
                {% if page.lang == 'ru' %}
                  {{ post.date | date: "%-d %B %Y г. в %H:%M (+0800)" }}
                {% elsif page.lang == 'zh' %}
                  {{ post.date | date: "%Y年%-m月%-d日 %H:%M (+0800)" }}
                {% else %}
                  {{ post.date | date: "%B %-d, %Y at %H:%M (+0800)" }}
                {% endif %}
              </p>
              <p>{{ post.excerpt }}</p>
              <a href="{{ post.url | relative_url }}" class="read-more">{{ site.data.translations[page.lang].blog.read_more }}</a>
            </div>
          {% endif %}
        {% endfor %}
      </div>
    </div>
  </div>
</div>
```

### Step 6: Add Translation Content

Add tag-related translations to each language file:

**_data/translations/en.yml:**
```yaml
tags:
  sector: "Sector"
  attribute: "Brand Attribute"
  growth: "Growth Pathway"
  sectors: "Sectors"
  attributes: "Brand Attributes"
  growth: "Growth Pathways"
```

**_data/translations/ru.yml:**
```yaml
tags:
  sector: "Сектор"
  attribute: "Атрибут бренда"
  growth: "Путь роста"
  sectors: "Секторы"
  attributes: "Атрибуты бренда"
  growth: "Пути роста"
```

**_data/translations/zh.yml:**
```yaml
tags:
  sector: "行业"
  attribute: "品牌特性"
  growth: "增长途径"
  sectors: "行业"
  attributes: "品牌特性"
  growth: "增长途径"
```

### Step 7: Add CSS for Tags

Add or update `assets/css/components/tags.css`:

```css
/* ==========================================================================
   Tag Styling
   ========================================================================== */

/* Tag list styling */
.tag-list {
  margin: var(--space-4) 0;
}

.sector-tags,
.attribute-tags,
.growth-tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  margin-bottom: var(--space-2);
}

/* Individual tag styling */
.tag {
  display: inline-block;
  padding: var(--space-1) var(--space-2);
  border-radius: 4px;
  font-size: 0.875rem;
  line-height: 1.4;
  text-decoration: none;
  transition: all 0.2s ease;
}

.sector-tag {
  background-color: var(--primary-100);
  color: var(--primary-700);
  border: 1px solid var(--primary-200);
}

.sector-tag:hover {
  background-color: var(--primary-200);
  color: var(--primary-800);
}

.attribute-tag {
  background-color: var(--secondary-100);
  color: var(--secondary-700);
  border: 1px solid var(--secondary-200);
}

.attribute-tag:hover {
  background-color: var(--secondary-200);
  color: var(--secondary-800);
}

.growth-tag {
  background-color: var(--accent-100);
  color: var(--accent-700);
  border: 1px solid var(--accent-200);
}

.growth-tag:hover {
  background-color: var(--accent-200);
  color: var(--accent-800);
}

/* Tag cloud styling */
.tag-cloud {
  margin: var(--space-6) 0;
}

.tag-cloud h3 {
  margin-bottom: var(--space-2);
  font-size: 1.25rem;
}

.sector-cloud,
.attribute-cloud,
.growth-cloud {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  margin-bottom: var(--space-6);
}

/* Tag page styling */
.tag-header {
  margin-bottom: var(--space-8);
}

.tag-type {
  display: inline-block;
  padding: var(--space-1) var(--space-2);
  background-color: var(--neutral-200);
  color: var(--neutral-700);
  border-radius: 4px;
  font-size: 0.875rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: var(--space-2);
}

.tag-description {
  font-size: 1.125rem;
  color: var(--neutral-600);
  margin-bottom: var(--space-4);
  max-width: 40em;
}

.tag-posts h2 {
  margin-top: var(--space-8);
  margin-bottom: var(--space-4);
}

/* Badge integration preparation */
.tag.with-badge {
  padding-left: var(--space-6);
  position: relative;
}

.badge-icon {
  position: absolute;
  left: var(--space-1);
  top: 50%;
  transform: translateY(-50%);
  width: 16px;
  height: 16px;
  background-repeat: no-repeat;
  background-position: center;
  background-size: contain;
}
```

### Step 8: Update Default Layout

Ensure tag CSS is included in the `_layouts/default.html` file:

```html
<!-- Component styles -->
<link rel="stylesheet" href="{{ '/assets/css/components/buttons.css' | relative_url }}">
<!-- ...other component styles... -->
<link rel="stylesheet" href="{{ '/assets/css/components/tags.css' | relative_url }}">
<!-- ...continue with layout styles... -->
```

### Step 9: Implementation Workflow

1. **Create priority tag files first**:
   - Start with 3 sector tags, 3 attribute tags, and 2 growth tags for initial testing
   - Verify functionality before creating all tags

2. **Test with sample posts**:
   - Create sample posts with different tag combinations
   - Test tag display, filtering, and navigation

3. **Complete all tags**:
   - Systematically create remaining tag files for all languages
   - Maintain consistent tag identifiers across languages

4. **Badge Preparation**:
   - Add badge-related metadata to tag files
   - Create placeholder SVG icons for future badge integration

### Step 10: Future Badge Integration

To prepare for future badge integration, add these fields to tag files:

```yaml
---
title: "Founder-Led"
tag: founder-led
tag_type: attribute
badge_type: tier1
badge_icon: founder-led.svg
verification_required: true
permalink: /en/tags/attributes/founder-led/
---
```

These fields will be used when implementing the badge display system in the future.
