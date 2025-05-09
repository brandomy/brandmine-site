---
layout: test
title: Component Test
permalink: /components-test/
lang: en
---

<h1>A Page to Test and Learn About Includes Components</h1>


<!-- Rendered HTML -->
<h2>Dot Separator - Rendered</h2>
Founder-led
{% include components/separators/dot-separator.html %}
Women-owned

<!-- Display Code block -->
<h2>Dot Separator - Code</h2>
{% capture dot_code %}
  Founder-led
  {% include components/separators/dot-separator.html %}
  Women-owned
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=dot_code %}


<!-- Rendered HTML -->
<h2>Comma Separator - Rendered</h2>
Natural Beauty Products
{% include components/separators/comma-separator.html %}
Fashion & Accessories

<!-- Display Code block -->
<h2>Comma Separator - Code</h2>
{% capture comma_code %}
  Founder-led
  {% include components/separators/comma-separator.html %}
  Women-owned
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=comma_code %}


<!-- Rendered HTML -->
<h2>Pipe Separator - Rendered</h2>
<a href="/brands/">Brands</a>
{% include components/separators/pipe-separator.html %}
<a href="/insights/">Insights</a>

<!-- Display Code block -->
<h2>Pipe Separator - Code</h2>
{% capture pipe_code %}
  <a href="/brands/">Brands</a>
  {% include components/separators/pipe-separator.html %}
  <a href="/insights/">Insights</a>
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=pipe_code %}


<!-- Rendered HTML -->
<h2>Bullet Separator - Rendered</h2>
Artisanal
{% include components/separators/bullet-separator.html %}
Organic
{% include components/separators/bullet-separator.html %}
Export-ready

<h3>With custom symbol</h3>
Handmade
{% include components/separators/bullet-separator.html symbol="◆" %}
Local Sourcing

<!-- Display Code block -->
<h2>Bullet Separator - Code</h2>
{% capture bullet_code %}
  Artisanal
  {% include components/separators/bullet-separator.html %}
  Organic
  {% include components/separators/bullet-separator.html %}
  Export-ready

  <h3>With custom symbol</h3>
  Handmade
  {% include components/separators/bullet-separator.html symbol="◆" %}
  Local Sourcing
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=bullet_code %}


<!-- Rendered HTML -->
<h2>Slash Separator - Rendered</h2>
Brazil
{% include components/separators/slash-separator.html %}
São Paulo
{% include components/separators/slash-separator.html %}
Zona Sul

<!-- Display Code block -->
{% capture slash_code %}
  Brazil
  {% include components/separators/slash-separator.html %}
  São Paulo
  {% include components/separators/slash-separator.html %}
  Zona Sul
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=slash_code %}


<!-- Rendered HTML -->
<h2>En Dash Separator - Rendered</h2>
Founded:
2015 {% include components/separators/en-dash-separator.html %} 2023

Russia {% include components/separators/en-dash-separator.html %} Brazil

<!-- Display Code block -->
<h2>En Dash Separator - Code</h2>
{% capture en-dash_code %}
  Founded:
  2015 {% include components/separators/en-dash-separator.html %} 2023

  Russia {% include components/separators/en-dash-separator.html %} Brazil
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=en-dash_code %}


<!-- Rendered HTML -->
<h2>Spacer Separator - Rendered</h2>
<span class="icon">🌿</span>
{% include components/separators/spacer.html %}
<span>Sustainable</span>

<span class="tag">Founder-led</span>
{% include components/separators/spacer.html %}
<span class="tag">Women-owned</span>

<!-- Display Code block -->
<h2>Spacer Separator - Code</h2>
{% capture spacer_code %}
  <span class="icon">🌿</span>
  {% include components/separators/spacer.html %}
  <span>Sustainable</span>

  <span class="tag">Founder-led</span>
  {% include components/separators/spacer.html %}
  <span class="tag">Women-owned</span>
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=spacer_code %}


<!-- Rendered HTML -->
<h2>Emoji Separator - Rendered</h2>
Sustainable
{% include components/separators/emoji-separator.html %}
Organic

<h3>Custom Emoji Variant</h3>
Natural
{% include components/separators/emoji-separator.html symbol="✨" %}
Ethical

<!-- Display Code block -->
<h2>Emoji Separator - Code</h2>
{% capture emoji_code %}
  Sustainable
  {% include components/separators/emoji-separator.html %}
  Organic

  <h3>Custom Emoji Variant</h3>
  Natural
  {% include components/separators/emoji-separator.html symbol="✨" %}
  Ethical
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=spacer_code %}
