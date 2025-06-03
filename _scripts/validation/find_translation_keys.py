#!/usr/bin/env python3
import os
import re
import csv
from collections import defaultdict

# Regular expression to find translation key references in Jekyll templates
# This pattern looks for site.data.translations[page.lang].key.subkey
TRANSLATION_PATTERN = re.compile(r'site\.data\.translations\[[\w\.]+\]\.([\w\.]+)')

def scan_directory(directory):
    """Scan directory for Jekyll templates and extract translation keys."""
    translation_keys = defaultdict(set)
    
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(('.html', '.md')):
                file_path = os.path.join(root, file)
                relative_path = os.path.relpath(file_path, directory)
                
                with open(file_path, 'r', encoding='utf-8') as f:
                    try:
                        content = f.read()
                        matches = TRANSLATION_PATTERN.findall(content)
                        for match in matches:
                            translation_keys[match].add(relative_path)
                    except UnicodeDecodeError:
                        print(f"Error reading file: {file_path}")
    
    return translation_keys

def write_results_to_csv(translation_keys, output_file):
    """Write translation keys and their usage to a CSV file."""
    with open(output_file, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['Translation Key', 'Used In'])
        
        for key, files in sorted(translation_keys.items()):
            writer.writerow([key, ', '.join(sorted(files))])

if __name__ == '__main__':
    # Directories to scan
    directories_to_scan = [
        '_includes',
        '_layouts',
        'pages'
    ]
    
    all_keys = defaultdict(set)
    
    for directory in directories_to_scan:
        if os.path.exists(directory):
            print(f"Scanning {directory}...")
            keys = scan_directory(directory)
            for key, files in keys.items():
                all_keys[key].update(files)
        else:
            print(f"Directory not found: {directory}")
    
    # Write results to CSV
    output_file = 'translation_key_usage.csv'
    write_results_to_csv(all_keys, output_file)
    print(f"Results written to {output_file}")