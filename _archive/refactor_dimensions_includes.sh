#!/bin/bash


# Step 3: Replace all includes across the site
echo "🔍 Updating include references across your site..."
grep -rl "{% include collections/dimensions/" . \
  | grep -E '\.html$|\.md$|\.liquid$' \
  | xargs sed -i '' 's/{% include collections\/dimensions\//{% include components\/dimensions\//g'

echo "✅ All includes moved and updated."
