# Brandmine Multilingual Data Restructuring

## Overview

This document details the reorganization of Brandmine's multilingual data structure to create a more consistent, maintainable, and scalable system. We implemented a language-first data organization approach, separating content by type and language.

## Goals Achieved

1. Created a consistent pattern for organizing multilingual data
2. Improved maintainability by separating concerns (navigation, sectors, tags, etc.)
3. Simplified the process of adding/updating content for specific languages
4. Fixed structural issues preventing the site from building
5. Enhanced template flexibility with well-organized data references

## Implementation Details

### 1. Directory Structure Creation

We established a coherent data organization pattern:

```
_data/
  ├── navigation/  # Main navigation items
  │   ├── en.yml
  │   ├── ru.yml
  │   └── zh.yml
  ├── footer/      # Footer navigation items
  │   ├── en.yml
  │   ├── ru.yml
  │   └── zh.yml
  ├── social/      # Social media links
  │   ├── en.yml
  │   ├── ru.yml
  │   └── zh.yml
  ├── sectors/     # Sector definitions
  │   ├── en.yml
  │   ├── ru.yml
  │   └── zh.yml
  ├── tags/        # Tag translations
  │   ├── en.yml
  │   ├── ru.yml
  │   └── zh.yml
  └── translations/ # UI text translations
      ├── en.yml
      ├── ru.yml
      └── zh.yml
```

### 2. Data Migration

Migrated content from monolithic files to language-specific files:

- From `_data/navigation.yml` → `_data/navigation/{lang}.yml` 
- From `_data/sectors.yml` → `_data/sectors/{lang}.yml`
- From `_data/tag_translations.yml` → `_data/tags/{lang}.yml`

Additionally, created:
- `_data/footer/{lang}.yml` for footer links
- `_data/social/{lang}.yml` for social media links

### 3. Structure Optimization

Each data type follows a consistent pattern appropriate for its purpose:

**Navigation Files** (`_data/navigation/{lang}.yml`):
```yaml
# English navigation items
- name: "nav.home"
  link: "/en/"
- name: "nav.discover"
  link: "/en/discover/"
  children:
    - name: "nav.sectors"
      link: "/en/discover/sectors/"
```

**Sector Files** (`_data/sectors/{lang}.yml`):
```yaml
# English sectors
- id: spirits
  name: "Artisanal Spirits & Vodka"
  icon: "glass-whiskey"
```

**Tag Files** (`_data/tags/{lang}.yml`):
```yaml
# English tag translations
sectors:
  hotels-resorts: "Hotels & Resorts"
attributes:
  founder-led: "Founder-Led"
signals:
  export-ready: "Export Ready"
markets:
  russia: "Russia"
```

**Footer Files** (`_data/footer/{lang}.yml`):
```yaml
# English footer links
- name: "footer.privacy"
  link: "/en/privacy/"
```

**Social Files** (`_data/social/{lang}.yml`):
```yaml
# English social media links
- name: "social.twitter"
  link: "https://x.com/brandmine88"
  icon: "twitter"
```

### 4. Template Updates

Modified templates to reference the new data structure:

1. **Navigation References**:
   - Already working with `site.data.navigation[page.lang]`

2. **Footer Template**:
   - Changed: `site.data.navigation[page.lang].social` → `site.data.social[page.lang]`
   - Changed: `site.data.navigation[page.lang].footer` → `site.data.footer[page.lang]`

3. **Tag Templates**:
   - Changed: `site.data.tag_translations[type_plural][page.tag][page.lang]` → `site.data.tags[page.lang][type_plural][page.tag]`
   - Better organization with language as the primary selector

## Key Benefits

1. **Maintainability**: Editing Russian content? Work exclusively in ru.yml files.
2. **Clarity**: Clear separation of concerns with dedicated files for each data type.
3. **Consistency**: Same pattern applied across all multilingual data.
4. **Error Reduction**: Prevented YAML parsing issues by maintaining a consistent structure per file.
5. **Scalability**: Easy to add new languages by creating new language-specific files.
6. **Performance**: Smaller, more focused data files for better caching and load times.

## Implementation Notes

### Issue Diagnosis and Resolution

We encountered a YAML parsing error with the initial implementation:
```
Error: did not find expected '-' indicator while parsing a block collection at line 2 column 1
```

This occurred because we initially tried to combine multiple collections (navigation, footer, social) in the same YAML file. The solution was to separate these into dedicated files with consistent structures:

- Navigation files maintain an array of navigation items
- Footer files maintain an array of footer links
- Social files maintain an array of social media links

### Template Patterns

The templates now consistently use:
- `site.data.[data_type][page.lang]` - Language-first access pattern
- Proper translation key extraction with `{% assign key = item.name | remove: 'type_prefix.' %}`

## Future Recommendations

1. **Documentation**: Update the project documentation to reflect the new data structure.
2. **Developer Onboarding**: Include this structure in developer onboarding materials.
3. **Content Management**: Create helper scripts for content editors to easily update translations.
4. **Expansion**: Apply the same pattern to any new data types added in the future.
5. **Language Addition**: When adding a new language, ensure files are created in all data directories.

## Conclusion

This restructuring establishes a consistent, maintainable pattern for multilingual data management. By organizing data by type and then by language, we've created a system that is both logical for developers and efficient for the Jekyll build process. This pattern scales well for future expansion of both content types and language support.