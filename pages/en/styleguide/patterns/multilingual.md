---
layout: styleguide
title: Multilingual Approach
description: Brandmine's multilingual implementation supports English, Russian, and Chinese content with consistent design and user experience.
permalink: /en/styleguide/patterns/multilingual/
lang: en
---

## Multilingual Approach

Our multilingual approach enables Brandmine to serve content in English, Russian, and Chinese while maintaining consistent design, functionality, and user experience. This comprehensive language support is a core part of our platform's mission to bridge international markets.

## Language Structure

The site uses a language-first URL structure that organizes content by language before content type:

{% include styleguide/code-example.html language="text" preview=true
code='# Jekyll directory structure
pages/
├── en/
│   ├── index.html
│   ├── brands.md
│   ├── sectors.md
│   └── about.md
├── ru/
│   ├── index.html
│   ├── brands.md
│   ├── sectors.md
│   └── about.md
└── zh/
    ├── index.html
    ├── brands.md
    ├── sectors.md
    └── about.md' %}

## Typography System

Our typography system automatically adapts to the page language using language-specific font stacks:

{% include styleguide/code-example.html language="css" preview=true
code=':root {
  /* Language-specific font definitions */
  --font-heading-en: "PT Serif", Georgia, serif;
  --font-body-en: "PT Sans", Arial, sans-serif;
  
  --font-heading-ru: "PT Serif", Georgia, serif;
  --font-body-ru: "PT Sans", Arial, sans-serif;
  
  --font-heading-zh: "Noto Serif SC", "Songti SC", "FangSong", "STSong", serif;
  --font-body-zh: "Noto Sans SC", "PingFang SC", "Microsoft YaHei", sans-serif;
  
  /* Default to English fonts */
  --font-heading: var(--font-heading-en);
  --font-body: var(--font-body-en);
}

/* Apply Russian fonts when Russian language is specified */
html[lang="ru"] {
  --font-heading: var(--font-heading-ru);
  --font-body: var(--font-body-ru);
}

/* Apply Chinese fonts when Chinese language is specified */
html[lang="zh"] {
  --font-heading: var(--font-heading-zh);
  --font-body: var(--font-body-zh);
}' %}

## Language Selector

The language selector appears in the site header and footer, allowing users to switch between languages:

{% include styleguide/code-example.html language="html" preview=true
code='<div class="language-selector">
  <a href="/en/" class="active">EN</a>
  <a href="/ru/">RU</a>
  <a href="/zh/">中文</a>
</div>' %}

## Translations System

Content strings are managed through translation files in the Jekyll `_data` directory:

{% include styleguide/code-example.html language="yaml" preview=false
code='# _data/translations/en.yml
site:
  title: "Brandmine"
  description: "Amplifying leading consumer brands of the BRICS+"

nav:
  home: "Home"
  brands: "Brands"
  sectors: "Sectors"
  about: "About"
  contact: "Contact"

# _data/translations/ru.yml
site:
  title: "Brandmine"
  description: "Продвигаем ведущие потребительские бренды стран БРИКС+"

nav:
  home: "Главная"
  brands: "Бренды"
  sectors: "Секторы"
  about: "О нас"
  contact: "Контакты"

# _data/translations/zh.yml
site:
  title: "Brandmine"
  description: "推广金砖国家领先消费品牌"

nav:
  home: "首页"
  brands: "品牌"
  sectors: "行业"
  about: "关于我们"
  contact: "联系我们"' %}

## Language-Specific Adjustments

Some elements require language-specific adjustments to accommodate different text lengths or writing systems:

{% include styleguide/code-example.html language="css" preview=true
code='/* Chinese typography adjustments */
html[lang="zh"] h1, 
html[lang="zh"] h2, 
html[lang="zh"] h3, 
html[lang="zh"] h4, 
html[lang="zh"] h5, 
html[lang="zh"] h6 {
  line-height: var(--leading-snug);
}

/* Language-specific grid adjustments */
.grid-container[lang="ru"],
.grid-container[lang="zh"] {
  /* Accommodate longer text in some languages */
  font-size: 0.95rem;
}' %}

## URL Structure and Templates

Each page includes language-specific front matter to control permalinks and language settings:

{% include styleguide/code-example.html language="yaml" preview=false
code='---
layout: default
title: About Us
description: About the Brandmine platform and team
permalink: /en/about/
lang: en
---' %}

## Helper Classes

For mixing languages within a page, specific helper classes are available:

{% include styleguide/code-example.html language="html" preview=true
code='<!-- Chinese serif font regardless of page language -->
<span class="zh">中文文本</span>

<!-- Chinese sans-serif font -->
<span class="zh-sans">中文文本</span>

<!-- Russian serif font regardless of page language -->
<span class="ru">Русский текст</span>

<!-- Russian sans-serif font -->
<span class="ru-sans">Русский текст</span>' %}

## Content Tagging

Content tags are consistently structured across languages:

{% include styleguide/code-example.html language="yaml" preview=false
code='# _data/tag_translations.yml

# English
hotels-resorts:
  en: "Hotels & Resorts"
  ru: "Отели и Курорты"
  zh: "酒店和度假村"
  
artisanal-excellence:
  en: "Artisanal Excellence"
  ru: "Мастерство Ремесленников"
  zh: "工艺精湛"' %}

## Multilingual Forms

Forms are adapted for each language, using language-specific configurations:

{% include styleguide/code-example.html language="html" preview=true
code='<div class="newsletter-container">
  {% if page.lang == "ru" %}
    <div class="ml-embedded" data-form="WVRNPI"></div>
  {% elsif page.lang == "zh" %}
    <div class="ml-embedded" data-form="WRga0a"></div>
  {% else %}
    <div class="ml-embedded" data-form="480swE"></div>
  {% endif %}
</div>' %}

## Implementation Guidelines

### Best Practices

1. **Maintain parallel structure** - Each page should have equivalent versions in all languages
2. **Use the translation system** - Store strings in data files rather than hardcoding
3. **Test all languages** - Verify layouts work with all supported languages
4. **Consider text expansion** - Allow space for languages that require more characters
5. **Use language detection** - Link to the appropriate language version based on context
6. **Self-host fonts** - Ensure international accessibility, especially for Chinese users
7. **Check language-specific requirements** - Consider unique typography needs for each language

### Common Templates

The basic template structure for multilingual pages:

```html
---
layout: default
title: {{ site.data.translations[page.lang].pages.brands.title }}
description: {{ site.data.translations[page.lang].pages.brands.description }}
permalink: /{{ page.lang }}/brands/
lang: {{ page.lang }}
---

<div class="full-width-panel light-panel">
  <div class="panel-content">
    <h1>{{ site.data.translations[page.lang].pages.brands.heading }}</h1>
    <p class="lead-text">{{ site.data.translations[page.lang].pages.brands.lead_text }}</p>
    
    <!-- Page content -->
  </div>
</div>
```

### Language Switching

When creating links to other pages, maintain the user's language:

```html
<a href="{{ site.baseurl }}/{{ page.lang }}/brands/">
  {{ site.data.translations[page.lang].nav.brands }}
</a>
```

### Responsive Considerations

For multilingual implementations, additional considerations include:

1. **Text wrapping** - Ensure text wraps properly in all languages
2. **Button sizing** - Allow buttons to expand for longer text strings
3. **Mobile layout** - Test language selector positions in responsive layouts
4. **Character encoding** - Ensure proper UTF-8 encoding for all pages
