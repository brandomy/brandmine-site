# Progressive Context Approach for Claude Sessions

This guide explains how to use the improved `claude-session-init.py` script to optimize your Claude sessions with a progressive context loading approach.

## What is the Progressive Context Approach?

The progressive context approach means starting Claude sessions with minimal necessary context and letting Claude ask for additional information when needed. This method:

1. **Saves context space** for more substantive conversations
2. **Keeps conversations focused** on specific tasks
3. **Provides Claude with exactly what it needs** when it needs it
4. **Improves response quality** by ensuring Claude has relevant information

## Using the Script

### Main Options

The updated script supports several different modes of operation:

```bash
# Basic comprehensive context (original behavior)
./claude-session-init.py [--focus AREA] [--copy] [--full]

# Progressive context approach
./claude-session-init.py --progressive [--copy]

# Task-specific context
./claude-session-init.py --task TASK [--since DATE] [--copy]

# Minimal context only
./claude-session-init.py --minimal [--copy]
```

### Key Parameters

| Option | Description |
|--------|-------------|
| `--progressive` | Generate minimal context with a menu of available context |
| `--task TASK` | Generate context specific to a particular task type |
| `--focus AREA` | Focus the context on a specific area of the site |
| `--since DATE` | Include only changes since the specified date (YYYY-MM-DD) |
| `--minimal` | Generate minimal context only (without the menu) |
| `--copy` | Automatically copy output to clipboard (requires pyperclip) |
| `--full` | Include comprehensive site details (larger context) |

### Example Commands

```bash
# Start a session with progressive context approach
./claude-session-init.py --progressive --copy

# Focus on a multilingual task that occurred after March 20
./claude-session-init.py --task translation --since 2025-03-20 --copy

# Get minimal context only
./claude-session-init.py --minimal --copy

# Focus on styling with full details
./claude-session-init.py --focus styling --full --copy
```

## Available Tasks

The `--task` parameter supports these predefined tasks:

| Task | Description | Includes Focus Areas |
|------|-------------|---------------------|
| `new-page` | Creating a new page | layout, content |
| `new-component` | Creating a new component | styling, layout |
| `debug` | Troubleshooting issues | functionality |
| `translation` | Working with translations | multilingual |

## Available Focus Areas

The `--focus` parameter supports these areas:

- `layout`: Page layouts and structure
- `content`: Site content and pages
- `multilingual`: Translation and language support
- `styling`: CSS and visual design
- `functionality`: JavaScript and interactive features
- `newsletter`: Newsletter integration
- `tags`: Tag system and taxonomy

## Context Snippets

The script works with prepared context snippets stored in the `_context_snippets/` directory. When using `--progressive`, Claude will be informed about available snippets that you can share upon request.

### Available Snippets

- `design_tokens.md`: Color, typography, spacing, and breakpoint tokens
- `css_architecture.md`: CSS organization and conventions
- `site_structure.md`: Directory structure and file organization
- `jekyll_config.md`: Jekyll configuration details
- `multilingual_system.md`: Translation system architecture
- `translation_workflow.md`: Process for creating multilingual content
- `tag_system.md`: Tag taxonomy and implementation
- `layout_system.md`: Page layout patterns
- `navigation_structure.md`: Site navigation implementation
- `development_workflow.md`: Development process and practices
- `component_examples.md`: HTML patterns for common components
- `progressive_context.md`: Information about this approach

## Workflow Example

### 1. Start with Progressive Context

```bash
./claude-session-init.py --progressive --copy
```

### 2. Paste the Generated Context into Claude

This provides Claude with:
- Essential project information
- Latest development focus
- Instructions on requesting additional context

### 3. Ask Your Initial Question

For example:
```
I'd like to create a filterable grid of brand cards that works within our Jekyll setup. The cards should display the brand name, description, and associated tags.
```

### 4. When Claude Requests Specific Context

Claude might respond:
```
Before I suggest an implementation, could you share your current card component structure and the tag display system?
```

### 5. Provide the Requested Context

```
Here's information about our component examples from _context_snippets/component_examples.md:

[Paste content of component_examples.md]

And here's our tag system from _context_snippets/tag_system.md:

[Paste content of tag_system.md]
```

### 6. Continue the Conversation

Claude now has exactly what it needs to provide relevant assistance tailored to your site's architecture and conventions.

## Benefits of this Approach

1. **Efficiency**: Conserves valuable context space
2. **Precision**: Claude gets exactly the information it needs
3. **Relevance**: Information is directly tied to the current task
4. **Learning**: You gain insight into which context is most valuable
5. **Adaptability**: Works for both simple and complex tasks

## Tips for Best Results

1. Start with the most appropriate command for your task
2. Keep your initial question clear and focused
3. Have context snippets ready for quick access
4. When Claude asks for context, provide it precisely
5. Use consistent language when referring to your site's components and systems
