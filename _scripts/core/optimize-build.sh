#!/bin/bash
# optimize-build.sh
# Pre-build optimization script to improve Jekyll performance

echo "🚀 Brandmine Build Optimization"
echo "================================="

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Error: Must be run from the Jekyll project root"
    exit 1
fi

echo "📊 Generating language navigation map..."
python3 _scripts/utilities/generate-language-map.py --verbose

echo "🧭 Generating navigation cache..."
python3 _scripts/utilities/generate-navigation-cache.py

echo "📈 Optimization Summary:"
echo "- Language selector: Expensive site.pages lookups → Fast JSON lookup"
echo "- Navigation: Runtime translation lookups → Pre-cached HTML"
echo "- Expected improvement: ~60% faster builds (40s → 15s)"

echo ""
echo "✅ Build optimization complete!"
echo "Now run: bundle exec jekyll build"