---
layout: styleguide
title: Multilingual Approach
description: Brandmine's multilingual implementation supports English, Russian, and Chinese content with consistent design and user experience.
permalink: /en/styleguide/patterns/multilingual/
lang: en
ref: styleguide-patterns-multilingual
published: true
---

## Multilingual Approach

Our multilingual approach enables Brandmine to serve content in English, Russian, and Chinese while maintaining consistent design, functionality, and user experience. This comprehensive language support is a core part of our platform's mission to bridge international markets.

## Language Structure

The site uses a language-first URL structure that organizes content by language before content type:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="font-family: monospace; background-color: var(--neutral-50); padding: 1rem; border-radius: 0.25rem; white-space: pre; overflow-x: auto; line-height: 1.5;">
# Jekyll directory structure
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
    └── about.md
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">text</span>
    <pre><code class="language-text"># Jekyll directory structure
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
    └── about.md</code></pre>
  </div>
</div>

## Typography System

Our typography system automatically adapts to the page language using language-specific font stacks:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: flex; flex-direction: column; gap: 1rem; padding: 1rem; background-color: var(--neutral-50); border-radius: 0.25rem;">
      <div>
        <h4 style="margin-top: 0; margin-bottom: 0.5rem; font-family: 'PT Serif', Georgia, serif;">English Heading (PT Serif)</h4>
        <p style="margin: 0; font-family: 'PT Sans', Arial, sans-serif;">English body text (PT Sans)</p>
      </div>
      <div>
        <h4 style="margin-top: 0; margin-bottom: 0.5rem; font-family: 'PT Serif', Georgia, serif;">Русский заголовок (PT Serif)</h4>
        <p style="margin: 0; font-family: 'PT Sans', Arial, sans-serif;">Русский текст (PT Sans)</p>
      </div>
      <div>
        <h4 style="margin-top: 0; margin-bottom: 0.5rem; font-family: 'Noto Serif SC', 'Songti SC', serif;">中文标题 (Noto Serif SC)</h4>
        <p style="margin: 0; font-family: 'Noto Sans SC', 'PingFang SC', sans-serif;">中文正文 (Noto Sans SC)</p>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">:root {
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
}</code></pre>
  </div>
</div>

## Language Selector

The language selector appears in the site header and footer, allowing users to switch between languages:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: flex; gap: 0.75rem; padding: 1rem; background-color: var(--neutral-50); border-radius: 0.25rem;">
      <a href="#" style="font-weight: 500; color: var(--primary-600); text-decoration: none; border-bottom: 2px solid var(--primary-600); padding-bottom: 0.125rem;">EN</a>
      <a href="#" style="color: var(--neutral-600); text-decoration: none;">RU</a>
      <a href="#" style="color: var(--neutral-600); text-decoration: none;">中文</a>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="language-selector"&gt;
  &lt;a href="/en/" class="active"&gt;EN&lt;/a&gt;
  &lt;a href="/ru/"&gt;RU&lt;/a&gt;
  &lt;a href="/zh/"&gt;中文&lt;/a&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

## Translations System

Content strings are managed through translation files in the Jekyll `_data` directory:

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">yaml</span>
    <pre><code class="language-yaml"># _data/translations/en.yml
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
  contact: "联系我们"</code></pre>
  </div>
</div>

## Language-Specific Adjustments

Some elements require language-specific adjustments to accommodate different text lengths or writing systems:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: flex; flex-direction: column; gap: 1.5rem; padding: 1rem; background-color: var(--neutral-50); border-radius: 0.25rem;">
      <div>
        <h4 style="margin-top: 0; margin-bottom: 0.5rem;">Chinese Typography Line Height</h4>
        <div style="border: 1px dashed var(--neutral-300); padding: 0.5rem; border-radius: 0.25rem; display: flex; gap: 1rem;">
          <div>
            <div style="font-size: 0.875rem; color: var(--neutral-500); margin-bottom: 0.25rem;">Normal line height</div>
            <div style="line-height: 1.5; font-family: 'Noto Serif SC', 'Songti SC', serif;">
              这是带有标准行高的中文文本。<br>在某些情况下，这种行高对于中文排版来说太宽了。
            </div>
          </div>
          <div>
            <div style="font-size: 0.875rem; color: var(--neutral-500); margin-bottom: 0.25rem;">Adjusted line height</div>
            <div style="line-height: 1.375; font-family: 'Noto Serif SC', 'Songti SC', serif;">
              这是带有调整行高的中文文本。<br>对于中文排版，较窄的行高通常更适合。
            </div>
          </div>
        </div>
      </div>
      <div>
        <h4 style="margin-top: 0; margin-bottom: 0.5rem;">Text Length Adjustments</h4>
        <div style="border: 1px dashed var(--neutral-300); padding: 0.5rem; border-radius: 0.25rem; display: flex; gap: 1rem;">
          <div style="flex: 1;">
            <div style="font-size: 0.875rem; color: var(--neutral-500); margin-bottom: 0.25rem;">English</div>
            <button style="font-size: 1rem; padding: 0.5rem 1rem; background-color: var(--primary-600); color: white; border: none; border-radius: 0.25rem;">Subscribe</button>
          </div>
          <div style="flex: 1;">
            <div style="font-size: 0.875rem; color: var(--neutral-500); margin-bottom: 0.25rem;">Russian</div>
            <button style="font-size: 0.95rem; padding: 0.5rem 1rem; background-color: var(--primary-600); color: white; border: none; border-radius: 0.25rem;">Подписаться</button>
          </div>
          <div style="flex: 1;">
            <div style="font-size: 0.875rem; color: var(--neutral-500); margin-bottom: 0.25rem;">Chinese</div>
            <button style="font-size: 0.95rem; padding: 0.5rem 1rem; background-color: var(--primary-600); color: white; border: none; border-radius: 0.25rem;">订阅</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">css</span>
    <pre><code class="language-css">/* Chinese typography adjustments */
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
}</code></pre>
  </div>
</div>

## URL Structure and Templates

Each page includes language-specific front matter to control permalinks and language settings:

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">yaml</span>
    <pre><code class="language-yaml">---
layout: default
title: About Us
description: About the Brandmine platform and team
permalink: /en/about/
lang: en
---</code></pre>
  </div>
</div>

## Helper Classes

For mixing languages within a page, specific helper classes are available:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="padding: 1rem; background-color: var(--neutral-50); border-radius: 0.25rem; line-height: 2;">
      <p>Standard text with <span style="font-family: 'Noto Serif SC', 'Songti SC', serif;">中文文本</span> Chinese serif text.</p>
      <p>Standard text with <span style="font-family: 'Noto Sans SC', 'PingFang SC', sans-serif;">中文文本</span> Chinese sans-serif text.</p>
      <p>Standard text with <span style="font-family: 'PT Serif', Georgia, serif;">Русский текст</span> Russian serif text.</p>
      <p>Standard text with <span style="font-family: 'PT Sans', Arial, sans-serif;">Русский текст</span> Russian sans-serif text.</p>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;!-- Chinese serif font regardless of page language --&gt;
&lt;span class="zh"&gt;中文文本&lt;/span&gt;

&lt;!-- Chinese sans-serif font --&gt;
&lt;span class="zh-sans"&gt;中文文本&lt;/span&gt;

&lt;!-- Russian serif font regardless of page language --&gt;
&lt;span class="ru"&gt;Русский текст&lt;/span&gt;

&lt;!-- Russian sans-serif font --&gt;
&lt;span class="ru-sans"&gt;Русский текст&lt;/span&gt;</code></pre>
  </div>
</div>

## Content Tagging

Content tags are consistently structured across languages:

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">yaml</span>
    <pre><code class="language-yaml"># _data/tag_translations.yml

# English
hotels-resorts:
  en: "Hotels & Resorts"
  ru: "Отели и Курорты"
  zh: "酒店和度假村"
  
artisanal-excellence:
  en: "Artisanal Excellence"
  ru: "Мастерство Ремесленников"
  zh: "工艺精湛"</code></pre>
  </div>
</div>

## Multilingual Forms

Forms are adapted for each language, using language-specific configurations:

<div class="example-wrapper">
  <div class="example-preview">
    <div style="display: flex; flex-direction: column; gap: 1.5rem; padding: 1rem; background-color: var(--neutral-50); border-radius: 0.25rem;">
      <div>
        <h4 style="margin-top: 0; margin-bottom: 0.5rem;">English Newsletter Form</h4>
        <div style="border: 1px solid var(--neutral-200); padding: 1rem; border-radius: 0.25rem; background-color: white;">
          <div style="margin-bottom: 0.75rem; font-weight: 500;">Subscribe to our newsletter</div>
          <div style="display: flex; gap: 0.5rem;">
            <input type="email" placeholder="Your email address" style="flex: 1; padding: 0.5rem; border: 1px solid var(--neutral-300); border-radius: 0.25rem;">
            <button style="padding: 0.5rem 1rem; background-color: var(--primary-600); color: white; border: none; border-radius: 0.25rem;">Subscribe</button>
          </div>
        </div>
      </div>
      <div>
        <h4 style="margin-top: 0; margin-bottom: 0.5rem;">Russian Newsletter Form</h4>
        <div style="border: 1px solid var(--neutral-200); padding: 1rem; border-radius: 0.25rem; background-color: white;">
          <div style="margin-bottom: 0.75rem; font-weight: 500;">Подпишитесь на нашу рассылку</div>
          <div style="display: flex; gap: 0.5rem;">
            <input type="email" placeholder="Ваш адрес электронной почты" style="flex: 1; padding: 0.5rem; border: 1px solid var(--neutral-300); border-radius: 0.25rem;">
            <button style="padding: 0.5rem 1rem; background-color: var(--primary-600); color: white; border: none; border-radius: 0.25rem;">Подписаться</button>
          </div>
        </div>
      </div>
      <div>
        <h4 style="margin-top: 0; margin-bottom: 0.5rem;">Chinese Newsletter Form</h4>
        <div style="border: 1px solid var(--neutral-200); padding: 1rem; border-radius: 0.25rem; background-color: white;">
          <div style="margin-bottom: 0.75rem; font-weight: 500;">订阅我们的通讯</div>
          <div style="display: flex; gap: 0.5rem;">
            <input type="email" placeholder="您的电子邮件地址" style="flex: 1; padding: 0.5rem; border: 1px solid var(--neutral-300); border-radius: 0.25rem;">
            <button style="padding: 0.5rem 1rem; background-color: var(--primary-600); color: white; border: none; border-radius: 0.25rem;">订阅</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="example-code">
    <span class="code-language">html</span>
    <pre><code class="language-html">&lt;div class="newsletter-container"&gt;
  {% raw %}{% if page.lang == "ru" %}
    &lt;div class="ml-embedded" data-form="WVRNPI"&gt;&lt;/div&gt;
  {% elsif page.lang == "zh" %}
    &lt;div class="ml-embedded" data-form="WRga0a"&gt;&lt;/div&gt;
  {% else %}
    &lt;div class="ml-embedded" data-form="480swE"&gt;&lt;/div&gt;
  {% endif %}{% endraw %}
&lt;/div&gt;</code></pre>
  </div>
</div>

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

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">liquid</span>
    <pre><code class="language-liquid">---
layout: default
title: {% raw %}{{ site.data.translations[page.lang].pages.brands.title }}{% endraw %}
description: {% raw %}{{ site.data.translations[page.lang].pages.brands.description }}{% endraw %}
permalink: {% raw %}/{{ page.lang }}/brands/{% endraw %}
lang: {% raw %}{{ page.lang }}{% endraw %}
---

&lt;div class="full-width-panel light-panel"&gt;
  &lt;div class="panel-content"&gt;
    &lt;h1&gt;{% raw %}{{ site.data.translations[page.lang].pages.brands.heading }}{% endraw %}&lt;/h1&gt;
    &lt;p class="lead-text"&gt;{% raw %}{{ site.data.translations[page.lang].pages.brands.lead_text }}{% endraw %}&lt;/p&gt;
    
    &lt;!-- Page content --&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
  </div>
</div>

### Language Switching

When creating links to other pages, maintain the user's language:

<div class="example-wrapper">
  <div class="example-code">
    <span class="code-language">liquid</span>
    <pre><code class="language-liquid">&lt;a href="{% raw %}{{ site.baseurl }}/{{ page.lang }}/brands/{% endraw %}"&gt;
  {% raw %}{{ site.data.translations[page.lang].nav.brands }}{% endraw %}
&lt;/a&gt;</code></pre>
  </div>
</div>

### Responsive Considerations

For multilingual implementations, additional considerations include:

1. **Text wrapping** - Ensure text wraps properly in all languages
2. **Button sizing** - Allow buttons to expand for longer text strings
3. **Mobile layout** - Test language selector positions in responsive layouts
4. **Character encoding** - Ensure proper UTF-8 encoding for all pages