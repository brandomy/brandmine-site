# Brandmine Navigation Structure

## Main Navigation

Located in `_includes/header.html`:

```html
<nav class="site-nav">
  <a href="{{ site.baseurl }}/{{ page.lang }}/">{{ site.data.translations[page.lang].nav.home }}</a>
  <a href="{{ site.baseurl }}/{{ page.lang }}/brands/">{{ site.data.translations[page.lang].nav.brands }}</a>
  
  <div class="dropdown">
    <a href="{{ site.baseurl }}/{{ page.lang }}/discover/" class="dropbtn">{{ site.data.translations[page.lang].nav.discover }}</a>
    <div class="dropdown-content">
      <a href="{{ site.baseurl }}/{{ page.lang }}/sectors/">{{ site.data.translations[page.lang].nav.sectors }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/markets/">{{ site.data.translations[page.lang].nav.markets }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/attributes/">{{ site.data.translations[page.lang].nav.attributes }}</a>
      <a href="{{ site.baseurl }}/{{ page.lang }}/growth-signals/">{{ site.data.translations[page.lang].nav.signals }}</a>
    </div>
  </div>
  
  <a href="{{ site.baseurl }}/{{ page.lang }}/insights/">{{ site.data.translations[page.lang].nav.insights }}</a>
  <a href="{{ site.baseurl }}/{{ page.lang }}/about/">{{ site.data.translations[page.lang].nav.about }}</a>
</nav>
```

## Mobile Navigation

For smaller screens, the navigation converts to a hamburger menu:

```html
<!-- Add hamburger menu button -->
<button class="menu-toggle" aria-label="Toggle menu">
  <span class="menu-icon"></span>
</button>
```

With JavaScript toggling the menu visibility in `assets/js/menu.js`.

## Navigation CSS

Key navigation styles from `assets/css/components/navigation.css`:

- Horizontal layout for desktop
- Dropdown support for discover menu
- Vertical stacked layout for mobile
- Animated transitions for mobile menu
