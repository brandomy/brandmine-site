# Journal Image Processing Workflow

## Image Requirements for Journal Posts

### Hero Images
- **Aspect Ratio**: 3:2 horizontal (1200×800px recommended)
- **Style**: Textured Minimalism (TM) - simplified forms, subtle textures, gentle shadows, rich muted colors, no embedded text
- **File Format**: JPG (optimized for web)
- **Directory**: `/assets/images/journal/YYYY-MM-DD-post-slug/hero.jpg`

### Inline Images
- **Aspect Ratio**: Various, but maintain visual consistency
- **Style**: Muted Pastel Textured Minimalism (MPTM) for illustrations
- **File Format**: JPG or PNG as appropriate
- **Directory**: `/assets/images/journal/YYYY-MM-DD-post-slug/[descriptive-name].jpg`

### Author Images
- **Source**: Use existing team photos from `/assets/images/people/`
- **Processing**: Apply teal filter using `apply_teal_filter.sh`
- **Aspect Ratio**: 1:1 square (for author profiles)
- **File Format**: JPG

## Directory Structure

```
assets/images/journal/
├── 2025-05-30-maplibre-journey/
│   ├── hero.jpg                    # Featured image (3:2)
│   ├── maplibre-interface.jpg      # Inline screenshot
│   └── clustering-demo.jpg         # Technical illustration
├── 2025-06-15-russian-market-insights/
│   ├── hero.jpg                    # Featured image (3:2)
│   ├── market-research-flow.jpg    # Process diagram
│   └── brand-examples.jpg          # Brand showcase
└── 2025-07-01-china-brand-storytelling/
    ├── hero.jpg                    # Featured image (3:2)
    ├── cultural-bridge.jpg         # Conceptual illustration
    └── brand-positioning.jpg       # Strategy diagram
```

## Processing Workflow

### 1. Create Post Directory
```bash
mkdir -p /Users/randaleastman/Documents/brandmine-site/assets/images/journal/YYYY-MM-DD-post-slug
```

### 2. Process Hero Images
For TM style hero images:
- Start with high-quality source image (1600px+ width)
- Apply Textured Minimalism processing:
  - Simplify forms and reduce detail
  - Add subtle textures
  - Use muted color palette
  - Remove any embedded text
- Resize to 1200×800px for hero use
- Optimize for web (target 200-300KB file size)

### 3. Process Inline Images
```bash
# Use the existing image processing script
./scripts/process_images.sh journal [post-slug]
```

This will create responsive versions:
- 400w, 800w, 1200w, 1600w for responsive images
- Optimize compression for web delivery
- Maintain aspect ratios

### 4. Update Post Front Matter
```yaml
---
image: /assets/images/journal/2025-05-30-maplibre-journey/hero.jpg
image_caption: "Interactive maps bring brand stories to life"
---
```

## Image Implementation in Posts

### Hero Images
- Automatically displayed via `featured-image.html` include
- Background image for featured article section
- Caption support via `image_caption` front matter

### Inline Images
```markdown
![Alt text](/assets/images/journal/YYYY-MM-DD-post-slug/inline-image.jpg)
*Caption text can go here*
```

### Responsive Images
The `base-image.html` component automatically generates responsive markup:
```html
{% include components/images/base-image.html 
   src="/assets/images/journal/post-slug/image.jpg" 
   alt="Descriptive alt text" 
   class="article-image" %}
```

## Style Guidelines

### Textured Minimalism (TM) for Heroes
- **Purpose**: Primary storytelling for featured articles
- **Characteristics**: 
  - Simplified geometric forms
  - Subtle paper/fabric textures
  - Gentle drop shadows
  - Rich but muted color palette
  - No embedded text or logos
  - Clean, editorial aesthetic

### Muted Pastel Textured Minimalism (MPTM) for Inline
- **Purpose**: Supporting illustrations and diagrams
- **Characteristics**:
  - Pastel-based color scheme
  - Softer textures than TM
  - Lighter emotional tone
  - Simplified forms for clarity
  - Complement main content

### Technical Screenshots
- **High contrast** for readability
- **Clean backgrounds** (remove desktop clutter)
- **Consistent sizing** for flow
- **Annotations** when helpful (use consistent style)

## SEO and Accessibility

### Alt Text
- Descriptive and specific
- Include relevant keywords naturally
- Describe function, not just appearance
- Keep under 125 characters

### File Naming
- Use descriptive, SEO-friendly names
- Include relevant keywords
- Use hyphens for spaces
- Example: `maplibre-clustering-strategy.jpg`

### Image Optimization
- Target file sizes: Hero images 200-300KB, inline images 100-200KB
- Use progressive JPEGs for faster loading
- Include appropriate image dimensions in responsive markup

## Brand Consistency

### Color Palette
Use Brandmine's design tokens for any custom graphics:
- Primary: Teal variants
- Secondary: Warm orange variants  
- Neutral: Gray scale
- Accent: Purple variants

### Typography in Images
When text is required in images:
- Use Brandmine's font stack (PT Sans/PT Serif family)
- Maintain sufficient contrast
- Keep text minimal and readable at small sizes

## Quality Checklist

Before publishing:
- [ ] Hero image is 3:2 aspect ratio and TM style
- [ ] All images are optimized for web (<300KB each)
- [ ] Alt text is descriptive and under 125 characters
- [ ] File names are SEO-friendly
- [ ] Images support the article narrative
- [ ] Visual style is consistent with Brandmine brand
- [ ] Mobile responsiveness is verified
- [ ] Loading performance is acceptable

## Tools and Resources

### Image Processing
- **ImageMagick**: For batch processing and optimization
- **GIMP/Photoshop**: For TM/MPTM style creation
- **TinyPNG**: For final optimization
- **Brandmine Scripts**: Use existing `process_images.sh`

### Style References
- See `/assets/images/brands/` for TM examples
- See `/assets/images/insights/` for MPTM examples
- Follow existing visual patterns for consistency