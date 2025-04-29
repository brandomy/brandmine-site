# Brandmine Tag System

## Tag Structure

The Brandmine tag system uses a three-dimensional taxonomy:

1. **Sector Tags (16)**: Product and service categories
2. **Attribute Tags (8)**: Distinctive brand qualities
3. **Growth Tags (4)**: Business readiness indicators
4. **Country Tags (5)**: Geographic origin tags

## Tag Definitions

Tags are defined in `_data/tag_translations.yml` with this structure:

```yaml
sectors:
  hotels-resorts:
    en: "Hotels & Resorts"
    ru: "Гостиницы и Курорты"
    zh: "酒店与度假村"
  # Other sectors...

attributes:
  founder-led:
    en: "Founder-Led"
    ru: "Управляемый Основателем"
    zh: "创始人领导"
  # Other attributes...

growth:
  export-ready:
    en: "Export Ready" 
    ru: "Готов к экспорту"
    zh: "出口就绪"
  # Other growth signals...

countries:
  russia:
    en: "Russia"
    ru: "Россия"
    zh: "俄罗斯"
  # Other countries...
```

## Tag Implementation

Tags are displayed using includes from `_includes/tags/`:

- `tag-list.html`: Displays tags associated with a brand or post
- `tag-cloud.html`: Shows all available tags in a section

Tags have different styling based on their type:
- Sector tags: Light teal background (`--primary-100`)
- Attribute tags: Light orange background (`--secondary-100`)
- Growth tags: Light indigo background (`--accent-100`)
- Country tags: Light gray background (`--neutral-100`)

## Tag Pages

Each tag has a dedicated page at:
`/{language}/tags/{tag-type}/{tag-name}/`

These pages show all content tagged with that specific tag.
