# Next Session Technical Guide
## Implementation Instructions for Advanced Search Completion

## 🎯 Session Objectives
Complete the advanced search implementation and optimize the data architecture we established today.

---

## 🔧 TECHNICAL STATUS

### ✅ COMPLETED TODAY
1. **Advanced Search Engine**: Full JavaScript implementation with multi-dimensional filtering
2. **Brands Page Integration**: Complete interface overhaul with filter panels
3. **Data Architecture**: 3-tier brand system (Level 0/1/2) established
4. **JSON Endpoints**: Jekyll-generated data files for browser access
5. **Form Integration**: Complete Airtable setup guide and documentation
6. **Plugin Framework**: Auto brand page generation and insights JSON sync

### ❌ NEEDS COMPLETION
1. **Build Testing**: Site build interrupted, need to verify functionality
2. **Data Loading**: JSON endpoints need production testing
3. **Insights Integration**: Plugin exists but needs activation
4. **Search Extension**: Other collection pages need advanced search
5. **YML Cleanup**: Safe archival of duplicate data files

---

## 🚀 IMPLEMENTATION STEPS

### Step 1: Verify Current Build (30 minutes)

**Test Site Build:**
```bash
cd /Users/randaleastman/Documents/brandmine-site
bundle exec jekyll build --incremental
```

**Check for Issues:**
- Build completion time (should be <2 minutes)
- Plugin output messages
- Generated JSON files in `_site/assets/data/`

**Verify Data Endpoints:**
```bash
# Check generated JSON files exist
ls -la _site/assets/data/
curl http://localhost:4000/assets/data/brands.json | head -20
```

### Step 2: Debug Data Loading (15 minutes)

**Test JavaScript Fetch:**
1. Start development server: `bundle exec jekyll serve`
2. Open brands page: `http://localhost:4000/en/brands/`
3. Check browser console for fetch errors
4. Verify filter panels populate with data

**Common Issues & Fixes:**
- **404 on JSON files**: Check `assets/data/*.json` liquid templates
- **CORS errors**: Ensure serving from same domain
- **Empty filters**: Check dimensions.json structure
- **Slow loading**: Optimize JSON file sizes

### Step 3: Complete Insights JSON Integration (45 minutes)

**Activate Plugin:**
```bash
# Verify plugin is in place
ls -la _plugins/insights_json_sync.rb

# Check Jekyll plugins config
grep -A5 "plugins:" _config.yml
```

**Update Insight Front Matter:**
1. Use enhanced template: `_templates/insights/insight-template-enhanced.md`
2. Update existing insights with required fields:
   ```yaml
   ref: insight-slug-here
   word_count: 1200
   last_modified: 2025-01-01
   analytics:
     track_reading_progress: true
   ```

**Test Integration:**
```bash
bundle exec jekyll build
# Look for: "✅ Generated insights.json with X insights"
grep -A10 "ru-russian-wine" _data/insights.json
```

### Step 4: Archive YML Files (15 minutes)

**Safe Archival (Low Risk):**
```bash
# Create archive directory
mkdir -p _archive/yml-backup-20250523

# Archive duplicate data files
mv _data/attributes _archive/yml-backup-20250523/
mv _data/markets _archive/yml-backup-20250523/
mv _data/sectors _archive/yml-backup-20250523/
mv _data/signals _archive/yml-backup-20250523/

# Test build still works
bundle exec jekyll build --incremental
```

**Never Archive:**
- `_data/translations/` - Essential for UI
- `_data/navigation/` - Essential for menus
- `_data/countries.json` - Reference data
- `_data/languages.json` - Reference data

### Step 5: Extend Search to Other Pages (60 minutes)

**Founders Page Integration:**
1. Copy search interface: `_includes/pages/brands/search.html` → `_includes/pages/founders/search.html`
2. Modify for founders: Change content-type default, update translations
3. Update founders page sections to include search

**Discovery Page Integration:**
1. Add search toggle to discovery dimensions grid
2. Enable filtering within dimension categories
3. Cross-link between discovery and search results

**Insights Page Integration:**
1. Add insights to advanced search content types
2. Enable filtering by category, brands mentioned, markets
3. Implement insights-specific search features

---

## 🔍 TESTING CHECKLIST

### Functionality Tests
- [ ] **Basic search** works with text input
- [ ] **Filter panels** populate with correct data
- [ ] **Multi-dimensional filtering** works (sector + market + attribute)
- [ ] **Quick search presets** execute correctly
- [ ] **URL persistence** maintains search state
- [ ] **Active filters** display and removal works
- [ ] **Results display** shows brand cards properly
- [ ] **Mobile interface** is responsive and usable

### Data Integration Tests
- [ ] **JSON endpoints** load successfully
- [ ] **Brand count numbers** are accurate in filters
- [ ] **Cross-references** work (brands ↔ founders ↔ insights)
- [ ] **Language switching** maintains search state
- [ ] **Empty states** handle no results gracefully
- [ ] **Error states** handle data loading failures

### Performance Tests
- [ ] **Initial load** completes in <3 seconds
- [ ] **Filter changes** update in <500ms
- [ ] **Search typing** has smooth debounced updates
- [ ] **Large result sets** load progressively
- [ ] **Mobile performance** remains responsive

---

## 🚨 TROUBLESHOOTING GUIDE

### Build Issues
**Slow builds (>2 minutes):**
- Use `--incremental` flag
- Check for plugin infinite loops
- Verify large data files aren't being regenerated unnecessarily

**Plugin errors:**
- Check Ruby syntax in `_plugins/`
- Verify Jekyll version compatibility
- Look for missing dependencies

### Data Loading Issues
**JSON 404 errors:**
- Verify `assets/data/*.json` files have correct liquid frontmatter
- Check Jekyll processes .json files in assets
- Ensure proper site.baseurl configuration

**Empty search results:**
- Check data structure matches JavaScript expectations
- Verify dimension slugs are consistent
- Check language-specific data loading

### Search Functionality Issues
**Filters don't populate:**
- Check browser console for JavaScript errors
- Verify dimensions.json structure and format
- Check translation data availability

**Search doesn't filter:**
- Verify filter event listeners are attached
- Check filter logic matches data structure
- Debug filter count generation

---

## 📚 REFERENCE FILES

### Implementation Files
- `assets/js/advanced-search.js` - Search engine logic
- `_includes/pages/brands/search.html` - Search interface
- `assets/css/components/search/advanced-search.scss` - Styling
- `_plugins/insights_json_sync.rb` - Insights integration
- `_plugins/auto_brand_pages.rb` - Level 0 brand generation

### Documentation Files
- `_docs/SESSION_SUMMARY_2025_05_23.md` - Complete session record
- `_docs/AIRTABLE_CHEAT_SHEET.md` - Form integration guide
- `_docs/YML_CLEANUP_AUDIT.md` - File cleanup strategy
- `_docs/OPTIMAL_LAYOUT_STRUCTURES.md` - Page design guidelines

### Template Files
- `_templates/insights/insight-template-enhanced.md` - Enhanced insight template
- `_layouts/brand-basic.html` - Level 0 brand template
- `_templates/brand_profile.md` - Full brand template

---

## 🎯 SUCCESS CRITERIA

### Immediate Goals
- Site builds successfully in <2 minutes
- Advanced search loads and functions on Brands page
- JSON data endpoints are accessible
- Insights JSON integration works
- YML cleanup completed without breaking functionality

### Phase 2 Goals
- Advanced search integrated on all collection pages
- Level 0 brand auto-generation tested with sample data
- Airtable form integration implemented
- Performance optimized for mobile users

### Long-term Goals
- Wine brands dataset imported and auto-generated
- Data visualization components added
- Search analytics tracking implemented
- Complete workflow from Airtable → Jekyll → Search

---

*Use this guide to systematically complete the advanced search implementation and data optimization we began today.*