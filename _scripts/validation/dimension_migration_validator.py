#!/usr/bin/env python3
"""Validate dimension data consistency during migration."""
import json
import yaml
import os
from pathlib import Path
import sys

def load_yaml_dimensions():
    """Load old YAML dimension files."""
    dimensions = {}
    yaml_path = Path('_data/dimensions')
    
    for lang in ['en', 'ru', 'zh']:
        yaml_file = yaml_path / f"{lang}.yml"
        if yaml_file.exists():
            with open(yaml_file, 'r', encoding='utf-8') as f:
                dimensions[lang] = yaml.safe_load(f)
    
    return dimensions

def load_json_dimensions():
    """Load new JSON dimension files."""
    dimensions = {
        'markets': [],
        'sectors': [],
        'attributes': [],
        'signals': []
    }
    
    data_path = Path('_data')
    
    # Load markets
    markets_file = data_path / 'markets.json'
    if markets_file.exists():
        with open(markets_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
            dimensions['markets'] = data.get('markets', [])
    
    # Load attributes
    attributes_file = data_path / 'attributes.json'
    if attributes_file.exists():
        with open(attributes_file, 'r', encoding='utf-8') as f:
            dimensions['attributes'] = json.load(f)
    
    # Load sectors from dimensions.json
    dimensions_file = data_path / 'dimensions.json'
    if dimensions_file.exists():
        with open(dimensions_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
            dimensions['sectors'] = data.get('sectors', {})
            dimensions['signals'] = data.get('signals', {})
    
    return dimensions

def validate_dimension_completeness():
    """Check that JSON files contain all dimensions from YAML."""
    print("=== DIMENSION COMPLETENESS CHECK ===")
    
    yaml_dims = load_yaml_dimensions()
    json_dims = load_json_dimensions()
    
    missing = []
    
    # Check markets
    if 'en' in yaml_dims and 'markets' in yaml_dims['en']:
        yaml_markets = set(yaml_dims['en']['markets'].keys())
        json_market_ids = set([m['id'] for m in json_dims['markets']])
        
        missing_markets = yaml_markets - json_market_ids
        if missing_markets:
            missing.append(f"Markets missing in JSON: {missing_markets}")
    
    # Check sectors
    if 'en' in yaml_dims and 'sectors' in yaml_dims['en']:
        yaml_sectors = set(yaml_dims['en']['sectors'].keys())
        json_sector_ids = set(json_dims['sectors'].keys())
        
        missing_sectors = yaml_sectors - json_sector_ids
        if missing_sectors:
            missing.append(f"Sectors missing in JSON: {missing_sectors}")
    
    if missing:
        print("❌ FAIL - Missing dimensions:")
        for m in missing:
            print(f"  - {m}")
        return False
    else:
        print("✅ PASS - All YAML dimensions exist in JSON")
        return True

def validate_template_references():
    """Scan for broken dimension references."""
    print("\n=== TEMPLATE REFERENCE CHECK ===")
    
    includes_path = Path('_includes')
    layouts_path = Path('_layouts')
    
    old_pattern_count = 0
    files_with_old_patterns = []
    
    for path in [includes_path, layouts_path]:
        for file in path.rglob('*.html'):
            with open(file, 'r', encoding='utf-8') as f:
                content = f.read()
                if 'site.data.dimensions[' in content:
                    old_pattern_count += content.count('site.data.dimensions[')
                    files_with_old_patterns.append(str(file))
    
    if old_pattern_count > 0:
        print(f"⚠️  Found {old_pattern_count} old YAML references in {len(files_with_old_patterns)} files:")
        for f in files_with_old_patterns[:5]:
            print(f"  - {f}")
        if len(files_with_old_patterns) > 5:
            print(f"  ... and {len(files_with_old_patterns) - 5} more files")
    else:
        print("✅ No old YAML references found")
    
    return old_pattern_count == 0

def main():
    """Run all validations."""
    print("DIMENSION MIGRATION VALIDATOR\n")
    
    completeness_ok = validate_dimension_completeness()
    references_ok = validate_template_references()
    
    if completeness_ok and references_ok:
        print("\n✅ ALL VALIDATIONS PASSED")
        sys.exit(0)
    else:
        print("\n❌ VALIDATION FAILED")
        sys.exit(1)

if __name__ == "__main__":
    main()