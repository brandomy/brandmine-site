FIXES for new Insights Areas of Focus

1. translations/ru.yml zh.yml
2. Insights Layout Template
Update the _layouts/insight.html file to handle the new content types in breadcrumbs, category badges, etc.
3. Insights Index Page
Update the insights index/listing page (/pages/en/insights.md and similar) to reflect the new categories, especially if you have category filtering.
4. Homepage Insights Section
If your homepage has a hardcoded insights section (outside of the new include), update it to use the new categories.
5. Insights Archive/Category Pages
If you have dedicated archive pages for each content type, update those pages and their templates.
6. Insight Cards Component
If you have a separate insight-card.html include or component that's used elsewhere on the site, update it to reflect the new content types.
7. Navigation Menus
If your main navigation or insights section navigation references these categories explicitly, update those references in:

_data/navigation/en.yml (and other languages)
Any hardcoded navigation in your layouts or includes

8. Filter Components
Any search or filter components that allow filtering by content type need to be updated with the new options.
9. Discovery Pages
If any of your discovery dimension pages (sectors, markets, attributes, signals) reference insights by content type, update those references.
10. Rich Snippets / Structured Data
If you're using structured data for SEO, update any references to article types.
11. Admin Templates or Input Forms
If you have any admin templates or content creation forms that reference these content types, update them.