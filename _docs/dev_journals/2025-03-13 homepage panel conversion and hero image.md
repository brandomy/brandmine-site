# 2025-03-13 Development Journal: Homepage Panel Conversion and Hero Image Implementation

## 1. Problem Statement

We needed to improve the visual presentation and user experience of the Brandmine homepage by addressing several issues:

- **Visual Inconsistency**: The homepage had a different design language than the About page, which used a full-width panel system.
- **Limited Visual Impact**: The homepage lacked a strong visual element to capture visitor attention.
- **Too Much White Space**: The content areas appeared disconnected with excessive white space.
- **Unbalanced Layout**: Panel headings had inconsistent spacing, creating an unbalanced appearance.
- **Contact Functionality**: The "Get in on the Ground Floor" button used a basic email link rather than a more effective contact form.
- **Multilingual Support**: Changes needed to work consistently across English, Russian, and Chinese versions.

## 2. Approach

We decided to implement a comprehensive redesign that included:

1. **Adopting the Full-Width Panel System**: Converting the homepage to use the same panel-based layout as the About page for consistency.
2. **Adding a Hero Image**: Creating a visually striking hero section with a background image related to BRICS+ products.
3. **Implementing a Scroll Indicator**: Adding a subtle indicator to encourage users to scroll for more content.
4. **Applying Brand Colors**: Using brand colors (teal, orange, indigo) more effectively throughout the panels.
5. **Optimizing Content Spacing**: Improving the balance of whitespace and content density.
6. **Enhancing the CTA**: Replacing email links with Tally popup forms for better conversion potential.
7. **Maintaining Multilingual Parity**: Ensuring all improvements worked across all language versions.

## 3. Implementation Details

### 3.1 Full-Width Panel HTML Structure

We converted each section of content into a panel with a consistent structure:

```html
<!-- Panel Template -->
<div class="full-width-panel [panel-type-class]">
  <div class="panel-content">
    <h2>Section Title</h2>
    <p>Section content...</p>
  </div>
</div>
```

### 3.2 Hero Image Panel Implementation

```html
<!-- Hero Image Panel -->
<div class="full-width-panel hero-image-panel">
  <div class="hero-background"></div>
  <div class="panel-content centered">
    <h1>Amplifying leading Brands of the BRICS+</h1>
    <p class="hero-subtitle">Discover the untapped potential of consumer brands from Brazil, Russia, India, China, South Africa, and beyond.</p>
  </div>
</div>
```

With corresponding CSS:

```css
.hero-image-panel {
  position: relative;
  min-height: 80vh;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  padding: 2rem 0 4rem 0;
  overflow: hidden;
  text-align: center;
  margin-bottom: 2rem;
}

.hero-background {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url('../images/hero/home-cover.jpg');
  background-size: cover;
  background-position: center;
  filter: brightness(0.7);
  z-index: 0;
}

/* Add a teal color overlay using your brand color */
.hero-background::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(56, 178, 172, 0.3); /* Teal overlay with 30% opacity */
  z-index: 1;
}
```

### 3.3 Scroll Indicator

```html
<!-- Add a Scroll Indicator -->
<div class="scroll-indicator">
  <span class="scroll-arrow">↓</span>
  <span class="scroll-text">Scroll to explore</span>
</div>
```

With CSS animation:

```css
.scroll-indicator {
  position: absolute;
  bottom: 40px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  flex-direction: column;
  align-items: center;
  color: white;
  text-shadow: 0 1px 3px rgba(0, 0, 0, 0.8);
  opacity: 0.9;
  transition: opacity 0.3s ease;
  cursor: default;
  z-index: 5;
}

.scroll-arrow {
  font-size: 1.5rem;
  animation: bounce 2s infinite;
}

@keyframes bounce {
  0%, 20%, 50%, 80%, 100% {
    transform: translateY(0);
  }
  40% {
    transform: translateY(-10px);
  }
  60% {
    transform: translateY(-5px);
  }
}
```

### 3.4 Panel Background Colors and Spacing

```css
/* Panel Background Enhancement */
.solution-panel {
  background-color: var(--primary-50);
  padding: 3rem 0;
}

.perspective-panel {
  background-color: var(--accent-50);
  padding: 3rem 0;
}

/* Improve content spacing */
.panel-content h2 {
  margin-top: 0;
  margin-bottom: 1.5rem;
}

/* Add stronger visual hierarchy */
.light-panel {
  background-color: white;
  padding: 3rem 0;
}

/* Increase top padding on first panel after hero */
.hero-image-panel + .light-panel {
  padding-top: 5rem;
}
```

### 3.5 Tally Form Popup Integration

```html
<!-- Script in head section -->
<script async src="https://tally.so/widgets/embed.js"></script>

<!-- Button with Tally attributes -->
<a href="#" class="btn btn-primary" data-tally-open="3qvVaY" data-tally-emoji-text="👋" data-tally-emoji-animation="wave">Get in on the Ground Floor</a>
```

### 3.6 CSS Conditional Loading

In `_layouts/default.html`:

```html
{% if page.permalink == '/en/' or page.permalink == '/ru/' or page.permalink == '/zh/' %}
<link rel="stylesheet" href="{{ '/assets/css/home.css' | relative_url }}">
{% endif %}
```

### 3.7 Home Page Class for Specific Styling

```html
<body class="{% if page.permalink == '/en/' or page.permalink == '/ru/' or page.permalink == '/zh/' %}home-page{% endif %}">
```

## 4. Decisions Made

### 4.1 Panel System vs. Traditional Layout

**Decision**: Use a full-width panel system rather than traditional content blocks.

**Rationale**: The panel system provides:
- Clear visual distinction between content sections
- Greater flexibility for applying background colors and imagery
- A more modern, scrollable user experience
- Consistency with the About page design

### 4.2 Hero Image vs. Hero Carousel 

**Decision**: Start with a static hero image, but provide a carousel implementation for future enhancement.

**Rationale**: 
- A static hero image provides immediate visual impact with minimal complexity
- It loads faster and is more reliable across browsers and devices
- Carousel code was provided as an artifact for future implementation

### 4.3 Color Application Strategy

**Decision**: Use brand colors as full panel backgrounds rather than only for accents.

**Rationale**:
- Creates more visual impact and reduces the "too much white" problem
- Helps users distinguish between different sections of content
- Reinforces brand identity throughout the page

### 4.4 Scroll Indicator Style

**Decision**: Use a simple arrow with text and subtle animation.

**Rationale**:
- Provides a non-intrusive cue that more content exists below the fold
- Animation draws attention without being distracting
- Text shadow provides contrast against varying backgrounds

### 4.5 Contact Form Implementation

**Decision**: Use Tally popup forms instead of mailto links.

**Rationale**:
- Keeps users on the site rather than opening email clients
- Provides a better user experience, especially on mobile
- Offers immediate feedback and confirmation
- Allows for data collection and tracking

### 4.6 CSS Organization

**Decision**: Use a dedicated home.css file loaded conditionally.

**Rationale**:
- Keeps homepage styles separate from global styles
- Only loads on pages that need it, improving performance
- Makes future maintenance easier

## 5. Resources

### 5.1 Multilingual Implementations

Complete index.html replacements were provided for:
- English (`/en/index.html`)
- Russian (`/ru/index.html`)
- Chinese (`/zh/index.html`)

### 5.2 Scroll Indicator Translations

| Language | Text |
|----------|------|
| English | Scroll to explore |
| Russian | Прокрутите вниз |
| Chinese | 向下滚动 |

### 5.3 Call-to-Action Button Translations

| Language | Text | Tally Form ID |
|----------|------|--------------|
| English | Get in on the Ground Floor | 3qvVaY |
| Russian | Стать частью нашего будущего | wov08x |
| Chinese | 把握先机 | nG5oOk |

### 5.4 Image Requirements

For the hero image:
- Minimum width: 1920px
- Optimal aspect ratio: 16:9
- Subject: Wine/BRICS+ products
- Location: `assets/images/hero/home-cover.jpg`

## 6. Insights & Learning

### 6.1 CSS Layout Techniques

- **Full-width Sections**: Using `width: 100vw` and negative margins to break out of container constraints
- **Overlay Techniques**: Creating color overlays with pseudo-elements and rgba colors
- **Visual Hierarchy**: Using consistent spacing, color, and typography to guide user attention

### 6.2 Jekyll-Specific Knowledge

- **Conditional Styling**: Using Liquid logic to apply different styles to specific pages
- **Language Handling**: Maintaining consistent structure across language variations
- **CSS Organization**: Separating page-specific styles from global styles

### 6.3 Design Principles

- **Consistent Visual Language**: Maintaining the same design patterns across pages
- **Color Psychology**: Using brand colors to reinforce messaging and section purpose
- **Responsive Considerations**: Ensuring good appearance across device sizes

### 6.4 External Tool Integration

- **Tally Forms**: Implementing popup forms for better user experience
- **Animation Techniques**: Using CSS animations for subtle interface cues

## 7. Next Actions

### 7.1 Immediate Implementation Tasks

- [ ] Prepare and optimize a high-quality hero image
- [ ] Create the `assets/images/hero/` directory 
- [ ] Implement CSS fixes for the scroll indicator cursor
- [ ] Fix the duplicate body tag in default.html
- [ ] Test all language versions on various devices

### 7.2 Future Enhancement Options

- [ ] Consider implementing the carousel version for rotating hero images
- [ ] Add subtle animation effects as users scroll through panels
- [ ] Create custom hero images for each language version
- [ ] Implement analytics to track user engagement with each panel
- [ ] A/B test the Tally form against other contact methods

### 7.3 Open Questions

- Should we eventually implement dark mode support for the panels?
- Would adding subtle parallax effects to the hero image enhance engagement?
- Should we consider using different hero images for different target markets?
- How can we optimize the hero image loading for performance?

This development journal documents our approach to redesigning the Brandmine homepage with a panel system and hero image, providing a comprehensive record of our implementation decisions and technical details.
