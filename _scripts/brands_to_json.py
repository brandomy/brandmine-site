#!/usr/bin/env python3
"""
Brands to JSON Converter

Extracts front matter from Jekyll brand collection files and converts them to JSON
for export to external systems like Airtable.

Usage:
    python _scripts/brands_to_json.py [--lang LANGUAGE]

Options:
    --lang LANGUAGE  Convert only specific language (en, ru, zh)
                    If not specified, converts all languages
"""

import yaml
import json
import os
import sys
import argparse
from pathlib import Path
from datetime import datetime

def extract_front_matter(file_path):
    """Extract YAML front matter from a markdown file."""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Check if file has front matter
    if not content.startswith('---'):
        return None

    # Split content to extract front matter
    parts = content.split('---', 2)
    if len(parts) < 3:
        return None

    try:
        # Parse YAML front matter
        front_matter = yaml.safe_load(parts[1])
        return front_matter
    except yaml.YAMLError as e:
        print(f"Error parsing YAML in {file_path}: {e}")
        return None

def transform_for_airtable(data):
    """
    Transform nested structure to Airtable-friendly format.
    Airtable prefers flatter structures for better column management.
    """
    if not data:
        return None

    flat_data = data.copy()

    # Flatten social media fields
    if 'social_media' in data:
        social = data['social_media']

        # Handle main social platforms
        for platform in ['facebook', 'instagram', 'linkedin', 'twitter', 'youtube']:
            if platform in social:
                flat_data[f'social_{platform}'] = social[platform]

        # Handle regional social platforms
        if 'regional' in social:
            for platform, url in social['regional'].items():
                flat_data[f'social_{platform}'] = url

        # Remove the nested structure
        del flat_data['social_media']

    # Flatten location data
    if 'location' in data:
        location = data['location']
        flat_data['location_lat'] = location.get('lat', 0.0)
        flat_data['location_lng'] = location.get('lng', 0.0)
        flat_data['location_city'] = location.get('city', '')
        flat_data['location_region'] = location.get('region', '')
        flat_data['location_country'] = location.get('country', '')
        del flat_data['location']

    # Flatten assets
    if 'assets' in data:
        assets = data['assets']
        flat_data['logo'] = assets.get('logo', '')
        flat_data['hero_image'] = assets.get('hero_image', '')
        flat_data['founder_portrait'] = assets.get('founder_portrait', '')
        del flat_data['assets']

    # Ensure arrays are JSON-serializable
    for key in ['sectors', 'markets', 'attributes', 'signals', 'export_markets', 'distribution_models']:
        if key in flat_data and isinstance(flat_data[key], list):
            flat_data[key] = json.dumps(flat_data[key])

    # Handle timeline as JSON string for Airtable
    if 'timeline' in flat_data:
        flat_data['timeline'] = json.dumps(flat_data['timeline'])

    # Handle certifications and awards
    if 'certifications' in flat_data:
        flat_data['certifications'] = json.dumps(flat_data['certifications'])

    if 'awards' in flat_data:
        flat_data['awards'] = json.dumps(flat_data['awards'])

    # Handle gallery
    if 'gallery' in flat_data:
        flat_data['gallery'] = json.dumps(flat_data['gallery'])

    return flat_data

def process_language(lang, brands_dir, export_dir):
    """Process all brand files for a specific language."""
    lang_brands_dir = brands_dir / lang
    lang_export_dir = export_dir / lang

    # Check if language directory exists
    if not lang_brands_dir.exists():
        print(f"Warning: No brands directory found for language '{lang}'")
        return 0

    # Create export directory
    lang_export_dir.mkdir(parents=True, exist_ok=True)

    processed_count = 0

    # Process each markdown file
    for md_file in lang_brands_dir.glob("*.md"):
        print(f"Processing: {md_file}")

        # Extract front matter
        front_matter = extract_front_matter(md_file)
        if not front_matter:
            print(f"  Skipped: No valid front matter found")
            continue

        # Transform for Airtable
        airtable_data = transform_for_airtable(front_matter)
        if not airtable_data:
            print(f"  Skipped: Failed to transform data")
            continue

        # Add metadata
        airtable_data['_source_file'] = str(md_file)
        airtable_data['_export_date'] = datetime.now().isoformat()
        airtable_data['_language'] = lang

        # Save as JSON
        json_filename = md_file.stem + '.json'
        json_path = lang_export_dir / json_filename

        with open(json_path, 'w', encoding='utf-8') as f:
            json.dump(airtable_data
