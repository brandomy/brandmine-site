# BRANDMINE DEVELOPMENT GUIDELINES

## Build Commands
- `bundle exec jekyll serve` - Run local development server
- `bundle exec jekyll serve --livereload` - Run with live reloading
- `bundle exec jekyll build` - Build site for development
- `JEKYLL_ENV=production bundle exec jekyll build` - Build for production
- `npm run start` - Alias for jekyll serve
- `npm run build` - Alias for jekyll build
- `./_scripts/check_language_consistency.sh` - Check multilingual content coverage
- `./_scripts/enhanced-site-summary-advanced.sh` - Generate site summary

## Code Style Guidelines

### CSS
- BEM-inspired naming (Block__Element--Modifier)
- Mobile-first responsive design using defined breakpoints
- Keep selectors simple, avoiding deep nesting
- Group CSS by purpose (tokens, layout, components, pages)
- Use CSS custom properties for design tokens
- Document component styles with clear comments

### Jekyll
- Follow established front matter conventions
- Maintain multilingual structure (en/ru/zh directories)
- Use layouts and includes properly for consistency
- Organize content in appropriate collections
- Ensure all URLs maintain language prefix structure

### HTML
- Semantic HTML5 elements (section, article, nav, etc.)
- Unique `id` attributes for JavaScript targeting
- Consistent class names following BEM pattern
- Include appropriate ARIA attributes for accessibility

### File Organization
- Pages in `/pages/{lang}/`
- Brands in `/_brands/{lang}/`
- Insights in `/_insights/{lang}/`
- CSS organized in tokens, layout, components, pages
- Templates in `/_docs/templates/`

### Development Workflow
- Follow styleguide for new components
- Test all changes in all three languages
- Ensure responsive designs work across breakpoints
- Run language consistency checks before committing
- Test with Jekyll's local server before committing