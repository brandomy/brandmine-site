# Brandmine Color Palette & Usage Guide

## Brand Identity Colors

### Primary Teal
- **Purpose:** Main brand color, navigation, primary actions
- **Palette:** `--primary-50` to `--primary-900`
- **Key Colors:** `--primary-400` (#38B2AC) brand color, `--primary-700` dark text
- **Usage:** Headers, buttons, links, brand elements

### Secondary Orange
- **Purpose:** Accent color, call-to-action elements
- **Palette:** `--secondary-50` to `--secondary-900`
- **Key Colors:** `--secondary-500` (#F97316) accent, `--secondary-800` dark text
- **Usage:** Secondary buttons, highlights, urgent elements

### Neutral Gray
- **Purpose:** Text, backgrounds, borders
- **Palette:** `--neutral-50` to `--neutral-900`
- **Key Colors:** `--neutral-100` light bg, `--neutral-700` body text, `--neutral-900` headings
- **Usage:** Text content, backgrounds, subtle borders

## Discovery Dimensions Color System

Visual taxonomy uses consistent color-coding for all discovery interfaces:

### Sectors → Olive Green
- **Palette:** `--olive-50` to `--olive-900`
- **Usage:** Industry categories (Wine, Hotels, Artisanal Spirits, etc.)
- **Implementation:** Background `--olive-100`, Text `--olive-800`

### Markets → Sky Blue
- **Palette:** `--sky-50` to `--sky-900`
- **Usage:** Geographic regions (Russia, China, Brazil, etc.)
- **Implementation:** Background `--sky-100`, Text `--sky-800`

### Attributes → Secondary Orange
- **Palette:** `--secondary-*` (reuses brand secondary)
- **Usage:** Brand qualities (Founder-led, Heritage Brand, etc.)
- **Implementation:** Background `--secondary-100`, Text `--secondary-800`

### Signals → Accent Indigo
- **Palette:** `--accent-50` to `--accent-900`
- **Usage:** Growth indicators (Export Ready, Franchise Ready, etc.)
- **Implementation:** Background `--accent-100`, Text `--accent-800`

## Insights Categories

### Brand Spotlight → Amber/Gold
- **Palette:** `--amber-50` to `--amber-900`
- **Theme:** Premium, spotlight effect
- **Implementation:** Background `--amber-100`, Text `--amber-800`

### Founder's Journey → Accent Purple
- **Palette:** `--accent-*` (reuses signal colors)
- **Theme:** Personal stories, human connection
- **Implementation:** Background `--accent-100`, Text `--accent-800`

### Market Momentum → Olive Green
- **Palette:** `--olive-*` (reuses sector colors)
- **Theme:** Growth, market activity
- **Implementation:** Background `--olive-100`, Text `--olive-800`

### Location Intelligence → Sky Blue
- **Palette:** `--sky-*` (reuses market colors)
- **Theme:** Geographic insights, spatial context
- **Implementation:** Background `--sky-100`, Text `--sky-800`

## Color Assignment Reference

| Category | Type | Primary Color | CSS Property | Light BG | Dark Text |
|----------|------|---------------|--------------|----------|-----------|
| **Dimensions** | | | | | |
| Sectors | Olive Green | `#A3B763` | `--olive-*` | `--olive-100` | `--olive-800` |
| Markets | Sky Blue | `#0EA5E9` | `--sky-*` | `--sky-100` | `--sky-800` |
| Attributes | Secondary Orange | `#F97316` | `--secondary-*` | `--secondary-100` | `--secondary-800` |
| Signals | Accent Indigo | `#6366F1` | `--accent-*` | `--accent-100` | `--accent-800` |
| **Insights** | | | | | |
| Brand Spotlight | Amber/Orange | `#F59E0B` | `--secondary-*` | `--secondary-100` | `--secondary-800` |
| Founder's Journey | Accent Purple | `#6366F1` | `--accent-*` | `--accent-100` | `--accent-800` |
| Market Momentum | Olive Green | `#A3B763` | `--olive-*` | `--olive-100` | `--olive-800` |
| Location Intelligence | Sky Blue | `#0EA5E9` | `--sky-*` | `--sky-100` | `--sky-800` |

## Special Purpose Colors

### Journal Hero Gradients
Scientifically harmonious colors for journal post heroes:
- **Blue:** `--journal-blue-light` (#4DD4E8) / `--journal-blue-dark` (#2B9BAD)
- **Green:** `--journal-green-light` (#48CC6C) / `--journal-green-dark` (#2D8A47)
- **Purple:** Uses existing `--accent-400` / `--accent-700`
- **Coral:** `--journal-coral-light` (#FF7A85) / `--journal-coral-dark` (#D63447)
- **Sage:** `--journal-sage-light` (#9DB87A) / `--journal-sage-dark` (#6B8142)
- **Slate:** Uses existing `--neutral-600` / `--neutral-800`

## Usage Rules

### Design Token Requirements
- **Always use CSS custom properties:** `var(--primary-500)`
- **Never hardcode colors:** No hex values (#38B2AC) in CSS
- **Exceptions:** Social media brand colors only

### Semantic Assignment
- **Base components:** Primary teal
- **Dimension tags:** Respective taxonomy color
- **Insights cards:** Category-specific color
- **Text hierarchy:** Neutral grays

### Accessibility Standards
- All color combinations meet **WCAG AA contrast** (4.5:1 minimum)
- Text colors standardized to `800` variants for optimal readability across all dimensions
- Interactive elements maintain sufficient contrast

## Designer Guidelines

### Color Palette Export
```
Primary Teal: #38B2AC
Secondary Orange: #F97316
Neutral Gray: #6B7280
Olive Green: #A3B763
Sky Blue: #0EA5E9
Accent Indigo: #6366F1
Amber Gold: #F59E0B
```

### Usage Context
- **Brand identity:** Primary teal dominates
- **Content categorization:** Taxonomy colors provide clear visual organization
- **Information hierarchy:** Neutral grays ensure readability
- **Action elements:** Secondary orange draws attention

This system ensures visual consistency while supporting Brandmine's mission to illuminate BRICS+ brands through clear, accessible design.