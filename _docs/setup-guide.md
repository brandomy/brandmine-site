# Quick Setup Guide

**Time to productivity**: 5 minutes

## Prerequisites

```bash
# Verify you have these installed
ruby --version        # 2.7+ required
bundle --version      # Bundler gem manager
node --version        # 16+ recommended (for scripts)
python3 --version     # 3.8+ (for automation scripts)
```

## Environment Setup

### 1. Install Dependencies
```bash
# Jekyll and Ruby dependencies
bundle install

# Node.js dependencies (for scripts)
npm install
```

### 2. Build and Serve
```bash
# Development server (auto-reload)
bundle exec jekyll serve --livereload

# Mobile testing (access from other devices)
bundle exec jekyll serve --host=0.0.0.0

# Production build
JEKYLL_ENV=production bundle exec jekyll build
```

### 3. Verify Installation
```bash
# Site should be available at:
open http://localhost:4000

# Test all languages work:
# http://localhost:4000/en/
# http://localhost:4000/ru/  
# http://localhost:4000/zh/
```

## Your First Tasks

### 1. Understand the Structure
```bash
# Key directories
_brands/              # Brand content (EN/RU/ZH)
_founders/            # Founder profiles
_dimensions/          # Taxonomy system
_includes/pages/      # Page sections
_data/               # Configuration and translations
_scripts/            # Automation tools
```

### 2. Test Key Scripts
```bash
# Verify core scripts work
_scripts/validation/check_language_consistency.sh
_scripts/data-generation/generate-all-json.py
_scripts/core/pre-commit_check.sh
```

### 3. Run a Build Test
```bash
# Full build should complete in ~12-13 seconds
time JEKYLL_ENV=production bundle exec jekyll build
```

## Development Workflow

### Quick Commands
```bash
# Start development
npm run start          # Alias for jekyll serve

# Build for production  
npm run build          # Alias for jekyll build

# Check for issues
_scripts/core/pre-commit_check.sh
```

### IDE Setup
**Recommended**: VS Code with:
- Jekyll snippets extension
- Liquid syntax highlighting
- Markdown preview
- SCSS/Sass support

## Performance Optimization

The site uses pre-generated optimizations for fast builds:

```bash
# These run automatically in pre-commit, but you can run manually:
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
```

## Next Steps

1. **Read**: [Daily Workflows](daily-workflows.md) for content creation
2. **Explore**: Add a test brand using [content creation workflows](daily-workflows.md#content-creation)
3. **Learn**: Review [Technical Reference](technical-reference.md) for architecture understanding

## Common Setup Issues

| Problem | Solution |
|---------|----------|
| `bundle install` fails | Check Ruby version, install bundler |
| Site won't load | Check port 4000 isn't in use |
| Build takes >20s | Run performance optimization scripts |
| Missing translations | Check `_data/translations/` files exist |
| Images not processing | Verify ImageMagick is installed |

---

**Next**: [Daily Workflows →](daily-workflows.md)