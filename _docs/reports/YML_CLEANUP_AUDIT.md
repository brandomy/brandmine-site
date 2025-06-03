# YML Files Cleanup Audit
## Files to Archive vs Keep After JSON Migration

## ✅ MIGRATED TO JSON - CAN BE ARCHIVED

### 1. Brands Data - MIGRATED
**Can Archive:**
- All individual brand `.md` files for Level 0 brands (will be auto-generated)
- Any brand-specific YML data files (replaced by brands.json)

**Keep:**
- `_brands/` markdown files for Level 1 & 2 brands (human-curated profiles)

### 2. Founders Data - MIGRATED  
**Can Archive:**
- Any founder-specific YML data files (replaced by founders.json)

**Keep:**
- `_founders/` markdown files (contain human-written narratives)

### 3. Dimensions Data - ALREADY OPTIMAL
**Keep All:**
- `_data/dimensions.json` - Already optimal structure
- `_data/dimensions/` YML files - Used for page generation and translations

### 4. Static Reference Data - MIGRATED
**Can Archive:**
- `_data/attributes/` YML files → Replaced by `attributes.json`
- `_data/markets/` YML files → Replaced by `markets.json`  
- `_data/sectors/` YML files → Replaced by `sectors.json`
- `_data/signals/` YML files → Replaced by `signals.json`

**Status**: These are essentially duplicates of data now in JSON format.

---

## 🚫 MUST KEEP - ACTIVE USE

### 1. Translation Files - ESSENTIAL
**Keep All:**
```
_data/translations/
  ├── en.yml
  ├── ru.yml
  └── zh.yml
```
**Reason**: Dynamic UI text, navigation labels, form text

### 2. Navigation Structure - ESSENTIAL  
**Keep All:**
```
_data/navigation/
  ├── en.yml
  ├── ru.yml
  └── zh.yml
```
**Reason**: Menu structure, link organization

### 3. Footer & Social Data - ESSENTIAL
**Keep All:**
```
_data/footer/ & _data/social/
```
**Reason**: Site-wide layout elements

### 4. Market-Sector Mapping - ACTIVE
**Keep All:**
```
_data/market-sectors/
```
**Reason**: Complex relationships, page generation

### 5. Reference Data - STILL NEEDED
**Keep All:**
```
_data/countries.json
_data/languages.json
_data/market-country-map.json
_data/market_sector_map.json
```
**Reason**: Core reference data for forms, maps, relationships

---

## 📦 ARCHIVAL STRATEGY

### Phase 1: Safe Archive (Low Risk)
**Move to `_archive/yml-backup-[date]/`:**

1. **Dimension YML Directories:**
   ```
   _data/attributes/    → _archive/yml-backup-20250523/attributes/
   _data/markets/       → _archive/yml-backup-20250523/markets/
   _data/sectors/       → _archive/yml-backup-20250523/sectors/ 
   _data/signals/       → _archive/yml-backup-20250523/signals/
   ```

2. **Deprecated Data Files:**
   - Any old brand/founder YML structures
   - Experimental data files not in current use

### Phase 2: Test Archive (Medium Risk)  
**After confirming JSON migration works:**

1. **Insights YML** (if JSON migration successful):
   ```
   _data/insights/      → _archive/yml-backup-20250523/insights/
   ```

### Phase 3: Never Archive (Keep Forever)
- Translation files
- Navigation files  
- Footer/social files
- Reference data files
- Market-sector mapping files

---

## 🧹 CLEANUP COMMANDS

### Create Archive Directory
```bash
mkdir -p _archive/yml-backup-20250523
```

### Archive Dimension YML Files
```bash
# Safe to archive - data migrated to JSON
mv _data/attributes _archive/yml-backup-20250523/
mv _data/markets _archive/yml-backup-20250523/
mv _data/sectors _archive/yml-backup-20250523/
mv _data/signals _archive/yml-backup-20250523/
```

### Test Build After Archive
```bash
bundle exec jekyll build --incremental
# Check that site builds successfully
```

### Archive Insights YML (After JSON Migration)
```bash
# Only after confirming insights.json works
mv _data/insights _archive/yml-backup-20250523/
```

---

## 📊 SPACE SAVINGS ESTIMATE

### Files to Archive:
- `_data/attributes/` (3 files × ~50 lines each) = ~150 lines
- `_data/markets/` (3 files × ~40 lines each) = ~120 lines  
- `_data/sectors/` (3 files × ~60 lines each) = ~180 lines
- `_data/signals/` (3 files × ~20 lines each) = ~60 lines
- `_data/insights/` (3 files × ~100 lines each) = ~300 lines

**Total**: ~810 lines of YML code
**Estimated reduction**: ~30KB of YAML files

### Benefits:
- ✅ Simpler data structure  
- ✅ Faster build times
- ✅ Reduced complexity for content creators
- ✅ Single source of truth (JSON)
- ✅ Better search performance

---

## ⚠️ VERIFICATION CHECKLIST

Before archiving any files, verify:

- [ ] **Advanced search** works with JSON data
- [ ] **Site builds** successfully without YML files
- [ ] **Navigation** still functions properly  
- [ ] **Translations** still work correctly
- [ ] **Page generation** still works for dimensions
- [ ] **No broken links** or missing data
- [ ] **Search functionality** includes all expected results

---

## 🚀 RECOMMENDED ACTION PLAN

### Immediate (Safe Actions):
1. ✅ Archive dimension YML directories (Phase 1)
2. ✅ Test site build
3. ✅ Verify search functionality

### After Advanced Search Testing:
1. 🔄 Complete insights JSON migration
2. 🔄 Test insights search integration  
3. 🔄 Archive insights YML files (Phase 2)

### Never Archive:
- Translation files (essential for UI)
- Navigation files (essential for menus)
- Reference data files (essential for forms/maps)
- Footer/social files (essential for layout)

**Bottom Line**: We can safely archive ~810 lines of duplicate YML data while maintaining all essential functionality.