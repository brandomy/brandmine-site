#!/usr/bin/env python3
"""
convert_googledoc_to_jekyll.py
Purpose: Converts Google Doc templates to Jekyll Markdown files
Usage: python3 convert_googledoc_to_jekyll.py input.txt template_type lang [output_dir]
Template types: brand, insight-spotlight, insight-journey
Languages: en, ru, zh
This script helps non-technical team members convert content to Jekyll format
"""

import sys
import re
import yaml
import os
from datetime import datetime

def parse_google_doc(content, template_type='brand'):
    """
    Parse Google Doc content and extract structured data
    Returns a dictionary of extracted fields
    """
    data = {}
    lines = content.strip().split('\n')
    current_section = None
    section_content = {}

    for line in lines:
        # Skip empty lines
        if not line.strip():
            continue

        # Check for section headers (lines starting with ##)
        if line.startswith('## '):
            current_section = line.replace('## ', '').strip()
            section_content[current_section] = []
            continue

        # Check for labeled fields (Key: Value)
        if ':' in line and current_section is None:
            key, value = line.split(':', 1)
            key = key.strip()
            value = value.strip()

            # Convert key to snake_case
            key_snake = key.lower().replace(' ', '_').replace('-', '_')

            # Handle lists (comma-separated values)
            if ',' in value:
                data[key_snake] = [v.strip() for v in value.split(',')]
            # Handle coordinates
            elif key_snake == 'coordinates':
                coords = value.split(',')
                if len(coords) == 2:
                    data['location_lng'] = float(coords[0].strip())
                    data['location_lat'] = float(coords[1].strip())
            # Handle boolean values
            elif value.lower() in ['true', 'false']:
                data[key_snake] = value.lower() == 'true'
            # Handle numeric values
            elif value.isdigit():
                data[key_snake] = int(value)
            else:
                data[key_snake] = value

        # Collect section content
        elif current_section:
            section_content[current_section].append(line)

    # Join section content
    for section, lines in section_content.items():
        section_content[section] = '\n'.join(lines).strip()

    return data, section_content

def generate_jekyll_markdown(data, sections, template_type='brand', lang='en'):
    """
    Generate Jekyll Markdown file with YAML front matter
    """
    # Set language in data
    data['lang'] = lang

    # Generate filename and permalink based on template type
    if template_type == 'brand':
        data.setdefault('layout', 'brand')

        # Generate permalink using simple country code prefix
        if 'permalink' not in data:
            data['permalink'] = f"/{lang}/brands/{data['ref']}/"

        # Generate image paths using ref
        if 'logo' not in data:
            data['logo'] = f"/assets/images/brands/{data['ref']}/logo-color.png"
        if 'hero_image' not in data:
            data['hero_image'] = f"/assets/images/brands/{data['ref']}/hero-main.jpg"

    elif template_type.startswith('insight'):
        data.setdefault('layout', 'insight')
        data.setdefault('featured', False)
        data.setdefault('premium', False)
        data.setdefault('date', datetime.now().strftime('%Y-%m-%d'))

        # Set category based on template type
        if template_type == 'insight-spotlight':
            data.setdefault('category', 'brand-spotlight')
        elif template_type == 'insight-journey':
            data.setdefault('category', 'founders-journey')

        # Generate permalink
        if 'permalink' not in data:
            data['permalink'] = f"/{lang}/insights/{data['ref']}/"

        # Generate image paths
        if 'hero_image' not in data:
            data['hero_image'] = f"/assets/images/insights/{data['ref']}/hero-main.jpg"

    # Create YAML front matter
    yaml_data = yaml.dump(data, default_flow_style=False, sort_keys=False)

    # Build Markdown content
    markdown = f"---\n{yaml_data}---\n\n"

    # Add sections
    for section_title, content in sections.items():
        markdown += f"## {section_title}\n\n{content}\n\n"

    return markdown

def main():
    if len(sys.argv) < 4:
        print("Usage: python3 convert_googledoc_to_jekyll.py input.txt template_type lang [output_dir]")
        print("Template types: brand, insight-spotlight, insight-journey")
        print("Languages: en, ru, zh")
        sys.exit(1)

    input_file = sys.argv[1]
    template_type = sys.argv[2]
    lang = sys.argv[3]
    output_dir = sys.argv[4] if len(sys.argv) > 4 else None

    # Read input file
    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        print(f"Error reading input file: {e}")
        sys.exit(1)

    # Parse content
    data, sections = parse_google_doc(content, template_type)

    # Generate Markdown
    markdown = generate_jekyll_markdown(data, sections, template_type, lang)

    # Determine output file path
    if output_dir:
        os.makedirs(output_dir, exist_ok=True)
        output_file = os.path.join(output_dir, f"{data['ref']}.md")
    else:
        if template_type == 'brand':
            output_dir = f"_brands/{lang}"
        else:
            output_dir = f"_insights/{lang}"
        os.makedirs(output_dir, exist_ok=True)
        output_file = os.path.join(output_dir, f"{data['ref']}.md")

    # Write output file
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(markdown)
        print(f"Successfully created {output_file}")
    except Exception as e:
        print(f"Error writing output file: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
