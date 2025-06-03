#!/bin/bash
# update_json.sh
# Purpose: Simple wrapper to update JSON search indexes
# Usage: Run after adding or updating content
# Example: ./_scripts/update_json.sh

# Make sure we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "Error: This script must be run from the Jekyll project root"
    exit 1
fi

echo "Updating search indexes..."

# Make the Ruby script executable if it isn't already
chmod +x _scripts/generate_search_index.rb

# Run the Ruby script
ruby _scripts/generate_search_index.rb

# Optionally rebuild Jekyll to see changes
echo "Would you like to rebuild the Jekyll site? (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    bundle exec jekyll build
    echo "Jekyll site rebuilt!"
fi

echo "Update complete!"
