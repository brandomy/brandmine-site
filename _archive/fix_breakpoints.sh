#!/bin/bash

# === STEP 1: Backup ===
echo "Backing up assets/css/ to assets/css-backup/..."
cp -r assets/css assets/css-backup

# === STEP 2: Define replacements ===
echo "Running breakpoint corrections..."

# Fix min-width
find assets/css/ -type f -name "*.css" -exec sed -i '' 's/@media (min-width: 769px)/@media (min-width: 768px)/g' {} +
find assets/css/ -type f -name "*.css" -exec sed -i '' 's/@media (min-width: 481px)/@media (min-width: 480px)/g' {} +

# Fix max-width
find assets/css/ -type f -name "*.css" -exec sed -i '' 's/@media (max-width: 1200px)/@media (max-width: 1199px)/g' {} +
find assets/css/ -type f -name "*.css" -exec sed -i '' 's/@media (max-width: 992px)/@media (max-width: 991px)/g' {} +
find assets/css/ -type f -name "*.css" -exec sed -i '' 's/@media (max-width: 768px)/@media (max-width: 767px)/g' {} +
find assets/css/ -type f -name "*.css" -exec sed -i '' 's/@media (max-width: 640px)/@media (max-width: 639px)/g' {} +
find assets/css/ -type f -name "*.css" -exec sed -i '' 's/@media (max-width: 480px)/@media (max-width: 479px)/g' {} +

# === STEP 3: Summary output ===
echo "Summary of changes:"
grep -r "@media (min-width: 768px)" assets/css/
grep -r "@media (min-width: 480px)" assets/css/
grep -r "@media (max-width: 1199px)" assets/css/
grep -r "@media (max-width: 991px)" assets/css/
grep -r "@media (max-width: 767px)" assets/css/
grep -r "@media (max-width: 639px)" assets/css/
grep -r "@media (max-width: 479px)" assets/css/

echo "✅ Breakpoint corrections completed. Backup is in assets/css-backup/"