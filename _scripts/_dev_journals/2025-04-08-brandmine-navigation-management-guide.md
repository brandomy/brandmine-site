# Brandmine Navigation Management Guide

This guide explains how to manage the multilingual navigation system for the Brandmine site, including adding/removing pages and extending this approach to other site components.

## Table of Contents
1. [Managing Navigation Items](#managing-navigation-items)
2. [Extending to Footer Navigation](#extending-to-footer-navigation)
3. [Implementing Discovery Paths](#implementing-discovery-paths)
4. [Impacts on Collections](#impacts-on-collections)
5. [Files to Review](#files-to-review)

## Managing Navigation Items

### Adding a New Main Navigation Item

To add a new page to the main navigation:

1. Edit each language-specific navigation file:
   - `_data/navigation/en.yml`
   - `_data/navigation/ru.yml`
   - `_data/navigation/zh.yml`

2. Add a new item in the same format:
   ```yaml
   - name: "nav.newpage"
     link: "/en/newpage/"
   ```

3. Add the corresponding translation key to each language translation file:
   - `_data/translations/en.yml`
   - `_data/translations/ru.yml`
   - `_data/translations/zh.yml`

   ```yaml
   nav:
     # existing items...
     newpage: "New Page"
   ```

4. Create the actual page files in each language directory:
   - `/pages/en/newpage.md`
   - `/pages/ru/newpage.md`
   - `/pages/zh/newpage.md`

### Adding a Dropdown/Child Page

To add a new subpage under an existing dropdown menu:

1. Locate the parent item in each language navigation file and add a child:
   ```yaml
   - name: "nav.discover"
     link: "/en/discover/"
     children:
       # existing children...
       - name: "nav.newsubpage"
         link: "/en/discover/newsubpage/"
   ```

2. Add the translation key to each language translation file:
   ```yaml
   nav:
     # existing items...
     newsubpage: "New Subpage"
   ```

3. Create the subpage files in each language directory.

### Removing a Navigation Item

1. Remove the item from each language-specific navigation file
2. You can keep the translation keys for potential future use
3. The page files can remain in the site (they'll still be accessible by direct URL, just not via navigation)

## Extending to Footer Navigation

### Creating Footer Navigation Files

1. Create a dedicated directory for footer navigation:
   ```
   _data/footer_navigation/
   ├── en.yml
   ├── ru.yml
   └── zh.yml
   ```

2. Structure the footer navigation YML files:
   ```yaml
   # _data/footer_navigation/en.yml
   - section: "main"
     items:
       - name: "footer.home"
         link: "/en/"
       - name: "footer.about"
         link: "/en/about/"
       - name: "footer.privacy"
         link: "/en/privacy/"
   
   - section: "resources"
     items:
       - name: "footer.brands"
         link: "/en/brands/"
       - name: "footer.insights"
         link: "/en/insights/"
   ```

3. Add translations to each language file:
   ```yaml
   # In _data/translations/en.yml
   footer:
     home: "Home"
     about: "About Us"
     privacy: "Privacy Policy"
     brands: "Our Brands"
     insights: "Insights"
     # section titles
     main: "Main"
     resources: "Resources"
   ```

4. Update the footer template to use this structure:
   ```liquid
   <!-- In _includes/footer.html -->
   <footer class="footer">
     {% for section in site.data.footer_navigation[page.lang] %}
       <div class="footer__section">
         <h3 class="footer__heading">{{ site.data.translations[page.lang].footer[section.section] }}</h3>
         <ul class="footer__list">
           {% for item in section.items %}
             {% assign key = item.name | remove: 'footer.' %}
             <li class="footer__item">
               <a href="{{ item.link | relative_url }}" class="footer__link">
                 {{ site.data.translations[page.lang].footer[key] }}
               </a>
             </li>
           {% endfor %}
         </ul>
       </div>
     {% endfor %}
     
     <!-- Other footer content -->
   </footer>
   ```

## Implementing Discovery Paths

For discovery paths (sectors, markets, attributes, signals), you can use a similar data-driven approach:

1. Create dedicated discovery configuration files:
   ```
   _data/discovery/
   ├── en.yml
   ├── ru.yml
   └── zh.yml
   ```

2. Structure the discovery configuration:
   ```yaml
   # _data/discovery/en.yml
   paths:
     - name: "discovery.sectors"
       link: "/en/discover/sectors/"
       icon: "industry"
       description: "discovery.sectors_desc"
       featured:
         - "artisan-confectionery"
         - "specialty-cheeses"
         - "artisanal-spirits-vodka"
       
     - name: "discovery.markets"
       link: "/en/discover/markets/"
       icon: "globe"
       description: "discovery.markets_desc"
       featured:
         - "russia"
         - "china"
         - "brazil"
       
     # more paths...
   ```

3. Update the discovery page template to use this data:
   ```liquid
   <!-- In a discovery template -->
   <div class="discovery-paths">
     {% for path in site.data.discovery[page.lang].paths %}
       {% assign key = path.name | remove: 'discovery.' %}
       {% assign desc_key = path.description | remove: 'discovery.' %}
       
       <div class="discovery-path">
         <h2>{{ site.data.translations[page.lang].discovery[key] }}</h2>
         <p>{{ site.data.translations[page.lang].discovery[desc_key] }}</p>
         
         <div class="featured-items">
           {% for item_slug in path.featured limit:3 %}
             <!-- Render featured item -->
           {% endfor %}
         </div>
         
         <a href="{{ path.link | relative_url }}" class="btn">
           {{ site.data.translations[page.lang].discovery.explore_all | replace: '%s', site.data.translations[page.lang].discovery[key] }}
         </a>
       </div>
     {% endfor %}
   </div>
   ```

## Impacts on Collections

For your `_insights` and `_brands` collections, the navigation changes should have minimal impact. However:

1. **Collection Layouts**: Ensure any collection layouts that include navigation use `page.lang` consistently
2. **Internal Links**: If you have links to other pages within collection items, make sure they use the proper language prefix
3. **Related Items**: If you display related items, ensure the language filtering works correctly

Example for filtering collections by language:
```liquid
{% assign items = site.brands | where: "lang", page.lang %}
```

## Files to Review

Check these files to ensure they're compatible with the multilingual navigation approach:

### Templates & Includes:
- **_includes/navigation.html**: Already updated
- **_includes/header.html**: Already updated
- **_includes/footer.html**: Needs updating for multilingual approach
- **_includes/language-selector.html**: Verify it works with page.lang
- **_includes/breadcrumbs.html**: If you have one, update to use page.lang

### Layouts:
- **_layouts/default.html**: Check for page.lang consistency
- **_layouts/brand.html**: Check for page.lang consistency
- **_layouts/insight.html**: Check for page.lang consistency
- Any other content type layouts

### CSS/JS Assets:
- **assets/css/components/header.css**: Verify styling for navigation
- **assets/css/components/navigation.css**: Verify dropdown styling
- **assets/js/header.js**: Check JavaScript for dropdowns and mobile menu
- **assets/css/components/footer.css**: If updating footer navigation

## Common Troubleshooting

1. **Navigation items not appearing**: Check that your YML files are properly formatted and don't have syntax errors
2. **Translations not appearing**: Verify the keys match between navigation files and translation files
3. **Dropdowns not working**: Check that the JavaScript correctly targets the classes in your updated navigation

## Multilingual Best Practices

1. Always add new pages to all language versions to maintain site consistency
2. Keep translation keys consistent across files
3. Use descriptive keys that match the content (e.g., 'about_us' rather than 'page1')
4. Test navigation in all languages after making changes
5. Consider adding automatic language detection for the homepage