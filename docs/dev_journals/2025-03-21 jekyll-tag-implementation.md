# Jekyll Blog Tag Implementation and Styling

## Problem Statement

We needed to implement a tag system for the Jekyll-based personal blog (Brandomy) to better organize content under conversational categories like "Spotted in China", "Lost in Translation", "Cool Designs", etc. The implementation needed to:

1. Allow posts to be tagged with multiple categories
2. Display tags on individual posts in a subtle, tasteful manner
3. Create a tags index page showing all posts by tag
4. Ensure proper navigation between posts and tag pages
5. Maintain clean, minimal aesthetics consistent with the blog's design

## Approach

We implemented a tag system using Jekyll's built-in tagging capabilities with some custom enhancements:

1. Created a main tags index page that displays all tags and associated posts
2. Used a fragment identifier approach (anchors) for individual tags rather than separate pages for each tag
3. Added custom CSS for styling tags in both post display and tag index contexts
4. Modified templates to display tags on posts and create the proper navigation structure
5. Iteratively refined the visual design to make tags subtle and non-intrusive

## Implementation Details

### 1. Tags Page Implementation

We created a `tags.md` file in the root directory to serve as the main tag index:

```markdown
---
layout: page
title: Tags
permalink: /tags/
---

<div class="tags-page">
  <h2>Browse by Tag</h2>
  
  <div class="tag-cloud">
    {% assign all_tags = "" | split: "" %}
    {% for post in site.posts %}
      {% for tag in post.tags %}
        {% assign all_tags = all_tags | push: tag %}
      {% endfor %}
    {% endfor %}
    
    {% assign unique_tags = all_tags | uniq | sort %}
    
    {% for tag in unique_tags %}
      <a href="#{{ tag | slugify }}" class="tag-link">
        {{ tag }}
      </a>
    {% endfor %}
  </div>
  
  <div class="tag-groups">
    {% for tag in unique_tags %}
      <div class="tag-group" id="{{ tag | slugify }}">
        <h3>{{ tag }}</h3>
        <ul class="post-list">
          {% for post in site.posts %}
            {% if post.tags contains tag %}
              <li>
                <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
                <small class="post-date">{{ post.date | date: "%b %-d, %Y" }}</small>
              </li>
            {% endif %}
          {% endfor %}
        </ul>
      </div>
    {% endfor %}
  </div>
</div>
```

This approach:
- Collects all tags from all posts
- Creates a unique, sorted list of tags
- Generates a tag cloud at the top
- Creates sections for each tag with associated posts listed below

### 2. Post Layout Modification

We updated the post layout to include tag display:

```html
{% if page.tags %}
<div class="post-tags">
  <span class="post-tags-label">Tags:</span>
  {% for tag in page.tags %}
    <a href="/tags/#{{ tag | slugify }}" class="post-tag-item">{{ tag }}</a>
  {% endfor %}
</div>
{% endif %}
```

This displays tags on individual posts and links them to the relevant tag sections on the main tags page.

### 3. CSS Styling

We created a dedicated CSS file (`assets/css/tags.css`) for tag styling:

```css
/* Post tag styling */
.post-tags {
  margin: 10px 0 20px;
  font-size: 0.85em;
  color: #666;
}

.post-tags-label {
  font-weight: normal;
  color: #888;
  margin-right: 6px;
}

.post-tag-item {
  display: inline-block;
  background-color: #f8f8f8;
  border-radius: 3px;
  padding: 2px 8px;
  margin-right: 6px;
  margin-bottom: 6px;
  font-size: 0.9em;
  color: #666;
  border: 1px solid #eee;
  transition: all 0.2s ease;
}

/* Tag page styling */
.tag-cloud {
  margin: 20px 0 30px;
  line-height: 2.2;
  padding: 15px 0;
  border-bottom: 1px solid #eee;
}

.tag-link {
  display: inline-block;
  margin: 0 8px 10px 0;
  padding: 3px 10px;
  background-color: #f8f8f8;
  border-radius: 3px;
  font-size: 0.9em;
  color: #666;
  border: 1px solid #eee;
}

.tag-group h3 {
  color: #555;
  padding-bottom: 8px;
  border-bottom: 1px solid #eee;
  font-weight: 500;
}

/* More styles omitted for brevity */
```

The CSS was carefully designed to make tags subtle on posts while still being functional, and to create an organized, clean tag index page.

### 4. Adding Tags to Posts

For each post, we added tags to the YAML front matter:

```yaml
---
layout: post
title: "Welcome to Brandomy"
date: 2025-03-20 08:00:00 +0800
category: brand-thoughts
tags:
  - Life Lessons
  - Small Wonders
---
```

## Decisions Made

1. **Anchor-based Navigation vs. Individual Tag Pages**
   - Initially attempted to create individual pages for each tag
   - Encountered errors with Jekyll's tag sorting system
   - Simplified by using anchor links within a single comprehensive tag page
   - Benefits: Easier maintenance, simpler navigation, better user experience

2. **Tag Styling Approach**
   - Initially had more prominent tag styling
   - Iteratively refined to make tags more subtle
   - Added separate styling for "Tags:" label
   - Used muted colors and minimal borders to reduce visual weight
   - Changed tag headers from blue (link-like) to gray to prevent confusion

3. **Tag Collection Organization**
   - Decided to manually build tag lists from posts rather than use Jekyll's built-in `site.tags`
   - This avoided sorting issues and gave more control over the display

4. **CSS Organization**
   - Created a dedicated CSS file for tag-related styles
   - Organized by context (post vs. tag page)
   - Removed duplications and optimized selectors
   - Used consistent styling patterns

## Resources

1. **Tag Styles CSS**
   - Created a complete `tags.css` file with optimized styling
   - Organized logically with clear comments
   - Responsive design considerations included

2. **Tag Generator Script**
   - Initially created a Ruby script to generate tag pages
   - Later simplified approach, but script remains available if needed

## Insights & Learning

1. **Jekyll Tag System Limitations**
   - Jekyll's built-in tag system can be problematic with certain operations like sorting
   - Building custom tag collections provides more flexibility
   - Anchor-based navigation is often simpler than individual pages for tags

2. **CSS Organization Principles**
   - Group related styles logically
   - Avoid duplication by consolidating selectors
   - Use clear comments to define sections
   - Maintain consistent property ordering

3. **Visual Hierarchy in Blog Design**
   - Tags should be present but not compete with content
   - Subtle styling (lighter colors, smaller text) helps maintain focus on main content
   - Color choices impact perceived clickability (blue = link)
   - Small visual cues like borders can define sections without being obtrusive

4. **Jekyll Template Logic**
   - Using Liquid to build collections from posts
   - Filtering and sorting techniques
   - Using conditionals to only display tags when they exist

## Next Actions

1. **Consider Tag Popularity Visualization**
   - Could enhance the tag cloud to show tag popularity (size or intensity variation)
   - Would require counting occurrences of each tag across all posts

2. **Tag-based Related Posts**
   - Consider adding a "Related Posts" section at the end of each post
   - Would show other posts sharing the same tags

3. **Tag Integration with Categories**
   - Explore how tags and categories can work together
   - Consider whether to maintain both systems or consolidate

4. **Update Configuration**
   - Add `tags.md` to navigation menu in `_config.yml` if desired
   - Consider enabling future dated posts with `future: true` setting

5. **Performance Monitoring**
   - Check page load performance with tag system in place
   - Ensure tag retrieval and display doesn't slow down the site

6. **Content Strategy**
   - Develop a consistent tagging strategy to avoid tag proliferation
   - Consider limiting to the pre-defined conversational tags list
