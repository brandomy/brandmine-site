#!/bin/bash
echo "Checking for unmatched {% comment %} / {% endcomment %} tags..."

for file in $(grep -rl '{% comment %}' _includes/)
do
  start_count=$(grep -o '{% comment %}' "$file" | wc -l)
  end_count=$(grep -o '{% endcomment %}' "$file" | wc -l)

  if [ "$start_count" -ne "$end_count" ]; then
    echo "❌ Unmatched comment tags in: $file (start: $start_count, end: $end_count)"
  fi
done

echo "✅ Done."
