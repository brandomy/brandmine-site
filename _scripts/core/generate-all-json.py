#!/usr/bin/env python3
"""
Generate all JSON files from Jekyll collections

This convenience script runs both brand and founder JSON generators
in the correct order with cross-validation.

Usage:
    python generate-all-json.py [--verbose] [--dry-run]
"""

import subprocess
import sys
import argparse


def run_generator(script_name, args):
    """Run a generator script with given arguments"""
    import os
    # Get the _scripts directory (parent of core/)
    scripts_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    script_path = os.path.join(scripts_dir, "data-generation", script_name)
    cmd = [sys.executable, script_path]
    
    if args.verbose:
        cmd.append('--verbose')
    if args.dry_run:
        cmd.append('--dry-run')
    if not args.no_validate:
        cmd.append('--validate')
    
    print(f"\n{'='*60}")
    print(f"Running {script_name}")
    print('='*60)
    
    result = subprocess.run(cmd)
    return result.returncode


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description="Generate all JSON files from Jekyll collections",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
This script runs both generators in sequence:
1. generate-brands-json.py - Creates _data/brands.json
2. generate-founders-json.py - Creates _data/founders.json

The generators will validate cross-references between brands and founders.

Examples:
  %(prog)s                    # Generate all JSON files with validation
  %(prog)s --verbose          # Show detailed processing info
  %(prog)s --dry-run          # Preview without writing files
  %(prog)s --no-validate      # Skip validation checks
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
        '--no-validate',
        action='store_true',
        help='Skip validation checks'
    )
    
    args = parser.parse_args()
    
    # Run brands generator first
    brands_exit = run_generator('generate-brands-json.py', args)
    
    # Run founders generator
    founders_exit = run_generator('generate-founders-json.py', args)
    
    # Summary
    print(f"\n{'='*60}")
    print("OVERALL SUMMARY")
    print('='*60)
    print(f"Brands generator: {'SUCCESS' if brands_exit == 0 else 'FAILED'}")
    print(f"Founders generator: {'SUCCESS' if founders_exit == 0 else 'FAILED'}")
    
    if brands_exit == 0 and founders_exit == 0:
        print("\nAll JSON files generated successfully!")
        if not args.no_validate:
            print("Cross-validation completed.")
    else:
        print("\nSome generators encountered errors. Check output above.")
    
    print('='*60)
    
    # Exit with error if any generator failed
    sys.exit(1 if (brands_exit != 0 or founders_exit != 0) else 0)


if __name__ == "__main__":
    main()