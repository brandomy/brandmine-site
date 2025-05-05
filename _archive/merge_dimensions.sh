#!/bin/bash

# Script to merge content from _tags and _discovery to _dimensions

# First, ensure _dimensions directory exists
mkdir -p _dimensions

# Function to copy and update front matter
copy_and_update() {
    local src="$1"
    local dest="$2"
    local src_type="$3"
    local dest_type="dimensions"
    
    # Create destination directory if it doesn't exist
    mkdir -p "$(dirname "$dest")"
    
    # Copy the file
    cp "$src" "$dest"
    
    # Update front matter
    if [ "$src_type" = "tags" ]; then
        sed -i '' 's/tag_type:/dimension_type:/g' "$dest"
        sed -i '' 's/^tag:/dimension:/g' "$dest"
    elif [ "$src_type" = "discovery" ]; then
        sed -i '' 's/discovery_type:/dimension_type:/g' "$dest"
        sed -i '' 's/^discovery:/dimension:/g' "$dest"
    fi
    
    echo "Processed: $src → $dest"
}

# Process each language
for lang in en ru zh; do
    echo "Processing language: $lang"
    
    # Process each dimension type
    for dim_type in sectors markets attributes signals; do
        echo "  Processing dimension type: $dim_type"
        
        # Create destination directory
        mkdir -p "_dimensions/$lang/$dim_type"
        
        # Process files from _tags
        if [ -d "_tags/$lang/$dim_type" ]; then
            for src in _tags/$lang/$dim_type/*.md; do
                if [ -f "$src" ]; then
                    # Determine destination path
                    dest="${src/_tags/_dimensions}"
                    copy_and_update "$src" "$dest" "tags"
                fi
            done
        fi
        
        # Process files from _discovery
        if [ -d "_discovery/$lang/$dim_type" ]; then
            for src in _discovery/$lang/$dim_type/*.md; do
                if [ -f "$src" ]; then
                    # Determine destination path
                    dest="${src/_discovery/_dimensions}"
                    
                    # Only copy if not already processed from _tags
                    if [ ! -f "$dest" ]; then
                        copy_and_update "$src" "$dest" "discovery"
                    else
                        echo "Skipping (already exists): $src"
                    fi
                fi
            done
        fi
    done
done

echo "Content merge complete!"
echo "NOTE: After verifying everything works, you can remove the _tags and _discovery directories"
echo "rm -rf _tags _discovery"
