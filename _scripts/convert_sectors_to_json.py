#!/usr/bin/env python3
import yaml
import json
import os
import glob

def convert_sectors_to_json():
    """
    Convert sectors YAML files to a single consolidated JSON file.
    
    This script consolidates sector information from language-specific YAML files
    into a single JSON structure. The output maintains all data while organizing
    translations under each sector.
    """
    sectors_data = {"sectors": []}
    
    # Process each language file
    langs = ["en", "ru", "zh"]
    
    for lang in langs:
        yaml_path = f"_data/sectors/{lang}.yml"
        
        if not os.path.exists(yaml_path):
            print(f"Warning: {yaml_path} not found")
            continue
            
        try:
            with open(yaml_path, 'r', encoding='utf-8') as yaml_file:
                # Load YAML data (skip comments)
                data = yaml.safe_load(yaml_file)
                
                # Process each sector
                for sector in data:
                    sector_id = sector.get("id")
                    
                    # Find if this sector already exists in our JSON structure
                    existing_sector = next((s for s in sectors_data["sectors"] 
                                         if s.get("id") == sector_id), None)
                    
                    if existing_sector:
                        # Add translation to existing sector
                        if "translations" not in existing_sector:
                            existing_sector["translations"] = {}
                        
                        existing_sector["translations"][lang] = {
                            "short_description": sector.get("short_description", ""),
                            "long_description": sector.get("long_description", "")
                        }
                    else:
                        # Create new sector with first translation
                        new_sector = {
                            "id": sector_id,
                            "icon": sector.get("icon", ""),
                            "hero_image": sector.get("hero_image", ""),
                            "translations": {
                                lang: {
                                    "short_description": sector.get("short_description", ""),
                                    "long_description": sector.get("long_description", "")
                                }
                            }
                        }
                        sectors_data["sectors"].append(new_sector)
            
            print(f"Processed {lang}.yml - found {len(data)} sectors")
                
        except Exception as e:
            print(f"Error processing {yaml_path}: {str(e)}")
    
    # Sort sectors alphabetically by ID for consistency
    sectors_data["sectors"] = sorted(sectors_data["sectors"], key=lambda s: s["id"])
    
    # Write to JSON file
    output_path = "_data/sectors.json"
    with open(output_path, 'w', encoding='utf-8') as json_file:
        json.dump(sectors_data, json_file, ensure_ascii=False, indent=2)
    
    print(f"Conversion completed: {output_path} created with {len(sectors_data['sectors'])} sectors")
    return len(sectors_data['sectors'])

# Execute the conversion if run directly
if __name__ == "__main__":
    num_sectors = convert_sectors_to_json()
    print(f"Successfully processed {num_sectors} unique sectors")