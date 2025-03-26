# 2025-03-27 Development Journal: Styleguide Standardization

## 1. Problem Statement

The styleguide for the Brandmine project had several issues that were preventing proper rendering and creating a poor user experience:

1. Inconsistent code example formatting throughout the styleguide files
2. Jekyll build errors due to improper handling of Liquid tags within code examples
3. Missing visual previews for code examples in several files (typography.md, spacing.md)
4. Various structural issues with the example wrapper structures

The most critical technical issue was related to how Liquid syntax was being nested inside code examples, causing Jekyll to try to execute them rather than display them as code.

## 2. Approach

We implemented a comprehensive solution with a multi-step approach:

1. **Standardize code example formats** across all files:
   - Use consistent `example-wrapper` structure with proper nesting for all examples
   - Add visual previews that demonstrate the actual code in action
   - Ensure proper code language indicators and syntax highlighting

2. **Handle Liquid syntax in code examples** using one of three techniques:
   - Using `{% raw %}` and `{% endraw %}` tags to prevent Jekyll from processing Liquid tags
   - Using string templating with double braces for simple cases
   - Using direct HTML with proper escaping for complex examples

3. **Fix file-specific issues** in the following key files:
   - brand-identity.md: Fixed logo system examples and typography section
   - multilingual.md: Fixed form examples and template code blocks
   - spacing.md: Added visual previews for all spacing demonstrations
   - image-handling.md: Fixed nested Liquid tags in code examples

4. **Structure visual previews** to demonstrate functionality:
   - Created actual visual representations of the spacing system
   - Added interactive elements to form examples
   - Ensured color swatches properly displayed brand colors
   - Made typography examples demonstrate the font families they describe

## 3. Implementation Details

### Code Example Standardization

We standardized all code examples to use one of two approaches:

**Approach 1: Include-Based Method (for simple examples)**
```markdown
{% include styleguide/code-example.html 
   language="html" 
   preview=true
   code='<div class="example">Your HTML here</div>' 
%}
```

**Approach 2: Direct HTML Method (for complex examples with previews)**
```html
<div class="example-wrapper">
  <div class="example-preview">
    <!-- Visual example renders here -->
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">...</code></pre>
  </div>
</div>
```

### Liquid Tags Handling

For code examples containing Liquid tags, we implemented the following pattern:

```html
<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">liquid</span>
    <pre><code class="language-liquid">&lt;a href="{% raw %}{{ site.baseurl }}/{{ page.lang }}/brands/{% endraw %}"&gt;
  {% raw %}{{ site.data.translations[page.lang].nav.brands }}{% endraw %}
&lt;/a&gt;</code></pre>
  </div>
</div>
```

### File-Specific Fixes

**spacing.md**: 
- Added visual previews for all spacing examples
- Created actual elements with the specified spacing to demonstrate values
- Added a card component preview and a form elements preview

**typography.md**: 
- Fixed preview displays to show the actual fonts
- Added proper structure for font size and weight examples

**brand-identity.md**:
- Fixed the typography section to show proper previews
- Ensured consistent formatting of example blocks

**multilingual.md**:
- Fixed nested Liquid tags in form examples and templates
- Used raw/endraw tags to prevent Jekyll from processing them

## 4. Decisions Made

1. **Chose a dual implementation approach** (includes and direct HTML) to handle both simple and complex examples while ensuring consistent styling.

2. **Used inline styles in previews** to ensure they display correctly without requiring additional CSS to be loaded.

3. **Opted for visual representations** instead of relying solely on code examples, making the styleguide more intuitive and useful.

4. **Selected the appropriate escaping technique** for each situation based on the complexity of the code example:
   - Raw/endraw tags for complex Liquid syntax
   - HTML escaping for HTML tags within code blocks
   - String templating for simpler Liquid expressions

5. **Maintained visual consistency** across all example types by using the same styling patterns, colors, and spacing.

## 5. Resources

### Created Documentation

```html
<!-- Standard Code Example Template -->
<div class="example-wrapper">
  <div class="example-preview">
    <!-- Visual example here -->
  </div>
  <div class="example-code">
    <span class="code-language">language-name</span>
    <pre><code class="language-name"><!-- Properly escaped code here --></code></pre>
  </div>
</div>
```

### CSS Structure

```css
.example-wrapper {
  margin: var(--space-6) 0;
  border: 1px solid var(--neutral-200);
  border-radius: 0.5rem;
  overflow: hidden;
}

.example-preview {
  padding: var(--space-4);
  background-color: var(--neutral-50);
  border-bottom: 1px solid var(--neutral-200);
}

.example-code {
  position: relative;
  background-color: var(--neutral-800);
  overflow: hidden;
}

.code-language {
  position: absolute;
  top: var(--space-2);
  right: var(--space-2);
  padding: var(--space-1) var(--space-2);
  background-color: rgba(0, 0, 0, 0.3);
  border-radius: 0.25rem;
  font-family: var(--font-mono);
  font-size: var(--text-xs);
  color: var(--neutral-400);
  z-index: 1;
}
```

## 6. Insights & Learning

1. **Jekyll's Liquid Parsing**: Jekyll processes Liquid tags in a sequential manner, which means that nested Liquid tags within code examples can cause build errors if not properly escaped.

2. **Preview Importance**: Visual previews of code examples are critical for a design system, as they help users understand how the code will actually look when implemented.

3. **Consistent Structure**: Having a consistent structure for code examples makes the styleguide more maintainable and easier to understand.

4. **Escape Techniques**: Different situations require different escaping techniques, and choosing the right one depends on the complexity of the code and the desired output.

5. **HTML vs. Includes**: While the include approach is more concise, direct HTML gives more control over complex examples, especially when they contain Liquid tags or need custom styling.

6. **Styleguide as a Product**: The styleguide itself is a product that should follow its own design principles, demonstrating best practices by example.

## 7. Next Actions

1. **Implement an automated testing system** to verify that all styleguide pages build correctly and display as expected.

2. **Create a contribution guide** for adding new examples to the styleguide, ensuring consistent formatting.

3. **Add a copy button** to code examples to improve developer experience.

4. **Consider implementing a component library** for the styleguide itself to further standardize the presentation.

5. **Add more interactive examples** that allow users to modify values and see changes in real-time.

6. **Validate all examples** across different browsers and screen sizes to ensure consistent rendering.

7. **Develop a system for versioning** the styleguide to track changes over time.

8. **Implement a better build process** that catches Liquid syntax errors before they cause build failures.
