# Brandmine: Developer Overview

Brandmine is a multilingual, mobile-first Jekyll site that showcases founder-led consumer brands from BRICS+ countries. It uses structured metadata, interactive maps, and narrative content to make emerging brands discoverable globally.

---

## 🔧 Tech Stack

- **Jekyll** (no theme) with multilingual routing
- **MapLibre** for embedded maps
- **Vanilla JS**, **BEM CSS**, and **design tokens**
- Markdown for brands, tags, and pages
- `_data/` for nav, translation, footer config
- Supports EN / RU / ZH

---

## 📁 Folder Structure

```
/_brands/{lang}/       — Brand profiles (Markdown)
/_tags/{lang}/{type}/  — Tags by type (Markdown)
/_insights/{lang}/     — Brand spotlight articles
/_data/                — Translations, nav, footer, sectors
/_includes/            — Components (header, footer, tag-list)
/_layouts/             — Layout templates
/pages/{lang}/         — Top-level pages (e.g., about.md)
/assets/               — CSS (BEM), JS, fonts, tokens
_config.yml            — Global config, collections, i18n
```

---

## 🏷️ Tag System

**Tag types:**
- `sectors` – industries
- `attributes` – brand traits
- `signals` – readiness indicators
- `markets` – geographic tags

Each tag has front matter + rich narrative.
Example in `_tags/en/attributes/artisanal-excellence.md`.

---

## 🧠 Multilingual Logic

- Language folders: `/en/`, `/ru/`, `/zh/`
- Nav & labels: `_data/translations/` and `_data/navigation/`
- Permalinks use `page.lang`
- CSS and layout adapt to language context

---

## 🧪 Build & Test

```bash
npm run start                  # = bundle exec jekyll serve
npm run build                  # = jekyll build
jekyll doctor                  # check site config
htmlproofer _site              # check final HTML
./_scripts/check_language_consistency.sh
```

Test on mobile via `--host=0.0.0.0`

---

## 🤝 Contribution Guidelines

- Follow BEM naming
- Keep brand/tag naming consistent
- Validate new tags across all 3 languages
- Run `htmlproofer` and `language_consistency` before merge
