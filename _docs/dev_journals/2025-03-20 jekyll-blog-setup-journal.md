# Jekyll Blog Setup Journal - March 20, 2025

## Problem Statement

I needed to create a personal blog using Jekyll and GitHub Pages that would allow me to:
- Write and publish blog posts with minimal technical overhead
- Display photos and other media content
- Become familiar with Jekyll's capabilities and limitations
- Host the blog on my custom domain (blog.brandomy.com)

As a 59-year-old businessman with an interest in coding but not extensive programming experience, I needed a solution that would be accessible while still providing customization options.

## Approach

We chose to use Jekyll with GitHub Pages for several reasons:
- Jekyll is a static site generator that transforms Markdown files into a complete website
- GitHub Pages offers free hosting with direct publishing from a GitHub repository
- The combination allows for version control through Git
- Content can be written in Markdown, which is simpler than HTML
- The setup allows for extensive customization as my skills develop

The general approach was to:
1. Set up a local Jekyll installation
2. Create a basic site structure
3. Connect it to a GitHub repository
4. Configure GitHub Pages with my custom domain
5. Troubleshoot any issues with post display
6. Add a cover image and customize the navigation

## Implementation Details

### Initial Jekyll Setup

Created a new Jekyll site:
```bash
jekyll new my-blog
cd my-blog
bundle exec jekyll serve
```

### GitHub Repository Connection

Connected the local repository to GitHub:
```bash
git init
git add .
git commit -m "Initial commit"
git remote set-url origin https://github.com/brandomy/my-blog.git
git push -u origin main
```

### Custom Domain Configuration

Added a custom domain in GitHub Pages settings and set up the correct DNS records for `blog.brandomy.com`. Created a CNAME file in the repository root containing:
```
blog.brandomy.com
```

### Timezone Configuration

To fix issues with future-dated posts not displaying, added the correct timezone to `_config.yml`:
```yaml
timezone: Asia/Singapore
```

### Blog Post Structure

Created posts in the `_posts` directory with the filename format `YYYY-MM-DD-title.md` and the following front matter:
```yaml
---
layout: post
title: "My First Blog Post"
date: 2025-03-20
categories: personal
---
```

### Custom Homepage with Cover Image

Modified `index.md` to include a cover image and description:
```markdown
---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

![Cover Image](/assets/images/penang-street-art.jpg)

# Welcome to Musings

A blog exploring the intersection of brand strategy, consumer psychology, and market trends, with particular focus on emerging markets and cross-cultural branding insights.
```

### Navigation Menu Configuration

Modified `_config.yml` to control which pages appear in the navigation menu:
```yaml
header_pages:
  - about.md
  # Add any other pages you want in navigation
```

## Decisions Made

### Using a Gem-based Theme
- Decided to use the default "minima" theme rather than a custom theme
- Rationale: Simplifies maintenance and updates while providing a clean, professional appearance
- The theme can be customized later as needed by overriding specific files

### Custom Domain vs. GitHub Subdomain
- Chose to use a custom domain (blog.brandomy.com) instead of the default GitHub Pages domain
- Rationale: Provides a more professional appearance and better brand consistency
- Required additional DNS configuration but improved the user experience

### Post Date Handling
- Added explicit timezone configuration rather than changing post dates
- Rationale: Preserves accurate publication dates while ensuring posts display correctly
- This approach is more maintainable as the blog grows

### Navigation Menu Approach
- Used the `header_pages` configuration option rather than modifying theme files
- Rationale: Provides a clean, declarative way to control navigation without needing to override theme templates
- Makes it easier to add or remove pages from navigation in the future

## Resources

### Diagnostic Script
Created a shell script for generating a comprehensive report about the Jekyll site structure:
```bash
#!/bin/bash

# Create a markdown file to store the report
echo "# Jekyll Project Structure Report" > jekyll-project-report.md
echo "*Generated: $(date)*" >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# Basic system information
echo "## Basic System Information" >> jekyll-project-report.md
echo "- **Operating System:** $(uname -s)" >> jekyll-project-report.md
echo "- **Ruby Version:** $(ruby -v)" >> jekyll-project-report.md
echo "- **Jekyll Version:** $(jekyll -v)" >> jekyll-project-report.md
echo "- **Bundler Version:** $(bundle -v)" >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# Project directory structure
echo "## Project Directory Structure" >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
find . -type d -not -path "*/\.*" -not -path "*/_site*" -not -path "*/node_modules*" | sort >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# More sections...
```

The script provided a detailed report showing:
- System information
- Directory structure
- Configuration files
- Post front matter
- Theme details
- Future-dated posts that might be causing display issues

### Jekyll Configuration
Final `_config.yml` with key settings:
```yaml
title: Musings
email: randal@brandmine.ca
description: >- 
  Exploring the intersection of brand strategy, consumer psychology, and market trends. Musings offers fresh perspectives on what makes brands resonate, with occasional detours into whatever fascinating topics catch our attention along the way.
baseurl: "" # With a custom domain, this should be empty
url: "https://blog.brandomy.com" # Your custom domain with https protocol
theme: minima
timezone: Asia/Singapore
header_pages:
  - about.md
```

## Insights & Learning

### Jekyll File Structure
Jekyll follows a convention-over-configuration approach with specific directory structures:
- `_posts/` directory must contain all blog posts
- Files must follow the `YYYY-MM-DD-title.md` naming convention
- Front matter (the YAML block at the top of files) is required for Jekyll to process pages correctly

### Time-Based Publishing
Jekyll processes files at build time, not runtime, which means:
- Posts dated in the future won't display by default
- The system time zone affects how dates are interpreted
- Setting the correct time zone is crucial for predictable behavior

### Theme Customization Approaches
There are multiple levels of theme customization:
1. Simple configuration changes in `_config.yml`
2. Adding content to existing layout structures (like adding images to index.md)
3. Overriding specific theme components by copying them to the project
4. Creating entirely custom layouts

### Git Workflow for Jekyll
The basic Git workflow for maintaining a Jekyll site:
1. Make changes locally
2. Test with `bundle exec jekyll serve`
3. Commit changes with Git
4. Push to GitHub, which triggers a rebuild of the site
5. Wait a minute or two for changes to appear on the live site

## Next Actions

1. **Content Development**
   - Write additional blog posts focusing on brand strategy topics
   - Create a comprehensive "About" page with professional background information

2. **Design Enhancements**
   - Consider additional customization of the minima theme
   - Explore options for improving typography and color schemes
   - Add a favicon and other brand identity elements

3. **Functionality Expansion**
   - Implement categories and tags for better content organization
   - Add social media sharing options for posts
   - Consider adding comment functionality (Disqus or similar)

4. **Technical Improvements**
   - Set up a local Git branch for testing design changes
   - Add Google Analytics or similar for visitor tracking
   - Optimize image loading and overall site performance

5. **Learning Opportunities**
   - Explore Jekyll plugins for additional functionality
   - Learn about Liquid templates to further customize layouts
   - Investigate options for adding dynamic elements to the static site

By continuing to develop the site incrementally, I can both improve my technical skills and build a valuable platform for sharing my brand strategy insights.
