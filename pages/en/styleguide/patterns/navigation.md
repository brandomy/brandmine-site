---
layout: styleguide
title: Navigation System
description: Brandmine's navigation system provides consistent wayfinding across our multilingual platform.
permalink: /en/styleguide/patterns/navigation/
lang: en
---

## Navigation Overview

Our navigation system provides consistent wayfinding across the Brandmine platform, helping users navigate through our content in their preferred language. The system includes a site header with main navigation, language selector, mobile menu, and structured footer.

## Site Header

The site header appears on every page, providing global navigation and branding.

<div class="example">
  <div class="example-preview">
    <header style="background-color: var(--primary-400); color: white; padding: var(--space-4) 0;">
      <div style="display: flex; justify-content: space-between; align-items: center; padding: 0 var(--space-4);">
        <a href="#" style="font-size: 1.5rem; font-weight: bold; color: white; text-decoration: none; margin-right: var(--space-6);">Brandmine</a>
        <nav style="display: flex;">
          <a href="#" style="color: white; margin-right: var(--space-4); text-decoration: none;">Home</a>
          <a href="#" style="color: white; margin-right: var(--space-4); text-decoration: none;">Brands</a>
          <a href="#" style="color: white; margin-right: var(--space-4); text-decoration: none;">Sectors</a>
          <a href="#" style="color: white; margin-right: var(--space-4); text-decoration: none;">About</a>
        </nav>
        <div style="display: flex; gap: var(--space-1);">
          <a href="#" style="color: white; text-decoration: none; opacity: 1; font-weight: bold;">EN</a>
          <a href="#" style="color: white; text-decoration: none; opacity: 0.75;">RU</a>
          <a href="#" style="color: white; text-decoration: none; opacity: 0.75;">中文</a>
        </div>
      </div>
    </header>
  </div>
  
  <div class="example-code">
```html
<header class="site-header">
  <div class="wrapper">
    <a class="site-title" href="/en/">Brandmine</a>
    <nav class="site-nav">
      <a href="/en/">Home</a>
      <a href="/en/brands/">Brands</a>
      <a href="/en/sectors/">Sectors</a>
      <a href="/en/about/">About</a>
    </nav>
    <div class="language-selector">
      <a href="/en/" class="active">EN</a>
      <a href="/ru/">RU</a>
      <a href="/zh/">中文</a>
    </div>
  </div>
</header>
```
  </div>
</div>

## Main Navigation

The main navigation provides access to key sections of the site.

### Standard Links

Basic navigation links with hover and active states:

<div class="example">
  <div class="example-preview">
    <div style="background-color: var(--primary-400); padding: var(--space-4); display: flex; gap: var(--space-4); justify-content: center;">
      <a href="#" style="color: white; text-decoration: none;">Regular Link</a>
      <a href="#" style="color: white; text-decoration: underline;">Hover State</a>
      <a href="#" style="color: white; text-decoration: none; background-color: var(--primary-700); font-weight: bold; padding: 0 var(--space-2);">Active Link</a>
    </div>
  </div>
  
  <div class="example-code">
```html
<nav class="site-nav">
  <a href="/en/">Home</a>
  <a href="/en/brands/">Brands</a>
  <a href="/en/sectors/" class="active">Sectors</a>
  <a href="/en/about/">About</a>
</nav>
```
  </div>
</div>

### Dropdown Navigation

For sections with sub-navigation, such as the Discover section:

<div class="example">
  <div class="example-preview">
    <div style="background-color: var(--primary-400); padding: var(--space-4); display: flex; justify-content: center; position: relative;">
      <div style="position: relative;">
        <button style="background-color: transparent; color: white; padding: 0; border: none; cursor: pointer; font-family: var(--font-body); text-decoration: none; font-size: 1rem;">Discover</button>
        <div style="display: block; position: absolute; background-color: var(--primary-600); min-width: 200px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); border-radius: 4px; margin-top: 4px; overflow: hidden;">
          <a href="#" style="color: white; padding: var(--space-2) var(--space-3); text-decoration: none; display: block; font-size: 0.9375rem;">Sectors</a>
          <a href="#" style="color: white; padding: var(--space-2) var(--space-3); text-decoration: none; display: block; font-size: 0.9375rem; background-color: var(--primary-700);">Markets</a>
          <a href="#" style="color: white; padding: var(--space-2) var(--space-3); text-decoration: none; display: block; font-size: 0.9375rem);">Attributes</a>
          <a href="#" style="color: white; padding: var(--space-2) var(--space-3); text-decoration: none; display: block; font-size: 0.9375rem);">Signals</a>
        </div>
      </div>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="dropdown">
  <button class="dropbtn">Discover</button>
  <div class="dropdown-content">
    <a href="/en/sectors/">Sectors</a>
    <a href="/en/markets/">Markets</a>
    <a href="/en/attributes/">Attributes</a>
    <a href="/en/signals/">Signals</a>
  </div>
</div>
```
  </div>
</div>

## Mobile Navigation

On smaller screens, the navigation transforms into a hamburger menu:

<div class="example">
  <div class="example-preview">
    <div style="background-color: var(--primary-400); padding: var(--space-4); position: relative; display: flex; justify-content: space-between; align-items: center;">
      <div style="font-size: 1.5rem; font-weight: bold; color: white;">Brandmine</div>
      <div style="display: flex; align-items: center;">
        <div style="display: flex; gap: var(--space-1); margin-right: var(--space-6);">
          <a href="#" style="color: white; text-decoration: none; opacity: 1; font-weight: bold;">EN</a>
          <a href="#" style="color: white; text-decoration: none; opacity: 0.75;">RU</a>
          <a href="#" style="color: white; text-decoration: none; opacity: 0.75;">中文</a>
        </div>
        <button style="background: transparent; border: none; cursor: pointer; padding: 10px;">
          <span style="display: block; position: relative; width: 24px; height: 2px; background-color: white; border-radius: 2px;"></span>
          <span style="display: block; position: absolute; width: 24px; height: 2px; background-color: white; border-radius: 2px; top: 8px; transform: translateY(4px);"></span>
          <span style="display: block; position: absolute; width: 24px; height: 2px; background-color: white; border-radius: 2px; bottom: 8px; transform: translateY(-4px);"></span>
        </button>
      </div>
    </div>
    <div style="background-color: var(--primary-600); color: white; padding: var(--space-4) 0;">
      <div style="display: flex; flex-direction: column; padding: 0 var(--space-4);">
        <a href="#" style="color: white; text-decoration: none; padding: 0.75rem 0;">Home</a>
        <a href="#" style="color: white; text-decoration: none; padding: 0.75rem 0;">Brands</a>
        <a href="#" style="color: white; text-decoration: none; padding: 0.75rem 0;">Discover</a>
        <div style="background-color: var(--primary-700); padding-left: var(--space-4);">
          <a href="#" style="color: white; text-decoration: none; padding: 0.75rem 0; display: block;">Sectors</a>
          <a href="#" style="color: white; text-decoration: none; padding: 0.75rem 0; display: block;">Markets</a>
        </div>
        <a href="#" style="color: white; text-decoration: none; padding: 0.75rem 0;">About</a>
      </div>
    </div>
    <div style="text-align: center; margin-top: var(--space-4); font-size: 0.875rem; color: var(--neutral-500);">
      <p>Menu shown in open state for demonstration purposes</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<!-- Mobile Header -->
<header class="site-header">
  <div class="wrapper">
    <a class="site-title" href="/en/">Brandmine</a>
    <div class="language-selector">
      <a href="/en/" class="active">EN</a>
      <a href="/ru/">RU</a>
      <a href="/zh/">中文</a>
    </div>
    <button class="menu-toggle" aria-label="Toggle menu">
      <span class="menu-icon"></span>
    </button>
    <nav class="site-nav">
      <a href="/en/">Home</a>
      <a href="/en/brands/">Brands</a>
      <div class="dropdown">
        <button class="dropbtn">Discover</button>
        <div class="dropdown-content">
          <a href="/en/sectors/">Sectors</a>
          <a href="/en/markets/">Markets</a>
          <a href="/en/attributes/">Attributes</a>
          <a href="/en/signals/">Signals</a>
        </div>
      </div>
      <a href="/en/about/">About</a>
    </nav>
  </div>
</header>

<!-- JavaScript for mobile menu toggle -->
<script>
  document.querySelector('.menu-toggle').addEventListener('click', function() {
    document.body.classList.toggle('menu-open');
    this.classList.toggle('menu-open');
  });
  
  // Handle dropdown in mobile view
  const dropdowns = document.querySelectorAll('.dropdown');
  dropdowns.forEach(dropdown => {
    const dropbtn = dropdown.querySelector('.dropbtn');
    dropbtn.addEventListener('click', function(e) {
      if (window.innerWidth <= 767) {
        e.preventDefault();
        dropdown.classList.toggle('open');
      }
    });
  });
</script>
```
  </div>
</div>

## Language Selector

The language selector allows users to switch between English, Russian, and Chinese versions of the site:

<div class="example">
  <div class="example-preview">
    <div style="background-color: var(--primary-400); padding: var(--space-4); display: flex; justify-content: center;">
      <div style="display: flex; gap: var(--space-1);">
        <a href="#" style="color: white; text-decoration: none; opacity: 1; font-weight: bold;">EN</a>
        <a href="#" style="color: white; text-decoration: none; opacity: 0.75;">RU</a>
        <a href="#" style="color: white; text-decoration: none; opacity: 0.75;">中文</a>
      </div>
    </div>
  </div>
  
  <div class="example-code">
```html
<div class="language-selector">
  <a href="/en/" class="active">EN</a>
  <a href="/ru/">RU</a>
  <a href="/zh/">中文</a>
</div>
```
  </div>
</div>

## Site Footer

The footer provides supplementary navigation, contact information, and language selection at the bottom of each page:

<div class="example">
  <div class="example-preview">
    <footer style="background-color: var(--primary-700); color: var(--neutral-200); padding: var(--space-8) var(--space-4) var(--space-4); margin-top: var(--space-4);">
      <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: var(--space-4); margin-bottom: var(--space-6); max-width: 1200px; margin: 0 auto var(--space-6);">
        <div>
          <p style="font-size: 0.95rem; margin: var(--space-2) 0; color: var(--neutral-100);">Amplifying leading consumer brands of the BRICS+</p>
          <p style="font-size: 0.875rem; margin: var(--space-1) 0; line-height: 1.4;">
            <a href="#" style="color: var(--neutral-100); text-decoration: none;">About Us</a>
          </p>
          <p style="font-size: 0.875rem; margin: var(--space-1) 0; line-height: 1.4;">
            <a href="#" style="color: var(--neutral-100); text-decoration: none;">Brands</a>
          </p>
          <p style="font-size: 0.875rem; margin: var(--space-1) 0; line-height: 1.4;">
            <a href="#" style="color: var(--neutral-100); text-decoration: none;">Contact</a>
          </p>
        </div>
        <div style="text-align: center;">
          <div style="display: flex; justify-content: center; gap: var(--space-4); margin-top: var(--space-3);">
            <a href="#" style="display: flex; align-items: center; justify-content: center; width: 2rem; height: 2rem; background-color: var(--primary-600); color: white; border-radius: 50%; text-decoration: none;">L</a>
            <a href="#" style="display: flex; align-items: center; justify-content: center; width: 2rem; height: 2rem; background-color: var(--primary-600); color: white; border-radius: 50%; text-decoration: none;">T</a>
          </div>
        </div>
        <div style="text-align: right;">
          <div>
            <a href="/en/" style="color: var(--neutral-100); text-decoration: none; font-weight: bold; margin-left: var(--space-2);">English</a>
            <a href="/ru/" style="color: var(--neutral-100); text-decoration: none; margin-left: var(--space-2);">Русский</a>
            <a href="/zh/" style="color: var(--neutral-100); text-decoration: none; margin-left: var(--space-2);">中文</a>
          </div>
          <div style="margin-top: var(--space-4);">
            Newsletter signup form
          </div>
        </div>
      </div>
      <div style="text-align: center; border-top: 1px solid var(--primary-600); padding-top: var(--space-4); margin-top: var(--space-4); font-size: 0.75rem; color: var(--neutral-300); max-width: 1200px; margin: 0 auto;">
        © 2025 Brandmine. All rights reserved.
      </div>
    </footer>
  </div>
  
  <div class="example-code">
```html
<footer class="site-footer">
  <div class="wrapper">
    <div class="footer-grid">
      <div class="footer-section">
        <p class="footer-tagline">Amplifying leading consumer brands of the BRICS+</p>
        <p class="footer-text"><a href="/en/about/">About Us</a></p>
        <p class="footer-text"><a href="/en/brands/">Brands</a></p>
        <p class="footer-text"><a href="/en/contact/">Contact</a></p>
      </div>
      
      <div class="footer-section-center">
        <div class="social-icons">
          <a href="https://linkedin.com/company/brandmine" class="social-icon" aria-label="LinkedIn">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M16 8C17.5913 8 19.1174 8.63214 20.2426 9.75736C21.3679 10.8826 22 12.4087 22 14V21H18V14C18 13.4696 17.7893 12.9609 17.4142 12.5858C17.0391 12.2107 16.5304 12 16 12C15.4696 12 14.9609 12.2107 14.5858 12.5858C14.2107 12.9609 14 13.4696 14 14V21H10V14C10 12.4087 10.6321 10.8826 11.7574 9.75736C12.8826 8.63214 14.4087 8 16 8Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M6 9H2V21H6V9Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M4 6C5.10457 6 6 5.10457 6 4C6 2.89543 5.10457 2 4 2C2.89543 2 2 2.89543 2 4C2 5.10457 2.89543 6 4 6Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </a>
          <a href="https://twitter.com/brandmine" class="social-icon" aria-label="Twitter">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M23 3.00005C22.0424 3.67552 20.9821 4.19216 19.86 4.53005C19.2577 3.83756 18.4573 3.34674 17.567 3.12397C16.6767 2.90121 15.7395 2.95724 14.8821 3.2845C14.0247 3.61176 13.2884 4.19445 12.773 4.95376C12.2575 5.71308 11.9877 6.61238 12 7.53005V8.53005C10.2426 8.57561 8.50127 8.18586 6.93101 7.39549C5.36074 6.60513 4.01032 5.43868 3 4.00005C3 4.00005 -1 13 8 17C5.94053 18.398 3.48716 19.099 1 19C10 24 21 19 21 7.50005C20.9991 7.2215 20.9723 6.94364 20.92 6.67005C21.9406 5.66354 22.6608 4.39276 23 3.00005Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </a>
        </div>
      </div>
      
      <div class="footer-section-right">
        <div>
          <a href="/en/" class="active">English</a>
          <a href="/ru/">Русский</a>
          <a href="/zh/">中文</a>
        </div>
        <div class="newsletter-container">
          <!-- Newsletter form code -->
        </div>
      </div>
    </div>
    
    <div class="footer-copyright">
      © 2025 Brandmine. All rights reserved.
    </div>
  </div>
</footer>
```
  </div>
</div>

## Responsive Behavior

The navigation system is fully responsive, adapting to different screen sizes:

### Desktop (992px+)
- Full horizontal navigation
- Visible language selector
- Dropdown menus on hover

### Tablet (768px - 991px)
- Slightly more compact spacing
- Maintained horizontal navigation
- Visible language selector

### Mobile (<768px)
- Hamburger menu for main navigation
- Fixed language selector
- Dropdowns with toggle functionality
- Stacked footer sections

## Implementation Guidelines

### Navigation HTML Structure

```html
<header class="site-header">
  <div class="wrapper">
    <a class="site-title" href="/{{ page.lang }}/">{{ site.data.translations[page.lang].site.title }}</a>
    
    <button class="menu-toggle" aria-label="Toggle menu">
      <span class="menu-icon"></span>
    </button>
    
    <nav class="site-nav">
      <!-- Navigation links -->
    </nav>
    
    <div class="language-selector">
      <!-- Language selection links -->
    </div>
  </div>
</header>
```

### Required JavaScript

The mobile menu requires JavaScript to toggle its visibility:

```javascript
// Mobile menu toggle functionality
document.addEventListener('DOMContentLoaded', function() {
  const menuToggle = document.querySelector('.menu-toggle');
  
  if (menuToggle) {
    menuToggle.addEventListener('click', function() {
      document.body.classList.toggle('menu-open');
      this.classList.toggle('menu-open');
    });
  }
  
  // Mobile dropdown functionality
  const dropdowns = document.querySelectorAll('.dropdown');
  dropdowns.forEach(dropdown => {
    const dropbtn = dropdown.querySelector('.dropbtn');
    
    if (dropbtn) {
      dropbtn.addEventListener('click', function(e) {
        if (window.innerWidth <= 767) {
          e.preventDefault();
          dropdown.classList.toggle('open');
        }
      });
    }
  });
});
```

### Best Practices

1. **Maintain consistency**: Use the same navigation structure across all pages
2. **Keep active state**: Highlight the current section in the navigation
3. **Preserve language choice**: Maintain the user's language selection when navigating
4. **Consider touch targets**: Ensure all clickable elements are at least 44px tall on mobile
5. **Test thoroughly**: Verify navigation works correctly across all screen sizes and devices
6. **Validate translations**: Ensure all navigation items are properly translated in all languages