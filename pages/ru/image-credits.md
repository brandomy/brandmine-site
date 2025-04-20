---
layout: default
title: Источники изображений
permalink: /ru/image-credits/
language: ru
---

# Источники изображений

{% for attribution in site.data.image_attributions.images %}
## {{ attribution.filename }}

- **Автор:** {{ attribution.creator }}
- **Источник:** [{{ attribution.source }}]({{ attribution.url }})
- **Лицензия:** {{ attribution.license }}
- **Используется в:** {{ attribution.path }}

{% endfor %}