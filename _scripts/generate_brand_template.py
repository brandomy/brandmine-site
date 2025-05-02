#!/usr/bin/env python3
"""
Brand Template Generator for Multilingual Content

This script generates brand templates for the Brandmine platform in all three supported 
languages (English, Russian, and Chinese). It creates consistent front matter and basic
content structure based on our standardized format.

Usage:
    python3 generate_brand_template.py
    
    The script will guide you through entering:
    - Template type (core, lite, full)
    - Market code (e.g., ru, cn, ae)
    - Brand slug for URLs
    - Brand names in all three languages
    - Basic brand information
    
    Then it generates the template files in the appropriate language/market directories
    and creates the necessary folder structure for brand images.

Requirements:
    - PyYAML library: pip install pyyaml
    - Proper directory structure with _brands/{lang}/{market}/ directories
    - _templates/brands/ directory with template files

Author: Randal Eastman
Created: May 2, 2025
"""

import os
import sys
import argparse
import yaml
import datetime
import shutil
import re

# Get the absolute path to the project root directory
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)  # Assumes script is in _scripts folder

def load_sectors_and_markets():
    """
    Load sectors and markets from dimension files
    """
    sectors = []
    markets = []
    
    try:
        # Look in dimensions directory for sectors and markets
        dimensions_dir = os.path.join(PROJECT_ROOT, '_dimensions', 'en')
        
        # Load sectors
        sectors_dir = os.path.join(dimensions_dir, 'sectors')
        if os.path.exists(sectors_dir):
            for filename in os.listdir(sectors_dir):
                if filename.endswith('.md'):
                    sector_slug = filename[:-3]  # Remove .md extension
                    sectors.append(sector_slug)
        
        # Load markets
        markets_dir = os.path.join(dimensions_dir, 'markets')
        if os.path.exists(markets_dir):
            for filename in os.listdir(markets_dir):
                if filename.endswith('.md'):
                    market_slug = filename[:-3]  # Remove .md extension
                    markets.append(market_slug)
    
    except Exception as e:
        print(f"Error loading sectors and markets: {e}")
    
    return sectors, markets

def load_template(template_type):
    """
    Load the template file for the specified type
    """
    template_path = os.path.join(PROJECT_ROOT, '_templates', 'brands', f'brand-{template_type}.md')
    
    try:
        with open(template_path, 'r', encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        print(f"Error: Template file not found at {template_path}")
        print("Available templates:")
        templates_dir = os.path.join(PROJECT_ROOT, '_templates', 'brands')
        if os.path.exists(templates_dir):
            print(os.listdir(templates_dir))
        sys.exit(1)

def extract_front_matter(template):
    """
    Extract front matter from template
    """
    front_matter_match = re.match(r'^---\n(.*?)\n---', template, re.DOTALL)
    if front_matter_match:
        return front_matter_match.group(1)
    return ""

def extract_content(template):
    """
    Extract content part (after front matter) from template
    """
    content_match = re.match(r'^---\n.*?\n---\n(.*)', template, re.DOTALL)
    if content_match:
        return content_match.group(1)
    return ""

def generate_brand_template(template_type=None, market=None, slug=None, title_en=None):
    """
    Generates brand templates in all three languages
    """
    # Prompt for template type if not provided
    template_types = ['core', 'lite', 'full']
    if not template_type or template_type not in template_types:
        print("\nAvailable template types:")
        for i, t_type in enumerate(template_types, 1):
            print(f"{i}. {t_type.capitalize()} Template")
            
        while True:
            try:
                choice = int(input("\nSelect template type number: "))
                if 1 <= choice <= len(template_types):
                    template_type = template_types[choice-1]
                    break
                else:
                    print(f"Please enter a number between 1 and {len(template_types)}")
            except ValueError:
                print("Please enter a valid number")
    
    # Get available sectors and markets
    sectors, markets_list = load_sectors_and_markets()
    
    # Prompt for market code if not provided
    if not market:
        if markets_list:
            print("\nAvailable markets:")
            for i, m in enumerate(markets_list, 1):
                print(f"{i}. {m}")
            
            market_choice = input("\nEnter market code or number from the list: ")
            
            try:
                market_idx = int(market_choice)
                if 1 <= market_idx <= len(markets_list):
                    market = markets_list[market_idx-1]
                else:
                    print(f"Invalid selection. Using entered value as market code: {market_choice}")
                    market = market_choice
            except ValueError:
                market = market_choice
        else:
            market = input("\nEnter market code (e.g., ru, cn, ae): ").lower()
        
        if not market:
            print("Market code is required.")
            sys.exit(1)
    
    # Prompt for brand slug if not provided
    if not slug:
        slug = input("\nEnter brand slug for URL (e.g., teatime): ")
        
        if not slug:
            print("Brand slug is required.")
            sys.exit(1)
    
    # Prompt for brand name in English if not provided
    if not title_en:
        title_en = input("\nEnter brand name in English: ")
        
        if not title_en:
            print("Brand name is required.")
            sys.exit(1)
    
    # Prompt for brand name in other languages
    title_ru = input(f"\nEnter brand name in Russian (for '{title_en}'): ")
    title_zh = input(f"\nEnter brand name in Chinese (for '{title_en}'): ")
    
    # Prompt for basic brand info
    founding_year = input("\nEnter founding year (e.g., 2015): ")
    sector = ""
    
    if sectors:
        print("\nAvailable sectors:")
        for i, s in enumerate(sectors, 1):
            print(f"{i}. {s}")
        
        sector_choice = input("\nEnter sector slug or number from the list: ")
        
        try:
            sector_idx = int(sector_choice)
            if 1 <= sector_idx <= len(sectors):
                sector = sectors[sector_idx-1]
            else:
                print(f"Invalid selection. Using entered value as sector slug: {sector_choice}")
                sector = sector_choice
        except ValueError:
            sector = sector_choice
    else:
        sector = input("\nEnter primary sector slug (e.g., gourmet-foods): ")
    
    # Prompt for founder name
    founder_name = input("\nEnter founder's name: ")
    
    # Prompt for location
    city = input("\nEnter city name: ")
    
    # Prompt for coordinates
    coordinates = input("\nEnter coordinates as [longitude, latitude] (e.g., [37.6173, 55.7558]): ")
    if not coordinates:
        coordinates = "[0, 0]"  # Default coordinates
    
    # Generate templates
    for lang, title in [('en', title_en), ('ru', title_ru), ('zh', title_zh)]:
        # Load and modify the template
        template = load_template(template_type)
        
        # Extract front matter and content parts
        front_matter = extract_front_matter(template)
        content = extract_content(template)
        
        # Update front matter with provided values
        front_matter = re.sub(r'title: ".*?"', f'title: "{title}"', front_matter)
        front_matter = re.sub(r'ref: .*', f'ref: {slug}', front_matter)
        front_matter = re.sub(r'country_code: ".*?"', f'country_code: "{market}"', front_matter)
        front_matter = re.sub(r'lang: .*', f'lang: {lang}', front_matter)
        front_matter = re.sub(r'permalink: .*', f'permalink: /{lang}/brands/{market}/{slug}/', front_matter)
        
        # Modify basic info
        if founding_year:
            front_matter = re.sub(r'founding_year: .*', f'founding_year: {founding_year}', front_matter)
        
        if sector:
            front_matter = re.sub(r'sectors: \[.*?\]', f'sectors: [{sector}]', front_matter)
        
        front_matter = re.sub(r'markets: \[.*?\]', f'markets: [{market}]', front_matter)
        
        # Update founder name
        if founder_name:
            front_matter = re.sub(r'name: ".*?"', f'name: "{founder_name}"', front_matter, count=1)
        
        # Update city
        if city:
            front_matter = re.sub(r'city: ".*?"', f'city: "{city}"', front_matter)
        
        # Update coordinates
        if coordinates:
            front_matter = re.sub(r'coordinates: \[.*?\]', f'coordinates: {coordinates}', front_matter)
        
        # Update image paths
        logo_path = f'/assets/images/brands/{market}/{slug}/originals/logo-color.png'
        hero_path = f'/assets/images/brands/{market}/{slug}/originals/hero-main.jpg'
        founder_path = f'/assets/images/brands/{market}/{slug}/originals/founder-portrait.jpg'
        
        front_matter = re.sub(r'logo: ".*?"', f'logo: "{logo_path}"', front_matter)
        front_matter = re.sub(r'hero_image: ".*?"', f'hero_image: "{hero_path}"', front_matter)
        front_matter = re.sub(r'founder_portrait: ".*?"', f'founder_portrait: "{founder_path}"', front_matter)
        
        # Replace placeholder brand name in content
        content = content.replace("BRAND NAME", title)
        
        # Combine updated front matter and content
        updated_template = f"---\n{front_matter}\n---\n{content}"
        
        # Ensure directory exists
        brands_dir = os.path.join(PROJECT_ROOT, '_brands', lang, market)
        os.makedirs(brands_dir, exist_ok=True)
        
        # Ensure image directory exists
        image_dir = os.path.join(PROJECT_ROOT, 'assets', 'images', 'brands', market, slug, 'originals')
        os.makedirs(image_dir, exist_ok=True)
        print(f"Created image directory: {image_dir}")
        
        # Write template file
        filepath = os.path.join(brands_dir, f"{slug}.md")
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(updated_template)
            
        print(f"Created {filepath}")
    
    print("\nDon't forget to:")
    print(f"1. Add images to: assets/images/brands/{market}/{slug}/originals/")
    print(f"   - logo-color.png (400x400px with transparency)")
    print(f"   - hero-main.jpg (1200x800px)")
    print(f"   - founder-portrait.jpg (800x1200px)")
    print(f"2. Process images with: ./_scripts/process_brand_images.sh {market} {slug}")
    print(f"3. Complete the content in all three language files")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate multilingual brand templates")
    parser.add_argument('--type', choices=['core', 'lite', 'full'], help="Template type")
    parser.add_argument('--market', help="Market code (e.g. ru, cn, ae)")
    parser.add_argument('--slug', help="Brand slug for URL")
    parser.add_argument('--title', help="Brand name in English")
    
    args = parser.parse_args()
    generate_brand_template(args.type, args.market, args.slug, args.title)