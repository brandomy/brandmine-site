#!/bin/bash

# Site Summary Generator for Brandmine Jekyll Site
# Run this script from your project root directory

echo "# Brandmine Site Summary"
echo "Generated on $(date)"
echo ""

# Git status
echo "## Repository Status"
echo "Current branch: $(git branch --show-current)"
echo "Last commit: $(git log -1 --pretty=%B)"
echo "Modified files: $(git status -s | wc -l)"
echo ""

# Site structure
echo "## Site Structure"
echo "### Directories"
echo "\`\`\`"

if [ -d "_layouts" ]; then
  layout_count=$(ls -1 _layouts 2>/dev/null | wc -l)
  echo "- _layouts/ ($layout_count files)"
  ls -1 _layouts 2>/dev/null | sed 's/^/  - /'
fi

if [ -d "_includes" ]; then
  includes_count=$(ls -1 _includes 2>/dev/null | wc -l)
  echo "- _includes/ ($includes_count files)"
  ls -1 _includes 2>/dev/null | sed 's/^/  - /'
fi

if [ -d "_data" ]; then
  data_count=$(find _data -type f 2>/dev/null | wc -l)
  echo "- _data/ ($data_count files)"
  find _data -type f 2>/dev/null | sed 's/^/  - /'
fi

if [ -d "assets/css" ]; then
  css_count=$(ls -1 assets/css 2>/dev/null | wc -l)
  echo "- assets/css/ ($css_count files)"
  ls -1 assets/css 2>/dev/null | sed 's/^/  - /'
fi

if [ -d "assets/fonts" ]; then
  fonts_count=$(ls -1 assets/fonts 2>/dev/null | wc -l)
  echo "- assets/fonts/ ($fonts_count files)"
  ls -1 assets/fonts 2>/dev/null | sed 's/^/  - /'
fi

if [ -d "pages" ]; then
  echo "- pages/ structure"
  find pages -type d -maxdepth 2 2>/dev/null | sed 's/^/  - /'
fi

echo "\`\`\`"
echo ""

# Configuration
echo "## Configuration Details"
echo "\`\`\`yaml"
grep -A5 "title:" _config.yml 2>/dev/null
echo ""
grep -A3 "collections:" _config.yml 2>/dev/null
echo ""
grep -A5 "defaults:" _config.yml 2>/dev/null
echo "\`\`\`"
echo ""

# Content summary
echo "## Content Summary"
if [ -d "pages" ]; then
  lang_count=$(ls -1 pages 2>/dev/null | wc -l)
  lang_list=$(ls -1 pages 2>/dev/null | tr '\n' ' ')
  echo "- Languages: $lang_count ($lang_list)"
fi

if [ -d "_brands" ]; then
  brand_count=$(find _brands -type f 2>/dev/null | wc -l)
  echo "- Brand profiles: $brand_count"
fi

if [ -d "_posts" ]; then
  post_count=$(find _posts -type f 2>/dev/null | wc -l)
  echo "- Blog posts: $post_count"
fi

if [ -d "_data/translations" ]; then
  translation_count=$(find _data/translations -type f 2>/dev/null | wc -l)
  echo "- Translation files: $translation_count"
fi
echo ""

# CSS files
echo "## CSS Files"
echo "\`\`\`"
if [ -d "assets/css" ]; then
  ls -1 assets/css 2>/dev/null | sed 's/^/- /'
fi
echo "\`\`\`"
echo ""

# Fonts
echo "## Font Files"
echo "\`\`\`"
if [ -d "assets/fonts" ]; then
  ls -1 assets/fonts 2>/dev/null | sed 's/^/- /'
fi
echo "\`\`\`"
echo ""

# Jekyll version
echo "## Environment"
if command -v bundle >/dev/null 2>&1; then
  jekyll_version=$(bundle exec jekyll -v 2>/dev/null | cut -d' ' -f2)
  echo "- Jekyll version: $jekyll_version"
fi

if command -v ruby >/dev/null 2>&1; then
  ruby_version=$(ruby -v 2>/dev/null | cut -d' ' -f2)
  echo "- Ruby version: $ruby_version"
fi
echo ""

echo "## Getting Started"
echo "1. Run \`bundle install\` to install dependencies"
echo "2. Run \`bundle exec jekyll serve\` to start the development server"
echo "3. Visit http://localhost:4000 to view the site"
echo ""

echo "Generated by site-summary script"