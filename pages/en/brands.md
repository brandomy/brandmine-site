---
layout: default
title: Brands
permalink: /en/brands/
lang: en
ref: brands
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary brands__title">Explore Founder-Led BRICS+ Consumer Brands</h1>
    <p class="panel__subtitle">Breaking Through Barriers to Find Your Next Opportunity</p>
  </div>
</div>

<!-- Introduction Panel - Keep as light -->
<div class="panel panel--light brands-panel">
  <div class="panel__content">
    <p class="panel__lead-text">Brandmine offers unprecedented access to consumer brands that have proven their success in BRICS+ markets but remain undiscovered internationally due to language, political, and cultural barriers.</p>
  </div>
</div>


<!-- Search Panel - Changed to sky-soft to match markets dimension (geographic focus) -->
<div class="panel panel--sky-soft brands-panel">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Search Our Brand Database</h2>
    <p class="panel__lead-text">Looking for specific brands? Use our search to find exactly what you need.</p>
    
    <div class="brands__search-container">
      <form action="{{ site.baseurl }}/{{ page.lang }}/search/" method="get" class="brands__search-form">
        <input type="text" name="q" class="brands__search-input" placeholder="{{ site.data.translations[page.lang].search.placeholder }}" aria-label="Search brands">
        <button type="submit" class="brands__search-button">
          <i class="fas fa-search"></i>
          {{ site.data.translations[page.lang].search.button }}
        </button>
      </form>
    </div>
    
    <div class="brands__search-suggestions">
      <p class="brands__search-suggestions-title">{{ site.data.translations[page.lang].search.popular_searches }}</p>
      <div class="brands__search-tags">
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=wine" class="brands__search-tag">Wine</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=beauty" class="brands__search-tag">Beauty</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=founder" class="brands__search-tag">Founder-led</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=moscow" class="brands__search-tag">Moscow</a>
      </div>
    </div>
  </div>
</div>


<!-- Brand Profiles Panel - Changed to olive-soft to match sectors dimension -->
<div class="panel panel--olive-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Rich Brand Profiles</h2>
    <p class="panel__lead-text">Our curated brand profiles go beyond basic company information to reveal:</p>
    
    <div class="brands__features-list">
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><line x1="10" y1="9" x2="8" y2="9"></line></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Founding Stories</h3>
          <p class="brands__feature-text">The vision and journey behind each brand</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="4"></circle><line x1="21.17" y1="8" x2="12" y2="8"></line><line x1="3.95" y1="6.06" x2="8.54" y2="14"></line><line x1="10.88" y1="21.94" x2="15.46" y2="14"></line></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Visual Identity</h3>
          <p class="brands__feature-text">Brand assets, packaging, and product imagery</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="20" x2="12" y2="10"></line><line x1="18" y1="20" x2="18" y2="4"></line><line x1="6" y1="20" x2="6" y2="16"></line><rect x="2" y="20" width="20" height="2" rx="1"></rect></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Market Position</h3>
          <p class="brands__feature-text">Competitive landscape and consumer relationships</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Key People</h3>
          <p class="brands__feature-text">Leadership and decision-makers</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Growth Trajectory</h3>
          <p class="brands__feature-text">Historical milestones and future direction</p>
        </div>
      </div>

      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Market Presence</h3>
          <p class="brands__feature-text">Location intelligence and retail footprint</p>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Featured Brands Panel - Keep as light -->
<div class="panel panel--light">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Featured Brands</h2>
    
    <div class="brands__grid">
      <!-- This will be populated dynamically in the future -->
      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">Brand Name</h3>
        <p>Short description of the brand goes here, highlighting its unique selling points and origin.</p>
        <div class="brands__meta">
          <span class="brands__tag--country">Russia</span>
          <span class="brands__tag--sector">Artisanal Food</span>
        </div>
      </div>
      
      <!-- Add 2 more placeholder cards -->
      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">Brand Name</h3>
        <p>Short description of the brand goes here, highlighting its unique selling points and origin.</p>
        <div class="brands__meta">
          <span class="brands__tag--country">Brazil</span>
          <span class="brands__tag--sector">Natural Beauty</span>
        </div>
      </div>
      
      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">Brand Name</h3>
        <p>Short description of the brand goes here, highlighting its unique selling points and origin.</p>
        <div class="brands__meta">
          <span class="brands__tag--country">India</span>
          <span class="brands__tag--sector">Fashion</span>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Find Your Partner Panel - Keep as accent-soft for signals dimension -->
<div class="panel panel--accent-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Find Your Next Partner</h2>
    <p class="panel__lead-text">Use our advanced search and filtering tools to discover brands by:</p>
    
    <div class="brands__filters">
      <div class="brands__filter">Market of origin</div>
      <div class="brands__filter">Sector</div>
      <div class="brands__filter">Signals</div>
      <div class="brands__filter">Attributes</div>
    </div>
    
    <div class="brands__cta">
      <button id="database-button" class="btn btn--primary-cta" onclick="trackButtonClick(this)">Launch Interactive Database</button>
      <div id="button-feedback" class="brands__feedback" style="display: none; margin-top: var(--space-2); color: var(--primary-600);">
        Coming soon! We're working on this feature.
      </div>
    </div>
  </div>
</div>

<!-- Contact CTA Panel - Keep as cta -->
<div class="panel panel--cta">
  <div class="panel__content panel--centered">
    <h2 class="panel__heading-secondary">Ready to Discover BRICS+ Brands?</h2>
    <p class="panel__lead-text">Contact us to learn more about our featured brands or to discuss your specific needs.</p>
    <div class="cta-buttons">
      <a href="{{ site.baseurl }}/{{ page.lang }}/about/#contact" class="btn btn--secondary-cta">Get in Touch</a>
    </div>
  </div>
</div>

<script>
  function trackButtonClick(button) {
    console.log('Database button clicked');
    
    // Show feedback message
    const feedback = document.getElementById('button-feedback');
    feedback.style.display = 'block';
    
    // Hide the message after 10 seconds
    setTimeout(() => {
      feedback.style.display = 'none';
    }, 10000);
  }
</script>