#!/bin/bash

# Enhanced Site Summary Generator for Brandmine Jekyll Site
# Run this script from your project root directory

OUTPUT_FILE="site-summary.md"

# Function to count lines in a file
count_lines() {
  wc -l "$1" 2>/dev/null | awk '{print $1}'
}

# Generate the summary
generate_summary() {
  echo "# Brandmine Site Summary"
  echo "Generated on $(date)"
  echo ""

  # Git status with more details
  echo "## Repository Status"
  echo "Current branch: $(git branch --show-current)"
  echo "Last commit: $(git log -1 --pretty=%B)"
  echo "Last commit date: $(git log -1 --pretty=%cd --date=format:'%Y-%m-%d %H:%M')"
  echo "Modified files: $(git status -s | wc -l)"
  echo "Recent activity:"
  git log --pretty=format:"- %ad: %s" --date=short -n 5
  echo ""
  echo ""

  # Site structure (enhanced from original)
  echo "## Site Structure"
  echo "### Directories"
  echo "\`\`\`"

  # Layout templates
  if [ -d "_layouts" ]; then
    layout_count=$(ls -1 _layouts 2>/dev/null | wc -l)
    echo "- _layouts/ ($layout_count files)"
    ls -1 _layouts 2>/dev/null | sed 's/^/  - /'
  fi

  # Include components
  if [ -d "_includes" ]; then
    includes_count=$(ls -1 _includes 2>/dev/null | wc -l)
    echo "- _includes/ ($includes_count files)"
    ls -1 _includes 2>/dev/null | sed 's/^/  - /'
  fi

  # Data files with more details
  if [ -d "_data" ]; then
    data_count=$(find _data -type f 2>/dev/null | wc -l)
    echo "- _data/ ($data_count files)"
    find _data -type f 2>/dev/null | sed 's/^/  - /'
  fi

  # Assets with categorization
  if [ -d "assets" ]; then
    asset_count=$(find assets -type f 2>/dev/null | wc -l)
    echo "- assets/ ($asset_count files total)"
    
    # CSS files
    if [ -d "assets/css" ]; then
      css_count=$(find assets/css -type f -name "*.css" 2>/dev/null | wc -l)
      echo "  - assets/css/ ($css_count CSS files)"
      find assets/css -type f -name "*.css" 2>/dev/null | sed 's/^/    - /'
    fi
    
    # JavaScript files
    if [ -d "assets/js" ]; then
      js_count=$(find assets/js -type f -name "*.js" 2>/dev/null | wc -l)
      echo "  - assets/js/ ($js_count JS files)"
      find assets/js -type f -name "*.js" 2>/dev/null | sed 's/^/    - /'
    fi
    
    # Fonts
    if [ -d "assets/fonts" ]; then
      fonts_count=$(find assets/fonts -type f 2>/dev/null | wc -l)
      echo "  - assets/fonts/ ($fonts_count font files)"
      find assets/fonts -type f 2>/dev/null | head -n 10 | sed 's/^/    - /'
      if [ "$fonts_count" -gt 10 ]; then
        echo "    - ... and $(($fonts_count - 10)) more font files"
      fi
    fi
    
    # Images
    if [ -d "assets/images" ]; then
      images_count=$(find assets/images -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.svg" -o -name "*.gif" \) 2>/dev/null | wc -l)
      echo "  - assets/images/ ($images_count image files)"
    fi
  fi

  # Pages structure with language-specific details
  if [ -d "pages" ]; then
    echo "- pages/ structure"
    for lang_dir in pages/*; do
      if [ -d "$lang_dir" ]; then
        lang=$(basename "$lang_dir")
        page_count=$(find "$lang_dir" -type f -name "*.html" -o -name "*.md" 2>/dev/null | wc -l)
        echo "  - $lang_dir/ ($page_count pages)"
        find "$lang_dir" -maxdepth 1 -type f \( -name "*.html" -o -name "*.md" \) 2>/dev/null | sed 's/^/    - /'
      fi
    done
  fi

  echo "\`\`\`"
  echo ""

  # Configuration with more comprehensive details
  echo "## Configuration Details"
  echo "\`\`\`yaml"
  grep -A5 "title:" _config.yml 2>/dev/null
  echo "..."
  grep -A3 "collections:" _config.yml 2>/dev/null
  echo "..."
  grep -A5 "defaults:" _config.yml 2>/dev/null
  echo "..."
  # Add plugin information
  grep -A10 "plugins:" _config.yml 2>/dev/null
  echo "\`\`\`"
  echo ""

  # Content summary with enhanced metrics
  echo "## Content Summary"
  
  # Language stats
  if [ -d "pages" ]; then
    lang_count=$(ls -1 pages 2>/dev/null | wc -l)
    lang_list=$(ls -1 pages 2>/dev/null | tr '\n' ' ')
    echo "- Languages: $lang_count ($lang_list)"
    
    # Page counts per language
    for lang in $lang_list; do
      if [ -d "pages/$lang" ]; then
        page_count=$(find "pages/$lang" -type f \( -name "*.html" -o -name "*.md" \) 2>/dev/null | wc -l)
        echo "  - $lang: $page_count pages"
      fi
    done
  fi

  # Brands collection
  if [ -d "_brands" ]; then
    brand_count=$(find _brands -type f 2>/dev/null | wc -l)
    echo "- Brand profiles: $brand_count"
  fi

  # Blog posts with date ranges
  if [ -d "_posts" ]; then
    post_count=$(find _posts -type f 2>/dev/null | wc -l)
    echo "- Blog posts: $post_count"
    
    # Get date range of posts
    if [ "$post_count" -gt 0 ]; then
      newest_post=$(find _posts -type f -name "*.md" 2>/dev/null | sort | tail -n 1)
      oldest_post=$(find _posts -type f -name "*.md" 2>/dev/null | sort | head -n 1)
      
      newest_date=$(basename "$newest_post" | cut -d'-' -f1-3 | tr '-' '/')
      oldest_date=$(basename "$oldest_post" | cut -d'-' -f1-3 | tr '-' '/')
      
      echo "  - Date range: $oldest_date to $newest_date"
    fi
  fi

  # Translation coverage
  if [ -d "_data/translations" ]; then
    translation_count=$(find _data/translations -type f 2>/dev/null | wc -l)
    echo "- Translation files: $translation_count"
    
    # Compare translation keys across languages
    if [ "$translation_count" -gt 1 ]; then
      echo "  - Translation coverage:"
      primary_lang_file=$(find _data/translations -type f 2>/dev/null | head -n 1)
      primary_lang=$(basename "$primary_lang_file" | cut -d'.' -f1)
      primary_keys=$(grep -o '^\s*[a-zA-Z0-9_]\+:' "$primary_lang_file" 2>/dev/null | wc -l)
      echo "    - $primary_lang (primary): $primary_keys keys"
      
      for trans_file in $(find _data/translations -type f 2>/dev/null | tail -n +2); do
        lang=$(basename "$trans_file" | cut -d'.' -f1)
        keys=$(grep -o '^\s*[a-zA-Z0-9_]\+:' "$trans_file" 2>/dev/null | wc -l)
        if [ "$primary_keys" -gt 0 ]; then
          percentage=$((keys * 100 / primary_keys))
          echo "    - $lang: $keys keys ($percentage% coverage)"
        else
          echo "    - $lang: $keys keys"
        fi
      done
    fi
  fi
  echo ""

  # Key file contents (NEW SECTION)
  echo "## Key File Contents"
  
  # Default layout
  if [ -f "_layouts/default.html" ]; then
    echo "### _layouts/default.html (Structure)"
    echo "\`\`\`html"
    head -n 20 "_layouts/default.html" 2>/dev/null
    echo "... (truncated for brevity) ..."
    echo "\`\`\`"
    echo ""
  fi
  
  # Header include
  if [ -f "_includes/header.html" ]; then
    echo "### _includes/header.html (Navigation)"
    echo "\`\`\`html"
    head -n 15 "_includes/header.html" 2>/dev/null
    echo "... (truncated for brevity) ..."
    echo "\`\`\`"
    echo ""
  fi
  
  # Footer include
  if [ -f "_includes/footer.html" ]; then
    echo "### _includes/footer.html (Newsletter Forms)"
    echo "\`\`\`html"
    grep -A 10 "newsletter" "_includes/footer.html" 2>/dev/null || head -n 15 "_includes/footer.html" 2>/dev/null
    echo "... (truncated for brevity) ..."
    echo "\`\`\`"
    echo ""
  fi
  
  # Main CSS
  if [ -f "assets/css/main.css" ]; then
    echo "### assets/css/main.css (Styling)"
    echo "\`\`\`css"
    head -n 15 "assets/css/main.css" 2>/dev/null
    echo "... (truncated for brevity) ..."
    echo "\`\`\`"
    echo ""
  fi

  # Performance metrics (NEW SECTION)
  echo "## Build Performance"
  
  # Build time if Jekyll is available
  if command -v bundle >/dev/null 2>&1; then
    echo "- Build time (clean): $(JEKYLL_ENV=production bundle exec jekyll build --profile 2>/dev/null | grep 'done in' | tail -n 1 | sed 's/.*done in //')"
    
    # Page count
    if [ -d "_site" ]; then
      html_count=$(find _site -name "*.html" 2>/dev/null | wc -l)
      echo "- Generated HTML pages: $html_count"
      
      # Site size
      site_size=$(du -sh _site 2>/dev/null | cut -f1)
      echo "- Total site size: $site_size"
    fi
  fi
  echo ""

  # Environment and dependencies (ENHANCED)
  echo "## Environment & Dependencies"
  if command -v bundle >/dev/null 2>&1; then
    jekyll_version=$(bundle exec jekyll -v 2>/dev/null | cut -d' ' -f2)
    echo "- Jekyll version: $jekyll_version"
  fi

  if command -v ruby >/dev/null 2>&1; then
    ruby_version=$(ruby -v 2>/dev/null | cut -d' ' -f2)
    echo "- Ruby version: $ruby_version"
  fi
  
  # Key dependencies
  if [ -f "Gemfile.lock" ]; then
    echo "- Key dependencies:"
    grep -A 20 "DEPENDENCIES" Gemfile.lock 2>/dev/null | grep -v "DEPENDENCIES" | grep -v "^$" | head -n 10 | sed 's/^/  - /'
  fi
  echo ""

  # Recent development activity (NEW SECTION)
  echo "## Recent Development Activity"
  
  # Recent commits with more detail
  echo "### Recent Commits"
  git log --pretty=format:"- **%ad**: %s (%an)" --date=short -n 10
  echo ""
  echo ""
  
  # Recently modified files
  echo "### Recently Modified Files"
  git log --name-only --pretty=format:"- **%ad**: %s" --date=short -n 5 | grep -v "^- " | grep -v "^$" | sort | uniq | head -n 15 | sed 's/^/- /'
  echo ""
  echo ""

  # Project log if available
  if [ -f "PROJECT_LOG.md" ]; then
    echo "### Project Log Entries (Last 2)"
    echo ""
    head -n 30 "PROJECT_LOG.md"
    echo ""
    echo "... (see full PROJECT_LOG.md for complete history) ..."
  fi
  echo ""

  # Getting Started (ENHANCED)
  echo "## Getting Started"
  echo "1. Run \`bundle install\` to install dependencies"
  echo "2. Run \`bundle exec jekyll serve\` to start the development server"
  echo "3. Visit http://localhost:4000 to view the site"
  echo ""
  
  # Add multilingual testing instructions
  echo "### Testing Multilingual Support"
  echo "- English: http://localhost:4000/en/"
  echo "- Russian: http://localhost:4000/ru/"
  echo "- Chinese: http://localhost:4000/zh/"
  echo ""

  echo "Generated by enhanced-site-summary script"
}

# Generate and save to file
generate_summary > "$OUTPUT_FILE"
echo "Site summary generated to $OUTPUT_FILE"

# Optionally output to console as well
if [ "$1" == "--display" ]; then
  cat "$OUTPUT_FILE"
fi