#!/usr/bin/env python3
"""
Generate founders.json from Jekyll founder collection files

This script scans all English founder markdown files in _founders/en/,
extracts YAML front matter, and generates a unified founders.json file
for fast template lookups.

Usage:
    python generate-founders-json.py [--verbose] [--dry-run] [--validate]
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


class FounderJSONGenerator:
    """Generate founders.json from Jekyll founder collection files"""
    
    def __init__(self, verbose=False, dry_run=False, validate=False):
        self.verbose = verbose
        self.dry_run = dry_run
        self.validate = validate
        self.base_path = Path(__file__).parent.parent.parent  # Project root (3 levels up)
        self.founders_path = self.base_path / "_founders" / "en"
        self.output_path = self.base_path / "_data" / "founders.json"
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
    
    def process_founder_file(self, filepath):
        """Process a single founder markdown file"""
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
            
            if not yaml_data.get('name'):
                self.errors.append(f"{filepath}: Missing required field 'name'")
                return None
            
            # Map fields from YAML to JSON structure
            founder_data = {
                "ref": yaml_data.get('ref'),
                "name": yaml_data.get('name'),
                "position": yaml_data.get('position', ''),
                "brief_bio": yaml_data.get('brief_bio', ''),
                "brands": yaml_data.get('brands', []),
                "generation": yaml_data.get('generation'),
                "location": self._process_location(yaml_data.get('location', {})),
                "expertise": yaml_data.get('expertise', []),
                "achievements": yaml_data.get('achievements', []),
                "languages": yaml_data.get('languages', []),
                "markets": yaml_data.get('markets', []),
                "cross_border_expertise": yaml_data.get('cross_border_expertise', False),
                "featured": yaml_data.get('featured', False),
                "company": yaml_data.get('company'),
                "social": yaml_data.get('social', {}),
                "portrait_image": yaml_data.get('portrait_image', False),
                "data_source": "curated"
            }
            
            # Remove empty optional fields
            founder_data = {k: v for k, v in founder_data.items() 
                          if v is not None and v != '' and v != [] and v != {}}
            
            # Validate data if requested
            if self.validate:
                self._validate_founder_data(founder_data, filepath)
            
            self.processed_count += 1
            return founder_data
            
        except Exception as e:
            self.errors.append(f"{filepath}: Error processing file - {e}")
            return None
    
    def _process_location(self, location_data):
        """Process and standardize location data"""
        if not location_data:
            return {}
        
        processed = {
            "country": location_data.get('country'),  # Standardized: 'country' not 'country_code'
            "city": location_data.get('city'),
            "region": location_data.get('region')
        }
        
        # Remove None values
        return {k: v for k, v in processed.items() if v is not None}
    
    def _validate_founder_data(self, founder_data, filepath):
        """Validate founder data integrity"""
        ref = founder_data.get('ref')
        
        # Validate country code
        if founder_data.get('location', {}).get('country'):
            country = founder_data['location']['country']
            if self.valid_countries and country not in self.valid_countries:
                self.warnings.append(f"{filepath}: Unknown country code '{country}'")
        
        # Validate markets
        for market in founder_data.get('markets', []):
            if self.valid_countries and market not in self.valid_countries:
                self.warnings.append(f"{filepath}: Unknown market code '{market}'")
        
        # Validate language codes
        valid_languages = {'en', 'ru', 'zh', 'pt', 'es', 'ar', 'fa', 'hi', 'id', 'am'}
        for lang in founder_data.get('languages', []):
            if lang not in valid_languages:
                self.warnings.append(f"{filepath}: Unknown language code '{lang}'")
        
        # Validate generation
        valid_generations = {'first', 'second', 'third', 'transition'}
        generation = founder_data.get('generation')
        if generation and generation not in valid_generations:
            self.warnings.append(f"{filepath}: Invalid generation '{generation}'")
        
        # Check for consistency between ref and location country
        if ref and '-' in ref:
            ref_country = ref.split('-')[0]
            location_country = founder_data.get('location', {}).get('country')
            if location_country and ref_country != location_country:
                self.warnings.append(
                    f"{filepath}: Ref country '{ref_country}' doesn't match "
                    f"location country '{location_country}'"
                )
    
    def generate_json(self):
        """Generate the founders.json file"""
        self.log(f"Scanning for founder files in: {self.founders_path}")
        
        # Find all English founder markdown files
        pattern = str(self.founders_path / "*.md")
        founder_files = glob.glob(pattern)
        
        if not founder_files:
            self.errors.append(f"No founder files found in {self.founders_path}")
            return False
        
        self.log(f"Found {len(founder_files)} founder files to process")
        
        # Process each founder file
        founders = []
        for filepath in sorted(founder_files):
            self.log(f"Processing: {os.path.basename(filepath)}")
            founder_data = self.process_founder_file(filepath)
            if founder_data:
                founders.append(founder_data)
        
        # Sort founders by ref for consistent output
        founders.sort(key=lambda x: x.get('ref', ''))
        
        # Create the final JSON structure
        output_data = {
            "founders": founders,
            "metadata": {
                "generated": datetime.now().isoformat(),
                "count": len(founders),
                "generator": "generate-founders-json.py",
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
    
    def cross_validate_brands(self):
        """Validate brand references if brands.json exists"""
        brands_json_path = self.base_path / "_data" / "brands.json"
        
        if not brands_json_path.exists():
            self.log("Skipping brand validation - brands.json not found", "warn")
            return
        
        try:
            with open(brands_json_path, 'r', encoding='utf-8') as f:
                brands_data = json.load(f)
            
            brand_refs = {b['ref'] for b in brands_data.get('brands', [])}
            
            # Re-scan founder files to check brand references
            for filepath in glob.glob(str(self.founders_path / "*.md")):
                with open(filepath, 'r', encoding='utf-8') as f:
                    post = frontmatter.load(f)
                
                founder_ref = post.metadata.get('ref')
                for brand_ref in post.metadata.get('brands', []):
                    if brand_ref not in brand_refs:
                        self.warnings.append(
                            f"Founder '{founder_ref}' references unknown brand '{brand_ref}'"
                        )
        
        except Exception as e:
            self.warnings.append(f"Could not validate brands: {e}")
    
    def check_orphaned_founders(self):
        """Check for founders not referenced by any brands"""
        brands_json_path = self.base_path / "_data" / "brands.json"
        
        if not brands_json_path.exists():
            return
        
        try:
            # Load brands data
            with open(brands_json_path, 'r', encoding='utf-8') as f:
                brands_data = json.load(f)
            
            # Collect all founder references from brands
            referenced_founders = set()
            for brand in brands_data.get('brands', []):
                referenced_founders.update(brand.get('founders', []))
            
            # Check each founder
            for filepath in glob.glob(str(self.founders_path / "*.md")):
                with open(filepath, 'r', encoding='utf-8') as f:
                    post = frontmatter.load(f)
                
                founder_ref = post.metadata.get('ref')
                if founder_ref and founder_ref not in referenced_founders:
                    self.warnings.append(
                        f"Founder '{founder_ref}' is not referenced by any brands"
                    )
        
        except Exception as e:
            self.warnings.append(f"Could not check orphaned founders: {e}")
    
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
            self.cross_validate_brands()
            self.check_orphaned_founders()
        
        self.print_summary()
        
        # Return appropriate exit code
        return 0 if not self.errors else 1


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description="Generate founders.json from Jekyll founder collection files",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                    # Generate founders.json
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
    generator = FounderJSONGenerator(
        verbose=args.verbose,
        dry_run=args.dry_run,
        validate=args.validate
    )
    
    exit_code = generator.run()
    sys.exit(exit_code)


if __name__ == "__main__":
    main()