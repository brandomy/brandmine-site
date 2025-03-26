# Technical Briefing for Brandmine Implementation

This document serves as a technical reference for implementing the Brandmine site restructuring. It covers the key technical aspects that need to be addressed during implementation.

## 1\. Jekyll Site Structure

### Content Organization

```
brandmine/
├── _config.yml                 # Jekyll configuration
├── _data/                      # Data files
│   ├── tag_translations.yml    # Tag translations
│   └── translations/           # UI translations by language
│       ├── en.yml              # English
│       ├── ru.yml              # Russian
│       └── zh.yml              # Chinese
├── _includes/                  # Reusable components
│   ├── header.html             # Navigation
│   ├── footer.html             # Footer
│   └── ... 
├── _layouts/                   # Page templates
│   ├── default.html            # Base template
│   ├── brands.html             # Brands listing template
│   ├── discover.html           # Discovery hub template
│   └── ...
├── _brands/                    # Brand collection
│   ├── en/                     # English brand profiles
│   ├── ru/                     # Russian brand profiles
│   └── zh/                     # Chinese brand profiles
├── _tags/                      # Tag collection
│   ├── en/                     # English tags
│   │   ├── sectors/            # Sector tags
│   │   ├── markets/            # Market tags (formerly countries)
│   │   ├── attributes/         # Attribute tags
│   │   └── signals/            # Signal tags (formerly growth)
│   ├── ru/                     # Russian tags
│   └── zh/                     # Chinese tags
├── pages/                      # Static pages
│   ├── en/                     # English pages
│   ├── ru/                     # Russian pages
│   └── zh/                     # Chinese pages
├── assets/                     # Static assets
│   ├── css/                    # Stylesheets
│   ├── js/                     # JavaScript
│   ├── fonts/                  # Font files
│   └── images/                 # Images
└── brands-data.json            # Generated JSON for search/filtering
```

### Collection Configuration

In `_config.yml`, we need the following collections:

```
collections:
  brands:
    output: true
    permalink: /:collection/:path/
  tags:
    output: true
    permalink: /:collection/:path/
```

And front matter defaults:

```
defaults:
  # Global defaults
  - scope:
      path: ""
    values:
      layout: default
  
  # Brand defaults by language
  - scope:
      path: "_brands/en"
      type: "brands"
    values:
      layout: "brand"
      lang: "en"
  - scope:
      path: "_brands/ru"
      type: "brands"
    values:
      layout: "brand"
      lang: "ru"
  - scope:
      path: "_brands/zh"
      type: "brands"
    values:
      layout: "brand"
      lang: "zh"
  
  # Tag defaults by language
  - scope:
      path: "_tags/en"
      type: "tags"
    values:
      layout: "tag"
      lang: "en"
  - scope:
      path: "_tags/ru"
      type: "tags"
    values:
      layout: "tag"
      lang: "ru"
  - scope:
      path: "_tags/zh"
      type: "tags"
    values:
      layout: "tag"
      lang: "zh"
```

## 2\. JSON Data Generation

The key to enabling search and filtering is generating a JSON file with all brand and tag information. This is implemented using a Jekyll template that outputs JSON:

```
---
layout: null
---
```

The JSON structure should include:

- All brands with their metadata  
- All tags organized by category (sectors, markets, attributes, signals)  
- Language-specific information for multilingual support

When generating this file, ensure that:

- All string values are properly escaped using `escape` filter  
- All collections are filtered by relevant tag types  
- The file is regenerated whenever content changes

## 3\. Client-Side Search and Filtering

The search and filtering implementation uses vanilla JavaScript with these key features:

1. **Data Loading**: Fetch the JSON data on page load  
2. **Language Filtering**: Filter data based on current page language  
3. **Search Text Matching**: Match search terms against brand names and descriptions  
4. **Filter Application**: Apply multiple filters simultaneously (sectors, markets, attributes, signals)  
5. **Result Display**: Show filtered results with pagination  
6. **Sort Options**: Allow sorting by different criteria

Performance considerations:

- Initialize all filter options from the loaded data  
- Use efficient array methods for filtering  
- Implement pagination to limit DOM size  
- Use event delegation for filter checkboxes

## 4\. Premium Content Controls

The premium content system uses a client-side approach with these components:

1. **Content Marking**: Use `.premium-content` class and front matter flags  
2. **Access Control**: Check localStorage for premium access status  
3. **Visual Indicators**: Apply blur effects and overlays to premium content  
4. **Upgrade Flow**: Simulate upgrade path for MVP

For the MVP, we store premium status in localStorage:

```javascript
localStorage.setItem('premiumAccess', 'true'); // Grant access
localStorage.getItem('premiumAccess') === 'true'; // Check access
```

In a production environment, this would be replaced with actual authentication.

## 5\. Discovery Path Implementation

The discovery paths (Sectors, Markets, Attributes, Signals) are implemented using:

1. **Tab Interface**: Allow switching between discovery categories  
2. **Grid Layouts**: Display items in responsive grid with cards  
3. **Dynamic Loading**: Load content appropriate to the selected tab  
4. **Consistent Branding**: Use consistent visual language across all paths

Each discovery path should have:

- An overview page listing all items in that category  
- Individual pages for each item showing related brands

## 6\. Multilingual Implementation

Key aspects of the multilingual implementation:

1. **Language-Based Directory Structure**: Organize content by language first  
2. **Translation Files**: Store UI strings in language-specific YAML files  
3. **Language Detection**: Set language based on URL path  
4. **Consistent Language Variables**: Use `page.lang` variable throughout templates  
5. **Language Switcher**: Maintain language context when switching languages

When implementing search and filtering, ensure:

- All UI elements are translated using the translation files  
- Search results match the current language  
- Filter options display in the appropriate language

## 7\. Airtable Integration

For connecting to Airtable (future enhancement):

1. **API Key Management**: Store API keys securely (not in client-side code)  
2. **Data Fetching**: Use JavaScript fetch API to retrieve data  
3. **Data Caching**: Implement client-side caching to reduce API calls  
4. **Error Handling**: Gracefully handle API errors

Two implementation approaches:

- **Direct API Calls**: Using JavaScript in the browser (less secure)  
- **Serverless Functions**: Using Netlify Functions to proxy API calls (more secure)

Example Netlify Function for Airtable access:

```javascript
// netlify/functions/get-brands.js
const Airtable = require('airtable');
const base = new Airtable({apiKey: process.env.AIRTABLE_API_KEY}).base(process.env.AIRTABLE_BASE_ID);

exports.handler = async function(event, context) {
  try {
    const records = await base('Brands').select({
      maxRecords: 100,
      view: "Grid view"
    }).all();
    
    const brands = records.map(record => ({
      id: record.id,
      name: record.get('Name'),
      sector: record.get('Sector'),
      country: record.get('Country'),
      // Map other fields
    }));
    
    return {
      statusCode: 200,
      body: JSON.stringify(brands)
    };
  } catch (error) {
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Failed to fetch brands' })
    };
  }
}
```

## 8\. Technical Considerations and Edge Cases

### Performance

- Minimize DOM size by paginating results  
- Use efficient JavaScript methods for filtering  
- Implement lazy loading for images  
- Cache filter results to avoid repeated calculations

### Browser Compatibility

- Use ES6 features with appropriate polyfills  
- Test on older browsers (IE11 support requires additional work)  
- Ensure CSS fallbacks for flexbox and grid layouts

### Accessibility

- Maintain proper focus management in tab interfaces  
- Ensure filter controls are keyboard navigable  
- Add appropriate ARIA attributes to custom controls  
- Provide sufficient color contrast for all text

### Edge Cases

- Empty states: Handle empty search results gracefully  
- Slow connections: Implement loading states  
- Invalid filters: Handle non-existent filter combinations  
- Special characters: Ensure proper handling in search and filters

### Security Considerations

- Sanitize all user inputs (search terms)  
- Avoid XSS vulnerabilities with proper escaping  
- Protect premium content through proper access controls  
- Do not expose API keys in client-side code

## 9\. Future Technical Enhancements

1. **Server-Side Search**: Implement more powerful search with Algolia or similar  
2. **User Authentication**: Replace localStorage with proper auth system  
3. **CDN Integration**: Add CDN for assets and images  
4. **Analytics Integration**: Add detailed event tracking  
5. **Offline Support**: Implement service workers for offline access  
6. **Internationalization**: Add more robust i18n support

These enhancements would move beyond the MVP stage but can be implemented incrementally as the platform grows.

## Technical Reference

### JSON Structure

```
{
  "brands": [
    {
      "name": "Brand Name",
      "url": "/en/brands/brand-name/",
      "description": "Brand description...",
      "sector": "Hotels & Resorts",
      "country": "Russia",
      "attributes": ["Heritage Brand", "Regional Icon"],
      "signals": ["Investment Ready"],
      "logo": "/assets/images/brands/brand-logo.png",
      "premium": false,
      "language": "en"
    }
  ],
  "sectors": [
    {
      "id": "hotels-resorts",
      "name": "Hotels & Resorts",
      "language": "en"
    }
  ],
  "markets": [
    {
      "id": "russia",
      "name": "Russia",
      "language": "en"
    }
  ],
  "attributes": [
    {
      "id": "heritage-brand",
      "name": "Heritage Brand",
      "language": "en"
    }
  ],
  "signals": [
    {
      "id": "investment-ready",
      "name": "Investment Ready",
      "language": "en"
    }
  ]
}
```

### CSS Class Reference

#### Layout Classes

- `.full-width-panel`: Full-width content section  
- `.panel-content`: Content container with maximum width  
- `.centered`: Center-aligned content  
- `.light-panel`: Panel with light background  
- `.dark-panel`: Panel with dark background  
- `.hero-panel`: Hero section with larger spacing

#### Component Classes

- `.brand-card`: Brand display card  
- `.discovery-card`: Discovery path card  
- `.filter-sidebar`: Filter controls sidebar  
- `.search-container`: Search input container  
- `.premium-content`: Premium content container  
- `.premium-overlay`: Premium content overlay

#### State Classes

- `.active`: Active tab or element  
- `.content-locked`: Content with restricted access  
- `.premium-brand`: Brand with premium status

### JavaScript API Reference

#### Search and Filtering

```javascript
// Load brand data
fetch('/brands-data.json')
  .then(response => response.json())
  .then(data => {
    // Process data
  });

// Filter brands
function filterBrands(brands, filters) {
  return brands.filter(brand => {
    // Apply filters
    return matchesFilters(brand, filters);
  });
}

// Display brands
function displayBrands(brands, container) {
  // Render brand cards
}
```

#### Premium Content Control

```javascript
// Check premium status
const hasPremiumAccess = localStorage.getItem('premiumAccess') === 'true';

// Lock premium content
function lockPremiumContent() {
  document.querySelectorAll('.premium-content').forEach(element => {
    // Add premium overlay
  });
}

// Unlock premium content
function unlockPremiumContent() {
  localStorage.setItem('premiumAccess', 'true');
  // Remove locks and overlays
}
```

### Liquid Template Reference

#### Page Variables

- `page.lang`: Current language (en, ru, zh)  
- `page.title`: Page title  
- `page.permalink`: Page URL path  
- `page.discovery_path`: Current discovery path (sectors, markets, attributes, signals)

#### Collection Access

```
{% assign featured_brands = site.brands | where: "lang", page.lang | where: "featured", true %}
{% assign sector_tags = site.tags | where: "tag_type", "sector" | where: "lang", page.lang %}
```

#### Translation Access

```
{{ site.data.translations[page.lang].nav.home }}
{{ site.data.translations[page.lang].filter.title }}
```

## Implementation Resources

### Jekyll Documentation

- [Collections](https://jekyllrb.com/docs/collections/)  
- [Data Files](https://jekyllrb.com/docs/datafiles/)  
- [Liquid Templating](https://jekyllrb.com/docs/liquid/)

### JavaScript Resources

- [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)  
- [Array Methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)  
- [localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

### Airtable Resources

- [Airtable API](https://airtable.com/developers/web/api/introduction)  
- [JavaScript Airtable Library](https://github.com/airtable/airtable.js)

### CSS Resources

- [Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)  
- [Grid Guide](https://css-tricks.com/snippets/css/complete-guide-grid/)  
- [CSS Variables](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties) "

