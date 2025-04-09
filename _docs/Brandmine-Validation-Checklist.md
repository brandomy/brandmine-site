# ✅ Brandmine QA Checklist: Brands & Tags

## 🔹 Brand Markdown Validation (`/_brands/{lang}/`)

- [ ] Has `title`, `lang`, and `slug`
- [ ] Includes at least one `sector`
- [ ] Has 2–4 `tags` (attributes, signals, markets)
- [ ] Includes `founder`, `slogan`, and `description`
- [ ] Hero and logo images correctly linked
- [ ] Uses valid permalink structure (`/en/brands/...`)
- [ ] `featured` and `premium` booleans are correct

## 🔹 Tag Markdown Validation (`/_tags/{lang}/{type}/`)

- [ ] Has valid `tag`, `tag_type`, and `permalink`
- [ ] Includes a `description` in front matter
- [ ] `badge_icon` and `badge_type` (e.g. tier1) used appropriately
- [ ] `verification_required` is boolean
- [ ] Narrative body is meaningful and matches type
- [ ] Exists in all 3 language folders

## 🔹 General Content Checks

- [ ] Uses consistent naming across all languages
- [ ] No broken internal links or image paths
- [ ] Page builds correctly in `jekyll serve`
- [ ] No layout breaks on mobile
