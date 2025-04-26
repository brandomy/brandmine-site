#!/usr/bin/env python3
# tag_to_dimension_analyzer.py

import os
import re
import csv
from pathlib import Path

def scan_files_for_tags(base_dir='.'):
    """
    Scan files for tag references and categorize them by file type and context
    """
    results = []
    extensions = ['.html', '.md', '.yml', '.css', '.js', '.scss']
    skip_dirs = ['node_modules', '.git', '_site', '.jekyll-cache', '.sass-cache']
    
    # Regex patterns
    css_class_pattern = re.compile(r'\.tag[_-][a-zA-Z0-9_-]+|\.tag\s')
    html_tag_pattern = re.compile(r'class="[^"]*tag[^"]*"')
    liquid_tag_pattern = re.compile(r'{%\s*include[^}]*tag[^}]*%}|{%\s*for[^}]*tag[^}]*%}|{%\s*assign[^}]*tag[^}]*%}')
    front_matter_pattern = re.compile(r'tag_type:|tags:')
    
    for root, dirs, files in os.walk(base_dir):
        # Skip excluded directories
        dirs[:] = [d for d in dirs if d not in skip_dirs]
        
        for file in files:
            file_path = os.path.join(root, file)
            file_ext = os.path.splitext(file)[1].lower()
            
            if file_ext not in extensions:
                continue
                
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                # Find matches based on file type
                css_matches = []
                html_matches = []
                liquid_matches = []
                front_matter_matches = []
                
                if file_ext in ['.css', '.scss']:
                    css_matches = re.findall(css_class_pattern, content)
                
                if file_ext in ['.html', '.md']:
                    html_matches = re.findall(html_tag_pattern, content)
                    liquid_matches = re.findall(liquid_tag_pattern, content)
                
                if file_ext in ['.md', '.yml']:
                    front_matter_matches = re.findall(front_matter_pattern, content)
                
                # If any matches were found, record the file
                if css_matches or html_matches or liquid_matches or front_matter_matches:
                    results.append({
                        'file_path': file_path,
                        'file_type': file_ext[1:],
                        'css_matches': len(css_matches),
                        'html_matches': len(html_matches),
                        'liquid_matches': len(liquid_matches),
                        'front_matter_matches': len(front_matter_matches),
                        'total_matches': len(css_matches) + len(html_matches) + len(liquid_matches) + len(front_matter_matches)
                    })
            except Exception as e:
                print(f"Error processing {file_path}: {e}")
    
    return results

def identify_duplicate_content(base_dir='.'):
    """
    Identify duplicate content across _tags, _discovery, and _dimensions directories
    """
    duplicates = []
    
    # Map file paths to content hashes
    slug_map = {}
    
    # Check the three directories
    for dir_name in ['_tags', '_discovery', '_dimensions']:
        dir_path = os.path.join(base_dir, dir_name)
        if not os.path.exists(dir_path):
            continue
            
        # Walk through the directory structure
        for root, dirs, files in os.walk(dir_path):
            for file in files:
                if not file.endswith('.md'):
                    continue
                    
                file_path = os.path.join(root, file)
                
                # Extract key info
                rel_path = os.path.relpath(file_path, dir_path)
                lang = rel_path.split(os.sep)[0] if os.sep in rel_path else ''
                cat = rel_path.split(os.sep)[1] if len(rel_path.split(os.sep)) > 1 else ''
                slug = os.path.splitext(os.path.basename(file_path))[0]
                
                key = f"{lang}/{cat}/{slug}"
                
                if key not in slug_map:
                    slug_map[key] = []
                
                slug_map[key].append(file_path)
    
    # Find duplicates
    for key, paths in slug_map.items():
        if len(paths) > 1:
            lang, cat, slug = key.split('/')
            duplicates.append({
                'slug': slug,
                'language': lang,
                'category': cat,
                'paths': paths
            })
    
    return duplicates

def generate_css_update_commands(base_dir='.'):
    """
    Generate sed commands to update CSS class names
    """
    commands = []
    
    css_files = []
    for root, dirs, files in os.walk(base_dir):
        for file in files:
            if file.endswith('.css') or file.endswith('.scss'):
                file_path = os.path.join(root, file)
                css_files.append(file_path)
    
    # CSS class replacements - fixed escape sequences
    replacements = [
        (r'\.tag([^a-zA-Z0-9_-])', r'.dimension\1'),  # .tag to .dimension
        (r'\.tag_', r'.dimension_'),                  # .tag_ to .dimension_
        (r'\.tag-', r'.dimension-'),                  # .tag- to .dimension-
        ('tag--', 'dimension--'),                      # tag-- to dimension--
        ('__tag', '__dimension'),                      # __tag to __dimension
        ('-tag', '-dimension'),                        # -tag to -dimension
        ('tag__', 'dimension__')                       # tag__ to dimension__
    ]
    
    for file_path in css_files:
        for pattern, replacement in replacements:
            commands.append(f"sed -i '' 's/{pattern}/{replacement}/g' {file_path}")
    
    return commands

def generate_html_update_commands(base_dir='.'):
    """
    Generate sed commands to update HTML/Liquid tag references
    """
    commands = []
    
    html_files = []
    for root, dirs, files in os.walk(base_dir):
        for file in files:
            if file.endswith('.html') or file.endswith('.md'):
                file_path = os.path.join(root, file)
                html_files.append(file_path)
    
    # HTML class name replacements
    replacements = [
        ('class="([^"]*)\btag\b([^"]*)"', 'class="\\1dimension\\2"'),
        ('class="([^"]*)tag--([^"]*)"', 'class="\\1dimension--\\2"'),
        ('class="([^"]*)tag__([^"]*)"', 'class="\\1dimension__\\2"'),
        ('class="([^"]*)-tag([^"]*)"', 'class="\\1-dimension\\2"'),
        ('class="([^"]*)tag-([^"]*)"', 'class="\\1dimension-\\2"'),
    ]
    
    # Liquid template replacements
    liquid_replacements = [
        ('{%\\s*for\\s+tag\\s+in', '{% for dimension in'),
        ('{%\\s*assign\\s+tags', '{% assign dimensions'),
        ('include[^}]*tag-([^}]*)', 'include dimension-\\1'),
        ('site.tags', 'site.dimensions'),
        ('page.tags', 'page.dimensions'),
        ('include[^}]*tag_([^}]*)', 'include dimension_\\1'),
    ]
    
    for file_path in html_files:
        for pattern, replacement in replacements:
            commands.append(f"sed -i '' 's/{pattern}/{replacement}/g' {file_path}")
        
        for pattern, replacement in liquid_replacements:
            commands.append(f"sed -i '' 's/{pattern}/{replacement}/g' {file_path}")
    
    return commands

def generate_merge_script():
    """
    Generate a script to merge _tags and _discovery content into _dimensions
    """
    script_content = """#!/bin/bash

# Script to merge content from _tags and _discovery to _dimensions

# First, ensure _dimensions directory exists
mkdir -p _dimensions

# Function to copy and update front matter
copy_and_update() {
    local src="$1"
    local dest="$2"
    local src_type="$3"
    local dest_type="dimensions"
    
    # Create destination directory if it doesn't exist
    mkdir -p "$(dirname "$dest")"
    
    # Copy the file
    cp "$src" "$dest"
    
    # Update front matter
    if [ "$src_type" = "tags" ]; then
        sed -i '' 's/tag_type:/dimension_type:/g' "$dest"
        sed -i '' 's/^tag:/dimension:/g' "$dest"
    elif [ "$src_type" = "discovery" ]; then
        sed -i '' 's/discovery_type:/dimension_type:/g' "$dest"
        sed -i '' 's/^discovery:/dimension:/g' "$dest"
    fi
    
    echo "Processed: $src → $dest"
}

# Process each language
for lang in en ru zh; do
    echo "Processing language: $lang"
    
    # Process each dimension type
    for dim_type in sectors markets attributes signals; do
        echo "  Processing dimension type: $dim_type"
        
        # Create destination directory
        mkdir -p "_dimensions/$lang/$dim_type"
        
        # Process files from _tags
        if [ -d "_tags/$lang/$dim_type" ]; then
            for src in _tags/$lang/$dim_type/*.md; do
                if [ -f "$src" ]; then
                    # Determine destination path
                    dest="${src/_tags/_dimensions}"
                    copy_and_update "$src" "$dest" "tags"
                fi
            done
        fi
        
        # Process files from _discovery
        if [ -d "_discovery/$lang/$dim_type" ]; then
            for src in _discovery/$lang/$dim_type/*.md; do
                if [ -f "$src" ]; then
                    # Determine destination path
                    dest="${src/_discovery/_dimensions}"
                    
                    # Only copy if not already processed from _tags
                    if [ ! -f "$dest" ]; then
                        copy_and_update "$src" "$dest" "discovery"
                    else
                        echo "Skipping (already exists): $src"
                    fi
                fi
            done
        fi
    done
done

echo "Content merge complete!"
echo "NOTE: After verifying everything works, you can remove the _tags and _discovery directories"
echo "rm -rf _tags _discovery"
"""
    
    with open('merge_dimensions.sh', 'w') as f:
        f.write(script_content)

def generate_reports(base_dir='.'):
    """
    Generate comprehensive reports
    """
    # Scan for tag references
    tag_references = scan_files_for_tags(base_dir)
    
    # Sort by number of matches (highest first)
    tag_references.sort(key=lambda x: x['total_matches'], reverse=True)
    
    # Write CSV report
    with open('tag_references.csv', 'w', newline='') as csvfile:
        fieldnames = ['file_path', 'file_type', 'css_matches', 'html_matches', 
                      'liquid_matches', 'front_matter_matches', 'total_matches']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for ref in tag_references:
            writer.writerow(ref)
    
    # Find duplicate content
    duplicates = identify_duplicate_content(base_dir)
    
    # Write duplicates report
    with open('duplicate_content.csv', 'w', newline='') as csvfile:
        fieldnames = ['slug', 'language', 'category', 'paths']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for dup in duplicates:
            writer.writerow({
                'slug': dup['slug'],
                'language': dup['language'],
                'category': dup['category'],
                'paths': ', '.join(dup['paths'])
            })
    
    # Generate CSS update commands
    css_commands = generate_css_update_commands(base_dir)
    
    with open('update_css.sh', 'w') as f:
        f.write("#!/bin/bash\n\n")
        f.write("# Script to update CSS class names\n\n")
        for cmd in css_commands:
            f.write(f"{cmd}\n")
    
    # Generate HTML update commands
    html_commands = generate_html_update_commands(base_dir)
    
    with open('update_html.sh', 'w') as f:
        f.write("#!/bin/bash\n\n")
        f.write("# Script to update HTML and Liquid references\n\n")
        for cmd in html_commands:
            f.write(f"{cmd}\n")
    
    # Generate merge script
    generate_merge_script()
    
    return {
        'tag_references': len(tag_references),
        'duplicates': len(duplicates),
        'css_commands': len(css_commands),
        'html_commands': len(html_commands)
    }

if __name__ == "__main__":
    print("Analyzing site for tag to dimension transition...")
    stats = generate_reports()
    print(f"Found {stats['tag_references']} files with tag references")
    print(f"Found {stats['duplicates']} duplicate content items")
    print(f"Generated {stats['css_commands']} CSS update commands")
    print(f"Generated {stats['html_commands']} HTML/Liquid update commands")
    print("\nReports and scripts generated:")
    print("- tag_references.csv - List of all files with tag references")
    print("- duplicate_content.csv - List of duplicate content across directories")
    print("- update_css.sh - Script to update CSS class names")
    print("- update_html.sh - Script to update HTML and Liquid references")
    print("- merge_dimensions.sh - Script to merge content from _tags and _discovery to _dimensions")
    print("\nPlease review these files before running the scripts!")