# Brandmine Multilingual System

## Core Structure

- **Language-First URLs**: `/en/`, `/ru/`, `/zh/`
- **Language Parameter**: Every page has a `lang` front matter parameter
- **Language-Specific Directories**: Content organized in `/pages/en/`, `/pages/ru/`, `/zh/`

## Translation Files

Located in `_data/translations/`:
- `en.yml`: English translations (base language)
- `ru.yml`: Russian translations
- `zh.yml`: Chinese translations

All files have identical keys with translated values.

## Translation Structure

```yaml
site:
  title: "Brandmine"
  description: "Amplifying leading consumer brands of the BRICS+"

nav:
  home: "Home"  # en.yml
  home: "Главная"  # ru.yml
  home: "首页"  # zh.yml
  brands: "Brands"
  discover: "Discover"
  about: "About"
  # More navigation items...

# Section-specific translations
brands:
  title: "Brands"
  search: "Search brands"
  # More brand page translations...

# And other section translations...
```

## Language Selection

The language selector include (`_includes/language-selector.html`) allows switching between languages while staying on the same page:

```html
<div class="language-selector">
  <a href="{{ site.baseurl }}/en/{{ page.url | remove_first: page.lang }}" {% if page.lang == 'en' %}class="active"{% endif %}>EN</a>
  <a href="{{ site.baseurl }}/ru/{{ page.url | remove_first: page.lang }}" {% if page.lang == 'ru' %}class="active"{% endif %}>RU</a>
  <a href="{{ site.baseurl }}/zh/{{ page.url | remove_first: page.lang }}" {% if page.lang == 'zh' %}class="active"{% endif %}>ZH</a>
</div>
```

## Using Translations in Templates

Translations are accessed using the page's `lang` parameter:

```liquid
{{ site.data.translations[page.lang].nav.home }}
```

This ensures content displays in the correct language based on the current page.

## Typography Considerations

The site uses language-specific typography with dedicated font stacks for each writing system:
- Latin/Cyrillic: PT Serif/PT Sans
- Chinese: Noto Serif SC/Noto Sans SC
