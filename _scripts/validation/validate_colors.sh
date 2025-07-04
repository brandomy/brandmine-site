#\!/bin/bash

echo "=== VALIDATING BRANDMINE COLOR CONSISTENCY ==="
echo ""

# Check for hardcoded colors that should use variables
echo "Checking for hardcoded insight category colors..."

hardcoded_colors=0

# Check for hardcoded orange (should use --secondary-*)
if grep -r "#f97316\|#fd7e14" assets/css/ --exclude="tokens.scss" | grep -v "comment\|\/\*"; then
    echo "❌ Found hardcoded orange colors - use var(--secondary-500) instead"
    ((hardcoded_colors++))
fi

# Check for hardcoded purple (should use --accent-*)  
if grep -r "#6366f1\|#6f42c1" assets/css/ --exclude="tokens.scss" | grep -v "comment\|\/\*"; then
    echo "❌ Found hardcoded purple colors - use var(--accent-500) instead"
    ((hardcoded_colors++))
fi

# Check for hardcoded sky blue (should use --sky-*)
if grep -r "#0ea5e9" assets/css/ --exclude="tokens.scss" | grep -v "comment\|\/\*"; then
    echo "❌ Found hardcoded sky blue colors - use var(--sky-500) instead"
    ((hardcoded_colors++))
fi

# Check for hardcoded olive green (should use --olive-*)
if grep -r "#84cc16\|#28a745" assets/css/ --exclude="tokens.scss" | grep -v "comment\|\/\*"; then
    echo "❌ Found hardcoded olive green colors - use var(--olive-500) instead"
    ((hardcoded_colors++))
fi

# Check for max-width usage (should use min-width)
echo ""
echo "Checking for max-width usage (should use min-width)..."
if grep -r "max-width" assets/css/ | grep -v "100%\|none\|comment\|\/\*"; then
    echo "❌ Found max-width usage - use min-width for mobile-first approach"
    ((hardcoded_colors++))
else
    echo "✅ No problematic max-width usage found"
fi

echo ""
if [ $hardcoded_colors -eq 0 ]; then
    echo "✅ All color usage follows Brandmine standards"
else
    echo "❌ Found $hardcoded_colors color standard violations"
    echo "Update hardcoded colors to use official CSS variables"
fi
