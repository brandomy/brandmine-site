---
layout: default
title: Dimensions Grid Test
permalink: /en/dev/dimensions-grid-test/
lang: en
ref: dimensions-grid-test
---

<style>
  /* Debug styles */
  .debug-info {
    margin: 20px 0;
    padding: 15px;
    background-color: #f5f5f5;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-family: monospace;
    font-size: 12px;
  }

  .debug-box {
    outline: 2px dashed #999;
    margin-bottom: 40px;
    padding: 20px 0;
  }

  .debug-box-blue {
    outline-color: blue;
  }

  .debug-box-green {
    outline-color: green;
  }

  .debug-box-red {
    outline-color: red;
  }

  /* Panel test styles */
  .test-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
  }

  .test-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
  }

  .panel-override {
    width: 100% !important;
    margin: 0 !important;
    position: static !important;
    left: auto !important;
    right: auto !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
  }

  /* For test 2 */
  .discovery-page-test .discovery-dimensions {
    margin: var(--space-8) auto;
    max-width: 1200px;
    padding: 0 var(--space-4);
  }

  .discovery-page-test .panel {
    width: 100% !important;
    margin: 0 !important;
    position: static !important;
    left: auto !important;
    right: auto !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
  }
</style>

<div class="debug-info">
  <h3>Debug Information</h3>
  <p>Current page: {{ page.title }}</p>
  <p>Layout: {{ page.layout }}</p>
  <p>Classes on body: <span id="body-classes"></span></p>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      document.getElementById('body-classes').textContent = document.body.className;
    });
  </script>
</div>

<h1>Test 1: Standard Include</h1>
<p>This is the normal include with no modifications:</p>

<div class="debug-box debug-box-blue">
  {% include pages/discovery/dimensions-grid.html %}
</div>

<h1>Test 2: With discovery-page-test Class</h1>
<p>Testing with forced discovery-page-test class:</p>

<div class="discovery-page-test debug-box debug-box-green">
  {% include pages/discovery/dimensions-grid.html %}
</div>

<h1>Test 3: Panel Override Test</h1>
<p>Testing with panels that have inline style overrides:</p>

<div class="debug-box debug-box-red">
  <div class="test-container">
    <div class="test-grid">
      {% assign current_lang = page.lang | default: 'en' %}
      {% assign t = site.data.translations[current_lang] %}

      <!-- Sectors Panel -->
      <div class="panel panel--olive-soft panel-override">
        <div class="panel__content">
          <h2>
            <span style="display: inline-flex; width: 32px; height: 32px; background-color: var(--olive-100); color: var(--olive-700); border-radius: 50%; align-items: center; justify-content: center; margin-right: 8px;">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
              </svg>
            </span>
            {{ t.nav.sectors | default: "Sectors" }}
          </h2>
          <p>{{ t.discovery.sectors_description | default: "Explore leading brands from top sectors in the BRICS+" }}</p>
        </div>
      </div>

      <!-- Markets Panel -->
      <div class="panel panel--sky-soft panel-override">
        <div class="panel__content">
          <h2>
            <span style="display: inline-flex; width: 32px; height: 32px; background-color: var(--sky-100); color: var(--sky-700); border-radius: 50%; align-items: center; justify-content: center; margin-right: 8px;">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="12" cy="12" r="10"></circle>
                <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
              </svg>
            </span>
            {{ t.nav.markets | default: "Markets" }}
          </h2>
          <p>{{ t.discovery.markets_description | default: "Explore brands from growing BRICS+ regions" }}</p>
        </div>
      </div>
    </div>
  </div>
</div>

<h1>Test 4: Panel Behavior Analysis</h1>
<p>This test analyzes the default panel behavior:</p>

<div class="debug-box">
  <div class="panel" style="background-color: #f0f0f0;">
    <div class="panel__content">
      <h2>Standard Panel</h2>
      <p>This is a standard panel with no overrides.</p>
      <div style="margin-top: 10px; font-family: monospace; font-size: 12px; background: #eee; padding: 10px;">
        <p id="panel-metrics"></p>
      </div>
    </div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const panel = document.querySelector('.panel');
      const metrics = document.getElementById('panel-metrics');
      const computedStyle = window.getComputedStyle(panel);

      metrics.innerHTML = `
        Panel width: ${panel.offsetWidth}px<br>
        Panel position: ${computedStyle.position}<br>
        Panel left: ${computedStyle.left}<br>
        Panel right: ${computedStyle.right}<br>
        Panel margin-left: ${computedStyle.marginLeft}<br>
        Panel margin-right: ${computedStyle.marginRight}<br>
        Body width: ${document.body.offsetWidth}px<br>
        Viewport width: ${window.innerWidth}px
      `;
    });
  </script>
</div>

<h1>Test 5: CSS Solution Test</h1>
<p>Testing with an applied CSS fix:</p>

<style>
/* Fix for dimensions grid */
.dimensions-grid-fix {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.dimensions-grid-fix .discovery-dimensions {
  margin: var(--space-8) 0;
}

.dimensions-grid-fix .discovery-dimensions__grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--space-6);
}

.dimensions-grid-fix .panel {
  width: 100% !important;
  margin: 0 !important;
  position: static !important;
  left: auto !important;
  right: auto !important;
  margin-left: 0 !important;
  margin-right: 0 !important;
}

/* Ensure proper spacing within panels */
.dimensions-grid-fix .panel__content {
  padding: var(--space-6);
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .dimensions-grid-fix .discovery-dimensions__grid {
    grid-template-columns: 1fr;
    gap: var(--space-4);
  }
}
</style>

<div class="dimensions-grid-fix debug-box">
  {% include pages/discovery/dimensions-grid.html %}
</div>
