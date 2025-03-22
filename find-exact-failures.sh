#!/bin/bash

# Create a temporary diagnostic version of the site summary script
cat > _scripts/diagnostic.sh << 'EOF'
#!/bin/bash

# Set up error trap to catch failing grep commands
trap 'echo "COMMAND FAILED: $BASH_COMMAND" >&2' ERR

# Run the site summary script with error detection
_scripts/enhanced-site-summary-advanced.sh --display > /dev/null 2> /tmp/grep_errors.log

# Display errors
echo "=== Failing Commands ==="
grep "COMMAND FAILED:" /tmp/grep_errors.log
EOF

# Make it executable
chmod +x _scripts/diagnostic.sh

echo "Diagnostic script created. Run with: ./_scripts/diagnostic.sh"