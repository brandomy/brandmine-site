#!/usr/bin/env python3
"""
Claude Session Initializer for Brandmine Jekyll Site

This script generates a comprehensive context document for starting new Claude sessions,
combining information from site-summary.md and PROJECT_LOG.md.

Usage:
    ./claude-session-init.py [--focus AREA] [--copy] [--full]
    ./claude-session-init.py [--progressive] [--copy]
    ./claude-session-init.py [--task TASK] [--since DATE] [--copy]

Arguments:
    --focus AREA    Focus the context on a specific area (layout, content, multilingual, etc.)
    --copy          Automatically copy the output to clipboard (requires pyperclip)
    --full          Include full site details (larger context)
    --progressive   Generate minimal context with a menu of additional context Claude can request
    --task TASK     Specific task context (new-page, new-component, debug, translation)
    --since DATE    Focus on changes since this date (YYYY-MM-DD)
    --minimal       Generate minimal context (site structure and recent changes only)

Example:
    ./claude-session-init.py --focus multilingual --copy
    ./claude-session-init.py --progressive --copy
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
CONTEXT_SNIPPETS_DIR = "_context_snippets"  # Directory for context snippets

# Task-specific focus areas
TASK_FOCUS = {
    "new-page": ["layout", "content"],
    "new-component": ["styling", "layout"],
    "debug": ["functionality"],
    "translation": ["multilingual"],
}

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
    },
    # New focus area for tag system
    "tags": {
        "files": ["_data/tag_translations.yml", "_tags/", "_includes/tags/"],
        "log_terms": ["tag", "taxonomy", "category", "badge"],
        "example_files": ["_data/tag_translations.yml", "_includes/tags/tag-list.html"]
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

def get_relevant_log_entries(focus=None, max_entries=5, since_date=None):
    """Get relevant log entries for a specific focus area."""
    if not os.path.exists(PROJECT_LOG_FILE):
        return "No project log found."
    
    with open(PROJECT_LOG_FILE, "r", encoding="utf-8", errors="replace") as f:
        content = f.read()
    
    # Extract log entries using regex
    entries = re.findall(r"##\s+(\d{4}-\d{2}-\d{2}):\s+(.*?)(?=##|\Z)", content, re.DOTALL)
    
    # Filter by date if provided
    if since_date:
        try:
            since_date_obj = datetime.datetime.strptime(since_date, "%Y-%m-%d").date()
            entries = [(date, entry) for date, entry in entries 
                      if datetime.datetime.strptime(date, "%Y-%m-%d").date() >= since_date_obj]
        except ValueError:
            # If date parsing fails, ignore the filter
            pass
    
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

# New function for tag system analysis
def get_tag_system_summary():
    """Extract tag system information from tag_translations.yml."""
    if not os.path.exists("_data/tag_translations.yml"):
        return "Tag translation file not found."
    
    if not YAML_AVAILABLE:
        return "YAML module not available, can't analyze tag system."
    
    try:
        with open("_data/tag_translations.yml", "r", encoding="utf-8", errors="replace") as f:
            tag_data = yaml.safe_load(f)
        
        if not tag_data:
            return "Tag translation file is empty or invalid."
        
        # Create a summary of the tag structure
        summary = "### Tag System Overview\n\n"
        for category, tags in tag_data.items():
            summary += f"**{category}:** {len(tags)} tags\n"
            # List a sample of tags (first 3)
            sample_tags = list(tags.keys())[:3]
            summary += f"Sample tags: {', '.join(sample_tags)}\n\n"
        
        # Try to get a sample tag translation to show the structure
        if tag_data and list(tag_data.keys()) and list(tag_data[list(tag_data.keys())[0]].keys()):
            first_category = list(tag_data.keys())[0]
            first_tag = list(tag_data[first_category].keys())[0]
            sample = tag_data[first_category][first_tag]
            
            summary += "#### Sample Tag Translation\n\n"
            summary += f"Tag: `{first_tag}` (Category: {first_category})\n\n"
            summary += "```yaml\n"
            for lang, trans in sample.items():
                summary += f"{lang}: \"{trans}\"\n"
            summary += "```\n"
        
        return summary
    except Exception as e:
        return f"Error analyzing tag system: {str(e)}"

# New function for color palette analysis
def get_color_palette_context():
    """Extract color palette information from CSS variables."""
    css_files = ["assets/css/tokens/colors.css", "assets/css/basic-colors.css"]
    
    for file_path in css_files:
        if os.path.exists(file_path):
            try:
                with open(file_path, "r", encoding="utf-8", errors="replace") as f:
                    content = f.read()
                    # Extract CSS variables for colors
                    color_vars = re.findall(r'--([a-zA-Z0-9-]+):\s*(#[a-fA-F0-9]{6}|#[a-fA-F0-9]{3})', content)
                    
                    if color_vars:
                        result = "## Color Palette\n\n"
                        result += "The Brandmine site uses a color system with the following key colors:\n\n"
                        for var_name, hex_code in color_vars[:15]:  # Limit to first 15 colors
                            result += f"- `--{var_name}`: `{hex_code}`\n"
                        
                        # Add a note about the color system
                        if "primary" in [v[0] for v in color_vars]:
                            result += "\nThe site uses a primary (teal), secondary (orange), accent (indigo), and neutral (gray) color system with varying shades.\n"
                        
                        return result + "\n"
            except Exception as e:
                pass
    
    return ""

# New function for font strategy analysis
def get_font_strategy_context():
    """Extract font strategy information from typography CSS."""
    typography_files = ["assets/css/tokens/typography.css", "assets/css/typography.css"]
    
    for file_path in typography_files:
        if os.path.exists(file_path):
            try:
                with open(file_path, "r", encoding="utf-8", errors="replace") as f:
                    content = f.read()
                    # Extract font family variables
                    font_vars = re.findall(r'--font-([a-zA-Z0-9-]+):\s*([^;]+);', content)
                    
                    if font_vars:
                        result = "## Typography System\n\n"
                        result += "The Brandmine site uses a multilingual typography system with these font families:\n\n"
                        for var_name, font_stack in font_vars:  # Include all font variables
                            result += f"- `--font-{var_name}`: {font_stack.strip()}\n"
                        
                        # Add note about multilingual support
                        if any(["zh" in v[0] or "ru" in v[0] for v in font_vars]):
                            result += "\nThe typography system includes specific font configurations for English, Russian, and Chinese content.\n"
                        
                        return result + "\n"
            except Exception as e:
                pass
    
    return ""

def get_latest_commit_info():
    """Get the latest commit info from git."""
    try:
        result = subprocess.run(["git", "log", "-1", "--pretty=format:%s (%an, %ad)"], 
                              capture_output=True, text=True, check=False)
        return result.stdout if result.returncode == 0 else "No commit info available"
    except:
        return "Unable to retrieve commit info"
        
def get_current_focus_area():
    """Try to determine current focus area from PROJECT_LOG.md."""
    if not os.path.exists(PROJECT_LOG_FILE):
        return "Unknown"
    
    with open(PROJECT_LOG_FILE, "r", encoding="utf-8", errors="replace") as f:
        content = f.read()
    
    # Extract the most recent log entry
    match = re.search(r"##\s+\d{4}-\d{2}-\d{2}:\s+(.*?)(?=\n)", content)
    if match:
        return match.group(1)
    return "General site development"

def generate_minimal_context():
    """Generate just the essential context to start a session."""
    
    # Current date for reference
    today = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    
    minimal_context = f"""# Brandmine Jekyll Website - Quick Reference
Generated: {today}

## Project Overview
- Jekyll-based multilingual website (EN, RU, ZH)
- Focus on showcasing BRICS+ consumer brands
- Current navigation structure: Home, Brands, Discover (Sectors, Markets, Attributes, Signals), Insights, About

## Latest Development
- Most recent commit: {get_latest_commit_info()}
- Current focus: {get_current_focus_area()}

## Working with Claude
When I need more context about specific areas, please ask me and I can provide:
1. File contents (specific layouts, includes, CSS files)
2. Directory structures
3. Configuration details
4. Recent changes in specific areas
5. Tag system details
6. Translation system information

I'm new to programming and building this site myself with your guidance.
"""
    return minimal_context

def generate_context_menu():
    """Create a menu of available context information Claude can request."""
    
    # Check if context snippets directory exists
    context_files = []
    if os.path.exists(CONTEXT_SNIPPETS_DIR):
        context_files = [f for f in os.listdir(CONTEXT_SNIPPETS_DIR) if f.endswith('.md')]
    
    menu = """
## Available Context Information

If needed, you can ask me for any of these context packages:

### Site Structure
- Full directory structure
- Jekyll configuration
- Collection setup

### Design System
- Color palette details
- Typography system
- Component library status

### Multilingual System
- Translation file structure
- Language implementation details
- Content translation status

### Development History
- Recent commits and changes
- Project log entries
- Current development focus

### Content Organization
- Tag system details 
- Content statistics
- Navigation structure

### Specific File Contents
- You can ask for any specific file content like:
  "Can you share your header.html include?"
  "What's in your main.css file?"
  "How is your default layout structured?"
"""

    # Add available context snippets if they exist
    if context_files:
        menu += "\n### Available Context Snippets\n"
        menu += "I have these prepared context files ready to share when needed:\n\n"
        for file in context_files:
            name = file.replace('.md', '').replace('_', ' ').title()
            menu += f"- {name}\n"
    
    return menu

def generate_context_document(focus=None, full_details=False, since_date=None):
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
    
    # Add date filter info if applicable
    if since_date:
        context += f"## Changes Since: {since_date}\n\n"
        context += f"This context focuses on changes made since {since_date}.\n\n"
    
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
    
    # Add tag system information (new)
    if focus == "tags" or full_details:
        context += "## Tag System\n\n" + get_tag_system_summary() + "\n"
    
    # Add color palette information (new)
    if focus == "styling" or full_details:
        color_palette = get_color_palette_context()
        if color_palette:
            context += color_palette
    
    # Add typography system information (new)
    if focus == "styling" or full_details:
        font_strategy = get_font_strategy_context()
        if font_strategy:
            context += font_strategy
    
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
        context += get_relevant_log_entries(focus, 3, since_date)
    else:
        activity_info = extract_section(summary_content, "Recent Development Activity", 2000)
        if activity_info:
            context += activity_info + "\n"
        else:
            context += "## Recent Development Activity\n\n"
            context += get_relevant_log_entries(None, 2, since_date)
    
    # Add content summary
    content_info = extract_section(summary_content, "Content Summary", 1000)
    if content_info:
        context += content_info + "\n"
    
    # Add tag analysis from site summary if available and relevant
    if focus == "tags" or full_details:
        tag_analysis = extract_section(summary_content, "Tag System Analysis", 2000)
        if tag_analysis:
            context += tag_analysis + "\n"
    
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
6. Respect the established color palette and typography system
7. Consider the tag system architecture when discussing content organization

When writing code, use:
- Liquid templating for Jekyll
- Modern CSS practices
- Vanilla JavaScript where possible
"""
    
    return context

def generate_task_context(task, since_date=None):
    """Generate context tailored for a specific task."""
    if task not in TASK_FOCUS:
        print(f"Unknown task: {task}")
        print(f"Valid tasks: {', '.join(TASK_FOCUS.keys())}")
        return None
    
    # Get the focus areas for this task
    focus_areas = TASK_FOCUS[task]
    
    # Start building the context document
    today = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    
    context = f"# Brandmine Jekyll Website: {task.replace('-', ' ').title()} Task\n"
    context += f"Generated: {today}\n\n"
    
    context += f"## Task Context: {task.replace('-', ' ').title()}\n\n"
    context += "This context is tailored to help with the specific task.\n\n"
    
    # Add minimal site info
    context += "## Project Overview\n"
    context += "- Jekyll-based multilingual website (EN, RU, ZH)\n"
    context += "- Focus on showcasing BRICS+ consumer brands\n"
    context += "- Current navigation structure: Home, Brands, Discover (Sectors, Markets, Attributes, Signals), Insights, About\n\n"
    
    # Add relevant information for each focus area
    for focus in focus_areas:
        if focus == "layout":
            context += "## Layout System\n\n"
            layout_file = "_layouts/default.html"
            if os.path.exists(layout_file):
                content = find_file_content(layout_file, 30)
                if content:
                    context += f"### Default Layout Structure\n```html\n{content}```\n\n"
        
        elif focus == "content":
            context += "## Content Structure\n\n"
            context += "Content is organized by language in `/pages/en/`, `/pages/ru/`, and `/pages/zh/` directories.\n"
            context += "Each page has front matter with `layout`, `title`, and `lang` parameters.\n\n"
        
        elif focus == "multilingual":
            context += "## Multilingual System\n\n"
            context += "- Language-first URLs (`/en/`, `/ru/`, `/zh/`)\n"
            context += "- Translation files in `_data/translations/`\n"
            context += "- Every page has a `lang` parameter in front matter\n\n"
            
            # Add sample translation
            if os.path.exists("_data/translations/en.yml"):
                content = find_file_content("_data/translations/en.yml", 15)
                if content:
                    context += "### Sample Translation\n"
                    context += f"```yaml\n{content}```\n\n"
        
        elif focus == "styling":
            context += "## Styling System\n\n"
            context += "- CSS organized in tokens, components, and page-specific files\n"
            context += "- Design tokens: colors, typography, spacing, breakpoints\n"
            context += "- Component styles: buttons, cards, forms, navigation, etc.\n\n"
            
            # Add color palette
            color_palette = get_color_palette_context()
            if color_palette:
                context += color_palette
    
    # Add relevant recent development
    context += "## Recent Development\n\n"
    for focus in focus_areas:
        context += get_relevant_log_entries(focus, 1, since_date)
    
    # Add instructions for Claude
    context += """
## Working with Claude

When helping with this Jekyll website, please:

1. Consider the multilingual structure (EN, RU, ZH) in all solutions
2. Provide complete code when suggesting changes
3. Maintain the existing file structure and naming conventions
4. Explain the reasoning behind technical decisions
5. Consider mobile responsiveness in layout changes
6. Respect the established color palette and typography system
7. Consider the tag system architecture when discussing content organization

When writing code, use:
- Liquid templating for Jekyll
- Modern CSS practices
- Vanilla JavaScript where possible
"""
    
    return context

def main():
    """Main function to handle command line arguments."""
    parser = argparse.ArgumentParser(description="Generate context for Claude sessions")
    parser.add_argument("--focus", help="Focus area (layout, content, multilingual, styling, functionality, newsletter, tags)")
    parser.add_argument("--copy", action="store_true", help="Copy to clipboard")
    parser.add_argument("--full", action="store_true", help="Include full site details (larger context)")
    parser.add_argument("--progressive", action="store_true", help="Generate minimal context with a menu of additional context Claude can request")
    parser.add_argument("--task", help="Specific task context (new-page, new-component, debug, translation)")
    parser.add_argument("--since", help="Focus on changes since this date (YYYY-MM-DD)")
    parser.add_argument("--minimal", action="store_true", help="Generate minimal context (site structure and recent changes only)")
    
    args = parser.parse_args()
    
    # Check context snippets directory
    if not os.path.exists(CONTEXT_SNIPPETS_DIR):
        print(f"Warning: Context snippets directory '{CONTEXT_SNIPPETS_DIR}' not found.")
        print("You may want to create this directory and add context snippet files.")
    
    # Generate context based on provided arguments
    context = None
    
    if args.progressive:
        # Generate minimal context with menu
        context = generate_minimal_context() + "\n\n" + generate_context_menu()
    elif args.task:
        # Generate task-specific context
        context = generate_task_context(args.task, args.since)
    elif args.minimal:
        # Generate minimal context only
        context = generate_minimal_context()
    else:
        # Validate focus area if provided
        if args.focus and args.focus.lower() not in FOCUS_AREAS:
            print(f"Invalid focus area: {args.focus}")
            print(f"Valid areas: {', '.join(FOCUS_AREAS.keys())}")
            return
        
        # Generate comprehensive context
        context = generate_context_document(
            focus=args.focus.lower() if args.focus else None,
            full_details=args.full,
            since_date=args.since
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
    
    if args.progressive:
        print("3. Ask your question, and Claude will request specific context when needed")
    else:
        print("3. Ask your specific questions about the website")

if __name__ == "__main__":
    main()