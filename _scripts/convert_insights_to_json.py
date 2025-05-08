import yaml
import json
import os

def convert_insights_to_json():
    """Convert insights YAML files to a single JSON file."""
    insights_data = {"categories": []}
    
    # Process each language file
    langs = ["en", "ru", "zh"]
    for lang in langs:
        yaml_path = f"_data/insights/{lang}.yml"
        
        if not os.path.exists(yaml_path):
            print(f"Warning: {yaml_path} not found")
            continue
            
        with open(yaml_path, 'r', encoding='utf-8') as yaml_file:
            # Load YAML data (skip comments)
            data = yaml.safe_load(yaml_file)
            
            # Process each category
            for category in data.get("categories", []):
                category_id = category.get("id")
                
                # Find if this category already exists in our JSON structure
                existing_category = next((c for c in insights_data["categories"] 
                                         if c.get("id") == category_id), None)
                
                if existing_category:
                    # Add translation to existing category
                    if "translations" not in existing_category:
                        existing_category["translations"] = {}
                    
                    existing_category["translations"][lang] = {
                        "name": category.get("name", ""),
                        "plural": category.get("plural", ""),
                        "description": category.get("description", "")
                    }
                else:
                    # Create new category with first translation
                    new_category = {
                        "id": category_id,
                        "translations": {
                            lang: {
                                "name": category.get("name", ""),
                                "plural": category.get("plural", ""),
                                "description": category.get("description", "")
                            }
                        },
                        "icon": category.get("icon", ""),
                        "recommended_length": category.get("recommended_length", 0),
                        "featured_image_ratio": category.get("featured_image_ratio", ""),
                        "typical_reading_time": category.get("typical_reading_time", 0),
                        "seo_keywords": category.get("seo_keywords", []),
                        "content_guidelines": category.get("content_guidelines", ""),
                        "accent_color": category.get("accent_color", "")
                    }
                    insights_data["categories"].append(new_category)
    
    # Write to JSON file
    with open("_data/insights.json", 'w', encoding='utf-8') as json_file:
        json.dump(insights_data, json_file, ensure_ascii=False, indent=2)
    
    print("Conversion completed: _data/insights.json created")

# Execute the conversion
if __name__ == "__main__":
    convert_insights_to_json()