#!/bin/bash

# deletes all responsive images in the /originals/ folders


# List of top-level folders
FOLDERS=("brands" "insights" "attributes" "markets" "markets-sectors" "sectors" "signals" "pages" "site")

for FOLDER in "${FOLDERS[@]}"; do
  find "assets/images/$FOLDER" -type f -path "*/originals/*" \( -name "*-400w.jpg" -o -name "*-800w.jpg" -o -name "*-1200w.jpg" \) -exec rm -v {} \;
done