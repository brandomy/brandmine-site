---
layout: default
title: Image Credits
permalink: /en/image-credits/
language: en
ref: image-credits
---

# Image Credits

{% for attribution in site.data.image_attributions.images %}
## {{ attribution.filename }}

- **Creator:** {{ attribution.creator }}
- **Source:** [{{ attribution.source }}]({{ attribution.url }})
- **License:** {{ attribution.license }}
- **Used in:** {{ attribution.path }}

{% endfor %}