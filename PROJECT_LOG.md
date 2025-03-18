## 2025-03-11: Implemented Multilingual Newsletter Forms

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