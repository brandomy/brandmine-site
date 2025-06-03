#!/usr/bin/env python3
import os
import yaml
import csv
import re
from collections import defaultdict

def flatten_dict(dictionary, parent_key='', separator='.'):
    """Flatten a nested dictionary into a single level with dot notation keys."""
    items = []
    for key, value in dictionary.items():
        new_key = f"{parent_key}{separator}{key}" if parent_key else key
        if isinstance(value, dict):
            items.extend(flatten_dict(value, new_key, separator).items())
        else:
            items.append((new_key, value))
    return dict(items)

def load_translation_files(directory):
    """Load all translation YAML files from a directory."""
    translations = {}
    
    if not os.path.exists(directory):
        print(f"Directory not found: {directory}")
        return translations
    
    for file in os.listdir(directory):
        if file.endswith('.yml'):
            language = file.split('.')[0]
            file_path = os.path.join(directory, file)
            
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    data = yaml.safe_load(f)
                    translations[language] = flatten_dict(data)
            except Exception as e:
                print(f"Error loading {file_path}: {e}")
    
    return translations

def load_used_keys(csv_file):
    """Load translation keys used in templates from CSV file."""
    used_keys = set()
    
    if not os.path.exists(csv_file):
        print(f"File not found: {csv_file}")
        return used_keys
    
    with open(csv_file, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        next(reader)  # Skip header
        for row in reader:
            if row:
                key = row[0]
                # Handle both regular keys and keys with subkeys
                # e.g., "insights.latest" and "insights"
                used_keys.add(key)
                # Add parent keys
                parts = key.split('.')
                for i in range(1, len(parts)):
                    used_keys.add('.'.join(parts[:i]))
    
    return used_keys

def compare_translations(translations, used_keys):
    """Compare translation keys across language files and check for missing keys."""
    languages = list(translations.keys())
    
    # Check for consistency across languages
    all_keys = set()
    for lang_keys in translations.values():
        all_keys.update(lang_keys.keys())
    
    # Check for missing translations
    missing_translations = defaultdict(list)
    for key in all_keys:
        for lang in languages:
            if key not in translations[lang]:
                missing_translations[key].append(lang)
    
    # Check for unused translations
    unused_translations = defaultdict(list)
    for lang in languages:
        for key in translations[lang]:
            if key not in used_keys:
                # Check if any parent key is used
                parts = key.split('.')
                parent_used = False
                for i in range(1, len(parts)):
                    if '.'.join(parts[:i]) in used_keys:
                        parent_used = True
                        break
                
                if not parent_used:
                    unused_translations[key].append(lang)
    
    # Check for used but undefined translations
    undefined_translations = []
    for key in used_keys:
        if all(key not in translations[lang] for lang in languages):
            undefined_translations.append(key)
    
    return {
        'missing': missing_translations,
        'unused': unused_translations,
        'undefined': undefined_translations
    }

def write_comparison_results(results, output_file):
    """Write comparison results to a CSV file."""
    with open(output_file, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['Issue Type', 'Translation Key', 'Details'])
        
        # Write missing translations
        for key, langs in results['missing'].items():
            writer.writerow(['Missing', key, f"Missing in: {', '.join(langs)}"])
        
        # Write unused translations
        for key, langs in results['unused'].items():
            writer.writerow(['Unused', key, f"Unused in: {', '.join(langs)}"])
        
        # Write undefined translations
        for key in results['undefined']:
            writer.writerow(['Undefined', key, "Used in templates but not defined in any language file"])

if __name__ == '__main__':
    # Load translation keys used in templates
    used_keys_file = 'translation_key_usage.csv'
    used_keys = load_used_keys(used_keys_file)
    
    # Load translation files
    translations_dir = '_data/translations'
    translations = load_translation_files(translations_dir)
    
    # Compare translations
    results = compare_translations(translations, used_keys)
    
    # Write results to CSV
    output_file = 'translation_comparison.csv'
    write_comparison_results(results, output_file)
    print(f"Comparison results written to {output_file}")
    
    # Print summary
    print("\nSummary:")
    print(f"Missing translations: {len(results['missing'])} keys")
    print(f"Unused translations: {len(results['unused'])} keys")
    print(f"Undefined translations: {len(results['undefined'])} keys")