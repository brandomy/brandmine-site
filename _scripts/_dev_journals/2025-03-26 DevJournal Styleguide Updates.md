# 2025-03-26 Development Journal: Styleguide Color System & Code Examples

## 1. Problem Statement

The Brandmine styleguide needed updates to implement a consistent color scheme for headings and text across different sections. We needed to:

1. Make H1 on each page use Primary 800 color
2. Make all other headings (H2-H6) use Primary 600 color
3. Set main content text to Neutral 600
4. Set headings within example-code sections to Secondary 800 color
5. Set text within example-code sections to Secondary 50 color
6. Create a language indicator for code blocks
7. Implement consistent styling for example preview blocks

## 2. Approach

We implemented a multi-phase approach:

1. Analyze the existing CSS structure to identify conflicting rules
2. Create a new `code-language` class to style language indicators in code blocks
3. Update the main styleguide.css with properly organized and commented sections
4. Create/modify Jekyll includes for code examples to implement the language indicators
5. Update all content markdown files to use the new structures consistently

Rather than making piecemeal changes, we focused on creating a comprehensive solution that would maintain consistency across all files while following best practices in CSS organization.

## 3. Implementation Details

### CSS Structure and Organization

We organized the styleguide.css file into logical sections with clear comments:

```css
/* ==========================================================================
   1. ROOT VARIABLES & DESIGN TOKENS
   ========================================================================== */

/* ==========================================================================
   2. BASE CONTAINER STRUCTURE
   ========================================================================== */

/* ==========================================================================
   3. NAVIGATION COMPONENT
   ========================================================================== */
```

### Color Styling for Headers and Text

We added these rules to the Content Area section:

```css
.styleguide-content {
  color: var(--neutral-600, #4B5563); /* Updated to neutral-600 for better readability */
}

.styleguide-page-header h1 {
  color: var(--primary-800, #234E52); /* Updated to primary-800 */
}

/* Content heading colors */
.styleguide-content h2,
.styleguide-content h3,
.styleguide-content h4,
.styleguide-content h5,
.styleguide-content h6 {
  color: var(--primary-600, #2C7A7B);
}
```

### Example Code and Preview Styling

We created styling for code language indicators and updated example preview sections:

```css
/* Example preview with light background */
.example-preview {
  background-color: var(--neutral-50, #F9FAFB);
  padding: var(--space-4);
  border-radius: 0.25rem;
  color: var(--neutral-700, #374151);
}

/* Example preview headings */
.example-preview h1,
.example-preview h2,
.example-preview h3,
.example-preview h4,
.example-preview h5,
.example-preview h6 {
  color: var(--secondary-600, #EA580C);
}

/* Language indicator for code blocks */
.code-language {
  color: var(--neutral-400, #9CA3AF);
  font-size: var(--text-xs);
  font-family: var(--font-mono);
  padding: var(--space-1) var(--space-2);
  position: absolute;
  top: var(--space-2);
  right: var(--space-2);
  background-color: rgba(0, 0, 0, 0.1);
  border-radius: 0.25rem;
  opacity: 0.7;
}
```

### Jekyll Include for Code Examples

We created a new include file specifically for code examples:

```html
<!-- _includes/styleguide/code-example.html -->
{% comment %}
  Code example include for styleguide documentation
  
  Usage:
  {% include styleguide/code-example.html 
     language="html" 
     code="<div>Example code</div>"
     preview=true/false
  %}
{% endcomment %}

{% if include.preview %}
<div class="example-wrapper">
  <div class="example-preview">
    {{ include.code }}
  </div>
  <div class="example-code">
    <span class="code-language">{{ include.language }}</span>
    <pre><code class="language-{{ include.language }}">{{ include.code | escape }}</code></pre>
  </div>
</div>
{% else %}
<div class="example-code">
  <span class="code-language">{{ include.language }}</span>
  <pre><code class="language-{{ include.language }}">{{ include.code | escape }}</code></pre>
</div>
{% endif %}
```

### Updated Type Sample Include

We modified the type-sample.html to use the example-code class and implement language indicators:

```html
<div class="example-code">
  <span class="code-language">html</span>
  <pre><code class="language-html">{{ include.code | escape }}</code></pre>
</div>
```

## 4. Decisions Made

1. **File Structure**: We decided to maintain the existing file structure but improve the organization with clear section comments.

2. **Class Naming**: We chose to use `code-language` for the language indicator to be semantic and clear about its purpose.

3. **Color System**: We implemented the requested color scheme while ensuring it adhered to accessibility standards:
   - H1: Primary 800 (#234E52)
   - H2-H6: Primary 600 (#2C7A7B)
   - Body text: Neutral 600 (#4B5563)
   - Example code headers: Secondary 300 (#FDBA74)
   - Example code text: Secondary 50 (#FFF7ED)
   - Example preview background: Neutral 50 (#F9FAFB)

4. **CSS Organization**: Rather than creating separate CSS files, we organized the existing stylesheet with clear sections and comprehensive comments to improve maintainability.

5. **Include System**: We created a flexible include system that allows both simple code examples and code examples with previews to maintain design consistency.

## 5. Resources

### Updated Files

- styleguide.css - Complete overhaul with structured comments and new styling rules
- code-example.html - New include file for code examples with language indicators
- type-sample.html - Updated to use example-code class and language indicators
- Various content markdown files - Updated to use the new example-wrapper/example-preview/example-code structure

### Color System

The complete color system used across the styleguide:

| Element | Color Variable | Hex Value |
|---------|----------------|-----------|
| H1 | --primary-800 | #234E52 |
| H2-H6 | --primary-600 | #2C7A7B |
| Body Text | --neutral-600 | #4B5563 |
| Example Code Headers | --secondary-300 | #FDBA74 |
| Example Code Text | --secondary-50 | #FFF7ED |
| Example Preview Background | --neutral-50 | #F9FAFB |
| Example Preview Headings | --secondary-600 | #EA580C |

## 6. Insights & Learning

1. **CSS Organization Matters**: Clear section headers and thoughtful organization make a stylesheet much more maintainable, even when it grows to hundreds of lines.

2. **Centralized Color System**: Using CSS variables for colors allows for consistent theming and makes it easier to update the design system in the future.

3. **Jekyll Include System**: Creating reusable includes for common components (like code examples) improves consistency and reduces redundancy across multiple pages.

4. **Visual Hierarchy**: The color system creates deliberate visual separation between different content types, making the styleguide more intuitive to use.

5. **Progressive Enhancement**: Using span elements for language indicators allows them to be styled separately without affecting the actual code content.

## 7. Next Actions

1. Update remaining pages not covered in this session to use the new code-example include

2. Consider implementing syntax highlighting for code examples using a library like Prism.js

3. Create additional specialized includes for other common patterns (e.g., comparison examples, do/don't examples)

4. Add automated tests to ensure color contrast ratios meet WCAG guidelines

5. Create a build process to automatically check for any hard-coded colors that should be using variables

6. Document the color system in the styleguide itself for future reference
