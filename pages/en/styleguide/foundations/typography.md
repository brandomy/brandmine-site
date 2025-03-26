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

{% include styleguide/code-example.html 
   language="html" 
   preview=true
   code='<h1>Heading Level 1</h1>
<h2>Heading Level 2</h2>
<h3>Heading Level 3</h3>
<h4>Heading Level 4</h4>
<h5>Heading Level 5</h5>
<h6>Heading Level 6</h6>'
%}

### Body Text

We use sans-serif fonts for body text to maximize readability:

{% include styleguide/code-example.html 
   language="html" 
   preview=true
   code='<p>This is a paragraph of body text. Our typography system uses sans-serif fonts for body content to provide excellent readability across screen sizes. The base font size is 16px (1rem) with a line height of 1.5.</p>
<p>A second paragraph shows the spacing between paragraphs and demonstrates how text flows in a multi-paragraph context.</p>'
%}

## Language-Specific Typography

Our typography system automatically adapts to the page language using the `lang` attribute on the HTML element.

### English

English pages use PT Serif for headings and PT Sans for body text:

{% include styleguide/code-example.html 
   language="html" 
   preview=true
   code='<div style="padding: 1rem; border: 1px solid var(--neutral-200); border-radius: 0.5rem;">
  <h3>English Typography Example</h3>
  <p>This text is using the English typography settings with PT Serif for headings and PT Sans for body text.</p>
</div>'
%}

### Russian

Russian pages use the same PT Serif and PT Sans families, which have excellent Cyrillic support:

{% include styleguide/code-example.html 
   language="html" 
   preview=true
   code='<div style="padding: 1rem; border: 1px solid var(--neutral-200); border-radius: 0.5rem;">
  <h3 class="ru">Пример Русской Типографики</h3>
  <p class="ru-sans">Этот текст использует настройки русской типографики с PT Serif для заголовков и PT Sans для основного текста.</p>
</div>'
%}

### Chinese

Chinese pages use Noto Serif SC for headings and Noto Sans SC for body text:

{% include styleguide/code-example.html 
   language="html" 
   preview=true
   code='<div style="padding: 1rem; border: 1px solid var(--neutral-200); border-radius: 0.5rem;">
  <h3 class="zh">中文排版示例</h3>
  <p class="zh-sans">此文本使用中文排版设置，标题使用思源宋体 (Noto Serif SC)，正文使用思源黑体 (Noto Sans SC)。</p>
</div>'
%}

## Font Sizes

Our typography system uses a modular scale based on rems, maintaining proper hierarchical relationships between different text elements.

<div class="example-wrapper">
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

## Font Weights

Available font weights for creating visual hierarchy:

<div class="example-wrapper">
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

{% include styleguide/code-example.html 
   language="html" 
   preview=true
   code='<p><span class="zh">中文文本</span> mixed with English text.</p>
<p><span class="ru">Русский текст</span> mixed with English text.</p>'
%}

## Implementation Guidelines

### Typography Variables

When implementing custom components, use the predefined typography variables to maintain consistency:

{% include styleguide/code-example.html 
   language="css" 
   preview=false
   code='.my-component-heading {
  font-family: var(--font-heading);
  font-size: var(--text-2xl);
  line-height: var(--leading-tight);
  font-weight: var(--font-bold);
}

.my-component-text {
  font-family: var(--font-body);
  font-size: var(--text-base);
  line-height: var(--leading-normal);
}'
%}