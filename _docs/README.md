# 📚 Brandmine Documentation Hub

**Find what you need in 30 seconds or less**

## 🎯 Quick Navigation

### For Content Creators (Randal & Olya)
👉 **[Content Creators Hub](content-creators-hub.md)** - Everything you need for daily content creation

### For Developers
👉 **[Developer Hub](developer-hub.md)** - Technical documentation and workflows

---

This navigation hub helps you quickly locate the right documentation for your task. All documentation follows our core principles: minimal, practical, and task-focused.

---

## 🏗️ Core Foundation (Start Here)

These four documents contain 90% of what you need for daily development:

### 1. [Setup Guide](setup-guide.md) 
**Find setup instructions in 15 seconds**
- Environment configuration
- Quick start commands
- Initial project setup
- Development tools

### 2. [Developer Daily Workflows](developer-daily-workflows.md)
**Find common tasks in 20 seconds**
- Content creation workflows
- Image processing
- Translation management
- Testing procedures

### 3. [Technical Reference](technical-reference.md)
**Find architecture patterns in 25 seconds**
- "Logic Light" architecture
- CSS/BEM methodology
- Component patterns
- Countries data system

### 4. [Troubleshooting](troubleshooting.md)
**Find solutions in 30 seconds**
- Common build errors
- Liquid syntax issues
- Image processing problems
- Performance optimization

---

## 📖 Supporting References

Additional guides for specific aspects of the project:

### [Images Guide](images.md)
- Image naming conventions
- Processing workflows
- Optimization standards
- Attribution requirements

### [Colors Guide](colors.md)
- Visual style standards
- Brand color palette
- Teal filter application
- Consistency guidelines

---

## 🎓 Step-by-Step Tutorials

Detailed tutorials for content creation are maintained separately in `_templates/tutorials/`:

### Content Creation Tutorials
Located in `_docs/`:
- **Brand Profile Tutorial** - Complete guide to adding new brands
- **Founder Profile Tutorial** - Creating founder profiles with quotes
- **Insight Article Tutorial** - Writing and categorizing insights
- **Market Sector Tutorial** - Building market-sector pages

### Workflow Templates
Located in `_templates/tutorials/workflows/`:
- **Architecture Guide** - Deep dive into "Logic Light" patterns
- **Feature Workflow Template** - Standard development process

---

## 📋 Quick Reference

### Most Common Tasks
1. **Adding a brand?** → [Daily Workflows](daily-workflows.md#brand-workflow)
2. **Processing images?** → [Images Guide](images.md#processing-workflow)
3. **Build errors?** → [Troubleshooting](troubleshooting.md#build-errors)
4. **Component patterns?** → [Technical Reference](technical-reference.md#component-patterns)

### Key Commands
```bash
# Development server
bundle exec jekyll serve --livereload

# Process images
_scripts/core/process_images.sh brands ru-teatime

# Generate JSON data
python3 _scripts/core/generate-all-json.py

# Pre-commit validation
_scripts/core/pre-commit_check.sh
```

---

## 📏 Documentation Rules

Per [documentation-governance.md](documentation-governance.md):
- Maximum 4 core documents (foundation)
- 30-second information discovery
- Task-focused, not theory-focused
- CLAUDE.md remains the master reference

**Remember:** If you can't find it in 30 seconds, check CLAUDE.md or ask the team.

---

*Last updated: {{ site.time | date: '%Y-%m-%d' }}*