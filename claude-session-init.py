#!/usr/bin/env python3
"""
Claude Session Initializer for Brandmine Jekyll Site

This script generates a comprehensive context document for starting new Claude sessions,
combining information from site-summary.md and PROJECT_LOG.md.

Usage:
    ./claude-session-init.py [--focus AREA] [--copy] [--full]

Arguments:
    --focus AREA    Focus the context on a specific area (layout, content, multilingual, etc.)
    --copy          Automatically copy the output to clipboard (requires pyperclip)
    --full          Include full site details (larger context)

Example:
    ./claude-session-init.py --focus multilingual --copy
"""

import os
import sys
import re
import subprocess
import argparse
import datetime
from collections import defaultdict

# Try importing yaml for parsing config files
try:
    import yaml
    YAML_AVAILABLE = True
except ImportError:
    YAML_AVAILABLE = False

# Try importing pyperclip for clipboard functionality
try:
    import pyperclip
    CLIPBOARD_AVAILABLE = True
except ImportError:
    CLIPBOARD_AVAILABLE = False

# Configuration
SITE_SUMMARY_FILE = "site-summary.md"
PROJECT_LOG_FILE = "PROJECT_LOG.md"
OUTPUT_FILE = "claude-context.md"
MAX_CONTENT_LENGTH = 12000  # Limit context size to avoid exceeding Claude's limits

# Focus areas and related files/patterns
FOCUS_AREAS = {
    "layout": {
        "files": ["_layouts/", "_includes/header", "_includes/footer", "assets/css/layout"],
        "log_terms": ["layout", "structure", "template", "responsive"],
        "example_files": ["_layouts/default.html"]
    },
    "content": {
        "files": ["_posts/", "pages/", "_brands/"],
        "log_terms": ["content", "text", "copy", "blog"],
        "example_files": ["pages/en/index.html", "_posts/"]
    },
    "multilingual": {
        "files": ["_data/translations/", "pages/ru/", "pages/zh/", "_includes/language-selector"],
        "log_terms": ["multilingual", "translation", "language", "i18n"],
        "example_files": ["_data/translations/en.yml", "_includes/language-selector.html"]
    },
    "styling": {
        "files": ["assets/css/", "assets/fonts/"],
        "log_terms": ["css", "style", "design", "theme", "font"],
        "example_files": ["assets/css/main.css", "assets/css/components"]
    },
    "functionality": {
        "files": ["assets/js/", "_includes/"],
        "log_terms": ["javascript", "function", "feature", "behavior"],
        "example_files": ["assets/js/", "_includes/footer.html"]
    },
    "newsletter": {
        "files": ["_includes/footer.html"],
        "log_terms": ["newsletter", "mailerlite", "subscription", "form"],
        "example_files": ["_includes/footer.html"]
    }
}

def extract_section(content, section_title, max_length=None):
    """Extract a section from markdown content."""
    pattern = re.compile(rf"## {re.escape(section_title)}.*?(?=^## |\Z)", re.DOTALL | re.MULTILINE)
    match = pattern.search(content)
    
    if match:
        section_content = match.group(0)
        if max_length and len(section_content) > max_length:
            # Truncate if too long
            section_content = section_content[:max_length] + "\n...(truncated)...\n"
        return section_content
    
    return None

def find_file_content(file_path, max_lines=25):
    """Get the content of a file with line limit."""
    if not os.path.exists(file_path):
        return None
    
    with open(file_path, "r", encoding="utf-8", errors="replace") as f:
        lines = f.readlines()
        
    if len(lines) > max_lines:
        content = "".join(lines[:max_lines]) + "\n...(truncated)...\n"
    else:
        content = "".join(lines)
    
    return content

def find_matching_files(pattern, max_count=5):
    """Find files matching a pattern."""
    try:
        # Use find command for better performance
        cmd = ["find", ".", "-type", "f", "-path", f"*{pattern}*", "-not", "-path", "*/\\.*"]
        result = subprocess.run(cmd, capture_output=True, text=True, check=False)
        
        if result.returncode == 0:
            files = result.stdout.strip().split("\n")
            files = [f for f in files if f and not f.startswith("./.")]  # Filter out hidden files
            return files[:max_count]
    except:
        pass
    
    # Fallback to os.walk if find fails
    matches = []
    for root, _, filenames in os.walk("."):
        if root.startswith("./."):  # Skip hidden directories
            continue
        
        for filename in filenames:
            file_path = os.path.join(root, filename)
            if pattern in file_path and len(matches) < max_count:
                matches.append(file_path)
    
    return matches

def get_relevant_log_entries(focus=None, max_entries=5):
    """Get relevant log entries for a specific focus area."""
    if not os.path.exists(PROJECT_LOG_FILE):
        return "No project log found."
    
    with open(PROJECT_LOG_FILE, "r", encoding="utf-8", errors="replace") as f:
        content = f.read()
    
    # Extract log entries using regex
    entries = re.findall(r"##\s+(\d{4}-\d{2}-\d{2}):\s+(.*?)(?=##|\Z)", content, re.DOTALL)
    
    # If no focus, return recent entries
    if not focus or focus not in FOCUS_AREAS:
        recent_entries = entries[:max_entries]
        result = ""
        for date, entry_text in recent_entries:
            result += f"## {date}: {entry_text.strip()}\n\n"
        return result
    
    # Filter entries relevant to the focus area
    focus_terms = FOCUS_AREAS[focus]["log_terms"]
    relevant_entries = []
    
    for date, entry_text in entries:
        for term in focus_terms:
            if term.lower() in entry_text.lower():
                relevant_entries.append((date, entry_text.strip()))
                break
        
        if len(relevant_entries) >= max_entries:
            break
    
    # If no relevant entries found, fall back to recent entries
    if not relevant_entries:
        relevant_entries = entries[:max_entries]
    
    # Format relevant entries
    result = ""
    for date, entry_text in relevant_entries:
        result += f"## {date}: {entry_text}\n\n"
    
    return result

def get_jekyll_config_summary():
    """Extract key information from _config.yml."""
    if not os.path.exists("_config.yml"):
        return "Jekyll configuration not found."
    
    if not YAML_AVAILABLE:
        with open("_config.yml", "r", encoding="utf-8", errors="replace") as f:
            # Return just the first part if yaml module is not available
            return "```yaml\n" + f.read(1000) + "\n...(truncated)...\n```"
    
    try:
        with open("_config.yml", "r", encoding="utf-8", errors="replace") as f:
            config = yaml.safe_load(f)
        
        # Extract essential configuration details
        summary = {
            "title": config.get("title", ""),
            "description": config.get("description", ""),
            "baseurl": config.get("baseurl", ""),
            "url": config.get("url", ""),
            "collections": list(config.get("collections", {}).keys()),
            "plugins": config.get("plugins", [])
        }
        
        return "```yaml\n" + yaml.dump(summary, default_flow_style=False) + "\n```"
    except Exception as e:
        return f"Error parsing Jekyll configuration: {str(e)}"

def generate_context_document(focus=None, full_details=False):
    """Generate the comprehensive context document."""
    # Check if site summary exists
    if not os.path.exists(SITE_SUMMARY_FILE):
        print(f"Site summary not found: {SITE_SUMMARY_FILE}")
        print("Run ./enhanced-site-summary.sh first")
        return None
    
    with open(SITE_SUMMARY_FILE, "r", encoding="utf-8", errors="replace") as f:
        summary_content = f.read()
    
    # Start building the context document
    today = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    
    context = f"# Brandmine Jekyll Website Context\n"
    context += f"Generated: {today}\n\n"
    
    # Add focus-specific header if applicable
    if focus and focus in FOCUS_AREAS:
        context += f"## Focus Area: {focus.capitalize()}\n\n"
        context += "This context is focused on the " + focus + " aspects of the website.\n\n"
    
    # Basic site information
    site_info = extract_section(summary_content, "Configuration Details", 1000)
    if site_info:
        context += "## Site Configuration\n" + site_info + "\n"
    else:
        context += "## Site Configuration\n" + get_jekyll_config_summary() + "\n"
    
    # Add structure overview
    structure_info = extract_section(summary_content, "Site Structure", 1500)
    if structure_info:
        context += structure_info + "\n"
    
    # Add focus-specific information if applicable
    if focus and focus in FOCUS_AREAS:
        # Add relevant file content
        context += f"## Key {focus.capitalize()} Files\n\n"
        for file_pattern in FOCUS_AREAS[focus]["example_files"]:
            matching_files = find_matching_files(file_pattern, 2)
            for file_path in matching_files:
                file_content = find_file_content(file_path, 50)
                if file_content:
                    context += f"### {file_path}\n```\n{file_content}```\n\n"
    
    # Add recent development activity
    if focus and focus in FOCUS_AREAS:
        context += f"## Recent {focus.capitalize()} Development\n\n"
        context += get_relevant_log_entries(focus, 3)
    else:
        activity_info = extract_section(summary_content, "Recent Development Activity", 2000)
        if activity_info:
            context += activity_info + "\n"
        else:
            context += "## Recent Development Activity\n\n"
            context += get_relevant_log_entries(None, 2)
    
    # Add content summary
    content_info = extract_section(summary_content, "Content Summary", 1000)
    if content_info:
        context += content_info + "\n"
    
    # Add multilingual information if that's the focus or if doing full details
    if focus == "multilingual" or full_details:
        # Check for translations
        if os.path.exists("_data/translations"):
            context += "## Translation Structure\n\n"
            for lang_file in os.listdir("_data/translations"):
                if lang_file.endswith(".yml"):
                    lang = lang_file.split(".")[0]
                    context += f"### {lang} Translation Sample\n"
                    file_content = find_file_content(f"_data/translations/{lang_file}", 20)
                    if file_content:
                        context += f"```yaml\n{file_content}```\n\n"
    
    # Add environment information
    env_info = extract_section(summary_content, "Environment & Dependencies")
    if env_info:
        context += env_info + "\n"
    
    # Make sure we don't exceed the maximum context length
    if len(context) > MAX_CONTENT_LENGTH:
        # Truncate while preserving structure
        context = context[:MAX_CONTENT_LENGTH]
        # Find the last complete section
        last_section = context.rfind("##")
        if last_section > 0:
            context = context[:last_section].strip() + "\n\n"
        context += "\n...(Context truncated due to length)...\n"
    
    # Add instructions for Claude
    context += """
## Working with Claude

When helping with this Jekyll website, please:

1. Consider the multilingual structure (EN, RU, ZH) in all solutions
2. Provide complete code when suggesting changes
3. Maintain the existing file structure and naming conventions
4. Explain the reasoning behind technical decisions
5. Consider mobile responsiveness in layout changes

When writing code, use:
- Liquid templating for Jekyll
- Modern CSS practices
- Vanilla JavaScript where possible
"""
    
    return context

def main():
    """Main function to handle command line arguments."""
    parser = argparse.ArgumentParser(description="Generate context for Claude sessions")
    parser.add_argument("--focus", help="Focus area (layout, content, multilingual, styling, functionality, newsletter)")
    parser.add_argument("--copy", action="store_true", help="Copy to clipboard")
    parser.add_argument("--full", action="store_true", help="Include full site details")
    
    args = parser.parse_args()
    
    # Validate focus area if provided
    if args.focus and args.focus.lower() not in FOCUS_AREAS:
        print(f"Invalid focus area: {args.focus}")
        print(f"Valid areas: {', '.join(FOCUS_AREAS.keys())}")
        return
    
    # Generate context document
    context = generate_context_document(
        focus=args.focus.lower() if args.focus else None,
        full_details=args.full
    )
    
    if not context:
        return
    
    # Save to file
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write(context)
    
    print(f"Context document generated: {OUTPUT_FILE} ({len(context)} characters)")
    
    # Copy to clipboard if requested
    if args.copy:
        if CLIPBOARD_AVAILABLE:
            pyperclip.copy(context)
            print("Content copied to clipboard")
        else:
            print("Warning: pyperclip not installed. Cannot copy to clipboard.")
            print("Install with: pip install pyperclip")
    
    # Print instructions
    print("\nNext Steps:")
    print("1. Start a new conversation with Claude")
    print(f"2. Paste the content of {OUTPUT_FILE} at the beginning")
    print("3. Ask your specific questions about the website")

if __name__ == "__main__":
    main()