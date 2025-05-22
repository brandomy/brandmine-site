---
layout: default
title: Discovery Dimensions Test
permalink: /en/dev/discovery-dimensions-test/
lang: en
ref: discovery-dimensions-test
---

<div class="panel panel--light">
  <div class="panel__content">
    <h1 class="panel__heading-primary">Discovery Dimensions Component Test</h1>
    <p class="panel__lead-text">This page isolates the discovery dimensions component for testing and debugging.</p>
  </div>
</div>

<!-- Test 1: Standard Include -->
<div class="panel panel--light">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Test 1: Standard Include</h2>
    <p>This is the discovery dimensions component as it appears on the homepage:</p>

    {% include pages/home/discovery-dimensions.html %}
  </div>
</div>

<!-- Test 2: Direct SVG Test -->
<div class="panel panel--light">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Test 2: Direct SVG Test</h2>
    <p>Testing SVG icons directly without the icon component:</p>

    <div class="discovery-dimensions-grid discovery-dimensions-grid--columns-4">
      <!-- Sectors (direct SVG) -->
      <div class="discovery-dimension discovery-dimension--sectors">
        <div class="discovery-dimension__header">
          <div class="discovery-dimension__icon discovery-dimension__icon--direct-test">
            {% include components/icons/sector-default.svg %}
          </div>
          <h3 class="discovery-dimension__title">Sectors (Direct SVG)</h3>
        </div>
        <p class="discovery-dimension__description">Testing direct SVG inclusion.</p>
      </div>

      <!-- Markets (direct SVG) -->
      <div class="discovery-dimension discovery-dimension--markets">
        <div class="discovery-dimension__header">
          <div class="discovery-dimension__icon discovery-dimension__icon--direct-test">
            {% include components/icons/market-default.svg %}
          </div>
          <h3 class="discovery-dimension__title">Markets (Direct SVG)</h3>
        </div>
        <p class="discovery-dimension__description">Testing direct SVG inclusion.</p>
      </div>

      <!-- Attributes (direct SVG) -->
      <div class="discovery-dimension discovery-dimension--attributes">
        <div class="discovery-dimension__header">
          <div class="discovery-dimension__icon discovery-dimension__icon--direct-test">
            {% include components/icons/attribute-default.svg %}
          </div>
          <h3 class="discovery-dimension__title">Attributes (Direct SVG)</h3>
        </div>
        <p class="discovery-dimension__description">Testing direct SVG inclusion.</p>
      </div>

      <!-- Signals (direct SVG) -->
      <div class="discovery-dimension discovery-dimension--signals">
        <div class="discovery-dimension__header">
          <div class="discovery-dimension__icon discovery-dimension__icon--direct-test">
            {% include components/icons/signal-default.svg %}
          </div>
          <h3 class="discovery-dimension__title">Signals (Direct SVG)</h3>
        </div>
        <p class="discovery-dimension__description">Testing direct SVG inclusion.</p>
      </div>
    </div>
  </div>
</div>

<!-- Test 3: Modified Icon Component -->
<div class="panel panel--light">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Test 3: Modified Icon Component</h2>
    <p>Testing with additional class to bypass unified styling:</p>

    <div class="discovery-dimensions-grid discovery-dimensions-grid--columns-4">
      <!-- Sectors (Modified) -->
      <div class="discovery-dimension discovery-dimension--sectors">
        <div class="discovery-dimension__header">
          <div class="discovery-dimension__icon discovery-dimension__icon--isolated">
            {% include components/icons/icon.html system="dimensions" type="sectors" name="default" class="icon--discovery-test" %}
          </div>
          <h3 class="discovery-dimension__title">Sectors (Modified)</h3>
        </div>
        <p class="discovery-dimension__description">Testing with modified class.</p>
      </div>

      <!-- Markets (Modified) -->
      <div class="discovery-dimension discovery-dimension--markets">
        <div class="discovery-dimension__header">
          <div class="discovery-dimension__icon discovery-dimension__icon--isolated">
            {% include components/icons/icon.html system="dimensions" type="markets" name="default" class="icon--discovery-test" %}
          </div>
          <h3 class="discovery-dimension__title">Markets (Modified)</h3>
        </div>
        <p class="discovery-dimension__description">Testing with modified class.</p>
      </div>

      <!-- Attributes (Modified) -->
      <div class="discovery-dimension discovery-dimension--attributes">
        <div class="discovery-dimension__header">
          <div class="discovery-dimension__icon discovery-dimension__icon--isolated">
            {% include components/icons/icon.html system="dimensions" type="attributes" name="default" class="icon--discovery-test" %}
          </div>
          <h3 class="discovery-dimension__title">Attributes (Modified)</h3>
        </div>
        <p class="discovery-dimension__description">Testing with modified class.</p>
      </div>

      <!-- Signals (Modified) -->
      <div class="discovery-dimension discovery-dimension--signals">
        <div class="discovery-dimension__header">
          <div class="discovery-dimension__icon discovery-dimension__icon--isolated">
            {% include components/icons/icon.html system="dimensions" type="signals" name="default" class="icon--discovery-test" %}
          </div>
          <h3 class="discovery-dimension__title">Signals (Modified)</h3>
        </div>
        <p class="discovery-dimension__description">Testing with modified class.</p>
      </div>
    </div>
  </div>
</div>

<style>
  /* Inline CSS for test cases */
  .discovery-dimension__icon--direct-test {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 48px;
    height: 48px;
    border-radius: 50%;
    margin-right: var(--space-3);
  }

  .discovery-dimension--sectors .discovery-dimension__icon--direct-test {
    background-color: var(--olive-100);
  }

  .discovery-dimension--markets .discovery-dimension__icon--direct-test {
    background-color: var(--sky-100);
  }

  .discovery-dimension--attributes .discovery-dimension__icon--direct-test {
    background-color: var(--secondary-100);
  }

  .discovery-dimension--signals .discovery-dimension__icon--direct-test {
    background-color: var(--accent-100);
  }

  .discovery-dimension__icon--direct-test svg {
    width: 24px;
    height: 24px;
    stroke: currentColor;
    fill: none;
  }

  .discovery-dimension--sectors .discovery-dimension__icon--direct-test svg {
    stroke: var(--olive-700);
  }

  .discovery-dimension--markets .discovery-dimension__icon--direct-test svg {
    stroke: var(--sky-700);
  }

  .discovery-dimension--attributes .discovery-dimension__icon--direct-test svg {
    stroke: var(--secondary-700);
  }

  .discovery-dimension--signals .discovery-dimension__icon--direct-test svg {
    stroke: var(--accent-700);
  }

  /* Special case for Test 3 */
  .icon--discovery-test {
    background: transparent !important;
  }

  .icon--discovery-test svg {
    width: 24px !important;
    height: 24px !important;
    stroke-width: 2 !important;
    fill: none !important;
  }

  .discovery-dimension--sectors .icon--discovery-test svg {
    stroke: var(--olive-700) !important;
  }

  .discovery-dimension--markets .icon--discovery-test svg {
    stroke: var(--sky-700) !important;
  }

  .discovery-dimension--attributes .icon--discovery-test svg {
    stroke: var(--secondary-700) !important;
  }

  .discovery-dimension--signals .icon--discovery-test svg {
    stroke: var(--accent-700) !important;
  }
</style>

<div class="panel panel--primary">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Developer Notes</h2>
    <p>Based on the test results above, here are some observations:</p>

    <ul id="test-observations">
      <li>Test 1 shows how the component renders with current implementation</li>
      <li>Test 2 bypasses the icon component to test if direct SVG inclusion works better</li>
      <li>Test 3 adds a special class to see if we can target and override the icon component styling</li>
    </ul>

    <p><strong>Recommendation:</strong> If Test 2 (direct SVG) looks better than Test 1, the issue is in how the icon.html component applies styling. If Test 3 looks good, we can add the special class to fix without changing the component.</p>
  </div>
</div>
