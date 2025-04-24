import csv
import os
import yaml

# Paths
data_dir = "/Users/randaleastman/Documents/brandmine-site/_data"
csv_path = "discovery_descriptions.csv"

# Load CSV
with open(csv_path, encoding="utf-8") as f:
    reader = csv.DictReader(f)
    entries = list(reader)

# Group by type for batching updates
by_type = {}
for row in entries:
    if row["lang"] not in ["en", "ru", "zh"]:  # Only handle English, Russian, and Chinese for now
        continue
    by_type.setdefault(row["type"], []).append(row)

# Inject into respective YAML files
for dim_type, items in by_type.items():
    for item in items:
        data_file = os.path.join(data_dir, f"{dim_type}s/{item['lang']}.yml")
        if not os.path.exists(data_file):
            print(f"⚠️ File not found: {data_file}")
            continue

        with open(data_file, encoding="utf-8") as f:
            content = yaml.safe_load(f) or []

        # Update or insert short_description
        dim_id = item["dimension"]
        matched = False
        for entry in content:
            if isinstance(entry, dict) and entry.get("id") == dim_id:
                entry["short_description"] = item["description"]
                matched = True
                break
        if not matched:
            print(f"➕ Adding new entry for {dim_id}")
            content.append({
                "id": dim_id,
                "icon": "",
                "short_description": item["description"],
                "long_description": "",
                "hero_image": ""
            })

        # Write back updated YAML with list-style formatting and blank line between entries
        with open(data_file, "w", encoding="utf-8") as f:
            for entry in content:
                yaml.dump([entry], f, allow_unicode=True, sort_keys=False, default_flow_style=False)
                f.write("\n")

        print(f"✅ Updated entries in {data_file}")