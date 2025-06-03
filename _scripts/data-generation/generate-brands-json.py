#!/usr/bin/env python3
"""
Generate brands.json from Jekyll brand collection files

This script scans all English brand markdown files in _brands/en/,
extracts YAML front matter, and generates a unified brands.json file
for fast template lookups.

Usage:
    python generate-brands-json.py [--verbose] [--dry-run] [--validate]
"""

import os
import sys
import json
import yaml
import argparse
import glob
import shutil
from datetime import datetime
from pathlib import Path

try:
    import frontmatter
except ImportError:
    print("Error: frontmatter library not installed.")
    print("Install with: pip install python-frontmatter")
    sys.exit(1)


class BrandJSONGenerator:
    """Generate brands.json from Jekyll brand collection files"""
    
    def __init__(self, verbose=False, dry_run=False, validate=False):
        self.verbose = verbose
        self.dry_run = dry_run
        self.validate = validate
        self.base_path = Path(__file__).parent.parent  # Project root
        self.brands_path = self.base_path / "_brands" / "en"
        self.output_path = self.base_path / "_data" / "brands.json"
        self.countries_path = self.base_path / "_data" / "countries.json"
        self.errors = []
        self.warnings = []
        self.processed_count = 0
        self.valid_countries = self._load_valid_countries()
        
    def _load_valid_countries(self):
        """Load valid country codes from countries.json"""
        try:
            with open(self.countries_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
                return set(data.get('countries', {}).keys())
        except Exception as e:
            self.warnings.append(f"Could not load countries.json: {e}")
            return set()
    
    def log(self, message, level="info"):
        """Log message if verbose mode is enabled"""
        if self.verbose:
            prefix = {
                "info": "[INFO]",
                "warn": "[WARN]",
                "error": "[ERROR]",
                "success": "[SUCCESS]"
            }.get(level, "[INFO]")
            print(f"{prefix} {message}")
    
    def process_brand_file(self, filepath):
        """Process a single brand markdown file"""
        try:
            # Load the markdown file with front matter
            with open(filepath, 'r', encoding='utf-8') as f:
                post = frontmatter.load(f)
            
            # Extract YAML data
            yaml_data = post.metadata
            
            # Validate required fields
            if not yaml_data.get('ref'):
                self.errors.append(f"{filepath}: Missing required field 'ref'")
                return None
            
            if not yaml_data.get('title'):
                self.errors.append(f"{filepath}: Missing required field 'title'")
                return None
            
            # Map fields from YAML to JSON structure
            brand_data = {
                "ref": yaml_data.get('ref'),
                "name": yaml_data.get('title'),  # Map title to name
                "description": yaml_data.get('description', ''),
                "founded": yaml_data.get('founding_year'),  # Map founding_year to founded
                "founders": yaml_data.get('founders', []),
                "markets": yaml_data.get('markets', []),
                "sectors": yaml_data.get('sectors', []),
                "attributes": yaml_data.get('attributes', []),
                "signals": yaml_data.get('signals', []),
                "location": self._process_location(yaml_data.get('location', {})),
                "export_ready": yaml_data.get('export_ready', False),
                "export_markets": yaml_data.get('export_markets', []),
                "website": yaml_data.get('website'),
                "featured": yaml_data.get('featured', False),
                "featured_level": yaml_data.get('featured_level', 0),
                "data_source": "curated"
            }
            
            # Validate data if requested
            if self.validate:
                self._validate_brand_data(brand_data, filepath)
            
            self.processed_count += 1
            return brand_data
            
        except Exception as e:
            self.errors.append(f"{filepath}: Error processing file - {e}")
            return None
    
    def _process_location(self, location_data):
        """Process and validate location data"""
        if not location_data:
            return {}
        
        processed = {
            "lat": location_data.get('lat'),
            "lng": location_data.get('lng'),
            "city": location_data.get('city'),
            "country": location_data.get('country'),  # Using 'country' not 'country_code'
            "region": location_data.get('region')
        }
        
        # Validate coordinates if present
        if processed.get('lat') is not None:
            try:
                lat = float(processed['lat'])
                if not -90 <= lat <= 90:
                    self.warnings.append(f"Invalid latitude: {lat}")
            except (ValueError, TypeError):
                self.warnings.append(f"Invalid latitude format: {processed['lat']}")
        
        if processed.get('lng') is not None:
            try:
                lng = float(processed['lng'])
                if not -180 <= lng <= 180:
                    self.warnings.append(f"Invalid longitude: {lng}")
            except (ValueError, TypeError):
                self.warnings.append(f"Invalid longitude format: {processed['lng']}")
        
        # Remove None values
        return {k: v for k, v in processed.items() if v is not None}
    
    def _validate_brand_data(self, brand_data, filepath):
        """Validate brand data integrity"""
        ref = brand_data.get('ref')
        
        # Validate country code
        if brand_data.get('location', {}).get('country'):
            country = brand_data['location']['country']
            if self.valid_countries and country not in self.valid_countries:
                self.warnings.append(f"{filepath}: Unknown country code '{country}'")
        
        # Validate markets
        for market in brand_data.get('markets', []):
            if self.valid_countries and market not in self.valid_countries:
                self.warnings.append(f"{filepath}: Unknown market code '{market}'")
        
        # Check for consistency between ref and location country
        if ref and '-' in ref:
            ref_country = ref.split('-')[0]
            location_country = brand_data.get('location', {}).get('country')
            if location_country and ref_country != location_country:
                self.warnings.append(
                    f"{filepath}: Ref country '{ref_country}' doesn't match "
                    f"location country '{location_country}'"
                )
    
    def generate_json(self):
        """Generate the brands.json file"""
        self.log(f"Scanning for brand files in: {self.brands_path}")
        
        # Find all English brand markdown files
        pattern = str(self.brands_path / "*.md")
        brand_files = glob.glob(pattern)
        
        if not brand_files:
            self.errors.append(f"No brand files found in {self.brands_path}")
            return False
        
        self.log(f"Found {len(brand_files)} brand files to process")
        
        # Process each brand file
        brands = []
        for filepath in sorted(brand_files):
            self.log(f"Processing: {os.path.basename(filepath)}")
            brand_data = self.process_brand_file(filepath)
            if brand_data:
                brands.append(brand_data)
        
        # Sort brands by ref for consistent output
        brands.sort(key=lambda x: x.get('ref', ''))
        
        # Create the final JSON structure
        output_data = {
            "brands": brands,
            "metadata": {
                "generated": datetime.now().isoformat(),
                "count": len(brands),
                "generator": "generate-brands-json.py",
                "version": "1.0"
            }
        }
        
        # Write the JSON file
        if not self.dry_run:
            # Create backup if file exists
            if self.output_path.exists():
                backup_path = self.output_path.with_suffix('.json.backup')
                shutil.copy2(self.output_path, backup_path)
                self.log(f"Created backup: {backup_path}", "success")
            
            # Ensure directory exists
            self.output_path.parent.mkdir(parents=True, exist_ok=True)
            
            # Write the new JSON file
            with open(self.output_path, 'w', encoding='utf-8') as f:
                json.dump(output_data, f, indent=2, ensure_ascii=False)
            
            self.log(f"Generated: {self.output_path}", "success")
        else:
            self.log("DRY RUN - Would generate:", "info")
            print(json.dumps(output_data, indent=2, ensure_ascii=False))
        
        return True
    
    def cross_validate_founders(self):
        """Validate founder references if founders.json exists"""
        founders_json_path = self.base_path / "_data" / "founders.json"
        
        if not founders_json_path.exists():
            self.log("Skipping founder validation - founders.json not found", "warn")
            return
        
        try:
            with open(founders_json_path, 'r', encoding='utf-8') as f:
                founders_data = json.load(f)
            
            founder_refs = {f['ref'] for f in founders_data.get('founders', [])}
            
            # Re-scan brand files to check founder references
            for filepath in glob.glob(str(self.brands_path / "*.md")):
                with open(filepath, 'r', encoding='utf-8') as f:
                    post = frontmatter.load(f)
                
                brand_ref = post.metadata.get('ref')
                for founder_ref in post.metadata.get('founders', []):
                    if founder_ref not in founder_refs:
                        self.warnings.append(
                            f"Brand '{brand_ref}' references unknown founder '{founder_ref}'"
                        )
        
        except Exception as e:
            self.warnings.append(f"Could not validate founders: {e}")
    
    def print_summary(self):
        """Print processing summary"""
        print("\n" + "="*60)
        print("PROCESSING SUMMARY")
        print("="*60)
        print(f"Files processed: {self.processed_count}")
        print(f"Errors: {len(self.errors)}")
        print(f"Warnings: {len(self.warnings)}")
        
        if self.errors:
            print("\nERRORS:")
            for error in self.errors:
                print(f"  - {error}")
        
        if self.warnings:
            print("\nWARNINGS:")
            for warning in self.warnings:
                print(f"  - {warning}")
        
        print("="*60)
    
    def run(self):
        """Run the generation process"""
        success = self.generate_json()
        
        if self.validate and success:
            self.cross_validate_founders()
        
        self.print_summary()
        
        # Return appropriate exit code
        return 0 if not self.errors else 1


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description="Generate brands.json from Jekyll brand collection files",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                    # Generate brands.json
  %(prog)s --verbose          # Show detailed processing info
  %(prog)s --dry-run          # Preview without writing files
  %(prog)s --validate         # Include data validation checks
  %(prog)s -v --validate      # Verbose mode with validation
        """
    )
    
    parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )
    
    parser.add_argument(
        '-d', '--dry-run',
        action='store_true',
        help='Preview changes without writing files'
    )
    
    parser.add_argument(
        '--validate',
        action='store_true',
        help='Enable data validation and cross-reference checks'
    )
    
    args = parser.parse_args()
    
    # Create and run generator
    generator = BrandJSONGenerator(
        verbose=args.verbose,
        dry_run=args.dry_run,
        validate=args.validate
    )
    
    exit_code = generator.run()
    sys.exit(exit_code)


if __name__ == "__main__":
    main()