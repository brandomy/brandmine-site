---
layout: styleguide
title: Typography System
description: Brandmine's typography system creates a consistent typographic hierarchy across our multilingual platform.
permalink: /en/styleguide/foundations/typography/
lang: en
---

## Typography Overview

Our typography system follows the "Evernote approach" with:
- Serif fonts (PT Serif/Noto Serif SC) for headlines and titles
- Sans-serif fonts (PT Sans/Noto Sans SC) for body text and UI elements

This approach creates an elegant visual hierarchy while ensuring excellent readability across our multilingual platform (English, Russian, and Chinese).

## Font Families

### Headings

We use serif fonts for all headings to create an elegant, distinctive appearance:

<div class="example">
  <div class="example-preview">
    <h1>Heading Level 1</h1>
    <h2>Heading Level 2</h2>
    <h3>Heading Level 3</h3>
    <h4>Heading Level 4</h4>
    <h5>Heading Level 5</h5>
    <h6>Heading Level 6</h6>
  </div>
  
  <div class="example-code">
```html
<h1>Heading Level 1</h1>
<h2>Heading Level 2</h2>
<h3>Heading Level 3</h3>
<h4>Heading Level 4</h4>
<h5>Heading Level 5</h5>
<h6>Heading Level 6</h6>
```
  </div>
</div>

### Body Text

We use sans-serif fonts for body text to maximize readability:

<div class="example">
  <div class="example-preview">
    <p>This is a paragraph of body text. Our typography system uses sans-serif fonts for body content to provide excellent readability across screen sizes. The base font size is 16px (1rem) with a line height of 1.5.</p>
    <p>A second paragraph shows the spacing between paragraphs and demonstrates how text flows in a multi-paragraph context.</p>
  </div>
  
  <div class="example-code">
```html
<p>This is a paragraph of body text. Our typography system uses sans-serif fonts for body content to provide excellent readability across screen sizes. The base font size is 16px (1rem) with a line height of 1.5.</p>
<p>A second paragraph shows the spacing between paragraphs and demonstrates how text flows in a multi-paragraph context.</p>
```
  </div>
</div>

## Language-Specific Typography

Our typography system automatically adapts to the page language using the `lang` attribute on the HTML element.

### English

English pages use PT Serif for headings and PT Sans for body text:

<div class="example">
  <div class="example-preview">
    <div style="padding: 1rem; border: 1px solid var(--neutral-200); border-radius: 0.5rem;">
      <h3>English Typography Example</h3>
      <p>This text is using the English typography settings with PT Serif for headings and PT Sans for body text.</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<html lang="en">
  <!-- Content will use English typography -->
  <h3>English Typography Example</h3>
  <p>This text is using the English typography settings...</p>
</html>
```
  </div>
</div>

### Russian

Russian pages use the same PT Serif and PT Sans families, which have excellent Cyrillic support:

<div class="example">
  <div class="example-preview">
    <div style="padding: 1rem; border: 1px solid var(--neutral-200); border-radius: 0.5rem;">
      <h3 class="ru">Пример Русской Типографики</h3>
      <p class="ru-sans">Этот текст использует настройки русской типографики с PT Serif для заголовков и PT Sans для основного текста.</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<html lang="ru">
  <!-- Content will use Russian typography -->
  <h3>Пример Русской Типографики</h3>
  <p>Этот текст использует настройки русской типографики...</p>
</html>
```
  </div>
</div>

### Chinese

Chinese pages use Noto Serif SC for headings and Noto Sans SC for body text:

<div class="example">
  <div class="example-preview">
    <div style="padding: 1rem; border: 1px solid var(--neutral-200); border-radius: 0.5rem;">
      <h3 class="zh">中文排版示例</h3>
      <p class="zh-sans">此文本使用中文排版设置，标题使用思源宋体 (Noto Serif SC)，正文使用思源黑体 (Noto Sans SC)。</p>
    </div>
  </div>
  
  <div class="example-code">
```html
<html lang="zh">
  <!-- Content will use Chinese typography -->
  <h3>中文排版示例</h3>
  <p>此文本使用中文排版设置，标题使用思源宋体...</p>
</html>
```
  </div>
</div>

## Font Sizes

Our typography system uses a modular scale based on rems, maintaining proper hierarchical relationships between different text elements.

<div class="example">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: center;">
      <div><span style="font-size: var(--text-xs);">Text XS (0.75rem)</span></div>
      <div><code>var(--text-xs)</code></div>
      
      <div><span style="font-size: var(--text-sm);">Text SM (0.875rem)</span></div>
      <div><code>var(--text-sm)</code></div>
      
      <div><span style="font-size: var(--text-base);">Text Base (1rem)</span></div>
      <div><code>var(--text-base)</code></div>
      
      <div><span style="font-size: var(--text-lg);">Text LG (1.125rem)</span></div>
      <div><code>var(--text-lg)</code></div>
      
      <div><span style="font-size: var(--text-xl);">Text XL (1.25rem)</span></div>
      <div><code>var(--text-xl)</code></div>
      
      <div><span style="font-size: var(--text-2xl);">Text 2XL (1.5rem)</span></div>
      <div><code>var(--text-2xl)</code></div>
      
      <div><span style="font-size: var(--text-3xl);">Text 3XL (1.875rem)</span></div>
      <div><code>var(--text-3xl)</code></div>
      
      <div><span style="font-size: var(--text-4xl);">Text 4XL (2.25rem)</span></div>
      <div><code>var(--text-4xl)</code></div>
      
      <div><span style="font-size: var(--text-5xl);">Text 5XL (3rem)</span></div>
      <div><code>var(--text-5xl)</code></div>
    </div>
  </div>
</div>

## Display Text Sizes

For impact statements, statistics, or other prominent display text:

<div class="example">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: center; overflow: hidden;">
      <div><span style="font-size: var(--text-6xl); line-height: 1.1;">Text 6XL</span></div>
      <div><code>var(--text-6xl)</code> (3.75rem / 60px)</div>
      
      <div><span style="font-size: var(--text-7xl); line-height: 1.1;">Text 7XL</span></div>
      <div><code>var(--text-7xl)</code> (4.5rem / 72px)</div>
    </div>
  </div>
</div>

## Line Heights

Our typography system includes several line-height variables to ensure proper text readability:

<div class="example">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; margin-bottom: 1rem;">
      <div style="line-height: var(--leading-none);"><strong>Leading None (1.0)</strong><br>Tightly packed text with no additional leading.</div>
      <div><code>var(--leading-none)</code></div>
      
      <div style="line-height: var(--leading-tight);"><strong>Leading Tight (1.25)</strong><br>Slightly tighter than normal line spacing, good for headings.</div>
      <div><code>var(--leading-tight)</code></div>
      
      <div style="line-height: var(--leading-snug);"><strong>Leading Snug (1.375)</strong><br>A bit more breathing room than tight, but still compact.</div>
      <div><code>var(--leading-snug)</code></div>
      
      <div style="line-height: var(--leading-normal);"><strong>Leading Normal (1.5)</strong><br>Standard line spacing for body text that provides good readability.</div>
      <div><code>var(--leading-normal)</code></div>
      
      <div style="line-height: var(--leading-relaxed);"><strong>Leading Relaxed (1.625)</strong><br>Slightly more spacious than normal, good for longer text passages.</div>
      <div><code>var(--leading-relaxed)</code></div>
      
      <div style="line-height: var(--leading-loose);"><strong>Leading Loose (2.0)</strong><br>Very spacious line height for maximum readability in dense content.</div>
      <div><code>var(--leading-loose)</code></div>
    </div>
  </div>
</div>

## Font Weights

Available font weights for creating visual hierarchy:

<div class="example">
  <div class="example-preview">
    <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: center;">
      <div style="font-weight: var(--font-normal);">Font Normal (400)</div>
      <div><code>var(--font-normal)</code></div>
      
      <div style="font-weight: var(--font-medium);">Font Medium (500)</div>
      <div><code>var(--font-medium)</code></div>
      
      <div style="font-weight: var(--font-semibold);">Font Semibold (600)</div>
      <div><code>var(--font-semibold)</code></div>
      
      <div style="font-weight: var(--font-bold);">Font Bold (700)</div>
      <div><code>var(--font-bold)</code></div>
    </div>
  </div>
</div>

## Language Helper Classes

You can explicitly specify typography for a specific language using helper classes:

<div class="example">
  <div class="example-preview">
    <p><span class="zh">中文文本</span> mixed with English text.</p>
    <p><span class="ru">Русский текст</span> mixed with English text.</p>
  </div>
  
  <div class="example-code">
```html
<!-- Chinese serif font regardless of page language -->
<span class="zh">中文文本</span>

<!-- Chinese sans-serif font -->
<span class="zh-sans">中文文本</span>

<!-- Russian serif font regardless of page language -->
<span class="ru">Русский текст</span>

<!-- Russian sans-serif font -->
<span class="ru-sans">Русский текст</span>

<!-- English serif font regardless of page language -->
<span class="en">English text</span>

<!-- English sans-serif font -->
<span class="en-sans">English text</span>
```
  </div>
</div>

## Implementation Guidelines

### Self-Hosted Fonts

All fonts are self-hosted to ensure accessibility for users in all regions, particularly important for Chinese users who may experience issues with Google Fonts.

### Responsive Design

Our typography scales appropriately across different screen sizes. The base size is defined in rems to respect user font size preferences.

### Typography Variables

When implementing custom components, use the predefined typography variables to maintain consistency:

```css
.my-component-heading {
  font-family: var(--font-heading);
  font-size: var(--text-2xl);
  line-height: var(--leading-tight);
  font-weight: var(--font-bold);
}

.my-component-text {
  font-family: var(--font-body);
  font-size: var(--text-base);
  line-height: var(--leading-normal);
}
```