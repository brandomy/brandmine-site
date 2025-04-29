# Brandmine Color Palette Guide

## Overview

The Brandmine color system consists of four color families that work together to create a cohesive and professional visual identity. Our implementation uses vanilla CSS with CSS custom properties (variables) to ensure consistent application across the site.

- **Primary Colors (Teal)** - Main brand identity, CTAs, and navigation
- **Secondary Colors (Orange)** - Supporting elements and highlights
- **Neutral Colors (Gray)** - Text, backgrounds, and UI structure
- **Accent Colors (Indigo)** - Special UI elements and added visual interest

## Color Families

### Primary Colors (Teal)

| Name | Hex Code | CSS Variable | Usage |
|------|----------|----------|-------|
| primary-50 | #E6FFFA | --primary-50 | Very light backgrounds, hover states |
| primary-100 | #B2F5EA | --primary-100 | Light backgrounds, dividers |
| primary-200 | #81E6D9 | --primary-200 | Light UI elements |
| primary-300 | #4FD1C5 | --primary-300 | Light accents, success indicators |
| primary-400 | #38B2AC | --primary-400 | **Primary brand color, main buttons** |
| primary-500 | #319795 | --primary-500 | Alternate primary, deeper variation |
| primary-600 | #2C7A7B | --primary-600 | Primary dark, button hover |
| primary-700 | #285E61 | --primary-700 | Dark accents, active states |
| primary-800 | #234E52 | --primary-800 | Very dark accents |
| primary-900 | #1D4044 | --primary-900 | Darkest brand color |

### Secondary Colors (Orange)

| Name | Hex Code | Tailwind | Usage |
|------|----------|----------|-------|
| secondary-50 | #FFF7ED | --secondary-50 | Very light secondary backgrounds |
| secondary-100 | #FFEDD5 | --secondary-100 | Light secondary elements |
| secondary-200 | #FED7AA | --secondary-200 | Light emphasis |
| secondary-300 | #FDBA74 | --secondary-300 | Secondary accents |
| secondary-400 | #FB923C | --secondary-400 | Secondary elements |
| secondary-500 | #F97316 | --secondary-500 | **Main secondary color** |
| secondary-600 | #EA580C | --secondary-600 | Darker secondary, hover states |
| secondary-700 | #C2410C | --secondary-700 | Dark emphasis |
| secondary-800 | #9A3412 | --secondary-800 | Very dark secondary |
| secondary-900 | #7C2D12 | --secondary-900 | Darkest secondary shade |

### Neutral Colors (Gray)

| Name | Hex Code | Tailwind | Usage |
|------|----------|----------|-------|
| neutral-50 | #F9FAFB | --neutral-50 | Page backgrounds |
| neutral-100 | #F3F4F6 | --neutral-100 | Card backgrounds, light mode UI |
| neutral-200 | #E5E7EB | --neutral-200 | Borders, dividers |
| neutral-300 | #D1D5DB | --neutral-300 | Disabled buttons, secondary borders |
| neutral-400 | #9CA3AF | --neutral-400 | Placeholder text, disabled text |
| neutral-500 | #6B7280 | --neutral-500 | Secondary text, icons |
| neutral-600 | #4B5563 | --neutral-600 | **Primary text** |
| neutral-700 | #374151 | --neutral-700 | Headings, emphasized text |
| neutral-800 | #1F2937 | --neutral-800 | Dark mode backgrounds, deep text |
| neutral-900 | #111827 | --neutral-900 | Darkest text, footers |

### Accent Colors (Indigo)

| Name | Hex Code | Tailwind | Usage |
|------|----------|----------|-------|
| accent-50 | #EEF2FF | --accent-50 | Very light accent backgrounds |
| accent-100 | #E0E7FF | --accent-100 | Light accent elements |
| accent-200 | #C7D2FE | --accent-200 | Light accent UI |
| accent-300 | #A5B4FC | --accent-300 | Light accent highlights |
| accent-400 | #818CF8 | --accent-400 | Accent elements |
| accent-500 | #6366F1 | --accent-500 | **Main accent color** |
| accent-600 | #4F46E5 | --accent-600 | Darker accent, hover states |
| accent-700 | #4338CA | --accent-700 | Dark accents |
| accent-800 | #3730A3 | --accent-800 | Very dark accent |
| accent-900 | #312E81 | --accent-900 | Darkest accent shade |

## Color Application Guide

### Primary Color (Vibrant Teal)
Use the primary teal color (`#38B2AC`, teal-400) for main brand elements, CTAs, and primary navigation. This vibrant teal establishes your brand identity with increased visual energy that resonates well in Global South markets while maintaining professionalism.

### Secondary Color (Coral/Orange)
Use the secondary orange color (`#F97316`, orange-500) for supporting elements, secondary buttons, and highlighting important information. This vibrant orange creates an energetic contrast with teal and resonates strongly in Global South markets where warm colors symbolize positivity and vitality.

### Accent Color (Indigo)
Use the accent indigo color (`#6366F1`, indigo-500) sparingly for special UI elements, links, or to draw attention to specific content. It adds visual interest without overwhelming the design.

### Neutral Colors (Gray)
Use neutral gray colors for text, backgrounds, borders, and other UI elements. They provide structure and readability to your interface:
- Text: neutral-600 (`#4B5563`)
- Headings: neutral-700 (`#374151`)
- Backgrounds: neutral-50 (`#F9FAFB`)
- Card backgrounds: neutral-100 (`#F3F4F6`)
- Borders and dividers: neutral-200 (`#E5E7EB`)

## UI Component Examples

### Buttons

##### Primary Button
- Normal: `var(--primary-400)` (`#38B2AC`) with white text
- Hover: `var(--primary-300)` (`#4FD1C5`) with darker text
- Active/Pressed: `var(--primary-500)` (`#319795`) with white text
- Disabled: `var(--primary-100)` (`#B2F5EA`) with `var(--neutral-400)` (`#9CA3AF`) text

#### Secondary Button
- Normal: `var(--secondary-500)` (`#F97316`) with white text
- Hover: `var(--secondary-400)` (`#FB923C`) with `var(--secondary-900)` text
- Active/Pressed: `var(--secondary-600)` (`#EA580C`) with white text
- Disabled: `var(--secondary-100)` (`#FFEDD5`) with `var(--neutral-400)` (`#9CA3AF`) text

## Vanilla CSS Implementation

For our Jekyll-based implementation, we'll use CSS custom properties (variables) to define our color palette. This approach offers several advantages:

1. **Simplicity** - No build process or dependencies required
2. **Browser Support** - Excellent support in all modern browsers
3. **Maintainability** - Easy to update colors in one place
4. **Performance** - Lightweight solution with minimal overhead

Here's how to implement the Brandmine color palette using vanilla CSS:
```

### Step 1: Define Color Variables

Create a file named `basic-colors.css` in your Jekyll site's assets directory (typically at `assets/css/basic-colors.css`) and define the color palette using CSS custom properties:

```css
:root {
  /* Primary colors (Teal) */
  --primary-50: #E6FFFA;
  --primary-100: #B2F5EA;
  --primary-200: #81E6D9;
  --primary-300: #4FD1C5;
  --primary-400: #38B2AC; /* Primary brand color */
  --primary-500: #319795;
  --primary-600: #2C7A7B;
  --primary-700: #285E61;
  --primary-800: #234E52;
  --primary-900: #1D4044;

  /* Secondary colors (Orange) */
  --secondary-50: #FFF7ED;
  --secondary-100: #FFEDD5;
  --secondary-200: #FED7AA;
  --secondary-300: #FDBA74;
  --secondary-400: #FB923C;
  --secondary-500: #F97316; /* Main secondary color */
  --secondary-600: #EA580C;
  --secondary-700: #C2410C;
  --secondary-800: #9A3412;
  --secondary-900: #7C2D12;

  /* Neutral colors (Gray) */
  --neutral-50: #F9FAFB;
  --neutral-100: #F3F4F6;
  --neutral-200: #E5E7EB;
  --neutral-300: #D1D5DB;
  --neutral-400: #9CA3AF;
  --neutral-500: #6B7280;
  --neutral-600: #4B5563; /* Primary text */
  --neutral-700: #374151;
  --neutral-800: #1F2937;
  --neutral-900: #111827;

  /* Accent colors (Indigo) */
  --accent-50: #EEF2FF;
  --accent-100: #E0E7FF;
  --accent-200: #C7D2FE;
  --accent-300: #A5B4FC;
  --accent-400: #818CF8;
  --accent-500: #6366F1; /* Main accent color */
  --accent-600: #4F46E5;
  --accent-700: #4338CA;
  --accent-800: #3730A3;
  --accent-900: #312E81;
}
```

### Step 2: Include the CSS File

In your Jekyll layout file (typically `_layouts/default.html`), include the CSS file in the `<head>` section:

```html
<head>
  <!-- Other head elements like meta tags -->
  <link rel="stylesheet" href="{{ '/assets/css/basic-colors.css' | relative_url }}">
  <!-- Other stylesheets -->
</head>
```

### Step 3: Use the Color Variables

With the color variables defined, you can use them throughout your CSS:

```css
/* Example usage in your main.css or directly in layout files */

/* Basic elements */
body {
  color: var(--neutral-600);
  background-color: var(--neutral-50);
}

h1, h2, h3, h4, h5, h6 {
  color: var(--neutral-700);
}

a {
  color: var(--primary-600);
  text-decoration: none;
}

a:hover {
  color: var(--primary-500);
}

/* Components */
.site-header {
  background-color: var(--primary-400);
  color: white;
}

.btn-primary {
  background-color: var(--primary-400);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 0.25rem;
  border: none;
  cursor: pointer;
}

.btn-primary:hover {
  background-color: var(--primary-300);
}

.btn-secondary {
  background-color: var(--secondary-500);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 0.25rem;
  border: none;
  cursor: pointer;
}

.btn-secondary:hover {
  background-color: var(--secondary-400);
}

.card {
  background-color: white;
  border: 1px solid var(--neutral-200);
  border-radius: 0.5rem;
  padding: 1.5rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}
```

## Component Library

Below are some common components you can create using the Brandmine color palette in vanilla CSS:

### Buttons

```css
/* Primary Button */
.btn-primary {
  background-color: var(--primary-400);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 0.25rem;
  font-weight: 600;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s;
}

.btn-primary:hover {
  background-color: var(--primary-300);
}

.btn-primary:active {
  background-color: var(--primary-500);
}

.btn-primary:disabled {
  background-color: var(--primary-100);
  color: var(--neutral-400);
  cursor: not-allowed;
}

/* Secondary Button */
.btn-secondary {
  background-color: var(--secondary-500);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 0.25rem;
  font-weight: 600;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s;
}

.btn-secondary:hover {
  background-color: var(--secondary-400);
}

.btn-secondary:active {
  background-color: var(--secondary-600);
}

.btn-secondary:disabled {
  background-color: var(--secondary-100);
  color: var(--neutral-400);
  cursor: not-allowed;
}

/* Outline Button */
.btn-outline {
  background-color: transparent;
  color: var(--primary-600);
  padding: 0.5rem 1rem;
  border-radius: 0.25rem;
  font-weight: 600;
  border: 1px solid var(--primary-600);
  cursor: pointer;
  transition: all 0.3s;
}

.btn-outline:hover {
  background-color: var(--primary-50);
}

.btn-outline:active {
  background-color: var(--primary-100);
}
```

### Cards

```css
/* Basic Card */
.card {
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  padding: 1.5rem;
  margin-bottom: 1.5rem;
  border: 1px solid var(--neutral-200);
}

.card-title {
  color: var(--neutral-700);
  font-size: 1.25rem;
  margin-top: 0;
  margin-bottom: 1rem;
}

/* Feature Card */
.feature-card {
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  padding: 1.5rem;
  margin-bottom: 1.5rem;
  border-top: 4px solid var(--primary-400);
}

/* Info Card */
.info-card {
  background-color: var(--primary-50);
  border-radius: 0.5rem;
  padding: 1.5rem;
  margin-bottom: 1.5rem;
  border-left: 4px solid var(--primary-400);
}
```

### Alerts

```css
/* Success Alert */
.alert-success {
  background-color: #ECFDF5; /* Green 50 */
  border-left: 4px solid #10B981; /* Green 500 */
  padding: 1rem 1.5rem;
  border-radius: 0.25rem;
  margin-bottom: 1rem;
}

/* Warning Alert */
.alert-warning {
  background-color: var(--secondary-50);
  border-left: 4px solid var(--secondary-500);
  padding: 1rem 1.5rem;
  border-radius: 0.25rem;
  margin-bottom: 1rem;
}

/* Error Alert */
.alert-error {
  background-color: #FEF2F2; /* Red 50 */
  border-left: 4px solid #EF4444; /* Red 500 */
  padding: 1rem 1.5rem;
  border-radius: 0.25rem;
  margin-bottom: 1rem;
}
```

## Color Strategy for Global South Markets

The Brandmine color palette has been strategically chosen to:

1. **Communicate professionalism** through the teal primary color
2. **Evoke energy and vitality** with the orange secondary color
3. **Resonate with Global South audiences** through vibrant yet trustworthy colors
4. **Create visual distinction** from competitors in the market
5. **Maintain flexibility** for different contexts through comprehensive shade ranges

Consistent application of this color palette will help establish strong brand recognition and create a cohesive visual experience across all Brandmine touchpoints.

## Jekyll Integration Guidelines

When implementing this color system in your Jekyll site, follow these best practices:

1. **Single Source of Truth**: Keep all color definitions in one file (`basic-colors.css`) and include it in your default layout.

2. **Component Classes**: Create reusable CSS classes for common components like buttons, cards, and alerts.

3. **Documentation Comments**: Add comments in your CSS to explain the purpose and usage of different color variables.

4. **Maintainable Structure**: Organize your CSS logically with sections for variables, base elements, and components.

5. **Responsive Design**: Use the color system consistently across different screen sizes to maintain brand cohesion.

By following these guidelines, you'll create a maintainable and scalable color system that provides a professional foundation for your Brandmine MVP.
