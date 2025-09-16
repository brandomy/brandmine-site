---
layout: default
title: 图片来源
permalink: /zh/image-credits/
language: zh
ref: image-credits
---

# 图片来源

{% for attribution in site.data.image_attributions.images %}
## {{ attribution.filename }}

- **创作者:** {{ attribution.creator }}
- **来源:** [{{ attribution.source }}]({{ attribution.url }})
- **许可证:** {{ attribution.license }}
- **使用位置:** {{ attribution.path }}

{% endfor %}