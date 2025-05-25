---
layout: default
title: "Data Loading Verification"
description: "Verify that JSON data files load correctly"
lang: en
permalink: /en/dev/data-verification/
ref: dev-data-verification
---

# Data Loading Verification

This page tests that all JSON data files load correctly and shows their contents.

<div id="verification-results"></div>

<script>
async function verifyDataLoading() {
  const resultsDiv = document.getElementById('verification-results');
  resultsDiv.innerHTML = '<h2>Testing Data Loading...</h2>';

  const dataFiles = [
    { name: 'Brands', url: '/assets/data/brands.json' },
    { name: 'Founders', url: '/assets/data/founders.json' },
    { name: 'Insights', url: '/assets/data/insights.json' },
    { name: 'Dimensions', url: '/assets/data/dimensions.json' },
    { name: 'Search Index', url: '/search.json' }
  ];

  let html = '<h2>Data Loading Results</h2>';

  for (const file of dataFiles) {
    try {
      console.log(`Testing ${file.name} from ${file.url}`);
      const response = await fetch(file.url);

      if (!response.ok) {
        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
      }

      const data = await response.json();
      const itemCount = Array.isArray(data) ? data.length : Object.keys(data).length;

      html += `
        <div style="border: 1px solid #28a745; background: #d4edda; padding: 1rem; margin: 0.5rem 0; border-radius: 4px;">
          <h3>✅ ${file.name}</h3>
          <p><strong>URL:</strong> ${file.url}</p>
          <p><strong>Status:</strong> Loaded successfully</p>
          <p><strong>Items:</strong> ${itemCount} ${Array.isArray(data) ? 'items' : 'properties'}</p>
          <p><strong>Sample Data:</strong></p>
          <pre style="background: #f8f9fa; padding: 0.5rem; font-size: 0.8rem; overflow-x: auto;">${JSON.stringify(Array.isArray(data) ? data[0] : Object.keys(data).slice(0, 5), null, 2)}</pre>
        </div>
      `;

    } catch (error) {
      console.error(`Failed to load ${file.name}:`, error);
      html += `
        <div style="border: 1px solid #dc3545; background: #f8d7da; padding: 1rem; margin: 0.5rem 0; border-radius: 4px;">
          <h3>❌ ${file.name}</h3>
          <p><strong>URL:</strong> ${file.url}</p>
          <p><strong>Error:</strong> ${error.message}</p>
          <p><strong>Possible Issues:</strong></p>
          <ul>
            <li>File doesn't exist</li>
            <li>Invalid JSON format</li>
            <li>Server error</li>
            <li>Network connectivity issue</li>
          </ul>
        </div>
      `;
    }
  }

  // Test specific data structure
  html += '<h2>Data Structure Analysis</h2>';

  try {
    const brandsResponse = await fetch('/assets/data/brands.json');
    if (brandsResponse.ok) {
      const brandsData = await brandsResponse.json();
      const sampleBrand = Array.isArray(brandsData) ? brandsData[0] : brandsData;

      html += `
        <div style="border: 1px solid #17a2b8; background: #d1ecf1; padding: 1rem; margin: 0.5rem 0; border-radius: 4px;">
          <h3>🔍 Sample Brand Structure</h3>
          <p>This shows the structure of brand data for search compatibility:</p>
          <pre style="background: #f8f9fa; padding: 0.5rem; font-size: 0.8rem; overflow-x: auto;">${JSON.stringify(sampleBrand, null, 2)}</pre>

          <h4>Required Fields for Search:</h4>
          <ul>
            <li>✅ Title/Name: ${sampleBrand?.title || sampleBrand?.name ? 'Present' : '❌ Missing'}</li>
            <li>✅ Description: ${sampleBrand?.description ? 'Present' : '❌ Missing'}</li>
            <li>✅ Sectors: ${sampleBrand?.sectors ? 'Present' : '❌ Missing'}</li>
            <li>✅ Markets: ${sampleBrand?.markets ? 'Present' : '❌ Missing'}</li>
            <li>✅ Attributes: ${sampleBrand?.attributes ? 'Present' : '❌ Missing'}</li>
            <li>✅ Signals: ${sampleBrand?.signals ? 'Present' : '❌ Missing'}</li>
          </ul>
        </div>
      `;
    }
  } catch (error) {
    html += `<p>Could not analyze brand structure: ${error.message}</p>`;
  }

  // Network timing info
  html += `
    <h2>Performance Info</h2>
    <div style="border: 1px solid #6c757d; background: #e2e3e5; padding: 1rem; margin: 0.5rem 0; border-radius: 4px;">
      <p><strong>Test completed at:</strong> ${new Date().toLocaleString()}</p>
      <p><strong>User Agent:</strong> ${navigator.userAgent}</p>
      <p><strong>Connection:</strong> ${navigator.connection?.effectiveType || 'Unknown'}</p>
    </div>
  `;

  resultsDiv.innerHTML = html;
}

// Run verification when page loads
document.addEventListener('DOMContentLoaded', verifyDataLoading);
</script>

## Manual Verification Steps

1. **Open Browser Dev Tools** (F12)
2. **Go to Network Tab**
3. **Reload this page**
4. **Look for these requests:**
   - `/assets/data/brands.json`
   - `/assets/data/founders.json`
   - `/assets/data/insights.json`
   - `/assets/data/dimensions.json`
   - `/search.json`

5. **Check Status Codes:**
   - ✅ 200 = Success
   - ❌ 404 = File not found
   - ❌ 500 = Server error

## Expected Data Structure

Your JSON files should have this structure for search compatibility:

### Brands JSON
```json
[
  {
    "id": "br-serra-verde",
    "name": { "en": "Serra Verde Organics" },
    "description": { "en": "Family-owned producer..." },
    "sectors": ["gourmet-foods"],
    "markets": ["brazil"],
    "attributes": ["founder-led", "sustainability-pioneer"],
    "signals": ["export-ready"],
    "featured": true,
    "founder_led": true
  }
]
```

### Founders JSON
```json
[
  {
    "id": "ru-alexei-sokolov",
    "name": "Alexei Sokolov",
    "generation": "first",
    "markets": ["russia"],
    "languages": ["ru", "en"],
    "cross_border_expertise": true
  }
]
```

---

*This page automatically tests data loading when you visit it.*
