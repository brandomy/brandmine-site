# Development Journal: Visual Style Framework Implementation
Date: 2025-04-28

## Problem Statement
We needed to establish a comprehensive visual style framework for the Brandmine platform that would create clear visual distinction between different content types while maintaining overall design cohesion. Specifically, we needed to determine which image styles to use for which parts of the site, standardize aspect ratios, and develop a practical approach to generating and implementing these images within our Jekyll templates.

## Approach
1. Analyzed our current content types and information architecture to identify distinct categories requiring visual differentiation
2. Explored three primary visual styles: textured minimalism, flat color minimalism, and geometric minimalism
3. Created sample images and tested their effectiveness in different contexts
4. Developed specific prompts for generating images with each style using AI tools (ChatGPT)
5. Formalized guidelines for applying these styles across different sections of the site
6. Enhanced our Jekyll templates and CSS to properly showcase these images
7. Created a comprehensive image strategy document for reference

## Implementation Details

### Visual Style Framework
We established three distinct visual styles:

1. **Textured Minimalism**
   ```css
   /* Example CSS for Textured Minimalism Images */
   .market-sector__image {
     margin-bottom: var(--space-8);
     border-radius: var(--radius-md);
     overflow: hidden;
     box-shadow: var(--shadow-md);
   }

   .market-sector__image-content {
     width: 100%;
     height: auto;
     display: block;
     transition: transform 0.3s ease;
   }

   .market-sector__image:hover .market-sector__image-content {
     transform: scale(1.02);
   }
   ```

2. **Flat Color Minimalism**
   ```css
   /* Example CSS for Flat Minimalism Images */
   .taxonomy-card__image {
     border-radius: var(--radius-sm);
     overflow: hidden;
   }

   .taxonomy-card__image-content {
     width: 100%;
     height: auto;
     display: block;
   }
   ```

3. **Geometric Minimalism**
   ```css
   /* Example CSS for Geometric Minimalism Images */
   .map-component__legend-image {
     border: 1px solid var(--neutral-200);
     border-radius: var(--radius-sm);
   }
   ```

### Card Layout Components
We implemented two distinct card layouts:

1. Generic Sector Card Layout:
```html
<div class="sector-card">
  <div class="sector-card__image-container">
    <img class="sector-card__image" src="/assets/images/sectors/wine.jpg" alt="Wine Industry">
  </div>
  <div class="sector-card__content">
    <h3 class="sector-card__title">Wine Industry</h3>
    <p class="sector-card__description">Global wine production and distribution from vineyard to glass.</p>
    <div class="sector-card__footer">
      <span class="sector-card__count">124 brands</span>
      <a href="/en/discover/sectors/wine/" class="btn btn--sm btn--outline">Explore Sector</a>
    </div>
  </div>
</div>
```

2. Market-Specific Sector Card Layout:
```html
<div class="market-sector-card">
  <div class="market-sector-card__image-container">
    <img class="market-sector-card__image" src="/assets/images/markets/russia/sectors/wine.jpg" alt="Russian Wine Industry">
    <span class="market-badge">Russia</span>
  </div>
  <div class="market-sector-card__content">
    <h3 class="market-sector-card__title">Russian Wine Industry</h3>
    <p class="market-sector-card__description">Black Sea region vineyards producing emerging world-class wines.</p>
    <div class="market-sector-card__stats">
      <div class="market-sector-card__stat">
        <span class="market-sector-card__stat-label">Growth</span>
        <span class="market-sector-card__stat-value">52% over 5 years</span>
      </div>
    </div>
    <div class="market-sector-card__footer">
      <span class="market-sector-card__count">28 brands</span>
      <a href="/en/discover/markets/russia/sectors/wine/" class="btn btn--sm btn--outline">Explore Market Sector</a>
    </div>
  </div>
</div>
```

### Image Prompt Templates
We created standardized prompt templates for each style:

1. **Textured Minimalism Prompt Template**:
```
Create a textured minimalist illustration for [subject]. 3:2 aspect ratio, horizontal composition. Use a minimalist approach with subtle [texture type] textures and gentle shadows. Incorporate stylized [element 1], [element 2], and [element 3] in a balanced composition that extends across at least 80% of the canvas. The main color palette should feature [primary color] with [accent 1] and [accent 2] accents. The style should be [aesthetic quality] yet [aesthetic quality], with clean lines and simplified forms that maintain subtle texture details, with intentional negative space that feels balanced rather than empty. Do not include any text in the image.
```

2. **Flat Color Minimalism Prompt Template**:
```
Create a flat color minimalist illustration representing [subject]. 3:2 aspect ratio, horizontal composition. Use bold, simple geometric shapes with clean edges and zero textures or gradients. Include [number] abstract elements that suggest [concept] without being literal. The color palette should focus on [primary color] as the primary color with limited accent colors (maximum 3-4 total colors). White space should be used intentionally as part of the composition. All elements should be flat with no shadows, highlights, or textures. The style should be modern, clean, and suitable for UI/taxonomy visualization. Do not include any text in the image.
```

3. **Geometric Minimalism Prompt Template**:
```
Create a geometric minimalist illustration of [subject]. 3:2 aspect ratio, horizontal composition. Use simple geometric shapes with minimal depth and subtle shadows for light dimensionality. Incorporate [element 1], [element 2], and [element 3] using precise, structured composition. The color palette should be limited to [primary color] with [accent color] accents and neutral tones. The style should be clean and informational with strong visual organization, suitable for data visualization. Avoid excessive detail in favor of clarity and organization. Do not include any text in the image.
```

## Decisions Made

1. **Style Allocation by Function**
   - **Textured Minimalism**: Used for rich content (market-specific sectors, insight articles, brand profiles)
   - **Flat Color Minimalism**: Used for taxonomy visualization (sectors, markets, attributes, signals)
   - **Geometric Minimalism**: Used for data visualization and structural elements (maps, relationships)

2. **Standard Aspect Ratio**
   - Selected 3:2 horizontal aspect ratio (1200×800px) as the standard for most images
   - This provides good flexibility for various display contexts while maintaining consistency

3. **Color Coding by Dimension**
   - Markets: Sky blue (#0EA5E9)
   - Sectors: Olive green (#A3B763)
   - Attributes: Orange (#F97316)
   - Signals: Purple (#6366F1)

4. **No Text on Images**
   - Made the explicit decision to avoid text on images to:
     - Maintain multilingual flexibility
     - Improve accessibility
     - Support responsive design
     - Allow for content updates without image regeneration

5. **Style Differentiation for UI vs Content**
   - Used flat styles for UI elements to optimize performance and clarity
   - Used textured styles for content to enhance engagement and storytelling
   - This creates clear visual distinction between navigation and content

## Resources

1. **Image Strategy Guide**
   - Comprehensive document outlining application of different styles
   - Reference for prompt creation
   - Guidelines for implementation

2. **Prompt Templates**
   - Standardized templates for each visual style
   - Examples for specific content types

3. **Enhanced CSS**
   - Style improvements for market-sector.css
   - New card component styling
   - Responsive image handling

4. **Jekyll Components**
   - Generic sector card component
   - Market-specific sector card component

## Insights & Learning

1. **Visual Hierarchy Through Style**
   - Different visual styles create natural information hierarchy without requiring explicit labeling
   - Users intuitively understand the difference between navigation elements and content elements

2. **Prompt Engineering Insights**
   - Specific direction about canvas coverage is critical (80% minimum)
   - Clear instruction about avoiding text on images is necessary
   - Color specification works best with specific hex codes

3. **Component Flexibility**
   - The card component approach provides good flexibility while maintaining consistency
   - Parameterized includes support the diverse content needs across the site

4. **Processing Efficiency**
   - Our existing image processing scripts work well with the new style approach
   - The naming conventions already in place support the new visual framework

5. **Design System Integration**
   - The three-style approach integrates well with our existing design tokens
   - BEM methodology helps maintain clear separation between different component styles

## Next Actions

1. **Implementation Priority**
   - Start with market-specific sector images using textured minimalism
   - Then implement generic sector images using flat color minimalism
   - Finally add maps and relationship visualizations using geometric minimalism

2. **CSS Integration**
   - Add the new card styles to our component CSS
   - Update market-sector.css with the enhanced image styling
   - Test responsive behavior across all device sizes

3. **Template Creation**
   - Create the sector-card.html and market-sector-card.html includes
   - Update existing templates to use these new components
   - Test with sample content

4. **Image Generation**
   - Create a prioritized list of needed images across all styles
   - Begin with the most visible and impactful images
   - Process images through our established workflow

5. **Documentation**
   - Distribute the Image Strategy Guide to the team
   - Add image style guidelines to our styleguide section
   - Create a quick-reference for prompt creation

This visual style framework provides a solid foundation for maintaining visual consistency while creating clear distinction between different content types across the Brandmine platform. The approach is scalable as we add new content areas and maximizes the impact of our images while supporting our multilingual requirements.
