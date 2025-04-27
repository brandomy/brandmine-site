#!/usr/bin/env python3
"""
Article Template Generator for Multilingual Content

This script generates article templates for the Brandmine platform in all three supported 
languages (English, Russian, and Chinese). It creates consistent front matter and basic
content structure based on our standardized format.

Usage:
    python3 generate_article_template.py
    
    The script will guide you through selecting:
    - Content category
    - Article slug for URLs
    - Article titles in all three languages
    
    Then it generates the template files in the appropriate language directories.

Requirements:
    - PyYAML library: pip install pyyaml
    - Proper directory structure with _data/insights/{lang}.yml files
    - _insights/{lang}/ directories for output

Author: Randal Eastman
Created: April 27, 2025
"""

import os
import sys
import argparse
import yaml
import datetime

# Get the absolute path to the project root directory
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)  # Assumes script is in _scripts folder

def load_categories():
    """
    Load category IDs from English data file
    """
    try:
        # Use absolute path to the file
        categories_file = os.path.join(PROJECT_ROOT, '_data', 'insights', 'en.yml')
        print(f"Looking for categories file at: {categories_file}")
        
        with open(categories_file, 'r', encoding='utf-8') as f:
            data = yaml.safe_load(f)
            if not data or 'categories' not in data:
                print("Warning: No categories found in en.yml")
                return []
            return [(cat['id'], cat['name']) for cat in data['categories']]
    except FileNotFoundError:
        print(f"Error: Could not find categories file at {categories_file}")
        print("Current directory structure:")
        
        data_dir = os.path.join(PROJECT_ROOT, '_data')
        if os.path.exists(data_dir):
            print(f"Contents of {data_dir}:")
            print(os.listdir(data_dir))
            
            insights_dir = os.path.join(data_dir, 'insights')
            if os.path.exists(insights_dir):
                print(f"Contents of {insights_dir}:")
                print(os.listdir(insights_dir))
            else:
                print(f"Directory {insights_dir} does not exist")
        else:
            print(f"Directory {data_dir} does not exist")
            
        return []

def generate_article_template(category=None, slug=None, title_en=None):
    """
    Generates article templates in all three languages
    """
    # Get categories
    categories_list = load_categories()
    
    if not categories_list:
        print("No categories found. Please check your data structure.")
        sys.exit(1)
    
    # Prompt for category if not provided
    if not category:
        print("\nAvailable categories:")
        for i, (cat_id, cat_name) in enumerate(categories_list, 1):
            print(f"{i}. {cat_name} ({cat_id})")
            
        while True:
            try:
                choice = int(input("\nSelect category number: "))
                if 1 <= choice <= len(categories_list):
                    category = categories_list[choice-1][0]
                    break
                else:
                    print(f"Please enter a number between 1 and {len(categories_list)}")
            except ValueError:
                print("Please enter a valid number")
    
    # Load category data for all languages
    categories = {}
    for lang in ['en', 'ru', 'zh']:
        try:
            lang_file = os.path.join(PROJECT_ROOT, '_data', 'insights', f'{lang}.yml')
            with open(lang_file, 'r', encoding='utf-8') as f:
                data = yaml.safe_load(f)
                if data and 'categories' in data:
                    categories[lang] = data['categories']
                else:
                    print(f"Warning: No categories found in {lang}.yml")
                    categories[lang] = []
        except FileNotFoundError:
            print(f"Warning: Could not find {lang}.yml, will prompt for translations")
            categories[lang] = []
    
    # Map English category to translated versions
    category_map = {}
    for lang in ['en', 'ru', 'zh']:
        found = False
        if lang in categories and categories[lang]:
            for cat in categories[lang]:
                if cat['id'] == category:
                    category_map[lang] = cat['name']
                    found = True
                    break
        
        if not found:
            if lang == 'en':
                category_map[lang] = next((name for id, name in categories_list if id == category), category)
            else:
                # If translation not found, prompt for it
                en_name = category_map.get('en', category)
                if lang == 'ru':
                    lang_name = "Russian"
                else:
                    lang_name = "Chinese"
                category_map[lang] = input(f"\nEnter the {lang_name} translation for category '{en_name}': ")
    
    # Prompt for slug if not provided
    if not slug:
        slug = input("\nEnter article slug for URL (e.g., new-brand-profile): ")
    
    # Prompt for title in English if not provided
    if not title_en:
        title_en = input("\nEnter article title in English: ")
    
    # Prompt for title in other languages
    title_ru = input(f"\nEnter article title in Russian (for '{title_en}'): ")
    title_zh = input(f"\nEnter article title in Chinese (for '{title_en}'): ")
    
    # Generate templates
    today = datetime.datetime.now().strftime("%Y-%m-%d")
    
    for lang, title in [('en', title_en), ('ru', title_ru), ('zh', title_zh)]:
        template = f"""---
layout: insight
title: "{title}"
category: "{category_map[lang]}"
secondary_categories: []
date: {today}
author: ""
excerpt: ""
sectors: []
markets: []
attributes: []
signals: []
brands: []
image: /assets/images/insights/{slug}.jpg
featured: false
premium: false
permalink: /{lang}/insights/{slug}/
lang: {lang}
reading_time: 0
---

## First Section Heading

Write your first section content here.

## Second Section Heading

Write your second section content here.
"""
        
        # Ensure directory exists
        insights_dir = os.path.join(PROJECT_ROOT, '_insights', lang)
        os.makedirs(insights_dir, exist_ok=True)
        
        # Write template file
        filepath = os.path.join(insights_dir, f"{slug}.md")
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(template)
            
        print(f"Created {filepath}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate multilingual article templates")
    parser.add_argument('--category', help="Category ID (e.g. brand_spotlight)")
    parser.add_argument('--slug', help="Article slug for URL")
    parser.add_argument('--title', help="Article title in English")
    
    args = parser.parse_args()
    generate_article_template(args.category, args.slug, args.title)