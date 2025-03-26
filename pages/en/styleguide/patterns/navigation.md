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

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--neutral-50); border: 1px solid var(--neutral-200); border-radius: 4px; padding: 1rem;">
      <header style="display: flex; justify-content: space-between; align-items: center; padding: 1rem; background-color: white; border-bottom: 1px solid var(--neutral-200);">
        <div style="font-weight: bold; font-size: 1.25rem; color: var(--primary-600);">Brandmine</div>
        <nav style="display: flex; gap: 1.5rem;">
          <a href="#" style="color: var(--neutral-600); text-decoration: none;">Home</a>
          <a href="#" style="color: var(--neutral-600); text-decoration: none;">Brands</a>
          <a href="#" style="color: var(--primary-600); text-decoration: none; font-weight: 500;">Sectors</a>
          <a href="#" style="color: var(--neutral-600); text-decoration: none;">About</a>
        </nav>
        <div style="display: flex; gap: 0.5rem;">
          <a href="#" style="color: var(--primary-600); font-weight: 500; text-decoration: none;">EN</a>
          <a href="#" style="color: var(--neutral-500); text-decoration: none;">RU</a>
          <a href="#" style="color: var(--neutral-500); text-decoration: none;">中文</a>
        </div>
      </header>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;header class="site-header"&gt;
  &lt;div class="wrapper"&gt;
    &lt;a class="site-title" href="/en/"&gt;Brandmine&lt;/a&gt;
    &lt;nav class="site-nav"&gt;
      &lt;a href="/en/"&gt;Home&lt;/a&gt;
      &lt;a href="/en/brands/"&gt;Brands&lt;/a&gt;
      &lt;a href="/en/sectors/"&gt;Sectors&lt;/a&gt;
      &lt;a href="/en/about/"&gt;About&lt;/a&gt;
    &lt;/nav&gt;
    &lt;div class="language-selector"&gt;
      &lt;a href="/en/" class="active"&gt;EN&lt;/a&gt;
      &lt;a href="/ru/"&gt;RU&lt;/a&gt;
      &lt;a href="/zh/"&gt;中文&lt;/a&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/header&gt;</code></pre>
  </div>
</div>

## Main Navigation

The main navigation provides access to key sections of the site.

### Standard Links

Basic navigation links with hover and active states:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--neutral-50); border: 1px solid var(--neutral-200); border-radius: 4px; padding: 1rem;">
      <nav style="display: flex; gap: 1.5rem; padding: 0.5rem;">
        <a href="#" style="color: var(--neutral-600); text-decoration: none;">Home</a>
        <a href="#" style="color: var(--neutral-600); text-decoration: none;">Brands</a>
        <a href="#" style="color: var(--primary-600); text-decoration: none; font-weight: 500; border-bottom: 2px solid var(--primary-600); padding-bottom: 2px;">Sectors</a>
        <a href="#" style="color: var(--neutral-600); text-decoration: none;">About</a>
      </nav>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;nav class="site-nav"&gt;
  &lt;a href="/en/"&gt;Home&lt;/a&gt;
  &lt;a href="/en/brands/"&gt;Brands&lt;/a&gt;
  &lt;a href="/en/sectors/" class="active"&gt;Sectors&lt;/a&gt;
  &lt;a href="/en/about/"&gt;About&lt;/a&gt;
&lt;/nav&gt;</code></pre>
  </div>
</div>

### Dropdown Navigation

For sections with sub-navigation, such as the Discover section:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--neutral-50); border: 1px solid var(--neutral-200); border-radius: 4px; padding: 1rem;">
      <div style="position: relative; display: inline-block;">
        <button style="padding: 0.5rem 1rem; background-color: var(--primary-50); border: 1px solid var(--primary-200); border-radius: 4px; cursor: pointer; display: flex; align-items: center; gap: 0.5rem;">
          Discover
          <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 4L6 8L10 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </button>
        <div style="position: absolute; z-index: 1; background-color: white; min-width: 160px; border: 1px solid var(--neutral-200); border-radius: 4px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); display: block;">
          <a href="#" style="display: block; padding: 0.5rem 1rem; color: var(--neutral-700); text-decoration: none;">Sectors</a>
          <a href="#" style="display: block; padding: 0.5rem 1rem; color: var(--neutral-700); text-decoration: none;">Markets</a>
          <a href="#" style="display: block; padding: 0.5rem 1rem; color: var(--neutral-700); text-decoration: none;">Attributes</a>
          <a href="#" style="display: block; padding: 0.5rem 1rem; color: var(--neutral-700); text-decoration: none;">Signals</a>
        </div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="dropdown"&gt;
  &lt;button class="dropbtn"&gt;Discover&lt;/button&gt;
  &lt;div class="dropdown-content"&gt;
    &lt;a href="/en/sectors/"&gt;Sectors&lt;/a&gt;
    &lt;a href="/en/markets/"&gt;Markets&lt;/a&gt;
    &lt;a href="/en/attributes/"&gt;Attributes&lt;/a&gt;
    &lt;a href="/en/signals/"&gt;Signals&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Mobile Navigation

On smaller screens, the navigation transforms into a hamburger menu:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--neutral-50); border: 1px solid var(--neutral-200); border-radius: 4px; padding: 1rem; max-width: 400px;">
      <header style="display: flex; justify-content: space-between; align-items: center; padding: 1rem; background-color: white; border-bottom: 1px solid var(--neutral-200);">
        <div style="font-weight: bold; font-size: 1.25rem; color: var(--primary-600);">Brandmine</div>
        <div style="display: flex; gap: 1rem; align-items: center;">
          <div style="display: flex; gap: 0.5rem;">
            <a href="#" style="color: var(--primary-600); font-weight: 500; text-decoration: none;">EN</a>
            <a href="#" style="color: var(--neutral-500); text-decoration: none;">RU</a>
            <a href="#" style="color: var(--neutral-500); text-decoration: none;">中文</a>
          </div>
          <button style="background: none; border: none; cursor: pointer; padding: 0.25rem; width: 30px; height: 30px;">
            <div style="width: 24px; height: 2px; background-color: var(--neutral-700); margin: 4px 0;"></div>
            <div style="width: 24px; height: 2px; background-color: var(--neutral-700); margin: 4px 0;"></div>
            <div style="width: 24px; height: 2px; background-color: var(--neutral-700); margin: 4px 0;"></div>
          </button>
        </div>
      </header>
      <div style="background-color: white; padding: 1rem; border-bottom: 1px solid var(--neutral-200);">
        <nav style="display: flex; flex-direction: column; gap: 1rem;">
          <a href="#" style="color: var(--neutral-600); text-decoration: none; padding: 0.5rem 0; border-bottom: 1px solid var(--neutral-100);">Home</a>
          <a href="#" style="color: var(--neutral-600); text-decoration: none; padding: 0.5rem 0; border-bottom: 1px solid var(--neutral-100);">Brands</a>
          <div style="padding: 0.5rem 0; border-bottom: 1px solid var(--neutral-100);">
            <div style="display: flex; justify-content: space-between; align-items: center; cursor: pointer;">
              <span style="color: var(--neutral-600);">Discover</span>
              <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M2 4L6 8L10 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </div>
            <div style="padding-left: 1rem; margin-top: 0.5rem; display: flex; flex-direction: column; gap: 0.5rem;">
              <a href="#" style="color: var(--neutral-600); text-decoration: none;">Sectors</a>
              <a href="#" style="color: var(--neutral-600); text-decoration: none;">Markets</a>
              <a href="#" style="color: var(--neutral-600); text-decoration: none;">Attributes</a>
              <a href="#" style="color: var(--neutral-600); text-decoration: none;">Signals</a>
            </div>
          </div>
          <a href="#" style="color: var(--neutral-600); text-decoration: none; padding: 0.5rem 0;">About</a>
        </nav>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Mobile Header --&gt;
&lt;header class="site-header"&gt;
  &lt;div class="wrapper"&gt;
    &lt;a class="site-title" href="/en/"&gt;Brandmine&lt;/a&gt;
    &lt;div class="language-selector"&gt;
      &lt;a href="/en/" class="active"&gt;EN&lt;/a&gt;
      &lt;a href="/ru/"&gt;RU&lt;/a&gt;
      &lt;a href="/zh/"&gt;中文&lt;/a&gt;
    &lt;/div&gt;
    &lt;button class="menu-toggle" aria-label="Toggle menu"&gt;
      &lt;span class="menu-icon"&gt;&lt;/span&gt;
    &lt;/button&gt;
    &lt;nav class="site-nav"&gt;
      &lt;a href="/en/"&gt;Home&lt;/a&gt;
      &lt;a href="/en/brands/"&gt;Brands&lt;/a&gt;
      &lt;div class="dropdown"&gt;
        &lt;button class="dropbtn"&gt;Discover&lt;/button&gt;
        &lt;div class="dropdown-content"&gt;
          &lt;a href="/en/sectors/"&gt;Sectors&lt;/a&gt;
          &lt;a href="/en/markets/"&gt;Markets&lt;/a&gt;
          &lt;a href="/en/attributes/"&gt;Attributes&lt;/a&gt;
          &lt;a href="/en/signals/"&gt;Signals&lt;/a&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;a href="/en/about/"&gt;About&lt;/a&gt;
    &lt;/nav&gt;
  &lt;/div&gt;
&lt;/header&gt;

&lt;!-- JavaScript for mobile menu toggle --&gt;
&lt;script&gt;
  document.querySelector('.menu-toggle').addEventListener('click', function() {
    document.body.classList.toggle('menu-open');
    this.classList.toggle('menu-open');
  });
  
  // Handle dropdown in mobile view
  const dropdowns = document.querySelectorAll('.dropdown');
  dropdowns.forEach(dropdown =&gt; {
    const dropbtn = dropdown.querySelector('.dropbtn');
    dropbtn.addEventListener('click', function(e) {
      if (window.innerWidth &lt;= 767) {
        e.preventDefault();
        dropdown.classList.toggle('open');
      }
    });
  });
&lt;/script&gt;</code></pre>
  </div>
</div>

## Language Selector

The language selector allows users to switch between English, Russian, and Chinese versions of the site:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--neutral-50); border: 1px solid var(--neutral-200); border-radius: 4px; padding: 1rem;">
      <div style="display: flex; gap: 0.5rem; padding: 0.5rem;">
        <a href="#" style="color: var(--primary-600); font-weight: 500; text-decoration: none;">EN</a>
        <a href="#" style="color: var(--neutral-500); text-decoration: none;">RU</a>
        <a href="#" style="color: var(--neutral-500); text-decoration: none;">中文</a>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="language-selector"&gt;
  &lt;a href="/en/" class="active"&gt;EN&lt;/a&gt;
  &lt;a href="/ru/"&gt;RU&lt;/a&gt;
  &lt;a href="/zh/"&gt;中文&lt;/a&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Site Footer

The footer provides supplementary navigation, contact information, and language selection at the bottom of each page:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--neutral-50); border: 1px solid var(--neutral-200); border-radius: 4px; padding: 1rem;">
      <footer style="background-color: var(--primary-800); color: white; padding: 2rem 1rem 1rem;">
        <div style="max-width: 1200px; margin: 0 auto;">
          <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 2rem; margin-bottom: 2rem;">
            <div>
              <p style="font-weight: 500; margin-bottom: 1rem;">Amplifying leading consumer brands of the BRICS+</p>
              <p style="margin-bottom: 0.5rem;"><a href="#" style="color: white; text-decoration: none;">About Us</a></p>
              <p style="margin-bottom: 0.5rem;"><a href="#" style="color: white; text-decoration: none;">Brands</a></p>
              <p style="margin-bottom: 0.5rem;"><a href="#" style="color: white; text-decoration: none;">Contact</a></p>
            </div>
            
            <div style="display: flex; justify-content: center; align-items: flex-start;">
              <div style="display: flex; gap: 1rem;">
                <a href="#" style="display: flex; justify-content: center; align-items: center; width: 36px; height: 36px; background-color: rgba(255,255,255,0.1); border-radius: 50%;">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M16 8C17.5913 8 19.1174 8.63214 20.2426 9.75736C21.3679 10.8826 22 12.4087 22 14V21H18V14C18 13.4696 17.7893 12.9609 17.4142 12.5858C17.0391 12.2107 16.5304 12 16 12C15.4696 12 14.9609 12.2107 14.5858 12.5858C14.2107 12.9609 14 13.4696 14 14V21H10V14C10 12.4087 10.6321 10.8826 11.7574 9.75736C12.8826 8.63214 14.4087 8 16 8Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M6 9H2V21H6V9Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M4 6C5.10457 6 6 5.10457 6 4C6 2.89543 5.10457 2 4 2C2.89543 2 2 2.89543 2 4C2 5.10457 2.89543 6 4 6Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                  </svg>
                </a>
                <a href="#" style="display: flex; justify-content: center; align-items: center; width: 36px; height: 36px; background-color: rgba(255,255,255,0.1); border-radius: 50%;">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M23 3.00005C22.0424 3.67552 20.9821 4.19216 19.86 4.53005C19.2577 3.83756 18.4573 3.34674 17.567 3.12397C16.6767 2.90121 15.7395 2.95724 14.8821 3.2845C14.0247 3.61176 13.2884 4.19445 12.773 4.95376C12.2575 5.71308 11.9877 6.61238 12 7.53005V8.53005C10.2426 8.57561 8.50127 8.18586 6.93101 7.39549C5.36074 6.60513 4.01032 5.43868 3 4.00005C3 4.00005 -1 13 8 17C5.94053 18.398 3.48716 19.099 1 19C10 24 21 19 21 7.50005C20.9991 7.2215 20.9723 6.94364 20.92 6.67005C21.9406 5.66354 22.6608 4.39276 23 3.00005Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                  </svg>
                </a>
              </div>
            </div>
            
            <div style="display: flex; flex-direction: column; align-items: flex-end;">
              <div style="margin-bottom: 1rem;">
                <a href="#" style="color: white; text-decoration: none; margin-right: 0.5rem;">English</a>
                <a href="#" style="color: rgba(255,255,255,0.7); text-decoration: none; margin-right: 0.5rem;">Русский</a>
                <a href="#" style="color: rgba(255,255,255,0.7); text-decoration: none;">中文</a>
              </div>
              <div style="background-color: rgba(255,255,255,0.1); padding: 0.5rem; border-radius: 4px;">
                <!-- Newsletter form would go here -->
                Newsletter form
              </div>
            </div>
          </div>
          
          <div style="text-align: center; padding-top: 1rem; border-top: 1px solid rgba(255,255,255,0.2); font-size: 0.875rem; color: rgba(255,255,255,0.7);">
            © 2025 Brandmine. All rights reserved.
          </div>
        </div>
      </footer>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;footer class="site-footer"&gt;
  &lt;div class="wrapper"&gt;
    &lt;div class="footer-grid"&gt;
      &lt;div class="footer-section"&gt;
        &lt;p class="footer-tagline"&gt;Amplifying leading consumer brands of the BRICS+&lt;/p&gt;
        &lt;p class="footer-text"&gt;&lt;a href="/en/about/"&gt;About Us&lt;/a&gt;&lt;/p&gt;
        &lt;p class="footer-text"&gt;&lt;a href="/en/brands/"&gt;Brands&lt;/a&gt;&lt;/p&gt;
        &lt;p class="footer-text"&gt;&lt;a href="/en/contact/"&gt;Contact&lt;/a&gt;&lt;/p&gt;
      &lt;/div&gt;
      
      &lt;div class="footer-section-center"&gt;
        &lt;div class="social-icons"&gt;
          &lt;a href="https://linkedin.com/company/brandmine" class="social-icon" aria-label="LinkedIn"&gt;
            &lt;svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"&gt;
              &lt;path d="M16 8C17.5913 8 19.1174 8.63214 20.2426 9.75736C21.3679 10.8826 22 12.4087 22 14V21H18V14C18 13.4696 17.7893 12.9609 17.4142 12.5858C17.0391 12.2107 16.5304 12 16 12C15.4696 12 14.9609 12.2107 14.5858 12.5858C14.2107 12.9609 14 13.4696 14 14V21H10V14C10 12.4087 10.6321 10.8826 11.7574 9.75736C12.8826 8.63214 14.4087 8 16 8Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/&gt;
              &lt;path d="M6 9H2V21H6V9Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/&gt;
              &lt;path d="M4 6C5.10457 6 6 5.10457 6 4C6 2.89543 5.10457 2 4 2C2.89543 2 2 2.89543 2 4C2 5.10457 2.89543 6 4 6Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/&gt;
            &lt;/svg&gt;
          &lt;/a&gt;
          &lt;a href="https://twitter.com/brandmine" class="social-icon" aria-label="Twitter"&gt;
            &lt;svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"&gt;
              &lt;path d="M23 3.00005C22.0424 3.67552 20.9821 4.19216 19.86 4.53005C19.2577 3.83756 18.4573 3.34674 17.567 3.12397C16.6767 2.90121 15.7395 2.95724 14.8821 3.2845C14.0247 3.61176 13.2884 4.19445 12.773 4.95376C12.2575 5.71308 11.9877 6.61238 12 7.53005V8.53005C10.2426 8.57561 8.50127 8.18586 6.93101 7.39549C5.36074 6.60513 4.01032 5.43868 3 4.00005C3 4.00005 -1 13 8 17C5.94053 18.398 3.48716 19.099 1 19C10 24 21 19 21 7.50005C20.9991 7.2215 20.9723 6.94364 20.92 6.67005C21.9406 5.66354 22.6608 4.39276 23 3.00005Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/&gt;
            &lt;/svg&gt;
          &lt;/a&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      
      &lt;div class="footer-section-right"&gt;
        &lt;div&gt;
          &lt;a href="/en/" class="active"&gt;English&lt;/a&gt;
          &lt;a href="/ru/"&gt;Русский&lt;/a&gt;
          &lt;a href="/zh/"&gt;中文&lt;/a&gt;
        &lt;/div&gt;
        &lt;div class="newsletter-container"&gt;
          &lt;!-- Newsletter form code --&gt;
        &lt;/div&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    
    &lt;div class="footer-copyright"&gt;
      © 2025 Brandmine. All rights reserved.
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/footer&gt;</code></pre>
  </div>
</div>

## Responsive Behavior

The navigation system is fully responsive, adapting to different screen sizes:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: flex; justify-content: space-between; gap: var(--space-4); text-align: center; font-size: 0.875rem;">
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); width: 300px; margin-bottom: var(--space-2);">
          <div style="background-color: var(--neutral-100); padding: var(--space-2); text-align: left; display: flex; justify-content: space-between; align-items: center;">
            <div style="font-weight: bold; color: var(--primary-600);">Brandmine</div>
            <div style="display: flex; gap: 1.5rem;">
              <a href="#" style="color: var(--neutral-600); text-decoration: none;">Home</a>
              <a href="#" style="color: var(--neutral-600); text-decoration: none;">Brands</a>
              <a href="#" style="color: var(--primary-600); text-decoration: none; font-weight: 500;">Sectors</a>
              <a href="#" style="color: var(--neutral-600); text-decoration: none;">About</a>
            </div>
            <div style="display: flex; gap: 0.5rem;">
              <span style="color: var(--primary-600); font-weight: 500;">EN</span>
              <span style="color: var(--neutral-500);">RU</span>
              <span style="color: var(--neutral-500);">中</span>
            </div>
          </div>
        </div>
        <div>Desktop Layout</div>
        <div style="color: var(--neutral-500); font-size: 0.75rem;">992px+</div>
      </div>
      
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); width: 220px; margin-bottom: var(--space-2);">
          <div style="background-color: var(--neutral-100); padding: var(--space-2); text-align: left; display: flex; justify-content: space-between; align-items: center;">
            <div style="font-weight: bold; color: var(--primary-600);">Brandmine</div>
            <div style="display: flex; gap: 1rem;">
              <a href="#" style="color: var(--neutral-600); text-decoration: none; font-size: 0.875rem;">Home</a>
              <a href="#" style="color: var(--neutral-600); text-decoration: none; font-size: 0.875rem;">Brands</a>
              <a href="#" style="color: var(--primary-600); text-decoration: none; font-weight: 500; font-size: 0.875rem;">Sectors</a>
              <a href="#" style="color: var(--neutral-600); text-decoration: none; font-size: 0.875rem;">About</a>
            </div>
          </div>
        </div>
        <div>Tablet Layout</div>
        <div style="color: var(--neutral-500); font-size: 0.75rem;">768px - 991px</div>
      </div>
      
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); width: 120px; margin-bottom: var(--space-2);">
          <div style="background-color: var(--neutral-100); padding: var(--space-2); text-align: left; display: flex; justify-content: space-between; align-items: center;">
            <div style="font-weight: bold; color: var(--primary-600); font-size: 0.875rem;">Brandmine</div>
            <div style="display: flex; align-items: center; gap: 0.5rem;">
              <span style="color: var(--primary-600); font-weight: 500; font-size: 0.75rem;">EN</span>
              <div style="width: 20px; height: 14px;">
                <div style="width: 18px; height: 2px; background-color: var(--neutral-700); margin: 3px 0;"></div>
                <div style="width: 18px; height: 2px; background-color: var(--neutral-700); margin: 3px 0;"></div>
                <div style="width: 18px; height: 2px; background-color: var(--neutral-700); margin: 3px 0;"></div>
              </div>
            </div>
          </div>
        </div>
        <div>Mobile Layout</div>
        <div style="color: var(--neutral-500); font-size: 0.75rem;">< 768px</div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">/* Desktop Navigation (992px+) */
.site-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
}

.site-nav {
  display: flex;
  gap: 1.5rem;
}

.language-selector {
  display: flex;
  gap: 0.5rem;
}

.menu-toggle {
  display: none; /* Hidden on desktop */
}

/* Tablet Styles (768px - 991px) */
@media screen and (max-width: 991px) {
  .site-nav {
    gap: 1rem;
    font-size: 0.875rem;
  }
  
  .language-selector {
    font-size: 0.875rem;
  }
}

/* Mobile Styles (< 768px) */
@media screen and (max-width: 767px) {
  .site-nav {
    display: none; /* Hidden by default */
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    background-color: white;
    flex-direction: column;
    padding: 1rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }
  
  .menu-toggle {
    display: block; /* Visible on mobile */
  }
  
  body.menu-open .site-nav {
    display: flex; /* Show when menu is open */
  }
  
  .dropdown-content {
    position: static;
    display: none;
    box-shadow: none;
    padding-left: 1rem;
  }
  
  .dropdown.open .dropdown-content {
    display: block;
  }
}</code></pre>
  </div>
</div>

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