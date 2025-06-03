#!/usr/bin/env python3
"""
project-log-maintainer.py

This script helps maintain a structured and consistent project log for the Brandmine Jekyll site.
It supports manual and automated logging workflows to ensure all significant development
activities are documented clearly and systematically.

Key Features:
- Add structured development log entries through a guided CLI.
- Set up Git hooks to prompt logging during commits.
- Search project logs for keywords, showing matching entries and summaries.
- Analyze project log statistics by month, category, and file changes.

Usage:
    ./project-log-maintainer.py add         # Add a new log entry
    ./project-log-maintainer.py setup       # Set up Git hooks
    ./project-log-maintainer.py search TERM # Search log entries
    ./project-log-maintainer.py stats       # Show log statistics

Author: Randal Eastman
"""

import os
import sys
import datetime
import subprocess
import re
from collections import Counter

# Configuration
LOG_FILE = "PROJECT_LOG.md"
CATEGORIES = ["Layout", "Content", "Styling", "Functionality", "Multilingual", "Performance", "Infrastructure"]

def ensure_log_file_exists():
    """Create the log file if it doesn't exist."""
    if not os.path.exists(LOG_FILE):
        with open(LOG_FILE, "w") as f:
            f.write("# Brandmine Development Log\n\n")
            f.write("This file tracks key development decisions and changes.\n\n")
        print(f"Created new log file: {LOG_FILE}")

def get_modified_files():
    """Get list of modified files from Git."""
    try:
        result = subprocess.run(
            ["git", "diff", "--name-only", "--cached"],
            capture_output=True, text=True, check=True
        )
        files = result.stdout.strip().split("\n")
        return [f for f in files if f]  # Filter out empty strings
    except subprocess.CalledProcessError:
        return []

def add_log_entry(commit_msg=None):
    """Add a new entry to the project log."""
    ensure_log_file_exists()
    
    today = datetime.datetime.now().strftime("%Y-%m-%d")
    
    # If no commit message is provided, try to get it from Git
    if not commit_msg:
        try:
            result = subprocess.run(
                ["git", "log", "-1", "--pretty=%B"],
                capture_output=True, text=True, check=False
            )
            commit_msg = result.stdout.strip()
        except (subprocess.CalledProcessError, FileNotFoundError):
            commit_msg = ""
    
    # Get title from commit message or prompt
    if commit_msg:
        title = commit_msg.split("\n")[0]
    else:
        title = input("Enter log entry title: ")
    
    # Get modified files
    modified_files = get_modified_files()
    
    # Prompt for category
    print("\nCategories:")
    for i, category in enumerate(CATEGORIES, 1):
        print(f"{i}. {category}")
    
    category_choice = input("\nSelect category (number or custom): ")
    try:
        category = CATEGORIES[int(category_choice) - 1]
    except (ValueError, IndexError):
        category = category_choice
    
    # Prompt for changes
    print("\nEnter changes made (one per line, blank line to finish):")
    changes = []
    while True:
        change = input("- ")
        if not change:
            break
        changes.append(change)
    
    # Prompt for technical decisions
    print("\nEnter technical decisions/rationale (one per line, blank line to finish):")
    decisions = []
    while True:
        decision = input("- ")
        if not decision:
            break
        decisions.append(decision)
    
    # Prompt for next steps
    print("\nEnter next steps (one per line, blank line to finish):")
    next_steps = []
    while True:
        step = input("- ")
        if not step:
            break
        next_steps.append(step)
    
    # Format the entry
    entry = f"## {today}: {title} [{category}]\n\n"
    
    if changes:
        entry += "### Changes Made\n"
        for change in changes:
            entry += f"- {change}\n"
        entry += "\n"
    
    if decisions:
        entry += "### Technical Decisions\n"
        for decision in decisions:
            entry += f"- {decision}\n"
        entry += "\n"
    
    if modified_files:
        entry += "### Files Modified\n"
        for file in modified_files:
            entry += f"- `{file}`\n"
        entry += "\n"
    
    if next_steps:
        entry += "### Next Steps\n"
        for step in next_steps:
            entry += f"- {step}\n"
        entry += "\n"
    
    # Prepend the entry to the log file
    with open(LOG_FILE, "r") as f:
        content = f.read()
    
    # Find the position after the header
    header_end = content.find("\n\n") + 2
    if header_end < 2:  # If we can't find the header, just prepend
        header_end = 0
    
    with open(LOG_FILE, "w") as f:
        f.write(content[:header_end])
        f.write(entry)
        f.write(content[header_end:])
    
    print(f"\nAdded new log entry to {LOG_FILE}")
    return True

def setup_git_hooks():
    """Set up Git hooks for automated logging."""
    hooks_dir = ".git/hooks"
    
    if not os.path.exists(hooks_dir):
        print("Git hooks directory not found. Is this a Git repository?")
        return False
    
    # Create pre-commit hook
    pre_commit_path = os.path.join(hooks_dir, "pre-commit")
    with open(pre_commit_path, "w") as f:
        f.write("#!/bin/sh\n\n")
        f.write("# Ask if the user wants to add a log entry\n")
        f.write("echo 'Would you like to add a project log entry? (y/n)'\n")
        f.write("read add_log\n")
        f.write("if [ \"$add_log\" = \"y\" ]; then\n")
        f.write(f"    {os.path.abspath(__file__)} add\n")
        f.write("fi\n")
        f.write("exit 0\n")
    
    # Make executable
    os.chmod(pre_commit_path, 0o755)
    
    print(f"Set up Git hook: {pre_commit_path}")
    return True

def search_log(term):
    """Search the project log for entries containing the given term."""
    if not os.path.exists(LOG_FILE):
        print(f"Log file not found: {LOG_FILE}")
        return False
    
    with open(LOG_FILE, "r") as f:
        content = f.read()
    
    # Extract log entries using regex
    entries = re.findall(r"##\s+(\d{4}-\d{2}-\d{2}):\s+(.*?)(?=##|\Z)", content, re.DOTALL)
    
    # Filter entries containing the search term
    matches = []
    for date, entry_text in entries:
        if term.lower() in entry_text.lower():
            matches.append((date, entry_text.strip()))
    
    # Display results
    if matches:
        print(f"Found {len(matches)} entries containing '{term}':\n")
        for date, entry in matches:
            title = entry.split("\n")[0]
            print(f"{date}: {title}")
            print("-" * 40)
            lines = entry.split("\n")
            for line in lines[1:min(6, len(lines))]:  # Show a few lines of context
                print(line)
            if len(lines) > 6:
                print("...")
            print("\n")
    else:
        print(f"No entries found containing '{term}'")
    
    return True

def show_statistics():
    """Show statistics about the project log."""
    if not os.path.exists(LOG_FILE):
        print(f"Log file not found: {LOG_FILE}")
        return False
    
    with open(LOG_FILE, "r") as f:
        content = f.read()
    
    # Extract log entries
    entries = re.findall(r"##\s+(\d{4}-\d{2}-\d{2}):\s+(.*?)\s+\[(.*?)\]", content)
    
    if not entries:
        print("No log entries found")
        return False
    
    # Count entries by month and category
    months = Counter()
    categories = Counter()
    
    for date, title, category in entries:
        month = date[:7]  # YYYY-MM
        months[month] += 1
        categories[category] += 1
    
    # Display statistics
    print(f"Project Log Statistics ({len(entries)} total entries)\n")
    
    print("Entries by Month:")
    for month, count in sorted(months.items()):
        print(f"  {month}: {count}")
    print()
    
    print("Entries by Category:")
    for category, count in categories.most_common():
        print(f"  {category}: {count}")
    
    # Extract modified files
    files = re.findall(r"### Files Modified\n(.*?)(?=###|\Z)", content, re.DOTALL)
    modified_files = []
    for file_section in files:
        file_list = re.findall(r"`(.*?)`", file_section)
        modified_files.extend(file_list)
    
    file_counts = Counter(modified_files)
    
    print("\nMost Frequently Modified Files:")
    for file, count in file_counts.most_common(10):
        print(f"  {file}: {count} changes")
    
    return True

def main():
    """Main function to handle command line arguments."""
    if len(sys.argv) < 2:
        print(__doc__)
        return
    
    command = sys.argv[1]
    
    if command == "add":
        add_log_entry()
    elif command == "setup":
        setup_git_hooks()
    elif command == "search" and len(sys.argv) >= 3:
        search_log(sys.argv[2])
    elif command == "stats":
        show_statistics()
    else:
        print(__doc__)

if __name__ == "__main__":
    main()