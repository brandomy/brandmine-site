#!/usr/bin/env python3
import os
import re

def find_include_references(directory):
    include_refs = {}
    pattern = re.compile(r'{%\s*include\s+([^}\s]+)')
    
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(('.html', '.md')):
                filepath = os.path.join(root, file)
                try:
                    with open(filepath, 'r', encoding='utf-8') as f:
                        content = f.read()
                        matches = pattern.findall(content)
                        for match in matches:
                            if match not in include_refs:
                                include_refs[match] = []
                            include_refs[match].append(filepath)
                except UnicodeDecodeError:
                    print(f"Could not read {filepath} - not a text file")
    
    return include_refs

# Directories to search
dirs_to_search = ['_layouts', 'pages', '_brands', '_insights', '_includes']
all_references = {}

for directory in dirs_to_search:
    if os.path.exists(directory):
        references = find_include_references(directory)
        for include, files in references.items():
            if include not in all_references:
                all_references[include] = []
            all_references[include].extend(files)

# Print results in a sorted manner
for include in sorted(all_references.keys()):
    print(f"Include: {include}")
    for file in sorted(all_references[include]):
        print(f"  - {file}")
    print()