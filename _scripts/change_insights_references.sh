grep -rl "{% include collections/insights/" . \
  | grep -E '\.html$|\.md$|\.liquid$' \
  | while read -r file; do
    echo "🔧 Updating: $file"
    sed -i '' 's|{% include collections/insights/|{% include components/insights/|g' "$file"
done

echo "✅ All 'collections/insights' includes updated to 'components/insights'"
