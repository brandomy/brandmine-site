# Founder Profile Creation Tutorial

**Complete guide to creating rich founder profiles in the Brandmine system**

---

## 🎯 Overview

Founder profiles showcase the visionaries behind BRICS+ brands, emphasizing their personal journeys, expertise, and cross-border capabilities. The system uses a sophisticated architecture with bidirectional brand relationships and comprehensive validation.

### Architecture Highlights
- **Bidirectional brand relationships** with cross-validation
- **Generation-based categorization** (1st, 2nd, 3rd Gen, Transition)
- **Cross-border expertise tracking** for international expansion
- **Multilingual support** across EN/RU/ZH
- **Expertise cloud visualization** with skill tagging
- **Social media integration** for professional networking

---

## 🏗️ Founder Profile Architecture

### Data Sources
Founder profiles use a hybrid data system:
1. **YAML collections** - Rich markdown content with full section support
2. **JSON index** - Generated search data for performance
3. **Cross-references** - Bidirectional links with brand profiles

### Page Structure
```
Layout: founder-profile.html → helpers/page-sections.html → pages/founder/[section].html
```

### Available Sections
- `breadcrumbs` - Navigation context
- `hero` - Founder name, position, location, generation badge
- `content` - Rich markdown content area (founder story)
- `professional-details` - Languages, markets, achievements, expertise
- `associated-brands` - Connected brands with full information
- `expertise-cloud` - Skills visualization
- `related-insights` - Connected articles and content
- `connections` - Related founders and cross-references

---

## 📝 Step-by-Step Tutorial: Creating "Russian Tea Master Alexei Sokolov"

### Step 1: Generate Template Files

```bash
# Use the article template generator for founders
python3 _scripts/content-creation/generate_article_template.py founder ru-alexei-sokolov

# This creates basic template files in all three languages
```

### Step 2: Configure Founder Front Matter

Edit each language file with this comprehensive structure:

**File: `_founders/en/ru-alexei-sokolov.md`**
```yaml
---
layout: founder-profile
ref: ru-alexei-sokolov
name: "Alexei Sokolov"
position: "CEO & Tea Master"
brief_bio: "Third-generation tea artisan revolutionizing Russian tea culture through traditional blending techniques and modern sustainability practices"
lang: en
permalink: /en/founders/ru-alexei-sokolov/

# Section control
sections:
  - breadcrumbs
  - hero
  - content
  - professional-details
  - associated-brands
  - expertise-cloud
  - related-insights
  - connections

# Brand relationships (bidirectional)
brands: ["ru-teatime", "ru-herbal-harmony"]

# Founder characteristics
generation: "third"  # first, second, third, transition
founder_led: true
cross_border_expertise: true

# Location information
location:
  country: "ru"
  city: "Moscow"
  region: "Moscow Oblast"
  coordinates: [37.6173, 55.7558]

# Professional expertise (max 4 for optimal display)
expertise: ["tea-blending", "sustainable-sourcing", "export-management", "cultural-preservation"]

# Achievements and recognition
achievements:
  - "World Tea Championship Gold Medal (2022)"
  - "Russian Export Excellence Award (2021)"
  - "Sustainable Business Leader of the Year (2020)"

# Languages spoken
languages: ["ru", "en", "zh", "ja"]

# Markets operated in
markets: ["russia", "china", "japan", "germany"]

# Personal details
age: 42
education: "Moscow State University - Agricultural Sciences"
years_experience: 18

# Contact information
contact:
  email: "alexei@teatime.ru"
  phone: "+7 495 123-4567"

# Social media presence
social:
  linkedin: "alexei-sokolov-tea"
  instagram: "@temaster_alexei"
  facebook: "alexei.sokolov.teamaster"

# Professional history
career_highlights:
  - position: "Tea Master"
    company: "Family Tea Estate"
    years: "2005-2015"
    description: "Learned traditional blending techniques from grandfather"
  - position: "Export Manager"
    company: "Russian Tea Collective"
    years: "2015-2018"
    description: "Developed Asian market expansion strategy"
  - position: "CEO & Founder"
    company: "TeaTime"
    years: "2018-Present"
    description: "Founded premium Russian tea brand"

# Investment and funding
investments:
  - type: "Family Investment"
    amount: 150000
    year: 2018
  - type: "Angel Round"
    amount: 500000
    year: 2020

# Mentorship and advisory
mentoring:
  - "Young Entrepreneurs Tea Academy"
  - "BRICS+ Startup Accelerator"

advisory_roles:
  - company: "Sustainable Agriculture Initiative"
    role: "Agricultural Advisor"
  - company: "Russia-China Trade Council"
    role: "Tea Industry Representative"

# Media coverage
press_mentions:
  - publication: "Forbes Russia"
    title: "The New Generation of Russian Tea Masters"
    year: 2022
  - publication: "Tea & Coffee Trade Journal"
    title: "Export Success from Moscow to Beijing"
    year: 2021

# Images (semantic structure)
images:
  portrait:
    name: "portrait"  # 2:3 aspect ratio for featured display
    ext: "jpg"
  headshot:
    name: "headshot"  # 1:1 aspect ratio for card display
    ext: "jpg"

# Recognition and certifications
certifications:
  - name: "Certified Tea Master"
    organization: "International Tea Institute"
    year: 2019
  - name: "Sustainable Agriculture Certification"
    organization: "Global Sustainability Council"
    year: 2020

# Featured status
featured: true
---

# Alexei Sokolov: Bridging Tradition and Innovation in Russian Tea Culture

Born into a family where tea was more than a beverage—it was a way of life—Alexei Sokolov represents the third generation of tea artisans who have dedicated their lives to preserving and evolving Russian tea traditions.

## A Legacy Rooted in Tradition

Alexei's journey began at age seven in his grandfather's tea workshop, where he learned that every blend tells a story. His grandfather, Viktor Sokolov, had established the family tea estate in 1952, developing unique blending techniques that combined traditional Russian preferences with influences from across the Silk Road.

"Tea is not just about flavor," Alexei explains. "It's about creating moments of connection—between cultures, between generations, between people who share a cup together."

## The Modern Tea Master

After completing his studies in Agricultural Sciences at Moscow State University, Alexei spent a decade working within the family business, learning every aspect of tea cultivation, processing, and blending. His international perspective was shaped by extensive travels across China, Japan, and India, where he studied traditional tea production methods.

## Building Bridges Across Borders

In 2018, Alexei founded TeaTime with a clear mission: to introduce the world to authentic Russian tea culture while respecting the traditions of tea-producing regions worldwide. His cross-border expertise has been instrumental in establishing partnerships with tea gardens across Asia and distribution networks throughout Europe.

### Key Achievements

- **International Recognition**: Gold Medal at the World Tea Championship (2022)
- **Export Success**: Built distribution in 15 countries across Asia and Europe
- **Sustainability Leadership**: Implemented carbon-neutral tea processing
- **Cultural Preservation**: Established Tea Culture Museum in Moscow

## Philosophy and Vision

Alexei believes that tea masters have a responsibility to preserve traditional knowledge while embracing innovation that benefits both producers and consumers. His approach combines:

- **Traditional Blending**: Hand-crafted recipes passed down through generations
- **Sustainable Sourcing**: Direct trade relationships with tea gardens
- **Cultural Exchange**: Educational programs connecting Russian and Asian tea traditions
- **Modern Marketing**: Digital platforms to reach global audiences

## The Next Generation

As a mentor to young entrepreneurs through the Young Entrepreneurs Tea Academy, Alexei is passionate about passing on not just technical knowledge, but the cultural values that make tea a bridge between communities.

"Every cup of tea we create should honor the farmers who grew it, the traditions that shaped it, and the people who will share it," Alexei reflects. "That's how we build lasting business relationships that transcend borders."
```

**File: `_founders/ru/ru-alexei-sokolov.md`**
```yaml
---
layout: founder-profile
ref: ru-alexei-sokolov
name: "Алексей Соколов"
position: "Генеральный директор и чайный мастер"
brief_bio: "Чайный мастер в третьем поколении, революционизирующий российскую чайную культуру через традиционные техники купажа и современные практики устойчивого развития"
lang: ru
permalink: /ru/founders/ru-alexei-sokolov/

# [Same structure as EN with Russian translations]
brands: ["ru-teatime", "ru-herbal-harmony"]
generation: "third"
founder_led: true
cross_border_expertise: true

location:
  country: "ru"
  city: "Москва"
  region: "Московская область"
  coordinates: [37.6173, 55.7558]

expertise: ["tea-blending", "sustainable-sourcing", "export-management", "cultural-preservation"]

achievements:
  - "Золотая медаль Чемпионата мира по чаю (2022)"
  - "Премия за экспортное превосходство России (2021)"
  - "Лидер устойчивого бизнеса года (2020)"

languages: ["ru", "en", "zh", "ja"]
markets: ["russia", "china", "japan", "germany"]

# [Rest of fields with Russian content]
---

# Алексей Соколов: Мост между традициями и инновациями в российской чайной культуре

[Russian content translation...]
```

**File: `_founders/zh/ru-alexei-sokolov.md`**
```yaml
---
layout: founder-profile
ref: ru-alexei-sokolov
name: "阿列克谢·索科洛夫"
position: "首席执行官兼茶艺大师"
brief_bio: "第三代茶艺师，通过传统调配技术和现代可持续发展实践革新俄罗斯茶文化"
lang: zh
permalink: /zh/founders/ru-alexei-sokolov/

# [Same structure with Chinese translations]
brands: ["ru-teatime", "ru-herbal-harmony"]
generation: "third"
founder_led: true
cross_border_expertise: true

location:
  country: "ru"
  city: "莫斯科"
  region: "莫斯科州"
  coordinates: [37.6173, 55.7558]

expertise: ["tea-blending", "sustainable-sourcing", "export-management", "cultural-preservation"]

achievements:
  - "世界茶叶锦标赛金牌（2022年）"
  - "俄罗斯出口卓越奖（2021年）"
  - "年度可持续发展商业领袖（2020年）"

languages: ["ru", "en", "zh", "ja"]
markets: ["russia", "china", "japan", "germany"]

# [Rest of fields with Chinese content]
---

# 阿列克谢·索科洛夫：俄罗斯茶文化传统与创新的桥梁

[Chinese content translation...]
```

### Step 3: Set Up Image Structure

Create image directories:
```bash
mkdir -p assets/images/founders/ru-alexei-sokolov/originals/
```

Add source images following Brandmine standards:
- `portrait.jpg` - 2:3 aspect ratio (800×1200px), JPG for featured displays
- `headshot.jpg` - 1:1 aspect ratio (800×800px), JPG for card displays

### Step 4: Process Images

```bash
# Process all founder images with responsive versions
_scripts/core/process_images.sh founders ru-alexei-sokolov
```

This generates:
- `portrait-400w.jpg`, `portrait-800w.jpg`, `portrait-1200w.jpg`
- `headshot-400w.jpg`, `headshot-800w.jpg`, `headshot-1200w.jpg`

### Step 5: Update Data Indexes

```bash
# Generate updated founders JSON index with validation
python3 _scripts/data-generation/generate-founders-json.py --verbose --validate
```

This updates `_data/founders.json` and validates brand cross-references.

### Step 6: Link to Brand Profiles

Ensure the brands referenced in the founder's `brands` array also reference this founder:

**In `_brands/en/ru-teatime.md`:**
```yaml
founder:
  name: "Alexei Sokolov"
  ref: "ru-alexei-sokolov"  # Links to founder profile
  position: "CEO & Tea Master"
  story: "Third-generation tea master"
  generation: "3rd Generation"
  founder_led: true
```

---

## 🎛️ Section Control Guide

### Core Sections (Always Include)
- `breadcrumbs` - Navigation context
- `hero` - Founder name, position, generation badge, location
- `content` - Main markdown story content

### Professional Sections
- `professional-details` - Languages, markets, achievements, expertise
- `associated-brands` - Connected brands with full information
- `expertise-cloud` - Skills visualization (max 4 skills)

### Relationship Sections
- `related-insights` - Connected articles and content
- `connections` - Related founders and cross-references

### Section Order Best Practices
```yaml
sections:
  - breadcrumbs           # Always first
  - hero                 # Founder identity
  - content              # Personal story
  - professional-details # Skills and experience
  - associated-brands    # Brand connections
  - expertise-cloud      # Skills visualization
  - related-insights     # Connected content
  - connections          # Related founders
```

---

## 📋 Required Front Matter Fields

### Essential Fields
```yaml
layout: founder-profile   # Required: layout type
ref: ru-firstname-lastname # Required: global founder ID
name: "Full Name"         # Required: display name
position: "Title"         # Required: professional role
brief_bio: "1-2 sentence summary" # Required: card description
lang: en                  # Required: language code
permalink: /en/founders/ru-firstname-lastname/ # Required: full URL

# Core relationships
brands: ["brand-slug"]    # Required: at least one brand
generation: "third"       # Required: first, second, third, transition

# Location (required)
location:
  country: "ru"          # Required: ISO country code
  city: "City Name"      # Required: city
  region: "State/Province" # Optional: region
  coordinates: [lng, lat] # Optional: mapping
```

### Enhancement Fields
```yaml
# Professional characteristics
founder_led: true
cross_border_expertise: true
expertise: ["skill1", "skill2", "skill3", "skill4"]  # Max 4
achievements: ["achievement1", "achievement2"]
languages: ["ru", "en", "zh"]
markets: ["russia", "china", "germany"]

# Personal details
age: 42
education: "University - Degree"
years_experience: 18

# Contact information
contact:
  email: "founder@brand.com"
  phone: "+7 495 123-4567"

# Social media
social:
  linkedin: "username"
  instagram: "@username"
  facebook: "username"

# Images
images:
  portrait:
    name: "portrait"
    ext: "jpg"
  headshot:
    name: "headshot"
    ext: "jpg"

# Recognition
certifications:
  - name: "Certification Name"
    organization: "Certifying Body"
    year: 2020

# Featured status
featured: true
```

---

## 🔗 Founder-Brand Relationship System

### Bidirectional References

**Founders reference brands:**
```yaml
# In founder file
brands: ["ru-teatime", "ru-herbal-harmony"]
```

**Brands reference founders:**
```yaml
# In brand file
founder:
  name: "Alexei Sokolov"
  ref: "ru-alexei-sokolov"
  position: "CEO & Tea Master"
  story: "Brief founder story"
  generation: "3rd Generation"
  founder_led: true
```

### Cross-Validation

The system automatically validates:
- All founder-referenced brands exist
- All brand-referenced founders exist
- Referential integrity across languages
- Orphaned founders (not referenced by any brand)

### Data Display

**On Founder Pages:**
- `associated-brands` section shows full brand information
- Brand cards with logos, descriptions, taxonomy
- Links to full brand profiles

**On Brand Pages:**
- `founder-narrative` section shows founder information
- Founder portrait with generation badge
- Links to full founder profile

---

## 🏷️ Generation System

### Generation Categories
- **`first`** - First-generation entrepreneurs (startup founders)
- **`second`** - Second-generation (inherited and evolved business)
- **`third`** - Third-generation+ (deep family legacy)
- **`transition`** - Transitional leadership (non-family executives)

### Generation Badges
Automatically displayed in hero sections and cards:
- **1st Gen** - Innovation and startup energy
- **2nd Gen** - Evolution and expansion
- **3rd Gen** - Legacy and tradition
- **Transition** - Professional leadership

### Business Context
- Helps investors understand management continuity
- Provides cultural context for brand stories
- Indicates family vs. professional business models
- Supports BRICS+ narrative about generational entrepreneurship

---

## 🖼️ Image Standards & Processing

### Image Types & Specifications

**Portrait Images (Featured Display)**
- **Aspect ratio**: 2:3 vertical
- **Source size**: 800×1200px minimum
- **Format**: JPG
- **Style**: Natural photography with teal filter
- **Naming**: `portrait.jpg`
- **Usage**: Hero sections, featured founder cards

**Headshot Images (Card Display)**
- **Aspect ratio**: 1:1 square
- **Source size**: 800×800px minimum
- **Format**: JPG
- **Style**: Professional headshot with teal filter
- **Naming**: `headshot.jpg`
- **Usage**: Founder cards, grid displays

### Image Processing Workflow

1. **Place originals** in `assets/images/founders/[founder-ref]/originals/`
2. **Run processing script**: `_scripts/core/process_images.sh founders [founder-ref]`
3. **Verify outputs** with responsive versions (400w, 800w, 1200w)

### Visual Style Guidelines

- **Natural Photography + Teal Filter**: Professional, approachable founder portraits
- **Consistent lighting**: Well-lit, professional photography standards
- **Clean backgrounds**: Minimal distractions, focus on founder

---

## 🌐 Multilingual Implementation

### Language File Structure
```
_founders/
├── en/ru-alexei-sokolov.md
├── ru/ru-alexei-sokolov.md
└── zh/ru-alexei-sokolov.md
```

### Translation Requirements
- **Identical structure** across all languages
- **Same `ref` field** for language linking
- **Localized content** (name, position, bio, story)
- **Consistent permalinks** with language prefixes
- **Same brand references** (brand slugs don't translate)

### Language Switching
- Uses `ref` field to link language versions
- Automatic language detection in navigation
- Fallback support for missing translations

---

## 🎯 Expertise & Skills System

### Expertise Cloud
Display up to 4 skills for optimal visual presentation:
```yaml
expertise: ["tea-blending", "sustainable-sourcing", "export-management", "cultural-preservation"]
```

### Skill Categories
- **Technical Skills**: Product-specific expertise
- **Business Skills**: Management and operations
- **Market Skills**: Geographic and cultural knowledge
- **Leadership Skills**: Team and organizational development

### Cross-Border Expertise
```yaml
cross_border_expertise: true
```
Highlights founders with international expansion experience, valuable for:
- Export-ready brands seeking guidance
- Investors looking for scalable leadership
- Strategic partnerships across BRICS+ markets

---

## 🧪 Testing & Validation

### Build and Test
```bash
# Start development server
bundle exec jekyll serve --livereload

# Test URLs
# EN: http://localhost:4000/en/founders/ru-alexei-sokolov/
# RU: http://localhost:4000/ru/founders/ru-alexei-sokolov/
# ZH: http://localhost:4000/zh/founders/ru-alexei-sokolov/
```

### Validation Checks
```bash
# Validate YAML syntax
_scripts/validation/validate_yaml.sh

# Check language consistency
_scripts/validation/language_consistency_checker.py

# Validate founder-brand cross-references
python3 _scripts/data-generation/generate-founders-json.py --validate

# Run full validation suite
_scripts/core/pre-commit_check.sh
```

### Quality Checklist
- [ ] All three language files created with identical structure
- [ ] Front matter validates successfully
- [ ] Brand cross-references exist and validate
- [ ] Images processed and responsive
- [ ] Generation category is valid
- [ ] Expertise limited to 4 skills
- [ ] Content renders correctly in all sections
- [ ] Founder appears in search index
- [ ] Associated brands link correctly

---

## 🚀 Advanced Features

### Career Timeline
```yaml
career_highlights:
  - position: "Tea Master"
    company: "Family Tea Estate"
    years: "2005-2015"
    description: "Learned traditional blending techniques"
  - position: "CEO & Founder"
    company: "TeaTime"
    years: "2018-Present"
    description: "Founded premium Russian tea brand"
```

### Investment History
```yaml
investments:
  - type: "Family Investment"
    amount: 150000
    year: 2018
  - type: "Angel Round"
    amount: 500000
    year: 2020
```

### Mentorship & Advisory
```yaml
mentoring:
  - "Young Entrepreneurs Tea Academy"
  - "BRICS+ Startup Accelerator"

advisory_roles:
  - company: "Sustainable Agriculture Initiative"
    role: "Agricultural Advisor"
```

### Media Coverage
```yaml
press_mentions:
  - publication: "Forbes Russia"
    title: "The New Generation of Russian Tea Masters"
    year: 2022
```

---

## 📋 Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| Founder not showing on brand page | Check brand file has correct founder ref |
| Brand not showing on founder page | Check brands array in founder front matter |
| Cross-reference validation errors | Run founders JSON generation with --validate |
| Images not displaying | Check file paths and run image processing |
| Generation badge not showing | Verify generation field uses valid values |
| Expertise cloud missing | Ensure max 4 skills in expertise array |

### Debug Commands
```bash
# Check founder-brand relationships
python3 _scripts/data-generation/generate-founders-json.py --validate --verbose

# Verify file structure
find _founders/ -name "*.md" | head -10

# Test image paths
ls assets/images/founders/ru-alexei-sokolov/

# Check generation values
grep -r "generation:" _founders/en/ | head -5
```

---

## 📚 Reference Files

### Key Templates
- **Founder template**: `_templates/founders/founder_profile.md`
- **Layout**: `_layouts/founder-profile.html`
- **Sections**: `_includes/pages/founder/[section].html`

### Component Files
- **Founder cards**: `_includes/components/cards/founder-card.html`
- **Featured cards**: `_includes/components/cards/featured-founder-card.html`
- **Founder info**: `_includes/components/founders/founder-info.html`

### Scripts
- **Template generator**: `_scripts/content-creation/generate_article_template.py`
- **Image processing**: `_scripts/core/process_images.sh`
- **JSON generation**: `_scripts/data-generation/generate-founders-json.py`

This comprehensive tutorial provides everything needed to create professional founder profiles that showcase BRICS+ entrepreneurial leadership while maintaining referential integrity with brand profiles and ensuring consistency across languages.