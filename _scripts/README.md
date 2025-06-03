# Brandmine Scripts Directory

This directory contains all development and maintenance scripts for the Brandmine Jekyll site, organized by function.

## 📁 Directory Structure

### 🎯 **core/** - Essential Daily Tools
Scripts you'll use regularly in development workflow:
- `generate-all-json.py` - Master data generator (brands + founders)
- `process_images.sh` - Main image processor for all collections
- `pre-commit_check.sh` - Quality assurance checks before commits
- `claude-session-init.py` - AI session context generator

### ✍️ **content-creation/** - Content Templates & Generation
Tools for creating new content:
- `generate_brand_template.py` - Advanced multilingual brand profiles
- `generate_article_template.py` - Insight article templates
- `add_brand.rb` - Simple brand creation tool
- `convert_googledoc_to_jekyll.py` - Import content from Google Docs

### 🖼️ **image-processing/** - Image Tools
All image-related scripts:
- `apply_teal_fabric_style.sh` - Brand consistency filter for team photos
- `apply_teal_filter.sh` - Alternative lighter brand filter
- `stylize_images.sh` - Advanced editorial styling (Textured Minimalism)
- `add_image_attribution.py` - Legal compliance and attribution tracking

### 📊 **data-generation/** - JSON & Data Processing
Scripts that generate search indexes and data files:
- `generate-brands-json.py` - Brands collection to JSON
- `generate-founders-json.py` - Founders collection to JSON
- `import_from_airtable.rb` - Import from external Airtable database
- `JSON_GENERATION_README.md` - Detailed documentation

### ✅ **validation/** - Quality Assurance
Scripts that check for issues and inconsistencies:
- `compare_keys.py` - Advanced translation analysis
- `find_translation_keys.py` - Usage tracking for translations
- `language_consistency_checker.py` - Multilingual content validation
- `validate_yaml.sh` - YAML syntax checking
- `check_comments.sh` - Jekyll comment tag validation
- `check_scss_liquid.sh` - SCSS/Liquid conflict detection

### 🛠️ **development-tools/** - Advanced Analysis
Tools for project analysis and reporting:
- `enhanced-site-summary-advanced.sh` - Comprehensive site analysis
- `project-log-maintainer.py` - Structured project logging
- `directory_structure.sh` - Project structure documentation

### 🔧 **utilities/** - Supporting Tools
Specialized utility scripts:
- `backup_critical.sh` - Critical files backup
- `update_json.sh` - Quick JSON updates
- `fix-css-rgb-alpha.sh` - CSS compatibility fixes
- `generate-russian-market-sector-pages.js` - Russian market page generation

## 🚀 Quick Start

### Daily Workflow Commands
```bash
# Generate all JSON data
./_scripts/core/generate-all-json.py

# Process new images
./_scripts/core/process_images.sh brands br-new-brand

# Run quality checks
./_scripts/core/pre-commit_check.sh

# Create new brand template
./_scripts/content-creation/generate_brand_template.py --type full --market ru --slug new-brand
```

### Common Tasks
```bash
# Check translation consistency
./_scripts/validation/compare_keys.py

# Generate site analysis
./_scripts/development-tools/enhanced-site-summary-advanced.sh --display

# Add image attribution
./_scripts/image-processing/add_image_attribution.py brands brand-slug image-name.jpg
```

## 📋 Dependencies

### Required for Core Scripts:
- Python 3.8+
- ImageMagick (for image processing)
- Jekyll and Ruby environment
- Node.js (for some utilities)

### Optional for Extended Features:
- Airtable API access (for import_from_airtable.rb)
- Additional Python packages (PyYAML, requests)

## 🏗️ Architecture Notes

Scripts follow the "Logic Light" principle:
- Minimal hardcoded logic
- Data-driven configuration
- Comprehensive error handling
- Consistent CLI interfaces

## 📚 Documentation

Each directory contains scripts with comprehensive inline documentation. For detailed usage:
- Check individual script help: `script_name.py --help`
- See `JSON_GENERATION_README.md` for data workflow details
- Use `claude-session-init.py` for AI-assisted development context

## 🧹 Maintenance

This directory was reorganized on 2025-06-03 to improve organization and remove outdated scripts. All remaining scripts are actively maintained and functional.