# Brandmine _data Directory

This directory contains all structured data files for the Brandmine website. These YAML files provide the content and configuration that drive the site's multilingual functionality, taxonomy system, and content relationships.

## Directory Structure

```
_data/
├── attributes/             # Attribute taxonomy data
│   ├── en.yml              # English attribute definitions
│   ├── ru.yml              # Russian attribute definitions
│   └── zh.yml              # Chinese attribute definitions
├── countries/              # Country information
│   ├── en.yml              # English country data
│   ├── ru.yml              # Russian country data
│   └── zh.yml              # Chinese country data
├── dimensions/             # Combined taxonomy dimensions
│   ├── en.yml              # English dimension data
│   ├── ru.yml              # Russian dimension data
│   └── zh.yml              # Chinese dimension data
├── fallback/               # Default content for empty states
│   ├── en.yml              # English fallback content
│   ├── ru.yml              # Russian fallback content
│   └── zh.yml              # Chinese fallback content
├── footer/                 # Footer-specific content
│   ├── en.yml              # English footer content
│   ├── ru.yml              # Russian footer content
│   └── zh.yml              # Chinese footer content
├── icons/                  # Icon configuration
│   └── en.yml              # Icon definitions
├── image_attributions.yml  # Image credits and sources
├── insights/               # Insight categories and metadata
│   ├── en.yml              # English insight categories
│   ├── ru.yml              # Russian insight categories
│   └── zh.yml              # Chinese insight categories
├── market-sectors/         # Market-specific sector data
│   ├── en/                 # English market-sector data
│   │   ├── brazil.yml      # Brazil sectors data
│   │   ├── china.yml       # China sectors data
│   │   └── ...             # Other markets
│   ├── ru/                 # Russian market-sector data
│   │   ├── brazil.yml      # Brazil sectors data (Russian)
│   │   └── ...             # Other markets (Russian)
│   └── zh/                 # Chinese market-sector data
│       ├── brazil.yml      # Brazil sectors data (Chinese)
│       └── ...             # Other markets (Chinese)
├── markets/                # Market taxonomy data
│   ├── en.yml              # English market definitions
│   ├── ru.yml              # Russian market definitions
│   └── zh.yml              # Chinese market definitions
├── navigation/             # Site navigation structure
│   ├── en.yml              # English navigation
│   ├── ru.yml              # Russian navigation
│   └── zh.yml              # Chinese navigation
├── sectors/                # Sector taxonomy data
│   ├── en.yml              # English sector definitions
│   ├── ru.yml              # Russian sector definitions
│   └── zh.yml              # Chinese sector definitions
├── signals/                # Signal taxonomy data
│   ├── en.yml              # English signal definitions
│   ├── ru.yml              # Russian signal definitions
│   └── zh.yml              # Chinese signal definitions
├── social/                 # Social media links and content
│   ├── en.yml              # English social media content
│   ├── ru.yml              # Russian social media content
│   └── zh.yml              # Chinese social media content
└── translations/           # UI string translations
    ├── en.yml              # English UI strings
    ├── ru.yml              # Russian UI strings
    └── zh.yml              # Chinese UI strings
```

## Data File Purposes

### Taxonomy Dimensions

These files define the four primary taxonomy dimensions and their translations:

#### attributes/
Brand attributes like "founder-led" or "heritage-brand"

**Example structure (en.yml):**
```yaml
founder-led: "Founder-Led"
heritage-brand: "Heritage Brand"
artisanal-excellence: "Artisanal Excellence"
# Additional attributes...
```

#### sectors/
Business sectors like "wine" or "hotels-resorts"

**Example structure (en.yml):**
```yaml
wine: "Wine"
hotels-resorts: "Hotels & Resorts"
natural-beauty: "Natural Beauty Products"
# Additional sectors...
```

#### markets/
Country/regional markets like "russia" or "brazil"

**Example structure (en.yml):**
```yaml
russia: "Russia"
brazil: "Brazil"
china: "China"
# Additional markets...
```

#### signals/
Growth signals like "export-ready" or "investment-ready"

**Example structure (en.yml):**
```yaml
export-ready: "Export Ready"
investment-ready: "Investment Ready"
rapid-growth: "Rapid Growth"
# Additional signals...
```

#### dimensions/
Combined taxonomy data across all dimensions (consolidated reference)

**Example structure (en.yml):**
```yaml
sectors:
  wine: "Wine"
  hotels-resorts: "Hotels & Resorts"
  # Additional sectors...
markets:
  russia: "Russia"
  brazil: "Brazil"
  # Additional markets...
attributes:
  founder-led: "Founder-Led"
  # Additional attributes...
signals:
  export-ready: "Export Ready"
  # Additional signals...
```

### Multilingual Content

These files manage site-wide translations and content:

#### translations/
UI strings and labels throughout the site

**Example structure (en.yml):**
```yaml
site:
  title: "Brandmine"
  description: "Discover BRICS+ Brands"

nav:
  home: "Home"
  brands: "Brands"
  # Additional navigation items...

brand:
  founder: "Founder"
  established: "Established"
  # Additional brand-related labels...

# Additional UI sections...
```

#### navigation/
Site navigation structure and hierarchy

**Example structure (en.yml):**
```yaml
main:
  - name: "Home"
    link: "/en/"
  - name: "Brands"
    link: "/en/brands/"
    children:
      - name: "All Brands"
        link: "/en/brands/"
      # Additional children...
  # Additional navigation items...
```

### Specialized Data

#### market-sectors/
Market-specific sector information and descriptions

**Example structure (en/russia.yml):**
```yaml
wine:
  title: "Russian Wine Industry"
  description: "Russia's growing wine industry focused on Black Sea coast regions."
  highlights:
    - "Over 100 commercial wineries"
    - "52% growth in the last five years"
  # Additional data...
```

#### image_attributions.yml
Attribution information for images used throughout the site

**Example structure:**
```yaml
images:
  - filename: "moscow-vineyard.jpg"
    original_name: "mikhail-nilov-vineyard-unsplash.jpg"
    source: "Unsplash"
    creator: "Mikhail Nilov"
    url: "https://unsplash.com/photos/..."
    license: "Unsplash License"
    category: "sectors"
  # Additional image attributions...
```

#### insights/
Insight content categories and metadata

**Example structure (en.yml):**
```yaml
categories:
  - id: brand_spotlight
    name: "Brand Spotlight"
    plural: "Brand Spotlights"
    description: "In-depth profiles of noteworthy brands"
  - id: founders_journey
    name: "Founder's Journey"
    plural: "Founder's Journeys"
    description: "Stories of brand founders and their paths"
  # Additional categories...
```

#### fallback/
Fallback content for empty states or missing content

**Example structure (en.yml):**
```yaml
featured_insight:
  title: "Exploring Russian Artisanal Brands"
  category: "Market Analysis"
  excerpt: "An overview of emerging craft brands in Russia's consumer market."
  image: "/assets/images/insights/placeholder.jpg"
  date: "2023-04-15"
# Additional fallback content...
```

## Using Data in Templates

### Accessing Translation Strings

```liquid
{{ site.data.translations[page.lang].site.title }}
```

### Accessing Taxonomy Data

```liquid
{{ site.data.dimensions[page.lang].sectors[sector_slug] }}
```

### Accessing Market-Sector Data

```liquid
{% assign sector_data = site.data.market-sectors[page.lang][market_slug][sector_slug] %}
```

### Accessing Navigation

```liquid
{% for item in site.data.navigation[page.lang].main %}
  <a href="{{ item.link }}">{{ item.name }}</a>
{% endfor %}
```

## Data File Relationships

- **translations/ → multiple files**: UI strings are used throughout the site
- **dimensions/ → multiple files**: Consolidated reference for all taxonomy dimensions
- **navigation/ → layout/header.html**: Navigation structure powers the site header
- **market-sectors/ → market-sector.html**: Powers market-sector intersection pages

## Multilingual Implementation

All data files follow the language structure:
- English: `en.yml` or `en/*.yml`
- Russian: `ru.yml` or `ru/*.yml`
- Chinese: `zh.yml` or `zh/*.yml`

Access in templates is consistently via the `page.lang` variable:
```liquid
{{ site.data.translations[page.lang].key.subkey }}
```

## Naming Conventions

- **File paths**: Use `language/file.yml` for language-specific files
- **Taxonomy slugs**: Use `kebab-case` for all slugs (e.g., `founder-led`, `hotels-resorts`)
- **Translation keys**: Use `snake_case` for keys in YAML files
- **Market-sectors**: Use market slug as filename (e.g., `russia.yml`)

## Best Practices

1. **Maintain Consistency**: Keep the same structure across all language versions
2. **Use Fallbacks**: When adding new translations, implement fallbacks for missing keys
3. **Keep Simple Structure**: Avoid deeply nested YAML as it becomes hard to maintain
4. **Document Structure**: Add comments in YAML files to explain complex structures
5. **Verify Completeness**: Ensure all required keys exist in all language versions

## Updating Data Files

When adding new content:

1. **Add to All Languages**: Update all language versions simultaneously
2. **Test Rendering**: Verify the new data renders correctly in templates
3. **Check References**: Ensure any referenced slugs exist in their respective files
4. **Validate YAML**: Use a YAML validator to check syntax
5. **Review Translations**: Have translations reviewed for accuracy

## Related Documentation

- See `_includes/README.md` for information on how data is used in components
- See `docs/component-relationships.md` for mapping between data and templates