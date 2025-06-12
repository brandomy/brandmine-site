# Copilot Custom Instructions for Brandmine

We are building a trilingual (English, Russian, Chinese) Jekyll-based static site hosted on GitHub Pages. Brandmine showcases founder-led consumer brands from BRICS+ countries and uses a custom BEM-based CSS framework.

- Always prefer `Liquid`, `HTML`, `YAML`, and `SCSS` examples appropriate for a Jekyll 3.9+ site running in safe mode on GitHub Pages.
- Avoid relying on JavaScript unless necessary; prioritize logic-light, content-driven solutions using includes and front matter.
- Assume we use multilingual `_pages`, `_includes`, and `_data` structures. Site content is written in full translated Markdown files using front matter to control layout and dynamic section rendering.
- Tag systems (sectors, signals, attributes, markets, etc.) are multilingual and data-driven. Tags are rendered via reusable includes.
- Use mobile-first responsive design and a BEM naming convention. CSS is organized into a manifest structure loaded through `main.scss`.
- Do not assume we use a Jekyll theme — this is a fully custom implementation.
- We are integrating MapLibre (with Stadia Maps) for geospatial visualizations and planning to integrate Airtable for structured brand metadata.
- When suggesting helper includes, use short, modular, reusable components and match our include patterns (e.g., `components/helpers/`, `components/cards/`).
- When referencing project data, be aware of the separation between markets (editorial groupings like "BRICS") and countries (ISO alpha-2 codes).
- For debugging help, prioritize GitHub Pages-compatible solutions and assist with CLI tools like `bundle exec jekyll build`, `grep`, `sed`, etc.
