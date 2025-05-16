# Jekyll Error Reference

## Error: Unknown tag 'endcomment'
- **Actual issue**: Often a CSS syntax error
- **Resolution**: Check CSS files for missing/extra braces
- **Command to find**: `grep -r "}}$" --include="*.css" .`

## Error: Invalid CSS after "...": expected "}", was ""
- **Actual issue**: Missing closing brace in CSS
- **Resolution**: Add missing closing brace
- **Command to find**: `npx stylelint "assets/css/**/*.css"`

## Error: cannot load such file -- webrick
- **Actual issue**: Missing webrick gem with Ruby 3+
- **Resolution**: `bundle add webrick`

## Error: "No such file or directory @ rb_sysopen"
- **Actual issue**: Referenced file doesn't exist
- **Resolution**: Check include paths
- **Command to find**: `grep -r "include " --include="*.html" .`
