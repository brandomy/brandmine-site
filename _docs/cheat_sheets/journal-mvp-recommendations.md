# Journal MVP Layout Recommendations

## Recommended Approach: Enhanced Split Hero Layout

### Visual Layout Structure
```
Desktop (768px+):
┌─────────────────────┬─────────────────────────────────────┐
│ Colored Panel       │ Featured Image (3:2 ratio)         │
│ [Gradient BG]       │                                     │
│                     │                                     │
│ • Post Meta         │                                     │
│ • Title (large)     │                                     │
│ • Excerpt (2-3 lines) │                                  │
│ • Tag Pills (max 4) │                                     │
│                     │                                     │
└─────────────────────┴─────────────────────────────────────┘

Mobile (767px and below):
┌─────────────────────────────────────────────────────────┐
│ Colored Panel (centered content)                        │
│ [Gradient BG]                                           │
│                                                         │
│ • Post Meta                                             │
│ • Title                                                 │
│ • Excerpt                                               │
│ • Tag Pills                                             │
│                                                         │
└─────────────────────────────────────────────────────────┘
┌─────────────────────────────────────────────────────────┐
│ Featured Image (3:2 ratio)                              │
└─────────────────────────────────────────────────────────┘
```

## Content Strategy

### Post Meta Information
- **Date**: Month DD, YYYY format
- **Author**: Link to author profile/bio
- **Reading Time**: X min read
- **Visual Hierarchy**: Date most prominent, others secondary

### Title Guidelines
- **Length**: 45-65 characters optimal
- **Style**: Sentence case, descriptive
- **Hierarchy**: Largest text element in hero
- **Examples**:
  - ✅ "MapLibre: Our Journey Building Geographic Brand Visualization"
  - ✅ "Decoding Russian Brand Stories: Lessons from Our Market Research"
  - ❌ "MAPLIBRE TECHNICAL IMPLEMENTATION" (too technical/caps)

### Excerpt Strategy
- **Length**: 2-3 lines maximum (120-180 characters)
- **Purpose**: Expand on title, provide context
- **Style**: Conversational, engaging
- **Should**: Hook reader, explain value proposition

### Tag Implementation
- **Maximum**: 4 tags displayed in hero
- **Priority**: Most important/searchable tags first
- **Style**: Pill format with hover effects
- **Links**: Connect to search/filter pages
- **Categories**: Mix of topical and functional tags

## Color Scheme Strategy

### 6 Recommended Color Themes
```scss
// Technical/Development Content
.journal-hero--blue {
  background: radial-gradient(circle at 30% 40%, #3B82F6 0%, #1E40AF 100%);
}

// Market Research/Analysis  
.journal-hero--green {
  background: radial-gradient(circle at 30% 40%, #10B981 0%, #047857 100%);
}

// Cultural/Strategy Content
.journal-hero--orange {
  background: radial-gradient(circle at 30% 40%, var(--secondary-400) 0%, var(--secondary-600) 100%);
}

// Premium/Editorial Content
.journal-hero--purple {
  background: radial-gradient(circle at 30% 40%, var(--accent-400) 0%, var(--accent-700) 100%);
}

// Default/Brand Content
.journal-hero--teal {
  background: radial-gradient(circle at 30% 40%, var(--primary-400) 0%, var(--primary-600) 100%);
}

// Neutral/Formal Content
.journal-hero--slate {
  background: radial-gradient(circle at 30% 40%, var(--neutral-600) 0%, var(--neutral-800) 100%);
}
```

### Content-Color Mapping
- **Blue**: Technical implementation, tools, development
- **Green**: Market research, data analysis, regional insights  
- **Orange**: Cultural insights, strategy, cross-cultural content
- **Purple**: Premium editorial, thought leadership
- **Teal**: Default Brandmine content, company updates
- **Slate**: Formal business content, methodologies

## Image Strategy

### Hero Image Requirements
- **Aspect Ratio**: 3:2 (1200×800px base)
- **Style**: Textured Minimalism (TM) following Brandmine guidelines
- **Content**: Abstract concepts, no embedded text
- **Quality**: High resolution, optimized for web
- **Fallback**: Branded placeholder if no specific image

### Image Processing
```bash
# Standard processing for each post
./scripts/process_images.sh journal post-slug

# Generates responsive sizes:
# - hero-400w.jpg (mobile)
# - hero-800w.jpg (tablet) 
# - hero-1200w.jpg (desktop)
# - hero-1600w.jpg (high-res displays)
```

### Alternative Options
- **Option A**: Use Brandmine-branded template images
- **Option B**: AI-generated abstract imagery following TM style
- **Option C**: Curated stock photography with consistent filter

## Typography Hierarchy

### Size Scale (Mobile → Desktop)
- **Title**: var(--text-2xl) → var(--text-4xl)
- **Excerpt**: var(--text-base) → var(--text-lg)  
- **Meta**: var(--text-sm) → var(--text-base)
- **Tags**: var(--text-xs) (consistent)

### Font Weights
- **Title**: var(--font-bold) - Maximum impact
- **Excerpt**: var(--font-normal) - Readable
- **Meta**: var(--font-medium) - Subtle emphasis
- **Tags**: var(--font-medium) - Clear hierarchy

## MVP Implementation Benefits

### Advantages for Brandmine
1. **Brand Consistency**: Reinforces visual identity across all content
2. **Quality Independence**: Works regardless of image quality/availability
3. **Cultural Neutrality**: Doesn't favor specific visual styles
4. **Maintenance Efficiency**: Simple to update and maintain
5. **Mobile Excellence**: Perfect for international mobile audiences
6. **Scalability**: Easy to implement across hundreds of posts

### User Experience Benefits
1. **Predictable Layout**: Users know where to find information
2. **Readable Text**: Always high contrast, never obscured
3. **Quick Scanning**: Clear hierarchy aids content discovery
4. **Touch Friendly**: Large interactive elements for mobile
5. **Loading Performance**: Optimized images with proper sizing

## Alternative Approaches Considered

### Full-Width Hero with Overlay
- **Pros**: Maximum visual impact, editorial feel
- **Cons**: Requires perfect images, readability issues, cultural bias toward Western design aesthetics
- **Verdict**: Not suitable for MVP due to image quality dependencies

### Minimal Header Approach  
- **Pros**: Fast loading, content-focused
- **Cons**: Lacks visual appeal, doesn't differentiate Brandmine
- **Verdict**: Too plain for premium brand positioning

### Card-Style Hero
- **Pros**: Modern, flexible
- **Cons**: More complex, can feel disconnected
- **Verdict**: Good for future consideration but too complex for MVP

## Content Guidelines

### Post Creation Checklist
- [ ] Choose appropriate color scheme based on content type
- [ ] Create 3:2 hero image following TM guidelines
- [ ] Write engaging excerpt (120-180 characters)
- [ ] Select 4 relevant tags maximum
- [ ] Verify mobile responsiveness
- [ ] Test color contrast and readability

### Quality Standards
- **Title**: Clear, descriptive, benefit-focused
- **Excerpt**: Expands on title, hooks reader
- **Image**: Professional, on-brand, optimized
- **Tags**: Relevant, searchable, limited quantity
- **Meta**: Accurate, complete, properly formatted

This approach balances visual impact with practical MVP requirements while maintaining Brandmine's premium positioning and international accessibility.