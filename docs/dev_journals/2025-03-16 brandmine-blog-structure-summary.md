# 2025-03-17 Development Journal: Blog Categories and Tag System Implementation for Brandmine

## 1. Problem Statement

We needed to design and implement an effective organizational structure for the Brandmine blog that would:

- Support the MVP launch with limited resources (founder-led content creation)
- Create a logical content taxonomy aligned with our business strategy
- Focus initially on Russian brands across specific sectors with growth potential
- Establish a scalable foundation that could grow as content expands
- Balance comprehensive coverage with practical implementation constraints
- Support customer discovery goals by revealing user interests through engagement
- Provide clear navigation paths for international partners seeking BRICS+ brand opportunities

Our specific challenge was determining the optimal blog categories and tag system that would work within our MVP constraints while still effectively demonstrating Brandmine's value proposition.

## 2. Approach

After evaluating multiple options, we developed a two-tiered organizational strategy:

### 2.1 Value-Focused Blog Categories

We selected four value-focused categories that communicate what Brandmine offers rather than just what it covers:

1. **Brand Discoveries** - Introducing noteworthy BRICS+ brands with unique stories
2. **Export Opportunities** - Practical insights on brands ready for international expansion
3. **Cultural Context** - Understanding the cultural factors that shape BRICS+ consumer brands
4. **Success Stories** - Case studies of BRICS+ brands that have successfully expanded globally

This approach was chosen because it:
- Requires minimal initial content (one post per category to start)
- Directly showcases Brandmine's value proposition
- Creates a coherent narrative even with limited content
- Adapts well to both current Russian focus and future country expansion
- Supports customer discovery by highlighting different value dimensions

### 2.2 Two-Dimensional Tag System

To complement the value-focused categories, we designed a two-dimensional tag system:

1. **Sector Tags** - 15 specific product sectors, with 5 prioritized for initial content
   - Wine
   - Natural Beauty Products
   - Jewelry & Watches
   - Artisanal Spirits & Vodka
   - Honey & Bee Products

2. **Business Attribute Tags** - Key qualities that make brands export-worthy
   - Export-Ready
   - Premium Positioning
   - Regional Heritage
   - Design Excellence
   - Authentic Craftsmanship

This tag system was selected because it:
- Creates a cross-cutting taxonomy that complements the value categories
- Directly aligns with our focus on Russian brands in specific sectors
- Highlights business intelligence dimensions that matter to our audience
- Allows both sector-specific and attribute-specific content discovery
- Establishes a framework that can expand to new countries over time

## 3. Implementation Details

### 3.1 Blog Category Implementation

The blog categories will be implemented through Jekyll's built-in category system:

1. **Category Layout** in `_layouts/category.html`:

```html
---
layout: default
---
<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h1>{{ page.title }}</h1>
    <div class="category-description">
      {{ content }}
    </div>
    
    <div class="post-grid">
      {% for post in site.categories[page.category] %}
        <div class="post-card">
          <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
          <p class="post-meta">{{ post.date | date: "%B %-d, %Y" }}</p>
          <p>{{ post.excerpt }}</p>
          <a href="{{ post.url | relative_url }}" class="read-more">Read more</a>
        </div>
      {% endfor %}
    </div>
  </div>
</div>
```

2. **Category Page Example** for `blog/categories/en/brand-discoveries.md`:

```markdown
---
layout: category
title: Brand Discoveries
category: brand-discoveries
permalink: /en/blog/categories/brand-discoveries/
lang: en
---
Introducing noteworthy BRICS+ brands with unique stories, innovative products, and distinctive market positions. Discover the hidden gems of emerging markets.
```

3. **Post Front Matter Example**:

```yaml
---
layout: post
title: "Russian Craft Vodka Renaissance: 5 Brands Redefining a Traditional Spirit"
author: Founder Name
date: 2025-03-16
categories: [brand-discoveries]
tags: [artisanal-spirits-vodka, premium-positioning, regional-heritage]
lang: en
excerpt: "Discover how small-batch Russian distilleries are transforming vodka from commodity to craft."
---
```

### 3.2 Tag System Implementation

The tag system will be implemented through a custom Jekyll collection:

1. **Directory Structure**:

```
_tags/
├── sectors/
│   ├── wine.md
│   ├── natural-beauty-products.md
│   ├── jewelry-watches.md
│   ├── artisanal-spirits-vodka.md
│   └── honey-bee-products.md
└── attributes/
    ├── export-ready.md
    ├── premium-positioning.md
    ├── regional-heritage.md
    ├── design-excellence.md
    └── authentic-craftsmanship.md
```

2. **Tag Collection Configuration** in `_config.yml`:

```yaml
collections:
  tags:
    output: true
    permalink: /tags/:path/
```

3. **Sector Tag Example** for `_tags/sectors/wine.md`:

```yaml
---
layout: tag
title: "Wine"
tag: wine
tag_type: sector
description: "Russian wineries producing quality wines with unique characteristics from regions like Krasnodar and Crimea."
permalink: /tags/sectors/wine/
---
Russia's wine industry has seen remarkable growth in quality and recognition, particularly in southern regions with favorable climates. Modern wineries are combining international expertise with local grape varieties and terroir to create distinctive wines gaining attention in global markets.
```

4. **Business Attribute Tag Example** for `_tags/attributes/export-ready.md`:

```yaml
---
layout: tag
title: "Export-Ready"
tag: export-ready
tag_type: attribute
description: "Brands with products, packaging, and certifications prepared for international markets."
permalink: /tags/attributes/export-ready/
---
Export-ready brands have addressed key requirements for international market entry, including appropriate packaging, required certifications, English/multilingual materials, and logistics preparations.
```

5. **Tag List Display** in `_includes/tags/tag-list.html`:

```html
<div class="tag-list">
  {% if include.tags %}
    {% assign sector_tags = "" | split: "" %}
    {% assign attribute_tags = "" | split: "" %}
    
    {% for tag in include.tags %}
      {% assign tag_path = tag | slugify %}
      {% if site.tags.sectors[tag_path] %}
        {% assign sector_tags = sector_tags | push: tag %}
      {% else %}
        {% assign attribute_tags = attribute_tags | push: tag %}
      {% endif %}
    {% endfor %}
    
    {% if sector_tags.size > 0 %}
      <div class="sector-tags">
        {% for tag in sector_tags %}
          <a href="{{ site.baseurl }}/tags/sectors/{{ tag | slugify }}/" class="tag sector-tag">{{ tag | replace: '-', ' ' | capitalize }}</a>
        {% endfor %}
      </div>
    {% endif %}
    
    {% if attribute_tags.size > 0 %}
      <div class="attribute-tags">
        {% for tag in attribute_tags %}
          <a href="{{ site.baseurl }}/tags/attributes/{{ tag | slugify }}/" class="tag attribute-tag">{{ tag | replace: '-', ' ' | capitalize }}</a>
        {% endfor %}
      </div>
    {% endif %}
  {% endif %}
</div>
```

6. **Tag CSS Styling** in `assets/css/components/tags.css`:

```css
/* Tag list styling */
.tag-list {
  margin: var(--space-4) 0;
}

.sector-tags,
.attribute-tags {
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
```

## 4. Decisions Made

### 4.1 Categories vs. Tags vs. Collections

**Decision**: Implement a dual system with value-focused categories and sectoral/attribute tags

**Rationale**: 
- Categories provide high-level organization aligned with Brandmine's value proposition
- Tags provide flexible, multi-dimensional filtering without rigid hierarchies
- This hybrid approach offers the best of both systems while maintaining simplicity
- Jekyll's built-in categories + custom collections for tags gives us implementation flexibility

### 4.2 Value-Focused vs. Sector-Focused Categories

**Decision**: Use value-focused categories rather than sector or geography categories

**Rationale**:
- Directly communicates Brandmine's unique value proposition
- Works well with limited initial content (just 1 post per category to start)
- Creates a coherent user experience even in MVP stage
- Provides clear differentiation from typical directories or marketplaces
- Supports future expansion to any combination of sectors and countries

### 4.3 Tag Prioritization Strategy

**Decision**: Prioritize 5 sectors + 5 business attributes from the broader set of 15 sectors

**Rationale**:
- Focuses resources on sectors with strongest export stories
- Creates a balanced mix of beverage, beauty, adornment, and food categories
- Selected sectors with visual appeal for engaging content
- Chosen attributes highlight key business intelligence dimensions
- Starts with a manageable implementation that can expand organically

### 4.4 Priority Sector Selection

**Decision**: Focus on Wine, Natural Beauty Products, Jewelry & Watches, Artisanal Spirits, and Honey & Bee Products

**Rationale**:
- **Wine**: Strong growth in quality and international recognition; rich regional stories
- **Natural Beauty**: Unique botanical ingredients; growing global category; visual appeal
- **Jewelry/Watches**: Showcases craftsmanship and design; premium positioning; non-perishable
- **Artisanal Spirits**: Built on vodka heritage; craft movement creating distinctive products
- **Honey & Bee Products**: Distinctive regional varieties; lower regulatory barriers; health narrative

### 4.5 Content Development Strategy

**Decision**: Start with one post per category, applying 2-3 relevant tags to each post

**Rationale**:
- Creates minimal viable content to demonstrate the organizational system
- Ensures every business attribute tag is used at least once across posts
- Enables quick launch while establishing foundation for expansion
- Makes content planning straightforward with clear focus points
- Supports learning which content types resonate before scaling production

## 5. Resources

### 5.1 Sector Tag Descriptions

| Sector | Description |
|--------|-------------|
| Wine | Russian wineries producing quality wines with unique characteristics from regions like Krasnodar and Crimea. |
| Natural Beauty Products | Russian beauty brands leveraging Siberian and Far Eastern botanical ingredients with natural formulations and distinctive positioning. |
| Jewelry & Watches | Russian jewelry and watch brands showcasing distinctive design, gemstone expertise, and precision craftsmanship. |
| Artisanal Spirits & Vodka | Craft distilleries producing premium vodka and other spirits with distinctive character and authentic production methods. |
| Honey & Bee Products | Russian apiaries producing distinctive honey varieties and specialized bee products from diverse regional ecosystems. |

### 5.2 Business Attribute Tag Criteria

| Attribute | Application Criteria |
|-----------|----------------------|
| Export-Ready | - Has appropriate certifications for target markets<br>- Offers multilingual materials<br>- Meets international quality standards<br>- Has resolved logistics for shipping<br>- Understands export documentation requirements |
| Premium Positioning | - Targets upper-tier market segments<br>- Uses superior ingredients/materials<br>- Features distinctive packaging<br>- Emphasizes craftsmanship<br>- Commands price premium vs. category average |
| Regional Heritage | - Uses region-specific ingredients<br>- Employs traditional regional methods<br>- Incorporates regional cultural elements<br>- Communicates geographic origins<br>- Embodies authentic connection to place |
| Design Excellence | - Features distinctive product design<br>- Shows cohesive visual identity<br>- Demonstrates packaging detail attention<br>- Balances cultural and contemporary elements<br>- Communicates values through visuals |
| Authentic Craftsmanship | - Employs skilled artisans<br>- Uses traditional techniques<br>- Features hand-crafted processes<br>- Communicates production methods<br>- Emphasizes human expertise |

### 5.3 Strategic Tag Combinations

| Content Focus | Primary Category | Sector Tag | Business Attribute Tags |
|---------------|------------------|------------|-------------------------|
| Krasnodar Wines | Brand Discoveries | Wine | Premium Positioning, Regional Heritage |
| Siberian Skincare | Brand Discoveries | Natural Beauty Products | Export-Ready, Authentic Craftsmanship |
| Russian Jewelry Design | Brand Discoveries | Jewelry & Watches | Design Excellence, Premium Positioning |
| Craft Vodka Distilleries | Brand Discoveries | Artisanal Spirits & Vodka | Regional Heritage, Authentic Craftsmanship |
| Altai Mountain Honey | Brand Discoveries | Honey & Bee Products | Export-Ready, Regional Heritage |

### 5.4 Implementation Files Created

- Complete blog category implementation guidance
- Tag system implementation guide
- Tag prioritization strategy
- CSS styling for tags
- Sample post structure with tags
- Example front matter for posts

## 6. Insights & Learning

### 6.1 Blog Structure Best Practices

- **Value-Based Organization**: Structuring content around value propositions rather than just topics creates stronger connection to business goals
- **Start Small, Scale Thoughtfully**: Begin with a minimal viable taxonomy that can expand as content grows
- **Multiple Navigation Dimensions**: Giving users different ways to explore content (by value, sector, attribute) increases discovery opportunities
- **Content Before Technology**: Choose a technical implementation that serves content strategy, not vice versa
- **MVP Content Planning**: Focus on creating a few excellent, representative pieces rather than attempting comprehensive coverage

### 6.2 Jekyll-Specific Techniques

- **Categories vs. Collections**: Jekyll's built-in categories work well for primary organization, while custom collections provide flexibility for tags
- **Liquid Template Logic**: Using Liquid conditionals allows sophisticated rendering of tags by type
- **Front Matter Organization**: Structured front matter with categories and tags enables complex content relationships
- **Directory Structure Impact**: Jekyll's directory structure impacts URL generation and content organization
- **Multilingual Considerations**: Jekyll can support language-specific content organization with proper setup

### 6.3 Content Strategy Integration

- **Strategic Taxonomy**: Content organization should directly support business objectives and user needs
- **Cross-Dimensional Relationships**: Creating relationships between categories, sectors, and attributes increases content value
- **Discovery Optimization**: Good taxonomy improves both initial discovery and follow-on exploration
- **Balancing Coverage and Depth**: Focusing on selected areas allows deeper content and stronger positioning
- **Analytics-Driven Refinement**: Tracking category and tag usage will reveal user interests for future content planning

### 6.4 Implementation Considerations

- **CSS Styling by Tag Type**: Different visual treatments for sector vs. attribute tags improves user understanding
- **Responsive Tag Displays**: Tag displays must work on mobile through responsive design
- **Including Tag Descriptions**: Tag landing pages benefit from descriptions that explain their meaning and value
- **Related Content Discovery**: Using tags to suggest related content improves session depth
- **Visual Consistency**: Maintaining consistent styling between category and tag displays creates cohesive experience

## 7. Next Actions

### 7.1 Technical Implementation

- [ ] Create the directory structure for categories and tags
- [ ] Implement the category layout and pages
- [ ] Create the tag collection and initial tag files
- [ ] Add CSS styling for both categories and tags
- [ ] Implement the tag list and tag cloud components
- [ ] Add tag-based related content suggestions to post template

### 7.2 Content Development

- [ ] Create the first "Brand Discoveries" post focusing on wine sector
- [ ] Apply relevant business attribute tags (premium-positioning, regional-heritage)
- [ ] Create placeholder pages for remaining priority sectors
- [ ] Develop a content calendar for the next four posts (one per category)
- [ ] Set up analytics tracking for category and tag usage

### 7.3 Documentation and Guidelines

- [ ] Document the tag application criteria for consistent usage
- [ ] Create an internal reference guide for content categorization
- [ ] Establish basic SEO guidelines for categories and tags
- [ ] Set up a tracking system for measuring tag effectiveness

### 7.4 Open Questions for Future Consideration

- How will this system adapt as we expand to other BRICS countries?
- Should we consider seasonal or trending tags in the future?
- What tag faceting or filtering UI would best serve users as content grows?
- How might we use tag data to inform product development?
- What additional analytics should we set up to track tag effectiveness?

This development journal documents our comprehensive approach to designing and implementing Brandmine's blog structure with value-focused categories and a sector/attribute tag system. It provides both the strategic rationale and technical details needed for implementation, while establishing a foundation that can grow with the business.
