---
layout: default
title: Simple Image Test
permalink: /en/dev/simple-test/
lang: en
ref: simple-test
---

<div style="padding: 2rem; max-width: 800px; margin: 0 auto; background: #f5f5f5; border-radius: 8px;">
  <h1>Super Simple Image Test</h1>

  <div style="margin: 2rem 0;">
    <h3>Test 1: Simple fixed image with absolute path</h3>
    <p>Path: /assets/images/brands/ru-taiga-spirits/hero-distillery-800w.jpg</p>
    <img src="/assets/images/brands/ru-taiga-spirits/hero-distillery-800w.jpg" alt="Test" style="max-width: 100%; height: auto; border: 2px solid red;">
  </div>

  <div style="margin: 2rem 0;">
    <h3>Test 2: Using exact same URL that worked before</h3>
    <p>Path: http://127.0.0.1:4000/assets/images/brands/ru-taiga-spirits/hero-distillery-800w.jpg</p>
    <img src="http://127.0.0.1:4000/assets/images/brands/ru-taiga-spirits/hero-distillery-800w.jpg" alt="Test" style="max-width: 100%; height: auto; border: 2px solid blue;">
  </div>

  <div style="margin: 2rem 0;">
    <h3>Test 3: Using CSS background-image</h3>
    <p>background-image: url('/assets/images/brands/ru-taiga-spirits/hero-distillery-800w.jpg')</p>
    <div style="width: 100%; height: 300px; background-image: url('/assets/images/brands/ru-taiga-spirits/hero-distillery-800w.jpg'); background-size: cover; background-position: center; border: 2px solid green;"></div>
  </div>

  <div style="margin: 2rem 0;">
    <h3>Test 4: Try with logo instead</h3>
    <p>Path: /assets/images/brands/ru-taiga-spirits/logo-color-400w.png</p>
    <img src="/assets/images/brands/ru-taiga-spirits/logo-color-400w.png" alt="Logo Test" style="max-width: 100px; height: auto; border: 2px solid purple;">
  </div>

  <div style="margin: 2rem 0;">
    <h3>Debug Info</h3>
    <ul>
      <li>Page URL: {{ page.url }}</li>
      <li>Site Baseurl: {{ site.baseurl }}</li>
      <li>Current time: {% if site.time %}{{ site.time | date_to_rfc822 }}{% else %}Not available{% endif %}</li>
    </ul>

    <p style="font-weight: bold; margin-top: 1rem;">Please check browser console (F12) for any 404 errors</p>
  </div>
</div>
