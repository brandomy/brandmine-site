# Journal Structure & Implementation Guide

This document provides comprehensive guidance for the Founders' Journal implementation, including layout structures, image organization, and technical implementation details.

## 📋 Layout Structures

### Journal Home Page Layout Structure

```
┌─────────────────────────────────────────────────────┐
│ 🏠 JOURNAL HOME PAGE (/en/journal/)                │
├─────────────────────────────────────────────────────┤
│ Breadcrumbs Section                                 │
│ panel--light, minimal padding                       │
├─────────────────────────────────────────────────────┤
│ Hero Section - SPLIT LAYOUT                         │
│ ┌─────────────────────┬─────────────────────────────┐│
│ │ Colored Background  │ 3:2 Hero Image             ││
│ │ with Radial Gradient│                             ││
│ │                     │                             ││
│ │ • "Founder's Journal"                             ││
│ │ • Subtitle text     │                             ││
│ │ • 6 color options   │                             ││
│ └─────────────────────┴─────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│ Featured Article Section (if featured post exists)  │
│ panel--light                                        │
│ ┌─────────────────────┬─────────────────────────────┐│
│ │ Article Image       │ Article Content             ││
│ │ 16:9 or 4:3        │ • Category badge            ││
│ │                     │ • Title                     ││
│ │                     │ • Excerpt                   ││
│ │                     │ • Meta (author, date)       ││
│ │                     │ • CTA button               ││
│ └─────────────────────┴─────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│ Latest Entries Section                              │
│ panel--light                                        │
│ ┌─────────────────────────────────────────────────────┐│
│ │ Grid Layout (responsive)                          ││
│ │ ┌─────────┐ ┌─────────┐ ┌─────────┐               ││
│ │ │ Entry   │ │ Entry   │ │ Entry   │               ││
│ │ │ Card    │ │ Card    │ │ Card    │               ││
│ │ │ • Image │ │ • Image │ │ • Image │               ││
│ │ │ • Title │ │ • Title │ │ • Title │               ││
│ │ │ • Meta  │ │ • Meta  │ │ • Meta  │               ││
│ │ │ • Tags  │ │ • Tags  │ │ • Tags  │               ││
│ │ └─────────┘ └─────────┘ └─────────┘               ││
│ │                                                   ││
│ │ [Load More Button] (JavaScript pagination)       ││
│ └─────────────────────────────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│ Author Profile Section                              │
│ panel--light (background: neutral-50)               │
│ Shows all team members in grid layout               │
│ ┌─────────────────────┬─────────────────────────────┐│
│ │ ┌─────────────────┐ │ ┌─────────────────────────┐ ││
│ │ │ Author Card     │ │ │ Author Card             │ ││
│ │ │ • Photo (teal)  │ │ │ • Photo (teal filter)   │ ││
│ │ │ • Name & Title  │ │ │ • Name & Title          │ ││
│ │ │ • Bio excerpt   │ │ │ • Bio excerpt           │ ││
│ │ │ • LinkedIn      │ │ │ • LinkedIn              │ ││
│ │ └─────────────────┘ │ └─────────────────────────┘ ││
│ └─────────────────────┴─────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│ Contact CTA Section                                 │
│ panel--primary (teal gradient background)           │
│ Newsletter signup + contact information             │
└─────────────────────────────────────────────────────┘
```

### Individual Blog Post Layout Structure

```
┌─────────────────────────────────────────────────────┐
│ 📝 INDIVIDUAL POST (/journal/2025/05/30/title/)    │
├─────────────────────────────────────────────────────┤
│ Breadcrumbs Section                                 │
│ panel--light, minimal padding                       │
├─────────────────────────────────────────────────────┤
│ Hero Section - FULL WIDTH IMAGE                     │
│ ┌─────────────────────────────────────────────────────┐│
│ │ Featured Image Background + Dark Overlay          ││
│ │                                                   ││
│ │           ┌─────────────────────┐                 ││
│ │           │ • Post Title        │                 ││
│ │           │ • Author & Date     │                 ││
│ │           │ • Reading Time      │                 ││
│ │           │ • Tag Pills         │                 ││
│ │           └─────────────────────┘                 ││
│ └─────────────────────────────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│ Content Section                                     │
│ panel--light, narrower width (65ch optimal reading) │
│ ┌─────────────────────────────────────────────────────┐│
│ │ Article Content                                   ││
│ │ • Enhanced typography                             ││
│ │ • Blockquotes with custom styling                ││
│ │ • Code blocks                                     ││
│ │ • Inline images                                   ││
│ │ • Links with underline styling                   ││
│ │ • Proper heading hierarchy                       ││
│ └─────────────────────────────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│ Author Profile Section                              │
│ panel--light (background: neutral-50)               │
│ Single author detailed profile                      │
│ ┌─────────────────────┬─────────────────────────────┐│
│ │ Author Photo        │ Author Information          ││
│ │ (120px, teal filter)│ • Name & Position           ││
│ │                     │ • Detailed bio              ││
│ │                     │ • Key highlights (list)     ││
│ │                     │ • LinkedIn + social         ││
│ └─────────────────────┴─────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│ Social Sharing Section                              │
│ panel--light                                        │
│ Share buttons: LinkedIn, Twitter, Facebook, Email   │
├─────────────────────────────────────────────────────┤
│ Tag Cloud Section                                   │
│ panel--light                                        │
│ All tags for this post as clickable pills           │
├─────────────────────────────────────────────────────┤
│ Related Posts Section                               │
│ panel--light                                        │
│ Grid of 2-3 related journal entries (entry cards)   │
└─────────────────────────────────────────────────────┘
```

## 🎨 Hero Section Implementation

### Split Hero Layout Features

**Desktop Layout**: 50/50 split with colored gradient + image
**Mobile Layout**: Stacked with image below text
**Responsive Breakpoints**: 768px for layout change

### 6 Color Scheme Options

```scss
// Available color schemes for hero background
.journal-hero--teal     // Primary brand (default)
.journal-hero--blue     // Deep blue alternative  
.journal-hero--orange   // Warm orange (secondary colors)
.journal-hero--purple   // Rich purple (accent colors)
.journal-hero--green    // Forest green
.journal-hero--slate    // Neutral gray
```

### Usage in Templates

```liquid
{% include pages/journal/hero.html
   color_scheme="blue"
   hero_image="/assets/images/journal/hero-brandmine.jpg"
   hero_alt="Brandmine team collaboration"
%}
```

### CSS Implementation

```scss
.journal-hero {
  display: grid;
  
  // Mobile: stacked layout
  grid-template-columns: 1fr;
  grid-template-rows: auto auto;
  
  // Desktop: side-by-side layout
  @media (min-width: 768px) {
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr;
  }
}

// Radial gradient positioning
.journal-hero--teal .journal-hero__content {
  background: radial-gradient(circle at 30% 40%, var(--primary-400) 0%, var(--primary-600) 100%);
}
```

## 🖼️ Image Organization Strategy

### Directory Structure

```
assets/images/journal/
├── YYYY-MM-DD-post-slug/
│   ├── originals/                    # Source files (not processed)
│   │   ├── hero.jpg                 # 1200×800 source image
│   │   ├── social.jpg               # 1200×630 social share image
│   │   ├── diagram-architecture.jpg # Supporting images
│   │   └── screenshot-interface.jpg
│   ├── hero-400w.jpg               # Responsive sizes (auto-generated)
│   ├── hero-800w.jpg
│   ├── hero-1200w.jpg
│   ├── hero-1600w.jpg
│   ├── social-1200w.jpg            # Social sharing image
│   ├── diagram-architecture-400w.jpg
│   ├── diagram-architecture-800w.jpg
│   └── screenshot-interface-800w.jpg
```

### Image Processing

```bash
# For individual posts
./scripts/process_images.sh journal maplibre-journey
./scripts/process_images.sh journal russian-market-insights  
./scripts/process_images.sh journal china-brand-storytelling

# For journal home page
./scripts/process_images.sh journal journal-home

# General pattern
./scripts/process_images.sh journal [identifier]
```

### Image Requirements

#### **Hero Images:**
- **Aspect Ratio**: 3:2 (1200×800px base)
- **Style**: Textured Minimalism (TM) following Brandmine guidelines
- **Size Target**: 200-300KB
- **Content**: Abstract concepts, no embedded text
- **Optimization**: Multiple responsive sizes generated automatically

#### **Social Images:**
- **Aspect Ratio**: 1.91:1 (1200×630px)
- **Size Target**: 200-250KB
- **Content**: Include Brandmine branding elements
- **Usage**: Optimal for LinkedIn, Twitter, Facebook sharing

#### **Supporting Images:**
- **Variable sizes** based on content needs
- **High contrast** for readability (especially screenshots)
- **Clean backgrounds** for technical screenshots
- **Consistent style** within each article

### Image Style Guidelines

1. **Hero Images**: Use **Textured Minimalism (TM)** style
   - Rich muted colors, subtle textures, no embedded text
   - 3:2 aspect ratio (1200×800px base)
   - Target file size: 200-300KB

2. **Inline Images**: Technical screenshots, clean diagrams, data visualizations
   - High contrast for readability
   - Clean backgrounds, no desktop clutter
   - Various sizes based on content needs

3. **Social Images**: 1200×630 format for optimal social sharing
   - 1.91:1 aspect ratio
   - Include branding elements
   - Target file size: 200-250KB

4. **Author Photos**: Use existing team photos with teal filter
   - Located in `/people/team/`
   - Circular crop, 120px for single author, 80px for grid

### File Naming Conventions

#### **Standard Post Images:**
```
assets/images/journal/YYYY-MM-DD-article-slug/
├── originals/
│   ├── hero.jpg              # Main featured image (1200×800)
│   ├── social.jpg            # Social sharing (1200×630) 
│   ├── diagram-name.jpg      # Supporting diagrams
│   └── screenshot-name.jpg   # Technical screenshots
├── hero-400w.jpg            # Auto-generated responsive sizes
├── hero-800w.jpg
├── hero-1200w.jpg
├── hero-1600w.jpg
└── social-1200w.jpg
```

#### **Journal Home Page Images:**
```
assets/images/journal/journal-home/
├── originals/
│   └── hero.jpg             # Source image for journal landing
├── hero-400w.jpg           # Auto-generated responsive sizes
├── hero-800w.jpg
├── hero-1200w.jpg
└── hero-1600w.jpg
```

#### **Base Image Names:**
- **Hero images**: `hero.jpg` (consistent across all posts and pages)
- **Social images**: `social.jpg` (for social media sharing)
- **Supporting content**: Descriptive names
  - `diagram-architecture.jpg`
  - `screenshot-interface.jpg` 
  - `chart-performance.jpg`
  - `process-workflow.jpg`

#### **Processed File Names:**
- **Pattern**: `[base-name]-[width]w.jpg`
- **Examples**: 
  - `hero-400w.jpg` (400px width)
  - `hero-800w.jpg` (800px width)
  - `hero-1200w.jpg` (1200px width)
  - `hero-1600w.jpg` (1600px width)

## 📄 Pagination Implementation

### Current Approach: JavaScript Pagination

**Why This Approach**:
- **Multilingual Compatibility**: Works with language-specific post collections
- **Flexibility**: Can filter and sort posts dynamically
- **Performance**: Client-side rendering with progressive loading

**Technical Implementation**:
```javascript
// Client-side pagination - works with multilingual structure
// Shows 12 posts initially, "Load More" button for additional posts  
// Filters by current language automatically
```

**Alternative**: Jekyll's built-in pagination has limitations:
- Only works with single language
- Requires posts at site root level
- One global `paginate_path` setting

**Recommendation**: Keep JavaScript approach for flexibility.

## 🏷️ Post Reference (ref) Strategy

### Recommended Approach: Semantic Refs

```yaml
# GOOD - Semantic and clean
ref: maplibre-journey        # Links to all language versions
ref: china-brand-storytelling # Descriptive and memorable  
ref: russian-market-insights  # Clear content identification

# LESS GOOD - Date-based
ref: 2025-05-30-maplibre-journey  # Harder to remember, date-centric
```

**Benefits of Semantic Refs**:
1. **Language Switching**: `/en/journal/maplibre-journey` → `/zh/journal/maplibre-journey`
2. **SEO Friendly**: Better URL structure for search engines
3. **Human Readable**: Easier to remember and reference
4. **Content Focused**: Emphasizes topic over date

## 🏗️ Technical Architecture

### Linear Panel System

**Key Principles**:
- **No Sidebars**: Pure linear flow for mobile-first design
- **Panel Wrapping**: Every section uses consistent panel system
- **Responsive Spacing**: Automatic spacing via panel system

### CSS Organization

```scss
// Journal-specific styles in organized structure
assets/css/pages/journal/
├── _index.scss              # Main import file
├── _journal-page.scss       # Landing page structure
├── _post-page.scss         # Individual post structure  
├── _hero.scss              # Split hero implementation
├── _featured-article.scss  # Featured article component
├── _entry-card.scss        # Post card component
├── _author-profile.scss    # Author profile component
├── _content.scss           # Typography and content styling
└── [other components]
```

### Responsive Design

**Breakpoints** (following Brandmine standards):
- `480px` - Small devices
- `768px` - Medium devices (tablets) 
- `992px` - Large devices (desktops)

**Grid Behavior**:
```scss
.journal-entries-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  
  @media (min-width: 768px) {
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  }
}
```

## 🔧 Implementation Checklist

### New Post Creation

1. **Create Markdown File**: `_posts/YYYY-MM-DD-title.md`
2. **Front Matter Setup**:
   ```yaml
   layout: post
   title: "Post Title"
   date: YYYY-MM-DD
   author: author_id
   excerpt: "Brief description"
   tags: [tag1, tag2, tag3]
   image: /assets/images/journal/YYYY-MM-DD-slug/hero.jpg
   image_caption: "Descriptive alt text for accessibility"
   lang: en
   reading_time: 5
   featured: false
   ref: semantic-slug
   color_scheme: teal  # or blue, orange, purple, green, slate, coral, sage
   sections:
     - breadcrumbs
     - hero
     - content
     - author-profile
     - social-sharing
     - tag-cloud
     - related-posts
   ```
3. **Create Image Directory**: `assets/images/journal/YYYY-MM-DD-slug/originals/`
4. **Add Source Images**: Place `hero.jpg` (and others) in `originals/` folder
5. **Process Images**: `./scripts/process_images.sh journal YYYY-MM-DD-slug`
6. **Add Image Attributions**: Update `_data/image_attributions.yml`

### Journal Home Page Images

1. **Directory**: `assets/images/journal/journal-home/originals/`
2. **Source Image**: `hero.jpg` (1200×800px, TM style)
3. **Process**: `./scripts/process_images.sh journal journal-home`
4. **Configure**: Update page front matter with `hero_image` path

### Multilingual Posts

Create language versions with same `ref` field:
```yaml
# English version
ref: china-brand-storytelling
lang: en

# Chinese version  
ref: china-brand-storytelling
lang: zh
```

### Color Scheme Selection

Choose from available options in hero include or post front matter:
```liquid
{% include pages/journal/hero.html color_scheme="purple" %}
```

```yaml
# In post front matter
color_scheme: blue  # Available: teal, blue, orange, purple, green, slate, coral, sage
```

### Color Scheme Guidelines

- **Teal**: Default Brandmine content, company updates
- **Blue**: Technical implementation, tools, development  
- **Orange**: Cultural insights, strategy, cross-cultural content
- **Purple**: Premium editorial, thought leadership
- **Green**: Market research, data analysis, regional insights
- **Slate**: Formal business content, methodologies
- **Coral**: Warm content, community-focused
- **Sage**: Natural/organic content, sustainability

## 🎯 Best Practices

### Content Guidelines

1. **Optimal Reading**: 65ch line length for article content
2. **Typography Hierarchy**: Use proper heading levels (H2, H3, H4)
3. **Link Styling**: Underlined links with brand colors
4. **Image Captions**: Always include descriptive alt text

### Performance Optimization

1. **Image Sizes**: Multiple responsive sizes with `sizes` attribute
2. **Lazy Loading**: Except for hero images (`loading="eager"`)
3. **File Optimization**: Target specific file sizes per image type
4. **CSS Efficiency**: BEM naming with modular SCSS

### Accessibility

1. **Semantic HTML**: Proper section structure with ARIA labels
2. **Focus States**: Keyboard navigation support
3. **Color Contrast**: Meet WCAG guidelines
4. **Screen Readers**: Descriptive alt text and headings

This guide provides comprehensive reference for implementing and maintaining the Founders' Journal within Brandmine's design system and technical architecture.