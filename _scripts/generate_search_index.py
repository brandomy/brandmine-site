#!/usr/bin/env python3
"""
generate_search_index.py
Purpose: Generate comprehensive JSON search indexes from Jekyll Markdown files
Creates brands.json and founders.json with all available fields
Fixed version that properly handles multilingual content and metadata


Q: does it process founder and brand data from Insights articles?

"""

import os
import json
import yaml
import re
from pathlib import Path

def extract_front_matter(content):
    """Extract YAML front matter from markdown content"""
    if content.startswith('---'):
        try:
            end = content.find('---', 3)
            if end != -1:
                yaml_content = content[3:end].strip()
                return yaml.safe_load(yaml_content)
        except yaml.YAMLError as e:
            print(f"YAML parsing error: {e}")
    return {}

def get_multilingual_field(base_path, ref, field, fallback_lang='en'):
    """Get field value for all languages for a specific ref"""
    data = {}

    # Check for matching filename (assuming filename matches ref)
    for lang in ['en', 'ru', 'zh']:
        file_path = os.path.join(base_path, lang, f"{ref}.md")
        if os.path.exists(file_path):
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                front_matter = extract_front_matter(content)
                if field in front_matter:
                    data[lang] = front_matter[field]

    # If we don't have data for a language, use the fallback language
    if fallback_lang in data:
        for lang in ['en', 'ru', 'zh']:
            if lang not in data:
                data[lang] = data[fallback_lang]

    return data

def extract_country_from_ref(ref):
    """Extract country code from ref (e.g., 'ru-teatime' -> 'ru')"""
    if '-' in ref:
        return ref.split('-')[0]
    return None

def generate_brands_json():
    """Generate brands.json with all available fields"""
    brands = []
    brands_dir = '_brands'
    processed_refs = set()  # Track processed refs to avoid duplicates

    # First, collect all unique refs
    all_refs = set()
    for lang_dir in ['en', 'ru', 'zh']:
        lang_path = os.path.join(brands_dir, lang_dir)
        if not os.path.exists(lang_path):
            continue

        for filename in os.listdir(lang_path):
            if filename.endswith('.md'):
                # Extract ref from filename (remove .md extension)
                ref = filename[:-3]
                all_refs.add(ref)

    # Process each unique ref
    for ref in sorted(all_refs):
        if ref in processed_refs:
            continue

        processed_refs.add(ref)

        # Get data from first available language file (as template)
        template_data = None
        for lang in ['en', 'ru', 'zh']:
            file_path = os.path.join(brands_dir, lang, f"{ref}.md")
            if os.path.exists(file_path):
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                    template_data = extract_front_matter(content)
                    break

        if not template_data:
            continue

        # Get multilingual content
        titles = get_multilingual_field(brands_dir, ref, 'title')
        descriptions = get_multilingual_field(brands_dir, ref, 'description')

        # Extract country from ref
        country = template_data.get('location_country') or extract_country_from_ref(ref)

        # Build comprehensive brand object
        brand = {
            'ref': ref,
            'title': titles,
            'description': descriptions,
            'founding_year': template_data.get('founding_year'),
            'website': template_data.get('website'),
            'founders': template_data.get('founders', []),
            'founder_led': template_data.get('founder_led', False),
            'sectors': template_data.get('sectors', []),
            'markets': template_data.get('markets', []),
            'attributes': template_data.get('attributes', []),
            'signals': template_data.get('signals', []),
            'location': {
                'lat': template_data.get('location_lat'),
                'lng': template_data.get('location_lng'),
                'city': template_data.get('location_city'),
                'region': template_data.get('location_region'),
                'country': country
            },
            'featured': template_data.get('featured', False),
            'featured_level': template_data.get('featured_level', 0),
            'logo': template_data.get('logo'),
            'hero_image': template_data.get('hero_image'),
            'founder_portrait': template_data.get('founder_portrait'),
            'sample_data': template_data.get('sample_data', True)  # Default to true for now
        }

        # Process gallery with multilingual captions
        if 'gallery' in template_data:
            gallery_items = []
            for item in template_data['gallery']:
                # Get multilingual captions
                captions = {}
                for lang in ['en', 'ru', 'zh']:
                    file_path = os.path.join(brands_dir, lang, f"{ref}.md")
                    if os.path.exists(file_path):
                        with open(file_path, 'r', encoding='utf-8') as f:
                            content = f.read()
                            fm = extract_front_matter(content)
                            if 'gallery' in fm:
                                # Find matching gallery item by image path
                                for gallery_item in fm['gallery']:
                                    if gallery_item.get('image') == item.get('image'):
                                        captions[lang] = gallery_item.get('caption', '')
                                        break

                gallery_items.append({
                    'image': item.get('image'),
                    'caption': captions
                })
            brand['gallery'] = gallery_items

        brands.append(brand)

    # Sort by ref for consistency
    brands.sort(key=lambda x: x['ref'])

    # Save to _data/brands.json
    os.makedirs('_data', exist_ok=True)
    with open('_data/brands.json', 'w', encoding='utf-8') as f:
        json.dump(brands, f, indent=2, ensure_ascii=False)

    print(f"Generated {len(brands)} brands in _data/brands.json")
    return brands

def generate_founders_json(brands_data):
    """Generate founders.json with all available fields"""
    founders = []
    founders_dir = '_founders'
    processed_refs = set()

    # First, collect all unique founder refs
    all_refs = set()

    # From founder files
    if os.path.exists(founders_dir):
        for lang_dir in ['en', 'ru', 'zh']:
            lang_path = os.path.join(founders_dir, lang_dir)
            if not os.path.exists(lang_path):
                continue

            for filename in os.listdir(lang_path):
                if filename.endswith('.md'):
                    ref = filename[:-3]  # Remove .md extension
                    all_refs.add(ref)

    # From brand data
    for brand in brands_data:
        for founder_ref in brand.get('founders', []):
            all_refs.add(founder_ref)

    # Process each unique ref
    for ref in sorted(all_refs):
        if ref in processed_refs:
            continue

        processed_refs.add(ref)

        # Extract country from ref
        country = extract_country_from_ref(ref)

        # Try to get data from founder files
        founder_data = None
        if os.path.exists(founders_dir):
            for lang in ['en', 'ru', 'zh']:
                file_path = os.path.join(founders_dir, lang, f"{ref}.md")
                if os.path.exists(file_path):
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                        founder_data = extract_front_matter(content)
                        break

        if founder_data:
            # Get multilingual content
            names = get_multilingual_field(founders_dir, ref, 'name')
            positions = get_multilingual_field(founders_dir, ref, 'position')

            # If names are empty, use ref as fallback
            if not names:
                names = {'en': ref, 'ru': ref, 'zh': ref}
        else:
            # Create basic entry from ref
            names = {'en': ref, 'ru': ref, 'zh': ref}
            positions = {}
            founder_data = {}

        # Determine sample_data status (inherit from associated brands)
        sample_data = founder_data.get('sample_data', True)  # Default to true
        for brand in brands_data:
            if ref in brand.get('founders', []):
                if 'sample_data' in brand:
                    sample_data = brand['sample_data']
                    break

        # Build founder object
        founder = {
            'ref': ref,
            'name': names,
            'position': positions,
            'brands': [],  # Will be populated below
            'generation': founder_data.get('generation'),
            'country': founder_data.get('country') or country,
            'founder_led': founder_data.get('founder_led', True),
            'sample_data': sample_data
        }

        # Add brands association
        for brand in brands_data:
            if ref in brand.get('founders', []):
                founder['brands'].append(brand['ref'])

        founders.append(founder)

    # Sort by ref for consistency
    founders.sort(key=lambda x: x['ref'])

    # Save to _data/founders.json
    with open('_data/founders.json', 'w', encoding='utf-8') as f:
        json.dump(founders, f, indent=2, ensure_ascii=False)

    print(f"Generated {len(founders)} founders in _data/founders.json")
    return founders

def main():
    """Main execution function"""
    print("Generating search indexes...")

    # Generate brands.json first
    brands_data = generate_brands_json()

    # Generate founders.json using brand data
    generate_founders_json(brands_data)

    print("Search index generation complete!")

    # Show summary of any data issues
    print("\nData Summary:")
    with open('_data/brands.json', 'r', encoding='utf-8') as f:
        brands = json.load(f)
        missing_translations = []
        for brand in brands:
            if len(brand['title']) < 3:
                missing_translations.append(f"Brand {brand['ref']}: Missing title translations")
            if len(brand['description']) < 3:
                missing_translations.append(f"Brand {brand['ref']}: Missing description translations")

        if missing_translations:
            print("Missing translations:")
            for msg in missing_translations[:5]:  # Show first 5
                print(f"  - {msg}")
            if len(missing_translations) > 5:
                print(f"  ... and {len(missing_translations) - 5} more")

    with open('_data/founders.json', 'r', encoding='utf-8') as f:
        founders = json.load(f)
        missing_data = []
        for founder in founders:
            if not founder.get('country'):
                missing_data.append(f"Founder {founder['ref']}: Missing country")
            if len(founder.get('name', {})) < 3:
                missing_data.append(f"Founder {founder['ref']}: Missing name translations")

        if missing_data:
            print("\nMissing founder data:")
            for msg in missing_data[:5]:  # Show first 5
                print(f"  - {msg}")
            if len(missing_data) > 5:
                print(f"  ... and {len(missing_data) - 5} more")

if __name__ == "__main__":
    main()
