---
layout: styleguide
title: Hero Panel Style Guide
description: A comprehensive guide to Brandmine's hero panel system including variants, combinations, and usage guidelines.
permalink: /en/styleguide/components/hero-panels/
lang: en
---

<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h1>Hero Panel Style Guide</h1>
    <p class="lead-text">This page demonstrates all available hero panel variants and combinations for the Brandmine design system.</p>
    
    <div class="styleguide-toc">
      <h2>Contents</h2>
      <ul>
        <li><a href="#color-variants">Color Variants</a></li>
        <li><a href="#layout-variants">Layout Variants</a></li>
        <li><a href="#size-variants">Size Variants</a></li>
        <li><a href="#effect-variants">Effect Variants</a></li>
        <li><a href="#impact-statements">Impact Statements</a></li>
        <li><a href="#combinations">Combined Examples</a></li>
        <li><a href="#consecutive-panels">Consecutive Panels</a></li>
      </ul>
    </div>
  </div>
</div>

<!-- ===== COLOR VARIANTS ===== -->
<div class="full-width-panel light-panel" id="color-variants">
  <div class="panel-content">
    <h2>Color Variants</h2>
    <p>Hero panels can use different background colors while maintaining consistent typography.</p>
  
    <h3>Default (Primary Dark)</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel">
        <div class="panel-content centered">
          <h1>Default Hero Panel</h1>
          <p class="hero-subtitle">Uses primary-700 background with secondary-100 heading</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Default Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses primary-700 background with secondary-100 heading&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Primary</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--primary">
        <div class="panel-content centered">
          <h1>Primary Hero Panel</h1>
          <p class="hero-subtitle">Uses a radial gradient from primary-500 to primary-700</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--primary"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Primary Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses a radial gradient from primary-500 to primary-700&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Primary Light</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--primary-light">
        <div class="panel-content centered">
          <h1>Primary Light Hero Panel</h1>
          <p class="hero-subtitle">Uses primary-500 background</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--primary-light"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Primary Light Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses primary-500 background&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Primary Dark</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--primary-dark">
        <div class="panel-content centered">
          <h1>Primary Dark Hero Panel</h1>
          <p class="hero-subtitle">Uses primary-800 background</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--primary-dark"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Primary Dark Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses primary-800 background&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Secondary (Orange)</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--secondary">
        <div class="panel-content centered">
          <h1>Secondary Hero Panel</h1>
          <p class="hero-subtitle">Uses a radial gradient from secondary-500 to secondary-700</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--secondary"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Secondary Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses a radial gradient from secondary-500 to secondary-700&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Accent (Indigo)</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--accent">
        <div class="panel-content centered">
          <h1>Accent Hero Panel</h1>
          <p class="hero-subtitle">Uses a radial gradient from accent-500 to accent-700</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--accent"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Accent Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses a radial gradient from accent-500 to accent-700&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Light</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--light">
        <div class="panel-content centered">
          <h1>Light Hero Panel</h1>
          <p class="hero-subtitle">Uses neutral-100 background with dark text</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--light"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Light Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses neutral-100 background with dark text&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
  </div>
</div>

<!-- ===== LAYOUT VARIANTS ===== -->
<div class="full-width-panel light-panel" id="layout-variants">
  <div class="panel-content">
    <h2>Layout Variants</h2>
    <p>Control the alignment of content within hero panels.</p>
    
    <h3>Centered (Default)</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--centered">
        <div class="panel-content">
          <h1>Centered Hero Panel</h1>
          <p class="hero-subtitle">Content is centered (default)</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--centered"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h1&gt;Centered Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Content is centered (default)&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Left-Aligned</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--left">
        <div class="panel-content">
          <h1>Left-Aligned Hero Panel</h1>
          <p class="hero-subtitle">Content is aligned to the left</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--left"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h1&gt;Left-Aligned Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Content is aligned to the left&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Right-Aligned</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--right">
        <div class="panel-content">
          <h1>Right-Aligned Hero Panel</h1>
          <p class="hero-subtitle">Content is aligned to the right</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--right"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h1&gt;Right-Aligned Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Content is aligned to the right&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
  </div>
</div>

<!-- ===== SIZE VARIANTS ===== -->
<div class="full-width-panel light-panel" id="size-variants">
  <div class="panel-content">
    <h2>Size Variants</h2>
    <p>Control the height and padding of hero panels.</p>
    
    <h3>Default Size</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel">
        <div class="panel-content centered">
          <h1>Default Size Hero Panel</h1>
          <p class="hero-subtitle">Uses standard padding and height</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Default Size Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses standard padding and height&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Large Size</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--large">
        <div class="panel-content centered">
          <h1>Large Hero Panel</h1>
          <p class="hero-subtitle">Taller with more padding</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--large"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Large Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Taller with more padding&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Small Size</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--small">
        <div class="panel-content centered">
          <h1>Small Hero Panel</h1>
          <p class="hero-subtitle">Shorter with less padding</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--small"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Small Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Shorter with less padding&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
  </div>
</div>

<!-- ===== EFFECT VARIANTS ===== -->
<div class="full-width-panel light-panel" id="effect-variants">
  <div class="panel-content">
    <h2>Effect Variants</h2>
    <p>Add visual effects to hero panels.</p>
    
    <h3>Pattern Overlay</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--pattern">
        <div class="panel-content centered">
          <h1>Pattern Hero Panel</h1>
          <p class="hero-subtitle">Has a subtle dot pattern overlay</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--pattern"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Pattern Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Has a subtle dot pattern overlay&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Gradient</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--gradient">
        <div class="panel-content centered">
          <h1>Gradient Hero Panel</h1>
          <p class="hero-subtitle">Uses a linear gradient from primary-700 to primary-900</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--gradient"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Gradient Hero Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Uses a linear gradient from primary-700 to primary-900&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
  </div>
</div>

<!-- ===== IMPACT STATEMENTS ===== -->
<div class="full-width-panel light-panel" id="impact-statements">
  <div class="panel-content">
    <h2>Impact Statements</h2>
    <p>Add large, attention-grabbing display text to hero panels.</p>
    
    <h3>Basic Display Text</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--display">
        <div class="panel-content centered">
          <p class="display-text">IMPACT STATEMENT</p>
          <h1>With Supporting Heading</h1>
          <p class="hero-subtitle">And additional subtitle text</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--display"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;p class="display-text"&gt;IMPACT STATEMENT&lt;/p&gt;
    &lt;h1&gt;With Supporting Heading&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;And additional subtitle text&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Display Text on Secondary Background</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--secondary hero-panel--display">
        <div class="panel-content centered">
          <p class="display-text">BUILD CONNECTIONS</p>
          <p class="hero-subtitle">Supporting text that explains the statement</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--secondary hero-panel--display"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;p class="display-text"&gt;BUILD CONNECTIONS&lt;/p&gt;
    &lt;p class="hero-subtitle"&gt;Supporting text that explains the statement&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>High-Contrast Display</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--secondary hero-panel--display hero-panel--display-contrast">
        <div class="panel-content centered">
          <p class="display-text">BOLD STATEMENT</p>
          <p class="hero-subtitle">Supporting text that explains the statement</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--secondary hero-panel--display hero-panel--display-contrast"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;p class="display-text"&gt;BOLD STATEMENT&lt;/p&gt;
    &lt;p class="hero-subtitle"&gt;Supporting text that explains the statement&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
  </div>
</div>

<!-- ===== COMBINATIONS ===== -->
<div class="full-width-panel light-panel" id="combinations">
  <div class="panel-content">
    <h2>Combined Examples</h2>
    <p>Mix and match variants to create different looks for specific purposes.</p>
    
    <h3>Featured Page Example</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--accent hero-panel--large hero-panel--pattern">
        <div class="panel-content centered">
          <h1>Featured Content</h1>
          <p class="hero-subtitle">Important page with enhanced visual presence</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--accent hero-panel--large hero-panel--pattern"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Featured Content&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Important page with enhanced visual presence&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Call-to-Action Example</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--secondary hero-panel--display hero-panel--gradient">
        <div class="panel-content centered">
          <p class="display-text">TAKE ACTION</p>
          <p class="hero-subtitle">Compelling reason to take the next step</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--secondary hero-panel--display hero-panel--gradient"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;p class="display-text"&gt;TAKE ACTION&lt;/p&gt;
    &lt;p class="hero-subtitle"&gt;Compelling reason to take the next step&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Subtle Information Page Example</h3>
    <div class="example-wrapper">
      <div class="example-panel hero-panel hero-panel--light hero-panel--small hero-panel--left">
        <div class="panel-content">
          <h1>Information Page</h1>
          <p class="hero-subtitle">Details about a specific topic with left-aligned content</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--light hero-panel--small hero-panel--left"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h1&gt;Information Page&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;Details about a specific topic with left-aligned content&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
  </div>
</div>

<!-- ===== CONSECUTIVE PANELS ===== -->
<div class="full-width-panel light-panel" id="consecutive-panels">
  <div class="panel-content">
    <h2>Consecutive Hero Panels</h2>
    <p>Techniques for placing hero panels directly after each other without white space between them.</p>
    
    <h3>Using No-Top-Margin Class</h3>
    <div class="example-wrapper example-stacked">
      <div class="example-panel hero-panel hero-panel--primary">
        <div class="panel-content centered">
          <h1>First Panel</h1>
          <p class="hero-subtitle">This is the first of two consecutive panels</p>
        </div>
      </div>
      <div class="example-panel hero-panel hero-panel--secondary hero-panel--no-top-margin">
        <div class="panel-content centered">
          <h1>Second Panel</h1>
          <p class="hero-subtitle">This panel uses the hero-panel--no-top-margin class</p>
        </div>
      </div>
      
      <div class="example-code">
        <pre><code>&lt;div class="full-width-panel hero-panel hero-panel--primary"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;First Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;This is the first of two consecutive panels&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
&lt;div class="full-width-panel hero-panel hero-panel--secondary hero-panel--no-top-margin"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h1&gt;Second Panel&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;This panel uses the hero-panel--no-top-margin class&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
      </div>
    </div>
    
    <h3>Using Automatic Adjacent Sibling Selector</h3>
    <p>The CSS automatically removes margins between consecutive hero panels using the adjacent sibling selector.</p>
    <div class="example-code">
      <pre><code>/* This is handled automatically in hero-panels.css */
.hero-image-panel + .hero-panel,
.hero-panel + .hero-panel {
  margin-top: 0 !important;
}</code></pre>
    </div>
  </div>
</div>

<!-- Style Guide Specific Styling -->
<style>
  /* Style guide specific styling */
  .styleguide-toc {
    background-color: var(--neutral-100);
    padding: var(--space-4);
    border-radius: 0.5rem;
    margin: var(--space-8) 0;
  }
  
  .styleguide-toc ul {
    columns: 2;
    column-gap: var(--space-8);
    list-style-type: none;
    padding-left: 0;
  }
  
  .styleguide-toc li {
    margin-bottom: var(--space-2);
  }
  
  .styleguide-toc a {
    text-decoration: none;
    color: var(--primary-600);
  }
  
  .styleguide-toc a:hover {
    text-decoration: underline;
  }
  
  .example-wrapper {
    margin: var(--space-6) 0;
    border: 1px solid var(--neutral-200);
    border-radius: 0.5rem;
    overflow: hidden;
  }
  
  .example-panel {
    /* Remove full-width-panel behavior for examples */
    width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    left: 0 !important;
    right: 0 !important;
    
    /* Constrain height for consistent examples */
    min-height: 20vh !important;
    
    /* Ensure variant styles are visible */
    background-color: inherit !important; /* Let variant styles control background */
  }
  
  .example-code {
    padding: var(--space-4);
    background-color: var(--neutral-900, #111827); /* Change to dark background */
    border-top: 1px solid var(--neutral-200);
    overflow-x: auto;
  }
  
  .example-code pre {
    margin: 0;
    white-space: pre-wrap;
  }
  
  .example-code code {
    font-family: var(--font-mono);
    font-size: 0.9rem;
    color: white; /* Change to white text for visibility on dark background */
  }
  
  .example-stacked .example-panel {
    margin-bottom: 0 !important;
  }
  
  /* Responsive adjustments */
  @media (max-width: var(--breakpoint-md)) {
    .styleguide-toc ul {
      columns: 1;
    }
  }
</style>