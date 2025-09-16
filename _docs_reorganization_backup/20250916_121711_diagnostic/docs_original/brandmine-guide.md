# Brandmine Documentation Hub
**Find anything in 30 seconds**

## 🚀 Quick Start (New Team Members)

### Environment Setup (5 minutes)
```bash
# Install dependencies
bundle install && npm install

# Start development server
bundle exec jekyll serve

# Verify at http://localhost:4000
```

### First Content Task (15 minutes)
1. **Adding a brand**: See [setup-and-workflows.md#brand-creation](setup-and-workflows.md#brand-creation)
2. **Processing images**: See [technical-standards.md#image-processing](technical-standards.md#image-processing)
3. **Validate work**: `_scripts/core/pre-commit_check.sh`

---

## 👩‍💻 Daily Workflows (Content Creators)

### Essential Patterns
- **Brand Creation**: 20 minutes end-to-end workflow
- **Founder Profiles**: 15 minutes with standardized image system
- **Insight Articles**: 25 minutes with category-specific styling
- **Translation Management**: Cross-language consistency patterns
- **Journal Content**: Internal development blog alongside customer insights

**→ Complete Workflows**: See `_templates/tutorials/workflows/` for step-by-step procedures

### Operational Tutorials (Template System)
**Located in `_templates/tutorials/`** - operational guides for active work:
- **Complete Workflows**: `_templates/tutorials/workflows/complete-workflows.md`
- **Troubleshooting**: `_templates/tutorials/troubleshooting/complete-troubleshooting.md`
- **Content Creation**: Other operational templates as needed

---

## 🤖 AI Collaboration (Claude Integration)

### Complete Project Context
- **Master Reference**: [CLAUDE.md](../CLAUDE.md) - Complete technical context for AI assistance
- **Architecture Patterns**: [technical-standards.md](technical-standards.md) - Component systems and conventions
- **Workflow Integration**: AI can reference operational tutorials in `_templates/tutorials/`

### Key AI Workflows
- Content creation with validation
- Image processing automation
- Translation consistency checking
- Build optimization and troubleshooting

---

## 🎨 Visual Standards (Design Work)

### Design System Overview
- **4 Visual Styles**: Textured minimalism, flat color, geometric, natural photography
- **Color Taxonomy**: Sectors (olive), markets (sky blue), attributes (orange), signals (indigo)
- **Responsive Images**: 3-size system with automatic generation
- **Brand Guidelines**: Teal primary, orange secondary, consistent token usage

**→ Complete Visual Framework**: See [technical-standards.md#visual-style-framework](technical-standards.md#visual-style-framework)

### Image Creation Resources
**→ Operational Prompts**: See `_templates/tutorials/Image Prompt for Chatgpt for Founders Journal.txt` for detailed creation templates

---

## 🔧 Technical Reference (Developers)

### Core Architecture
- **"Logic Light" Philosophy**: Configuration over conditionals
- **Purpose-Built Card Components**: Specialized, BEM-compliant cards optimized for each content type
- **Data-Driven Sections**: Centralized control via `_data/page_sections.yml`
- **Multilingual Support**: EN/RU/ZH with shared logic
- **Performance Targets**: <15s production builds

### Component Systems
- **Component Cards**: Brand, founder, insight, and specialized cards with variant-based architecture
- **Image Components**: Unified responsive system with intelligent fallbacks
- **Translation Helpers**: Centralized multilingual support
- **CSS Architecture**: BEM methodology with design tokens

### Purpose-Built Card System
Brandmine uses specialized card components:
- **Brand Cards** (`brand-card.html`) - Standard and featured variants
- **Founder Cards** (`founder-card.html`) - Standard and featured variants  
- **Insight Cards** (`insight-card.html`) - Multiple variants (standard, featured, tagged, related)
- **Specialized Cards** - Dimension categories, testimonials, team members

**Usage Pattern:**
```liquid
{% include components/cards/brand-card.html brand=brand variant="featured" %}
{% include components/cards/insight-card.html insight=insight variant="tagged" %}
```

**→ Complete Technical Details**: See [technical-standards.md](technical-standards.md)

---

## 🚨 Troubleshooting (Problem Resolution)

### Common Issues (30-second fixes)
- **Build Errors**: Jekyll configuration and YAML syntax issues
- **Image Problems**: Processing failures and responsive generation
- **Translation Issues**: Missing keys and language consistency
- **Performance**: Build time optimization and caching

**→ Complete Diagnostic Guide**: See `_templates/tutorials/troubleshooting/`

### Feature Debugging Workflows
**→ Advanced Troubleshooting**: See `_templates/tutorials/workflows/feature-workflow-template.md` for complex debugging processes

---

## 📊 Key Commands Reference

### Development Essentials
```bash
# Development server with live reload
bundle exec jekyll serve

# Production build (target: <15 seconds)
JEKYLL_ENV=production bundle exec jekyll build

# Complete validation suite
_scripts/core/pre-commit_check.sh

# Image processing (unified script)
_scripts/core/process_images.sh [collection] [identifier]
```

### Data Management
```bash
# Update all search indexes and JSON data
_scripts/core/generate-all-json.py

# Language consistency validation
_scripts/validation/language_consistency_checker.py

# Performance optimization utilities
_scripts/utilities/generate-language-map.py
_scripts/utilities/generate-navigation-cache.py
```

---

## 📏 Documentation Architecture

### Core Documents (30-second navigation)
1. **[brandmine-guide.md](brandmine-guide.md)** ← You are here (Master navigation)
2. **[technical-standards.md](technical-standards.md)** - Architecture patterns and visual standards
3. **[current-status.md](current-status.md)** - Current project status and recent changes

### Operational System (Template-Based)
- **`_templates/tutorials/`** - Step-by-step operational guides
- **Co-located with templates** - Natural discovery during content creation
- **Copy-paste examples** - Immediately actionable workflows

### Archives System (`_archives/`)
- **Reports**: `_archives/reports/` - Nuclear fixes, major changes, system decisions
- **Compliance**: Maintains 4-document limit in `_docs/` core navigation
- **Access**: Detailed technical reports and emergency fix documentation

### Master AI Reference
- **[CLAUDE.md](../CLAUDE.md)** - Complete project context for AI collaboration

---

## 🎯 Success Metrics

### Navigation Efficiency
- **Any task findable in 30 seconds** via this hub
- **2-click maximum** to operational procedures
- **Clear audience routing** without decision fatigue

### Maintenance Standards
- **4-document maximum** in `_docs/` root (enforced)
- **<30 minutes monthly** maintenance burden
- **No duplicate information** across documents

---

**Last updated**: {% raw %}{{ site.time | date: '%Y-%m-%d' }}{% endraw %}
**Document Count**: 3/3 (lean compliance achieved)
