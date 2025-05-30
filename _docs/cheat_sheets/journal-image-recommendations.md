# Journal Image Strategy & Recommendations

## Current Image Structure Analysis

### Strengths
- ✅ **Organized by post**: Each post has its own directory `/assets/images/journal/YYYY-MM-DD-post-slug/`
- ✅ **Consistent naming**: `hero.jpg` for featured images, descriptive names for inline images
- ✅ **Responsive processing**: Existing `process_images.sh` script creates multiple sizes
- ✅ **Integration ready**: Posts reference images via front matter and markdown

### Recommendations for Improvement

## 1. **Hero Image Strategy**

### **Current**: Mixed/undefined style
### **Recommended**: Consistent Textured Minimalism (TM) approach

**Implementation:**
```
📁 assets/images/journal/2025-05-30-maplibre-journey/
├── hero.jpg                    # 1200×800 TM style (3:2)
├── hero-2x.jpg                 # 2400×1600 for retina displays  
├── hero-mobile.jpg             # 800×533 mobile optimized
└── hero-social.jpg             # 1200×630 for social sharing (1.91:1)
```

**TM Style Guidelines:**
- **Colors**: Rich but muted palette (avoid pure whites/blacks)
- **Forms**: Simplified geometric shapes, minimal detail
- **Textures**: Subtle paper/fabric textures, gentle shadows
- **Content**: No embedded text, abstract concepts over literal representations
- **Mood**: Professional, editorial, timeless

## 2. **Inline Image Hierarchy**

### **Level 1: Key Illustrations** (MPTM Style)
- Process diagrams, concept illustrations
- Lighter, pastel version of TM style
- Support main narrative points

### **Level 2: Screenshots & Technical Content**
- High contrast for readability
- Consistent annotation style
- Clean backgrounds (remove desktop clutter)

### **Level 3: Supporting Visuals**
- Charts, graphs, simple diagrams
- Match Brandmine color palette
- Clear, minimal design

## 3. **Recommended Directory Structure**

```
assets/images/journal/
├── _templates/                         # Template files for designers
│   ├── hero-template.psd              # TM style template
│   ├── inline-template.psd            # MPTM style template
│   └── social-template.psd            # Social sharing template
├── _processed/                        # Auto-generated responsive versions
│   └── [automatically populated by scripts]
└── YYYY-MM-DD-post-slug/
    ├── hero.jpg                       # Main featured image (1200×800)
    ├── hero-social.jpg                # Social sharing (1200×630)
    ├── diagram-process-flow.jpg       # Key illustrations
    ├── screenshot-interface.jpg       # Technical screenshots
    └── chart-performance.jpg          # Supporting data visualizations
```

## 4. **File Size & Optimization Targets**

| Image Type | Dimensions | Target Size | Format |
|------------|------------|-------------|---------|
| Hero | 1200×800 | 200-300KB | JPG (85% quality) |
| Hero Retina | 2400×1600 | 400-500KB | JPG (80% quality) |
| Inline Large | 800×533 | 150-200KB | JPG (85% quality) |
| Inline Medium | 600×400 | 100-150KB | JPG (85% quality) |
| Social Share | 1200×630 | 200-250KB | JPG (85% quality) |
| Diagrams | Variable | 100-200KB | PNG or JPG |

## 5. **Content-Specific Recommendations**

### **Technical Posts** (e.g., MapLibre article)
- **Hero**: Abstract representation of technology concept
- **Inline**: Clean interface screenshots, code examples with syntax highlighting
- **Supporting**: Architecture diagrams, process flows

### **Market Research Posts** (e.g., Russian insights)
- **Hero**: Cultural/regional imagery in TM style
- **Inline**: Data visualizations, market analysis charts
- **Supporting**: Brand examples (with permission), regional maps

### **Strategy Posts** (e.g., China storytelling)
- **Hero**: Cultural bridge concept in TM style
- **Inline**: Framework diagrams, comparison charts
- **Supporting**: Cultural elements, timeline visualizations

## 6. **Production Workflow**

### **Step 1: Content Planning**
- Identify key visual concepts before writing
- Plan hero image concept that supports article theme
- List required diagrams and supporting visuals

### **Step 2: Asset Creation**
```bash
# Create post directory
mkdir assets/images/journal/YYYY-MM-DD-post-slug

# Create hero image (TM style)
# - Use template from _templates/hero-template.psd
# - 1200×800 base resolution
# - Follow TM guidelines

# Create inline assets
# - Screenshots: high contrast, clean backgrounds
# - Diagrams: use Brandmine color palette
# - Charts: minimal, clear design
```

### **Step 3: Processing & Optimization**
```bash
# Run processing script
./scripts/process_images.sh journal post-slug

# This creates:
# - Multiple responsive sizes (400w, 800w, 1200w, 1600w)
# - Optimized compression
# - WebP versions for modern browsers (future enhancement)
```

### **Step 4: Implementation**
```yaml
# In post front matter
image: /assets/images/journal/YYYY-MM-DD-post-slug/hero.jpg
image_caption: "Descriptive caption that adds value"

# In markdown content
![Alt text](/assets/images/journal/YYYY-MM-DD-post-slug/diagram.jpg)
*Caption that explains the diagram's relevance*
```

## 7. **Visual Consistency Checklist**

**Before Publishing:**
- [ ] Hero image follows TM style guidelines
- [ ] All images under target file sizes
- [ ] Alt text is descriptive and SEO-friendly
- [ ] Color palette aligns with Brandmine design tokens
- [ ] Mobile responsiveness verified
- [ ] Social sharing image (1200×630) created
- [ ] Image loading performance tested

## 8. **Future Enhancements**

### **Phase 1: Immediate** (Next 2 weeks)
- Create TM style template files
- Establish clear style guide for designers
- Optimize existing hero images to TM standard

### **Phase 2: Short-term** (Next month)
- Implement WebP format support for modern browsers
- Add automatic social sharing image generation
- Create component for image galleries

### **Phase 3: Long-term** (Next quarter)
- Consider CDN integration for faster loading
- Implement progressive image loading
- Add image optimization automation

## 9. **Resource Requirements**

### **Tools Needed:**
- **Design**: Photoshop/GIMP for TM style creation
- **Optimization**: ImageMagick, TinyPNG
- **Screenshots**: CleanShot X or similar (consistent style)
- **Diagrams**: Figma, Sketch, or similar

### **Skill Requirements:**
- Understanding of TM visual style
- Basic image optimization knowledge
- Consistent approach to screenshot styling

## 10. **Success Metrics**

- **Performance**: Average page load time under 3 seconds
- **Engagement**: Higher time on page for posts with strong visuals
- **Consistency**: Visual style matches across all posts
- **SEO**: Images contribute to search ranking with proper alt text
- **Social**: Higher click-through rates on social media shares

This image strategy ensures the journal maintains Brandmine's premium, editorial aesthetic while supporting excellent user experience and performance.