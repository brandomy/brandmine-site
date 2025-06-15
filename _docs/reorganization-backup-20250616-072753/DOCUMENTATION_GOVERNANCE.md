# Documentation Governance Rules

**Purpose**: Prevent documentation bloat and maintain the 4-document foundation

## Core Principles

### 1. Maximum 4 Core Documents
- **Setup Guide** - Environment and first steps
- **Daily Workflows** - Common tasks and procedures  
- **Technical Reference** - Architecture and patterns
- **Troubleshooting** - Problem resolution

### 2. Master Documentation Rule
- **CLAUDE.md** remains the comprehensive master document
- Core 4 documents provide quick daily reference only
- Never duplicate content between CLAUDE.md and core documents

### 3. 30-Second Information Rule
- Any daily task must be findable within 30 seconds
- If you can't find something quickly, improve organization, don't add documents

## Content Guidelines

### What Goes Where

**CLAUDE.md** (Master):
- Complete project overview and philosophy
- Comprehensive architecture explanations
- Historical context and design decisions
- AI collaboration instructions

**Setup Guide**:
- Environment installation only
- First-time setup procedures
- Verification steps

**Daily Workflows**:
- Step-by-step task procedures
- Common command sequences
- Quick reference tables

**Technical Reference**:
- Architecture patterns and conventions
- Code examples and snippets
- Directory structure reference

**Troubleshooting**:
- Error messages and solutions
- Diagnostic commands
- Recovery procedures

### What NOT to Add

❌ **Never create these document types**:
- Development journals (historical only)
- Meeting notes or session summaries
- Detailed architectural explanations (use CLAUDE.md)
- Multiple guides for the same topic
- Archive or backup documentation

## Maintenance Process

### Before Adding Any Documentation

**Ask these questions**:
1. Can this go in an existing document?
2. Is this information already in CLAUDE.md?
3. Will someone need this daily or just occasionally?
4. Does this improve the 30-second find rule?

### If You Must Add Content

**Follow this process**:
1. Try to add to existing documents first
2. If creating new content, remove equal amount from elsewhere
3. Update README.md navigation if structure changes
4. Test that new content is findable within 30 seconds

### Monthly Review Process

**Every 30 days, check**:
- Are all 4 documents still focused and concise?
- Can any content be merged or removed?
- Is the 30-second rule still working?
- Are there any new documents creeping in?

## Change Control

### Allowed Changes
✅ **Update existing content** in the 4 core documents
✅ **Improve organization** within existing documents  
✅ **Add command examples** to Daily Workflows
✅ **Update troubleshooting** based on real issues

### Restricted Changes
⚠️ **Adding new sections** requires removing equivalent content elsewhere
⚠️ **Creating new documents** requires special justification
⚠️ **Duplicating information** between documents is forbidden

### Forbidden Changes
❌ **Never create** additional core documentation files
❌ **Never create** archive directories in _docs/
❌ **Never move** comprehensive content out of CLAUDE.md
❌ **Never allow** documentation to exceed 6 total files in _docs/

## Enforcement

### Pre-Commit Check
Add to `_scripts/core/pre-commit_check.sh`:
```bash
# Count documentation files
doc_count=$(find _docs -name "*.md" | wc -l)
if [ $doc_count -gt 6 ]; then
    echo "❌ Too many documentation files: $doc_count (max: 6)"
    exit 1
fi
```

### Review Triggers
**These situations require documentation review**:
- Any new .md file in _docs/
- Changes to more than 2 documents in one session
- Any mention of "creating documentation" in commits
- Feedback that something is hard to find

## Success Metrics

### Quantitative Measures
- **Total files**: ≤6 markdown files in _docs/
- **Find time**: Any information discoverable in <30 seconds
- **Build docs impact**: Documentation changes don't slow build

### Qualitative Measures  
- **New contributors** can start working within 5 minutes
- **Common tasks** have clear, findable procedures
- **Problem resolution** follows logical troubleshooting flow
- **Information** feels organized, not overwhelming

---

**Remember**: The goal is minimum viable documentation that maximizes developer productivity. More is not better.