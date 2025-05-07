# Development Journal: Jekyll Layout Refactoring Planning
**Date:** 2025-05-07  
**Topic:** Directory Documentation and Layout Code Refactoring

## 1. Problem Statement

Our Jekyll site has grown in complexity, with multi-layered directory structures and increasing logic in layout files. We identified two key issues to address:

1. **Documentation Gap**: The project lacked comprehensive documentation of directory structures, making it difficult to understand the organization and purpose of files.

2. **Logic-Heavy Layouts**: Layout files (particularly `brand.html` and `dimension.html`) contain excessive Liquid logic that should be extracted to dedicated include files for better maintainability.

## 2. Approach

We approached these challenges through a structured, multi-phase plan:

1. **Directory Documentation**: Create comprehensive README files for key directories to document their structure, purpose, and usage patterns.

2. **Layout Analysis**: Analyze layout files to identify logic-heavy sections that could be extracted into includes.

3. **Refactoring Planning**: Develop a detailed plan for extracting logic into properly organized include files.

## 3. Implementation Details

### Directory Documentation

We created four comprehensive README files for key directories:

1. **`_includes/README.md`**: Documents the component organization, naming conventions, and usage patterns for all include files.

2. **`_layouts/README.md`**: Explains the purpose and dependencies of each layout file, including which includes they rely on and their key content sections.

3. **`_data/README.md`**: Details the data organization, multilingual implementation, and relationships between data files.

4. **`assets/README.md`**: High-level overview of all asset types with links to more specific documentation:
   - `assets/images/README.md`: Detailed image handling documentation
   - `assets/css/README.md`: CSS architecture documentation
   - `assets/js/README.md`: JavaScript organization documentation

Each README follows a consistent format including:
- Directory structure visualization
- Purpose explanations for components/files
- Usage examples
- Best practices
- Relationships to other directories

### Layout Analysis

We performed a detailed analysis of all layout files to determine their "logic weight":

| Layout File | Logic Weight | Primary Issues |
|-------------|--------------|----------------|
| brand.html | Heavy | Extensive conditionals, loops for rendering tags, social media, etc. |
| dimension.html | Heavy | Complex loops for filtering brands, embedded JavaScript |
| insight.html | Moderate to Heavy | Many conditionals, complex tag rendering |
| insights.html | Moderate to Heavy | Complex filtering logic, loops for taxonomies |
| discover.html | Light | Already follows best practices |
| discovery.html | Light | Already follows best practices |
| brands.html | Moderate to Heavy | Complex search/filtering, embedded JavaScript |
| market-sector.html | Moderate | Multiple conditional sections |

### Refactoring Plan

We developed a structured approach to extract logic from layouts into dedicated includes:

1. **Create layout-specific include directories**:
```
_includes/
├── brand/            # For brand.html layout
├── brands/           # For brands.html layout
├── dimension/        # For dimension.html layout
├── discovery/        # For discovery layouts
├── insight/          # For insight.html layout
├── insights/         # For insights.html layout
├── market-sector/    # For market-sector.html layout
```

2. **Extract specific components from each layout**:

For `brand.html`:
```
_includes/brand/
├── header.html         # Brand header with logo and metadata
├── meta-section.html   # Metadata display (sectors, markets, etc.)
├── sidebar.html        # Sidebar content
├── timeline.html       # Brand timeline
├── gallery.html        # Brand image gallery
├── certifications.html # Certifications and awards
├── international.html  # International presence
├── location.html       # Location intelligence with map
├── related-brands.html # Related brands display
```

Similarly detailed plans were created for each layout file.

3. **Extract embedded JavaScript** to dedicated files:
```
assets/js/
├── brand/
│   ├── map-initialization.js    # Map initialization from brand.html
│   └── gallery-viewer.js        # Gallery functionality
├── brands/
│   └── filtering.js             # Filtering logic from brands.html
├── dimension/
│   └── filtering.js             # Filtering logic from dimension.html
```

## 4. Decisions Made

1. **Keep Existing Includes Structure**: Maintain the current component-based organization (`components/cards/`, `components/navigation/`, etc.) for reusable elements while adding layout-specific directories for layout segments.

2. **Use a Phased Implementation**: Start with the heaviest layouts first (brand.html and dimension.html) and progress to lighter ones as experience is gained.

3. **Extract JavaScript**: Move all embedded JavaScript to separate files, completely separating behavior from structure.

4. **Maintain Consistent Patterns**: Use similar extraction patterns across different layouts to create consistency in implementation.

5. **Document Dependencies**: Add clear documentation about which includes are required by which layouts.

## 5. Resources

- **Generated Documentation**:
  - `jekyll-layout-analysis.md`: Comprehensive analysis of layout logic density
  - `_includes/README.md`: Complete includes directory documentation
  - `_layouts/README.md`: Layout file documentation
  - `_data/README.md`: Data directory documentation
  - `assets/README.md`: High-level assets overview
  - `assets/css/README.md`: CSS architecture documentation
  - `assets/js/README.md`: JavaScript organization documentation

- **Directory Structure Visualizations**:
  - `includes_structure.txt`
  - `layouts_structure.txt`
  - `data_structure.txt`
  - `assets_structure.txt`

## 6. Insights & Learning

1. **Documentation as Learning**: The process of creating documentation improved our own understanding of the codebase organization and highlighted inconsistencies and opportunities for improvement.

2. **Logic Separation Benefits**: Keeping layouts logic-light by extracting complexity to dedicated includes offers multiple benefits:
   - Improved readability of layout files
   - Better reusability of logical components
   - Easier maintenance and debugging
   - Cleaner separation of concerns
   - Improved collaboration potential

3. **Industry Best Practices**: This approach aligns with industry best practices in static site generation, similar to patterns seen in modern frameworks like React (components) and Vue (single-file components).

4. **Directory Structure Matters**: The organization of files significantly impacts development efficiency and maintainability. The new README files will help maintain consistent organization patterns.

5. **Accessibility of Documentation**: Having README files directly in the relevant directories makes documentation more discoverable and useful during development.

## 7. Next Actions

1. □ **Start with Brand Layout**: Implement the first refactoring with `brand.html`:
   - Create `_includes/brand/` directory 
   - Extract `header.html` component first
   - Test thoroughly before continuing

2. □ **Extract JavaScript**: Create `assets/js/brand/map-initialization.js` to remove embedded JavaScript

3. □ **Create Refactoring Template**: Document the process to serve as a template for refactoring other layouts

4. □ **Implement Dimension Layout**: After successfully refactoring brand layout, move on to dimension.html

5. □ **Document Changes**: Update the main README with refactoring progress

6. □ **Performance Testing**: Measure performance impact of the refactoring

The refactoring will be implemented incrementally, with thorough testing after each component extraction to ensure functionality is maintained.
