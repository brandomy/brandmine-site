# Search & Filter Components Testing Checklist

## Pre-Test Setup
- [ ] **Data Sources Available**: Ensure these files exist and contain data:
  - `/search.json` - Site-wide search index
  - `/assets/data/brands.json` - Brand data
  - `/assets/data/founders.json` - Founder data  
  - `/assets/data/insights.json` - Insights data
- [ ] **JavaScript Dependencies Loaded**: Verify these scripts are included:
  - `/assets/js/search-filter.js`
  - `/assets/css/components/search/search-filter.scss` is compiled

---

## 1. Basic Search Functionality

### Search Input
- [ ] **Search Input Works**: Type in search box and see results update
- [ ] **Real-time Search**: Results update as you type (with 300ms debounce)
- [ ] **Search Button**: Clicking search button performs search
- [ ] **Clear Search Button**: X button clears search input and resets results
- [ ] **Enter Key**: Pressing Enter in search box performs search
- [ ] **Empty Search**: Clearing search shows all results

### Search Results Quality
- [ ] **Relevant Results**: Search for "tea" shows tea-related brands/content
- [ ] **Case Insensitive**: "TEA" and "tea" return same results
- [ ] **Partial Matches**: "teat" finds "TeaTime" brand
- [ ] **Multiple Terms**: "moscow tea" finds Moscow-based tea brands
- [ ] **No Results State**: Search for "xyz123" shows "No results found" message

---

## 2. Filter Functionality

### Filter Interface
- [ ] **Filter Toggle**: "Filters" button shows/hides advanced filters
- [ ] **Filter Count Badge**: Number shows active filter count
- [ ] **Multiple Columns**: Filter groups display in multiple columns on desktop
- [ ] **Mobile Layout**: Filters stack vertically on mobile devices

### Individual Filters
- [ ] **Checkbox Selection**: All filter checkboxes are clickable
- [ ] **Multiple Selection**: Can select multiple items within same category
- [ ] **Cross-Category**: Can select filters from different categories simultaneously
- [ ] **Visual Feedback**: Selected filters show active state

### Filter Categories
- [ ] **Sectors**: Wine, Natural Beauty, Gourmet Foods, etc.
- [ ] **Markets**: Russia, Brazil, China, India, etc.
- [ ] **Attributes**: Founder-led, Heritage Brand, Artisanal Excellence, etc.
- [ ] **Signals**: Export Ready, Franchise Ready, Investment Ready, etc.

### Content-Specific Filters
- [ ] **Brands**: Founder-led only, Featured only checkboxes work
- [ ] **Founders**: Generation filters (1st, 2nd, 3rd) work
- [ ] **Insights**: Category filters (Brand Spotlight, Founder's Journey, etc.) work

---

## 3. Filter Combinations & Logic

### AND Logic (Within Categories)
- [ ] **Sector + Market**: Selecting "Wine" + "Russia" shows Russian wine brands
- [ ] **Multiple Attributes**: "Founder-led" + "Heritage" shows brands with both
- [ ] **Complex Combinations**: 3+ filters from different categories work correctly

### Filter Interaction
- [ ] **Apply Filters**: "Apply Filters" button updates results
- [ ] **Clear Filters**: "Clear All" button removes all active filters
- [ ] **Individual Removal**: Can remove individual filters from active pills
- [ ] **Filter Persistence**: Filters remain active during sort/view changes

---

## 4. Active Filters Display

### Filter Pills
- [ ] **Pill Display**: Active filters show as removable pills
- [ ] **Pill Removal**: Clicking X on pill removes that filter
- [ ] **Pill Labels**: Pills show human-readable filter names
- [ ] **Search Query Pill**: Search terms appear as pills

### Clear Actions
- [ ] **Clear All Button**: Removes all filters and search
- [ ] **Selective Clearing**: Can clear individual categories
- [ ] **UI Reset**: Clearing filters unchecks all checkboxes

---

## 5. Results Display & Controls

### View Options
- [ ] **Grid View**: Results display in card grid layout
- [ ] **List View**: Results display in linear list layout
- [ ] **View Toggle**: Grid/List toggle buttons work
- [ ] **View Persistence**: View preference maintained during filtering

### Sort Functionality
- [ ] **Relevance Sort**: Default sort by relevance works
- [ ] **Name A-Z**: Alphabetical ascending sort works
- [ ] **Name Z-A**: Alphabetical descending sort works
- [ ] **Date Newest**: Most recent items first
- [ ] **Date Oldest**: Oldest items first
- [ ] **Sort Persistence**: Sort maintained during filtering

### Results Display
- [ ] **Result Count**: Shows accurate count of filtered results
- [ ] **Result Cards**: Each result shows title, description, metadata
- [ ] **Taxonomy Tags**: Results show relevant sector/market/attribute tags
- [ ] **Result Links**: Clicking results navigates to detail pages

---

## 6. Pagination & Performance

### Load More Functionality
- [ ] **Load More Button**: Appears when more results available
- [ ] **Load More Action**: Loads additional results when clicked
- [ ] **Button Hiding**: Hides when all results loaded
- [ ] **Pagination Reset**: New searches reset to page 1

### Performance
- [ ] **Fast Response**: Search/filter updates in < 500ms
- [ ] **Large Datasets**: Works with 100+ results
- [ ] **Memory Management**: No memory leaks during repeated searches
- [ ] **Smooth Scrolling**: Smooth UX when loading more results

---

## 7. URL Integration & State

### URL Parameters
- [ ] **Search Query**: `?q=tea` in URL shows tea search
- [ ] **Filter Parameters**: `?sector=wine&market=russia` applies filters
- [ ] **Combined Parameters**: Multiple URL params work together
- [ ] **URL Updates**: URL updates when filters/search change

### Browser Navigation
- [ ] **Back Button**: Browser back restores previous search state
- [ ] **Forward Button**: Browser forward works correctly
- [ ] **Direct URLs**: Pasting URLs with parameters works
- [ ] **Bookmarking**: Bookmarked search URLs work when revisited

---

## 8. Preset Functionality

### Quick Presets
- [ ] **Featured Preset**: Shows only featured content
- [ ] **Founder-led Preset**: Shows only founder-led brands
- [ ] **Export Ready Preset**: Shows export-ready brands
- [ ] **Heritage Preset**: Shows heritage brands
- [ ] **Sustainability Preset**: Shows sustainable brands

### Preset Behavior
- [ ] **Preset Application**: Clicking preset applies correct filters
- [ ] **Preset Visual State**: Active presets show selected state
- [ ] **Preset Clearing**: Clearing filters also clears preset selection

---

## 9. Mobile & Responsive Testing

### Mobile Layout
- [ ] **Touch Friendly**: All buttons/checkboxes work on touch devices
- [ ] **Responsive Filters**: Filters stack appropriately on mobile
- [ ] **Mobile Keyboard**: Search input triggers appropriate keyboard
- [ ] **Viewport Meta**: Page scales correctly on mobile devices

### Tablet Layout
- [ ] **Tablet Columns**: Filter groups display appropriately on tablet
- [ ] **Touch Navigation**: All interactions work with touch
- [ ] **Orientation**: Works in both portrait and landscape

---

## 10. Error Handling & Edge Cases

### Data Loading
- [ ] **Missing Data**: Graceful handling when JSON files missing
- [ ] **Empty Results**: Proper messaging when no results found
- [ ] **Loading States**: Shows loading indicator during data fetch
- [ ] **Error Recovery**: Fallback to search.json if specific data missing

### Edge Cases
- [ ] **Special Characters**: Search works with special characters (é, ñ, ü)
- [ ] **Very Long Queries**: Handles long search strings gracefully
- [ ] **Rapid Interactions**: No conflicts from rapid clicking/typing
- [ ] **Browser Refresh**: State restoration after page refresh

---

## 11. Cross-Browser Testing

### Modern Browsers
- [ ] **Chrome (latest)**: All functionality works
- [ ] **Firefox (latest)**: All functionality works  
- [ ] **Safari (latest)**: All functionality works
- [ ] **Edge (latest)**: All functionality works

### Mobile Browsers
- [ ] **Mobile Safari**: iOS Safari compatibility
- [ ] **Chrome Mobile**: Android Chrome compatibility
- [ ] **Samsung Internet**: Android Samsung browser

---

## 12. Content Type Specific Testing

### Brands Page
- [ ] Navigate to `/en/brands/` and test all above functionality
- [ ] Verify brand-specific filters work
- [ ] Test founder-led and featured-only options

### Founders Page  
- [ ] Navigate to `/en/founders/` and test search
- [ ] Test generation filters (1st, 2nd, 3rd generation)
- [ ] Verify founder-specific metadata displays

### Insights Page
- [ ] Navigate to `/en/insights/` and test filtering
- [ ] Test category filters (Brand Spotlight, Founder's Journey, etc.)
- [ ] Verify date range and reading time filters

### Test Development Page
- [ ] Navigate to `/en/dev/search-test/` 
- [ ] Test all three search-filter components (brands, founders, insights)
- [ ] Verify legacy search functionality still works

---

## Performance Benchmarks

### Speed Targets
- [ ] **Initial Load**: < 1 second for component initialization
- [ ] **Search Response**: < 300ms for search result updates  
- [ ] **Filter Updates**: < 200ms for filter application
- [ ] **Data Loading**: < 2 seconds for JSON data fetch

### Resource Usage
- [ ] **Memory**: No memory leaks during extended use
- [ ] **Network**: Efficient data loading without redundant requests
- [ ] **CPU**: Smooth performance during rapid interactions

---

## Final Verification

### Functionality Complete
- [ ] All basic search features working
- [ ] All filter combinations working
- [ ] All UI controls responding correctly
- [ ] All view modes functioning
- [ ] URL integration complete
- [ ] Mobile experience optimized

### Code Quality
- [ ] No JavaScript console errors
- [ ] No CSS layout issues
- [ ] Proper accessibility (ARIA labels, keyboard navigation)
- [ ] Clean, semantic HTML structure

---

*Last Updated: 2025-05-25*
*Test on: `/en/dev/search-test/` for comprehensive component testing*