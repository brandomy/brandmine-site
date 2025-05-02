# Brandmine Image Style Guide

*Last updated: May 2, 2025*

This document defines the visual language for imagery across the Brandmine platform. It establishes clear visual differentiation between content types while maintaining overall brand consistency.

## Core Principles

1. **No Text in Images**: All text remains in HTML for accessibility, translation support, and responsive design
2. **Responsive Sizing**: All images are processed through our automated sizing system delivering 400w, 800w, and 1200w versions
3. **Strategic Style Differentiation**: Different content types use distinct visual styles to create clear information hierarchy
4. **Standard Aspect Ratios**: 3:2 horizontal (1200×800px) for most content, 2:3 vertical (800×1200px) for portraits
5. **Stylized Over Raw**: Most imagery uses our established visual styles, with exceptions for team/testimonial photos

## Visual Style Framework

We employ four distinct visual styles across the platform, each serving a specific purpose:

## 1. Textured Minimalism

Our primary visual style for narrative-rich content, creating a sophisticated, editorial aesthetic.

### Characteristics

- Subtle paper or fabric textures with gentle shadows
- Clean lines and simplified, abstracted forms
- Limited color palette (4-5 colors) with thoughtful contrast
- Intentional negative space with balanced composition
- Rich in visual detail while maintaining minimalist principles

### Variations

1. **Standard Textured Minimalism**
   - Used for hero images and primary visual content
   - Stronger contrast and more saturated colors
   - More pronounced textures and shadows

2. **Muted Pastel Textured Minimalism**
   - Used for interior/secondary content within articles and profiles
   - Lighter, more pastel color palette
   - Subtler textures and shadows
   - Creates visual hierarchy within a page

### Applications

| Content Type | Primary Colors | Example Locations |
|--------------|----------------|-------------------|
| Brand Hero Images | Brand palette with accents | Brand profile pages |
| Founder Portraits (Muted) | Warm neutrals with brand accent | Founder sections |
| Insight Article Headers | Varies by insight category | Insight detail pages |
| Market-Specific Sectors | Market-specific palette | Market sector pages |

**Input vs Output Example:**

*Input:* `assets/images/brands/ru/teatime/originals/hero-storefront.jpg`  
*Outputs:*
- `assets/images/brands/ru/teatime/teatime-hero-storefront-400w.jpg`
- `assets/images/brands/ru/teatime/teatime-hero-storefront-800w.jpg`
- `assets/images/brands/ru/teatime/teatime-hero-storefront-1200w.jpg`

## 2. Flat Color Minimalism

Used for dimension visualization and UI elements, creating a clean, modern system for navigation and categorization.

### Characteristics

- Bold, simple geometric shapes with clean edges
- No textures, gradients, or shadows
- Extremely limited color palette (3-4 colors maximum)
- Strong simplification and abstraction
- Intentional white space as part of the composition

### Applications

| Dimension Type | Primary Colors | Example Locations |
|----------------|----------------|-------------------|
| Sectors | Olive green (#A3B763) | Sector listings, filters |
| Markets | Sky blue (#0EA5E9) | Market listings, filters |
| Attributes | Orange (#F97316) | Attribute listings, filters |
| Signals | Indigo (#6366F1) | Signal listings, filters |
| UI Elements | Various color schemes | Navigation, interactive elements |

**Input vs Output Example:**

*Input:* `assets/images/sectors/originals/hero-wine.jpg`  
*Outputs:*
- `assets/images/sectors/sectors-hero-wine-400w.jpg`
- `assets/images/sectors/sectors-hero-wine-800w.jpg`
- `assets/images/sectors/sectors-hero-wine-1200w.jpg`

## 3. Geometric Minimalism

Reserved for data visualization, mapping, and relationship diagrams, creating clear information structures.

### Characteristics

- Simple geometric shapes with minimal depth
- Light use of shadows for subtle dimensionality
- Structured, precise compositions with strong organization
- Limited, functional color palette
- Clean, informational aesthetic

### Applications

| Content Type | Primary Colors | Example Locations |
|--------------|----------------|-------------------|
| Maps | Blues with green/orange accents | Location intelligence sections |
| Data Visualizations | Gradient palette (burgundy to teal) | Market data sections |
| Relationship Diagrams | Blues/grays with categorical colors | Dimension relationship pages |
| Structural Elements | Neutral palette with accent colors | Navigation, organization |

## 4. Natural Photography

Used exclusively for team members and testimonial providers, creating a professional and authentic impression.

### Characteristics

- Professional, high-quality photography
- Clean, neutral backgrounds with consistent lighting
- Natural color grading with minimal editing
- Consistent framing and composition
- Professional but approachable aesthetic
- Subtle brand filter (12% teal overlay)

### Applications

| Content Type | Primary Colors | Example Locations |
|--------------|----------------|-------------------|
| Brandmine Team | Natural with teal filter | About page, team section |
| Testimonial Providers | Natural with teal filter | Testimonials, customer stories |

**Input vs Output Example:**

*Input:* `assets/images/people/originals/team-georgie.jpg`  
*Outputs:*
- `assets/images/people/people-team-georgie-400w.jpg` (with teal filter applied)
- `assets/images/people/people-team-georgie-800w.jpg` (with teal filter applied)
- `assets/images/people/people-team-georgie-1200w.jpg` (with teal filter applied)

## Insight Article Categories

Each insight article category has its own distinctive color palette while following the textured minimalism style:

| Insight Category | Primary Colors | Style Notes |
|-----------------|----------------|-------------|
| Brand Spotlights | Deep blue with amber/gold accents | Rich textures with product/brand elements |
| Founder's Journeys | Terracotta/orange with cream and olive green | Journey pathway elements with human silhouette |
| Location Intelligence | Deep blue with light gray and green accents | Map elements, location markers, and subtle topographic lines |
| Market Milestone | Cream/beige with gradient bars from burgundy to teal | Growth chart elements showing upward progression |

## Directory Structure & File Organization

```
assets/images/
├── brands/                     # Brand-specific imagery
│   └── [country-code]/         # Organized by country code (e.g., ru, in, cn)
│       └── [brand-name]/       # Each brand has its own directory
│           ├── originals/      # Original high-resolution files 
│           └── [responsive images]  # Generated responsive images
├── sectors/                    # Sector dimension images
├── markets/                    # Market dimension images
├── attributes/                 # Attribute dimension images
├── signals/                    # Signal dimension images
├── icons/                      # Dimension taxonomy icons
│   ├── dimensions/             # Organized by dimension type
│   │   ├── sectors/            # Sector-specific icons
│   │   ├── attributes/         # Attribute-specific icons
│   │   ├── signals/            # Signal-specific icons
│   │   └── markets/            # Market-specific icons
│   └── insights/               # Insights category icons
├── insights/                   # Insight article images
└── site/                       # Site-wide UI elements
```

## File Naming Conventions

All original images follow the purpose-first naming pattern:

```
purpose-descriptivename.extension
```

### Standard Purpose Identifiers

| Purpose | Usage | Examples |
|---------|-------|----------|
| `hero` | Main banner images | `hero-storefront.jpg`, `hero-overview.jpg` |
| `founder` | Founder portraits | `founder-portrait.jpg`, `founder-informal.jpg` |
| `team` | Group or staff photos | `team-leadership.jpg`, `team-production.jpg` |
| `gallery` | Image collections | `gallery-product.jpg`, `gallery-interior.jpg` |
| `logo` | Brand logos | `logo-color.png`, `logo-dark.png` |
| `product` | Product imagery | `product-teapot.jpg`, `product-lineup.jpg` |
| `location` | Place imagery | `location-vineyard.jpg`, `location-factory.jpg` |
| `certificate` | Certifications | `certificate-organic.jpg` |
| `testimonial` | Customer testimonials | `testimonial-customer.jpg` |
| `icon` | UI and taxonomy icons | `icon-export-ready.png`, `icon-wine.svg` |

### Processed Images

Processed images are automatically generated with this naming pattern:

```
[brand-name]-[purpose]-[descriptivename]-[width]w.extension
```

or

```
[category]-[purpose]-[descriptivename]-[width]w.extension
```

**Examples:**

For brands:
```
teatime-hero-storefront-800w.jpg
teatime-founder-portrait-800w.jpg
```

For dimensions:
```
sectors-hero-wine-800w.jpg
markets-hero-russia-800w.jpg
```

## Creation Guidelines

### Textured Minimalism

When creating textured minimalist illustrations:

1. **Textures**: Use subtle paper, fabric, or natural textures that don't overwhelm the composition
2. **Shadows**: Implement gentle, diffused shadows (15-20% opacity) for subtle depth
3. **Forms**: Abstract and simplify real-world elements into cleaner forms while maintaining recognition
4. **Composition**: Create asymmetrical but balanced arrangements with clear focal points
5. **Colors**: Limit palette to 4-5 colors with clear relationship to the subject matter

For **Muted Pastel** variation:
1. Reduce color saturation by 20-30%
2. Lighten the overall palette
3. Reduce texture contrast
4. Simplify forms further

### Flat Color Minimalism

When creating flat color minimalist illustrations:

1. **Shapes**: Use bold, clean-edged shapes with no outlines
2. **Colors**: Limit to 3-4 flat colors with no gradients or textures
3. **Representation**: Create clear, recognizable representations that reduce cognitive load while maintaining simplicity
4. **Space**: Use white/negative space as an active design element
5. **Consistency**: Maintain consistent visual weight and complexity across a dimension set

### Geometric Minimalism

When creating geometric minimalist illustrations:

1. **Structure**: Use precise grid-based composition with clear organization
2. **Depth**: Add minimal shadows (10-15% opacity) for subtle dimensionality
3. **Colors**: Use functional color coding that enhances information clarity
4. **Lines**: Implement clean connection lines for showing relationships
5. **Precision**: Maintain mathematical precision in all forms and alignments

### Natural Photography

When creating team and testimonial portrait photography:

1. **Background**: Use clean, neutral backgrounds (light gray, off-white, or subtle gradient)
2. **Lighting**: Implement soft, even lighting that flatters the subject
3. **Framing**: Frame from shoulders up, with face as the clear focal point
4. **Editing**: Apply minimal editing - only basic color correction and subtle retouching
5. **Consistency**: Maintain visual consistency across all team/testimonial images
6. **Brand Filter**: Apply the teal (#38B2AC) filter at 12% opacity using `apply_teal_filter.sh`

## Example Prompts by Style

### Textured Minimalism Prompt

```
Create a textured minimalist illustration for [subject]. 3:2 aspect ratio, horizontal composition. Use a minimalist approach with subtle [texture type] textures and gentle shadows. Incorporate stylized [element 1], [element 2], and [element 3] in a balanced composition that extends across at least 80% of the canvas. The main color palette should feature [primary color] with [accent 1] and [accent 2] accents. The style should be [aesthetic quality] yet [aesthetic quality], with clean lines and simplified forms that maintain subtle texture details, with intentional negative space that feels balanced rather than empty. Do not include any text in the image.
```

**Example for Market-Specific Sector (Russian Wine Industry)**:

```
Create a textured minimalist illustration for the wine industry in Russia. 3:2 aspect ratio, horizontal composition. Use a minimalist approach with subtle textured paper reminiscent of Black Sea terroir and gentle shadows. Incorporate stylized Crimean coastline elements, simplified vineyard rows from the Krasnodar region, and abstract patterns suggesting emerging wine culture in a balanced composition that extends across at least 80% of the canvas. The main color palette should feature deep burgundy with forest green and golden accents. The style should reflect Russia's evolving wine traditions with sophisticated simplicity, with flowing asymmetry but avoiding large empty zones. Do not include any text in the image.
```

### Flat Color Minimalism Prompt

```
Create a flat color minimalist illustration representing [subject]. 3:2 aspect ratio, horizontal composition. Use bold, simple geometric shapes with clean edges and zero textures or gradients. Include [number] abstract elements that suggest [concept] without being literal. The color palette should focus on [primary color] as the primary color with limited accent colors (maximum 3-4 total colors). White space should be used intentionally as part of the composition. All elements should be flat with no shadows, highlights, or textures. The style should be modern, clean, and suitable for UI/dimension visualization. Do not include any text in the image.
```

**Example for Sector Dimension (Wine)**:

```
Create a flat color minimalist illustration representing the wine sector. 3:2 aspect ratio, horizontal composition. Use bold, simple geometric shapes with clean edges and zero textures or gradients. Include 2-3 abstract elements that suggest wine production without being literal. The color palette should focus on olive green (#A3B763) as the primary color with limited accent colors (maximum 3-4 total colors). White space should be used intentionally as part of the composition. All elements should be flat with no shadows, highlights, or textures. The style should be modern, clean, and suitable for UI/dimension visualization. Do not include any text in the image.
```

### Geometric Minimalism Prompt

```
Create a geometric minimalist illustration of [subject]. 3:2 aspect ratio, horizontal composition. Use simple geometric shapes with minimal depth and subtle shadows for light dimensionality. Incorporate [element 1], [element 2], and [element 3] using precise, structured composition. The color palette should be limited to [primary color] with [accent color] accents and neutral tones. The style should be clean and informational with strong visual organization, suitable for data visualization. Avoid excessive detail in favor of clarity and organization. Do not include any text in the image.
```

**Example for Location Intelligence**:

```
Create a geometric minimalist illustration of a location intelligence map. 3:2 aspect ratio, horizontal composition. Use simple geometric shapes with minimal depth and subtle shadows for light dimensionality. Incorporate location pins, connection lines, and a subtle topographic background using precise, structured composition. The color palette should be limited to deep blue with green and gray accents and neutral tones. The style should be clean and informational with strong visual organization, suitable for data visualization. Avoid excessive detail in favor of clarity and organization. Do not include any text in the image.
```

## File Format & Size Guidelines

| Style | Preferred Format | Max File Size | Notes |
|-------|------------------|---------------|-------|
| Textured Minimalism | JPG (85% quality) | 300KB | Limited use of PNG only when transparency is required |
| Flat Color Minimalism | JPG (85% quality) | 200KB | Limited use of PNG only when transparency is required |
| Geometric Minimalism | JPG (85% quality) | 200KB | Limited use of PNG only when transparency is required |
| Icons (Simple) | SVG | 20KB | 24×24px, stored in includes/components/icons/ |
| Icons (Complex) | PNG | 100KB | 512×512px source size, stored in assets/images/icons/ |
| Team Portraits | JPG (90% quality) | 300KB | 2:3 aspect ratio with teal filter applied |

## Implementation Process

1. **Style Selection**:
   - Determine content type (brand, dimension, data)
   - Select appropriate style from guidelines
   - Identify color palette for the specific context

2. **Creation**:
   - Use appropriate prompt template for AI generation
   - Save to JPG at 85% quality (unless transparency needed)
   - Optimize file size before adding to repository

3. **File Organization**:
   - Place in correct country/brand directory structure for brand images
   - Follow naming conventions (`purpose-descriptivename.ext`)
   - Place in appropriate `originals/` folder

4. **Processing**:
   - Process with appropriate script:
     - `./_scripts/process_brand_images.sh [country-code] [brand-name]`
     - `./_scripts/process_site_images.sh`
     - `./_scripts/process_icons.sh` (for dimension icons)
     - `./_scripts/apply_teal_filter.sh` (for team portraits)

5. **Implementation**:
   - Use the appropriate include based on image type

## SVG Best Practices

When using SVG icons:

1. **Proper viewBox**: Always include a proper viewBox attribute:
   ```xml
   <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
   ```

2. **Clean Markup**: Remove unnecessary attributes and metadata
   - Consider using SVGO for optimization (not currently implemented)

3. **Current Color**: Use `fill="currentColor"` or `stroke="currentColor"` to inherit color from text

4. **Accessibility**: Include appropriate ARIA attributes for interactive SVGs

5. **Implementation**: Place SVGs directly in `_includes/components/icons/` for direct inclusion

## Quality Control Checklist

Before finalizing any image:

- [ ] Follows the correct visual style for its content type
- [ ] Uses the appropriate color palette for its context
- [ ] Maintains 3:2 (or 2:3 for portraits) aspect ratio
- [ ] Contains no text elements
- [ ] File size optimized (<300KB)
- [ ] Named according to purpose-first convention
- [ ] Includes descriptive alt text
- [ ] Placed in correct directory structure