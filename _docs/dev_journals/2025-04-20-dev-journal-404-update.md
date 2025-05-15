# Development Journal: 404 Page Multilingual Implementation
Date: 2025-04-20

## Problem Statement
We needed to update our 404 error page to properly support our multilingual site structure. The existing 404 page was using an incorrect layout reference, lacked proper styling, and didn't maintain language context when users encountered errors. Additionally, the page wasn't displaying the new error image correctly, which was part of our recently implemented image strategy.

## Approach
1. Created language-specific 404 pages for English, Russian, and Chinese
2. Implemented a root-level 404.html file to detect language and redirect appropriately
3. Applied consistent styling using our existing error-page.css stylesheet
4. Ensured proper integration with our BEM-styled button system
5. Used the site-image.html include for displaying images according to our image strategy
6. Added correct front matter including language, permalink, and ref tags for language switching

## Implementation Details

### Language-Specific 404 Pages
We created three separate 404 pages, one for each supported language:

**English Version** (pages/en/404.md):
```markdown
---
layout: default
title: Page Not Found
permalink: /en/404.html
lang: en
ref: error-404
---

<div class="panel panel--light">
  <div class="panel__content">
    <div class="error-page">
      <div class="error-page__image">
        {% include site-image.html 
           category="site"
           image="error-404" 
           purpose="error"
           alt="404 Error - Page Not Found" 
           class="error-page__image-content" %}
      </div>
      <h1 class="error-page__title">404</h1>
      <p class="error-page__message">{{ site.data.translations[page.lang].errors.not_found }}</p>
      <p class="error-page__description">{{ site.data.translations[page.lang].errors.not_found_description }}</p>
      <div class="error-page__actions">
        <a href="/{{ page.lang }}/" class="btn btn--primary">{{ site.data.translations[page.lang].nav.home }}</a>
        <a href="/{{ page.lang }}/brands/" class="btn btn--outline">{{ site.data.translations[page.lang].nav.browse_brands }}</a>
      </div>
    </div>
  </div>
</div>
```

Similar pages were created for Russian (`/ru/404.html`) and Chinese (`/zh/404.html`) with appropriate translations.

### Root 404 Redirect

We implemented a root-level 404.html file that detects the language from the URL path and redirects to the appropriate language-specific 404 page:

```html
---
permalink: /404.html
---
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Page Not Found</title>
  <script>
    // Language detection and redirection
    (function() {
      var path = window.location.pathname;
      var language = 'en'; // Default language
      
      // Check if URL contains language indicator
      if (path.startsWith('/ru/')) {
        language = 'ru';
      } else if (path.startsWith('/zh/')) {
        language = 'zh';
      }
      
      // Redirect to language-specific 404 page
      window.location.replace('/' + language + '/404.html');
    })();
  </script>
  <meta http-equiv="refresh" content="0;url=/en/404.html">
</head>
<body>
  <p>Redirecting to <a href="/en/404.html">error page</a>...</p>
</body>
</html>
```

### CSS Integration

We updated the default layout to conditionally load our error-page.css file:

```html
{% if page.permalink contains '/404.html' %}
  <link rel="stylesheet" href="{{ '/assets/css/components/error-page.css' | relative_url }}">
{% endif %}
```

This ensures consistent styling across all language versions of the 404 page.

### Translation Updates

We added the necessary translation strings to our translation files:

For English (`_data/translations/en.yml`):
```yaml
errors:
  not_found: "Page not found"
  not_found_description: "The page you're looking for doesn't exist or has been moved."
```

For Russian (`_data/translations/ru.yml`):
```yaml
errors:
  not_found: "Страница не найдена"
  not_found_description: "Страница, которую вы ищете, не существует или была перемещена."
browse_brands: "Просмотр брендов"
```

For Chinese (`_data/translations/zh.yml`):
```yaml
errors:
  not_found: "页面未找到"
  not_found_description: "您正在寻找的页面不存在或已被移动。"
browse_brands: "浏览品牌"
```

## Decisions Made

1. **Language-Specific Pages vs. JavaScript Detection**
   - We chose to create dedicated 404 pages for each language rather than using JavaScript to detect and display different translations on a single page.
   - This approach provides cleaner URLs and better maintains the language context for users.
   - It also ensures proper integration with the Jekyll language switcher component.

2. **HTML Meta Refresh Fallback**
   - Added HTML meta refresh as a fallback in case JavaScript is disabled in the user's browser.
   - This ensures that even without JavaScript, users are redirected to an appropriate 404 page (defaulting to English).

3. **permalink-based CSS Loading**
   - Used `page.permalink contains '/404.html'` condition to load the error-page.css file, maintaining consistency with our existing CSS loading patterns.
   - This approach matches our established permalink-based conditional loading strategy for stylesheets.

4. **Using Existing Components**
   - Utilized our standard site-image.html include for the error image, ensuring consistent image handling.
   - Applied our BEM-based button system with the established btn classes from buttons.css.
   - Used the panel component for consistent layout structure.

5. **Translation Strategy**
   - Added error-specific translations to our existing language files rather than hardcoding text.
   - This makes future text updates easier to manage across all languages.

## Resources

1. **CSS Files**:
   - error-page.css - Existing stylesheet for error pages
   - buttons.css - Standard button styling using BEM naming

2. **Include Files**:
   - site-image.html - Used for responsive image display

3. **Template Files**:
   - 404.html - Root-level redirector
   - /en/404.html, /ru/404.html, /zh/404.html - Language-specific 404 pages

4. **Translation Strings Added**:
   ```yaml
   errors:
     not_found: "Page not found"
     not_found_description: "The page you're looking for doesn't exist or has been moved."
   ```

## Insights & Learning

1. **Language Context Matters**
   - When users encounter a 404 error, they should stay within their current language context.
   - This improves user experience and prevents confusion from sudden language changes.

2. **Consistent Component Usage**
   - Using consistent components (buttons, panels, image includes) across all pages, including error pages, maintains visual coherence.
   - Our BEM-based system makes it straightforward to apply consistent styling.

3. **Translation System Flexibility**
   - Our translation system works well for error pages, demonstrating its flexibility beyond standard content.
   - The ability to reference translations via `site.data.translations[page.lang]` simplified implementation.

4. **URL Structure Considerations**
   - Our language-first URL structure (`/en/`, `/ru/`, `/zh/`) made it straightforward to detect the user's language context from URLs.
   - This reinforces the value of our consistent URL structuring approach.

5. **CSS Loading Strategies**
   - Our pattern of conditionally loading CSS based on permalink patterns works well for special pages like 404s.
   - This keeps page weight down by only loading relevant stylesheets.

## Next Actions

1. **Test Edge Cases**
   - Test 404 behavior for non-existent pages within each language section
   - Verify behavior for invalid URLs that don't include a language prefix

2. **Monitoring**
   - Set up 404 tracking in analytics to monitor most common 404 errors
   - Consider implementing automatic redirects for frequently accessed invalid URLs

3. **Enhancement Possibilities**
   - Consider adding a search box to the 404 page to help users find what they're looking for
   - Explore adding context-aware suggestions based on the URL pattern that generated the 404

4. **Documentation**
   - Update styleguide to include error page components
   - Document the multilingual 404 handling approach for future developers

5. **Performance**
   - Analyze 404 page load times
   - Consider preloading the error-page.css file on high-error-risk pages
