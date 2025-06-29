# Universal Card Elimination Roadmap

## Current State Analysis

**Total Universal Card Usage:** 195 instances site-wide
- **Brands Pages:** 10 instances (5 files)
- **Founders Pages:** 16 instances (5 files)
- **Other Pages:** ~169 instances

## Migration Strategy

### Phase 1: Easy Wins - Test Files (Immediate)
**Timeline:** Immediate deletion
**Risk:** Zero - these are test files

#### Brands Test Files (6 instances)
```
DELETE: brand-carousel-test.html (2 instances)
DELETE: brand-grid-test.html (2 instances)
```

#### Founders Test Files (4 instances)
```
DELETE: featured-founders-backup.html (2 instances)
DELETE: recent-founders-backup.html (2 instances)
```

**Impact:** -10 universal card instances (5% reduction)

### Phase 2: Direct Replacements (1 week)
**Timeline:** 1 week
**Risk:** Low - straightforward replacements

#### Brands Pages (4 instances)
```
REPLACE IN: featured-brands-carousel-big.html
  FROM: universal-card type="brand" variant="featured"
  TO: brand-card-featured.html

REPLACE IN: featured-brands-carousel-small.html  
  FROM: universal-card type="brand" variant="featured"
  TO: brand-card-featured.html
```

#### Founders Pages (10 instances)
```
REPLACE IN: founders-carousel.html (8 instances)
  FROM: universal-card type="founder"
  TO: founder-card.html

REPLACE IN: featured-founders-simple.html
  FROM: universal-card type="founder" variant="featured"
  TO: founder-card-featured.html
```

**Impact:** -14 universal card instances (7% reduction)

### Phase 3: Grid Layout Updates (2 weeks)
**Timeline:** 2 weeks
**Risk:** Medium - need to verify grid layouts

```
REPLACE IN: featured-brands-grid.html
  FROM: universal-card type="brand" variant="featured"
  TO: brand-card.html (for grid context)

REPLACE IN: founders-grid.html
  FROM: universal-card type="founder"
  TO: founder-card.html
```

**Impact:** -4 universal card instances (2% reduction)

### Phase 4: Other Page Assessment (4 weeks)
**Timeline:** 4-6 weeks
**Risk:** High - need careful analysis

Remaining ~169 instances across:
- Insights pages
- Dimension pages
- Discovery pages
- Layout pages

**Strategy:**
1. Create insight-card.html if not exists
2. Create dimension-card.html if not exists
3. Systematically replace based on content type

## Success Metrics

### After Phase 1-3 (3 weeks)
- **Brands/Founders pages:** 0 universal card instances (100% elimination)
- **Total reduction:** 28 instances (14% of total)
- **Performance gain:** ~15% faster page loads on brands/founders pages

### Long-term Goal (3 months)
- **Universal card instances:** < 50 (75% reduction)
- **Card components:** 8-10 purpose-built cards
- **Maintenance burden:** 80% reduction

## Implementation Checklist

### Week 1
- [ ] Delete test/backup files
- [ ] Replace carousel universal cards with featured cards
- [ ] Test carousel functionality

### Week 2  
- [ ] Replace grid universal cards with standard cards
- [ ] Test grid layouts across breakpoints
- [ ] Update any associated JavaScript

### Week 3
- [ ] Performance testing
- [ ] Visual regression testing
- [ ] Documentation update

### Month 2-3
- [ ] Analyze remaining universal card usage
- [ ] Create missing specialized cards
- [ ] Systematic migration of remaining instances

## Risk Mitigation

1. **Before each deletion/replacement:**
   - Check for JavaScript dependencies
   - Verify CSS class usage
   - Test on mobile/tablet/desktop

2. **Rollback strategy:**
   - Git branch for each phase
   - Keep universal-card.html until 90% migrated
   - Document any custom configurations

3. **Testing requirements:**
   - Visual regression tests
   - Performance benchmarks
   - Cross-browser testing

## Expected Benefits

1. **Performance:** 
   - 977 lines → ~150 lines per card (85% reduction)
   - Eliminate 122 conditionals per card render

2. **Maintainability:**
   - Clear component boundaries
   - Predictable behavior
   - Easier debugging

3. **Developer Experience:**
   - Intuitive component selection
   - Faster development
   - Reduced cognitive load