# Founder Cards Layout Testing - Visual Debugging Toolkit

## Purpose
Comprehensive debugging tools for investigating founder cards carousel layout issues, specifically the "4 cramped cards vs single large card per slide" problem.

## Quick Start
1. Add the CSS, JavaScript, and HTML below to any test page
2. Use debug buttons to toggle visual overlays
3. Use console measurements for detailed analysis

---

## CSS - Visual Debugging Styles

Add this to your `<style>` section:

```css
/* =================================
   VISUAL DEBUGGING TOOLKIT
   ================================= */

/* Color-coded element debugging */
.debug-layout .founder-card__portrait {
  background: rgba(0, 255, 0, 0.3) !important;
  border: 3px solid green !important;
  position: relative;
}

.debug-layout .founder-card__portrait::before {
  content: 'PORTRAIT';
  position: absolute;
  top: 5px;
  left: 5px;
  background: green;
  color: white;
  padding: 2px 5px;
  font-size: 10px;
  z-index: 1000;
}

.debug-layout .founder-card__content {
  background: rgba(255, 0, 0, 0.3) !important;
  border: 3px solid red !important;
  position: relative;
}

.debug-layout .founder-card__content::before {
  content: 'CONTENT';
  position: absolute;
  top: 5px;
  left: 5px;
  background: red;
  color: white;
  padding: 2px 5px;
  font-size: 10px;
  z-index: 1000;
}

.debug-layout .founder-card--featured {
  background: rgba(0, 0, 255, 0.2) !important;
  border: 4px solid blue !important;
  position: relative;
}

.debug-layout .founder-card--featured::before {
  content: 'FEATURED VARIANT';
  position: absolute;
  top: -25px;
  left: 0;
  background: blue;
  color: white;
  padding: 2px 8px;
  font-size: 12px;
  font-weight: bold;
  z-index: 1000;
}

.debug-layout .founder-card--standard {
  background: rgba(128, 0, 128, 0.2) !important;
  border: 3px solid purple !important;
  position: relative;
}

.debug-layout .founder-card--standard::before {
  content: 'STANDARD VARIANT';
  position: absolute;
  top: -25px;
  left: 0;
  background: purple;
  color: white;
  padding: 2px 8px;
  font-size: 12px;
  font-weight: bold;
  z-index: 1000;
}

/* Carousel debugging */
.debug-layout .carousel {
  background: rgba(255, 165, 0, 0.2) !important;
  border: 3px dashed orange !important;
  position: relative;
}

.debug-layout .carousel::before {
  content: 'CAROUSEL CONTAINER';
  position: absolute;
  top: -25px;
  left: 0;
  background: orange;
  color: white;
  padding: 2px 8px;
  font-size: 12px;
  font-weight: bold;
  z-index: 1000;
}

.debug-layout .carousel__item {
  background: rgba(255, 255, 0, 0.3) !important;
  border: 2px solid yellow !important;
  position: relative;
}

.debug-layout .carousel__item::before {
  content: 'CAROUSEL ITEM';
  position: absolute;
  top: 5px;
  right: 5px;
  background: #f59e0b;
  color: white;
  padding: 2px 5px;
  font-size: 10px;
  z-index: 1000;
}

/* Grid debugging */
.debug-grid .founder-card {
  position: relative;
}

.debug-grid .founder-card::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: 
    linear-gradient(to right, rgba(255, 0, 0, 0.1) 1px, transparent 1px),
    linear-gradient(to bottom, rgba(255, 0, 0, 0.1) 1px, transparent 1px);
  background-size: 20px 20px;
  pointer-events: none;
  z-index: 999;
}

/* Measurement rulers */
.debug-ruler .founder-card--featured::before {
  content: '← 0 100px 200px 300px 400px 500px 600px 700px 800px →';
  display: block;
  font-size: 8px;
  color: red;
  font-family: monospace;
  background: rgba(255, 255, 255, 0.9);
  padding: 2px;
  margin-bottom: 5px;
}
```

---

## JavaScript - Debugging Functions

Add this to your `<script>` section:

```javascript
/* =================================
   DEBUGGING JAVASCRIPT
   ================================= */

// Enhanced debugging functions for founder cards
let founderDebugState = {
  layout: false,
  grid: false,
  ruler: false,
  measurements: false
};

function toggleFounderDebugLayout() {
  founderDebugState.layout = !founderDebugState.layout;
  document.body.classList.toggle('debug-layout', founderDebugState.layout);
  console.log('Founder Layout debug:', founderDebugState.layout ? 'ON' : 'OFF');
}

function toggleFounderDebugGrid() {
  founderDebugState.grid = !founderDebugState.grid;
  document.body.classList.toggle('debug-grid', founderDebugState.grid);
  console.log('Founder Grid debug:', founderDebugState.grid ? 'ON' : 'OFF');
}

function toggleFounderDebugRuler() {
  founderDebugState.ruler = !founderDebugState.ruler;
  document.body.classList.toggle('debug-ruler', founderDebugState.ruler);
  console.log('Founder Ruler debug:', founderDebugState.ruler ? 'ON' : 'OFF');
}

function reportFounderCardMeasurements() {
  console.group('🔍 Founder Card Measurement Report');
  
  // Find all founder cards on page
  const founderCards = document.querySelectorAll('.founder-card');
  console.log(`Found ${founderCards.length} founder cards on page`);
  
  founderCards.forEach((card, index) => {
    console.group(`Card ${index + 1}:`);
    
    const rect = card.getBoundingClientRect();
    const styles = window.getComputedStyle(card);
    const variant = card.classList.contains('founder-card--featured') ? 'FEATURED' : 'STANDARD';
    
    console.log('Variant:', variant);
    console.log('Dimensions:', {
      width: rect.width,
      height: rect.height,
      display: styles.display,
      flexDirection: styles.flexDirection
    });
    
    // Check for portrait and content areas
    const portrait = card.querySelector('.founder-card__portrait');
    const content = card.querySelector('.founder-card__content');
    
    if (portrait) {
      const portraitRect = portrait.getBoundingClientRect();
      const portraitStyles = window.getComputedStyle(portrait);
      console.log('Portrait:', {
        width: portraitRect.width,
        height: portraitRect.height,
        flex: portraitStyles.flex,
        flexBasis: portraitStyles.flexBasis
      });
    }
    
    if (content) {
      const contentRect = content.getBoundingClientRect();
      const contentStyles = window.getComputedStyle(content);
      console.log('Content:', {
        width: contentRect.width,
        height: contentRect.height,
        flex: contentStyles.flex,
        paddingLeft: contentStyles.paddingLeft
      });
    }
    
    console.groupEnd();
  });
  
  // Check carousel behavior
  const carousels = document.querySelectorAll('.carousel');
  console.log(`\nFound ${carousels.length} carousels`);
  
  carousels.forEach((carousel, index) => {
    const items = carousel.querySelectorAll('.carousel__item, .founder-card');
    console.log(`Carousel ${index + 1}: ${items.length} items`);
    
    items.forEach((item, itemIndex) => {
      const itemRect = item.getBoundingClientRect();
      const itemStyles = window.getComputedStyle(item);
      console.log(`  Item ${itemIndex + 1}:`, {
        width: itemRect.width,
        display: itemStyles.display,
        flex: itemStyles.flex
      });
    });
  });
  
  console.groupEnd();
  
  alert('Founder card measurements logged to console. Check browser dev tools for detailed analysis.');
}

// Auto-initialize debugging
document.addEventListener('DOMContentLoaded', function() {
  console.log('🔧 Founder Cards Visual Debugging Toolkit loaded');
  
  // Report initial state
  setTimeout(reportFounderCardMeasurements, 1000);
});
```

---

## HTML - Debug Control Buttons

Add these debug buttons to your test page:

```html
<div style="display: flex; gap: 1rem; margin: 1rem 0; flex-wrap: wrap;">
  <button onclick="toggleFounderDebugLayout()" style="background: #22c55e; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Layout Debug</button>
  <button onclick="toggleFounderDebugGrid()" style="background: #3b82f6; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Grid Debug</button>
  <button onclick="toggleFounderDebugRuler()" style="background: #f59e0b; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Toggle Ruler Debug</button>
  <button onclick="reportFounderCardMeasurements()" style="background: #ef4444; color: white; padding: 0.5rem 1rem; border: none; border-radius: 0.25rem; cursor: pointer;">Measure Cards</button>
</div>
```

---

## Usage Instructions

### Visual Debug Modes

1. **Layout Debug (Green Button)**: 
   - Highlights card elements with colored overlays
   - Shows variant types (FEATURED vs STANDARD)
   - Identifies carousel containers and items

2. **Grid Debug (Blue Button)**:
   - Overlays measurement grid on cards
   - Helps identify spacing and alignment issues

3. **Ruler Debug (Orange Button)**:
   - Shows pixel measurements on featured cards
   - Useful for precise layout analysis

4. **Measure Cards (Red Button)**:
   - Logs detailed measurements to browser console
   - Reports dimensions, flex properties, and layout details

### Console Analysis

After clicking "Measure Cards", check browser dev tools console for:
- Card dimensions and variants
- Portrait vs content area measurements
- Carousel item sizing
- Flex layout properties

### Troubleshooting Common Issues

**Problem**: 4 cramped cards instead of 1 large card per slide
- **Check**: Carousel container width and flex settings
- **Look for**: Cards with `flex: 0 0 25%` instead of `flex: 0 0 100%`

**Problem**: Navigation dots not functional  
- **Check**: JavaScript targeting correct card classes
- **Look for**: `.founder-card--featured` vs other class names

**Problem**: Cards not displaying as featured variant
- **Check**: `variant="featured"` parameter in includes
- **Look for**: CSS `.founder-card--featured` styles applied

---

## Example Test Page Structure

```html
<!DOCTYPE html>
<html>
<head>
  <title>Founder Cards Debug</title>
  <!-- Include site CSS -->
</head>
<body>
  
  <!-- Debug Buttons -->
  <div style="display: flex; gap: 1rem; margin: 1rem 0; flex-wrap: wrap;">
    <button onclick="toggleFounderDebugLayout()">Toggle Layout Debug</button>
    <button onclick="toggleFounderDebugGrid()">Toggle Grid Debug</button>
    <button onclick="toggleFounderDebugRuler()">Toggle Ruler Debug</button>
    <button onclick="reportFounderCardMeasurements()">Measure Cards</button>
  </div>
  
  <!-- Test the problematic carousel -->
  {% include pages/home/founder-focus.html %}
  
  <!-- Add debugging CSS and JS here -->
  <style>
    /* Copy CSS from above */
  </style>
  
  <script>
    /* Copy JavaScript from above */
  </script>
  
</body>
</html>
```

---

## Expected Results

With the fixed unified architecture, you should see:
- **Single large founder cards** per carousel slide (not 4 cramped ones)
- **Functional navigation dots** that change slides
- **Consistent featured variant styling** with large portraits
- **Console measurements** showing `width: 400px` max per featured card

This toolkit will help identify any remaining layout issues and verify the carousel displays correctly.