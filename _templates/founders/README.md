# Founder Profile Templates Usage Guide

This directory contains templates for creating comprehensive founder profiles with multilingual support and automated JSON generation.

## Available Template

- `founder_profile.md` - Comprehensive founder profile template with full feature set

## Template Overview

The founder profile template uses a **hybrid approach** that combines:
- **Human-friendly YAML** front matter for easy editing
- **Auto-generation capabilities** for JSON exports (Airtable compatibility)
- **Linear layout architecture** with modular sections
- **Multilingual support** for English, Russian, and Chinese
- **Cross-border expertise tracking** for international founders

## Using the Template

### 1. Basic Setup
Copy the template and replace core placeholders:

```
xx-firstname-lastname → actual founder slug (e.g., "ru-alexei-sokolov")
Full Name → actual founder name
YYYY-MM-DD → profile creation date
```

### 2. Section Control
The template uses a `sections` array to control page layout:

```yaml
sections:
  - breadcrumbs           # Navigation breadcrumbs
  - hero                  # Founder hero panel
  - professional-details  # Role, expertise, achievements
  - content              # Main founder story content
  - associated-brands    # Brands associated with this founder
  - expertise-cloud      # Skills and expertise visualization
  - related-insights     # Related articles and content
```

**Toggle sections on/off** by commenting out or removing lines from the array.

### 3. File Placement
Save completed files to:
```
_founders/en/[founder-slug].md
```

Examples:
- `_founders/en/ru-alexei-sokolov.md`
- `_founders/en/br-eduardo-santos.md`
- `_founders/en/in-priya-sharma.md`

### 4. Image Organization
Founder images follow a semantic structure:

```yaml
images:
  portrait:
    name: "portrait"     # Becomes [founder-slug]-portrait-400w.jpg
    ext: "jpg"
  headshot:
    name: "headshot"     # Becomes [founder-slug]-headshot-400w.jpg
    ext: "jpg"
  action:
    name: "action"       # Becomes [founder-slug]-action-400w.jpg
    ext: "jpg"
```

**Image files should be placed in**:
```
assets/images/founders/[founder-slug]/
├── portrait.jpg      # 2:3 aspect ratio (800×1200px)
├── headshot.jpg      # 1:1 aspect ratio (800×800px)  
├── action.jpg        # 3:2 aspect ratio (1200×800px)
└── [additional images]
```

## Required Front Matter Fields

### Core Information
```yaml
layout: founder-profile
ref: xx-firstname-lastname  # Global founder ID
name: "Full Name"
lang: en
permalink: /en/founders/xx-firstname-lastname/
```

### Brand Association
```yaml
brands: [xx-brand-slug]  # Array of associated brand slugs
role: "CEO & Founder"    # Their role in the primary brand
generation: "first"      # Options: "first", "second", "third", "transition"
```

### Geographic Information
```yaml
country_code: br         # Two-letter country code (ISO 3166-1 alpha-2)
region: "São Paulo"      # Optional: specific region or state
city: "São Paulo"
markets: [br, us, ca]    # Array of countries where they operate
```

### Professional Details
```yaml
expertise:
  - "Organic Farming"    # Max 4 items for optimal display
  - "Export Strategy"
  - "Brand Development"
  - "Sustainable Production"

cross_border_expertise: true  # Has international experience?
languages: [pt, en, es]       # Languages they speak (ISO 639-1 codes)
```

## JSON Generation

### Automatic Export
When `generate_json: true` is set, founder data will be included in automated JSON exports:

```bash
python3 _scripts/generate_search_index.py
```

This generates:
- `_data/founders.json` - Complete founder index for search and filtering
- `assets/data/founders.json` - Public API endpoint

### Sample Data Flag
Use `sample_data: true` for test founders that should not appear in production exports.

## Content Guidelines

### Founder Story Structure
Write 6-8 paragraphs covering:

1. **Opening Hook** (100-150 words)
   - One-line powerful positioning statement
   - Key achievement or unique contribution
   - Why this person is noteworthy

2. **Background & Education** (200-250 words)
   - Personal background and early life
   - Educational journey or formative experiences
   - Relevant skills or knowledge acquisition

3. **Founding Story** (200-250 words)
   - How they started their company
   - Key challenges and pivotal moments
   - Innovation or unique approach

4. **Leadership Philosophy** (150-200 words)
   - Management style and principles
   - Company culture and values
   - Approach to team building

5. **Recognition & Achievements** (150-200 words)
   - Company growth metrics
   - Awards or industry recognition
   - International expansion success

6. **Vision for the Future** (100-150 words)
   - Current projects and initiatives
   - Long-term goals and aspirations
   - Industry impact and legacy

### Writing Standards
- **Personal and relatable** tone while maintaining professionalism
- **Specific examples and anecdotes** rather than generic statements
- **Cultural context** for international readers
- **Achievement-focused** with concrete metrics where possible
- **Inspirational conclusion** emphasizing future potential

## Professional Information

### Brief Bio
```yaml
brief_bio: "Brief 1-2 sentence summary of the founder's key contribution or unique positioning. Keep under 120 characters for card display."
```

This appears in:
- Founder cards on listing pages
- Related founder sections
- Search result snippets

### Achievements Array
```yaml
achievements:
  - "Built Brazil's largest organic tea operation"
  - "Exported to 15+ countries within 5 years"
  - "Pioneered sustainable packaging in beverage sector"
```

Highlight measurable accomplishments and industry firsts.

### Social Media
```yaml
social:
  instagram: username     # Username only, not full URL
  linkedin: username      # LinkedIn profile username
  telegram: username      # Telegram handle
  twitter: username       # Twitter handle  
  wechat: username        # WeChat ID
```

**Note**: Only include platforms actively used for professional purposes.

## Image Processing

After creating a founder profile, process images with:

```bash
./_scripts/process_images.sh founders [founder-slug]
```

This generates:
- Multiple responsive sizes (400w, 800w, 1200w)
- Optimized file compression
- Proper aspect ratios for different use cases

Add image attributions:
```bash
./_scripts/add_image_attribution.py founders [founder-slug]
```

## Multilingual Implementation

### Creating Language Versions
1. Copy English version to language-specific folders:
   ```
   _founders/ru/[founder-slug].md
   _founders/zh/[founder-slug].md
   ```

2. Update `lang` and `permalink` fields:
   ```yaml
   lang: ru
   permalink: /ru/founders/[founder-slug]/
   ```

3. Translate content while keeping front matter structure identical

### Translation Guidelines
- **Maintain personal tone** across languages
- **Preserve specific achievements** and metrics
- **Adapt cultural references** for target audience
- **Keep professional terminology** consistent

## Cross-Border Tracking

### International Experience
```yaml
cross_border_expertise: true
markets: [br, us, de, jp]     # Countries where they operate
languages: [pt, en, de]       # Languages they speak fluently
```

This information helps identify founders with:
- Multi-market experience
- Language capabilities for international expansion
- Cross-cultural business understanding

### Export Readiness Indicators
Founders with `cross_border_expertise: true` automatically appear in:
- Export-ready brand discovery
- International partnership opportunities
- Cross-market insights and case studies

## Quality Assurance

### Pre-Publishing Checklist
- [ ] Replace all `xx-` placeholders with actual values
- [ ] Verify associated brand slugs exist in `_brands/` folders
- [ ] Confirm country codes use ISO 3166-1 alpha-2 format
- [ ] Ensure language codes use ISO 639-1 format
- [ ] Test that all required images are processed and optimized
- [ ] Validate front matter YAML syntax
- [ ] Check that permalink follows correct pattern
- [ ] Verify content meets length guidelines (1000-1500 words)
- [ ] Proofread for grammar and personal tone
- [ ] Test page generation locally

### Validation Commands
```bash
# Check YAML syntax
./_scripts/validate_yaml.sh

# Verify multilingual consistency  
./_scripts/check_language_consistency.sh

# Test local generation
bundle exec jekyll serve
```

## Advanced Features

### Custom Sections
Override default sections for unique founder needs:

```yaml
sections:
  - breadcrumbs
  - hero
  - content
  - custom-section-name
  - associated-brands
```

Ensure corresponding include exists at:
`_includes/pages/founder/custom-section-name.html`

### Additional Professional Data
Add custom fields for specific founder requirements:

```yaml
board_positions:
  - "Industry Association Board Member"
  - "Export Council Advisor"
  
speaking_engagements:
  - event: "Global Food Summit 2024"
    role: "Keynote Speaker"
  - event: "BRICS Trade Conference"
    role: "Panel Discussant"

certifications:
  - "Certified Organic Inspector"
  - "ISO 9001 Lead Auditor"
```

### Quote Integration
Add meaningful quotes throughout the content:

```markdown
> "Building a brand is not just about products—it's about creating trust across cultures and borders." - {{ page.name }}
```

Use quotes to:
- Highlight personal philosophy
- Emphasize key insights
- Add authenticity to the narrative

## Integration Points

### Brand Profiles
- Founder `brands` array must match existing brand profile `ref` values
- Brand profiles automatically link to associated founder
- Ensures bidirectional relationships between content

### Insights Articles
- Founder profiles feed into "Founder's Journey" insight articles
- Cross-referencing maintains content consistency
- Personal stories enhance brand narratives

### Discovery & Search
- All founder data feeds into site-wide search functionality
- Geographic and expertise filtering uses founder metadata
- International experience tracking supports export-focused discovery

## Content Quality Standards

### Personal Storytelling
- **Authentic voice** that reflects founder's personality
- **Specific anecdotes** that illustrate character and values
- **Cultural sensitivity** for international audiences
- **Professional achievements** balanced with personal insights

### Business Focus
- **Quantifiable results** and concrete accomplishments
- **Industry impact** and thought leadership
- **Innovation examples** and competitive advantages
- **Future vision** that inspires confidence

### SEO Optimization
- **Natural keyword integration** with founder name and industry terms
- **Location-based keywords** for geographic discovery
- **Industry expertise keywords** for skill-based searches
- **Achievement-focused headings** that improve scannability

---

*This template follows the "logic-light" architecture and linear layout system established for the Brandmine site. All founder profiles use semantic sectioning without sidebar complexity for MVP simplicity and scalability.*