# Brandmine Insight Article Creation Cheat Sheet

*Last updated: May 2, 2025*

## 1. Choose Insight Category

### Four Standard Categories:
- **Brand Spotlight**: In-depth profiles of noteworthy BRICS+ brands
- **Founder's Journey**: Personal stories behind the brands
- **Market Momentum**: Achievements, milestones, expansion moments
- **Location Intelligence**: Geographical insights and regional context

## 2. Create File Structure

### Option A: Using Generate Script (Recommended)
```bash
python3 _scripts/generate_article_template.py
```

Follow the prompts to:
- Select category
- Enter article slug
- Enter titles in all languages

The script will create files in all three language directories.

### Option B: Manual Creation

#### English Version (Required)
1. Create new file: `_insights/en/[market_code]/[article-slug].md`
   - Example: `_insights/en/ru/russian-tea-revival.md`
2. Fill in front matter and content

#### Russian Version (Optional)
1. Create new file: `_insights/ru/[market_code]/[article-slug].md`
2. Translate content
3. Update `lang: ru` in front matter

#### Chinese Version (Optional)
1. Create new file: `_insights/zh/[market_code]/[article-slug].md`
2. Translate content
3. Update `lang: zh` in front matter

## 3. Required Front Matter Fields

```yaml
---
layout: insight
title: "Insight Article Title"
date: YYYY-MM-DD
author: "Author Name"
show_author: false  # Toggle author display
show_date: true     # Toggle date display
category: "Brand Spotlight"  # Must be one of the four categories
excerpt: "Brief article summary (1-2 sentences). Use actual text from article."
lang: en
permalink: /en/insights/ru/article-slug/  # Hardcoded with market code
ref: article-slug  # For language switcher
reading_time: 5  # Minutes to read

# Images
images:
  hero: "/assets/images/insights/ru/article-slug/hero-article.jpg"
  logo: "/assets/images/insights/ru/article-slug/logo-brand.png"  # Optional
  founder: "/assets/images/insights/ru/article-slug/founder-portrait.jpg"  # Optional

# Taxonomy Connections (use kebab-case dimension slugs)
sectors: [wine, gourmet-foods]
markets: [russia, china]
attributes: [founder-led, heritage-brand]
signals: [export-ready]

# Brand References (with market codes)
brands: 
  - market: ru
    brand: teatime
  - market: cn
    brand: dragonfly

# Display Options
featured: false
premium: false
---
```

## 4. Prepare & Process Images

### Create Image Directory
```bash
mkdir -p assets/images/insights/[market_code]/[article-slug]/originals
```

### Prepare Required Images
1. **Hero Image**: 1200×800px JPG
   - Name: `hero-article.jpg`
2. **Logo** (optional): 400×400px PNG with transparency
   - Name: `logo-brand.png`
3. **Founder Portrait** (optional): 800×1200px JPG
   - Name: `founder-portrait.jpg`
4. **Additional Images** (optional): 1200×800px JPG
   - Name: `gallery-image-name.jpg`

### Process Images
```bash
./_scripts/process_site_images.sh insights
```

## 5. Article Structure

### Standard Format
```markdown
# Article Title

Introduction paragraph establishing the topic and hooking the reader.

## First Heading

Content focusing on the first major point or section.

![Image caption]({{ "/assets/images/insights/ru/article-slug/gallery-image-name.jpg" | relative_url }})

## Second Heading

Content focusing on the second major point or section.

### Subheading (if needed)

Additional detail or subdivision of the second point.

## Third Heading

Content focusing on the third major point or section.

## Conclusion

Wrap-up paragraph that summarizes key takeaways.
```

### Category-Specific Guidelines

**Brand Spotlight**:
- Include brand's founding story
- Highlight key product/service offerings
- Discuss market positioning and differentiation
- Feature quotes from leadership (if available)

**Founder's Journey**:
- Focus on personal narrative
- Include challenges and pivotal moments
- Discuss vision and philosophy
- Highlight leadership approach

**Market Momentum**:
- Feature specific milestone or achievement
- Include context and market significance
- Discuss growth strategy
- Reference industry trends

**Location Intelligence**:
- Focus on geographic context
- Include regional business factors
- Discuss location advantages/challenges
- Reference related brands in the region

## 6. Content Guidelines

- **Length**: 800-1500 words
- **Tone**: Professional but approachable, editorial style
- **Quotes**: Include 2-3 quotes when possible
- **Links**: Include links to featured brands
- **Headers**: Use H2 (`##`) for main sections, H3 (`###`) for subsections
- **Lists**: Use bulleted or numbered lists for key points
- **Images**: Include at least one image (hero)
- **Focus**: Maintain clear focus on the specific category theme

## 7. Testing

1. Start local server: `bundle exec jekyll serve`
2. Visit insight page: `http://localhost:4000/en/insights/ru/article-slug/`
3. Check for:
   - Hero image loading correctly
   - Proper category display
   - All front matter rendering appropriately
   - Author and date appearing based on show_author/show_date settings
   - No build errors

## 8. Example Quick Workflow

1. Run generation script:
   ```bash
   python3 _scripts/generate_article_template.py
   ```
   - Select category: "Brand Spotlight"
   - Enter slug: "russian-tea-revival" 
   - Enter title: "The Russian Tea Revival"

2. Enhance the generated front matter:
   ```yaml
   ---
   layout: insight
   title: "The Russian Tea Revival"
   date: 2025-05-02
   author: "Randal Eastman"
   show_author: true
   show_date: true
   category: "Brand Spotlight"
   excerpt: "Moscow's TeaTime brand is leading a revival of traditional Russian tea culture with contemporary innovations."
   lang: en
   permalink: /en/insights/ru/russian-tea-revival/
   ref: russian-tea-revival
   reading_time: 5
   
   images:
     hero: "/assets/images/insights/ru/russian-tea-revival/hero-teatime.jpg"
     logo: "/assets/images/insights/ru/russian-tea-revival/logo-teatime.png"
     founder: "/assets/images/insights/ru/russian-tea-revival/founder-alexei.jpg"
   
   sectors: [gourmet-foods]
   markets: [russia]
   attributes: [founder-led, heritage-brand]
   signals: [export-ready]
   
   brands:
     - market: ru
       brand: teatime
   
   featured: true
   premium: false
   ---
   ```

3. Add content with Brand Spotlight structure
4. Process images
5. Test insight page