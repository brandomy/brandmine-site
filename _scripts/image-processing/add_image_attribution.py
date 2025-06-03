"""
add_image_attribution.py

This script assists with managing image attributions for the Brandmine Jekyll site.
It simplifies the process of recording attribution details for original and third-party images
(e.g., Unsplash) into a centralized YAML file for transparent content usage tracking.

Key Features:
- Extracts attribution details automatically from Unsplash filenames if available.
- Guides users interactively to enter or confirm attribution data.
- Appends new image entries to `_data/image_attributions.yml`.
- Supports adding multiple images in a single session.

Usage:
    python add_image_attribution.py

Author: Randal Eastman
"""
#!/usr/bin/env python3
import os
import yaml
import re

def extract_unsplash_info(filename):
    """Extract creator and ID from Unsplash filename pattern."""
    pattern = r"([a-z-]+)-([a-zA-Z0-9]+)-unsplash"
    match = re.match(pattern, filename)
    
    if match:
        creator = match.group(1).replace('-', ' ').title()
        image_id = match.group(2)
        return {
            'creator': creator,
            'url': f"https://unsplash.com/photos/{image_id}"
        }
    return None

def add_image_attribution():
    original_filename = input("Enter original filename (e.g., andrew-konstantinov-y2kSjuA4Y4E-unsplash.jpg): ")
    new_filename = input("Enter new simplified filename (e.g., moscow-gum.jpg): ")
    category = input("Enter image category (e.g., sectors): ")
    
    # Try to extract info from Unsplash filename pattern
    info = None
    if "unsplash" in original_filename:
        base_filename = os.path.splitext(original_filename)[0]
        info = extract_unsplash_info(base_filename)
    
    # Collect attribution data
    default_creator = info.get("creator", "") if info else ""
    default_url = info.get("url", "") if info else ""
    
    creator_prompt = f"Enter creator name"
    if default_creator:
        creator_prompt += f" (default: {default_creator})"
    creator_prompt += ": "
    
    url_prompt = f"Enter URL"
    if default_url:
        url_prompt += f" (default: {default_url})"
    url_prompt += ": "
    
    source = input("Enter source (default: Unsplash): ") or "Unsplash"
    creator = input(creator_prompt) or default_creator
    url = input(url_prompt) or default_url
    license_text = input("Enter license (default: Unsplash License): ") or "Unsplash License"
    
    attribution = {
        'filename': new_filename,
        'original_name': original_filename,
        'source': source,
        'creator': creator,
        'url': url,
        'license': license_text,
        'path': f"assets/images/{category}/originals/{new_filename}",
        'category': category
    }
    
    # Load existing attributions
    yaml_path = "_data/image_attributions.yml"
    if os.path.exists(yaml_path):
        with open(yaml_path, 'r') as file:
            data = yaml.safe_load(file) or {'images': []}
    else:
        data = {'images': []}
    
    # Add new attribution
    data['images'].append(attribution)
    
    # Write back to file
    with open(yaml_path, 'w') as file:
        yaml.dump(data, file, sort_keys=False, default_flow_style=False)
    
    print(f"Added attribution for {new_filename} to {yaml_path}")
    return True

def main():
    print("===== Image Attribution Tool =====")
    
    continue_adding = True
    count = 0
    
    while continue_adding:
        if count > 0:
            print("\n===== Adding Another Image =====")
        
        add_image_attribution()
        count += 1
        
        response = input("\nWould you like to add another image? (y/n): ").lower()
        continue_adding = response.startswith('y')
    
    print(f"\nCompleted adding {count} image attribution{'s' if count != 1 else ''}.")
    
if __name__ == "__main__":
    main()