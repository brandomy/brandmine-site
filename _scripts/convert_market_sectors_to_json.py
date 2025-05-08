#!/usr/bin/env python3
import yaml
import json
import os
import glob
import re

def convert_market_sectors_to_json():
    """
    Convert market-sectors YAML files to a single consolidated JSON file.
    
    This script handles the complex structure of market-sectors data,
    which is organized by language and market. The output consolidates
    all market-sector data into a single JSON structure with translations
    and preserves all metadata.
    """
    # Initialize the main data structure
    market_sectors_data = {"market_sectors": []}
    
    # Get available languages and markets
    langs = ["en", "ru", "zh"]
    markets = []
    
    # Find all market files first to identify markets
    for lang in langs:
        market_files = glob.glob(f"_data/market-sectors/{lang}/*.yml")
        for file_path in market_files:
            market = os.path.basename(file_path).replace('.yml', '')
            if market not in markets:
                markets.append(market)
    
    print(f"Found markets: {', '.join(markets)}")
    
    # Process each market in each language
    for market in markets:
        print(f"Processing market: {market}")
        
        for lang in langs:
            yaml_path = f"_data/market-sectors/{lang}/{market}.yml"
            
            if not os.path.exists(yaml_path):
                print(f"  - Skipping {lang}/{market}.yml (not found)")
                continue
                
            try:
                with open(yaml_path, 'r', encoding='utf-8') as yaml_file:
                    file_content = yaml_file.read()
                    # Skip if file is empty
                    if not file_content.strip():
                        print(f"  - Skipping {lang}/{market}.yml (empty file)")
                        continue
                        
                    # Load YAML data (skip comments)
                    data = yaml.safe_load(file_content)
                    
                    # Skip if no actual data (just comments)
                    if data is None:
                        print(f"  - Skipping {lang}/{market}.yml (only comments)")
                        continue
                    
                    # Skip _meta section and process sectors
                    if isinstance(data, dict) and "_meta" in data:
                        # Store slug mappings if needed later
                        slug_mappings = data.get("_meta", {}).get("slug_mappings", {})
                        # Remove _meta to process only sectors
                        data.pop("_meta", None)
                    
                    # Process each sector in the market file
                    for sector_id, sector_data in data.items():
                        # Create a unique identifier for this market-sector combination
                        market_sector_id = f"{market}-{sector_id}"
                        
                        # Find if this market-sector already exists in our JSON structure
                        existing_market_sector = next((ms for ms in market_sectors_data["market_sectors"] 
                                                 if ms.get("market") == market and ms.get("sector") == sector_id), None)
                        
                        if existing_market_sector:
                            # Add translation to existing market-sector
                            if "translations" not in existing_market_sector:
                                existing_market_sector["translations"] = {}
                            
                            # Add language-specific translations
                            existing_market_sector["translations"][lang] = {
                                "title": sector_data.get("title", ""),
                                "description": sector_data.get("description", "")
                            }
                            
                            # If this is the first language with full data, add the detailed information
                            if lang == "en" and "full_content" in sector_data:
                                # Copy all other fields except title, description, and translations
                                for key, value in sector_data.items():
                                    if key not in ["title", "description", "translations"]:
                                        existing_market_sector[key] = value
                            
                        else:
                            # Create new market-sector entry
                            new_market_sector = {
                                "market": market,
                                "sector": sector_id,
                                "translations": {
                                    lang: {
                                        "title": sector_data.get("title", ""),
                                        "description": sector_data.get("description", "")
                                    }
                                }
                            }
                            
                            # Copy all other fields except title, description, and translations
                            for key, value in sector_data.items():
                                if key not in ["title", "description", "translations"]:
                                    new_market_sector[key] = value
                            
                            # Add to the collection
                            market_sectors_data["market_sectors"].append(new_market_sector)
                
                print(f"  - Processed {lang}/{market}.yml")
                    
            except Exception as e:
                print(f"  - Error processing {yaml_path}: {str(e)}")
    
    # Sort market-sectors for consistency (by market then sector)
    market_sectors_data["market_sectors"] = sorted(
        market_sectors_data["market_sectors"], 
        key=lambda ms: (ms["market"], ms["sector"])
    )
    
    # Write to JSON file
    output_path = "_data/market_sectors.json"
    with open(output_path, 'w', encoding='utf-8') as json_file:
        json.dump(market_sectors_data, json_file, ensure_ascii=False, indent=2)
    
    count = len(market_sectors_data["market_sectors"])
    print(f"Conversion completed: {output_path} created with {count} market-sector combinations")
    return count

# Execute the conversion if run directly
if __name__ == "__main__":
    count = convert_market_sectors_to_json()
    print(f"Successfully processed {count} unique market-sector combinations")