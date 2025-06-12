#!/usr/bin/env python3
"""
Analyze markdown files with sections defined in front matter
and compare them with defaults in _data/page_sections.yml
"""

import os
import yaml
import re
from pathlib import Path

def extract_front_matter(file_path):
    """Extract YAML front matter from markdown file."""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check if file has front matter
    if not content.startswith('---'):
        return None
    
    # Find the closing --- for front matter
    pattern = r'^---\s*\n(.*?)\n---'
    match = re.match(pattern, content, re.DOTALL)
    
    if match:
        try:
            return yaml.safe_load(match.group(1))
        except yaml.YAMLError:
            return None
    return None

def load_page_sections():
    """Load the page sections configuration."""
    config_path = Path('_data/page_sections.yml')
    if not config_path.exists():
        print(f"Warning: {config_path} not found")
        return {}
    
    with open(config_path, 'r', encoding='utf-8') as f:
        return yaml.safe_load(f)

def analyze_sections():
    """Analyze all markdown files with sections."""
    # Load page sections configuration
    page_sections = load_page_sections()
    
    # Find all markdown files
    results = {
        'matches_defaults': [],
        'custom_sections': [],
        'no_layout': [],
        'no_sections': []
    }
    
    # Define paths to check
    paths_to_check = [
        'pages',
        '_brands',
        '_founders',
        '_insights',
        '_posts'
    ]
    
    for base_path in paths_to_check:
        if not os.path.exists(base_path):
            continue
            
        for root, dirs, files in os.walk(base_path):
            for file in files:
                if file.endswith('.md'):
                    file_path = os.path.join(root, file)
                    front_matter = extract_front_matter(file_path)
                    
                    if not front_matter:
                        continue
                    
                    # Check if file has sections defined
                    if 'sections' not in front_matter:
                        results['no_sections'].append(file_path)
                        continue
                    
                    # Get layout
                    layout = front_matter.get('layout')
                    if not layout:
                        results['no_layout'].append(file_path)
                        continue
                    
                    # Get default sections for this layout
                    if layout in page_sections:
                        default_sections = page_sections[layout].get('default_sections', [])
                        file_sections = front_matter.get('sections', [])
                        
                        # Compare sections
                        if file_sections == default_sections:
                            results['matches_defaults'].append({
                                'file': file_path,
                                'layout': layout,
                                'sections': file_sections
                            })
                        else:
                            results['custom_sections'].append({
                                'file': file_path,
                                'layout': layout,
                                'file_sections': file_sections,
                                'default_sections': default_sections,
                                'added': [s for s in file_sections if s not in default_sections],
                                'removed': [s for s in default_sections if s not in file_sections]
                            })
    
    return results

def print_report(results):
    """Print analysis report."""
    print("# Section Analysis Report\n")
    
    print(f"## Summary")
    print(f"- Files matching defaults: {len(results['matches_defaults'])}")
    print(f"- Files with custom sections: {len(results['custom_sections'])}")
    print(f"- Files with no layout: {len(results['no_layout'])}")
    print(f"- Files with no sections: {len(results['no_sections'])}")
    print()
    
    if results['matches_defaults']:
        print("## Files Matching Defaults (can remove sections)")
        print("These files define sections that exactly match the defaults and can have their sections removed:\n")
        for item in results['matches_defaults']:
            print(f"- `{item['file']}` (layout: {item['layout']})")
        print()
    
    if results['custom_sections']:
        print("## Files with Custom Sections")
        print("These files have sections that differ from the defaults:\n")
        for item in results['custom_sections']:
            print(f"### {item['file']}")
            print(f"- Layout: `{item['layout']}`")
            if item['added']:
                print(f"- Added sections: {', '.join(item['added'])}")
            if item['removed']:
                print(f"- Removed/commented sections: {', '.join(item['removed'])}")
            print(f"- Current sections: {', '.join(item['file_sections'])}")
            print(f"- Default sections: {', '.join(item['default_sections'])}")
            print()

if __name__ == '__main__':
    os.chdir('/Users/randaleastman/Documents/brandmine-site')
    results = analyze_sections()
    print_report(results)