import os
import frontmatter
import csv

# Set the path to your _discovery directory
discovery_root = "/Users/randaleastman/Documents/brandmine-site/_discovery"
output_file = "discovery_descriptions.csv"

# Data structure to collect
extracted_data = []

# Walk through all discovery subfolders and markdown files
for root, _, files in os.walk(discovery_root):
    for file in files:
        if file.endswith(".md"):
            path = os.path.join(root, file)
            try:
                post = frontmatter.load(path)
                dimension = post.get("dimension", os.path.splitext(file)[0])
                dimension_type = post.get("dimension_type", os.path.basename(root))
                description = post.get("description", "").strip()
                lang = post.get("lang", "en")

                extracted_data.append({
                    "lang": lang,
                    "type": dimension_type,
                    "dimension": dimension,
                    "description": description
                })

            except Exception as e:
                print(f"Error reading {path}: {e}")

# Write to CSV
with open(output_file, "w", newline='', encoding="utf-8") as csvfile:
    fieldnames = ["lang", "type", "dimension", "description"]
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(extracted_data)

print(f"✅ Extracted {len(extracted_data)} entries to: {output_file}")