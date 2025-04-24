import os
import frontmatter

# Set the path to your _discovery directory
discovery_root = "/Users/randaleastman/Documents/brandmine-site/_discovery"

count = 0

for root, _, files in os.walk(discovery_root):
    for file in files:
        if file.endswith(".md"):
            path = os.path.join(root, file)
            try:
                post = frontmatter.load(path)
                if 'description' in post.metadata:
                    del post.metadata['description']
                    with open(path, 'w', encoding='utf-8') as f:
                        f.write(frontmatter.dumps(post))
                    count += 1
            except Exception as e:
                print(f"⚠️ Error processing {path}: {e}")

print(f"✅ Removed 'description' from {count} files.")