# Typography Token Usage

## Alignment with Brandmine Design System

### Font System
- **Headings**: `--font-heading` (PT Serif)
- **Body Text**: `--font-body` (PT Sans)
- **Weights**: `--font-normal` (400), `--font-semibold` (600), `--font-bold` (700)

### Size Progression (Mobile-First)
- **H1**: `--text-xl` → `--text-2xl` → `--text-3xl`
- **H2**: `--text-lg` → `--text-xl` → `--text-2xl`
- **H3**: `--text-base` → `--text-lg` → `--text-xl`
- **Body**: `--text-base` → `--text-lg` → `--text-lg`

### Line Heights
- **Headings**: `--leading-tight` (1.25) and `--leading-snug` (1.375)
- **Body Text**: `--leading-normal` (1.5) → `--leading-relaxed` (1.625)

### Spacing System
- **All margins/padding**: Using `--space-*` tokens
- **Content width**: Using `--form-max-width` (700px)
- **Breakpoints**: Using modern `(width >= Xpx)` syntax

### Color System
- **Text**: `--neutral-700` (body), `--neutral-900` (headings)
- **Links**: `--primary-600` → `--primary-700` (hover)
- **Quotes**: `--neutral-600` with `--primary-300` border

### Benefits
1. **Consistent**: Uses established design system
2. **Maintainable**: Changes to tokens affect all typography
3. **Future-proof**: Scales with design system updates
4. **Performance**: Leverages existing CSS architecture

## Editorial Standards Met

### Content Width
- **Mobile**: Full width with padding
- **Tablet**: Enhanced padding using tokens
- **Desktop**: 700px max-width (optimal for reading)

### Typography Hierarchy
- **Progressive sizing**: Mobile-first approach
- **Optimal line length**: 65-75 characters per line
- **Professional appearance**: PT Serif headings, PT Sans body

### Responsive Behavior
- **Mobile (320px+)**: Compact sizing for readability
- **Tablet (768px+)**: Enhanced spacing and sizing
- **Desktop (992px+)**: Optimal reading experience
- **Large screens (1400px+)**: Prevents over-expansion

## Implementation Notes

### Modern Breakpoints
Using Brandmine's modern syntax:
```css
@media (width >= 768px) { /* Tablet */ }
@media (width >= 992px) { /* Desktop */ }
```

### Token Compliance
All styles use established design tokens:
- Font families, sizes, weights from token system
- Spacing using `--space-*` tokens
- Colors using `--neutral-*` and `--primary-*` tokens
- Transitions using `--transition-*` tokens

### Accessibility
- Proper contrast ratios using color tokens
- Progressive enhancement approach
- Clear typography hierarchy
- Optimal reading line lengths