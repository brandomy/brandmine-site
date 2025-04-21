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
    <h1 class="panel__heading-primary brands__title">Discover Leading BRICS+ Consumer Brands</h1>
    <p class="panel__subtitle">Breaking Through Barriers to Find Your Next Opportunity</p>
  </div>
</div>

<!-- Introduction Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <p class="panel__lead-text">Brandmine offers unprecedented access to consumer brands that have proven their success in BRICS+ markets but remain undiscovered internationally due to language, political, and cultural barriers.</p>
  </div>
</div>


<!-- Search Panel - NEW -->
<div class="panel panel--primary-soft">
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


<!-- Brand Profiles Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Rich Brand Profiles</h2>
    <p class="panel__lead-text">Our curated brand profiles go beyond basic company information to reveal:</p>
    
    <div class="brands__features-list">
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 3a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3 3 3 0 0 0 3-3 3 3 0 0 0-3-3H6a3 3 0 0 0-3 3 3 3 0 0 0 3 3 3 3 0 0 0 3-3V6a3 3 0 0 0-3-3 3 3 0 0 0-3 3 3 3 0 0 0 3 3h12a3 3 0 0 0 3-3 3 3 0 0 0-3-3z"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Founding Stories</h3>
          <p class="brands__feature-text">The vision and journey behind each brand</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 3h7a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-7m0-18H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h7m0-18v18"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">Visual Identity</h3>
          <p class="brands__feature-text">Brand assets, packaging, and product imagery</p>
        </div>
      </div>
      
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M16 12l-4 4-4-4M12 8v7"></path></svg>
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
    </div>
  </div>
</div>


<!-- Featured Brands Panel -->
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

<!-- Find Your Partner Panel -->
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

<!-- Contact CTA Panel -->
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