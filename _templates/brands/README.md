# Brandmine Brand Templates

This directory contains templates for creating brand profiles at different levels of detail:

## Templates

- **brand-core.md**: Absolute minimum required fields (rapid entry)
- **brand-lite.md**: Basic profile with essential sections (standard profiles)
- **brand-full.md**: Comprehensive profile with all possible fields (featured brands)

## Usage

1. Copy the appropriate template to `_brands/en/your-brand-name.md`
2. Fill in the required information
3. Process images with `./_scripts/process_brand_images.sh your-brand-name`
4. Test the brand page
5. Optionally create translations in `_brands/ru/` and `_brands/zh/`

## Template Selection Guide

- Use **Core** when only minimal information is available
- Use **Lite** for standard non-featured brands
- Use **Full** for featured brands or when extensive information is available

Brands can be progressively enhanced by starting with the Core template and later upgrading to Lite or Full as more information becomes available.