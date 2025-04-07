#!/usr/bin/env python3
"""
Styleguide Code Example Converter

This script converts old-style code examples in Brandmine's styleguide markdown files
to use the new code-example.html include pattern.

Usage:
    python3 convert_styleguide.py path/to/styleguide/directory

The script will:
1. Find all markdown files in the specified directory
2. Convert old-style code blocks to the new include pattern
3. Create backup files of the originals
4. Report conversion results
"""

import os
import re
import sys
import shutil
from pathlib import Path

def escape_html(html_code):
    """
    Escape HTML code for use in the include pattern
    """
    # Basic HTML escaping - handles the most common cases
    escaped = html_code.replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')
    # For use in liquid includes, we also need to escape single quotes
    escaped = escaped.replace("'", "&#39;")
    return escaped

def convert_legacy_code_blocks(content):
    """
    Convert old-style code blocks to the new include pattern
    Pattern to look for:
    <div class="example">
      <div class="example-preview">
        <!-- Preview content -->
      </div>
      
      <div class="example-code">
    ```html
    <!-- Code content -->
    ```
      </div>
    </div>
    """
    # Pattern with a regex to find the old style code blocks
    pattern = re.compile(
        r'<div class="example(?:-wrapper)?">\s*'
        r'<div class="example-preview">(.*?)</div>\s*'
        r'<div class="example-code">\s*'
        r'```(\w+)\s*(.*?)```\s*'
        r'</div>\s*'
        r'</div>',
        re.DOTALL
    )
    
    def replacement(match):
        preview_content = match.group(1).strip()
        language = match.group(2).strip()
        code_content = match.group(3).strip()
        