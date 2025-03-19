## 2025-03-11: Implemented Multilingual Newsletter Forms

## 2025-03-19: Reorder all russian-sectors [Content]

### Changes Made
- within russian-sectors reordered the Lifstyle & F&B sectors
- repeated for EN/RU/ZH sites

### Technical Decisions
- no change

### Next Steps
- style this page with panels and colour

## 2025-03-19: Update Russian and English sectors pages to reflect the addition of new sectors and enhance content for improved clarity and engagement [Content]

### Changes Made
- added Hotels and Resorts as a category
- modified to Fashion & Accessories, Gourmet Foods
- reprioritized initial 3 sectors

### Technical Decisions
- targeting most potential for sales

### Next Steps
- review the brands page before merging into main

## 2025-03-18: Implement mobile hamburger menu functionality and styles [Layout]

### Changes Made
- implemented hamburger menu for small screen sizes

### Technical Decisions
- had to troubleshoot this
- kept the hamburger function simple
- added a couple of styling touches

### Next Steps
- test the hamburger menu on different screen sizes

## 2025-03-18: Enhance mobile footer layout and hide scroll indicator on small phones [Layout]

### Changes Made
- removed the scroll indicator for small phone screen
- centered the footer content on small phone screens

### Technical Decisions
- used flexbox

### Next Steps
- test the mobile version again

### Changes Made
- Created separate Mailerlite forms for each language (EN, RU, ZH)
- Updated `_includes/footer.html` to display language-specific forms based on page.lang
- Maintained consistent styling across all forms

### Technical Decisions
- Chose separate forms over JS translation for better control of language-specific success messages
- Used Jekyll Liquid conditionals to select the appropriate form
- Created reference documentation at `docs/newsletter-implementation.md`

### Files Modified
- `_includes/footer.html`
- `_layouts/default.html` (added Mailerlite universal script)

### Next Steps
- Set up analytics tracking for form submissions
- Create language-specific confirmation emails


## 2025-03-19: Hamburger Menu Implementation Attempt

### Changes Attempted
- Added a hamburger menu toggle button for mobile navigation
- Implemented CSS for menu toggle visibility and positioning
- Created JavaScript for toggle functionality
- Modified responsive media queries to support the menu

### Technical Challenges Encountered
- Conflicts between existing responsive CSS and new hamburger menu styles
- Issues with CSS specificity and cascade order causing the menu button to remain hidden
- Unexpected behavior where the menu toggle was visible but navigation links remained hidden
- Cross-browser compatibility concerns

### Decision Made
- Reverted to the original horizontal navigation approach that wraps on small screens
- Simplified CSS by removing hamburger-specific code
- Removed menu.js as it's no longer needed
- Restored header.html to its original structure

### Lessons Learned
- Mobile navigation requires careful consideration of CSS specificity and media queries
- Future mobile menu implementations should be planned from the beginning rather than retrofitted
- A simpler navigation pattern works well for our current site structure and content volume