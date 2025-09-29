# CLAUDE.md

Master project guide for Claude Code collaboration on Brandmine.

---

# 🧭 Strategic Overview

**Brandmine** is building the **first comprehensive consumer brand database** - a blue ocean strategy capturing Russia's major geopolitical pivot from West to East.

**Blue Ocean Opportunity**: Everyone has investor databases (PitchBook, Tracxn, Crunchbase), NO ONE has systematic consumer brand intelligence.

**Geopolitical Timing**: Russia beginning major social pivot from West to East (accelerating, not reversible) - creating urgent demand for Eastern/Global South brand connections.

---

# 🎯 Mission & Business Model

## Our Founder Advantage
**20 years China experience + 15 years operating world-class brand in Shanghai**
= Unique founder-to-founder credibility + East-West bridge experience + geopolitical timing understanding

## Mission
To illuminate and elevate exceptional founder-led brands from the Global South, breaking through language, cultural, and political barriers to proactively connect them with the people, partners, and capital they need to grow beyond their borders.

## Target Markets (3 Primary Audiences)
1. **Brand Founders**: Seeking international growth (focus: Russian brands pivoting East)
2. **Brand Investors**: Looking for Global South investment opportunities
3. **Business Partners**: Companies seeking brands to import/franchise/partner with

## Geopolitical Context (Major Strategic Advantage)
- **Russia**: Major social pivot from West to East (huge ship changing course, accelerating)
- **Market Reality**: Russian brands actively seeking Eastern/Global South markets as Western channels close
- **Dual Markets**: Russia/China both product sources (brands) AND brand consumers
- **Information Barriers**: Vast opacity between East-East markets that we break through

---

# 🌏 Strategic Market Sequence

## Current Focus: Russian Brand Intelligence (Perfect Timing)
**Target**: Russian consumer brands seeking Eastern/Global South expansion (founder-led, <20 years)
**Context**: Major social pivot creating active demand for non-Western connections
**Advantage**: Cultural bridge + systematic data collection + geopolitical timing

## Geographic Strategy
1. **Malaysia**: Home base (ASEAN gateway to Global South)
2. **Russia**: Primary focus (geopolitical pivot + opacity advantage)
3. **China**: Natural bridge (Russia's primary Eastern destination + our 20-year foundation)

## Sector Focus (Initial)
Wine, jewelry, consumer goods sectors with cross-cultural appeal

---

# 🗂 Database Asset Strategy

**Building proprietary intelligence on:**
- Consumer brands navigating East-East expansion
- Founder backgrounds and Eastern market readiness
- Cross-cultural brand opportunities (Russia↔China, Russia↔Global South)
- Brand stories, metrics, and international growth potential

**Strategic Asset**: First comprehensive brand database capturing unprecedented geopolitical shift

**Competitive Moat**: Network effects as brand data compounds investor value + first-mover advantage in blue ocean

---

# 🏗️ Key Technical Structure

```
_brands/{lang}/           — Brand profiles (database foundation)
_founders/{lang}/         — Founder profiles (proprietary intelligence)
_dimensions/{lang}/{type}/ — Taxonomy (markets, sectors, attributes, signals)
_insights/{lang}/         — Strategic content for target audiences
_data/                    — Configuration and translations
```

**Architecture**: Jekyll 3.9.5, trilingual (EN/RU/ZH), GitHub Pages deployment

---

# 🎯 Critical Success Metrics (Blue Ocean Building)

## Current Phase Metrics
- Russian brand database growth during pivot period
- Quality of founder intelligence captured
- East-East connection facilitation effectiveness
- Information barrier breakthrough success
- First-mover advantage maintenance

## Platform Requirements
- **China-Friendly Architecture**: No Google services, self-hosted fonts, no blocked CDNs
- **Typography**: PT Sans/PT Serif (EN/RU), Noto Sans/Serif SC (ZH) - all self-hosted
- **Global Accessibility**: China/Russia technical reliability, emerging market optimization
- **Trilingual Excellence**: Native-quality EN/RU/ZH for East-East connections
- **Mobile-First Design**: Primary usage via phone/tablet by founders in China/Russia
- **Database Architecture**: Systematic brand intelligence collection and organization

---

# 🎨 Brand System (NEVER CHANGE)

## Core Colors
| **Primary** | Teal | `--primary-*` | `#38B2AC` |
| **Secondary** | Orange | `--secondary-*` | `#F97316` |
| **Accent** | Indigo | `--accent-*` | `#6366F1` |

## Dimension Colors (Fixed Taxonomy)
| **Sectors** | Olive Green | `--olive-*` | `#A3B763` |
| **Markets** | Sky Blue | `--sky-*` | `#0EA5E9` |
| **Attributes** | Orange | `--secondary-*` | `#F97316` |
| **Signals** | Indigo | `--accent-*` | `#6366F1` |

## Insight Category Colors (Aligned with Dimensions)
| **Brand Spotlight** | Orange | `--secondary-*` | `#F97316` |
| **Founder's Journey** | Indigo | `--accent-*` | `#6366F1` |
| **Location Intelligence** | Sky Blue | `--sky-*` | `#0EA5E9` |
| **Market Momentum** | Olive Green | `--olive-*` | `#A3B763` |

**Critical Rule**: Insight categories use SAME colors as dimension types for consistency.

---

# 💻 Essential Commands

```bash
# Development (Jekyll 3.9.5 - no --livereload)
bundle exec jekyll serve

# Production build
JEKYLL_ENV=production bundle exec jekyll build

# Validation
_scripts/core/pre-commit_check.sh

# Image processing
_scripts/core/process_images.sh [collection] [identifier]
```

---

# ⚠️ Critical Rules for Claude Code

## Claude Code Role & Authority
**Complete Technical Responsibility**: You own all technical decisions, implementation, and delivery
**Business Focus**: Russian founder engagement → brand database building → investor connections
**Decision Authority**: Choose optimal technical approaches for global accessibility and startup speed
**Process**: Confirm business needs → Build complete solutions → Iterate based on results
**Communication**: Ask business clarification questions, deliver working solutions with documentation

## NEVER DO
- Create new dimension types (only: markets, sectors, attributes, signals)
- Change brand colors or insight category colors (consistency = credibility = founder trust)
- Use max-width media queries (always min-width, mobile-first)
- Add Google services or external CDNs (China accessibility)
- Use non-self-hosted fonts or blocked dependencies

## ALWAYS DO
- Use Jekyll 3.9.5 compatible commands
- Mobile-first responsive design (China/Russia founders use phones/tablets primarily)
- BEM-compliant CSS for new development
- Maintain trilingual excellence (EN/RU/ZH)
- Ensure China/Russia accessibility (self-hosted everything)
- Focus on systematic brand data collection

## Architecture Principles
- **"Logic Light"**: Configuration over conditionals (`_data/page_sections.yml`)
- **Component Cards**: Specialized variants (brand-card, founder-card, insight-card)
- **China-Friendly Foundation**: Self-hosted fonts (PT Sans/Serif, Noto SC), no Google services, no external CDNs
- **Global Accessibility**: Optimized for China's Great Firewall + Russia's internet infrastructure
- **Mobile-First Foundation**: China/Russia founders primarily use phones/tablets - desktop secondary
- **Database Focus**: Every founder interaction builds proprietary intelligence

---

# 📚 Quick References

- **Complete Architecture**: @technical-standards.md
- **Navigation Hub**: @brandmine-guide.md  
- **Operational Workflows**: @_templates/tutorials/workflows/

---

**Strategic Context**: Capturing blue ocean opportunity (first brand database) + perfect geopolitical timing (Russia's East pivot) + unique cultural positioning (20-year China foundation) = unprecedented competitive advantage in Global South brand intelligence.
