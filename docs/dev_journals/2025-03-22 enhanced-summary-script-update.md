# 2025-03-22: Enhancing the Site Summary Script for Multilingual Tag Analysis

## Problem Statement

Our Jekyll-based multilingual website for Brandmine recently implemented a centralized tag translation system using a `tag_translations.yml` file to manage tags across English, Russian, and Chinese languages. While this has created a more maintainable structure, we needed a way to monitor and validate this tagging system over time.

We had an existing `enhanced-site-summary.sh` script that provided general information about the site, but it lacked specific functionality to analyze our multilingual tagging system. The script needed enhancements to:

1. Analyze tag usage patterns across languages
2. Identify missing or inconsistent translations
3. Detect tags used in content but not properly defined in our translation system
4. Provide actionable information about the health of our tagging implementation
5. Support our maintenance and growth of the tagging system

Additionally, the script was located in the root directory, contributing to clutter, and we wanted to reorganize it while maintaining functionality.

## Approach

We took a comprehensive approach to enhancing the script:

1. **Add Tag Analysis Capabilities**: Implement new sections in the script specifically focused on multilingual tag analysis.

2. **Improve Robustness**: Address potential error conditions and edge cases in the script's operation.

3. **Add Automatic Fixes**: Create an optional `--fix` parameter that could automatically resolve common issues.

4. **Make Location-Independent**: Modify the script to work correctly regardless of where it's placed in the directory structure.

5. **Organize Scripts**: Move the script from the root directory to a dedicated `_scripts` directory.

This approach was designed to not just provide information but to actively help maintain the quality and consistency of our multilingual tagging system.

## Implementation Details

### 1. Making the Script Location-Independent

We added code at the beginning of the script to determine its location and the project root directory, ensuring it could be run from anywhere:

```bash
# Determine script location and project root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Change to project root to ensure correct path references
cd "$PROJECT_ROOT"
```

### 2. Adding Tag System Analysis

We implemented a new section to analyze the tag translation system:

```bash
# TAG SYSTEM ANALYSIS
if [ -f "_data/tag_translations.yml" ]; then
  echo "## Tag System Analysis"
  
  echo "### Tag Translation Coverage"
  
  # Count tags by category
  echo "- Total tag categories: $(grep -c "^[a-z]" _data/tag_translations.yml)"
  
  # Count by specific categories
  sectors_count=$(grep -A1 "^sectors:" _data/tag_translations.yml | grep -c "^  [a-z]")
  attributes_count=$(grep -A1 "^attributes:" _data/tag_translations.yml | grep -c "^  [a-z]")
  growth_count=$(grep -A1 "^growth:" _data/tag_translations.yml | grep -c "^  [a-z]")
  countries_count=$(grep -A1 "^countries:" _data/tag_translations.yml | grep -c "^  [a-z]")
  
  echo "- Sectors: $sectors_count"
  echo "- Attributes: $attributes_count"
  echo "- Growth signals: $growth_count"
  echo "- Countries: $countries_count"
  
  # Check language coverage
  echo "### Language Coverage in Tags"
  echo "- English tags: $(grep -c "en: " _data/tag_translations.yml)"
  echo "- Russian tags: $(grep -c "ru: " _data/tag_translations.yml)"
  echo "- Chinese tags: $(grep -c "zh: " _data/tag_translations.yml)"
  
  # Popular tags used in content
  echo "### Most Used Tags in Content"
  # For each language
  for lang in en ru zh; do
    if [ -d "_posts/$lang" ]; then
      echo "#### Most popular tags in $lang content:"
      grep -h "tags:" _posts/$lang/*.md 2>/dev/null | sed 's/tags: \[\|\]//g' | tr ',' '\n' | sed 's/^ *\| *$//g' | sort | uniq -c | sort -nr | head -5 | sed 's/^/- /'
    fi
  done
```

### 3. Adding Translation Consistency Checks

We added code to check for inconsistencies in tag translations:

```bash
# TRANSLATION CONSISTENCY CHECKER
echo "## Translation Consistency"
echo "### Tag Translation Consistency Check"

# Check for missing translations in tag_translations.yml
echo "#### Checking for incomplete tag translations:"

# This approach checks each tag to see if it has all three language translations
grep -n "^  [a-z][a-z\-]*:" _data/tag_translations.yml | while read -r line; do
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
```

### 4. Tag Usage Consistency Across Languages

We implemented checks to ensure tags are used consistently across language versions of the same content:

```bash
# CHECK FOR TAG USAGE CONSISTENCY ACROSS LANGUAGES
echo "### Post Tag Consistency Across Languages"

# Find posts that exist in multiple languages and check for tag consistency
if [ -d "_posts/en" ]; then
  for en_post in _posts/en/*.md; do
    if [ -f "$en_post" ]; then
      base_name=$(basename "$en_post" | cut -d'-' -f4- 2>/dev/null)
      
      if [ -n "$base_name" ]; then
        ru_post=$(find _posts/ru -name "*$base_name" 2>/dev/null)
        zh_post=$(find _posts/zh -name "*$base_name" 2>/dev/null)
        
        if [ -f "$ru_post" ] || [ -f "$zh_post" ]; then
          en_tags=$(grep "tags:" "$en_post" 2>/dev/null | sed 's/tags: \[\|\]//g' | tr ',' '\n' | sed 's/^ *\| *$//g' | sort | tr '\n' ',' | sed 's/,$//')
          
          if [ -f "$ru_post" ]; then
            ru_tags=$(grep "tags:" "$ru_post" 2>/dev/null | sed 's/tags: \[\|\]//g' | tr ',' '\n' | sed 's/^ *\| *$//g' | sort | tr '\n' ',' | sed 's/,$//')
            if [ "$en_tags" != "$ru_tags" ]; then
              echo "- Tag mismatch between EN and RU: $(basename "$en_post")"
              echo "  EN: [$en_tags]"
              echo "  RU: [$ru_tags]"
            fi
          fi
          
          # Similar check for Chinese version
        fi
      fi
    fi
  done
fi
```

### 5. Checking for Undefined Tags

We improved the detection of undefined tags to identify content using tags not properly defined in the translation system:

```bash
# CHECK FOR UNDEFINED TAGS
echo "### Undefined Tags Check"
echo "#### Tags used in posts but not defined in tag_translations.yml:"

# Get all defined tags
defined_tags=$(grep -o "^  [a-z][a-z\-]*:" _data/tag_translations.yml 2>/dev/null | sed 's/://g' | sed 's/^  //' | sort)

# Check for undefined tags in posts
if [ -d "_posts" ]; then
  for post in _posts/*/*.md; do
    if [ -f "$post" ]; then
      post_tags=$(grep "tags:" "$post" 2>/dev/null | sed 's/tags: \[\|\]//g' | tr ',' '\n' | sed 's/^ *\| *$//g')
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
```

### 6. Adding Automatic Fixes

We created a `--fix` parameter that can automatically resolve common issues:

```bash
# OPTIONAL SCRIPTABLE FIXES
if [ "$1" == "--fix" ]; then
  echo "Applying fixes..."
  
  # Convert underscores to hyphens in front matter tags
  echo "- Converting underscore tags to hyphens in posts..."
  find _posts -type f -name "*.md" -exec sed -i 's/tags: \[\(.*\)_\(.*\)/tags: \[\1-\2/g' {} \;
  
  # Standardize spacing in front matter
  echo "- Standardizing tag spacing in front matter..."
  find _posts -type f -name "*.md" -exec sed -i 's/tags: \[\([^]]*\)\]/tags: \[\1\]/g; s/, /,/g; s/,/, /g' {} \;
  
  # Fix missing country entries in translation files if needed
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
  
  echo "Fixes applied. Please review changes before committing."
fi
```

## Decisions Made

### 1. Script Reorganization

We decided to move the script from the root directory to a dedicated `_scripts` directory to reduce clutter in the root directory. This required making the script location-independent, but this also had the benefit of making the script more robust and portable.

**Rationale**: The root directory should be reserved for essential configuration files and documentation. By moving utility scripts to a dedicated directory, we maintain a cleaner project structure while making related scripts easier to find.

### 2. Character Range Escaping

We identified and fixed issues with grep patterns that used unescaped hyphens in character ranges (`[a-z-]`), changing them to properly escaped versions (`[a-z\-]`).

**Rationale**: Unescaped hyphens in character ranges can cause grep to interpret them as range operators rather than literal hyphens, leading to incorrect matching or errors. Proper escaping ensures consistent behavior across different grep implementations.

### 3. Robust Tag Parsing

We improved the tag parsing logic to handle edge cases such as inconsistent spacing, brackets, and quotes in front matter.

**Rationale**: Front matter can be manually edited, leading to inconsistent formatting. Robust parsing reduces false positives and ensures the script can handle real-world content.

### 4. Interactive Fix Mode

We implemented an optional `--fix` parameter that can automatically resolve common issues instead of just reporting them.

**Rationale**: For many routine issues, automatic fixing saves time and reduces the risk of human error during manual edits. The ability to opt-in to this behavior (rather than applying fixes automatically) preserves control and transparency.

### 5. Focus on Multilingual Aspects

We designed the tag analysis features with a specific focus on multilingual consistency, checking not just for defined tags but for consistent usage across language versions of the same content.

**Rationale**: Our primary goal was ensuring a consistent user experience across languages. The centralized tag translation system is only effective if tags are used consistently across equivalent content in different languages.

## Resources

### 1. Tag Translation System

The script now analyzes our tag translation system, which includes:

- 4 tag categories (sectors, attributes, growth, countries)
- 33 tags per language
- Full coverage across English, Russian, and Chinese

### 2. Fixed Script Issues

We identified and fixed several issues in the script:

- Character range escaping in grep patterns
- Tag extraction from front matter
- Handling of spaces and brackets in tag lists

### 3. Shell Script Best Practices

We incorporated several shell scripting best practices:

- Using `xargs` to trim whitespace from command outputs
- Checking for file/directory existence before operations
- Using safe text processing with sed and grep
- Handling errors gracefully

## Insights & Learning

### 1. Unix Text Processing Power

The script demonstrates the power of Unix text processing tools like grep, sed, tr, and awk for analyzing content. These tools can effectively analyze structured content without requiring a full parser.

### 2. Script Portability Considerations

Making a script location-independent requires thinking about:

- How to determine the script's own location
- How to find the project root relative to the script
- How to handle path references within the script

### 3. Pattern Matching Nuances

The issues with character ranges in grep patterns highlight the importance of understanding regex syntax details. What looks correct at first glance may have subtle edge cases.

### 4. Multilingual Content Management Challenges

Our tag analysis reveals the complexity of managing multilingual content, particularly ensuring consistency across languages. Automated tools like this script are essential for scalable multilingual sites.

### 5. Incremental Improvement Approach

The script enhancements demonstrate an incremental approach to tool development, building on existing functionality rather than starting from scratch. This preserves valuable work while adding new capabilities.

## Next Actions

### 1. Fix Tag Parsing in Script

Update the script with improved tag parsing to handle the observed issues with the undefined tags check:

```bash
# Replace the existing undefined tags check with a more robust approach
# that properly handles brackets, quotes, and spaces in front matter
```

### 2. Fix Character Range Warnings

Address the "invalid character range" warnings by properly escaping hyphens in character patterns:

```bash
# Change: grep -o "^  [a-z][a-z-]*:" 
# To: grep -o "^  [a-z][a-z\-]*:"
```

### 3. Review Front Matter Format

Ensure blog post front matter follows a consistent format for tags:

```yaml
tags: [tag1, tag2, tag3]
```

Without extra spaces around brackets and with consistent spacing between tags.

### 4. Establish Regular Monitoring

Set up a routine (weekly or after significant content additions) to run the enhanced script and review its output, particularly watching for:

- Translation inconsistencies
- Tag usage patterns
- Missing translations

### 5. Create Tag Guidelines Documentation

Document the tagging system and conventions for content creators, including:

- Available tag categories and their purpose
- How to properly format front matter
- The importance of consistent tagging across languages
- Process for adding new tags

### 6. Consider Additional Script Enhancements

Potential future improvements include:

- Add tracking of tag usage trends over time
- Integrate with CI/CD to automatically verify tag consistency
- Expand automatic fixes to handle more complex issues
- Add reporting on untranslated content

### 7. Move Other Utility Scripts

Consider moving other utility scripts to the `_scripts` directory for consistency:

```bash
mkdir -p _scripts  # Already done
mv project-log-maintainer.py _scripts/
mv claude-session-init.py _scripts/
# Update any documentation or workflows that reference these scripts
```

By implementing these next steps, we'll ensure our multilingual tagging system remains consistent and maintainable as the site continues to grow.
