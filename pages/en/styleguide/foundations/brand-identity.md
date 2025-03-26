---
layout: styleguide
title: Brand Identity
description: Brandmine's visual identity guidelines for consistent branding across all platforms.
permalink: /en/styleguide/foundations/brand-identity/
lang: en
---

## Brand Identity Overview

Our brand identity creates a professional, cohesive visual system that reinforces Brandmine's role as a cross-cultural business intelligence platform. The identity balances global professionalism with approachable warmth, using a strategic color palette and typography system that works across languages and cultures.

## Logo System

The Brandmine logo system consists of several variations to accommodate different contexts and applications:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-4); margin-bottom: var(--space-4);">
      <div style="border: 1px solid var(--neutral-200); padding: var(--space-4); display: flex; align-items: center; justify-content: center; background-color: white;">
        <div style="background-color: var(--primary-400); color: white; font-family: var(--font-heading); font-weight: 700; font-size: 1.5rem; padding: var(--space-2) var(--space-4); border-radius: 4px;">Brandmine</div>
      </div>
      <div style="border: 1px solid var(--neutral-200); padding: var(--space-4); display: flex; align-items: center; justify-content: center; background-color: var(--primary-700);">
        <div style="color: white; font-family: var(--font-heading); font-weight: 700; font-size: 1.5rem; padding: var(--space-2) var(--space-4); border-radius: 4px;">Brandmine</div>
      </div>
    </div>
    <div style="font-size: 0.875rem; color: var(--neutral-500); margin-bottom: var(--space-4);">
      Left: Primary logo on white background | Right: Reversed logo on dark background
    </div>
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: var(--space-4);">
      <div style="border: 1px solid var(--neutral-200); padding: var(--space-2); display: flex; align-items: center; justify-content: center; background-color: white;">
        <div style="background-color: var(--primary-400); color: white; font-family: var(--font-heading); font-weight: 700; font-size: 1rem; padding: var(--space-1) var(--space-2); border-radius: 4px;">B</div>
      </div>
      <div style="border: 1px solid var(--neutral-200); padding: var(--space-2); display: flex; align-items: center; justify-content: center; background-color: var(--primary-700);">
        <div style="color: white; font-family: var(--font-heading); font-weight: 700; font-size: 1rem; padding: var(--space-1) var(--space-2); border-radius: 4px;">B</div>
      </div>
      <div style="border: 1px solid var(--neutral-200); padding: var(--space-2); display: flex; align-items: center; justify-content: center; background-color: white;">
        <div style="background-color: var(--primary-400); color: white; font-family: var(--font-heading); font-weight: 700; font-size: 1rem; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; border-radius: 4px;">B</div>
      </div>
    </div>
    <div style="font-size: 0.875rem; color: var(--neutral-500);">
      Small format and icon variations
    </div>
  </div>
  
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Primary Logo --&gt;
&lt;div class="logo"&gt;
  &lt;img src="/assets/images/site/logos/brandmine-logo-primary.svg" alt="Brandmine"&gt;
&lt;/div&gt;

&lt;!-- Reversed Logo --&gt;
&lt;div class="logo logo-reversed"&gt;
  &lt;img src="/assets/images/site/logos/brandmine-logo-reversed.svg" alt="Brandmine"&gt;
&lt;/div&gt;

&lt;!-- Icon Logo --&gt;
&lt;div class="logo-icon"&gt;
  &lt;img src="/assets/images/site/logos/brandmine-icon.svg" alt="Brandmine"&gt;
&lt;/div&gt;

&lt;!-- Using the logo in the header --&gt;
&lt;header class="site-header"&gt;
  &lt;div class="wrapper"&gt;
    &lt;a class="site-title" href="/{{ page.lang }}/"&gt;
      &lt;img src="/assets/images/site/logos/brandmine-logo-reversed.svg" alt="Brandmine" class="site-logo"&gt;
    &lt;/a&gt;
    &lt;!-- Navigation elements --&gt;
  &lt;/div&gt;
&lt;/header&gt;</code></pre>
  </div>
</div>

### Logo Usage Guidelines

<div class="example-preview">
  <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-4); margin-bottom: var(--space-4);">
    <div style="border: 1px solid var(--neutral-200); padding: var(--space-4); text-align: center;">
      <div style="background-color: var(--primary-400); color: white; font-family: var(--font-heading); font-weight: 700; font-size: 1.5rem; padding: var(--space-2) var(--space-4); border-radius: 4px; display: inline-block; margin-bottom: var(--space-4);">Brandmine</div>
      <div style="font-size: 0.875rem; color: var(--neutral-600);">✓ Correct spacing and proportions</div>
    </div>
    <div style="border: 1px solid var(--neutral-200); padding: var(--space-4); text-align: center;">
      <div style="background-color: var(--primary-300); color: white; font-family: var(--font-heading); font-weight: 700; font-size: 1.5rem; padding: var(--space-2) var(--space-4); border-radius: 4px; display: inline-block; margin-bottom: var(--space-4);">Brandmine</div>
      <div style="font-size: 0.875rem; color: var(--neutral-600);">✗ Incorrect color</div>
    </div>
  </div>
  <div style="margin-top: var(--space-4); font-size: 0.875rem; color: var(--neutral-700);">
    <ul style="padding-left: var(--space-4);">
      <li style="margin-bottom: var(--space-2);">Always maintain clear space around the logo equal to the height of the "B"</li>
      <li style="margin-bottom: var(--space-2);">Never alter the logo proportions or colors</li>
      <li style="margin-bottom: var(--space-2);">Use the reversed version on dark backgrounds</li>
      <li style="margin-bottom: var(--space-2);">Minimum size: 120px wide for the full logo, 32px for the icon</li>
    </ul>
  </div>
</div>

## Color System

Our color system consists of four color families that work together to create a cohesive and professional visual identity:

<div class="example-preview">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(130px, 1fr)); gap: var(--space-4);">
    <!-- Primary Color (Teal) -->
    <div>
      <div style="height: 80px; background-color: var(--primary-400); border-radius: 4px 4px 0 0;"></div>
      <div style="padding: var(--space-2); background-color: var(--neutral-100); border-radius: 0 0 4px 4px; font-size: 0.875rem;">
        <strong>Primary</strong><br>
        var(--primary-400)<br>
        #38B2AC
      </div>
    </div>
    
    <!-- Secondary Color (Orange) -->
    <div>
      <div style="height: 80px; background-color: var(--secondary-500); border-radius: 4px 4px 0 0;"></div>
      <div style="padding: var(--space-2); background-color: var(--neutral-100); border-radius: 0 0 4px 4px; font-size: 0.875rem;">
        <strong>Secondary</strong><br>
        var(--secondary-500)<br>
        #F97316
      </div>
    </div>
    
    <!-- Accent Color (Indigo) -->
    <div>
      <div style="height: 80px; background-color: var(--accent-500); border-radius: 4px 4px 0 0;"></div>
      <div style="padding: var(--space-2); background-color: var(--neutral-100); border-radius: 0 0 4px 4px; font-size: 0.875rem;">
        <strong>Accent</strong><br>
        var(--accent-500)<br>
        #6366F1
      </div>
    </div>
    
    <!-- Neutral Color -->
    <div>
      <div style="height: 80px; background-color: var(--neutral-600); border-radius: 4px 4px 0 0;"></div>
      <div style="padding: var(--space-2); background-color: var(--neutral-100); border-radius: 0 0 4px 4px; font-size: 0.875rem;">
        <strong>Neutral</strong><br>
        var(--neutral-600)<br>
        #4B5563
      </div>
    </div>
  </div>
</div>

<div class="example-code">
  <span class="code-language">css</span>
  <pre><code class="language-css">:root {
  /* Primary Colors (Teal) */
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

  /* Secondary Colors (Orange) */
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

  /* Accent Colors (Indigo) */
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

  /* Neutral Colors (Gray) */
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
}</code></pre>
</div>

### Color Usage Guidelines

Each color family has specific applications across the platform:

<div class="example-preview">
  <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
    <strong>Primary (Teal)</strong>
    <div>Main brand identity, CTAs, navigation, primary UI elements</div>
    
    <strong>Secondary (Orange)</strong>
    <div>Supporting elements, highlights, secondary actions, problem panels</div>
    
    <strong>Accent (Indigo)</strong>
    <div>Special UI elements, tags, tertiary actions, links, perspective panels</div>
    
    <strong>Neutral (Gray)</strong>
    <div>Text, backgrounds, borders, subtle UI elements</div>
  </div>
</div>

## Typography

Our typography system follows the "Evernote approach" with serif fonts for headings and sans-serif for body text:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr; gap: var(--space-4);">
      <div>
        <h3 style="font-family: var(--font-heading); margin-top: 0; margin-bottom: var(--space-2);">PT Serif Heading</h3>
        <p style="font-family: var(--font-body); margin: 0;">PT Sans body text for English and Russian content. Our typography system automatically adapts to the language of the page.</p>
      </div>
      
      <div>
        <h3 style="font-family: var(--font-heading-zh); margin-top: 0; margin-bottom: var(--space-2);">思源宋体标题 (Noto Serif SC)</h3>
        <p style="font-family: var(--font-body-zh); margin: 0;">思源黑体正文 (Noto Sans SC) 用于中文内容。我们的排版系统会根据页面语言自动调整。</p>
      </div>
    </div>
  </div>
  
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">:root {
  /* Language-specific font definitions */
  --font-heading-en: 'PT Serif', Georgia, serif;
  --font-body-en: 'PT Sans', Arial, sans-serif;
  
  --font-heading-ru: 'PT Serif', Georgia, serif;
  --font-body-ru: 'PT Sans', Arial, sans-serif;
  
  --font-heading-zh: 'Noto Serif SC', 'Songti SC', 'FangSong', 'STSong', serif;
  --font-body-zh: 'Noto Sans SC', 'PingFang SC', 'Microsoft YaHei', sans-serif;
  
  /* Default to English fonts */
  --font-heading: var(--font-heading-en);
  --font-body: var(--font-body-en);
}

/* Language-specific overrides via HTML attribute */
html[lang="ru"] {
  --font-heading: var(--font-heading-ru);
  --font-body: var(--font-body-ru);
}

html[lang="zh"] {
  --font-heading: var(--font-heading-zh);
  --font-body: var(--font-body-zh);
}</code></pre>
  </div>
</div>

## Iconography

A consistent icon system supports the brand identity:

<div class="example-preview">
  <div style="display: flex; flex-wrap: wrap; gap: var(--space-4); justify-content: center;">
    <!-- Placeholder icons - replace with actual brand icons -->
    <div style="width: 48px; height: 48px; background-color: var(--primary-400); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white;">
      <span style="font-size: 24px;">✉</span>
    </div>
    <div style="width: 48px; height: 48px; background-color: var(--primary-400); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white;">
      <span style="font-size: 24px;">✓</span>
    </div>
    <div style="width: 48px; height: 48px; background-color: var(--primary-400); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white;">
      <span style="font-size: 24px;">★</span>
    </div>
    <div style="width: 48px; height: 48px; background-color: var(--primary-400); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white;">
      <span style="font-size: 24px;">↗</span>
    </div>
  </div>
  <div style="margin-top: var(--space-4); font-size: 0.875rem; color: var(--neutral-500); text-align: center;">
    UI icons follow a consistent style and are available in both light and dark versions
  </div>
</div>

## Brand Assets

Standard assets for consistent brand implementation:

<div class="example-preview">
  <div style="display: grid; grid-template-columns: auto 1fr; gap: var(--space-2); font-size: 0.875rem; line-height: 1.4;">
    <strong>Logo Package</strong>
    <div>Primary, reversed, and icon variations in SVG and PNG formats</div>
    
    <strong>Color Palette</strong>
    <div>Digital color values in various formats (HEX, RGB, HSL)</div>
    
    <strong>Typography</strong>
    <div>Self-hosted font files for all supported languages</div>
    
    <strong>Icon Library</strong>
    <div>Standardized UI icons and social media icons</div>
  </div>
</div>

## Implementation Guidelines

### Brand Identity Best Practices

1. **Consistent logo usage**
   - Maintain proper spacing and sizing for the logo
   - Use the appropriate logo version for each context
   - Never alter the logo proportions or colors

2. **Color application**
   - Use the brand colors according to their designated roles
   - Maintain proper contrast for readability and accessibility
   - Ensure consistent color application across all materials

3. **Typography implementation**
   - Follow the multilingual typographic guidelines
   - Respect type hierarchy for clear communication
   - Use appropriate font weights and styles

4. **Accessibility considerations**
   - Ensure sufficient color contrast for text and interactive elements
   - Test designs with screen readers and other assistive technologies
   - Follow WCAG 2.1 AA standards at minimum

5. **Responsive behavior**
   - Maintain brand cohesion across all device sizes
   - Ensure logo legibility at smaller scales
   - Adapt layouts appropriately while preserving brand identity