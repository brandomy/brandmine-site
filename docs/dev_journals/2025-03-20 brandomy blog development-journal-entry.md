# Development Journal: Implementing Favicons in Jekyll Blog

**Date:** March 20, 2025  
**Project:** Personal Blog (blog.brandomy.com)  
**Topic:** Favicon Implementation

## 1. Problem Statement

I needed to add favicons to my Jekyll-based personal blog hosted on GitHub Pages. Favicons are the small icons that appear in browser tabs, bookmarks, and other places that represent my site visually. Without proper favicons, my site appeared unprofessional and lacked brand consistency across different browsers and devices.

The site uses:
- Jekyll 4.4.1
- Minima theme 2.5.2
- Custom domain (blog.brandomy.com)

## 2. Approach

The solution strategy involved:

1. Creating favicon files in multiple sizes for different devices and contexts
2. Adding these files to the appropriate location in my project structure
3. Overriding the default theme's head template to include references to the favicon files
4. Testing and deploying the changes to GitHub

This approach balanced simplicity with comprehensive browser/device support and worked within Jekyll's theme customization framework.

## 3. Implementation Details

### Directory Structure
Added a dedicated directory for favicon assets:
```
mkdir -p assets/favicons
```

### Template Customization
Created a custom `_includes` directory and copied the Minima theme's head.html file to override it:
```
mkdir -p _includes
cp /opt/homebrew/lib/ruby/gems/3.4.0/gems/minima-2.5.2/_includes/head.html _includes/
```

### HTML Changes
Modified `_includes/head.html` to add the following code before the closing `</head>` tag:

```html
<link rel="apple-touch-icon" sizes="180x180" href="{{ '/assets/favicons/apple-touch-icon.png' | relative_url }}">
<link rel="icon" type="image/png" sizes="32x32" href="{{ '/assets/favicons/favicon-32x32.png' | relative_url }}">
<link rel="icon" type="image/png" sizes="16x16" href="{{ '/assets/favicons/favicon-16x16.png' | relative_url }}">
<link rel="manifest" href="{{ '/assets/favicons/site.webmanifest' | relative_url }}">
<link rel="shortcut icon" href="{{ '/assets/favicons/favicon.ico' | relative_url }}">
```

### Deployment Commands
After testing locally, pushed changes to GitHub:
```bash
git add assets/favicons _includes/head.html
git commit -m "Add favicon support"
git push
```

## 4. Decisions Made

| Decision | Rationale |
|----------|-----------|
| Create separate favicons directory | Keeps assets organized and makes future updates easier |
| Use multiple favicon sizes | Ensures proper display across different devices and platforms |
| Override head.html template | Minima theme doesn't have built-in favicon support, so template customization was necessary |
| Use relative_url Liquid filter | Makes the site work correctly in both local development and production, regardless of baseurl configuration |
| Include site.webmanifest | Supports modern PWA capabilities for better mobile experience |

## 5. Resources

### Recommended Favicon Generation Tools
- [favicon.io](https://favicon.io/) - Simple, user-friendly generator
- [realfavicongenerator.net](https://realfavicongenerator.net/) - More comprehensive option with advanced features

### Required Favicon Files
- favicon.ico (16x16, 32x32) - The classic favicon for older browsers
- favicon-16x16.png - Small size for modern browsers
- favicon-32x32.png - Medium size for modern browsers
- apple-touch-icon.png (180x180) - For iOS home screen
- site.webmanifest - JSON file describing icon for Android devices

## 6. Insights & Learning

- **Jekyll Theme Overriding**: I learned how Jekyll's theme inheritance works - files placed in the same location as theme files will override them without needing to modify the original theme.
- **Liquid Templating**: Using `{{ '/path' | relative_url }}` ensures paths are correct regardless of where the site is hosted.
- **Favicon Best Practices**: Modern websites need multiple favicon sizes and formats to display properly across all devices and browsers.
- **File System Organization**: Keeping related assets in dedicated subdirectories helps maintain a clean project structure as the site grows.

## 7. Next Actions

- [ ] Consider creating a custom favicon design that better reflects the blog's brand identity
- [ ] Test favicon appearance on multiple browsers and devices to ensure consistent display
- [ ] Add `theme-color` meta tag to customize browser UI colors on mobile
- [ ] Consider implementing a favicon for dark mode using the `media` attribute
- [ ] Update site.webmanifest with appropriate application name and description
- [ ] Implement social media preview images (Open Graph/Twitter Card) for better sharing experience

## References

- [Jekyll Documentation on Theme Customization](https://jekyllrb.com/docs/themes/#overriding-theme-defaults)
- [HTML Favicon Documentation (MDN)](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML#adding_custom_icons_to_your_site)
- Current project structure as documented in jekyll-project-report.md
