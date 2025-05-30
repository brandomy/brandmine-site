# Journal Posts Templates

This directory contains templates for creating new journal/blog posts for the Founder's Journal section.

## Template Usage

### Creating a New Post

1. Copy `post-template.md` to a new file in `_posts/` with the format: `YYYY-MM-DD-post-slug.md`
2. Update the front matter with your post details
3. Replace the content with your post content
4. Process any images using the image processing script

### Front Matter Fields

**Required:**
- `layout: post` - Always use the post layout
- `title` - The post title (will be displayed as h1)
- `date` - Publication date in YYYY-MM-DD format
- `author` - Author ID (matches team member IDs in translations)
- `excerpt` - Brief description for card displays and SEO
- `lang` - Language code (en, ru, or zh)

**Optional:**
- `tags` - Array of tags for categorization
- `image` - Hero image path (recommended 3:2 aspect ratio)
- `image_caption` - Caption for the hero image
- `reading_time` - Estimated reading time in minutes
- `featured` - Set to true for featured posts (shows on homepage)
- `sections` - Custom section order (uses default if not specified)

### Image Guidelines

- **Hero images**: 1200×800px (3:2 ratio) using Textured Minimalism (TM) style
- **Inline images**: Process using `_scripts/process_images.sh journal [post-slug]`
- **Directory structure**: `/assets/images/journal/YYYY-MM-DD-post-slug/`

### Content Guidelines

**Voice and Tone:**
- Personal and transparent
- Technical but accessible
- Reflective of founder journey
- Focus on lessons learned and insights gained

**Structure:**
- Start with context and challenge
- Explain decision-making process
- Share implementation details
- Conclude with results and future implications

**Topics:**
- Technical tools and platforms
- Market research insights
- Cultural learnings from BRICS+ exploration
- Platform development challenges
- Partnership and business development

### Multilingual Support

Currently posts are created in English only. For important posts that warrant translation:

1. Create versions in `_posts/` with appropriate language codes
2. Ensure consistent tagging across languages
3. Update internal links to point to language-appropriate pages

### File Naming Convention

```
YYYY-MM-DD-descriptive-slug.md
```

Examples:
- `2025-05-30-maplibre-journey.md`
- `2025-06-15-russian-market-insights.md`
- `2025-07-01-china-brand-storytelling.md`

### Publishing Workflow

1. Create post from template
2. Process images if needed
3. Test locally with `bundle exec jekyll serve`
4. Commit and push to deploy