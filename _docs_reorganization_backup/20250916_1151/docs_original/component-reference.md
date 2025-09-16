# Component Reference Guide

## 🎴 Founder Card Components

### Standard Founder Card
**File**: `_includes/components/cards/founder-card.html`
**Namespace**: `founder-card__*`
**Purpose**: Biographical founder profiles

#### Usage
```liquid
{% include components/cards/founder-card.html 
   founder=founder 
   variant="standard" %}
```

#### Available Variants
- `standard` - Default biographical display
- `featured` - Enhanced display with portrait for carousel use

#### CSS Structure
```scss
.founder-card {
  /* Base card styling */
}

.founder-card--variant {
  /* Variant modifications */
}

.founder-card__header {
  /* Header section */
}

.founder-card__content {
  /* Main content area */
}

.founder-card__footer {
  /* Footer/CTA section */
}
```

#### BEM Elements
- `.founder-card__name` - Founder's full name
- `.founder-card__position` - Job title/position
- `.founder-card__company-location` - Company and location info
- `.founder-card__description` - Brief bio
- `.founder-card__tags` - Expertise tags container
- `.founder-card__tag` - Individual expertise tag
- `.founder-card__link` - CTA link

### Featured Founder Card  
**File**: `_includes/components/cards/founder-card-featured.html`
**Namespace**: `founder-card-featured__*`
**Purpose**: Homepage carousel, prominent displays

#### Usage
```liquid
{% include components/cards/founder-card-featured.html 
   founder=founder %}
```

#### CSS Structure
```scss
.founder-card-featured {
  /* 50% portrait, 50% content layout */
}

.founder-card-featured__portrait {
  /* Portrait image container */
}

.founder-card-featured__content {
  /* Content side container */
}
```

#### BEM Elements
- `.founder-card-featured__name` - Founder's name
- `.founder-card-featured__position` - Title/position
- `.founder-card-featured__location` - Location with flag
- `.founder-card-featured__achievement` - Key achievement section
- `.founder-card-featured__description` - Biography text
- `.founder-card-featured__tags` - Expertise tags
- `.founder-card-featured__cta-button` - Meet founder CTA

### Quote Card
**File**: `_includes/components/cards/founder-quote-card.html`
**Namespace**: `founder-quote-card__*`
**Purpose**: Founder wisdom, testimonials

#### Usage
```liquid
{% include components/cards/founder-quote-card.html 
   quote=quote 
   founder=founder 
   style="hero" %}
```

#### Available Styles
- `hero` - Large, prominent display
- `inline` - Standard content integration
- `pullout` - Sidebar emphasis style

#### CSS Structure
```scss
.founder-quote-card {
  /* Base quote card */
}

.founder-quote-card--style {
  /* Style variants */
}
```

#### BEM Elements
- `.founder-quote-card__text` - Quote text
- `.founder-quote-card__context` - Quote context
- `.founder-quote-card__author` - Attribution section
- `.founder-quote-card__name` - Author name
- `.founder-quote-card__type-badge` - Quote type indicator

## 🎯 Development Standards Checklist

### Before Creating New Component
- [ ] Determine if separate component or variant needed
- [ ] Choose appropriate BEM namespace
- [ ] Plan CSS boundary compliance
- [ ] Design for multilingual support (EN/RU/ZH)

### During Development
- [ ] Follow established BEM patterns
- [ ] Maintain clean CSS boundaries
- [ ] Test across all three languages
- [ ] Validate responsive behavior

### Before Deployment
- [ ] Run boundary violation check
- [ ] Test component in various contexts
- [ ] Update documentation if needed
- [ ] Verify performance impact

## 📋 CSS Boundary Quick Reference

### ✅ Cards Should Handle
- Typography (font-size, font-weight, color)
- Internal spacing (padding)
- Colors and backgrounds
- Borders and border-radius
- Internal component layout

### ❌ Cards Should NOT Handle
- External spacing (margin)
- Grid/flex positioning
- Page-level layout
- Container widths
- z-index (unless internal to component)

### Example Boundary Check
```bash
# Check for boundary violations
grep -E "(margin:|grid-column:|flex-basis:)" assets/css/components/cards/your-card.scss

# Should return no results
```

## 🔧 Common Patterns

### Variant Implementation
```liquid
{% assign variant = include.variant | default: "standard" %}
<article class="component component--{{ variant }}">
  <!-- Component content -->
</article>
```

### Responsive Image Pattern
```liquid
{% include components/images/collection-image.html
   collection="founders"
   slug=founder.ref
   purpose="portrait"
   name=founder.images.portrait.name
   alt=founder.images.portrait.alt
   sizes="(max-width: 768px) 100vw, 400px" %}
```

### Translation Pattern
```liquid
{% include helpers/t.html 
   key="founder.key_achievement" 
   fallback="Key Achievement" %}
```

## 📚 Related Documentation

- **Technical Standards**: [technical-standards.md](technical-standards.md) - Architecture patterns
- **Setup & Workflows**: [setup-and-workflows.md](setup-and-workflows.md) - Development processes
- **Troubleshooting**: [troubleshooting-and-tools.md](troubleshooting-and-tools.md) - Common issues

---

**Last Updated**: July 2025 (Phase 1B BEM Standardization)