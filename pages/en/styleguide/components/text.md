---
layout: styleguide
title: Text Components
description: Brandmine's specialized text components for creating emphasis and flow in content.
permalink: /en/styleguide/components/text/
lang: en
ref: styleguide-components-text
---

## Text Components Overview

Our text components provide specialized typography treatments beyond basic HTML elements. These components create visual hierarchy, guide readers through content, and emphasize important information across the site.

## Hero Subtitle

The hero subtitle provides secondary messaging within hero sections, with lighter weight and generous spacing:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--primary-50); padding: var(--space-6); text-align: center;">
      <h1 style="margin-top: 0; margin-bottom: var(--space-4); font-size: 3rem;">Main Hero Heading</h1>
      <p class="hero-subtitle" style="font-size: 1.5rem; font-weight: 300; max-width: 700px; margin: 0 auto var(--space-8);">The hero subtitle expands on the main heading with additional context, creating a clear hierarchy while maintaining visual connection.</p>
      <a href="#" class="btn-primary">Call to Action</a>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="hero-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h1&gt;Main Hero Heading&lt;/h1&gt;
    &lt;p class="hero-subtitle"&gt;The hero subtitle expands on the main heading with additional context, creating a clear hierarchy while maintaining visual connection.&lt;/p&gt;
    &lt;a href="#" class="btn-primary"&gt;Call to Action&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Lead Text

Lead text provides an introduction or summary at the beginning of a section, using larger font size and improved spacing:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="padding: var(--space-4);">
      <h2 style="margin-top: 0; margin-bottom: var(--space-4);">Section Title</h2>
      <p class="lead-text" style="font-size: 1.125rem; line-height: 1.6; margin-bottom: var(--space-8); max-width: 800px; margin-left: auto; margin-right: auto; color: var(--neutral-700);">Lead text introduces a section with slightly larger font size and more generous line height, creating visual emphasis while maintaining readability. It's perfect for summarizing content that follows.</p>
      <p>Regular paragraph text follows the lead text, creating a clear hierarchy between the introductory content and the detailed information that follows.</p>
      <p>Additional paragraphs continue the content with standard typography.</p>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="panel-content"&gt;
  &lt;h2&gt;Section Title&lt;/h2&gt;
  &lt;p class="lead-text"&gt;Lead text introduces a section with slightly larger font size and more generous line height, creating visual emphasis while maintaining readability. It's perfect for summarizing content that follows.&lt;/p&gt;
  &lt;p&gt;Regular paragraph text follows the lead text, creating a clear hierarchy between the introductory content and the detailed information that follows.&lt;/p&gt;
  &lt;p&gt;Additional paragraphs continue the content with standard typography.&lt;/p&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Panel Lead Text

Within panels, lead text receives special treatment with a slightly larger size:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--neutral-100); padding: var(--space-6); border-radius: 0.5rem;">
      <h2 style="margin-top: 0; text-align: center; margin-bottom: var(--space-4); color: var(--secondary-600);">Panel Section Title</h2>
      <p style="font-size: 1.2rem; line-height: 1.6; margin-bottom: var(--space-8); max-width: 800px; margin-left: auto; margin-right: auto; color: var(--neutral-700);">Panel lead text uses slightly larger sizing than standard lead text, creating greater emphasis within panel contexts. It helps establish the panel's focus and guides users through complex content sections.</p>
      <p>Regular paragraph text follows with standard sizing and spacing.</p>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="full-width-panel light-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h2&gt;Panel Section Title&lt;/h2&gt;
    &lt;p class="lead-text"&gt;Panel lead text uses slightly larger sizing than standard lead text, creating greater emphasis within panel contexts. It helps establish the panel's focus and guides users through complex content sections.&lt;/p&gt;
    &lt;p&gt;Regular paragraph text follows with standard sizing and spacing.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Conclusion Text

Conclusion text provides visual separation for summary content with a subtle top border:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="padding: var(--space-4);">
      <p>Regular paragraph content precedes the conclusion text.</p>
      <p>Several paragraphs may provide detailed information.</p>
      <div class="conclusion-text" style="font-size: 1.125rem; border-top: 1px solid rgba(0, 0, 0, 0.1); margin-top: var(--space-8); padding-top: var(--space-6);">
        <p>Conclusion text summarizes key points or provides a final thought, separated from the main content with a subtle divider. This visual distinction helps readers identify summary information and next steps.</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="panel-content"&gt;
  &lt;p&gt;Regular paragraph content precedes the conclusion text.&lt;/p&gt;
  &lt;p&gt;Several paragraphs may provide detailed information.&lt;/p&gt;
  &lt;div class="conclusion-text"&gt;
    &lt;p&gt;Conclusion text summarizes key points or provides a final thought, separated from the main content with a subtle divider. This visual distinction helps readers identify summary information and next steps.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Responsive Behavior

All text components are responsive, adapting to different screen sizes:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: flex; justify-content: space-between; gap: var(--space-4); text-align: left; font-size: 0.875rem;">
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-4); height: auto; width: 280px; margin-bottom: var(--space-2);">
          <h3 style="font-size: 1rem; margin-top: 0; margin-bottom: var(--space-2);">Desktop</h3>
          <p style="font-size: 1.5rem; line-height: 1.4; margin-bottom: var(--space-2);">Hero Subtitle</p>
          <p style="font-size: 1.125rem; line-height: 1.6; margin-bottom: var(--space-2);">Lead Text</p>
          <p style="font-size: 1.2rem; line-height: 1.6; margin-bottom: 0;">Panel Lead Text</p>
        </div>
        <div>Desktop View</div>
        <div style="color: var(--neutral-500); font-size: 0.75rem;">1200px+</div>
      </div>
      
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-4); height: auto; width: 220px; margin-bottom: var(--space-2);">
          <h3 style="font-size: 0.9rem; margin-top: 0; margin-bottom: var(--space-2);">Tablet</h3>
          <p style="font-size: 1.4rem; line-height: 1.4; margin-bottom: var(--space-2);">Hero Subtitle</p>
          <p style="font-size: 1.1rem; line-height: 1.6; margin-bottom: var(--space-2);">Lead Text</p>
          <p style="font-size: 1.15rem; line-height: 1.6; margin-bottom: 0;">Panel Lead Text</p>
        </div>
        <div>Tablet View</div>
        <div style="color: var(--neutral-500); font-size: 0.75rem;">768px - 992px</div>
      </div>
      
      <div>
        <div style="border: 1px solid var(--neutral-300); border-radius: 0.25rem; padding: var(--space-4); height: auto; width: 160px; margin-bottom: var(--space-2);">
          <h3 style="font-size: 0.85rem; margin-top: 0; margin-bottom: var(--space-2);">Mobile</h3>
          <p style="font-size: 1.25rem; line-height: 1.4; margin-bottom: var(--space-2);">Hero Subtitle</p>
          <p style="font-size: 1rem; line-height: 1.6; margin-bottom: var(--space-2);">Lead Text</p>
          <p style="font-size: 1.1rem; line-height: 1.6; margin-bottom: 0;">Panel Lead Text</p>
        </div>
        <div>Mobile View</div>
        <div style="color: var(--neutral-500); font-size: 0.75rem;">< 768px</div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">/* Base text component styles */
.hero-subtitle {
  font-size: 1.5rem;
  font-weight: 300;
  line-height: 1.4;
}

.lead-text {
  font-size: 1.125rem;
  line-height: 1.6;
}

.panel-lead-text {
  font-size: 1.2rem;
  line-height: 1.6;
}

/* Tablet styles */
@media (max-width: 992px) {
  .hero-subtitle {
    font-size: 1.4rem;
  }
  
  .lead-text {
    font-size: 1.1rem;
  }
  
  .panel-lead-text {
    font-size: 1.15rem;
  }
}

/* Mobile styles */
@media (max-width: 768px) {
  .hero-subtitle {
    font-size: 1.25rem;
  }
  
  .lead-text {
    font-size: 1rem;
  }
  
  .panel-lead-text {
    font-size: 1.1rem;
  }
}</code></pre>
  </div>
</div>

## Implementation Guidelines

### Text Component Usage

1. **Hero Subtitle** - Use only in hero sections, directly following the main h1 heading
2. **Lead Text** - Use at the beginning of content sections to introduce the topic
3. **Panel Lead Text** - Use in panels where additional emphasis is needed
4. **Conclusion Text** - Use at the end of a content section to summarize or transition

### Best Practices

1. **Maintain hierarchy** - Ensure proper heading (h1-h6) usage before specialized text components
2. **Respect maximum widths** - Text components have max-width settings for optimal readability
3. **Use sparingly** - Reserve these components for their intended purpose to maintain impact
4. **Keep content concise** - These components work best with focused, direct messaging
5. **Preserve visual space** - Maintain the specified margins to create proper rhythm

### Example Section Structure

<div class="example-wrapper">
  <div class="example-preview">
    <div style="background-color: var(--neutral-50); padding: var(--space-6); border-radius: 0.5rem;">
      <h2 style="margin-top: 0; margin-bottom: var(--space-4);">Complete Section Example</h2>
      <p style="font-size: 1.125rem; line-height: 1.6; margin-bottom: var(--space-6); color: var(--neutral-700);">This lead text introduces the complete section, providing context for what follows. It uses proper line height and spacing to create emphasis.</p>
      
      <h3 style="margin-bottom: var(--space-3);">Subsection Heading</h3>
      <p>Regular paragraph text provides the main content details. Multiple paragraphs can be used to fully explain concepts.</p>
      <p>Additional paragraphs expand on the content as needed using standard typography.</p>
      
      <h3 style="margin-top: var(--space-6); margin-bottom: var(--space-3);">Another Subsection</h3>
      <p>More regular content continues the information flow with appropriate spacing.</p>
      
      <div style="border-top: 1px solid var(--neutral-200); margin-top: var(--space-8); padding-top: var(--space-6);">
        <p style="font-size: 1.125rem; color: var(--neutral-700);">This conclusion text provides a summary of the section and directs users to related content or next steps.</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="panel-content"&gt;
  &lt;h2&gt;Complete Section Example&lt;/h2&gt;
  &lt;p class="lead-text"&gt;This lead text introduces the complete section, providing context for what follows. It uses proper line height and spacing to create emphasis.&lt;/p&gt;
  
  &lt;h3&gt;Subsection Heading&lt;/h3&gt;
  &lt;p&gt;Regular paragraph text provides the main content details. Multiple paragraphs can be used to fully explain concepts.&lt;/p&gt;
  &lt;p&gt;Additional paragraphs expand on the content as needed using standard typography.&lt;/p&gt;
  
  &lt;h3&gt;Another Subsection&lt;/h3&gt;
  &lt;p&gt;More regular content continues the information flow with appropriate spacing.&lt;/p&gt;
  
  &lt;div class="conclusion-text"&gt;
    &lt;p&gt;This conclusion text provides a summary of the section and directs users to related content or next steps.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>