#\!/bin/bash

echo "=== VALIDATING CSS FILE ORGANIZATION ==="
echo ""

missing_files=0

# Check components
echo "Checking component CSS files..."
find _includes/components -name "*.html" | while read html_file; do
    # Get relative path from _includes/components/
    rel_path=$(echo "$html_file" | sed 's|_includes/components/||')
    # Convert to CSS path
    css_file="assets/css/components/${rel_path%.html}.scss"
    
    if [ \! -f "$css_file" ]; then
        echo "❌ Missing CSS file: $css_file"
        ((missing_files++))
    else
        echo "✅ Found: $css_file"
    fi
done

# Check pages
echo ""
echo "Checking page CSS files..."
find _includes/pages -name "*.html" | while read html_file; do
    # Get relative path from _includes/pages/
    rel_path=$(echo "$html_file" | sed 's|_includes/pages/||')
    # Convert to CSS path
    css_file="assets/css/pages/${rel_path%.html}.scss"
    
    if [ \! -f "$css_file" ]; then
        echo "❌ Missing CSS file: $css_file"
        ((missing_files++))
    else
        echo "✅ Found: $css_file"
    fi
done

if [ $missing_files -eq 0 ]; then
    echo ""
    echo "✅ All CSS files properly organized"
else
    echo ""
    echo "❌ Found $missing_files missing CSS files"
    echo "Create matching CSS files for better organization and debugging"
fi
