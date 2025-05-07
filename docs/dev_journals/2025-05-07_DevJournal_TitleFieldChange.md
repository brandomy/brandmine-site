# Development Journal: Reverting From brand_name to title
**Date:** 2025-05-07  
**Topic:** Front Matter Field Naming Consistency

## 1. Problem Statement

Yesterday I changed the standard Jekyll `title` field in brand templates and pages to `brand_name`, thinking it would be more intuitive for brand profiles. However, upon reviewing the codebase, I discovered that many Jekyll templates, includes, and components expect and reference `page.title` rather than `page.brand_name`. This inconsistency could cause unexpected behavior in various site features including navigation, SEO, and sorting functionality.

## 2. Approach

The best approach is to revert back to using `title` as the primary field while maintaining backward compatibility during the transition. This involves:

1. First updating the templates to ensure new content uses the correct field
2. Then implementing a batch update for existing brand files across all languages
3. Optionally retaining both fields (`title` and `brand_name`) during a transition period

## 3. Implementation Details

### Template Changes

In all three brand templates (`brand-core.md`, `brand-lite.md`, and `brand-full.md`), the front matter should be updated:

```yaml
# Current problematic format:
brand_name: "BRAND NAME"

# Corrected format:
title: "BRAND NAME"
brand_name: "BRAND NAME"  # Keeping both for transition period
```

### Batch Update Script

A shell script to update existing brand files:

```bash
#!/bin/bash
# revert_title_field.sh
# Updates front matter in brand files to ensure title field exists

find _brands -type f -name "*.md" | while read file; do
  # Check if the file has brand_name but no title
  if grep -q "brand_name:" "$file" && ! grep -q "title:" "$file"; then
    # Extract the brand name value
    brand_name=$(grep "brand_name:" "$file" | sed 's/brand_name: *//' | sed 's/^"//' | sed 's/"$//')
    
    # Add title field with the same value
    sed -i.bak "s/brand_name: $brand_name/title: $brand_name\nbrand_name: $brand_name/" "$file"
    
    echo "Updated $file"
  fi
done
```

### Layout/Include References

No changes needed to layouts or includes since they already reference `page.title` rather than `page.brand_name`.

## 4. Decisions Made

1. **Use Standard Jekyll Conventions**: Stick with `title` as the primary field to maintain compatibility with Jekyll conventions and existing code.

2. **Maintain Both Fields Temporarily**: Keep both `title` and `brand_name` fields in front matter during the transition to ensure nothing breaks.

3. **Change Templates First**: Update templates first to ensure all new content uses the correct field structure.

4. **Batch Update Approach**: Use a script to update existing files rather than manual editing to ensure consistency and reduce errors.

## 5. Resources

- Updated templates:
  - `_templates/brands/brand-core.md`
  - `_templates/brands/brand-lite.md`
  - `_templates/brands/brand-full.md`

- Batch update script: `_scripts/revert_title_field.sh`

## 6. Insights & Learning

1. **Jekyll's Expected Conventions**: Jekyll has certain conventions and expected field names that are deeply integrated into its functionality. Deviating from these conventions can cause subtle but significant issues.

2. **Importance of Field Naming**: The naming of front matter fields is not just descriptive but functional, as many components and layouts depend on specific field names.

3. **Documentation Gap**: Our codebase would benefit from better documentation of expected front matter fields and their usage across templates and includes.

4. **Testing Changes**: Any changes to fundamental data structures like front matter fields should be tested across multiple templates and views before widespread implementation.

## 7. Next Actions

1. ✅ Update all three brand templates to use `title` and maintain `brand_name`
2. ✅ Create and run the batch update script to add `title` field to existing brand files
3. ✅ Verify site functionality after changes, especially navigation and brand listings
4. ✅ Update documentation to clarify that `title` should be used for the brand name
5. □ Consider creating a formal field reference guide for our Jekyll front matter
6. □ After 30 days with no issues, consider removing the redundant `brand_name` field

Once all brands have been updated to include both fields, we can evaluate whether to keep the `brand_name` field long-term or phase it out completely.
