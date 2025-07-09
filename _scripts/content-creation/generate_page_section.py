#!/usr/bin/env python3
"""
Generate Page Section Script for Brandmine Jekyll Site

Creates a new page section with all required files and configurations.

Usage:
    python3 _scripts/content-creation/generate_page_section.py page_type section_name "title" "subtitle" layout_type panel_type

Example:
    python3 _scripts/content-creation/generate_page_section.py brands brand-carousel-test "Brand Carousel Test" "Testing horizontal carousel layout" carousel panel--orange-soft
"""

import sys
import os
import yaml
import re
from pathlib import Path
from typing import Dict, List, Optional

class SectionGenerator:
    def __init__(self, root_dir: str = "."):
        self.root_dir = Path(root_dir)
        self.created_files = []
        self.modified_files = []
        
        # Layout templates
        self.layout_templates = {
            'grid': self._get_grid_template,
            'carousel': self._get_carousel_template,
            # 'masonry': self._get_masonry_template,
            # 'list': self._get_list_template,
            # 'hero': self._get_hero_template,
            # 'minimal': self._get_minimal_template
        }
        
        # CSS templates
        self.css_templates = {
            'grid': self._get_grid_css,
            'carousel': self._get_carousel_css,
            # 'masonry': self._get_masonry_css,
            # 'list': self._get_list_css,
            # 'hero': self._get_hero_css,
            # 'minimal': self._get_minimal_css
        }

    def generate_section(self, page_type: str, section_name: str, title: str, 
                        subtitle: str, layout_type: str, panel_type: str) -> bool:
        """Generate a new page section with all required files."""
        try:
            # Validate inputs
            self._validate_inputs(page_type, section_name, layout_type, panel_type)
            
            # Update page_sections.yml
            self._update_page_sections_yml(page_type, section_name, panel_type)
            
            # Create HTML include file
            self._create_html_include(page_type, section_name, title, subtitle, layout_type)
            
            # Update translation files
            self._update_translations(page_type, section_name, title, subtitle)
            
            # Create CSS file
            self._create_css_file(page_type, section_name, layout_type)
            
            # Print success message
            self._print_success_message(page_type, section_name, title)
            
            return True
            
        except Exception as e:
            print(f"❌ Error generating section: {e}")
            return False

    def _validate_inputs(self, page_type: str, section_name: str, 
                        layout_type: str, panel_type: str) -> None:
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
        
        # Check if section already exists
        if 'default_sections' in page_sections[page_type]:
            existing_sections = page_sections[page_type]['default_sections']
            if section_name in existing_sections:
                raise ValueError(f"Section '{section_name}' already exists in {page_type}")
        
        # Validate section_name format (kebab-case)
        if not re.match(r'^[a-z][a-z0-9-]*[a-z0-9]$', section_name):
            raise ValueError(f"Section name '{section_name}' must be kebab-case")
        
        # Validate layout_type
        if layout_type not in self.layout_templates:
            available_layouts = list(self.layout_templates.keys())
            raise ValueError(f"Layout type '{layout_type}' not supported. Available: {available_layouts}")
        
        # Validate panel_type format
        if not panel_type.startswith('panel--'):
            raise ValueError(f"Panel type '{panel_type}' must start with 'panel--'")

    def _update_page_sections_yml(self, page_type: str, section_name: str, panel_type: str) -> None:
        """Update the page_sections.yml configuration file."""
        page_sections_file = self.root_dir / "_data" / "page_sections.yml"
        
        with open(page_sections_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Parse YAML while preserving comments and structure
        page_sections = yaml.safe_load(content)
        
        # Add to default_sections
        if 'default_sections' not in page_sections[page_type]:
            page_sections[page_type]['default_sections'] = []
        
        page_sections[page_type]['default_sections'].append(section_name)
        
        # Add to panel_mappings
        if 'panel_mappings' not in page_sections[page_type]:
            page_sections[page_type]['panel_mappings'] = {}
        
        page_sections[page_type]['panel_mappings'][section_name] = panel_type
        
        # Write back to file
        with open(page_sections_file, 'w', encoding='utf-8') as f:
            yaml.dump(page_sections, f, default_flow_style=False, allow_unicode=True, sort_keys=False)
        
        self.modified_files.append(str(page_sections_file))

    def _create_html_include(self, page_type: str, section_name: str, 
                           title: str, subtitle: str, layout_type: str) -> None:
        """Create the HTML include file for the section."""
        include_dir = self.root_dir / "_includes" / "pages" / page_type
        include_dir.mkdir(parents=True, exist_ok=True)
        
        include_file = include_dir / f"{section_name}.html"
        
        # Generate template content
        template_func = self.layout_templates[layout_type]
        content = template_func(page_type, section_name, title, subtitle)
        
        with open(include_file, 'w', encoding='utf-8') as f:
            f.write(content)
        
        self.created_files.append(str(include_file))

    def _update_translations(self, page_type: str, section_name: str, 
                           title: str, subtitle: str) -> None:
        """Update translation files with new keys."""
        translations_dir = self.root_dir / "_data" / "translations"
        
        # Translation keys
        title_key = f"{page_type}.{section_name}_title"
        subtitle_key = f"{page_type}.{section_name}_subtitle"
        
        # Update English translations
        en_file = translations_dir / "en.yml"
        self._update_translation_file(en_file, title_key, title)
        self._update_translation_file(en_file, subtitle_key, subtitle)
        
        # Add placeholder keys for other languages
        for lang in ['ru', 'zh']:
            lang_file = translations_dir / f"{lang}.yml"
            if lang_file.exists():
                self._update_translation_file(lang_file, title_key, f"[{lang.upper()}] {title}")
                self._update_translation_file(lang_file, subtitle_key, f"[{lang.upper()}] {subtitle}")

    def _update_translation_file(self, file_path: Path, key: str, value: str) -> None:
        """Update a single translation file with a new key-value pair."""
        if file_path.exists():
            with open(file_path, 'r', encoding='utf-8') as f:
                translations = yaml.safe_load(f) or {}
        else:
            translations = {}
        
        # Create nested structure if needed
        keys = key.split('.')
        current = translations
        for k in keys[:-1]:
            if k not in current:
                current[k] = {}
            current = current[k]
        
        # Set the final value
        current[keys[-1]] = value
        
        # Write back to file
        with open(file_path, 'w', encoding='utf-8') as f:
            yaml.dump(translations, f, default_flow_style=False, allow_unicode=True, sort_keys=False)
        
        if str(file_path) not in self.modified_files:
            self.modified_files.append(str(file_path))

    def _create_css_file(self, page_type: str, section_name: str, layout_type: str) -> None:
        """Create the CSS file for the section."""
        css_dir = self.root_dir / "assets" / "css" / "pages" / page_type
        css_dir.mkdir(parents=True, exist_ok=True)
        
        css_file = css_dir / f"{section_name}.scss"
        
        # Generate CSS content
        css_func = self.css_templates[layout_type]
        content = css_func(section_name)
        
        with open(css_file, 'w', encoding='utf-8') as f:
            f.write(content)
        
        self.created_files.append(str(css_file))

    def _get_grid_template(self, page_type: str, section_name: str, title: str, subtitle: str) -> str:
        """Generate grid layout HTML template."""
        singular_type = page_type.rstrip('s')
        template = '''{% comment %}
  SECTION: SECTION_NAME
  PURPOSE: SUBTITLE_TEXT
  LAYOUT: Grid display with responsive cards
{% endcomment %}

<div class="SECTION_NAME">
  <div class="panel__content-header">
    <h2 id="heading-SECTION_NAME" class="panel__heading-secondary">
      {% include helpers/t.html key="PAGE_TYPE.SECTION_NAME_title" fallback="TITLE_TEXT" %}
    </h2>
    <p class="panel__subtitle">
      {% include helpers/t.html key="PAGE_TYPE.SECTION_NAME_subtitle" fallback="SUBTITLE_TEXT" %}
    </p>
  </div>

  <div class="SECTION_NAME__container">
    {% assign test_items = site.PAGE_TYPE | where: "lang", page.lang | limit: 6 %}
    
    <div class="SECTION_NAME__grid">
      {% for item in test_items %}
        {% include components/cards/universal-card.html
           item=item
           type="SINGULAR_TYPE"
           variant="standard"
           context="grid-test"
           config_set="universal-card" %}
      {% endfor %}
    </div>
  </div>
</div>'''
        
        replacements = {
            'SECTION_NAME': section_name,
            'PAGE_TYPE': page_type,
            'SINGULAR_TYPE': singular_type,
            'TITLE_TEXT': title,
            'SUBTITLE_TEXT': subtitle
        }
        result = template
        for placeholder, value in replacements.items():
            result = result.replace(placeholder, value)
        return result

    def _get_carousel_template(self, page_type: str, section_name: str, title: str, subtitle: str) -> str:
        """Generate carousel layout HTML template."""
        singular_type = page_type.rstrip('s')
        template = '''{% comment %}
  SECTION: SECTION_NAME
  PURPOSE: SUBTITLE_TEXT
  LAYOUT: Horizontal scrolling carousel
{% endcomment %}

<div class="SECTION_NAME">
  <div class="panel__content-header">
    <h2 id="heading-SECTION_NAME" class="panel__heading-secondary">
      {% include helpers/t.html key="PAGE_TYPE.SECTION_NAME_title" fallback="TITLE_TEXT" %}
    </h2>
    <p class="panel__subtitle">
      {% include helpers/t.html key="PAGE_TYPE.SECTION_NAME_subtitle" fallback="SUBTITLE_TEXT" %}
    </p>
  </div>

  <div class="SECTION_NAME__container">
    {% assign test_items = site.PAGE_TYPE | where: "lang", page.lang | limit: 8 %}
    
    <div class="SECTION_NAME__carousel" data-carousel="true">
      <div class="SECTION_NAME__track">
        {% for item in test_items %}
          <div class="SECTION_NAME__slide">
            {% include components/cards/universal-card.html
               item=item
               type="SINGULAR_TYPE"
               variant="compact"
               context="carousel"
               config_set="universal-card" %}
          </div>
        {% endfor %}
      </div>
      
      <div class="SECTION_NAME__nav">
        <button class="SECTION_NAME__nav-btn SECTION_NAME__nav-btn--prev" aria-label="Previous">‹</button>
        <button class="SECTION_NAME__nav-btn SECTION_NAME__nav-btn--next" aria-label="Next">›</button>
      </div>
    </div>
  </div>
</div>'''
        
        replacements = {
            'SECTION_NAME': section_name,
            'PAGE_TYPE': page_type,
            'SINGULAR_TYPE': singular_type,
            'TITLE_TEXT': title,
            'SUBTITLE_TEXT': subtitle
        }
        result = template
        for placeholder, value in replacements.items():
            result = result.replace(placeholder, value)
        return result

    def _get_grid_css(self, section_name: str) -> str:
        """Generate grid layout CSS."""
        return f'''.{section_name} {{
  &__container {{
    margin-top: var(--space-8);
  }}

  &__grid {{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: var(--space-6);
    
    @media (max-width: 768px) {{
      grid-template-columns: 1fr;
      gap: var(--space-4);
    }}
  }}
}}'''

    def _get_carousel_css(self, section_name: str) -> str:
        """Generate carousel layout CSS."""
        return f'''.{section_name} {{
  &__container {{
    margin-top: var(--space-8);
  }}

  &__carousel {{
    position: relative;
    overflow: hidden;
  }}

  &__track {{
    display: flex;
    gap: var(--space-4);
    overflow-x: auto;
    scroll-snap-type: x mandatory;
    padding-bottom: var(--space-2);
    
    &::-webkit-scrollbar {{
      height: 8px;
    }}
    
    &::-webkit-scrollbar-track {{
      background: var(--gray-100);
      border-radius: 4px;
    }}
    
    &::-webkit-scrollbar-thumb {{
      background: var(--gray-400);
      border-radius: 4px;
    }}
  }}

  &__slide {{
    flex: 0 0 300px;
    scroll-snap-align: start;
    
    @media (max-width: 768px) {{
      flex: 0 0 280px;
    }}
  }}

  &__nav {{
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    justify-content: space-between;
    width: 100%;
    pointer-events: none;
  }}

  &__nav-btn {{
    background: white;
    border: 1px solid var(--gray-300);
    border-radius: 50%;
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    font-weight: bold;
    color: var(--gray-600);
    cursor: pointer;
    pointer-events: auto;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    
    &:hover {{
      background: var(--gray-50);
      color: var(--gray-800);
    }}
  }}
}}'''

    def _print_success_message(self, page_type: str, section_name: str, title: str) -> None:
        """Print success message with file list and next steps."""
        print(f"✅ Section '{section_name}' added successfully!")
        print()
        print("Files created/modified:")
        
        for file_path in self.modified_files:
            print(f"- {file_path} (modified)")
        
        for file_path in self.created_files:
            print(f"- {file_path} (new)")
        
        print()
        print("Next steps:")
        print("1. Run: bundle exec jekyll serve --livereload")
        print(f"2. Visit: http://localhost:4000/en/{page_type}/")
        print(f'3. Look for: "{title}" section')
        print("4. Customize the generated files as needed")
        print()
        print("To remove this section:")
        print(f"python3 _scripts/content-creation/remove_page_section.py {page_type} {section_name}")


def main():
    """Main function to handle command line arguments."""
    if len(sys.argv) != 7:
        print("Usage: python3 generate_page_section.py page_type section_name \"title\" \"subtitle\" layout_type panel_type")
        print()
        print("Example:")
        print('python3 generate_page_section.py brands brand-carousel-test "Brand Carousel Test" "Testing horizontal carousel layout" carousel panel--orange-soft')
        print()
        print("Available layout types: grid, carousel, masonry, list, hero, minimal")
        print("Panel types: panel--light, panel--orange-soft, panel--sky-soft, etc.")
        sys.exit(1)
    
    page_type = sys.argv[1]
    section_name = sys.argv[2]
    title = sys.argv[3]
    subtitle = sys.argv[4]
    layout_type = sys.argv[5]
    panel_type = sys.argv[6]
    
    generator = SectionGenerator()
    success = generator.generate_section(page_type, section_name, title, subtitle, layout_type, panel_type)
    
    if not success:
        sys.exit(1)


if __name__ == "__main__":
    main()