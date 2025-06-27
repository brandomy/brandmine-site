#!/usr/bin/env python3
"""
Remove Page Section Script for Brandmine Jekyll Site

Removes a page section and all its associated files.

Usage:
    python3 _scripts/content-creation/remove_page_section.py page_type section_name

Example:
    python3 _scripts/content-creation/remove_page_section.py brands brand-carousel-test
"""

import sys
import os
import yaml
from pathlib import Path
from typing import Dict, List, Optional

class SectionRemover:
    def __init__(self, root_dir: str = "."):
        self.root_dir = Path(root_dir)
        self.removed_files = []
        self.modified_files = []

    def remove_section(self, page_type: str, section_name: str) -> bool:
        """Remove a page section and all its associated files."""
        try:
            # Validate inputs
            self._validate_inputs(page_type, section_name)
            
            # Remove from page_sections.yml
            self._update_page_sections_yml(page_type, section_name)
            
            # Remove HTML include file
            self._remove_html_include(page_type, section_name)
            
            # Remove translation keys
            self._remove_translations(page_type, section_name)
            
            # Remove CSS file
            self._remove_css_file(page_type, section_name)
            
            # Print success message
            self._print_success_message(page_type, section_name)
            
            return True
            
        except Exception as e:
            print(f"❌ Error removing section: {e}")
            return False

    def _validate_inputs(self, page_type: str, section_name: str) -> None:
        """Validate all input parameters."""
        # Check if page_sections.yml exists
        page_sections_file = self.root_dir / "_data" / "page_sections.yml"
        if not page_sections_file.exists():
            raise FileNotFoundError("_data/page_sections.yml not found")
        
        # Load and validate page_type exists
        with open(page_sections_file, 'r', encoding='utf-8') as f:
            page_sections = yaml.safe_load(f)
        
        if page_type not in page_sections:
            available_types = list(page_sections.keys())
            raise ValueError(f"Page type '{page_type}' not found. Available: {available_types}")
        
        # Check if section exists
        if 'default_sections' in page_sections[page_type]:
            existing_sections = page_sections[page_type]['default_sections']
            if section_name not in existing_sections:
                raise ValueError(f"Section '{section_name}' not found in {page_type}")

    def _update_page_sections_yml(self, page_type: str, section_name: str) -> None:
        """Remove the section from page_sections.yml configuration file."""
        page_sections_file = self.root_dir / "_data" / "page_sections.yml"
        
        with open(page_sections_file, 'r', encoding='utf-8') as f:
            page_sections = yaml.safe_load(f)
        
        # Remove from default_sections
        if 'default_sections' in page_sections[page_type]:
            if section_name in page_sections[page_type]['default_sections']:
                page_sections[page_type]['default_sections'].remove(section_name)
        
        # Remove from panel_mappings
        if 'panel_mappings' in page_sections[page_type]:
            if section_name in page_sections[page_type]['panel_mappings']:
                del page_sections[page_type]['panel_mappings'][section_name]
        
        # Write back to file
        with open(page_sections_file, 'w', encoding='utf-8') as f:
            yaml.dump(page_sections, f, default_flow_style=False, allow_unicode=True, sort_keys=False)
        
        self.modified_files.append(str(page_sections_file))

    def _remove_html_include(self, page_type: str, section_name: str) -> None:
        """Remove the HTML include file for the section."""
        include_file = self.root_dir / "_includes" / "pages" / page_type / f"{section_name}.html"
        
        if include_file.exists():
            include_file.unlink()
            self.removed_files.append(str(include_file))

    def _remove_translations(self, page_type: str, section_name: str) -> None:
        """Remove translation keys from translation files."""
        translations_dir = self.root_dir / "_data" / "translations"
        
        # Translation keys to remove
        title_key = f"{page_type}.{section_name}_title"
        subtitle_key = f"{page_type}.{section_name}_subtitle"
        
        # Remove from all language files
        for lang_file in translations_dir.glob("*.yml"):
            if lang_file.exists():
                self._remove_translation_keys(lang_file, [title_key, subtitle_key])

    def _remove_translation_keys(self, file_path: Path, keys: List[str]) -> None:
        """Remove specific keys from a translation file."""
        with open(file_path, 'r', encoding='utf-8') as f:
            translations = yaml.safe_load(f) or {}
        
        modified = False
        for key in keys:
            keys_parts = key.split('.')
            current = translations
            
            # Navigate to the parent of the key to remove
            for k in keys_parts[:-1]:
                if k in current and isinstance(current[k], dict):
                    current = current[k]
                else:
                    break
            else:
                # Remove the final key if it exists
                if keys_parts[-1] in current:
                    del current[keys_parts[-1]]
                    modified = True
        
        # Write back to file only if modified
        if modified:
            with open(file_path, 'w', encoding='utf-8') as f:
                yaml.dump(translations, f, default_flow_style=False, allow_unicode=True, sort_keys=False)
            
            if str(file_path) not in self.modified_files:
                self.modified_files.append(str(file_path))

    def _remove_css_file(self, page_type: str, section_name: str) -> None:
        """Remove the CSS file for the section."""
        css_file = self.root_dir / "assets" / "css" / "pages" / page_type / f"{section_name}.scss"
        
        if css_file.exists():
            css_file.unlink()
            self.removed_files.append(str(css_file))

    def _print_success_message(self, page_type: str, section_name: str) -> None:
        """Print success message with file list."""
        print(f"✅ Section '{section_name}' removed successfully!")
        print()
        
        if self.removed_files:
            print("Files removed:")
            for file_path in self.removed_files:
                print(f"- {file_path}")
        
        if self.modified_files:
            print("Files modified:")
            for file_path in self.modified_files:
                print(f"- {file_path}")
        
        print()
        print("The section has been completely removed from the system.")
        print("You may need to restart your Jekyll server to see the changes.")


def main():
    """Main function to handle command line arguments."""
    if len(sys.argv) != 3:
        print("Usage: python3 remove_page_section.py page_type section_name")
        print()
        print("Example:")
        print('python3 remove_page_section.py brands brand-carousel-test')
        sys.exit(1)
    
    page_type = sys.argv[1]
    section_name = sys.argv[2]
    
    remover = SectionRemover()
    success = remover.remove_section(page_type, section_name)
    
    if not success:
        sys.exit(1)


if __name__ == "__main__":
    main()