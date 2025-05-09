---
layout: default
title: Component Test
permalink: /components-test/
lang: en
ref: components-test
---

<h1>A Page to Test and Learn About Includes Components</h1>

<h2>1. Dot Separator</h2>

Founder-led
{% include components/icons/dot-separator.html %}
Women-owned

<!-- Display Code block -->
{% capture dot_code %}
<h2>Dot Separator</h2>
Founder-led
{% include components/icons/dot-separator.html %}
Women-owned
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=dot_code %}


<h2>2. Comma Separator</h2>
Natural Beauty Products
{% include components/icons/comma-separator.html %}
Fashion & Accessories


<h23>3. Pipe Separator</h2>
<a href="/brands/">Brands</a>
{% include components/icons/pipe-separator.html %}
<a href="/insights/">Insights</a>

<!-- Display Code block -->
{% capture pipe_code %}
<a href="/brands/">Brands</a>
{% include components/icons/pipe-separator.html %}
<a href="/insights/">Insights</a>
{% endcapture %}

{% include components/styleguide/code-sample.html language="liquid" code=pipe_code %}
