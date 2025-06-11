
# 🛠️ Best Practices for Building a Jekyll Website Hosted on GitHub Pages

## 1. Setup & Configuration

### ✅ Use GitHub-Compatible Jekyll Features
- GitHub Pages supports a limited set of plugins unless you use GitHub Actions.
- Set `theme: null` in `_config.yml` if not using a remote theme.

### ✅ Manage Dependencies Properly
```ruby
gem "github-pages", group: :jekyll_plugins
```

## 2. Content & Structure

### ✅ Use Collections for Content Types
- Organize content using `_brands`, `_insights`, `_founders`, etc.
- Configure collections in `_config.yml`.

### ✅ Keep Front Matter Clean and Consistent
- Use consistent YAML keys and structured data for scalability.

### ✅ Separate Data into `_data/` Directory
- Use for reusable JSON/YAML like `countries.yml`, `markets.json`.

### ✅ Multilingual Strategy
- Separate files per language (e.g., `index.en.md`, `index.ru.md`).
- Use language switchers and consistent permalinks.

## 3. Styling & Assets

### ✅ Mobile-First CSS and BEM Naming
- Follow mobile-first responsive design.
- Use BEM (`block__element--modifier`) for modular CSS.

### ✅ Organize CSS, JS, and Media
- Use `assets/css/`, `assets/js/`, and `assets/img/`.

## 4. Development & Testing

### ✅ Preview Locally with Bundler
```bash
bundle exec jekyll serve --livereload
```

### ✅ Use `_includes/` and `_layouts/` for Reuse
- Delegate logic to `_includes`, keep layouts readable.

### ✅ Write Modular and Reusable Components
- Create logic-light includes with optional parameters.

## 5. Git & Deployment

### ✅ Clean Git History
- Use `.gitignore` to exclude `_site/`, `.sass-cache/`, etc.

### ✅ Enable GitHub Pages from Correct Branch
- Use `gh-pages` or `main`, or deploy `/docs` folder.

### ✅ Automate with GitHub Actions (Advanced)
- Build and deploy using GitHub Actions for custom plugins.

## 6. Performance & SEO

### ✅ Use Permalinks and Canonical URLs
- Customize permalinks in `_config.yml`.
- Add `<link rel="canonical">` tags.

### ✅ Optimize Images
- Compress, size properly, and use `alt` text.

### ✅ Add Metadata and Open Graph Tags
- Use front matter for `title`, `description`, and image.
- Include via `_includes/meta.html`.

## 7. Maintenance

### ✅ Validate HTML and YAML Regularly
- Use [Yamllint](https://yamllint.com/) and [HTMLProofer](https://github.com/gjtorikian/html-proofer).

### ✅ Keep Dependencies Up to Date
- Use `bundle update`.
- Monitor [GitHub Pages gem changelog](https://github.com/github/pages-gem/releases).

### ✅ Document Your Structure
- Keep `README.md` describing folder layout, includes, and usage.

---

*Generated with ChatGPT, June 2025.*
