# scripts/yml_to_json_converter.py
import yaml
import json
import os
from pathlib import Path

def convert_yml_to_json():
    # Define paths
    yml_dir = Path("_data/brands")
    json_dir = Path("_exports/brands_json")

    # Create output directory
    json_dir.mkdir(parents=True, exist_ok=True)

    # Process each language
    for lang in ['en', 'ru', 'zh']:
        lang_yml_dir = yml_dir / lang
        lang_json_dir = json_dir / lang
        lang_json_dir.mkdir(exist_ok=True)

        # Convert each YML file
        for yml_file in lang_yml_dir.glob("*.yml"):
            with open(yml_file, 'r', encoding='utf-8') as f:
                data = yaml.safe_load(f)

            # Apply any transformations needed for Airtable
            airtable_data = transform_for_airtable(data)

            # Write JSON
            json_file = lang_json_dir / yml_file.with_suffix('.json').name
            with open(json_file, 'w', encoding='utf-8') as f:
                json.dump(airtable_data, f, indent=2, ensure_ascii=False)

    print("Conversion complete!")

def transform_for_airtable(data):
    """Transform nested structure to Airtable's flat structure if needed"""
    # Airtable prefers flatter structures, so we might need to flatten
    flat_data = data.copy()

    # Flatten social media if needed
    if 'social_media' in data:
        for platform, url in data['social_media'].items():
            if platform != 'regional':
                flat_data[f'social_{platform}'] = url

        # Handle regional social media
        if 'regional' in data['social_media']:
            for platform, url in data['social_media']['regional'].items():
                flat_data[f'social_{platform}'] = url

        del flat_data['social_media']

    return flat_data

if __name__ == "__main__":
    convert_yml_to_json()
