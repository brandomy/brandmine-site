# Translation Management Cheatsheet

**Quick reference for managing translations in the Brandmine Jekyll site**

## 🎯 **Golden Rules**

1. **Use `common` first** - Check if a term exists in `common.*` before creating new sections
2. **One translation, multiple uses** - Never duplicate the same term across sections
3. **Consistent naming** - Use descriptive, hierarchical keys (`actions.view_profile`, not `vp`)
4. **Always provide fallbacks** - Every translation include should have a fallback

---

## 📁 **Translation File Structure**

```
_data/translations/
├── en.yml (English - primary)
├── ru.yml (Russian)
└── zh.yml (Chinese)
```

**Each file has the same structure:**

```yaml
site:           # Site metadata
common:         # 🎯 USE THIS FIRST - Shared UI elements
nav:            # Navigation items
search:         # Search interface
filter:         # Filter controls
pagination:     # Page navigation
footer:         # Footer content
home:           # Home page specific
brands:         # Brands page specific
insights:       # Insights page specific
# ... etc
```

---

## 🔥 **Common Section (Use This First!)**

**Before adding new translations, check if they exist in `common`:**

```yaml
common:
  actions:
    view_profile: "View Profile"
    view_all: "View All"
    read_more: "Read More"
    load_more: "Load More"
    get_in_touch: "Get in Touch"
    search: "Search"
    apply: "Apply"
    clear: "Clear"
    # ... more actions
  
  empty_states:
    no_results: "No results found"
    no_brands: "No brands available"
    no_insights: "No insights available"
    loading: "Loading..."
    # ... more states
  
  forms:
    search_placeholder: "Search..."
    email_placeholder: "Your email address"
    required: "Required"
    optional: "Optional"
    # ... more form elements
  
  labels:
    featured: "Featured"
    premium: "Premium"
    all: "All"
    filter: "Filter"
    # ... more labels
```

---

## 💡 **How to Use Translations**

### ✅ **Correct Usage**

```liquid
<!-- Use the centralized translation helper -->
{% include helpers/t.html key="common.actions.view_profile" fallback="View Profile" %}

<!-- Use with variables -->
{% assign button_key = "common.actions." | append: button_type %}
{% include helpers/t.html key=button_key fallback="Action" %}
```

### ❌ **Avoid These Patterns**

```liquid
<!-- Don't access translations directly -->
{{ site.data.translations[page.lang].buttons.view_profile }}

<!-- Don't create duplicates -->
{% include helpers/t.html key="brands.view_profile_button" %}
<!-- Use common.actions.view_profile instead -->

<!-- Don't forget fallbacks -->
{% include helpers/t.html key="common.actions.view_profile" %}
<!-- Always include fallback="View Profile" -->
```

---

## 📝 **Adding New Translations**

### **Step 1: Check if it exists in `common`**
- Look in `common.actions` for buttons/links
- Look in `common.labels` for UI labels  
- Look in `common.forms` for form elements
- Look in `common.empty_states` for no-content messages

### **Step 2: If not in common, decide where it belongs**

**Add to `common` if it will be used in multiple places:**
```yaml
common:
  actions:
    download: "Download"     # ✅ Will be used on multiple pages
    export: "Export"         # ✅ Will be used in different contexts
```

**Add to specific sections if truly unique:**
```yaml
insights:
  article:
    reading_time: "min read"    # ✅ Only used in insight articles
    published_on: "Published"   # ✅ Only used in insight metadata
```

### **Step 3: Add to ALL language files**

**Always update all 3 files in the same commit:**
- `_data/translations/en.yml`
- `_data/translations/ru.yml` 
- `_data/translations/zh.yml`

### **Step 4: Use the translation helper**

```liquid
{% include helpers/t.html key="common.actions.download" fallback="Download" %}
```

---

## 🔧 **Best Practices**

### **Naming Conventions**
- Use **descriptive keys**: `actions.submit_form` not `submit`
- Use **hierarchical structure**: `forms.contact.email_label` not `contact_email`
- Use **consistent patterns**: `view_all_brands`, `view_all_insights` (not `see_all_brands`)

### **Organization**
- **Group by function**, not by page when possible
- **Keep page-specific content** in page sections only if truly unique
- **Use consistent structure** across all language files

### **Fallbacks**
- **Always provide fallbacks** - protects against missing translations
- **Use English as fallback** for consistency
- **Make fallbacks descriptive** - `"View Profile"` not `"Click Here"`

---

## 🧹 **Cleanup Guidelines**

### **Removing Duplicates**
1. **Find duplicates**: Search for the same term across sections
2. **Consolidate to `common`**: Move to appropriate `common` subsection
3. **Update components**: Change includes to use `common.*` keys
4. **Remove old entries**: Mark as deprecated, then remove after testing
5. **Update all languages**: Make changes in all 3 translation files

### **Deprecated Sections**
Currently deprecated (safe to remove after migration):
- `buttons.*` → Use `common.actions.*`
- `pagination.load_more|next|previous` → Use `common.actions.*`
- Individual `founder_names` → Use `founders.json` system

---

## 🚀 **Quick Examples**

```liquid
<!-- Button text -->
{% include helpers/t.html key="common.actions.view_profile" fallback="View Profile" %}

<!-- Empty state -->
{% include helpers/t.html key="common.empty_states.no_brands" fallback="No brands available" %}

<!-- Form placeholder -->
<input placeholder="{% include helpers/t.html key='common.forms.search_placeholder' fallback='Search...' %}">

<!-- Page-specific content -->
{% include helpers/t.html key="insights.article.reading_time" fallback="min read" %}

<!-- Dynamic keys -->
{% assign action_key = "common.actions." | append: action_type %}
{% include helpers/t.html key=action_key fallback="Action" %}
```

---

## ⚠️ **Migration Notes**

- `founder_names.*` → Use `founders.json` with multilingual names
- `buttons.*` → Use `common.actions.*`
- `pagination.load_more` → Use `common.actions.load_more`
- Direct translation access → Use `helpers/t.html` include

---

## 📊 **Translation File Health Check**

**Before adding new content:**
1. ✅ Check if term exists in `common`
2. ✅ Ensure all 3 language files are updated
3. ✅ Use translation helper with fallback
4. ✅ Test build with `bundle exec jekyll build`
5. ✅ Verify in browser across languages

**Healthy translation files have:**
- Minimal duplication across sections
- Consistent structure across languages  
- Proper use of `common` section
- All components using `helpers/t.html`