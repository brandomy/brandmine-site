#!/bin/bash

echo "🔍 Checking SCSS files in assets/css/ for Liquid syntax..."

for token in '{{' '}}' '{%' '%}'; do
  echo "Looking for: $token"
  grep -rI "$token" assets/css/ --include \*.scss
done

echo "✅ Done."
