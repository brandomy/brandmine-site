# Add to scripts/ directory
cat > scripts/sprint-status.sh << 'EOF'
#!/bin/bash
echo "# Sprint Status - $(date +%Y-%m-%d)"
echo ""
echo "## In Progress"
grep -A 10 "### In Progress" TODO.md | grep "^- \[ \]"
echo ""
echo "## Completed This Sprint"
grep -A 20 "## Completed" TODO.md | grep "^- \[x\].*$(date +%b)"
echo ""
echo "## Blockers"
sed -n '/## Notes/,/^$/p' TODO.md | grep -i "blocker"
EOF