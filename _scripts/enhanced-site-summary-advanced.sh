#!/bin/bash

# Enhanced Site Summary Generator with Advanced Features
# - Tag usage trend tracking
# - Extended automatic fixes
# - Untranslated content reporting

# Determine script location and project root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Change to project root to ensure correct path references
cd "$PROJECT_ROOT"

# Default output file
OUTPUT_FILE="site-summary.md"

# Directory for storing historical data
HISTORY_DIR="${SCRIPT_DIR}/_history"
mkdir -p "$HISTORY_DIR"

# Today's date in YYYY-MM-DD format
TODAY=$(date +"%Y-%m-%d")

# History file for today's data
TODAY_HISTORY="${HISTORY_DIR}/tag-stats-${TODAY}.json"

# Languages supported
LANGUAGES=("en" "ru" "zh")

# Function to count lines in a file
count_lines() {
  wc -l "$1" 2>/dev/null | awk '{print $1}'
}

# Function to extract clean tags from a file
extract_tags() {
  local file=$1
  if [ -f "$file" ]; then
    grep "tags:" "$file" 2>/dev/null | sed 's/tags: *\[\|\]//g' | tr ',' '\n' | sed 's/^ *\| *$//g' | tr -d '"' | tr -d "'"
  fi
}

# Function to generate a JSON array of tags from a file
tags_to_json() {
  local file=$1
  if [ -f "$file" ]; then
    local tags=$(extract_tags "$file")
    if [ -n "$tags" ]; then
      echo "$tags" | sed 's/^/"/g' | sed 's/$/"/g' | tr '\n' ',' | sed 's/,$//' | sed 's/^/[/' | sed 's/$/]/'
    else
      echo "[]"
    fi
  else
    echo "[]"
  fi
}

# Function to find equivalent posts in other languages
find_equivalent_posts() {
  local source_file=$1
  local source_lang=$2
  local base_name=$(basename "$source_file" | cut -d'-' -f4- 2>/dev/null)
  
  if [ -n "$base_name" ]; then
    local result=""
    for lang in "${LANGUAGES[@]}"; do
      if [ "$lang" != "$source_lang" ]; then
        local lang_post=$(find "_posts/$lang" -name "*$base_name" 2>/dev/null)
        if [ -n "$lang_post" ]; then
          if [ -n "$result" ]; then
            result="${result}|${lang}:${lang_post}"
          else
            result="${lang}:${lang_post}"
          fi
        fi
      fi
    done
    echo "$result"
  fi
}

# Function to detect tags that should be added to a file
tags_to_add() {
  local file=$1
  local reference_tags=$2
  
  local current_tags=$(extract_tags "$file")
  local to_add=""
  
  # For each reference tag, check if it's in current tags
  for tag in $reference_tags; do
    if ! echo "$current_tags" | grep -q "^$tag$"; then
      if [ -n "$to_add" ]; then
        to_add="${to_add} $tag"
      else
        to_add="$tag"
      fi
    fi
  done
  
  echo "$to_add"
}

# Function to check if a post exists in all languages
check_post_exists_in_all_languages() {
  local source_file=$1
  local source_lang=$2
  local base_name=$(basename "$source_file" | cut -d'-' -f4- 2>/dev/null)
  
  if [ -n "$base_name" ]; then
    local missing=""
    for lang in "${LANGUAGES[@]}"; do
      if [ "$lang" != "$source_lang" ]; then
        local lang_post=$(find "_posts/$lang" -name "*$base_name" 2>/dev/null)
        if [ -z "$lang_post" ]; then
          if [ -n "$missing" ]; then
            missing="${missing}, ${lang}"
          else
            missing="${lang}"
          fi
        fi
      fi
    done
    echo "$missing"
  fi
}

# Function to extract content title from a post
extract_title() {
  local file=$1
  if [ -f "$file" ]; then
    grep "^title:" "$file" 2>/dev/null | sed 's/^title: *//g' | sed 's/^"//g' | sed 's/"$//g' | sed "s/^'//g" | sed "s/'$//g"
  fi
}

# Function to process the main site summary
generate_summary() {
  echo "# Brandmine Site Summary"
  echo "Generated on $(date)"
  echo ""

  # Git status with more details
  echo "## Repository Status"
  echo "Current branch: $(git branch --show-current 2>/dev/null || echo "Not a git repository")"
  echo "Last commit: $(git log -1 --pretty=%B 2>/dev/null || echo "No commits")"
  echo "Last commit date: $(git log -1 --pretty=%cd --date=format:'%Y-%m-%d %H:%M' 2>/dev/null || echo "No commits")"
  echo "Modified files: $(git status -s 2>/dev/null | wc -l | xargs || echo "Not a git repository")"
  echo "Recent activity:"
  git log --pretty=format:"- %ad: %s" --date=short -n 5 2>/dev/null || echo "Not a git repository or no commits"
  echo ""
  echo ""

  # Site structure (enhanced from original)
  echo "## Site Structure"
  echo "### Directories"
  echo "\`\`\`"

  # Layout templates
  if [ -d "_layouts" ]; then
    layout_count=$(ls -1 _layouts 2>/dev/null | wc -l | xargs)
    echo "- _layouts/ ($layout_count files)"
    ls -1 _layouts 2>/dev/null | sed 's/^/  - /'
  fi

  # Include components
  if [ -d "_includes" ]; then
    includes_count=$(ls -1 _includes 2>/dev/null | wc -l | xargs)
    echo "- _includes/ ($includes_count files)"
    ls -1 _includes 2>/dev/null | sed 's/^/  - /'
  fi

  # Data files with more details
  if [ -d "_data" ]; then
    data_count=$(find _data -type f 2>/dev/null | wc -l | xargs)
    echo "- _data/ ($data_count files)"
    find _data -type f 2>/dev/null | sed 's/^/  - /'
  fi

  # Assets with categorization
  if [ -d "assets" ]; then
    asset_count=$(find assets -type f 2>/dev/null | wc -l | xargs)
    echo "- assets/ ($asset_count files total)"
    
    # CSS files
    if [ -d "assets/css" ]; then
      css_count=$(find assets/css -type f -name "*.css" 2>/dev/null | wc -l | xargs)
      echo "  - assets/css/ ($css_count CSS files)"
      find assets/css -type f -name "*.css" 2>/dev/null | sed 's/^/    - /'
    fi
    
    # JavaScript files
    if [ -d "assets/js" ]; then
      js_count=$(find assets/js -type f -name "*.js" 2>/dev/null | wc -l | xargs)
      echo "  - assets/js/ ($js_count JS files)"
      find assets/js -type f -name "*.js" 2>/dev/null | sed 's/^/    - /'
    fi
    
    # Fonts
    if [ -d "assets/fonts" ]; then
      fonts_count=$(find assets/fonts -type f 2>/dev/null | wc -l | xargs)
      echo "  - assets/fonts/ ($fonts_count font files)"
      find assets/fonts -type f 2>/dev/null | head -n 10 | sed 's/^/    - /'
      if [ "$fonts_count" -gt 10 ]; then
        echo "    - ... and $(($fonts_count - 10)) more font files"
      fi
    fi
    
    # Images
    if [ -d "assets/images" ]; then
      images_count=$(find assets/images -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.svg" -o -name "*.gif" \) 2>/dev/null | wc -l | xargs)
      echo "  - assets/images/ ($images_count image files)"
    fi
  fi

  # Pages structure with language-specific details
  if [ -d "pages" ]; then
    echo "- pages/ structure"
    for lang_dir in pages/*; do
      if [ -d "$lang_dir" ]; then
        lang=$(basename "$lang_dir")
        page_count=$(find "$lang_dir" -type f \( -name "*.html" -o -name "*.md" \) 2>/dev/null | wc -l | xargs)
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
  grep -A 5 "title:" _config.yml 2>/dev/null || echo "# No _config.yml found"
  echo "..."
  grep -A 3 "collections:" _config.yml 2>/dev/null || echo "# No collections defined"
  echo "..."
  grep -A 5 "defaults:" _config.yml 2>/dev/null || echo "# No defaults defined"
  echo "..."
  # Add plugin information
  grep -A 10 "plugins:" _config.yml 2>/dev/null || echo "# No plugins defined"
  echo "\`\`\`"
  echo ""

  # Content summary with enhanced metrics
  echo "## Content Summary"
  
  # Language stats
  if [ -d "pages" ]; then
    lang_count=$(ls -1 pages 2>/dev/null | wc -l | xargs)
    lang_list=$(ls -1 pages 2>/dev/null | tr '\n' ' ')
    echo "- Languages: $lang_count ($lang_list)"
    
    # Page counts per language
    for lang in $lang_list; do
      if [ -d "pages/$lang" ]; then
        page_count=$(find "pages/$lang" -type f \( -name "*.html" -o -name "*.md" \) 2>/dev/null | wc -l | xargs)
        echo "  - $lang: $page_count pages"
      fi
    done
  fi

  # Brands collection
  if [ -d "_brands" ]; then
    brand_count=$(find _brands -type f 2>/dev/null | wc -l | xargs)
    echo "- Brand profiles: $brand_count"
  fi

  # Blog posts with date ranges
  if [ -d "_posts" ]; then
    post_count=$(find _posts -type f 2>/dev/null | wc -l | xargs)
    echo "- Blog posts: $post_count"
    
    # Get date range of posts
    if [ "$post_count" -gt 0 ]; then
      newest_post=$(find _posts -type f -name "*.md" 2>/dev/null | sort | tail -n 1)
      oldest_post=$(find _posts -type f -name "*.md" 2>/dev/null | sort | head -n 1)
      
      if [ -n "$newest_post" ] && [ -n "$oldest_post" ]; then
        newest_date=$(basename "$newest_post" | grep -o "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | tr '-' '/')
        oldest_date=$(basename "$oldest_post" | grep -o "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | tr '-' '/')
        
        echo "  - Date range: $oldest_date to $newest_date"
      fi
    fi
  fi

  # Translation coverage
  if [ -d "_data/translations" ]; then
    translation_count=$(find _data/translations -type f 2>/dev/null | wc -l | xargs)
    echo "- Translation files: $translation_count"
    
    # Compare translation keys across languages
    if [ "$translation_count" -gt 1 ]; then
      echo "  - Translation coverage:"
      primary_lang_file=$(find _data/translations -type f 2>/dev/null | head -n 1)
      primary_lang=$(basename "$primary_lang_file" | cut -d'.' -f1)
      primary_keys=$(grep -o '^\s*[a-zA-Z0-9_]\+:' "$primary_lang_file" 2>/dev/null | wc -l | xargs)
      echo "    - $primary_lang (primary): $primary_keys keys"
      
      for trans_file in $(find _data/translations -type f 2>/dev/null | tail -n +2); do
        lang=$(basename "$trans_file" | cut -d'.' -f1)
        keys=$(grep -o '^\s*[a-zA-Z0-9_]\+:' "$trans_file" 2>/dev/null | wc -l | xargs)
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

  # TAG SYSTEM ANALYSIS
  if [ -f "_data/tag_translations.yml" ]; then
    echo "## Tag System Analysis"
    
    echo "### Tag Translation Coverage"
    
    # Count tags by category
    echo "- Total tag categories: $(grep -c "^[a-z]" _data/tag_translations.yml)"
    
    # Count by specific categories
    sectors_count=$(grep -A 1 "^sectors:" _data/tag_translations.yml | grep -c "^  [a-z]")
    attributes_count=$(grep -A 1 "^attributes:" _data/tag_translations.yml | grep -c "^  [a-z]")
    growth_count=$(grep -A 1 "^growth:" _data/tag_translations.yml | grep -c "^  [a-z]")
    countries_count=$(grep -A 1 "^countries:" _data/tag_translations.yml | grep -c "^  [a-z]")
    
    echo "- Sectors: $sectors_count"
    echo "- Attributes: $attributes_count"
    echo "- Growth signals: $growth_count"
    echo "- Countries: $countries_count"
    
    # Check language coverage
    echo "### Language Coverage in Tags"
    echo "- English tags: $(grep -c "en: " _data/tag_translations.yml)"
    echo "- Russian tags: $(grep -c "ru: " _data/tag_translations.yml)"
    echo "- Chinese tags: $(grep -c "zh: " _data/tag_translations.yml)"
    
    # FEATURE 1: TAG USAGE TREND TRACKING
    # First collect current tag usage stats
    echo "### Tag Usage Analysis"
    
    # Initialize the JSON for today's data
    echo "{" > "$TODAY_HISTORY"
    echo "  \"date\": \"$TODAY\"," >> "$TODAY_HISTORY"
    echo "  \"tags\": {" >> "$TODAY_HISTORY"
    
    # Create temp file for storing tag counts
    TAG_COUNTS_TEMP=$(mktemp)
    
    # For each language, count the usage of each tag
    for lang in "${LANGUAGES[@]}"; do
      if [ -d "_posts/$lang" ]; then
        echo "#### Tag usage in $lang content:"
        
        # Extract and count all tags
        all_tags=$(find "_posts/$lang" -type f -name "*.md" -exec extract_tags {} \; 2>/dev/null | sort | uniq -c | sort -nr)
        
        # Display top 10 tags
        echo "$all_tags" | head -10 | sed 's/^/- /'
        
        # Store all tag counts for JSON
        echo "$all_tags" | while read -r count tag; do
          if [ -n "$tag" ]; then
            echo "    \"$lang:$tag\": $count," >> "$TAG_COUNTS_TEMP"
          fi
        done
      fi
    done
    
    # Add counts to JSON file (removing trailing comma from last entry)
    sed '$ s/,$//' "$TAG_COUNTS_TEMP" >> "$TODAY_HISTORY"
    rm "$TAG_COUNTS_TEMP"
    
    # Close the JSON
    echo "  }" >> "$TODAY_HISTORY"
    echo "}" >> "$TODAY_HISTORY"
    
    # Now analyze historical tag usage trends if data exists
    echo "### Tag Usage Trends"
    
    # Find previous history files (at least 7 days apart)
    PREV_FILES=$(find "$HISTORY_DIR" -name "tag-stats-*.json" -not -name "tag-stats-${TODAY}.json" | sort -r | head -5)
    
    if [ -n "$PREV_FILES" ]; then
      echo "Comparing to previous data points:"
      
      # Get list of tags in current data
      CURRENT_TAGS=$(grep -o '"[a-z]\+:[a-z-]\+"' "$TODAY_HISTORY" | tr -d '"' | sort | uniq)
      
      for tag in $CURRENT_TAGS; do
        lang=$(echo "$tag" | cut -d':' -f1)
        tagname=$(echo "$tag" | cut -d':' -f2)
        
        # Get current count
        current_count=$(grep -o "\"$tag\": [0-9]\+" "$TODAY_HISTORY" | grep -o "[0-9]\+")
        
        if [ -n "$current_count" ]; then
          trend=""
          prev_file=""
          
          # Find the most recent previous file that has this tag
          for file in $PREV_FILES; do
            if grep -q "\"$tag\":" "$file"; then
              prev_file="$file"
              break
            fi
          done
          
          if [ -n "$prev_file" ]; then
            prev_date=$(grep -o '"date": "[^"]*"' "$prev_file" | grep -o '[0-9-]\+')
            prev_count=$(grep -o "\"$tag\": [0-9]\+" "$prev_file" | grep -o "[0-9]\+")
            
            if [ "$prev_count" -lt "$current_count" ]; then
              difference=$((current_count - prev_count))
              trend="↑ Increased by $difference since $prev_date"
            elif [ "$prev_count" -gt "$current_count" ]; then
              difference=$((prev_count - current_count))
              trend="↓ Decreased by $difference since $prev_date"
            else
              trend="→ No change since $prev_date"
            fi
            
            # Only report significant changes (more than 1)
            if [ "$trend" != "→ No change since $prev_date" ] && [ "$difference" -gt 1 ]; then
              echo "- Tag '$tagname' in $lang content: $trend ($current_count total uses)"
            fi
          fi
        fi
      done
      
      # Also report on new tags that weren't in previous files
      for tag in $CURRENT_TAGS; do
        exists_in_prev=0
        
        for file in $PREV_FILES; do
          if grep -q "\"$tag\":" "$file"; then
            exists_in_prev=1
            break
          fi
        done
        
        if [ "$exists_in_prev" -eq 0 ]; then
          lang=$(echo "$tag" | cut -d':' -f1)
          tagname=$(echo "$tag" | cut -d':' -f2)
          current_count=$(grep -o "\"$tag\": [0-9]\+" "$TODAY_HISTORY" | grep -o "[0-9]\+")
          
          if [ -n "$current_count" ] && [ "$current_count" -gt 1 ]; then
            echo "- New tag '$tagname' in $lang content: Added since last report ($current_count uses)"
          fi
        fi
      done
    else
      echo "No previous data available for comparison. Usage trends will be available after multiple runs."
    fi
    
    # Popular tags used in content (from original script)
    echo "### Most Used Tags in Content"
    # For each language
    for lang in "${LANGUAGES[@]}"; do
      if [ -d "_posts/$lang" ]; then
        echo "#### Most popular tags in $lang content:"
        grep -h "tags:" "_posts/$lang"/*.md 2>/dev/null | sed 's/tags: \[\|\]//g' | tr ',' '\n' | sed 's/^ *\| *$//g' | sort | uniq -c | sort -nr | head -5 | sed 's/^/- /'
      fi
    done
    echo ""
    
    # TRANSLATION CONSISTENCY CHECKER
    echo "## Translation Consistency"
    echo "### Tag Translation Consistency Check"
    
    # Check for missing translations in tag_translations.yml
    echo "#### Checking for incomplete tag translations:"
    
    # This approach checks each tag to see if it has all three language translations
    grep -n "^  [a-z][a-z-]*:" _data/tag_translations.yml | while read -r line; do
      tag_line=$(echo "$line" | cut -d':' -f1)
      tag_name=$(echo "$line" | sed 's/^[0-9]*:  \([a-z][a-z-]*\):.*/\1/')
      
      # Look for language entries within the next 5 lines
      next_5_lines=$(tail -n +$tag_line _data/tag_translations.yml | head -n 5)
      
      if ! echo "$next_5_lines" | grep -q "en: "; then
        echo "- Tag '$tag_name' missing English translation"
      fi
      
      if ! echo "$next_5_lines" | grep -q "ru: "; then
        echo "- Tag '$tag_name' missing Russian translation"
      fi
      
      if ! echo "$next_5_lines" | grep -q "zh: "; then
        echo "- Tag '$tag_name' missing Chinese translation"
      fi
    done
    echo ""
    
    # CHECK FOR TAG USAGE CONSISTENCY ACROSS LANGUAGES
    echo "### Post Tag Consistency Across Languages"
    
    # Find posts that exist in multiple languages and check for tag consistency
    if [ -d "_posts/en" ]; then
      for en_post in _posts/en/*.md; do
        if [ -f "$en_post" ]; then
          equivalents=$(find_equivalent_posts "$en_post" "en")
          
          if [ -n "$equivalents" ]; then
            en_tags=$(extract_tags "$en_post")
            
            # Check each language version
            IFS='|' read -ra EQUIV_POSTS <<< "$equivalents"
            for equiv in "${EQUIV_POSTS[@]}"; do
              lang=$(echo "$equiv" | cut -d':' -f1)
              post=$(echo "$equiv" | cut -d':' -f2)
              
              # Get tags from this language version
              post_tags=$(extract_tags "$post")
              
              # Check for mismatches
              en_tags_sorted=$(echo "$en_tags" | sort)
              post_tags_sorted=$(echo "$post_tags" | sort)
              
              if [ "$en_tags_sorted" != "$post_tags_sorted" ]; then
                missing_tags=$(tags_to_add "$post" "$en_tags")
                extra_tags=$(tags_to_add "$en_post" "$post_tags")
                
                echo "- Tag mismatch between EN and ${lang^^}: $(basename "$en_post")"
                if [ -n "$missing_tags" ]; then
                  echo "  Tags in EN but missing in ${lang^^}: $missing_tags"
                fi
                if [ -n "$extra_tags" ]; then
                  echo "  Tags in ${lang^^} but missing in EN: $extra_tags"
                fi
              fi
            done
          fi
        fi
      done
    fi
    echo ""
    
    # CHECK FOR UNDEFINED TAGS
    echo "### Undefined Tags Check"
    echo "#### Tags used in posts but not defined in tag_translations.yml:"
    
    # Get all defined tags
    defined_tags=$(grep -o "^  [a-z][a-z-]*:" _data/tag_translations.yml 2>/dev/null | sed 's/://g' | sed 's/^  //' | sort)
    
    # Check for undefined tags in posts
    if [ -d "_posts" ]; then
      for post in _posts/*/*.md; do
        if [ -f "$post" ]; then
          post_tags=$(extract_tags "$post")
          for tag in $post_tags; do
            # Clean up the tag (remove quotes if present)
            clean_tag=$(echo "$tag" | sed 's/"//g')
            if ! echo "$defined_tags" | grep -q "^$clean_tag$"; then
              echo "- \"$clean_tag\" in $(basename "$post")"
            fi
          done
        fi
      done
    fi
  fi
  echo ""
  
  # FEATURE 3: UNTRANSLATED CONTENT REPORTING
  echo "## Untranslated Content Report"
  echo "### Content Missing Translations"
  
  if [ -d "_posts" ]; then
    translated_counts=()
    untranslated_counts=()
    
    # Initialize counts for each language
    for lang in "${LANGUAGES[@]}"; do
      translated_counts[$lang]=0
      untranslated_counts[$lang]=0
    done
    
    # Loop through each language to find untranslated content
    for source_lang in "${LANGUAGES[@]}"; do
      if [ -d "_posts/$source_lang" ]; then
        echo "#### Content in $source_lang missing translations:"
        
        # Get total posts in this language
        total_posts=$(find "_posts/$source_lang" -type f -name "*.md" | wc -l | xargs)
        
        # Track which posts need translation
        need_translation=0
        
        for source_post in _posts/$source_lang/*.md; do
          if [ -f "$source_post" ]; then
            missing_langs=$(check_post_exists_in_all_languages "$source_post" "$source_lang")
            
            if [ -n "$missing_langs" ]; then
              title=$(extract_title "$source_post")
              if [ -z "$title" ]; then
                title="$(basename "$source_post")"
              fi
              echo "- \"$title\" missing in: $missing_langs"
              need_translation=$((need_translation + 1))
              
              # Update counts for target languages
              IFS=',' read -ra MISSING <<< "$missing_langs"
              for missing_lang in "${MISSING[@]}"; do
                missing_lang=$(echo "$missing_lang" | tr -d ' ')
                untranslated_counts[$missing_lang]=$((untranslated_counts[$missing_lang] + 1))
              done
            else
              # Fully translated content
              for lang in "${LANGUAGES[@]}"; do
                if [ "$lang" != "$source_lang" ]; then
                  translated_counts[$lang]=$((translated_counts[$lang] + 1))
                fi
              done
            fi
          fi
        done
        
        # Show percentage that needs translation
        if [ "$total_posts" -gt 0 ]; then
          percent_needing_translation=$((need_translation * 100 / total_posts))
          echo "$need_translation out of $total_posts posts ($percent_needing_translation%) need translation"
        fi
        echo ""
      fi
    done
    
    # Summary of translation status
    echo "### Translation Status Summary"
    
    for target_lang in "${LANGUAGES[@]}"; do
      if [ -d "_posts/$target_lang" ]; then
        native_posts=$(find "_posts/$target_lang" -type f -name "*.md" | wc -l | xargs)
        translated=${translated_counts[$target_lang]}
        untranslated=${untranslated_counts[$target_lang]}
        
        if [ "$native_posts" -gt 0 ]; then
          translated_percent=$((translated * 100 / (translated + untranslated)))
          echo "- $target_lang: $translated_percent% of content available ($translated translated, $untranslated missing)"
        fi
      fi
    done
    echo ""
  fi
  
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
      html_count=$(find _site -name "*.html" 2>/dev/null | wc -l | xargs)
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
  git log --pretty=format:"- **%ad**: %s (%an)" --date=short -n 10 2>/dev/null || echo "No git history available"
  echo ""
  echo ""
  
  # Recently modified files
  echo "### Recently Modified Files"
  git log --name-only --pretty=format:"- **%ad**: %s" --date=short -n 5 2>/dev/null | grep -v "^- " | grep -v "^$" | sort | uniq | head -n 15 | sed 's/^/- /' || echo "No git history available"
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

# FEATURE 2: EXPANDED AUTOMATIC FIXES
perform_fixes() {
  echo "Applying enhanced fixes..."
  
  # 1. Convert underscores to hyphens in front matter tags
  echo "- Converting underscore tags to hyphens in posts..."
  find _posts -type f -name "*.md" -exec sed -i '' 's/tags: \[\(.*\)_\(.*\)/tags: \[\1-\2/g' {} \;
  
  # 2. Standardize spacing in front matter
  echo "- Standardizing tag spacing in front matter..."
  find _posts -type f -name "*.md" -exec sed -i '' 's/tags: \[\([^]]*\)\]/tags: \[\1\]/g; s/, /,/g; s/,/, /g' {} \;
  
  # 3. Fix missing country entries in translation files if needed
  for lang_file in _data/translations/*.yml; do
    lang=$(basename "$lang_file" | cut -d'.' -f1)
    if ! grep -q "countries:" "$lang_file"; then
      echo "- Adding missing 'countries' entry to $lang translation file..."
      if [ "$lang" == "en" ]; then
        echo "  countries: \"Countries\"" >> "$lang_file"
      elif [ "$lang" == "ru" ]; then
        echo "  countries: \"Страны\"" >> "$lang_file"
      elif [ "$lang" == "zh" ]; then
        echo "  countries: \"国家\"" >> "$lang_file"
      fi
    fi
  done
  
  # ENHANCED: Align tag usage across language versions
  if [ "$1" == "--align-tags" ]; then
    echo "- Aligning tags across language versions..."
    
    # Start with English posts and propagate tags to other languages
    if [ -d "_posts/en" ]; then
      for en_post in _posts/en/*.md; do
        if [ -f "$en_post" ]; then
          equivalents=$(find_equivalent_posts "$en_post" "en")
          
          if [ -n "$equivalents" ]; then
            en_tags=$(extract_tags "$en_post")
            
            # For each equivalent post, update tags to match English
            IFS='|' read -ra EQUIV_POSTS <<< "$equivalents"
            for equiv in "${EQUIV_POSTS[@]}"; do
              lang=$(echo "$equiv" | cut -d':' -f1)
              post=$(echo "$equiv" | cut -d':' -f2)
              
              # Get current tags from this language version
              post_tags=$(extract_tags "$post")
              
              # Check if tags differ
              en_tags_sorted=$(echo "$en_tags" | sort)
              post_tags_sorted=$(echo "$post_tags" | sort)
              
              if [ "$en_tags_sorted" != "$post_tags_sorted" ]; then
                # Create a new tag list formatted properly
                new_tags=$(echo "$en_tags" | tr '\n' ',' | sed 's/,/, /g')
                
                # Update the post with the new tags
                sed -i '' "/^tags:/c\tags: [$new_tags]" "$post"
                echo "  Updated tags in $(basename "$post") to match English version"
              fi
            done
          fi
        fi
      done
    fi
  fi
  
  # ENHANCED: Fix undefined tags by adding them to tag_translations.yml
  if [ "$1" == "--fix-undefined" ] && [ -f "_data/tag_translations.yml" ]; then
    echo "- Adding undefined tags to tag_translations.yml..."
    
    # Get all defined tags
    defined_tags=$(grep -o "^  [a-z][a-z-]*:" _data/tag_translations.yml | sed 's/://g' | sed 's/^  //' | sort)
    
    # Temporary file to collect undefined tags
    UNDEFINED_TAGS_TEMP=$(mktemp)
    
    # Find all tags used in posts
    for post in _posts/*/*.md; do
      if [ -f "$post" ]; then
        post_tags=$(extract_tags "$post")
        for tag in $post_tags; do
          # Clean up the tag
          clean_tag=$(echo "$tag" | sed 's/"//g')
          if ! echo "$defined_tags" | grep -q "^$clean_tag$"; then
            # Determine which category this tag belongs to (basic heuristic)
            category="attributes"  # Default category
            
            # Try to determine category based on naming patterns
            if echo "$clean_tag" | grep -q "ready$"; then
              category="growth"
            elif echo "$clean_tag" | grep -q "^[a-z][a-z]*$" && [ ${#clean_tag} -lt 10 ]; then
              # Country names are typically short single words
              category="countries"
            elif echo "$clean_tag" | grep -q "-"; then
              # Sectors often have compound names
              category="sectors"
            fi
            
            # Add to our collection if not already there
            if ! grep -q "^$clean_tag:$category$" "$UNDEFINED_TAGS_TEMP"; then
              echo "$clean_tag:$category" >> "$UNDEFINED_TAGS_TEMP"
            fi
          fi
        done
      fi
    done
    
    # Add each undefined tag to the appropriate section of tag_translations.yml
    if [ -s "$UNDEFINED_TAGS_TEMP" ]; then
      while read -r line; do
        tag=$(echo "$line" | cut -d':' -f1)
        category=$(echo "$line" | cut -d':' -f2)
        
        # Check if tag already exists in any category (full check)
        if ! grep -q "^  $tag:" _data/tag_translations.yml; then
          # Find the end of the appropriate category section
          category_line=$(grep -n "^$category:" _data/tag_translations.yml | cut -d':' -f1)
          
          if [ -n "$category_line" ]; then
            # Find the next category line or end of file
            next_category_line=$(tail -n +$((category_line+1)) _data/tag_translations.yml | grep -n "^[a-z]" | head -1 | cut -d':' -f1)
            
            if [ -n "$next_category_line" ]; then
              # Insert before the next category
              insert_line=$((category_line + next_category_line - 1))
            else
              # Insert at end of file
              insert_line=$(wc -l < _data/tag_translations.yml)
            fi
            
            # Create the new tag entry
            tag_entry="  $tag:\n    en: \"$(echo "$tag" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')\"\n    ru: \"$(echo "$tag" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')\"\n    zh: \"$(echo "$tag" | sed 's/-/ /g')\""
            
            # Insert the new tag entry
            if [ "$insert_line" -eq "$(wc -l < _data/tag_translations.yml)" ]; then
              # Add to end of file
              echo -e "\n$tag_entry" >> _data/tag_translations.yml
            else
              # Insert at the determined position using temporary file
              head -n $insert_line _data/tag_translations.yml > /tmp/tag_translations_temp.yml
              echo -e "\n$tag_entry" >> /tmp/tag_translations_temp.yml
              tail -n +$((insert_line+1)) _data/tag_translations.yml >> /tmp/tag_translations_temp.yml
              mv /tmp/tag_translations_temp.yml _data/tag_translations.yml
            fi
            
            echo "  Added tag '$tag' to the $category category in tag_translations.yml"
          fi
        fi
      done < "$UNDEFINED_TAGS_TEMP"
    fi
    
    rm "$UNDEFINED_TAGS_TEMP"
  fi
  
  # ENHANCED: Generate translation templates for untranslated content
  if [ "$1" == "--generate-translations" ]; then
    echo "- Generating translation templates for untranslated content..."
    
    # Create templates directory if it doesn't exist
    mkdir -p "_translations/templates"
    
    # Start with English posts
    if [ -d "_posts/en" ]; then
      for en_post in _posts/en/*.md; do
        if [ -f "$en_post" ]; then
          base_name=$(basename "$en_post" | cut -d'-' -f4- 2>/dev/null)
          
          if [ -n "$base_name" ]; then
            # Check which language versions are missing
            for lang in ru zh; do
              lang_post=$(find "_posts/$lang" -name "*$base_name" 2>/dev/null)
              
              if [ -z "$lang_post" ]; then
                # Create date structure for the new post
                date_part=$(basename "$en_post" | cut -d'-' -f1-3)
                new_post_name="${date_part}-${base_name}"
                template_path="_translations/templates/${lang}-${new_post_name}"
                
                # Don't overwrite existing templates
                if [ ! -f "$template_path" ]; then
                  # Copy the English post as a template
                  cp "$en_post" "$template_path"
                  
                  # Update the language in front matter
                  sed -i '' "s/^lang: en/lang: $lang/" "$template_path"
                  
                  # Add translation needed comment
                  sed -i '' "/^---/a # TRANSLATION NEEDED: Translate this content from English to $([ "$lang" = "ru" ] && echo "Russian" || echo "Chinese")" "$template_path"
                  
                  echo "  Created translation template for $new_post_name in $lang"
                fi
              fi
            done
          fi
        fi
      done
    fi
  fi
  
  echo "Enhanced fixes applied. Please review changes before committing."
}

# Main execution
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  echo "Enhanced Site Summary Generator with Advanced Features"
  echo ""
  echo "Usage:"
  echo "  $0 [options]"
  echo ""
  echo "Options:"
  echo "  --display           Display the summary after generating it"
  echo "  --fix               Apply basic fixes (spacing, hyphens, etc.)"
  echo "  --fix --align-tags  Also align tags across language versions of same post"
  echo "  --fix --fix-undefined  Also add undefined tags to tag_translations.yml"
  echo "  --fix --generate-translations  Create translation templates for missing content"
  echo "  --help, -h          Show this help message"
  echo ""
  echo "Examples:"
  echo "  $0                  Generate summary to site-summary.md"
  echo "  $0 --display        Generate and display summary"
  echo "  $0 --fix            Fix common issues"
  echo "  $0 --fix --align-tags --fix-undefined  Apply all fixes"
  exit 0
fi

# Check if we need to perform fixes
if [ "$1" == "--fix" ] || [ "$2" == "--fix" ] || [ "$3" == "--fix" ]; then
  # Get advanced fix options
  align_tags=""
  fix_undefined=""
  generate_translations=""
  
  if [[ "$*" == *"--align-tags"* ]]; then
    align_tags="--align-tags"
  fi
  
  if [[ "$*" == *"--fix-undefined"* ]]; then
    fix_undefined="--fix-undefined"
  fi
  
  if [[ "$*" == *"--generate-translations"* ]]; then
    generate_translations="--generate-translations"
  fi
  
  # Perform the fixes
  perform_fixes "$align_tags" "$fix_undefined" "$generate_translations"
fi

# Generate and save to file
generate_summary > "$OUTPUT_FILE"
echo "Site summary generated to $OUTPUT_FILE"

# Optionally output to console as well
if [[ "$*" == *"--display"* ]]; then
  cat "$OUTPUT_FILE"
fi



    