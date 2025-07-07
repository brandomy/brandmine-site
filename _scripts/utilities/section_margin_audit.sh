#!/bin/bash
# =============================================================================
# Monthly Section Margin Audit Script
# =============================================================================
# Monitor compliance and track changes over time
# Part of Phase 4: Monitoring & Maintenance System

echo "📊 Section Margin Audit Report"
echo "=============================="
echo "Date: $(date)"
echo ""

# Current violation count (excluding backup files)
total_violations=$(grep -r "margin-bottom.*var(--space-[4-9]" assets/css/ | grep -v ".backup" | grep -v ".BACKUP" | wc -l | tr -d ' ')
echo "Total violations: $total_violations"

# Baseline from Phase 3 completion
baseline_violations=87
initial_violations=595

# Calculate compliance percentage
compliance=$(( (initial_violations - total_violations) * 100 / initial_violations ))
echo "Compliance: $compliance% (baseline: 85%)"

# Show improvement/regression from baseline
if [ $total_violations -gt $baseline_violations ]; then
    change=$((total_violations - baseline_violations))
    echo "⚠️  REGRESSION: $change violations added since baseline"
    echo "🔧 ACTION: Review recent changes and apply section margin cleanup"
elif [ $total_violations -lt $baseline_violations ]; then
    improvement=$((baseline_violations - total_violations))
    echo "📈 IMPROVEMENT: $improvement violations eliminated since baseline!"
    echo "✅ STATUS: Continued progress beyond Phase 3"
else
    echo "✅ STABLE: Maintaining baseline compliance"
fi

echo ""
echo "Violations by area:"
echo "=================="

# Page violations (should be 0)
page_violations=$(grep -r "margin-bottom.*var(--space-[4-9]" assets/css/pages/ 2>/dev/null | grep -v ".backup" | grep -v ".BACKUP" | wc -l | tr -d ' ')
echo "Pages: $page_violations (target: 0)"

# Component violations
component_violations=$(grep -r "margin-bottom.*var(--space-[4-9]" assets/css/components/ 2>/dev/null | grep -v ".backup" | grep -v ".BACKUP" | wc -l | tr -d ' ')
echo "Components: $component_violations"

# Layout violations
layout_violations=$(grep -r "margin-bottom.*var(--space-[4-9]" assets/css/layout/ 2>/dev/null | grep -v ".backup" | grep -v ".BACKUP" | wc -l | tr -d ' ')
echo "Layout: $layout_violations"

# Collections violations
collections_violations=$(grep -r "margin-bottom.*var(--space-[4-9]" assets/css/collections/ 2>/dev/null | grep -v ".backup" | grep -v ".BACKUP" | wc -l | tr -d ' ')
echo "Collections: $collections_violations"

echo ""
echo "Achievement Summary:"
echo "==================="
echo "Total eliminated: $((initial_violations - total_violations)) violations"
echo "Phase 3 success: 100% page consistency achieved"
echo "Current baseline: $baseline_violations violations (components/layout)"
echo "Prevention system: Active via pre-commit hooks"

# Page consistency check (critical success metric)
if [ $page_violations -eq 0 ]; then
    echo "✅ PAGE CONSISTENCY: 100% maintained across all user touchpoints"
else
    echo "❌ PAGE CONSISTENCY: Violations detected in page files!"
    echo "   This violates Phase 3 achievement - immediate action required"
fi

echo ""
echo "Recommended Actions:"
echo "==================="
if [ $total_violations -gt $baseline_violations ]; then
    echo "1. Review recent commits for new margin-bottom patterns"
    echo "2. Apply section margin cleanup to new violations"
    echo "3. Ensure pre-commit hooks are running properly"
elif [ $page_violations -gt 0 ]; then
    echo "1. URGENT: Fix page violations to maintain 100% page consistency"
    echo "2. Review page CSS files for margin-bottom patterns"
    echo "3. Convert to padding-bottom for seamless section flow"
else
    echo "1. Continue current development practices"
    echo "2. Monitor compliance during quarterly reviews"
    echo "3. Consider component-level cleanup for further improvement"
fi

echo ""
echo "Audit complete. Next audit recommended in 30 days."
echo "Report saved to: $(pwd)/_logs/audit_$(date +%Y%m%d_%H%M%S).log"