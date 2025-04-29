# Image Carousel Implementation for Brandmine Homepage

This document provides a complete implementation for adding an image carousel to your Brandmine homepage. The carousel will replace the static hero image with a rotating showcase of multiple images, each with its own headline and subtitle.

## Overview

The carousel implementation includes:

1. HTML structure for the carousel
2. CSS for styling the carousel and its controls
3. JavaScript for handling the carousel functionality
4. Implementation guide for integrating with your site

## 1. HTML Structure

Replace your hero section in `index.html` with this carousel structure:

```html
<!-- Hero Carousel Panel -->
<div class="full-width-panel hero-carousel-panel">
  <div class="carousel-container">
    <!-- Slide 1 -->
    <div class="carousel-slide active" id="slide-1">
      <div class="slide-background"></div>
      <div class="panel-content centered">
        <h1>Amplifying leading Brands of the BRICS+</h1>
        <p class="hero-subtitle">Discover the untapped potential of consumer brands from Brazil, Russia, India, China, South Africa, and beyond.</p>
      </div>
    </div>
    
    <!-- Slide 2 -->
    <div class="carousel-slide" id="slide-2">
      <div class="slide-background"></div>
      <div class="panel-content centered">
        <h2>Bridging Global Markets</h2>
        <p class="hero-subtitle">Connecting exceptional brands with international opportunities</p>
      </div>
    </div>
    
    <!-- Slide 3 -->
    <div class="carousel-slide" id="slide-3">
      <div class="slide-background"></div>
      <div class="panel-content centered">
        <h2>Breaking Through Barriers</h2>
        <p class="hero-subtitle">Overcoming language, cultural, and political challenges</p>
      </div>
    </div>
    
    <!-- Navigation Arrows -->
    <button class="carousel-button prev" aria-label="Previous slide">&#10094;</button>
    <button class="carousel-button next" aria-label="Next slide">&#10095;</button>
    
    <!-- Slide Indicators -->
    <div class="carousel-dots">
      <span class="dot active" data-slide="0" aria-label="Slide 1"></span>
      <span class="dot" data-slide="1" aria-label="Slide 2"></span>
      <span class="dot" data-slide="2" aria-label="Slide 3"></span>
    </div>
  </div>
</div>
```

## 2. CSS for Carousel

Create a new file called `carousel.css` in your `assets/css/` directory with the following content:

```css
/* Hero Carousel Styles */
.hero-carousel-panel {
  padding: 0;
  position: relative;
  overflow: hidden;
  height: 80vh;
}

.carousel-container {
  position: relative;
  height: 100%;
  width: 100%;
}

/* Carousel Slides */
.carousel-slide {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  transition: opacity 1s ease-in-out;
  display: flex;
  align-items: center;
  color: white;
  z-index: 1;
}

.carousel-slide.active {
  opacity: 1;
  z-index: 2;
}

.slide-background {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-size: cover;
  background-position: center;
  filter: brightness(0.7);
  z-index: 0;
}

/* Apply a teal overlay on each slide */
.slide-background::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(56, 178, 172, 0.3); /* Teal overlay with 30% opacity */
  z-index: 1;
}

/* Slide-specific backgrounds */
#slide-1 .slide-background {
  background-image: url('../images/hero/slide1.jpg');
}

#slide-2 .slide-background {
  background-image: url('../images/hero/slide2.jpg');
}

#slide-3 .slide-background {
  background-image: url('../images/hero/slide3.jpg');
}

.carousel-slide .panel-content {
  position: relative;
  z-index: 2;
  max-width: 800px;
  margin: 0 auto;
  text-align: center;
}

.carousel-slide h1,
.carousel-slide h2 {
  font-size: 3rem;
  margin-bottom: 1.5rem;
  text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
}

.carousel-slide .hero-subtitle {
  font-size: 1.5rem;
  font-weight: 300;
  max-width: 700px;
  margin: 0 auto 2rem;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
}

/* Navigation Arrows */
.carousel-button {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  z-index: 10;
  background: rgba(0, 0, 0, 0.3);
  color: white;
  border: none;
  font-size: 1.5rem;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  cursor: pointer;
  transition: background 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  outline: none;
}

.carousel-button:hover {
  background: rgba(0, 0, 0, 0.6);
}

.carousel-button:focus {
  box-shadow: 0 0 0 3px rgba(56, 178, 172, 0.5);
}

.carousel-button.prev {
  left: 20px;
}

.carousel-button.next {
  right: 20px;
}

/* Slide Indicators / Dots */
.carousel-dots {
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
  display: flex;
  gap: 10px;
}

.dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.5);
  cursor: pointer;
  transition: background 0.3s ease, transform 0.3s ease;
}

.dot:hover {
  background: rgba(255, 255, 255, 0.8);
}

.dot.active {
  background: white;
  transform: scale(1.2);
}

/* Responsive Adjustments */
@media (max-width: 768px) {
  .hero-carousel-panel {
    height: 60vh;
  }
  
  .carousel-slide h1,
  .carousel-slide h2 {
    font-size: 2rem;
  }
  
  .carousel-slide .hero-subtitle {
    font-size: 1.25rem;
  }
  
  .carousel-button {
    width: 40px;
    height: 40px;
    font-size: 1.2rem;
  }
}

@media (max-width: 480px) {
  .hero-carousel-panel {
    height: 50vh;
  }
  
  .carousel-slide h1,
  .carousel-slide h2 {
    font-size: 1.75rem;
  }
  
  .carousel-slide .hero-subtitle {
    font-size: 1rem;
  }
  
  .carousel-button {
    width: 35px;
    height: 35px;
    font-size: 1rem;
  }
  
  .carousel-button.prev {
    left: 10px;
  }
  
  .carousel-button.next {
    right: 10px;
  }
}
```

## 3. JavaScript for Carousel Functionality

Create a file called `carousel.js` in your `assets/js/` directory:

```javascript
document.addEventListener('DOMContentLoaded', function() {
  // Get carousel elements
  const slides = document.querySelectorAll('.carousel-slide');
  const dots = document.querySelectorAll('.dot');
  const prevButton = document.querySelector('.carousel-button.prev');
  const nextButton = document.querySelector('.carousel-button.next');
  
  // Initialize variables
  let currentSlide = 0;
  let slideInterval = setInterval(nextSlide, 5000); // Auto-advance every 5 seconds
  let isTransitioning = false;
  
  // Show a specific slide by index
  function showSlide(n) {
    // Prevent rapid clicking during transitions
    if (isTransitioning) return;
    isTransitioning = true;
    
    // Remove active class from all slides and dots
    slides.forEach(slide => slide.classList.remove('active'));
    dots.forEach(dot => dot.classList.remove('active'));
    
    // Calculate the current slide index
    currentSlide = (n + slides.length) % slides.length;
    
    // Add active class to current slide and dot
    slides[currentSlide].classList.add('active');
    dots[currentSlide].classList.add('active');
    
    // Reset the interval timer to prevent quick transitions
    clearInterval(slideInterval);
    slideInterval = setInterval(nextSlide, 5000);
    
    // Allow transitions again after animation completes
    setTimeout(() => {
      isTransitioning = false;
    }, 1000); // Match this to your CSS transition duration
  }
  
  // Navigate to next slide
  function nextSlide() {
    showSlide(currentSlide + 1);
  }
  
  // Navigate to previous slide
  function prevSlide() {
    showSlide(currentSlide - 1);
  }
  
  // Event listeners for buttons
  prevButton.addEventListener('click', function(e) {
    e.preventDefault();
    prevSlide();
  });
  
  nextButton.addEventListener('click', function(e) {
    e.preventDefault();
    nextSlide();
  });
  
  // Event listeners for dots
  dots.forEach((dot, index) => {
    dot.addEventListener('click', () => {
      showSlide(index);
    });
  });
  
  // Pause auto-rotation when mouse hovers over carousel
  const carouselContainer = document.querySelector('.carousel-container');
  
  carouselContainer.addEventListener('mouseenter', () => {
    clearInterval(slideInterval);
  });
  
  carouselContainer.addEventListener('mouseleave', () => {
    slideInterval = setInterval(nextSlide, 5000);
  });
  
  // Keyboard navigation
  document.addEventListener('keydown', function(e) {
    if (e.key === 'ArrowLeft') {
      prevSlide();
    } else if (e.key === 'ArrowRight') {
      nextSlide();
    }
  });
  
  // Touch support for mobile devices
  let touchStartX = 0;
  let touchEndX = 0;
  
  carouselContainer.addEventListener('touchstart', function(e) {
    touchStartX = e.changedTouches[0].screenX;
  }, false);
  
  carouselContainer.addEventListener('touchend', function(e) {
    touchEndX = e.changedTouches[0].screenX;
    handleSwipe();
  }, false);
  
  function handleSwipe() {
    // Detect swipe direction
    if (touchEndX < touchStartX - 50) {
      // Swipe left - go to next slide
      nextSlide();
    } else if (touchEndX > touchStartX + 50) {
      // Swipe right - go to previous slide
      prevSlide();
    }
  }
});
```

## 4. Integration with Your Jekyll Site

### Step 1: Update your layout file

Add the carousel CSS and JavaScript to your `_layouts/default.html` file by adding these lines in the appropriate sections:

In the `<head>` section, add:
```html
{% if page.permalink == '/en/' or page.permalink == '/ru/' or page.permalink == '/zh/' %}
<link rel="stylesheet" href="{{ '/assets/css/carousel.css' | relative_url }}">
{% endif %}
```

Just before the closing `</body>` tag, add:
```html
{% if page.permalink == '/en/' or page.permalink == '/ru/' or page.permalink == '/zh/' %}
<script src="{{ '/assets/js/carousel.js' | relative_url }}"></script>
{% endif %}
```

### Step 2: Create the necessary directories and images

1. Create the directory for carousel images:
   ```bash
   mkdir -p assets/images/hero
   ```

2. Add three high-quality images for your carousel slides:
   - `assets/images/hero/slide1.jpg` - Main hero image
   - `assets/images/hero/slide2.jpg` - Global markets image
   - `assets/images/hero/slide3.jpg` - Breaking barriers image

   These images should be:
   - At least 1920px wide
   - Around 1080px tall (16:9 aspect ratio)
   - Optimized for web (compressed without losing too much quality)
   - Visually representative of your messaging

### Step 3: Create multilingual versions

For each language version of your site, replace the hero section with the carousel implementation, translating the text content:

For Russian (ru):
- Update `pages/ru/index.html` with the carousel HTML, but with translated headings and subtitles

For Chinese (zh):
- Update `pages/zh/index.html` with the carousel HTML, but with translated headings and subtitles

## 5. Advanced Customization Options

### Slide Transition Effects

You can modify the type of transition between slides by changing the CSS transition property in `.carousel-slide`:

```css
/* Fade transition (default) */
.carousel-slide {
  transition: opacity 1s ease-in-out;
}

/* Slide transition (alternative) */
.carousel-slide {
  transition: transform 1s ease-in-out;
  transform: translateX(100%);
}

.carousel-slide.active {
  transform: translateX(0);
}
```

### Autoplay Controls

Add a play/pause button to give users control over autoplay:

```html
<button class="carousel-control autoplay" aria-label="Pause slideshow">
  <span class="pause-icon">⏸</span>
  <span class="play-icon" style="display: none;">▶</span>
</button>
```

With corresponding JavaScript:

```javascript
const autoplayButton = document.querySelector('.carousel-control.autoplay');
const pauseIcon = autoplayButton.querySelector('.pause-icon');
const playIcon = autoplayButton.querySelector('.play-icon');
let isPlaying = true;

autoplayButton.addEventListener('click', function() {
  if (isPlaying) {
    // Pause the slideshow
    clearInterval(slideInterval);
    pauseIcon.style.display = 'none';
    playIcon.style.display = 'inline';
    isPlaying = false;
  } else {
    // Resume the slideshow
    slideInterval = setInterval(nextSlide, 5000);
    pauseIcon.style.display = 'inline';
    playIcon.style.display = 'none';
    isPlaying = true;
  }
});
```

### Content Animation

Add animation to slide content for more visual interest:

```css
.carousel-slide h1,
.carousel-slide h2,
.carousel-slide .hero-subtitle {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.8s ease, transform 0.8s ease;
  transition-delay: 0.3s;
}

.carousel-slide.active h1,
.carousel-slide.active h2,
.carousel-slide.active .hero-subtitle {
  opacity: 1;
  transform: translateY(0);
}

.carousel-slide .hero-subtitle {
  transition-delay: 0.5s;
}
```

## 6. Testing and Troubleshooting

### Browser Testing

Test the carousel in:
- Chrome
- Firefox
- Safari
- Edge

### Common Issues and Solutions

1. **Images not loading**: 
   - Check file paths and ensure images are in the correct directory
   - Verify image file extensions match the CSS references

2. **Transitions not working**: 
   - Make sure the CSS transition properties match the JavaScript timing
   - Check for JavaScript errors in the console

3. **Controls not functioning**:
   - Verify that event listeners are properly attached
   - Check for JavaScript errors in the console

4. **Responsive issues**:
   - Test on various device sizes and orientations
   - Adjust the media queries as needed

5. **Performance issues**:
   - Optimize image sizes to reduce load time
   - Consider using WebP format for better compression
   - Implement progressive image loading
