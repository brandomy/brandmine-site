# Jekyll Website Context Management Workflow

When developing your Jekyll website across multiple Claude sessions, follow this workflow to maintain context continuity and get more effective assistance.

## Preparing for a New Claude Session

### Step 1: Generate an updated site summary

```bash
./enhanced-site-summary.sh
```

This analyzes your website's current state and generates a comprehensive `site-summary.md` file containing directory structure, content details, configuration information, and recent development activity.

### Step 2: Initialize a focused Claude session

```bash
./claude-session-init.py --focus AREA --copy
```

Replace `AREA` with one of: `layout`, `styling`, `content`, `multilingual`, `functionality`, or `newsletter`.

For example, to focus on styling issues:

```bash
./claude-session-init.py --focus styling --copy
```

This command:
- Extracts relevant information from your site summary
- Finds important files related to your focus area
- Includes recent project log entries about that area
- Adds code samples from relevant files
- Automatically copies all context to your clipboard
- Creates a `claude-context.md` backup file

### Step 3: Start a new Claude session

Open a new conversation with Claude and paste the context from your clipboard. This provides Claude with the necessary background about your website's structure and recent development history.

### Step 4: Describe your specific issue

After pasting the context, clearly explain the specific problem you're trying to solve. Be detailed about what you're seeing and what you want to achieve.

### Step 5: Work with Claude on solutions

With proper context, Claude can now provide targeted assistance. You can request code modifications, explanations, or discuss specific implementation approaches.

### Step 6: Document your changes

After implementing solutions, update your project log:

```bash
./project-log-maintainer.py add
```

The interactive prompt will guide you through documenting:
- A title for your changes
- The category of work
- Specific changes made
- Technical decisions and rationales
- Any planned next steps

This creates a historical record in `PROJECT_LOG.md` that will be available for future context sessions.

## Advanced Usage

For a more comprehensive context (useful for major changes):

```bash
./claude-session-init.py --focus AREA --copy --full
```

To view statistics about your development history:

```bash
./project-log-maintainer.py stats
```

To search for specific topics in your project log:

```bash
./project-log-maintainer.py search TERM
```

This workflow eliminates the need to manually explain your website structure in each conversation, allowing you to focus on solving specific problems while maintaining development continuity across multiple sessions.
