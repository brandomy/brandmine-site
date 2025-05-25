---
layout: default
title: JSON Migration Test Page
permalink: /en/dev/test-json-migration/
lang: en
ref: dev-test-json-migration
---

<div class="container">
  <h1>JSON Migration Test Page</h1>
  <p>This page tests all components updated during the YAML to JSON migration.</p>

  <section class="test-section">
    <h2>1. Basic Tag Components Tests</h2>

    <h3>taxonomy-tag.html (sector)</h3>
    {% include components/helpers/taxonomy-tag.html type="sector" value="wine" %}

    <h3>taxonomy-tag.html (market)</h3>
    {% include components/helpers/taxonomy-tag.html type="market" value="russia" %}

    <h3>taxonomy-tag.html (attribute)</h3>
    {% include components/helpers/taxonomy-tag.html type="attribute" value="founder-led" %}

    <h3>taxonomy-tag.html (signal)</h3>
    {% include components/helpers/taxonomy-tag.html type="signal" value="export-ready" %}

    <h3>taxonomy-tag.html (non-existent)</h3>
    {% include components/helpers/taxonomy-tag.html type="sector" value="nonexistent-tag" %}

    <h3>bem-taxonomy-tag.html</h3>
    {% include components/helpers/bem-taxonomy-tag.html type="sector" value="wine" block="test-tag" %}
    {% include components/helpers/bem-taxonomy-tag.html type="market" value="russia" block="test-tag" element="item" %}
  </section>

  <section class="test-section">
    <h2>2. Dimension Lists and Clouds</h2>

    <h3>dimension-cloud.html</h3>
    {% include components/dimensions/dimension-cloud.html %}

    <h3>dimension-list.html</h3>
    {% assign test_dimensions = "" | split: "" %}
    {% assign dimension1 = "{'dimension': 'wine', 'category': 'sector', 'lang': 'en', 'title': 'Wine'}" | replace: "'", '"' | json_parse %}
    {% assign dimension2 = "{'dimension': 'russia', 'category': 'market', 'lang': 'en', 'title': 'Russia'}" | replace: "'", '"' | json_parse %}
    {% assign test_dimensions = test_dimensions | push: dimension1 | push: dimension2 %}
    {% include components/dimensions/dimension-list.html dimensions=test_dimensions %}
  </section>

  <section class="test-section">
    <h2>3. Tag Lists</h2>

    <h3>brands/tag-list.html</h3>
    {% include components/brands/tag-list.html tags="wine,artisanal-spirits" dimension_type="sectors" heading="Test Sectors" lang="en" %}

    <h3>brands/tag-list.html (with missing tag)</h3>
    {% include components/brands/tag-list.html tags="wine,nonexistent-tag" dimension_type="sectors" heading="Test with Missing" lang="en" %}
  </section>

  <section class="test-section">
    <h2>4. Complex Components</h2>

    <h3>discovery-dimensions-grid.html</h3>
    {% include components/dimensions/discovery-dimensions-grid.html limit=2 %}

    <h3>market-sector-highlight.html</h3>
    {% include components/dimensions/market-sector-highlight.html market="russia" sector="wine" %}
  </section>
</div>

<style>
  .test-section {
    margin-bottom: 40px;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f9f9f9;
  }
  h2 {
    margin-top: 0;
  }
  h3 {
    margin-top: 30px;
    padding-top: 10px;
    border-top: 1px dashed #ccc;
  }
</style>
