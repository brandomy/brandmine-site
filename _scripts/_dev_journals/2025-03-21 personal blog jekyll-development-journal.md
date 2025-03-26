# Jekyll Development Journal - March 21, 2025

## Problem Statement

Our Jekyll blog had two main issues to solve:

1. **Category Display Inconsistency**: 
   - Categories displayed as "Brand thoughts" (sentence case) rather than "Brand Thoughts" (title case)
   - The inconsistency appeared in both post pages and category pages
   - Clicking on categories resulted in 404 errors

2. **Image Display Issue**:
   - Images inserted in Markdown on category pages weren't displaying

## Approach

We tackled the issues through a systematic approach:

1. **For Category 404 Errors**: 
   - Verified correct file structure for Jekyll category pages
   - Ensured category files were in the proper location with correct front matter

2. **For Title Case Consistency**:
   - Identified how Jekyll was processing category names in templates 
   - Replaced the simple `capitalize` filter with a more comprehensive solution
   - Applied the fix across all relevant templates (`post.html`, `category.html`, `home.html`)

3. **For Image Display**:
   - Modified the `category.html` layout to properly process Markdown content
   - Added content wrapping to ensure proper rendering

## Implementation Details

### Category Structure Fix

The proper Jekyll directory structure for category pages:

```
your-github-repo/
├── _posts/
│   └── 2025-03-21-thoughts-on-my-why.md
├── _layouts/
│   ├── default.html
│   ├── post.html
│   └── category.html
├── categories/
│   └── brand-thoughts.md
└── categories.md
```

### Title Case Implementation

We replaced Jekyll's basic `capitalize` filter with a custom approach to properly handle multi-word categories:

```liquid
{% assign words = page.category | replace: '-', ' ' | split: ' ' %}
{% capture titlecase %}
  {% for word in words %}
    {{ word | capitalize }}
    {% unless forloop.last %} {% endunless %}
  {% endfor %}
{% endcapture %}
{{ titlecase }}
```

This snippet was added to three key template files:

1. In `post.html` for individual blog posts:
```html
{% if page.category %}
  • <span class="post-category">
    <a href="/categories/{{ page.category }}/">
      {% assign words = page.category | replace: '-', ' ' | split: ' ' %}
      {% capture titlecase %}
        {% for word in words %}
          {{ word | capitalize }}
          {% unless forloop.last %} {% endunless %}
        {% endfor %}
      {% endcapture %}
      {{ titlecase }}
    </a>
  </span>
{% endif %}
```

2. In `category.html` for category pages:
```html
<h2>Posts in 
  {% assign words = page.category | replace: '-', ' ' | split: ' ' %}
  {% capture titlecase %}
    {% for word in words %}
      {{ word | capitalize }}
      {% unless forloop.last %} {% endunless %}
    {% endfor %}
  {% endcapture %}
  {{ titlecase }}
</h2>
```

3. In `home.html` for the homepage post listings:
```html
{% if post.category %}
  • <span class="post-category">
    <a href="/categories/{{ post.category }}/">
      {% assign words = post.category | replace: '-', ' ' | split: ' ' %}
      {% capture titlecase %}
        {% for word in words %}
          {{ word | capitalize }}
          {% unless forloop.last %} {% endunless %}
        {% endfor %}
      {% endcapture %}
      {{ titlecase }}
    </a>
  </span>
{% endif %}
```

### Image Display Fix

The key fix for image display was updating the `category.html` layout to properly process Markdown content:

```html
<div class="category">
  <h1 class="page-heading">{{ page.title }}</h1>

  <div class="category-content">
    {{ content }}
  </div>

  <!-- Rest of the category layout -->
</div>
```

The crucial change was wrapping the `{{ content }}` in a `<div class="category-content">` element.

## Decisions Made

1. **Title Case Implementation**:
   - Decided to create a custom title case solution rather than using a plugin
   - Rationale: More control over the formatting, no additional dependencies

2. **Template Consistency**:
   - Added category display to the homepage posts list for consistency
   - Rationale: Provides better navigation and consistent user experience

3. **Markdown Processing**:
   - Chose to keep using Markdown syntax for images rather than switching to HTML
   - Rationale: Maintains a cleaner content file and better separation of content and presentation

4. **Directory Structure**:
   - Followed Jekyll's conventional structure for category pages
   - Rationale: Adhering to platform conventions makes future maintenance easier

## Resources Created

1. **Updated Templates**:
   - Modified `post.html`, `category.html`, and `home.html` with title case functionality
   - Each template now consistently displays categories properly formatted

2. **Example Directory Structure**:
   - Created reference for proper Jekyll directory organization

3. **CSS Suggestions**:
   - Provided styling recommendations for category page images:
   ```css
   .category-content img {
     max-width: 100%;
     height: auto;
     margin: 20px 0;
     border-radius: 4px;
     box-shadow: 0 2px 4px rgba(0,0,0,0.1);
   }
   ```

## Insights & Learning

1. **Jekyll Template Hierarchy**:
   - Content processing flows through layout templates
   - Layout templates must properly handle Markdown content for it to render correctly

2. **Jekyll's Filter Limitations**:
   - The built-in `capitalize` filter only capitalizes the first word
   - For more complex formatting, custom Liquid code is required

3. **Content vs. Presentation Separation**:
   - Jekyll maintains a separation between content (in Markdown) and presentation (in templates)
   - Issues often arise at the boundary between these layers

4. **Markdown Processing in Layouts**:
   - Markdown content needs proper container elements to render correctly
   - Simply including `{{ content }}` may not be sufficient for all content types

## Next Actions

1. **Create Reusable Include** (Optional):
   - Consider moving the title case code to a reusable include file for cleaner templates:
   ```html
   <!-- _includes/titlecase.html -->
   {% assign words = include.string | replace: '-', ' ' | split: ' ' %}
   {% capture titlecase %}
     {% for word in words %}
       {{ word | capitalize }}
       {% unless forloop.last %} {% endunless %}
     {% endfor %}
   {% endcapture %}
   {{ titlecase }}
   ```

2. **CSS Enhancements**:
   - Add the suggested CSS for better image styling on category pages

3. **Category Expansion**:
   - Create additional category page templates as content expands
   - Ensure each new category follows the established pattern

4. **Testing**:
   - Verify all changes across different browsers and devices
   - Check both desktop and mobile views

5. **Documentation**:
   - Update project documentation with the new conventions established
   - Create a workflow document for adding new categories and posts

This development session resolved two significant display issues in the Jekyll blog, improving both functionality and visual consistency. The changes maintain Jekyll's content-template separation while ensuring proper rendering across the site.
