# Progressive Context System for Claude Sessions

## Minimal Context Introduction

When starting a new Claude session, begin with this minimal context:

```
# Brandmine Jekyll Website - Quick Reference

## Project Overview
- Jekyll-based multilingual website (EN, RU, ZH)
- Focus on showcasing BRICS+ consumer brands
- Current navigation structure: Home, Brands, Discover (Sectors, Markets, Attributes, Signals), Insights, About

## Available Context Information
If needed, I can provide additional context from these categories:

1. Design System: Colors, typography, spacing, components
2. Site Structure: Directory layout, Jekyll configuration
3. Multilingual System: Translation structure and workflow
4. Layout System: Page structure, responsive approach
5. Tag System: Taxonomy structure and implementation
6. Component Examples: Standard HTML patterns
7. Development Workflow: Current processes

Please ask for specific context when needed, and I'll share the relevant files.
```

## Workflow Instructions

1. Start new sessions with minimal context
2. When Claude asks for specific context, share the relevant _context_snippets file
3. Only provide context when requested or clearly needed
4. Reference file names when sharing context: "Here's our multilingual system structure from _context_snippets/multilingual_system.md"

## Context Request Examples

**Claude might ask:**
"Before I can help with that navigation issue, could you share your current navigation structure?"

**You would respond:**
"Here's our navigation structure from _context_snippets/navigation_structure.md:

[Paste content of navigation_structure.md]"

## Benefits

- Keeps initial context minimal
- Provides exactly what Claude needs when needed
- Maintains consistency across sessions
- Focuses conversations on specific tasks
- Enables Claude to reference your design system accurately