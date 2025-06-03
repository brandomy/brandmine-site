#!/usr/bin/env python3
"""
Generate cached navigation HTML for Jekyll performance optimization

Pre-generates navigation HTML for each language to eliminate runtime translation lookups.
"""

import os
import yaml
import json
from pathlib import Path

def load_navigation_data(lang):
    """Load navigation structure for a language"""
    nav_file = Path(f"_data/navigation/{lang}.yml")
    if nav_file.exists():
        with open(nav_file, 'r', encoding='utf-8') as f:
            return yaml.safe_load(f)
    return []

def load_translations(lang):
    """Load translations for a language"""
    trans_file = Path(f"_data/translations/{lang}.yml")
    if trans_file.exists():
        with open(trans_file, 'r', encoding='utf-8') as f:
            return yaml.safe_load(f)
    return {}

def generate_nav_cache(lang, nav_items, translations):
    """Generate cached navigation data for a language"""
    cache_items = []
    
    for item in nav_items:
        key = item['name'].replace('nav.', '')
        translated_text = translations.get('nav', {}).get(key, key.title())
        
        cache_item = {
            'text': translated_text,
            'link': item['link'],
            'key': key
        }
        
        if 'children' in item:
            cache_item['children'] = []
            for child in item['children']:
                child_key = child['name'].replace('nav.', '')
                child_text = translations.get('nav', {}).get(child_key, child_key.title())
                cache_item['children'].append({
                    'text': child_text,
                    'link': child['link'],
                    'key': child_key
                })
        
        cache_items.append(cache_item)
    
    return cache_items

def main():
    languages = ['en', 'ru', 'zh']
    navigation_cache = {}
    
    for lang in languages:
        print(f"Processing navigation for {lang}...")
        
        nav_items = load_navigation_data(lang)
        translations = load_translations(lang)
        
        navigation_cache[lang] = generate_nav_cache(lang, nav_items, translations)
    
    # Ensure output directory exists
    output_dir = Path('_data')
    output_dir.mkdir(exist_ok=True)
    
    # Write navigation cache
    output_file = output_dir / 'navigation_cache.json'
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(navigation_cache, f, indent=2, ensure_ascii=False)
    
    print(f"Navigation cache saved to: {output_file}")
    
    # Statistics
    total_items = sum(len(items) for items in navigation_cache.values())
    print(f"Cached {total_items} navigation items across {len(languages)} languages")

if __name__ == '__main__':
    main()