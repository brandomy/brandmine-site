# Hero Card Style Guide

## Current Implementation ✅

The insight article hero card now uses a **clean, professional layout** that matches your test page design exactly.

### Visual Features:
- **Full-height images** on desktop (no white borders)
- **Clean text categories** in teal color
- **Tighter spacing** for better visual hierarchy
- **Responsive design** - mobile-first approach
- **Smooth hover effects** on images

### Layout Structure:
```
┌─────────────────────────────────────┐
│ ┌─────────────┐ ┌─────────────────┐ │
│ │             │ │ CATEGORY        │ │
│ │    IMAGE    │ │ Title           │ │
│ │ (full height)│ │ Description     │ │
│ │             │ │ Meta info       │ │
│ └─────────────┘ └─────────────────┘ │
└─────────────────────────────────────┘
```

## Mobile Behavior:
- Single column layout
- 16:9 aspect ratio for images
- Smaller text sizes
- Appropriate touch targets

## Desktop Behavior:
- Two-column grid layout
- Image fills full panel height
- Content vertically centered
- No gaps between image and content

## Category Styling Options:

### Current: Clean Text Style (Recommended) ✅
```css
.insight-hero-card__category {
  color: var(--primary-600);
  font-size: var(--text-sm);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}
```

### Alternative: Badge Style (Available)
If you want rounded badges instead:
```css
.insight-hero-card__category {
  background: var(--primary-100);
  color: var(--primary-700);
  padding: var(--space-1) var(--space-3);
  border-radius: var(--radius-full);
  font-size: var(--text-xs);
}
```

## Design Principles Applied:

1. **Mobile-First**: Base styles for mobile, enhanced for desktop
2. **Clean Typography**: Clear hierarchy with proper spacing
3. **Visual Balance**: Equal weight between image and content
4. **Professional Aesthetic**: Matches business/investment context
5. **Accessibility**: Proper contrast and alt text support

## Performance Notes:
- Uses CSS Grid for efficient layout
- Minimal CSS with design tokens
- No additional JavaScript required
- Build time maintained at ~4 seconds

The current implementation provides the optimal balance of visual appeal and professional presentation for your insight articles.