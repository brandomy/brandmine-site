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

{% include styleguide/code-example.html language="html" preview=true
code='<div style="background-color: white; padding: var(--space-8) 0; text-align: center; border: 1px dashed var(--neutral-300);">
  <div style="max-width: 1200px; margin: 0 auto; padding: 0 var(--space-4);">
    <h2 style="margin-top: 0; margin-bottom: var(--space-6);">Full-Width Panel</h2>
    <p style="margin-left: auto; margin-right: auto; max-width: 800px;">Panels extend edge-to-edge across the viewport with a centered content container. They provide consistent spacing and structure across the site.</p>
  </div>
</div>' %}

{% include styleguide/code-example.html language="html" preview=false
code='<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h2>Section Title</h2>
    <p>Panel content with consistent spacing and structure.</p>
  </div>
</div>' %}

## Panel Variants

Different panel variants establish visual rhythm and content hierarchy:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="display: grid; grid-template-columns: 1fr; gap: var(--space-4);">
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
</div>' %}

{% include styleguide/code-example.html language="html" preview=false
code='<!-- Standard content panel -->
<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h2>Standard Content</h2>
    <p>Light background for general content.</p>
  </div>
</div>

<!-- Problem panel -->
<div class="full-width-panel problem-panel">
  <div class="panel-content">
    <h2>The Challenge</h2>
    <p>Problem panel highlights issues or challenges.</p>
  </div>
</div>

<!-- Solution panel -->
<div class="full-width-panel solution-panel">
  <div class="panel-content">
    <h2>Our Solution</h2>
    <p>Solution panel presents answers or benefits.</p>
  </div>
</div>

<!-- Call-to-action panel -->
<div class="full-width-panel cta-panel">
  <div class="panel-content centered">
    <h2>Ready to Get Started?</h2>
    <p class="lead-text">CTA panel prompts user action.</p>
    <a href="#" class="cta-button">Start Now</a>
  </div>
</div>' %}

## Grid System

The grid system provides a flexible foundation for arranging content:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="border: 1px dashed var(--neutral-300); padding: var(--space-4);">
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
</div>' %}

{% include styleguide/code-example.html language="html" preview=false
code='<div class="grid-container grid-container--12">
  <!-- Full width -->
  <div class="col-span-12">Full width content</div>
  
  <!-- Two equal columns -->
  <div class="col-span-6">Left column</div>
  <div class="col-span-6">Right column</div>
  
  <!-- Three equal columns -->
  <div class="col-span-4">First column</div>
  <div class="col-span-4">Middle column</div>
  <div class="col-span-4">Last column</div>
  
  <!-- Mixed width columns -->
  <div class="col-span-8">Main content (2/3 width)</div>
  <div class="col-span-4">Sidebar content (1/3 width)</div>
</div>' %}

## Two-Column Layout

The panel with image layout creates a balanced two-column structure:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-6); align-items: center; margin-bottom: var(--space-4);">
  <div style="padding: var(--space-4); background-color: var(--neutral-100); border-radius: 0.25rem;">
    <h3 style="margin-top: 0;">Content Area</h3>
    <p>This side contains text content, headings, and possibly buttons or other UI elements.</p>
  </div>
  <div style="background-color: var(--primary-100); height: 200px; border-radius: 0.5rem; display: flex; align-items: center; justify-content: center;">
    Image Area
  </div>
</div>' %}

{% include styleguide/code-example.html language="html" preview=false
code='<div class="panel-with-image">
  <div class="content-area">
    <h2>Section Heading</h2>
    <p>Content description goes here...</p>
    <a href="#" class="btn-primary">Call to Action</a>
  </div>
  <div class="image-area">
    <img src="/path/to/image.jpg" alt="Description" class="panel-image">
  </div>
</div>' %}

## Card Components

Cards provide contained content elements with consistent styling:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-4);">
  <div style="background-color: var(--neutral-100); padding: var(--space-4); border-radius: 0.25rem; border: 1px solid var(--neutral-200); box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);">
    <h3 style="margin-top: 0;">Basic Card</h3>
    <p>Standard card for general content with subtle shadow and border.</p>
  </div>
  <div style="background-color: white; border-radius: 0.5rem; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1); padding: var(--space-4); border: 1px solid var(--neutral-200);">
    <h3 style="margin-top: 0;">White Content Card</h3>
    <p>Elevated card for featured content with deeper shadow.</p>
  </div>
</div>' %}

{% include styleguide/code-example.html language="html" preview=false
code='<!-- Basic card -->
<div class="card">
  <h3>Card Title</h3>
  <p>Card content here...</p>
</div>

<!-- White content card (for colored backgrounds) -->
<div class="white-content-card">
  <h3>Featured Content</h3>
  <p>White card with deeper shadow for emphasis...</p>
</div>' %}

## Feature and Solution Displays

Specialized layouts for presenting features and solutions:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-4);">
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
</div>' %}

{% include styleguide/code-example.html language="html" preview=false
code='<!-- Feature grid -->
<div class="feature-grid">
  <div class="feature-item">
    <div class="feature-icon">
      <svg><!-- Icon SVG --></svg>
    </div>
    <h3>Feature Title</h3>
    <p>Feature description text...</p>
  </div>
  <!-- Additional feature items -->
</div>

<!-- Solutions list -->
<div class="solutions-list">
  <div class="solution-item">
    <div class="solution-number">1</div>
    <div class="solution-content">
      <h3>Solution Title</h3>
      <p>Solution description text...</p>
    </div>
  </div>
  <!-- Additional solution items -->
</div>' %}

## Text Components

Specialized text components create hierarchical content flow:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="padding: var(--space-4); border: 1px dashed var(--neutral-300);">
  <h2 style="margin-top: 0; margin-bottom: var(--space-4);">Section Title</h2>
  <p style="font-size: 1.125rem; line-height: 1.6; margin-bottom: var(--space-8); max-width: 800px; color: var(--neutral-700);">Lead text introduces a section with slightly larger font size and more generous line height, creating visual emphasis while maintaining readability.</p>
  <p>Regular paragraph text follows with standard typography.</p>
  <p>Additional content paragraphs continue the flow.</p>
  <p style="font-size: 1.125rem; border-top: 1px solid rgba(0, 0, 0, 0.1); margin-top: var(--space-8); padding-top: var(--space-6);">Conclusion text summarizes key points with a subtle divider for visual separation.</p>
</div>' %}

{% include styleguide/code-example.html language="html" preview=false
code='<div class="panel-content">
  <h2>Section Title</h2>
  <p class="lead-text">Lead paragraph introducing the section content...</p>
  
  <p>Regular paragraph content...</p>
  <p>Additional content paragraphs...</p>
  
  <p class="conclusion-text">Conclusion text summarizing key points...</p>
</div>' %}

## Team Member Display

Specialized cards for presenting team members:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="background-color: white; border-radius: 0.5rem; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: var(--space-6); border: 1px solid var(--neutral-200); max-width: 300px; margin: 0 auto;">
  <img src="/api/placeholder/180/180" alt="Team member" style="width: 180px; height: 180px; border-radius: 50%; object-fit: cover; margin-bottom: var(--space-6); border: 3px solid var(--primary-400); display: block; margin-left: auto; margin-right: auto;">
  <h3 style="margin-top: 0; margin-bottom: var(--space-2); color: var(--neutral-800); text-align: center;">Team Member Name</h3>
  <p style="color: var(--primary-600); font-weight: 600; margin-top: 0; margin-bottom: var(--space-6); text-align: center;">Job Title</p>
  <ul style="margin-top: var(--space-4); margin-bottom: var(--space-6); padding-left: var(--space-6);">
    <li style="margin-bottom: var(--space-2);">Area of expertise</li>
    <li style="margin-bottom: var(--space-2);">Professional focus</li>
    <li style="margin-bottom: var(--space-2);">Key responsibility</li>
  </ul>
</div>' %}

{% include styleguide/code-example.html language="html" preview=false
code='<div class="team-section">
  <div class="team-member">
    <img src="/path/to/photo.jpg" alt="Team Member Name" class="team-photo">
    <h3>Team Member Name</h3>
    <p class="team-title">Job Title</p>
    <ul>
      <li>Area of expertise</li>
      <li>Professional focus</li>
      <li>Key responsibility</li>
    </ul>
    <div class="team-member-linkedin">
      <a href="https://linkedin.com/in/username">
        <i class="fab fa-linkedin"></i>
      </a>
    </div>
  </div>
</div>' %}

## Responsive Behavior

All content display patterns are fully responsive:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="display: flex; justify-content: space-between; gap: var(--space-4); text-align: center; font-size: 0.875rem;">
  <div>
    <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); width: 300px; margin-bottom: var(--space-2); display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-2);">
      <div style="background-color: var(--primary-100); padding: var(--space-2);">Column 1</div>
      <div style="background-color: var(--primary-100); padding: var(--space-2);">Column 2</div>
    </div>
    <div>Desktop Layout</div>
  </div>
  
  <div>
    <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-2); width: 150px; margin-bottom: var(--space-2); display: grid; grid-template-columns: 1fr; gap: var(--space-2);">
      <div style="background-color: var(--primary-100); padding: var(--space-2);">Column 1</div>
      <div style="background-color: var(--primary-100); padding: var(--space-2);">Column 2</div>
    </div>
    <div>Mobile Layout</div>
  </div>
</div>' %}

{% include styleguide/code-example.html language="css" preview=false
code='/* Desktop layout */
.panel-with-image {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-12);
  align-items: center;
}

/* Mobile behavior */
@media (max-width: var(--breakpoint-lg)) {
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
}' %}

## Content Organization Patterns

Common content organization patterns across the site:

{% include styleguide/code-example.html language="html" preview=true
code='<div style="display: grid; grid-template-columns: 1fr; gap: var(--space-4);">
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
</div>' %}

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

{% include styleguide/code-example.html language="html" preview=false
code='<!-- Problem → Solution pattern -->
<div class="full-width-panel problem-panel">
  <div class="panel-content">
    <h2>The Challenge</h2>
    <p class="lead-text">Description of the problem...</p>
    <div class="feature-grid">
      <!-- Problem points as feature items -->
    </div>
  </div>
</div>

<div class="full-width-panel solution-panel">
  <div class="panel-content">
    <h2>Our Solution</h2>
    <p class="lead-text">Description of the solution approach...</p>
    <div class="solutions-list">
      <!-- Solution steps as solution items -->
    </div>
  </div>
</div>

<!-- Call-to-action finale -->
<div class="full-width-panel cta-panel">
  <div class="panel-content centered">
    <h2>Ready to Get Started?</h2>
    <p class="lead-text">Compelling call to action message...</p>
    <a href="#" class="cta-button">Start Now</a>
  </div>
</div>' %}