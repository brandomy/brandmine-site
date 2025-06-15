# Brandmine Naming Fixes Implementation Plan

**Date:** June 15, 2025  
**Priority:** HIGH - Visual brand consistency compromised  
**Impact:** Category-specific styling broken across all insight content

---

## 🚨 Critical Issue Summary

**Problem:** CSS class generation creates `insight-card--brand_spotlight` but CSS expects `insight-card--brand-spotlight`

**Result:** Complete failure of category-specific styling for insight cards

**Affected Components:**
- Tagged insight cards
- Standard insight cards  
- Featured insight cards
- Any component using dynamic category classes

---

## 🎯 Fix Implementation Strategy

### Option A: Template Transformation Fix (IMMEDIATE)
**⏱️ Timeline:** 15 minutes  
**💼 Risk:** Low  
**🔄 Reversible:** Yes

**What:** Add Liquid transformation to convert underscores to hyphens in CSS class generation

**Pros:**
- Immediate visual fix
- No content changes needed
- Zero risk to existing functionality
- Easily reversible

**Cons:**
- Doesn't fix root inconsistency
- Adds transformation logic to templates

### Option B: Content Standardization (RECOMMENDED LONG-TERM)
**⏱️ Timeline:** 2-3 hours  
**💼 Risk:** Medium  
**🔄 Reversible:** Yes (with effort)

**What:** Update content category values to use kebab-case, matching CSS expectations

**Pros:**
- Fixes root cause
- Eliminates need for transformations
- Aligns with web standards
- Future-proof

**Cons:**
- Requires content file updates
- May need translation key updates
- More testing required

---

## 🔧 Implementation Plan

### Phase 1: IMMEDIATE FIX (Template Transformations)

**Goal:** Restore visual functionality immediately

#### Step 1.1: Fix Dynamic Class Generation (5 minutes)

**File:** `_includes/components/cards/tagged-insight-card.html`
```liquid
<!-- Line 33: BEFORE -->
<article class="insight-card insight-card--{{ include.insight.category }} insight-card--tagged">

<!-- Line 33: AFTER -->
<article class="insight-card insight-card--{{ include.insight.category | replace: '_', '-' }} insight-card--tagged">
```

**File:** `_includes/components/cards/insight-card.html`
```liquid
<!-- Line 36: BEFORE -->
<article class="insight-card insight-card--{{ include.insight.category | default: 'default' }}">

<!-- Line 36: AFTER -->
<article class="insight-card insight-card--{{ include.insight.category | replace: '_', '-' | default: 'default' }}">
```

**File:** `_includes/components/cards/featured-insight-card.html`
```liquid
<!-- Line 42: BEFORE -->
<article class="featured-insight-card featured-insight-card--{{ include.insight.category }}">

<!-- Line 42: AFTER -->
<article class="featured-insight-card featured-insight-card--{{ include.insight.category | replace: '_', '-' }}">
```

#### Step 1.2: Test Visual Fix (5 minutes)

```bash
# Serve the site locally
bundle exec jekyll serve --livereload

# Check these pages for proper styling:
# http://localhost:4000/en/
# http://localhost:4000/en/insights/
# Verify category-specific border colors and badges are working
```

#### Step 1.3: Validate All Card Types (5 minutes)

**Test each insight category:**
- Brand Spotlight insights → Orange borders/badges
- Founder's Journey insights → Purple borders/badges  
- Market Momentum insights → Green borders/badges
- Location Intelligence insights → Blue borders/badges

---

### Phase 2: CONTENT STANDARDIZATION (Long-term)

**Goal:** Eliminate root cause and remove transformation logic

#### Step 2.1: Update Content Category Values (30 minutes)

**Files to update:**
- `_insights/en/market-momentum-russia-spirits.md`
- `_insights/en/brand-spotlight-golden-ring-vodka.md`
- `_insights/en/founders-journey-alexei-petrov.md`  
- `_insights/en/location-intelligence-moscow-premium.md`

**Changes:**
```yaml
# BEFORE
category: "brand_spotlight"
category: "founders_journey"
category: "market_momentum"
category: "location_intelligence"

# AFTER  
category: "brand-spotlight"
category: "founders-journey"
category: "market-momentum"
category: "location-intelligence"
```

#### Step 2.2: Update Translation Keys (15 minutes)

**File:** `_data/translations/en.yml`
```yaml
# BEFORE
insights:
  categories:
    brand_spotlight: "Brand Spotlight"
    founders_journey: "Founder's Journey"
    market_momentum: "Market Momentum"
    location_intelligence: "Location Intelligence"

# AFTER
insights:
  categories:
    brand-spotlight: "Brand Spotlight"
    founders-journey: "Founder's Journey"  
    market-momentum: "Market Momentum"
    location-intelligence: "Location Intelligence"
```

**Files:** `_data/translations/ru.yml`, `_data/translations/zh.yml`
```yaml
# Apply same changes to Russian and Chinese translation files
```

#### Step 2.3: Remove Template Transformations (10 minutes)

**After content is updated, revert templates to clean state:**

```liquid
<!-- CLEAN VERSION (after content update) -->
<article class="insight-card insight-card--{{ include.insight.category }} insight-card--tagged">
```

#### Step 2.4: Update Icon and Image References (15 minutes)

**Check for any icon/image file references that use category:**
```bash
# Search for category-based file references
grep -r "category" _includes/ | grep -E "\.(svg|jpg|png)"
```

**Update any found references to use kebab-case filenames:**
```liquid
<!-- If found -->
<img src="/assets/images/icons/{{ include.insight.category | replace: '_', '-' }}.svg">
```

#### Step 2.5: Comprehensive Testing (30 minutes)

```bash
# Full build test
JEKYLL_ENV=production bundle exec jekyll build

# Test all language versions
# http://localhost:4000/en/insights/
# http://localhost:4000/ru/insights/  
# http://localhost:4000/zh/insights/

# Test each insight category page
# Test search functionality
# Test filtering if implemented
```

---

### Phase 3: PREVENTION (Future-proofing)

#### Step 3.1: Add Validation (Optional)

**Create validation script:**
```bash
# _scripts/validation/naming-consistency-check.sh
#!/bin/bash

echo "Checking insight category naming consistency..."

# Check for underscores in category values
if grep -r 'category:.*_' _insights/; then
    echo "❌ Found underscores in insight categories"
    exit 1
else
    echo "✅ All insight categories use kebab-case"
fi
```

#### Step 3.2: Update Documentation

**Add to CLAUDE.md:**
```markdown
## Insight Category Naming
- Use kebab-case: brand-spotlight, founders-journey, market-momentum, location-intelligence
- Categories become CSS classes, so hyphens are required
- Translation keys should match category values exactly
```

---

## 🧪 Testing Strategy

### Visual Testing Checklist

**Before Fix:**
- [ ] Category borders missing/wrong colors
- [ ] Category badges unstyled  
- [ ] Visual hierarchy broken

**After Template Fix:**
- [ ] Brand Spotlight → Orange borders/badges
- [ ] Founder's Journey → Purple borders/badges
- [ ] Market Momentum → Green borders/badges  
- [ ] Location Intelligence → Blue borders/badges

**After Content Fix:**
- [ ] All styling works without transformations
- [ ] Translation lookups work correctly
- [ ] URLs generate correctly
- [ ] Search/filtering works (if implemented)

### Technical Testing

```bash
# Test build performance
time JEKYLL_ENV=production bundle exec jekyll build

# Test all language builds
bundle exec jekyll serve --livereload

# Validate HTML output
# Check generated CSS classes in browser dev tools
```

---

## 📊 Risk Assessment

### Phase 1 (Template Fix) - LOW RISK
**✅ Safe operations:**
- Only adds Liquid filter
- No content changes
- Easily reversible
- Immediate visual improvement

**⚠️ Considerations:**
- Adds transformation logic to templates
- Temporary fix approach

### Phase 2 (Content Fix) - MEDIUM RISK  
**✅ Benefits:**
- Fixes root cause permanently
- Aligns with web standards
- Removes template complexity

**⚠️ Risks:**
- Content file changes needed
- Translation key updates required
- More extensive testing needed
- Potential for missed references

**🛡️ Mitigation:**
- Make changes incrementally
- Test after each change
- Keep backup of original files
- Use search to find all references

---

## ⏱️ Timeline Summary

| Phase | Task | Duration | Risk |
|-------|------|----------|------|
| **Phase 1** | Template transformations | 15 min | Low |
| **Phase 1** | Visual testing | 10 min | Low |
| **Phase 2** | Content updates | 30 min | Medium |
| **Phase 2** | Translation updates | 15 min | Medium |
| **Phase 2** | Template cleanup | 10 min | Low |
| **Phase 2** | Full testing | 30 min | Medium |
| **Phase 3** | Validation setup | 20 min | Low |

**Total for immediate fix:** 25 minutes  
**Total for complete fix:** 2 hours

---

## 🎯 Success Criteria

### ✅ Immediate Success (Phase 1)
- [ ] All insight cards show category-specific colors
- [ ] Brand consistency restored across site
- [ ] No visual regressions introduced

### ✅ Long-term Success (Phase 2)  
- [ ] Content uses standard kebab-case categories
- [ ] No transformation logic in templates
- [ ] Translation system works seamlessly
- [ ] All language versions functional

### ✅ Future-proof (Phase 3)
- [ ] Clear documentation for new content
- [ ] Validation prevents future inconsistencies  
- [ ] Developer guidelines established

---

## 🚀 Recommended Execution

1. **Start with Phase 1** for immediate visual fix
2. **Validate fix works** across all content
3. **Plan Phase 2** for next development cycle
4. **Implement Phase 3** for long-term maintenance

**Priority:** Execute Phase 1 immediately to restore brand visual consistency.