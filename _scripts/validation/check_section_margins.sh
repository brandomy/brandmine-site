#!/bin/bash
# =============================================================================
# Section Margin Validation Script
# =============================================================================
# Prevents section margin violations in new code
# Part of Phase 4: Final Validation & Prevention system

echo "🔍 Checking for section margin violations..."

# Check for section margin violations (excluding backup files)
violations=$(grep -r "margin-bottom.*var(--space-[4-9]" assets/css/ | grep -v ".backup" | grep -v ".BACKUP" | wc -l | tr -d ' ')

# Set baseline violation count (current as of Phase 3 completion)
baseline_violations=87

if [ $violations -gt $baseline_violations ]; then
    echo "❌ VIOLATION: New section margins detected!"
    echo "Current violations: $violations (baseline: $baseline_violations)"
    echo ""
    echo "New violations found:"
    grep -r "margin-bottom.*var(--space-[4-9]" assets/css/ | grep -v ".backup" | grep -v ".BACKUP"
    echo ""
    echo "🔧 FIX: Convert margin-bottom to padding-bottom"
    echo "   OLD: margin-bottom: var(--space-4);"
    echo "   NEW: padding-bottom: var(--space-4);"
    echo ""
    echo "📚 POLICY: Seamless section flow - use internal spacing (padding) only"
    exit 1
fi

echo "✅ Section margin compliance maintained ($violations violations, baseline: $baseline_violations)"

# Show improvement if violations decreased
if [ $violations -lt $baseline_violations ]; then
    improvement=$((baseline_violations - violations))
    echo "📈 IMPROVEMENT: $improvement violations eliminated since baseline!"
fi

exit 0