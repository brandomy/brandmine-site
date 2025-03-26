---
layout: styleguide
title: Content Display
description: Brandmine's content display patterns provide consistent, flexible ways to present different types of information.
permalink: /en/styleguide/patterns/content-display/
lang: en
---

## Content Display

Our content display patterns define how different types of information are presented across the Brandmine platform. These patterns ensure consistency while providing flexible options for various content needs.

## Panel System

The panel system provides full-width content sections with consistent internal spacing:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: white; padding: var(--space-8) 0; text-align: center; border: 1px dashed var(--neutral-300);">
      <div style="max-width: 1200px; margin: 0 auto; padding: 0 var(--space-4);">
        <h2 style="margin-top: 0; margin-bottom: var(--space-6);">Full-Width Panel</h2>
        <p style="margin-left: auto; margin-right: auto; max-width: 800px;">Panels extend edge-to-edge across the viewport with a centered content container. They provide consistent spacing and structure across the site.</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel light-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Section Title&lt;/h2&gt;
    &lt;p&gt;Panel content with consistent spacing and structure.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Panel Variants

Different panel variants establish visual rhythm and content hierarchy:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr; gap: var(--space-4);">
      <div style="background-color: white; padding: var(--space-4); border-radius: 0.25rem; text-align: center;">
        <h3 style="margin-top: 0;">Light Panel</h3>
        <p>Standard white background for primary content.</p>
      </div>
      
      <div style="background-color: var(--secondary-50); padding: var(--space-4); border-radius: 0.25rem; text-align: center;">
        <h3 style="margin-top: 0; color: var(--secondary-800);">Problem Panel</h3>
        <p style="color: var(--secondary-700);">Light orange background for highlighting challenges.</p>
      </div>
      
      <div style="background-color: var(--primary-50); padding: var(--space-4); border-radius: 0.25rem; text-align: center;">
        <h3 style="margin-top: 0; color: var(--primary-800);">Solution Panel</h3>
        <p style="color: var(--primary-700);">Light teal background for highlighting solutions.</p>
      </div>
      
      <div style="background: radial-gradient(circle at center, var(--primary-500) 0%, var(--primary-700) 100%); color: white; padding: var(--space-4); border-radius: 0.25rem; text-align: center;">
        <h3 style="margin-top: 0; color: white;">CTA Panel</h3>
        <p>Gradient background for high-emphasis sections.</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Standard content panel --&gt;
&lt;div class="full-width-panel light-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Standard Content&lt;/h2&gt;
    &lt;p&gt;Light background for general content.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;!-- Problem panel --&gt;
&lt;div class="full-width-panel problem-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;The Challenge&lt;/h2&gt;
    &lt;p&gt;Problem panel highlights issues or challenges.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;!-- Solution panel --&gt;
&lt;div class="full-width-panel solution-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Our Solution&lt;/h2&gt;
    &lt;p&gt;Solution panel presents answers or benefits.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;!-- Call-to-action panel --&gt;
&lt;div class="full-width-panel cta-panel"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h2&gt;Ready to Get Started?&lt;/h2&gt;
    &lt;p class="lead-text"&gt;CTA panel prompts user action.&lt;/p&gt;
    &lt;a href="#" class="cta-button"&gt;Start Now&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Grid System

The grid system provides a flexible foundation for arranging content:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="border: 1px dashed var(--neutral-300); padding: var(--space-4);">
      <div style="display: grid; grid-template-columns: repeat(12, 1fr); gap: var(--space-4); margin-bottom: var(--space-4);">
        <div style="grid-column: span 12; background-color: var(--primary-100); padding: var(--space-2); text-align: center;">Full Width</div>
      </div>
      <div style="display: grid; grid-template-columns: repeat(12, 1fr); gap: var(--space-4); margin-bottom: var(--space-4);">
        <div style="grid-column: span 6; background-color: var(--primary-100); padding: var(--space-2); text-align: center;">Half</div>
        <div style="grid-column: span 6; background-color: var(--primary-100); padding: var(--space-2); text-align: center;">Half</div>
      </div>
      <div style="display: grid; grid-template-columns: repeat(12, 1fr); gap: var(--space-4); margin-bottom: var(--space-4);">
        <div style="grid-column: span 4; background-color: var(--primary-100); padding: var(--space-2); text-align: center;">Third</div>
        <div style="grid-column: span 4; background-color: var(--primary-100); padding: var(--space-2); text-align: center;">Third</div>
        <div style="grid-column: span 4; background-color: var(--primary-100); padding: var(--space-2); text-align: center;">Third</div>
      </div>
      <div style="display: grid; grid-template-columns: repeat(12, 1fr); gap: var(--space-4);">
        <div style="grid-column: span 8; background-color: var(--primary-100); padding: var(--space-2); text-align: center;">Two-thirds</div>
        <div style="grid-column: span 4; background-color: var(--primary-100); padding: var(--space-2); text-align: center;">One-third</div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="grid-container grid-container--12"&gt;
  &lt;!-- Full width --&gt;
  &lt;div class="col-span-12"&gt;Full width content&lt;/div&gt;
  
  &lt;!-- Two equal columns --&gt;
  &lt;div class="col-span-6"&gt;Left column&lt;/div&gt;
  &lt;div class="col-span-6"&gt;Right column&lt;/div&gt;
  
  &lt;!-- Three equal columns --&gt;
  &lt;div class="col-span-4"&gt;First column&lt;/div&gt;
  &lt;div class="col-span-4"&gt;Middle column&lt;/div&gt;
  &lt;div class="col-span-4"&gt;Last column&lt;/div&gt;
  
  &lt;!-- Mixed width columns --&gt;
  &lt;div class="col-span-8"&gt;Main content (2/3 width)&lt;/div&gt;
  &lt;div class="col-span-4"&gt;Sidebar content (1/3 width)&lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Two-Column Layout

The panel with image layout creates a balanced two-column structure:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-6); align-items: center; margin-bottom: var(--space-4);">
      <div style="padding: var(--space-4); background-color: var(--neutral-100); border-radius: 0.25rem;">
        <h3 style="margin-top: 0;">Content Area</h3>
        <p>This side contains text content, headings, and possibly buttons or other UI elements.</p>
      </div>
      <div style="background-color: var(--primary-100); height: 200px; border-radius: 0.5rem; display: flex; align-items: center; justify-content: center;">
        Image Area
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="panel-with-image"&gt;
  &lt;div class="content-area"&gt;
    &lt;h2&gt;Section Heading&lt;/h2&gt;
    &lt;p&gt;Content description goes here...&lt;/p&gt;
    &lt;a href="#" class="btn-primary"&gt;Call to Action&lt;/a&gt;
  &lt;/div&gt;
  &lt;div class="image-area"&gt;
    &lt;img src="/path/to/image.jpg" alt="Description" class="panel-image"&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Card Components

Cards provide contained content elements with consistent styling:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-4);">
      <div style="background-color: var(--neutral-100); padding: var(--space-4); border-radius: 0.25rem; border: 1px solid var(--neutral-200); box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);">
        <h3 style="margin-top: 0;">Basic Card</h3>
        <p>Standard card for general content with subtle shadow and border.</p>
      </div>
      <div style="background-color: white; border-radius: 0.5rem; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1); padding: var(--space-4); border: 1px solid var(--neutral-200);">
        <h3 style="margin-top: 0;">White Content Card</h3>
        <p>Elevated card for featured content with deeper shadow.</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Basic card --&gt;
&lt;div class="card"&gt;
  &lt;h3&gt;Card Title&lt;/h3&gt;
  &lt;p&gt;Card content here...&lt;/p&gt;
&lt;/div&gt;

&lt;!-- White content card (for colored backgrounds) --&gt;
&lt;div class="white-content-card"&gt;
  &lt;h3&gt;Featured Content&lt;/h3&gt;
  &lt;p&gt;White card with deeper shadow for emphasis...&lt;/p&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Feature and Solution Displays

Specialized layouts for presenting features and solutions:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-4);">
      <!-- Feature Item -->
      <div style="display: flex; flex-direction: column; text-align: center; align-items: center;">
        <div style="background-color: white; color: var(--secondary-700); width: 4rem; height: 4rem; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto var(--space-4);">
          <span style="font-size: 1.5rem;">✨</span>
        </div>
        <h3 style="margin-top: var(--space-2); text-align: center; font-size: 1.25rem; margin-bottom: var(--space-2); color: var(--secondary-800);">Feature Item</h3>
        <p style="color: var(--secondary-700); font-size: 0.95rem; text-align: center;">Feature items highlight key benefits with icons and brief descriptions.</p>
      </div>
      
      <!-- Solution Item -->
      <div style="display: flex; align-items: flex-start; background-color: var(--primary-50); padding: var(--space-4); border-radius: 0.5rem; border-left: 4px solid var(--primary-400);">
        <div style="background-color: var(--primary-400); color: white; width: 2.5rem; height: 2.5rem; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 1.25rem; margin-right: var(--space-4); flex-shrink: 0;">1</div>
        <div>
          <h3 style="margin: 0 0 var(--space-2) 0; font-size: 1.25rem; color: var(--primary-800);">Solution Item</h3>
          <p style="margin: 0; color: var(--primary-700);">Solution items present numbered steps or approaches to solving problems.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Feature grid --&gt;
&lt;div class="feature-grid"&gt;
  &lt;div class="feature-item"&gt;
    &lt;div class="feature-icon"&gt;
      &lt;svg&gt;&lt;!-- Icon SVG --&gt;&lt;/svg&gt;
    &lt;/div&gt;
    &lt;h3&gt;Feature Title&lt;/h3&gt;
    &lt;p&gt;Feature description text...&lt;/p&gt;
  &lt;/div&gt;
  &lt;!-- Additional feature items --&gt;
&lt;/div&gt;

&lt;!-- Solutions list --&gt;
&lt;div class="solutions-list"&gt;
  &lt;div class="solution-item"&gt;
    &lt;div class="solution-number"&gt;1&lt;/div&gt;
    &lt;div class="solution-content"&gt;
      &lt;h3&gt;Solution Title&lt;/h3&gt;
      &lt;p&gt;Solution description text...&lt;/p&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;!-- Additional solution items --&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Text Components

Specialized text components create hierarchical content flow:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="padding: var(--space-4); border: 1px dashed var(--neutral-300);">
      <h2 style="margin-top: 0; margin-bottom: var(--space-4);">Section Title</h2>
      <p style="font-size: 1.125rem; line-height: 1.6; margin-bottom: var(--space-8); max-width: 800px; color: var(--neutral-700);">Lead text introduces a section with slightly larger font size and more generous line height, creating visual emphasis while maintaining readability.</p>
      <p>Regular paragraph text follows with standard typography.</p>
      <p>Additional content paragraphs continue the flow.</p>
      <p style="font-size: 1.125rem; border-top: 1px solid rgba(0, 0, 0, 0.1); margin-top: var(--space-8); padding-top: var(--space-6);">Conclusion text summarizes key points with a subtle divider for visual separation.</p>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="panel-content"&gt;
  &lt;h2&gt;Section Title&lt;/h2&gt;
  &lt;p class="lead-text"&gt;Lead paragraph introducing the section content...&lt;/p&gt;
  
  &lt;p&gt;Regular paragraph content...&lt;/p&gt;
  &lt;p&gt;Additional content paragraphs...&lt;/p&gt;
  
  &lt;p class="conclusion-text"&gt;Conclusion text summarizing key points...&lt;/p&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Team Member Display

Specialized cards for presenting team members:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: white; border-radius: 0.5rem; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: var(--space-6); border: 1px solid var(--neutral-200); max-width: 300px; margin: 0 auto;">
      <img src="/api/placeholder/180/180" alt="Team member" style="width: 180px; height: 180px; border-radius: 50%; object-fit: cover; margin-bottom: var(--space-6); border: 3px solid var(--primary-400); display: block; margin-left: auto; margin-right: auto;">
      <h3 style="margin-top: 0; margin-bottom: var(--space-2); color: var(--neutral-800); text-align: center;">Team Member Name</h3>
      <p style="color: var(--primary-600); font-weight: 600; margin-top: 0; margin-bottom: var(--space-6); text-align: center;">Job Title</p>
      <ul style="margin-top: var(--space-4); margin-bottom: var(--space-6); padding-left: var(--space-6);">
        <li style="margin-bottom: var(--space-2);">Area of expertise</li>
        <li style="margin-bottom: var(--space-2);">Professional focus</li>
        <li style="margin-bottom: var(--space-2);">Key responsibility</li>
      </ul>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="team-section"&gt;
  &lt;div class="team-member"&gt;
    &lt;img src="/path/to/photo.jpg" alt="Team Member Name" class="team-photo"&gt;
    &lt;h3&gt;Team Member Name&lt;/h3&gt;
    &lt;p class="team-title"&gt;Job Title&lt;/p&gt;
    &lt;ul&gt;
      &lt;li&gt;Area of expertise&lt;/li&gt;
      &lt;li&gt;Professional focus&lt;/li&gt;
      &lt;li&gt;Key responsibility&lt;/li&gt;
    &lt;/ul&gt;
    &lt;div class="team-member-linkedin"&gt;
      &lt;a href="https://linkedin.com/in/username"&gt;
        &lt;i class="fab fa-linkedin"&gt;&lt;/i&gt;
      &lt;/a&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Responsive Behavior

All content display patterns are fully responsive:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: flex; justify-content: space-between; gap: var(--space-4); text-align: center; font-size: 0.875rem;">
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); width: 300px; margin-bottom: var(--space-2); display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-2);">
          <div style="background-color: var(--primary-100); padding: var(--space-2);">Column 1</div>
          <div style="background-color: var(--primary-100); padding: var(--space-2);">Column 2</div>
        </div>
        <div>Desktop Layout</div>
      </div>
      
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); width: 220px; margin-bottom: var(--space-2); display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-2);">
          <div style="background-color: var(--primary-100); padding: var(--space-2); font-size: 0.75rem;">Column 1</div>
          <div style="background-color: var(--primary-100); padding: var(--space-2); font-size: 0.75rem;">Column 2</div>
        </div>
        <div>Tablet Layout</div>
      </div>
      
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); width: 150px; margin-bottom: var(--space-2); display: grid; grid-template-columns: 1fr; gap: var(--space-2);">
          <div style="background-color: var(--primary-100); padding: var(--space-2);">Column 1</div>
          <div style="background-color: var(--primary-100); padding: var(--space-2);">Column 2</div>
        </div>
        <div>Mobile Layout</div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">/* Desktop layout */
.panel-with-image {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-12);
  align-items: center;
}

/* Tablet behavior */
@media (max-width: 992px) {
  .panel-with-image {
    gap: var(--space-6);  /* Reduced spacing */
  }
  
  h2 {
    font-size: 1.75rem;  /* Smaller headings */
  }
}

/* Mobile behavior */
@media (max-width: 768px) {
  .panel-with-image {
    grid-template-columns: 1fr;  /* Stack vertically */
  }
  
  .feature-grid {
    grid-template-columns: 1fr;  /* Single column */
  }
  
  .feature-item {
    flex-direction: row;  /* Horizontal on mobile */
    text-align: left;
  }
}</code></pre>
  </div>
</div>

## Content Organization Patterns

Common content organization patterns across the site:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: 1fr; gap: var(--space-4);">
      <div style="border: 1px dashed var(--neutral-300); padding: var(--space-4);">
        <h3 style="margin-top: 0;">1. Problem → Solution Pattern</h3>
        <p>A problem panel followed by a solution panel creates a narrative flow that identifies challenges and presents solutions.</p>
      </div>
      
      <div style="border: 1px dashed var(--neutral-300); padding: var(--space-4);">
        <h3 style="margin-top: 0;">2. Feature Grid Pattern</h3>
        <p>A grid of feature items presents multiple benefits or capabilities in a visually balanced layout.</p>
      </div>
      
      <div style="border: 1px dashed var(--neutral-300); padding: var(--space-4);">
        <h3 style="margin-top: 0;">3. Alternating Panels Pattern</h3>
        <p>Alternating panel colors create visual rhythm and help users distinguish between different content sections.</p>
      </div>
      
      <div style="border: 1px dashed var(--neutral-300); padding: var(--space-4);">
        <h3 style="margin-top: 0;">4. Call-to-Action Finale Pattern</h3>
        <p>Content sections conclude with a CTA panel that prompts user action after building context and value.</p>
      </div>
    </div>
  </div>
</div>

## Implementation Guidelines

### Content Pattern Selection

1. **Match pattern to content type**:
   - Use panels for primary content sections
   - Use grids for displaying multiple related items
   - Use cards for self-contained content units
   - Use specialized displays for specific content types (team, features, solutions)

2. **Create visual hierarchy**:
   - Use panel variants to distinguish between content types
   - Use text components to establish content flow
   - Use cards and specialized displays to highlight important elements
   - Maintain consistent spacing within and between elements

3. **Consider reading flow**:
   - Organize content in a logical sequence
   - Use sufficient spacing to separate distinct ideas
   - Group related content in meaningful ways
   - Provide clear visual cues for content relationships

4. **Ensure responsive behavior**:
   - Test layouts at all breakpoints
   - Maintain readability on small screens
   - Preserve content hierarchy when stacking elements
   - Adjust spacing appropriately for different devices

### Common Content Structures

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Problem → Solution pattern --&gt;
&lt;div class="full-width-panel problem-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;The Challenge&lt;/h2&gt;
    &lt;p class="lead-text"&gt;Description of the problem...&lt;/p&gt;
    &lt;div class="feature-grid"&gt;
      &lt;!-- Problem points as feature items --&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;div class="full-width-panel solution-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Our Solution&lt;/h2&gt;
    &lt;p class="lead-text"&gt;Description of the solution approach...&lt;/p&gt;
    &lt;div class="solutions-list"&gt;
      &lt;!-- Solution steps as solution items --&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;!-- Call-to-action finale --&gt;
&lt;div class="full-width-panel cta-panel"&gt;
  &lt;div class="panel-content centered"&gt;
    &lt;h2&gt;Ready to Get Started?&lt;/h2&gt;
    &lt;p class="lead-text"&gt;Compelling call to action message...&lt;/p&gt;
    &lt;a href="#" class="cta-button"&gt;Start Now&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>