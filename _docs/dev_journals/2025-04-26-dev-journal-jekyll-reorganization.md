# Development Journal: Jekyll Component Reorganization
Date: 2025-04-26

## Problem Statement
We needed to reorganize the Jekyll includes and CSS files to create a more maintainable and structured codebase. The existing flat structure had resulted in a growing collection of includes without clear organization, making it difficult to find, maintain, and extend components. Similarly, CSS files were scattered without a logical hierarchy that reflected component relationships.

## Approach
1. Created a detailed migration plan to ensure nothing would break during reorganization
2. Identified all template references using a custom script to understand dependency relationships
3. Implemented a folder structure that grouped includes by purpose (components, collections, layout)
4. Created redirector includes to maintain backward compatibility during migration
5. Systematically moved files from flat structure to organized hierarchy
6. Tested thoroughly throughout the process to ensure site functionality remained intact

## Implementation Details

### New Folder Structure
We implemented the following structure for includes:

```
_includes/
  components/         # Reusable UI components
    cards/            # Card-style components
      brand-card.html
      insight-card.html
      testimonial-card.html
    carousels/        # Carousel-style components
      featured-brands-carousel.html
    navigation/       # Navigation-related components
      header-nav.html
      language-switcher.html
    search/           # Search-related components
      search-box.html
      filter-controls.html
  collections/        # Collection-specific components
    brands/           # Brand collection components
      brand-list.html
      brand-filters.html
    dimensions/       # Dimension (formerly tags) components
      dimension-grid.html
      dimension-filters.html
    insights/         # Insight collection components
      insights-grid.html
      insights-filters.html
  layout/             # Layout components
    header.html
    footer.html
    panel.html
```

And aligned CSS with a similar structure:

```
assets/css/
  tokens/             # Design tokens (kept as is)
  base/               # Base styles
  components/         # Component-specific styles
    cards/
    carousels/
    navigation/
    search/
  collections/        # Collection-specific styles
    brands/
    dimensions/
    insights/
  layout/             # Layout styles
  pages/              # Page-specific styles (kept as is)
  utils/              # Utility styles
```

### Redirector System
For each component, we created a redirector in the original location to maintain backward compatibility:

```liquid
{% comment %}
  REDIRECTOR: This include forwards to the new location.
  Please update your references to use:
  {% include components/cards/brand-card.html %}
{% endcomment %}

{% include components/cards/brand-card.html 
   brand=include.brand 
   featured=include.featured %}
```

### Migration Process
We followed a phased approach:
1. Started with simpler components with fewer references
2. Moved to collection-specific components
3. Handled complex, widely-used components like icons
4. Finally migrated critical layout components (header, footer)

## Decisions Made

1. **Hierarchy Structure**
   - We chose to categorize includes by function first (components, collections, layout) and then by type (cards, navigation, etc.)
   - This structure reflects both technical and semantic relationships between files

2. **Redirector Approach**
   - Instead of immediately updating all references, we implemented redirectors
   - This allowed continuous site functionality during migration
   - Provides a path for gradually updating references

3. **Component Documentation**
   - Added standardized documentation headers to each component in its new location
   - Documents purpose, parameters, dependencies, and usage examples

4. **CSS Alignment**
   - Created CSS directory structure that mirrors the include structure
   - This makes relationships between HTML and CSS clearer

5. **Migration Order**
   - Prioritized simpler, less critical components first
   - Left layout components (header, footer) for last to minimize risk

## Resources

1. **Migration Tracking Table**
   - Created comprehensive table of all includes with their new locations
   - Included redirector code for each component
   - Tracked migration progress and testing status

2. **Include Reference Finder Script**
   - Created Python script to identify all template references
   - Helped understand dependencies and prioritize migration

3. **Component Documentation Template**
   ```
   {% comment %}
     Include Name: [component-name.html]
     
     Purpose: [Brief description of what this component does]
     
     Parameters:
     - param1: [Description] (required/optional)
     - param2: [Description] (required/optional)
     
     Dependencies:
     - CSS: [path to CSS file]
     - JS: [path to JS file, if any]
     - Other includes: [list other includes this one depends on]
     
     Example Usage:
     {% include path/to/component.html param1="value" param2="value" %}
   {% endcomment %}
   ```

## Insights & Learning

1. **Dependency Mapping Is Crucial**
   - Understanding dependencies before migration saved numerous potential issues
   - The reference finder script was invaluable for mapping relationships

2. **Incremental Migration Works Best**
   - The redirector approach allowed for smooth migration without site disruption
   - Testing at each step caught issues early before they became larger problems

3. **Structure Reflects Purpose**
   - Organizing by function first, then type created a more intuitive structure
   - Developers can now more easily find related components

4. **Documentation Adds Value**
   - Adding standardized documentation to each component improves maintainability
   - New team members will be able to understand component usage more quickly

5. **CSS/HTML Relationship Clarity**
   - Aligning CSS structure with component structure makes it easier to find related styles
   - Reduces the risk of orphaned or duplicated CSS

## Next Actions

1. **Update Direct References**
   - Begin updating direct references to use new paths
   - Start with the home page, then move to other key sections

2. **Remove Redirectors**
   - After all references are updated, remove redirector files
   - This should be done gradually, testing after each batch

3. **Create Component Guide**
   - Develop a comprehensive component guide documenting all available components
   - Include usage examples and parameter options

4. **Update Build Process**
   - Consider implementing automatic CSS bundling for component styles
   - This would allow importing only needed component styles

5. **Review Performance Impact**
   - Analyze if the new structure impacts site performance
   - Look for opportunities to optimize loading

6. **Document Conventions**
   - Create a clear naming and organization guide for future development
   - Ensure all team members understand the new structure
