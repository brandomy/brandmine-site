# Brandmine Data Automation Cheat Sheet

## Overview
This guide covers how to automate and semi-automate data movement between YAML collection files and JSON data files in the Brandmine Jekyll site.

---

## 🗂️ Data Structure Overview

### YAML Collections (Source of Truth for Content)
```
_brands/{lang}/brand-slug.md     # Individual brand pages
_founders/{lang}/founder-slug.md # Individual founder pages  
_insights/{lang}/insight-slug.md # Individual insight articles
_dimensions/{lang}/{type}/dim.md # Dimension definitions
```

### JSON Data Files (Optimized for Search/Filtering)
```
_data/brands.json     # All brands, all languages
_data/founders.json   # All founders, all languages
_data/insights.json   # All insights, all languages
_data/dimensions.json # All dimensions, all languages
```

---

## 🔧 Available Automation Scripts

### 1. YAML to JSON Conversion
**Script**: `_scripts/yml_to_json_converter.py`

**Purpose**: Converts YAML frontmatter to flat JSON structure
```bash
cd /path/to/brandmine-site
python _scripts/yml_to_json_converter.py
```

**What it does**:
- Reads YAML frontmatter from collections
- Flattens nested structures (social media, etc.)
- Outputs to `_exports/` directory
- Handles all three languages

### 2. Search Index Generation
**Script**: `_scripts/generate_search_index.py`

**Purpose**: Creates search-optimized JSON files
```bash
cd /path/to/brandmine-site
python _scripts/generate_search_index.py
```

**What it does**:
- Generates `search.json` for site-wide search
- Creates category-specific indexes
- Optimizes for JavaScript search functionality

### 3. JSON Update Wrapper
**Script**: `_scripts/update_json.sh`

**Purpose**: One-command update of all JSON files
```bash
chmod +x _scripts/update_json.sh
./_scripts/update_json.sh
```

**What it does**:
- Runs JSON generation scripts
- Optionally rebuilds Jekyll site
- Updates search indexes

---

## 📝 Manual Data Movement Process

### Adding New Brand (YAML → JSON)

1. **Create YAML File**:
```yaml
---
ref: ru-new-brand
title: "New Brand Name"
lang: en
generate_json: true  # IMPORTANT: Include this flag
# ... other frontmatter
---
```

2. **Update JSON**:
```bash
python _scripts/yml_to_json_converter.py
```

3. **Verify in JSON**:
Check `_data/brands.json` for new entry.

### Bulk Update Process

1. **Update Multiple YAML Files**
2. **Run Conversion**:
```bash
./_scripts/update_json.sh
```
3. **Validate**:
```bash
./_scripts/validate_yaml.sh
./_scripts/validate_multilingual.sh
```

---

## 🔄 Reverse Process: JSON → YAML

### When to Use
- Importing from external systems (Airtable, etc.)
- Bulk updates from spreadsheets
- Data migration scenarios

### Semi-Automated Approach

1. **Use Import Script**:
```bash
ruby _scripts/import_from_airtable.rb
```

2. **Manual Review Required**:
- Check language consistency
- Verify image paths
- Validate taxonomy terms

3. **Validation**:
```bash
./_scripts/check_language_consistency.sh
./_scripts/validate_yaml.sh
```

---

## 🎯 Best Practices

### Data Consistency
1. **Always include `generate_json: true`** in YAML frontmatter
2. **Use exact taxonomy slugs** - no translation in frontmatter
3. **Maintain three-language structure** for all content
4. **Use structured image data**:
```yaml
images:
  logo:
    name: "color"
    ext: "png"
  hero:
    name: "farm-view"
    ext: "jpg"
```

### Validation Workflow
```bash
# Before converting
./_scripts/validate_yaml.sh

# Convert
python _scripts/yml_to_json_converter.py

# After converting  
./_scripts/check_language_consistency.sh
bundle exec jekyll build  # Test build
```

### Data Safety
1. **Always backup before bulk operations**:
```bash
./_scripts/backup_critical.sh
```

2. **Use version control**:
```bash
git add -A
git commit -m "Data update: [description]"
```

3. **Test locally before deployment**:
```bash
bundle exec jekyll serve --host=0.0.0.0
```

---

## 🚫 GitHub Pages Limitations

### What Doesn't Work
- Ruby gems beyond GitHub Pages whitelist
- Python scripts during build
- Dynamic JSON generation during build

### What Works
- Pre-generated JSON files (committed to repo)
- Jekyll's built-in data processing
- Static JSON files in `_data/`

### Workaround Strategy
1. **Local Development**:
   - Use all scripts locally
   - Generate JSON files
   - Commit generated files

2. **Production (GitHub Pages)**:
   - Uses committed JSON files
   - No dynamic generation
   - Jekyll processes static data

---

## 🔍 Troubleshooting

### Common Issues

**YAML Parse Errors**:
```bash
./_scripts/validate_yaml.sh
# Fix YAML syntax issues
```

**Missing Translations**:
```bash
./_scripts/check_language_consistency.sh
# Ensure all content exists in all languages
```

**Image Path Issues**:
- Check image naming conventions
- Verify file existence in `assets/images/`
- Use `process_images.sh` for proper sizing

**JSON Schema Issues**:
- Validate required fields in frontmatter
- Check taxonomy slug accuracy
- Ensure proper data types

### Emergency Recovery
```bash
# Restore from backup
cp -r _backups/latest/* .

# Reset to last good commit
git reset --hard HEAD~1

# Rebuild JSON from scratch
rm _data/*.json
python _scripts/yml_to_json_converter.py
```

---

## 🎪 Automation Workflow

### Daily Content Updates
```bash
# 1. Edit YAML files normally
# 2. Update JSON when ready
./_scripts/update_json.sh

# 3. Test locally
bundle exec jekyll serve

# 4. Deploy
git add -A && git commit -m "Content update" && git push
```

### Weekly Maintenance
```bash
# Validate everything
./_scripts/validate_multilingual.sh
./_scripts/check_language_consistency.sh

# Clean up and optimize
./_scripts/backup_critical.sh
python _scripts/yml_to_json_converter.py
```

### Pre-Launch Checklist
- [ ] All YAML files have `generate_json: true`
- [ ] JSON files are up to date
- [ ] All languages have content
- [ ] Images exist and are properly sized
- [ ] Local build succeeds
- [ ] Search functionality works
- [ ] Filter functionality works

---

*Last Updated: 2025-05-25*
*For questions: Check `_docs/troubleshooting/` or review script comments*