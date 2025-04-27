"""
language_consistency_checker.py

This script checks for language consistency across the Brandmine Jekyll site.
It analyzes the content files in the 'pages' directory and verifies that all
expected language versions (English, Russian, Chinese) exist for each page.

Key Features:
- Detects missing language versions for each logical page group.
- Extracts useful metadata (title, permalink) from front matter.
- Generates a clear, styled HTML report summarizing inconsistencies.
- Helps maintain a professional, fully localized site structure.

Usage:
    python language_consistency_checker.py --site-dir . --output report.html

Author: [Your Name]
"""
#!/usr/bin/env python3
# language_consistency_checker.py

import os
import csv
import argparse
from collections import defaultdict
from pathlib import Path
import yaml

def extract_front_matter(file_path):
    """Extract Jekyll front matter from a file"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
            if content.startswith('---'):
                _, front_matter, _ = content.split('---', 2)
                return yaml.safe_load(front_matter)
            return {}
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return {}

def main():
    parser = argparse.ArgumentParser(description='Check language consistency across Jekyll site')
    parser.add_argument('--site-dir', default='.', help='Path to Jekyll site directory')
    parser.add_argument('--output', default='language_consistency_report.html', help='Output HTML report file')
    args = parser.parse_args()
    
    # Find all content files
    file_paths = []
    for root, _, files in os.walk(os.path.join(args.site_dir, 'pages')):
        for file in files:
            if file.endswith(('.md', '.html')):
                file_paths.append(os.path.join(root, file))
    
    # Group by path structure
    path_groups = defaultdict(list)
    
    for file_path in file_paths:
        # Extract language from path
        rel_path = os.path.relpath(file_path, args.site_dir)
        path_parts = Path(rel_path).parts
        
        if len(path_parts) >= 2 and path_parts[0] == 'pages':
            lang = path_parts[1]
            
            # Extract the rest of the path
            path_suffix = '/'.join(path_parts[2:])
            
            # Get front matter for additional info
            front_matter = extract_front_matter(file_path)
            title = front_matter.get('title', 'No title')
            permalink = front_matter.get('permalink', '')
            
            # Add to group
            key = path_suffix
            path_groups[key].append({
                'file': rel_path,
                'lang': lang,
                'title': title,
                'permalink': permalink
            })
    
    # Find inconsistencies
    expected_langs = ['en', 'ru', 'zh']
    inconsistencies = []
    
    for path, pages in path_groups.items():
        langs_present = [p['lang'] for p in pages]
        missing_langs = [l for l in expected_langs if l not in langs_present]
        
        if missing_langs:
            inconsistencies.append({
                'path': path,
                'missing_langs': missing_langs,
                'existing_pages': pages
            })
    
    # Generate HTML report
    html = f"""<!DOCTYPE html>
<html>
<head>
    <title>Language Consistency Report</title>
    <style>
        body {{ font-family: Arial, sans-serif; line-height: 1.6; padding: 20px; max-width: 1200px; margin: 0 auto; }}
        h1, h2 {{ color: #2c7a7b; }}
        .summary {{ background-color: #f3f4f6; padding: 15px; border-radius: 5px; margin-bottom: 20px; }}
        .issue {{ background-color: #fff; padding: 15px; border: 1px solid #e5e7eb; border-radius: 5px; margin-bottom: 15px; }}
        .status-ok {{ background-color: #d1fae5; }}
        .status-warning {{ background-color: #ffedd5; }}
        .status-error {{ background-color: #fee2e2; }}
        table {{ border-collapse: collapse; width: 100%; }}
        th, td {{ border: 1px solid #e5e7eb; padding: 8px; text-align: left; }}
        th {{ background-color: #f9fafb; }}
    </style>
</head>
<body>
    <h1>Language Consistency Report</h1>
    
    <div class="summary {{'status-ok' if not inconsistencies else 'status-error'}}">
        <h2>Summary</h2>
        <p>Total paths analyzed: {len(path_groups)}</p>
        <p>Inconsistent paths: {len(inconsistencies)}</p>
        <p>Status: {'✅ All paths are consistent across languages' if not inconsistencies else '❌ Some paths are missing language versions'}</p>
    </div>
    """
    
    if inconsistencies:
        html += """
    <h2>Inconsistencies</h2>
    """
        
        for i, issue in enumerate(inconsistencies):
            html += f"""
    <div class="issue">
        <h3>Issue #{i+1}: {issue['path']}</h3>
        <p>Missing languages: {', '.join(issue['missing_langs'])}</p>
        
        <h4>Existing pages:</h4>
        <table>
            <tr>
                <th>Language</th>
                <th>File</th>
                <th>Title</th>
                <th>Permalink</th>
            </tr>
    """
            
            for page in issue['existing_pages']:
                html += f"""
            <tr>
                <td>{page['lang']}</td>
                <td>{page['file']}</td>
                <td>{page['title']}</td>
                <td>{page['permalink']}</td>
            </tr>
    """
            
            html += """
        </table>
    </div>
    """
    
    html += """
</body>
</html>
    """
    
    # Write the report
    with open(args.output, 'w', encoding='utf-8') as f:
        f.write(html)
    
    print(f"Report generated: {args.output}")
    if inconsistencies:
        print(f"Found {len(inconsistencies)} inconsistencies out of {len(path_groups)} paths.")
    else:
        print("✅ All paths are consistent across languages")

if __name__ == '__main__':
    main()