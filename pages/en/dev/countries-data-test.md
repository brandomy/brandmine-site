---
layout: default
title: "Countries Data System Test"
permalink: /en/dev/countries-data-test/
ref: countries-data-test
lang: en
---

# Countries Data System Test

This page demonstrates the two-tier countries data system implementation and shows various data access patterns.

## Country Code Display

**Thailand Alpha2 Code (Country Code):**
```liquid
th
```
Result: **th** (This is the alpha2/country code used throughout Brandmine)

## Basic Country Data Access

### Direct Access Examples

**Thailand Basic Name (English):**
```liquid
{{ site.data.countries_basic.countries.th.name.en }}
```
Result: {{ site.data.countries_basic.countries.th.name.en }}

**Thailand Basic Name (Russian):**
```liquid
{{ site.data.countries_basic.countries.th.name.ru }}
```
Result: {{ site.data.countries_basic.countries.th.name.ru }}

**Thailand Basic Name (Chinese):**
```liquid
{{ site.data.countries_basic.countries.th.name.zh }}
```
Result: {{ site.data.countries_basic.countries.th.name.zh }}

**Thailand Emoji Flag:**
```liquid
{{ site.data.countries_basic.countries.th.emoji }}
```
Result: {{ site.data.countries_basic.countries.th.emoji }}

## Alternative: Basic Data via Regional Files

**You can also access basic data through regional files (same data, different source):**

**Thailand Basic Name (English) - Working:**
```liquid
{{ site.data.countries.asia.countries.th.name.en }}
```
Result: {{ site.data.countries.asia.countries.th.name.en }}

**Thailand Basic Name (Russian) - Working:**
```liquid
{{ site.data.countries.asia.countries.th.name.ru }}
```
Result: {{ site.data.countries.asia.countries.th.name.ru }}

**Thailand Basic Name (Chinese) - Working:**
```liquid
{{ site.data.countries.asia.countries.th.name.zh }}
```
Result: {{ site.data.countries.asia.countries.th.name.zh }}

**Thailand Emoji Flag - Working:**
```liquid
{{ site.data.countries.asia.countries.th.emoji }}
```
Result: {{ site.data.countries.asia.countries.th.emoji }}

## Detailed Regional Data Access

### Direct Regional File Access

**Thailand Detailed Currency (from Asia region):**
```liquid
{{ site.data.countries.asia.countries.th.currency }}
```
Result: {{ site.data.countries.asia.countries.th.currency }}

**Thailand Capital City (English):**
```liquid
{{ site.data.countries.asia.countries.th.capital.en }}
```
Result: {{ site.data.countries.asia.countries.th.capital.en }}

**Thailand Phone Code:**
```liquid
{{ site.data.countries.asia.countries.th.phone_code }}
```
Result: {{ site.data.countries.asia.countries.th.phone_code }}

**Thailand Emoji:**
```liquid
{{ site.data.countries.asia.countries.th.emoji }}
```
Result: {{ site.data.countries.asia.countries.th.emoji }}

## Country Lookup Helper Examples

### Basic Data via Helper (Recommended Approach)

**The helper automatically finds country data in the appropriate regional file, providing unified access:**

**Country Code Display:**
```liquid
th (alpha2 country code)
```
Result: **th** (This is the alpha2/country code used throughout Brandmine)

**Basic Country Name (Auto-detects language):**
```liquid
{% include helpers/country-lookup.html country_code="th" property="name" %}
```
Result: {% include helpers/country-lookup.html country_code="th" property="name" %}

**Basic Country Name (Explicit Russian):**
```liquid
{% include helpers/country-lookup.html country_code="th" property="name" lang="ru" %}
```
Result: {% include helpers/country-lookup.html country_code="th" property="name" lang="ru" %}

**Basic Country Emoji:**
```liquid
{% include helpers/country-lookup.html country_code="th" property="emoji" %}
```
Result: {% include helpers/country-lookup.html country_code="th" property="emoji" %}

### Detailed Data via Helper

**Detailed Currency (Auto-detects regional file):**
```liquid
{% include helpers/country-lookup.html country_code="th" data_type="detailed" property="currency" %}
```
Result: {% include helpers/country-lookup.html country_code="th" data_type="detailed" property="currency" %}

**Detailed Capital City (English):**
```liquid
{% include helpers/country-lookup.html country_code="th" data_type="detailed" property="capital" lang="en" %}
```
Result: {% include helpers/country-lookup.html country_code="th" data_type="detailed" property="capital" lang="en" %}

**Detailed Phone Code:**
```liquid
{% include helpers/country-lookup.html country_code="th" data_type="detailed" property="phone_code" %}
```
Result: {% include helpers/country-lookup.html country_code="th" data_type="detailed" property="phone_code" %}

**Detailed Continent (Chinese):**
```liquid
{% include helpers/country-lookup.html country_code="th" data_type="detailed" property="continent" lang="zh" %}
```
Result: {% include helpers/country-lookup.html country_code="th" data_type="detailed" property="continent" lang="zh" %}

## Multi-Country Comparison

### BRICS Countries Data Display

{% assign brics_countries = "br,ru,in,cn,za" | split: "," %}

| Alpha2 Code | Country | Name (EN) | Name (RU) | Name (ZH) | Emoji |
|-------------|---------|-----------|-----------|-----------|-------|
{% for country_code in brics_countries -%}
| **{{ country_code }}** | {{ country_code | upcase }} | {% include helpers/country-lookup.html country_code=country_code property="name" lang="en" %} | {% include helpers/country-lookup.html country_code=country_code property="name" lang="ru" %} | {% include helpers/country-lookup.html country_code=country_code property="name" lang="zh" %} | {% include helpers/country-lookup.html country_code=country_code property="emoji" %} |
{% endfor %}

### BRICS Countries Detailed Data

| Country | Currency | Capital (EN) | Phone Code | Emoji |
|---------|----------|--------------|------------|-------|
{% for country_code in brics_countries -%}
| {{ country_code | upcase }} | {% include helpers/country-lookup.html country_code=country_code data_type="detailed" property="currency" %} | {% include helpers/country-lookup.html country_code=country_code data_type="detailed" property="capital" lang="en" %} | {% include helpers/country-lookup.html country_code=country_code data_type="detailed" property="phone_code" %} | {% include helpers/country-lookup.html country_code=country_code data_type="detailed" property="emoji" %} |
{% endfor %}

## Error Handling Examples

### Non-existent Country Code

**Basic data for 'xx' (should show fallback):**
```liquid
{% include helpers/country-lookup.html country_code="xx" property="name" fallback="Unknown Country" %}
```
Result: {% include helpers/country-lookup.html country_code="xx" property="name" fallback="Unknown Country" %}

**Detailed data for 'xx' (should show fallback):**
```liquid
{% include helpers/country-lookup.html country_code="xx" data_type="detailed" property="currency" fallback="N/A" %}
```
Result: {% include helpers/country-lookup.html country_code="xx" data_type="detailed" property="currency" fallback="N/A" %}

### Non-existent Property

**Valid country, invalid property (should show fallback):**
```liquid
{% include helpers/country-lookup.html country_code="th" property="nonexistent" fallback="Property not found" %}
```
Result: {% include helpers/country-lookup.html country_code="th" property="nonexistent" fallback="Property not found" %}

## Regional Auto-Detection Test

### Countries from Different Regions

**Thailand (alpha2: th, Asia region):**
- Basic Name: {% include helpers/country-lookup.html country_code="th" property="name" %}
- Detailed Currency: {% include helpers/country-lookup.html country_code="th" data_type="detailed" property="currency" %}

**Germany (alpha2: de, Europe region):**
- Basic Name: {% include helpers/country-lookup.html country_code="de" property="name" %}
- Detailed Currency: {% include helpers/country-lookup.html country_code="de" data_type="detailed" property="currency" %}

**Brazil (alpha2: br, Americas region):**
- Basic Name: {% include helpers/country-lookup.html country_code="br" property="name" %}
- Detailed Currency: {% include helpers/country-lookup.html country_code="br" data_type="detailed" property="currency" %}

**Nigeria (alpha2: ng, Africa region):**
- Basic Name: {% include helpers/country-lookup.html country_code="ng" property="name" %}
- Detailed Currency: {% include helpers/country-lookup.html country_code="ng" data_type="detailed" property="currency" %}

**Australia (alpha2: au, Oceania region):**
- Basic Name: {% include helpers/country-lookup.html country_code="au" property="name" %}
- Detailed Currency: {% include helpers/country-lookup.html country_code="au" data_type="detailed" property="currency" %}

## Performance Notes

- **Alpha2 codes**: Always available as the fundamental country identifier
- **Basic data access**: Currently accessed via regional files due to Jekyll data loading priority
- **Detailed data access**: Helper auto-detects regional file and loads appropriate data
- **Regional files loaded**: Only when needed for detailed data access
- **Language fallback**: Helper automatically falls back to English if requested language not available

## System Architecture Status

This two-tier system provides:

1. **Alpha2 country codes**: The primary identifier used throughout Brandmine (e.g., "th" for Thailand)
2. **Unified helper access** for both basic and detailed data via regional files
3. **Rich detailed data** when needed (currency, capitals, phone codes, etc.)
4. **Automatic regional detection** - no need to specify which regional file to use
5. **Multilingual support** with automatic fallback handling
6. **Graceful error handling** with customizable fallback values

**Note**: While the original design intended for `countries.json` to provide basic data, Jekyll's data loading prioritizes the `countries/` directory. The helper system compensates by providing unified access to regional files for both basic and detailed data.

---

*This test page validates the countries data system implementation and demonstrates proper usage patterns for both direct access and helper-based access methods.*