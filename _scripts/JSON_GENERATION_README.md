# JSON Generation Scripts

This directory contains Python scripts for generating JSON data files from Jekyll collection markdown files. These scripts support the hybrid architecture where YAML files are the source of truth and JSON files provide fast lookup for templates.

## Scripts Overview

### 1. `generate-brands-json.py`
Generates `_data/brands.json` from brand collection files in `_brands/en/`.

**Features:**
- Extracts YAML front matter from markdown files
- Maps fields (e.g., `title` → `name`, `founding_year` → `founded`)
- Validates country codes against `_data/countries.json`
- Checks coordinate ranges for location data
- Creates backup of existing JSON before overwriting
- Cross-validates founder references if `founders.json` exists

### 2. `generate-founders-json.py`
Generates `_data/founders.json` from founder collection files in `_founders/en/`.

**Features:**
- Extracts YAML front matter from markdown files
- Standardizes location structure (`country` not `country_code`)
- Validates country codes, language codes, and generation values
- Creates backup of existing JSON before overwriting
- Cross-validates brand references if `brands.json` exists
- Identifies orphaned founders not referenced by any brands

### 3. `generate-all-json.py`
Convenience script that runs both generators in sequence with cross-validation.

## Installation

Install required Python packages:
```bash
pip install python-frontmatter PyYAML
```

## Usage

### Basic Usage
```bash
# Generate brands.json
python _scripts/generate-brands-json.py

# Generate founders.json
python _scripts/generate-founders-json.py

# Generate both with cross-validation
python _scripts/generate-all-json.py
```

### Command Line Options

All scripts support these options:
- `--verbose` or `-v`: Show detailed processing information
- `--dry-run` or `-d`: Preview changes without writing files
- `--validate`: Enable data validation and cross-reference checks

### Examples
```bash
# Verbose mode with validation
python _scripts/generate-brands-json.py --verbose --validate

# Dry run to preview changes
python _scripts/generate-founders-json.py --dry-run

# Generate all with detailed output
python _scripts/generate-all-json.py -v

# Skip validation for faster processing
python _scripts/generate-all-json.py --no-validate
```

## Data Structure

### Brand JSON Structure
```json
{
  "brands": [
    {
      "ref": "br-serra-verde",
      "name": "Serra Verde Organics",
      "description": "Family-owned producer...",
      "founded": 1986,
      "founders": ["br-eduardo-santos"],
      "markets": ["brazil"],
      "sectors": ["gourmet-foods"],
      "location": {
        "lat": -22.6569,
        "lng": -45.8558,
        "city": "Gonçalves",
        "country": "br"
      },
      "export_ready": true,
      "export_markets": ["pt", "es"],
      "data_source": "curated"
    }
  ],
  "metadata": {
    "generated": "2024-01-15T10:30:00",
    "count": 25,
    "generator": "generate-brands-json.py",
    "version": "1.0"
  }
}
```

### Founder JSON Structure
```json
{
  "founders": [
    {
      "ref": "br-eduardo-santos",
      "name": "Eduardo Santos",
      "position": "CEO & Founder",
      "brief_bio": "Third generation farmer...",
      "brands": ["br-serra-verde"],
      "generation": "first",
      "location": {
        "country": "br",
        "city": "Gonçalves"
      },
      "expertise": ["organic farming", "sustainability"],
      "data_source": "curated"
    }
  ],
  "metadata": {
    "generated": "2024-01-15T10:31:00",
    "count": 20,
    "generator": "generate-founders-json.py",
    "version": "1.0"
  }
}
```

## Validation Features

### Data Integrity Checks
- Required fields validation (ref, name/title)
- Country code validation against `_data/countries.json`
- Coordinate range validation (lat: -90 to 90, lng: -180 to 180)
- Language code validation (en, ru, zh, pt, es, ar, fa, hi, id, am)
- Generation value validation (first, second, third, transition)

### Cross-Reference Validation
- Brands → Founders: Verifies all founder references exist
- Founders → Brands: Verifies all brand references exist
- Consistency check: Ref country prefix matches location country
- Orphaned founders: Identifies founders not referenced by any brands

## Error Handling

The scripts handle errors gracefully:
- Continue processing if individual files have errors
- Create detailed error and warning reports
- Return appropriate exit codes (0 = success, 1 = errors)
- Create `.backup` files before overwriting existing JSON

## Integration with Jekyll

The generated JSON files are used by Jekyll templates for:
- Fast lookups in Liquid templates
- Search functionality
- Cross-references between brands and founders
- Map data generation
- Filter interfaces

## Troubleshooting

### Common Issues

1. **Missing frontmatter library**
   ```bash
   pip install python-frontmatter
   ```

2. **File encoding errors**
   - Scripts use UTF-8 encoding for all file operations
   - Ensure markdown files are saved as UTF-8

3. **Validation warnings**
   - Check `_data/countries.json` exists and is valid
   - Ensure country codes use 2-letter ISO format
   - Verify founder/brand references match actual files

### Debug Mode
Use `--verbose` flag to see detailed processing information:
```bash
python _scripts/generate-brands-json.py --verbose --validate
```

## Maintenance

### Adding New Fields
1. Update the field mapping in `process_brand_file()` or `process_founder_file()`
2. Add validation logic if needed
3. Update this documentation

### Changing Field Names
1. Update the mapping dictionaries in the scripts
2. Ensure backward compatibility if needed
3. Test with existing data

### Performance
- Scripts process ~100 files in under 1 second
- JSON files are kept small for fast loading
- Use `--no-validate` for faster processing during development