# Brandmine Design Tokens

## Color System
The site uses a comprehensive color system defined in `assets/css/tokens/colors.css` with these key palettes:

- **Primary Colors (Teal)**: Brand identity, CTAs, and navigation
  - `--primary-50` through `--primary-900` (light to dark)
  - Main brand color: `--primary-400: #38B2AC`

- **Secondary Colors (Orange)**: Supporting elements and highlights 
  - `--secondary-50` through `--secondary-900` (light to dark)
  - Main secondary color: `--secondary-500: #F97316`

- **Neutral Colors (Gray)**: Text, backgrounds, and UI structure
  - `--neutral-50` through `--neutral-900` (light to dark)
  - Primary text: `--neutral-600: #4B5563`
  - Backgrounds: `--neutral-50: #F9FAFB` and `--neutral-100: #F3F4F6`

- **Accent Colors (Indigo)**: Special UI elements
  - `--accent-50` through `--accent-900` (light to dark)
  - Main accent color: `--accent-500: #6366F1`

## Typography System
The typography system in `assets/css/tokens/typography.css` includes language-specific font variables:

- **English and Russian**: 
  - `--font-heading-en` and `--font-heading-ru`: 'PT Serif', Georgia, serif
  - `--font-body-en` and `--font-body-ru`: 'PT Sans', Arial, sans-serif

- **Chinese**: 
  - `--font-heading-zh`: 'Noto Serif SC', 'Songti SC', 'FangSong', 'STSong', serif
  - `--font-body-zh`: 'Noto Sans SC', 'PingFang SC', 'Microsoft YaHei', sans-serif

- **Default variables** that change based on page language:
  - `--font-heading`: Maps to language-specific heading font
  - `--font-body`: Maps to language-specific body font
  - `--font-ui`: Typically same as body font

## Spacing System
The spacing system in `assets/css/tokens/spacing.css` uses a consistent scale:

- `--space-1` through `--space-20`  
- Each value is calculated as a multiple of the base size (0.25rem)
- Example: `--space-4: 1rem` (4 × 0.25rem)

## Breakpoints
Responsive breakpoints in `assets/css/tokens/breakpoints.css`:

- `--breakpoint-sm`: 640px
- `--breakpoint-md`: 768px 
- `--breakpoint-lg`: 1024px
- `--breakpoint-xl`: 1280px
- `--breakpoint-2xl`: 1536px