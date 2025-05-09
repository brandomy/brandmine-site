---
layout: test
title: Components Test
permalink: /en/components-test/
lang: en
---
<h1>A Page to Test and Learn About Includes Components</h1>

<h2>1. Dot Separator</h2>

<p>Founder-led{% include components/separators/dot-separator.html %}Women-owned</p>

<h2>2. Comma Separator</h2>

<p>Natural Beauty Products{%- include components/separators/comma-separator.html -%}Fashion & Accessories</p>


<h2>3. Pipe Separator</h2>
<p><a href="/brands/">Brands</a>{% include components/separators/pipe-separator.html %}<a href="/insights/">Insights</a></p>

<h2>4. Bullet Separator</h2>
<p>Artisanal{% include components/separators/bullet-separator.html %}Organic{% include components/separators/bullet-separator.html %}Export-ready</p>

<h3>With custom symbol</h3>
<p>
Handmade{% include components/separators/bullet-separator.html symbol="◆" %}Local Sourcing
</p>

<h2>5. Slash Separator</h2>
<p>
Brazil{% include components/separators/slash-separator.html %}São Paulo{% include components/separators/slash-separator.html %}Zona Sul
</p>

<h2>6. En Dash Separator</h2>
<p>
Founded: 2015{% include components/separators/en-dash-separator.html %}2023
</p>
<p>
Russia{% include components/separators/en-dash-separator.html %}Brazil
</p>

<h2>7. Spacer Separator</h2>
<p>
<span class="icon">🌿</span> {% include components/separators/spacer.html %}<span>Sustainable</span><span class="tag">Founder-led</span>{% include components/separators/spacer.html %}<span class="tag">Women-owned</span>
</p>


<h2>8. Emoji Separator</h2>
<p>
Sustainable{% include components/separators/emoji-separator.html %}Organic
</p>
<h3>Custom Emoji Variant</h3>
<p>
Natural{% include components/separators/emoji-separator.html symbol="✨" %}Ethical
</p>
