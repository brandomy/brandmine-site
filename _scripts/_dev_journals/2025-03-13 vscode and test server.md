# 2025-03-13 Development Journal: VS Code Jekyll Server Integration

## 1. Problem Statement

We needed to optimize the workflow for editing and previewing our Jekyll-based Brandmine website during development. Specifically, we wanted to:

- Create a streamlined way to start the Jekyll server from within VS Code
- Set up a keyboard shortcut (Cmd+Shift+B on Mac) to quickly launch the server
- Avoid having to manually type `bundle exec jekyll serve` each time
- Create a consistent development environment between coding and previewing

The goal was to improve development efficiency by integrating Jekyll server controls directly into the VS Code workflow using VS Code's built-in task system.

## 2. Approach

We attempted to set up VS Code tasks to launch the Jekyll server with a keyboard shortcut. Our approach evolved through several attempts:

1. **Initial solution**: Create a `.vscode/tasks.json` file to define a build task that would launch Jekyll
2. **Alternative attempt**: Create a shell script that would ensure proper environment context
3. **Final practical solution**: Rely on manually starting the Jekyll server through the integrated terminal

We discovered discrepancies between the environment when running commands manually in the terminal versus through VS Code's task system, which led to bundler version conflicts.

## 3. Implementation Details

### Initial VS Code Task Configuration

We started by creating a `.vscode/tasks.json` file with this configuration:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Jekyll: Build & Serve",
      "type": "shell",
      "command": "bundle exec jekyll serve",
      "problemMatcher": [],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

This approach resulted in bundler version errors.

### Enhanced Task Configuration Attempt

We tried a more detailed configuration with explicit environment settings:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Jekyll: Build & Serve",
      "type": "shell",
      "command": "bundle",
      "args": ["exec", "jekyll", "serve"],
      "options": {
        "cwd": "${workspaceFolder}",
        "env": {
          "PATH": "${env:PATH}"
        },
        "shell": {
          "executable": "/bin/zsh",
          "args": ["-l"]
        }
      },
      "problemMatcher": [],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

This still resulted in bundler version errors.

### Shell Script Approach (Attempted)

We also attempted to create a shell script to ensure proper environment context:

```bash
#!/bin/zsh
cd "$(dirname "$0")"
bundle exec jekyll serve
```

With a corresponding tasks.json update:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Jekyll: Build & Serve",
      "type": "shell",
      "command": "./start-jekyll.sh",
      "problemMatcher": [],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

### Final Working Solution

The solution that ultimately worked was to:
1. Open the integrated terminal in VS Code with Ctrl+` (on Mac)
2. Manually type `bundle exec jekyll serve`
3. Keep the terminal open during development

This approach reliably starts the Jekyll server and provides direct visibility of Jekyll's output.

## 4. Decisions Made

### Environment Discrepancy Analysis

We determined that the root cause of our issues was an environment discrepancy:
- The manual terminal has access to the correct Ruby/bundler configuration
- VS Code tasks run in a more restricted environment that couldn't find bundler 2.6.5
- The project's Gemfile.lock required bundler 2.6.5, causing conflicts

### Task-Based Approach vs. Manual Terminal

We decided to abandon the task-based approach in favor of the manual terminal approach because:
- It worked reliably without configuration issues
- It provided direct visibility into Jekyll server output
- The overhead of typing the command was minimal compared to the troubleshooting effort
- It kept the workflow within VS Code while avoiding environment complexities

### Cleanup Decision

We decided to remove the experimental task configurations and scripts to maintain a clean project structure, since they weren't necessary for the chosen workflow.

## 5. Resources

### Error Messages Encountered

```
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems.rb:283:in `find_spec_for_exe': Could not find 'bundler' (2.6.5) required by your /Users/randaleastman/Documents/brandmine-site/Gemfile.lock. (Gem::GemNotFoundException)
To update to the latest version installed on your system, run `bundle update --bundler`.
To install the missing version, run `gem install bundler:2.6.5`
```

### Successful Command Output

```
randaleastman@Mac brandmine-site % bundle exec jekyll serve
Configuration file: /Users/randaleastman/Documents/brandmine-site/_config.yml
To use retry middleware with Faraday v2.0+, install `faraday-retry` gem
            Source: /Users/randaleastman/Documents/brandmine-site
       Destination: /Users/randaleastman/Documents/brandmine-site/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
       Jekyll Feed: Generating feed for posts
                    done in 1.108 seconds.
 Auto-regeneration: enabled for '/Users/randaleastman/Documents/brandmine-site'
    Server address: http://127.0.0.1:4000/
  Server running... press ctrl-c to stop.
```

## 6. Insights & Learning

### Ruby Environment Management
- macOS system Ruby (located at `/System/Library/Frameworks/Ruby.framework/`) can cause permission and version management issues
- Ruby version managers like rbenv are recommended for development but require additional setup
- The system Ruby environment can have different configurations between shell sessions and program executions

### VS Code Task System
- VS Code tasks can execute shell commands through the `tasks.json` configuration
- Tasks can be bound to keyboard shortcuts for quick execution
- The task environment may differ from the interactive terminal environment
- Tasks can be configured with specific shells, arguments, and environment variables

### Jekyll Development Workflow
- Jekyll requires a local server (`bundle exec jekyll serve`) to preview site changes
- Changes to files are automatically detected and the site is regenerated
- The server runs at http://localhost:4000 by default
- The server can be stopped with Ctrl+C in the terminal

### Terminal Integration in VS Code
- VS Code's integrated terminal (opened with Ctrl+` on Mac) provides a seamless development experience
- The integrated terminal inherits the proper shell environment configuration
- Terminal sessions can be kept open alongside the editor for ongoing processes

## 7. Next Actions

### Immediate Next Steps
- [x] Clean up any remaining configuration files from failed attempts
- [ ] Document the current workflow for team reference
- [ ] Ensure proper Jekyll plugins are installed for GitHub Pages compatibility

### Potential Future Improvements
- [ ] Investigate setting up rbenv for better Ruby version management
- [ ] Explore Jekyll-specific VS Code extensions for enhanced workflow
- [ ] Consider automating the Jekyll server start on project open (if desired)
- [ ] Look into implementing LiveReload capabilities for instant preview updates

### Open Questions
- Is the Jekyll server performance adequate for development needs?
- Should we consider upgrading the Ruby/Jekyll environment in the future?
- Are there other VS Code extensions that would enhance the Jekyll development workflow?
- Would a Docker-based development environment resolve the environment inconsistencies?

---

This journal entry documents our exploration of VS Code task configuration for Jekyll server integration, the challenges encountered with Ruby environment management, and our pragmatic solution of using the integrated terminal for Jekyll server control. While we didn't achieve the keyboard shortcut-driven workflow initially desired, we established a reliable and straightforward development process that keeps everything within the VS Code environment.
