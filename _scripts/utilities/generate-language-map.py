#!/usr/bin/env python3
"""
Generate language navigation map for Jekyll performance optimization

This script pre-generates a mapping of page references to their language variants,
eliminating expensive runtime lookups in the language selector.
"""

import os
import json
import yaml
from pathlib import Path
import argparse
from collections import defaultdict

def extract_front_matter(file_path):
    """Extract front matter from a Jekyll file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if not content.startswith('---'):
        return None, content
    
    try:
        # Split the content by front matter delimiters
        parts = content.split('---', 2)
        if len(parts) < 3:
            return None, content
        
        front_matter = yaml.safe_load(parts[1])
        content_body = parts[2]
        
        return front_matter, content_body
    except yaml.YAMLError:
        return None, content

def scan_pages(base_path):
    """Scan all Jekyll pages and extract language navigation data"""
    pages_data = []
    
    # Scan pages directory
    pages_dir = base_path / "pages"
    if pages_dir.exists():
        for lang_dir in pages_dir.iterdir():
            if lang_dir.is_dir() and lang_dir.name in ['en', 'ru', 'zh']:
                for page_file in lang_dir.rglob("*.md"):
                    front_matter, _ = extract_front_matter(page_file)
                    if front_matter:
                        pages_data.append({
                            'ref': front_matter.get('ref'),
                            'lang': front_matter.get('lang', lang_dir.name),
                            'url': front_matter.get('permalink', f"/{lang_dir.name}/{page_file.stem}/"),
                            'layout': front_matter.get('layout'),
                            'title': front_matter.get('title', ''),
                            'file_path': str(page_file.relative_to(base_path))
                        })
    
    # Scan collections
    for collection_dir in ['_brands', '_founders', '_insights', '_dimensions']:
        collection_path = base_path / collection_dir
        if collection_path.exists():
            for lang_dir in collection_path.iterdir():
                if lang_dir.is_dir() and lang_dir.name in ['en', 'ru', 'zh']:
                    for item_file in lang_dir.glob("*.md"):
                        front_matter, _ = extract_front_matter(item_file)
                        if front_matter:
                            pages_data.append({
                                'ref': front_matter.get('ref'),
                                'lang': front_matter.get('lang', lang_dir.name),
                                'url': front_matter.get('permalink', ''),
                                'layout': front_matter.get('layout'),
                                'title': front_matter.get('title', ''),
                                'file_path': str(item_file.relative_to(base_path)),
                                'collection': collection_dir[1:]  # Remove underscore
                            })
    
    return pages_data

def generate_language_map(pages_data):
    """Generate language navigation map"""
    # Group pages by ref
    ref_groups = defaultdict(list)
    
    for page in pages_data:
        if page['ref']:
            ref_groups[page['ref']].append(page)
    
    # Create navigation map
    language_map = {}
    
    for ref, pages in ref_groups.items():
        if len(pages) > 1:  # Only include refs with multiple languages
            lang_variants = {}
            for page in pages:
                lang_variants[page['lang']] = {
                    'url': page['url'],
                    'title': page['title']
                }
            
            language_map[ref] = lang_variants
    
    return language_map

def main():
    parser = argparse.ArgumentParser(description='Generate language navigation map')
    parser.add_argument('--output', default='_data/language_map.json', 
                        help='Output file path (default: _data/language_map.json)')
    parser.add_argument('--verbose', action='store_true', 
                        help='Enable verbose output')
    
    args = parser.parse_args()
    
    base_path = Path('.')
    
    print("Scanning Jekyll pages...")
    pages_data = scan_pages(base_path)
    
    if args.verbose:
        print(f"Found {len(pages_data)} total pages")
    
    print("Generating language navigation map...")
    language_map = generate_language_map(pages_data)
    
    if args.verbose:
        print(f"Generated mappings for {len(language_map)} page references")
    
    # Ensure output directory exists
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    # Write the language map
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(language_map, f, indent=2, ensure_ascii=False)
    
    print(f"Language map saved to: {output_path}")
    
    # Generate statistics
    total_refs = len(language_map)
    full_coverage = sum(1 for variants in language_map.values() if len(variants) == 3)
    partial_coverage = total_refs - full_coverage
    
    print(f"\nStatistics:")
    print(f"- Total page references: {total_refs}")
    print(f"- Full language coverage (EN/RU/ZH): {full_coverage}")
    print(f"- Partial language coverage: {partial_coverage}")

if __name__ == '__main__':
    main()