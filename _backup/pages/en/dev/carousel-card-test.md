---
layout: default
title: "Carousel Card Test"
permalink: /en/dev/carousel-card-test/
ref: carousel-card-test
lang: en
exclude_from_sitemap: true  # Prevents search engine indexing
robots: noindex, nofollow   # Additional SEO protection
---

<link rel="stylesheet" href="{{ '/assets/css/components/case-studies-carousel.css' | relative_url }}">


<div class="test-container">
        <div class="phase-label">Carousel Card Test: Final Version with Metric Badges</div>
        <h1>Case Studies Carousel - Production Ready</h1>

        <!-- TOP SECTION: Image-based Cards -->
        <h2>Version A: Hero Images with Metrics</h2>
        <div class="carousel" data-component-type="case-studies">
            {% for case_study in site.data.case_studies.en %}
            <div class="test-card">
                <div class="test-card-image">
                    <img src="/assets/images/case-studies/{{ case_study.ref }}/{{ case_study.ref }}-hero-{{ case_study.images.hero.name }}-400w.jpg"
                         srcset="/assets/images/case-studies/{{ case_study.ref }}/{{ case_study.ref }}-hero-{{ case_study.images.hero.name }}-400w.jpg 400w,
                                 /assets/images/case-studies/{{ case_study.ref }}/{{ case_study.ref }}-hero-{{ case_study.images.hero.name }}-800w.jpg 800w"
                         sizes="(max-width: 768px) 100vw, 50vw"
                         alt="{{ case_study.images.hero.alt }}"
                         title="{{ case_study.images.hero.alt }}"
                         loading="lazy"
                         class="test-card-hero-img">
                    <!-- Two-line Metric Badge -->
                    {% if case_study.metrics and case_study.metrics.size > 0 %}
                        <div class="test-card-metric-badge">
                            <div class="metric-value">{{ case_study.metrics[0].value }}</div>
                            <div class="metric-label">{{ case_study.metrics[0].label }}</div>
                        </div>
                    {% endif %}
                </div>
                <div class="test-card-content">
                    <h3 class="test-card-title">{{ case_study.title | split: ':' | first }}</h3>
                    <p class="test-card-subtitle">{{ case_study.title | split: ':' | last | strip }}</p>
                    <div class="test-card-meta">
                        {% if case_study.markets %}
                            {% for market in case_study.markets %}
                                <a href="/{{ page.lang }}/discover/markets/{{ market }}/" class="test-card-market">{{ market | capitalize }}</a>
                            {% endfor %}
                        {% endif %}
                        {% if case_study.sectors %}
                            {% for sector in case_study.sectors %}
                                <a href="/{{ page.lang }}/discover/sectors/{{ sector }}/" class="test-card-sector">{{ sector | replace: '-', ' ' | capitalize }}</a>
                            {% endfor %}
                        {% endif %}
                        {% if case_study.attributes %}
                            {% for attribute in case_study.attributes %}
                                <a href="/{{ page.lang }}/discover/attributes/{{ attribute }}/" class="test-card-attribute">{{ attribute | replace: '-', ' ' | capitalize }}</a>
                            {% endfor %}
                        {% endif %}
                        {% if case_study.signals %}
                            {% for signal in case_study.signals %}
                                <a href="/{{ page.lang }}/discover/signals/{{ signal }}/" class="test-card-signal">{{ signal | replace: '-', ' ' | capitalize }}</a>
                            {% endfor %}
                        {% endif %}
                    </div>
                    <!-- CTA Button -->
                    <div class="test-card-cta">
                        <a href="{{ case_study.permalink }}" class="test-card-button">
                            Read Full Story →
                        </a>
                    </div>
                </div>
            </div>
            {% endfor %}
        </div>

        <!-- Navigation Dots for Image Carousel -->
        <div class="carousel-nav" data-carousel-id="images"></div>

        <!-- Divider -->
        <div class="test-divider"></div>

        <!-- SINGLE CARD EXAMPLES -->
        <h2>Single Card Examples</h2>

        <div style="display: flex; gap: var(--space-6); margin: var(--space-6) 0; flex-wrap: wrap;">
            <!-- Single Card with Image -->
            <div class="test-card" style="flex: 0 0 calc(50% - var(--space-3)); max-width: 400px;">
                <div class="test-card-image">
                    <img src="/assets/images/case-studies/ru-abrau-durso/ru-abrau-durso-hero-vineyard-400w.jpg"
                         srcset="/assets/images/case-studies/ru-abrau-durso/ru-abrau-durso-hero-vineyard-400w.jpg 400w,
                                 /assets/images/case-studies/ru-abrau-durso/ru-abrau-durso-hero-vineyard-800w.jpg 800w"
                         sizes="(max-width: 768px) 100vw, 50vw"
                         alt="Abrau-Durso vineyard landscape"
                         title="Abrau-Durso vineyard landscape"
                         loading="lazy"
                         class="test-card-hero-img">
                    <!-- Static Two-line Metric Badge -->
                    <div class="test-card-metric-badge">
                        <div class="metric-value">150+</div>
                        <div class="metric-label">Years Heritage</div>
                    </div>
                </div>
                <div class="test-card-content">
                    <h3 class="test-card-title">Abrau-Durso</h3>
                    <p class="test-card-subtitle">Premium Russian sparkling wine with 150-year heritage</p>
                    <div class="test-card-meta">
                        <a href="/{{ page.lang }}/discover/markets/russia/" class="test-card-market">Russia</a>
                        <a href="/{{ page.lang }}/discover/sectors/wine/" class="test-card-sector">Wine</a>
                        <a href="/{{ page.lang }}/discover/attributes/heritage-brand/" class="test-card-attribute">Heritage brand</a>
                        <a href="/{{ page.lang }}/discover/signals/export-ready/" class="test-card-signal">Export ready</a>
                    </div>
                    <!-- CTA Button -->
                    <div class="test-card-cta">
                        <a href="/en/case-studies/abrau-durso/" class="test-card-button">
                            Read Full Story →
                        </a>
                    </div>
                </div>
            </div>

            <!-- Single Card with Gradient -->
            <div class="test-card" style="flex: 0 0 calc(50% - var(--space-3)); max-width: 400px;">
                <div class="test-card-gradient">
                    <div class="test-card-gradient-text">Abrau-Durso</div>
                    <!-- Static Two-line Metric Badge -->
                    <div class="test-card-metric-badge">
                        <div class="metric-value">150+</div>
                        <div class="metric-label">Years Heritage</div>
                    </div>
                </div>
                <div class="test-card-content">
                    <h3 class="test-card-title">Abrau-Durso</h3>
                    <p class="test-card-subtitle">Premium Russian sparkling wine with 150-year heritage</p>
                    <div class="test-card-meta">
                        <a href="/{{ page.lang }}/discover/markets/russia/" class="test-card-market">Russia</a>
                        <a href="/{{ page.lang }}/discover/sectors/wine/" class="test-card-sector">Wine</a>
                        <a href="/{{ page.lang }}/discover/attributes/heritage-brand/" class="test-card-attribute">Heritage brand</a>
                        <a href="/{{ page.lang }}/discover/signals/export-ready/" class="test-card-signal">Export ready</a>
                    </div>
                    <!-- CTA Button -->
                    <div class="test-card-cta">
                        <a href="/en/case-studies/abrau-durso/" class="test-card-button">
                            Read Full Story →
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Divider -->
        <div class="test-divider"></div>

        <!-- BOTTOM SECTION: Gradient-based Cards -->
        <h2>Version B: Teal Gradients with Metrics</h2>
        <div class="carousel" data-component-type="case-studies" data-carousel-id="gradients">
            {% for case_study in site.data.case_studies.en %}
            <div class="test-card">
                <div class="test-card-gradient">
                    <div class="test-card-gradient-text">{{ case_study.title | split: ':' | first }}</div>
                    <!-- Two-line Metric Badge for Gradient Cards -->
                    {% if case_study.metrics and case_study.metrics.size > 0 %}
                        <div class="test-card-metric-badge">
                            <div class="metric-value">{{ case_study.metrics[0].value }}</div>
                            <div class="metric-label">{{ case_study.metrics[0].label }}</div>
                        </div>
                    {% endif %}
                </div>
                <div class="test-card-content">
                    <h3 class="test-card-title">{{ case_study.title | split: ':' | first }}</h3>
                    <p class="test-card-subtitle">{{ case_study.title | split: ':' | last | strip }}</p>
                    <div class="test-card-meta">
                        {% if case_study.markets %}
                            {% for market in case_study.markets %}
                                <a href="/{{ page.lang }}/discover/markets/{{ market }}/" class="test-card-market">{{ market | capitalize }}</a>
                            {% endfor %}
                        {% endif %}
                        {% if case_study.sectors %}
                            {% for sector in case_study.sectors %}
                                <a href="/{{ page.lang }}/discover/sectors/{{ sector }}/" class="test-card-sector">{{ sector | replace: '-', ' ' | capitalize }}</a>
                            {% endfor %}
                        {% endif %}
                        {% if case_study.attributes %}
                            {% for attribute in case_study.attributes %}
                                <a href="/{{ page.lang }}/discover/attributes/{{ attribute }}/" class="test-card-attribute">{{ attribute | replace: '-', ' ' | capitalize }}</a>
                            {% endfor %}
                        {% endif %}
                        {% if case_study.signals %}
                            {% for signal in case_study.signals %}
                                <a href="/{{ page.lang }}/discover/signals/{{ signal }}/" class="test-card-signal">{{ signal | replace: '-', ' ' | capitalize }}</a>
                            {% endfor %}
                        {% endif %}
                    </div>
                    <!-- CTA Button -->
                    <div class="test-card-cta">
                        <a href="{{ case_study.permalink }}" class="test-card-button">
                            Read Full Story →
                        </a>
                    </div>
                </div>
            </div>
            {% endfor %}
        </div>

        <!-- Navigation Dots for Gradient Carousel -->
        <div class="carousel-nav" data-carousel-id="gradients"></div>

        <!-- Test Results -->
        <div style="margin-top: var(--space-8); padding: var(--space-4); background: var(--neutral-100); border-radius: var(--radius-md);">
            <h3>Production Ready Features:</h3>
            <ul>
                <li><strong>✅ Hero Images:</strong> Large 250px artistic images with brand celebration</li>
                <li><strong>✅ Metric Badges:</strong> Two-line credibility indicators (value + label)</li>
                <li><strong>✅ Dimension Tags:</strong> Complete Brandmine taxonomy with brand colors</li>
                <li><strong>✅ CTA Buttons:</strong> Clear "Read Full Story" conversion actions</li>
                <li><strong>✅ Responsive Design:</strong> 500px desktop, 380px mobile with smooth scaling</li>
                <li><strong>✅ Fresh Aesthetic:</strong> Non-traditional, colorful, brand-celebrating approach</li>
                <li><strong>✅ Performance:</strong> Optimized images with lazy loading and responsive srcsets</li>
            </ul>
        </div>
    </div>

<script src="/assets/js/components/case-studies-carousel.js"></script>
