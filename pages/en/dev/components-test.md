---
layout: test
title: Components Test
permalink: /en/dev/components-test/
lang: en
---
<h1>A Page to Test and Learn About Includes Components</h1>

<h2>Separators</h2>

<h3>1. Dot Separator</h3>
<p>Founder-led{% include components/separators/dot-separator.html %}Women-owned</p>

<h3>2. Comma Separator</h3>
<p>Natural Beauty Products{%- include components/separators/comma-separator.html -%}Fashion & Accessories</p>

<h3>3. Pipe Separator</h3>
<p><a href="/brands/">Brands</a>{% include components/separators/pipe-separator.html %}<a href="/insights/">Insights</a></p>

<h3>4. Bullet Separator</h3>
<p>Artisanal{% include components/separators/bullet-separator.html %}Organic{% include components/separators/bullet-separator.html %}Export-ready</p>
<h4>With custom symbol</h4>
<p>Handmade{% include components/separators/bullet-separator.html symbol="◆" %}Local Sourcing</p>

<h3>5. Slash Separator</h3>
<p>Brazil{% include components/separators/slash-separator.html %}São Paulo{% include components/separators/slash-separator.html %}Zona Sul</p>

<h3>6. En Dash Separator</h3>
<p>Founded: 2015{% include components/separators/en-dash-separator.html %}2023</p>
<p>Russia{% include components/separators/en-dash-separator.html %}Brazil</p>

<h3>7. Spacer Separator</h3>
<p><span class="icon">🌿</span> {% include components/separators/spacer.html %}<span>Sustainable</span><span class="tag">Founder-led</span>{% include components/separators/spacer.html %}<span class="tag">Women-owned</span></p>

<h3>8. Emoji Separator</h3>
<p>Sustainable{% include components/separators/emoji-separator.html %}Organic</p>
<h4>Custom Emoji Variant</h4>
<p>Natural{% include components/separators/emoji-separator.html symbol="✨" %}Ethical</p>
<hr>

<h2>Buttons</h2>


