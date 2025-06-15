# Developer Hub

*Technical documentation and workflows*

## 🏗️ Architecture & Systems

### Core References
- **[Architecture Reference](architecture-reference.md)** - System architecture and design patterns
- **[Technical Reference](technical-reference.md)** - CSS architecture, component patterns, performance
- **[CLAUDE.md](../CLAUDE.md)** - Master documentation for AI collaboration

### Development Standards
- **[Naming Standards](naming-standards.md)** - File naming, CSS classes, URLs, front matter
- **[Documentation Governance](documentation-governance.md)** - Documentation rules and processes

## 🔧 Daily Development

### Workflows
- **[Developer Daily Workflows](developer-daily-workflows.md)** - Common development tasks and procedures
- **[Component Development Workflow](component-development-workflow.md)** - Adding new components to the system

### Image & Asset Management
- **[Images Guide](images.md)** - Technical image processing and optimization
- **[Colors Guide](colors.md)** - Design token system and color usage

## 🚀 Getting Started

### Setup & Onboarding
- **[Setup Guide](setup-guide.md)** - Environment installation and first steps
- **[Project Charter](charter.md)** - Project overview and mission

### Troubleshooting
- **[Troubleshooting Guide](troubleshooting.md)** - Common technical issues and solutions

## ⚡ Quick Commands

### Development Server
```bash
bundle exec jekyll serve --livereload
```

### Production Build
```bash
JEKYLL_ENV=production bundle exec jekyll build
```

### Validation & Testing
```bash
_scripts/core/pre-commit_check.sh
```

### Image Processing
```bash
_scripts/core/process_images.sh [collection] [slug]
```

## 🎯 Build Performance Targets

- **Development build**: <5 seconds
- **Production build**: <15 seconds
- **Content addition**: <20 minutes per brand

## 📊 Architecture Status

- ✅ **Image System**: 100% standardized across all content
- ✅ **Component Architecture**: Unified collection-image.html system  
- ✅ **Cross-Language**: Perfect EN/RU/ZH consistency
- ✅ **Validation**: Comprehensive pre-commit enforcement

---

*For content creation guidance, see [Content Creators Hub](content-creators-hub.md)*