---
layout: default
title: Hero Card Direct Test
permalink: /en/dev/hero-direct-test/
lang: en
ref: hero-direct-test
---

<div class="panel panel--light">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Hero Brand Card Direct Test</h2>
    <p class="panel__lead-text">Using direct HTML to verify styles are working</p>

    <div style="margin-bottom: 3rem;">
      <div class="hero-brand-card hero-brand-card--featured">
        <div class="hero-brand-card__image">
          <img src="{{ site.baseurl }}/assets/images/brands/ru-teatime/hero-storefront-800w.jpg"
               srcset="{{ site.baseurl }}/assets/images/brands/ru-teatime/hero-storefront-400w.jpg 400w,
                       {{ site.baseurl }}/assets/images/brands/ru-teatime/hero-storefront-800w.jpg 800w,
                       {{ site.baseurl }}/assets/images/brands/ru-teatime/hero-storefront-1200w.jpg 1200w"
               sizes="(max-width: 600px) 400px, (max-width: 1200px) 800px, 1200px"
               alt="Teatime storefront"
               class="hero-brand-card__img">
          
          <div class="hero-brand-card__logo">
            <img src="{{ site.baseurl }}/assets/images/brands/ru-teatime/logo-color-400w.png"
                 alt="Teatime logo"
                 class="hero-brand-card__logo-img">
          </div>
        </div>
        
        <div class="hero-brand-card__body">
          <div style="display: flex; justify-content: space-between; align-items: flex-start;">
            <div style="flex: 1;">
              <h2 class="hero-brand-card__title">Teatime</h2>
              
              <div class="hero-brand-card__meta">
                <div class="hero-brand-card__founding-year">
                  Founded 1998
                </div>
                <div class="hero-brand-card__location">
                  <span class="hero-brand-card__location-icon">📌</span>
                  Moscow, Moscow Oblast
                </div>
              </div>
              
              <p class="hero-brand-card__description">Premium artisanal tea brand combining traditional Chinese and Indian tea cultivation knowledge with distinctly Russian flavors and blending techniques.</p>
            </div>
            
            <div class="hero-brand-card__founder">
              <img src="{{ site.baseurl }}/assets/images/brands/ru-teatime/founder-portrait-400w.jpg"
                   alt="Founder of Teatime"
                   class="hero-brand-card__founder-img">
            </div>
          </div>
          
          <div class="hero-brand-card__taxonomy">
            <div class="hero-brand-card__taxonomy-section">
              <div class="hero-brand-card__sectors">
                <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/artisanal-tea/"
                   class="brand-tag brand-tag--sector">
                  Artisanal Tea
                </a>
                <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/gourmet-foods/"
                   class="brand-tag brand-tag--sector">
                  Gourmet Foods
                </a>
              </div>
            </div>
            
            <div class="hero-brand-card__taxonomy-section">
              <div class="hero-brand-card__attributes">
                <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/founder-led/"
                   class="brand-tag brand-tag--attribute">
                  Founder-Led
                </a>
                <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/heritage-brand/"
                   class="brand-tag brand-tag--attribute">
                  Heritage Brand
                </a>
              </div>
            </div>
          </div>
        </div>
        
        <div class="hero-brand-card__footer">
          <div class="hero-brand-card__signals">
            <div class="hero-brand-card__signal">
              <span class="brand-tag brand-tag--signal">
                Export Ready
              </span>
            </div>
            <div class="hero-brand-card__signal">
              <span class="brand-tag brand-tag--signal">
                Rapid Growth
              </span>
            </div>
          </div>
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/brands/teatime/" class="hero-brand-card__link btn btn--primary">
            View Profile
          </a>
        </div>
      </div>
    </div>
    
    <div style="background-color: #f5f5f5; padding: 1.5rem; border-radius: 0.5rem;">
      <h3>Verification Points</h3>
      <ul>
        <li>The hero image is using the storefront image for Teatime</li>
        <li>The image shows completely (no clipping at bottom)</li>
        <li>The logo is positioned with visible shadow</li>
        <li>The location pin is teal-colored (using var(--primary-400))</li>
        <li>The founder portrait appears on the right side of the description</li>
      </ul>
      <p>If any of these are not appearing correctly, please check the browser console for CSS loading issues.</p>
    </div>
  </div>
</div>