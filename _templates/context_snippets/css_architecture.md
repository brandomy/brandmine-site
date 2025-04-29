# Brandmine CSS Architecture

The CSS is organized in a modular structure with these key directories:

## 1. Token Files
Located in `assets/css/tokens/`, these define the design foundations:
- `colors.css`: Color system variables
- `typography.css`: Font families, sizes, and weights
- `spacing.css`: Spacing scale
- `breakpoints.css`: Responsive breakpoints

## 2. Layout Files
Located in `assets/css/layout/`:
- `panels.css`: Full-width content panels and containers

## 3. Component Files
Located in `assets/css/components/`:
- `buttons.css`: Button styles and variants
- `cards.css`: Card component styles
- `forms.css`: Form controls and inputs
- `hero-panels.css`: Hero section styles
- `navigation.css`: Site navigation components
- `tags.css`: Tag display and listing styles
- `team.css`: Team member profiles
- `text.css`: Typography implementations
- And others for specific UI components

## 4. Page-Specific Styles
Located in `assets/css/pages/`:
- `home.css`, `about.css`, `brands.css`, etc.
- These contain page-specific layouts and component arrangements

## 5. Global Styles
- `main.css`: Core styles and global resets

## 6. Style Guide
- `styleguide.css`: Styles for the design system documentation

## Naming Conventions
- BEM-inspired naming (Block__Element--Modifier)
- Utility classes for common adjustments
- Component-specific classes that follow the component name