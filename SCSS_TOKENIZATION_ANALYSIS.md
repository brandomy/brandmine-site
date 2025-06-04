# SCSS Tokenization Analysis - Brandmine Codebase

## Executive Summary

After analyzing 276 SCSS files in the Brandmine codebase, I've identified numerous hardcoded values that should be converted to design tokens. The current `tokens.scss` file has a solid foundation, but there are significant opportunities for improvement.

## Current Token Coverage Analysis

### ✅ Well-Tokenized Areas
- **Box shadows**: Nearly all box-shadow values use tokens (`--shadow-sm`, `--shadow-md`, etc.)
- **Core colors**: Primary, secondary, neutral, accent palettes are well-established
- **Typography**: Font sizes, weights, and line heights are mostly tokenized
- **Basic spacing**: Common spacing values (--space-1 through --space-20) exist

### ❌ Areas Needing Tokenization

## 1. SOCIAL MEDIA BRAND COLORS (HIGH PRIORITY)

**Current State**: Hardcoded hex values scattered across multiple files
**Usage Frequency**: 40+ instances across social icon components

### Identified Social Media Colors:
```scss
#1877F2  (Facebook)       - 5 instances
#0A66C2  (LinkedIn)       - 4 instances  
#FF0000  (YouTube)        - 2 instances
#26A5E4  (Telegram)       - 2 instances
#DF2029  (Weibo)          - 2 instances
#07C160  (WeChat)         - 5 instances
#0077FF  (VK)             - 2 instances
#000000  (Twitter/X)      - 2 instances
```

### Instagram Gradient:
```scss
linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%)
```

**Recommended Tokens**:
```scss
/* Social Media Brand Colors */
--social-facebook: #1877F2;
--social-facebook-dark: #155DBF; /* darken(#1877F2, 10%) */
--social-linkedin: #0A66C2;
--social-linkedin-dark: #085397;
--social-youtube: #FF0000;
--social-youtube-dark: #CC0000;
--social-telegram: #26A5E4;
--social-telegram-dark: #2196D3;
--social-weibo: #DF2029;
--social-weibo-dark: #B21A21;
--social-wechat: #07C160;
--social-wechat-dark: #059E4D;
--social-vk: #0077FF;
--social-vk-dark: #0066CC;
--social-twitter: #000000;
--social-twitter-dark: #333333;

/* Instagram gradient */
--social-instagram-gradient: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
```

## 2. SIZING AND SPACING VALUES (HIGH PRIORITY)

**Current State**: 402 hardcoded pixel values, 217 rem-based spacing values
**Most Frequent Values**:

### Border Widths:
- `1px` (264 instances) - Most common, already has --border-width-thin: 1px
- `2px` (131 instances) - Already has --border-width-medium: 2px  
- `3px` (67 instances) - Already has --border-width-thick: 4px (inconsistent)
- `4px` (76 instances)

**Recommended New Tokens**:
```scss
/* Enhanced Border System */
--border-width-hairline: 0.5px;
--border-width-thin: 1px;      /* existing */
--border-width-medium: 2px;    /* existing */
--border-width-thick: 3px;     /* update from 4px */
--border-width-heavy: 4px;
--border-width-ultra: 6px;
```

### Common Sizes:
- `24px` (47 instances) - Icon sizes, small elements
- `48px` (36 instances) - Larger icons, buttons
- `72px` - Portrait sizes in founder cards
- `120px`, `200px`, `300px` - Various component widths

**Recommended New Tokens**:
```scss
/* Size Scale */
--size-6: 24px;    /* 1.5rem - icons, small elements */
--size-12: 48px;   /* 3rem - large icons, buttons */
--size-18: 72px;   /* 4.5rem - portrait sizes */
--size-30: 120px;  /* 7.5rem - component widths */
--size-50: 200px;  /* 12.5rem - section heights */
--size-75: 300px;  /* 18.75rem - larger sections */
```

### Layout Widths:
- `800px` (26 instances) - Content max-widths
- `1200px` (34 instances) - Container max-widths  
- `700px`, `600px`, `900px` - Various content containers

**Recommended New Tokens**:
```scss
/* Content Width Scale */
--content-width-xs: 600px;
--content-width-sm: 700px;
--content-width-md: 800px;
--content-width-lg: 900px;
--content-width-xl: 1000px;
--container-max-width: 1200px; /* existing */
```

## 3. BORDER RADIUS VALUES (MEDIUM PRIORITY)

**Current State**: Mix of tokenized and hardcoded values
**Common Hardcoded Values**:
- `2px`, `4px`, `8px`, `12px`, `20px` - Various components
- `2rem` - Founder cards, expertise clouds
- `50%` - Circular elements

**Recommended Additions**:
```scss
/* Enhanced Radius System */
--radius-xs: 0.125rem;  /* 2px - existing */
--radius-sm: 0.25rem;   /* 4px - existing */
--radius-md: 0.5rem;    /* 8px - existing */
--radius-lg: 1rem;      /* 16px - existing */
--radius-xl: 1.5rem;    /* 24px - existing */
--radius-2xl: 2rem;     /* 32px - NEW for founder cards */
--radius-full: 50%;     /* NEW for circular elements */
--radius-card: 0.75rem; /* 12px - existing */
```

## 4. Z-INDEX VALUES (MEDIUM PRIORITY)

**Current State**: Good token foundation exists but inconsistent usage
**Hardcoded Values Found**:
- `z-index: 1` (8 instances)
- `z-index: 2` (3 instances)  
- `z-index: 10` (12 instances)
- `z-index: 15`, `1000`, `9999` - Various components

**Issues**: 
- Modal uses `z-index: 9999` but token is `--z-modal-content: 1100`
- Loading spinner uses `z-index: 9999` but should use `--z-toast: 2000`
- Inconsistent usage of existing tokens

**Recommended Action**: Enforce existing token usage, add missing values:
```scss
/* Additional Z-Index Tokens */
--z-base: 1;           /* NEW - base content layer */
--z-raised: 2;         /* NEW - slightly raised content */
--z-floating: 5;       /* NEW - floating elements */
--z-sticky: 15;        /* NEW - sticky elements */
```

## 5. ALPHA TRANSPARENCY (LOW PRIORITY)

**Current State**: Excellent alpha token system exists
**Issue**: Some hardcoded rgba values still in use
- `rgba(0, 0, 0, 0.10)` (7 instances) - Should use `--neutral-alpha-10`

**Recommended Action**: Replace hardcoded rgba with existing tokens

## 6. BREAKPOINT INCONSISTENCIES (MEDIUM PRIORITY)

**Current State**: Documentation says to use 480px, 768px, 992px directly
**Issue**: Some files use 767px, 479px, 991px (max-width patterns)

**Recommended Additions** (if max-width queries are needed):
```scss
/* Max-width Breakpoint Helpers (use sparingly) */
--breakpoint-xs-max: 479px;  /* 480px - 1 */
--breakpoint-md-max: 767px;  /* 768px - 1 */
--breakpoint-lg-max: 991px;  /* 992px - 1 */
```

## Implementation Priority

### Phase 1 (Immediate - High Impact):
1. **Social Media Colors** - Most repeated, brand-critical
2. **Border Width Consistency** - Fix 3px vs 4px inconsistency
3. **Z-Index Enforcement** - Replace hardcoded with existing tokens

### Phase 2 (Short-term):
1. **Size Scale Tokens** - 24px, 48px, 72px, etc.
2. **Content Width Tokens** - 600px, 700px, 800px, etc.
3. **Border Radius Extensions** - 2rem, 50% values

### Phase 3 (Long-term):
1. **Alpha Transparency Cleanup** - Replace remaining hardcoded rgba
2. **Breakpoint Helpers** - If max-width patterns persist

## Files Requiring Major Updates

### High Priority:
- `assets/css/components/brands/social-icon.scss` - 20+ hardcoded social colors
- `assets/css/pages/journal/_social-sharing.scss` - Social colors
- `assets/css/components/cards/founder-card.scss` - Sizing, spacing
- `assets/css/components/ui/modal.scss` - Z-index consistency

### Medium Priority:
- `assets/css/layout/panels/_panel-types.scss` - Content widths
- `assets/css/components/cards/featured-founder-card.scss` - Spacing
- `assets/css/debug.scss` - Colors and sizing

## Estimated Impact

- **Social Media Colors**: ~40 find/replace operations across 3 files
- **Size Tokens**: ~150 find/replace operations across 50+ files  
- **Border/Z-index**: ~30 find/replace operations across 20+ files

**Total Effort**: ~220 individual replacements across ~70 files
**Risk Level**: Low (additive tokens, no breaking changes)
**Benefit**: Improved maintainability, consistent social branding, easier theming