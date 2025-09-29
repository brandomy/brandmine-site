#!/bin/bash
# Update TODO.md based on GitHub Issues

gh issue list --state open --json title,state,labels --jq '.[] |
  "- [ ] \(.title) #\(.labels[0].name)"' > TODO-sync.md

echo "Updated TODO-sync.md with current GitHub issues"
#
