---
layout: default
title: Home
ref:
permalink: 
lang: 
---

<!-- Hero Panel with BEM classes -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary">Discover BRICS+ Consumer Brands</h1>
    <p class="panel__subtitle">The business intelligence hub breaking through language, political, and cultural barriers</p>
  </div>
</div>

<div class="container">
  <!-- Top split section -->
  <div class="top-section">
    <!-- Left side: Search tools -->
    <div class="search-panel">
      <h2>Find Brands</h2>
      
      <div class="search-box">
        <input type="text" id="brand-search" placeholder="Search brands, markets, sectors, or attributes...">
        <button type="button" class="search-button">Search</button>
      </div>
      
      <div class="filter-controls">
        <p class="filter-heading">Filter by:</p>
        
        <!-- Markets dropdown -->
        <div class="filter-group">
        <label for="market-filter">Markets</label>
        <select id="market-filter" class="filter-select">
            <option value="">All Markets</option>
            <option value="russia">Russia</option>
            <option value="brazil">Brazil</option>
            <option value="china">China</option>
            <option value="egypt">Egypt</option>
            <option value="ethiopia">Ethiopia</option>
            <option value="india">India</option>
            <option value="indonesia">Indonesia</option>
            <option value="iran">Iran</option>
            <option value="south-africa">South Africa</option>
            <option value="uae">UAE</option>
        </select>
    </div>

        <!-- Business Sectors dropdown -->
        <div class="filter-group">
          <label for="sector-filter">Business Sectors</label>
          <select id="sector-filter" class="filter-select">
              <option value="">All Sectors</option>
              <option value="artisanal-spirits">Artisanal Spirits & Vodka</option>
              <option value="confectionery">Artisan Confectionery</option>
              <option value="porcelain-ceramics">Artisan Porcelain and Ceramics</option>
              <option value="cured-meats">Salami and Cured Meats</option>
              <option value="fashion-accessories">Fashion & Accessories</option>
              <option value="fermented-dairy">Fermented Dairy (Kefir)</option>
              <option value="gourmet-foods">Gourmet Foods</option>
              <option value="halal-food">Halal Food Products</option>
              <option value="honey-bee">Honey and Bee Products</option>
              <option value="hotels-resorts">Hotels & Resorts</option>
              <option value="jewelry-watches">Jewelry & Watches</option>
              <option value="mineral-waters">Mineral Waters</option>
              <option value="natural-beauty">Natural Beauty Products</option>
              <option value="natural-food-supplements">Natural Food Supplements</option>
              <option value="specialty-cheese">Specialty Cheeses</option>
              <option value="wine">Wine</option>
          </select>
      </div>
    
        <!-- Brand Attributes dropdown -->
        <div class="filter-group">
          <label for="attribute-filter">Brand Attributes</label>
          <select id="attribute-filter" class="filter-select">
              <option value="">All Attributes</option>
              <option value="artisanal-excellence">Artisanal Excellence</option>
              <option value="cultural-ambassador">Cultural Ambassador</option>
              <option value="founder-led">Founder-Led</option>
              <option value="heritage-brand">Heritage Brand</option>
              <option value="innovation-leader">Innovation Leader</option>
              <option value="premium-positioning">Premium Positioning</option>
              <option value="regional-icon">Regional Icon</option>
              <option value="sustainability-pioneer">Sustainability Pioneer</option>
          </select>
      </div>

        <!-- Growth Signals dropdown -->
        <div class="filter-group">
            <label for="signal-filter">Growth Signals</label>
            <select id="signal-filter" class="filter-select">
            <option value="">All Signals</option>
            <option value="export-ready">Export Ready</option>
            <option value="franchise-ready">Franchise Ready</option>
            <option value="investment-ready">Investment Ready</option>
            <option value="rapid-growth">Rapid Growth</option>
            </select>
        </div>
        
        <button type="button" class="find-button">Find Brands</button>
      </div>
    </div>
    
    <!-- Right side: Featured brand with olive background -->
    <div class="featured-brand-panel panel--primary">
      <h2>Featured Brand</h2>
      
      <div class="brand-card">
        <div class="brand-logo">
          <img src="{{ site.baseurl }}/assets/images/brands/teatime/teatime-logo-400w.jpg" alt="TeaTime Logo">
        </div>
        <div class="brand-info">
          <h3>TeaTime</h3>
          <p class="brand-description">Premium tea blending house with authentic Russian samovar traditions and innovative flavors.</p>
          <div class="brand-meta">
            <span class="sector-tag">Gourmet Foods</span>
            <span class="market-tag">Russia</span>
          </div>
          <div class="brand-tags">
            <span class="attribute-tag">Heritage Brand</span>
            <span class="signal-tag">Export Ready</span>
          </div>
          <a href="{{ site.baseurl }}/brands/teatime/" class="view-profile">View Profile</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Full-width Discovery Path Section with Green Background -->
<!-- Discovery2 Panel - Clean Implementation -->
<div class="panel panel--discovery2">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Explore by Discovery Path</h2>
    
    <!-- Tab Navigation -->
    <div class="discovery2-tabs">
      <div class="discovery2-nav">
        <button class="discovery2-tab" data-tab="markets">Markets</button>
        <button class="discovery2-tab active" data-tab="sectors">Business Sectors</button>
        <button class="discovery2-tab" data-tab="attributes">Brand Attributes</button>
        <button class="discovery2-tab" data-tab="signals">Growth Signals</button>
      </div>
      
      <!-- Tab Content -->
      <div class="discovery2-content">
        <!-- Markets Tab -->
        <div class="discovery2-pane" id="markets-pane">
          <p class="discovery2-intro">Explore brands by their country of origin within the BRICS+ markets.</p>
          
          <div class="discovery2-tags">
            <a href="{{ site.baseurl }}/markets/russia/" class="market-tag">Russia</a>
            <a href="{{ site.baseurl }}/markets/brazil/" class="market-tag">Brazil</a>
            <a href="{{ site.baseurl }}/markets/china/" class="market-tag">China</a>
            <a href="{{ site.baseurl }}/markets/egypt/" class="market-tag">Egypt</a>
            <a href="{{ site.baseurl }}/markets/ethiopia/" class="market-tag">Ethiopia</a>
            <a href="{{ site.baseurl }}/markets/india/" class="market-tag">India</a>
            <a href="{{ site.baseurl }}/markets/indonesia/" class="market-tag">Indonesia</a>
            <a href="{{ site.baseurl }}/markets/iran/" class="market-tag">Iran</a>
            <a href="{{ site.baseurl }}/markets/south-africa/" class="market-tag">South Africa</a>
            <a href="{{ site.baseurl }}/markets/uae/" class="market-tag">UAE</a>
          </div>
        </div>
        
        <!-- Sectors Tab -->
        <div class="discovery2-pane active" id="sectors-pane">
          <p class="discovery2-intro">Explore brands by business sectors, from artisanal food products to luxury hospitality experiences.</p>
          
          <div class="discovery2-tags">
            <a href="{{ site.baseurl }}/sectors/hotels-resorts/" class="sector-tag">Hotels & Resorts</a>
            <a href="{{ site.baseurl }}/sectors/artisanal-spirits/" class="sector-tag">Artisanal Spirits & Vodka</a>
            <a href="{{ site.baseurl }}/sectors/gourmet-foods/" class="sector-tag">Gourmet Foods</a>
            <a href="{{ site.baseurl }}/sectors/natural-beauty/" class="sector-tag">Natural Beauty Products</a>
            <a href="{{ site.baseurl }}/sectors/wine/" class="sector-tag">Wine</a>
            <a href="{{ site.baseurl }}/sectors/specialty-cheeses/" class="sector-tag">Specialty Cheeses</a>
            <a href="{{ site.baseurl }}/sectors/jewelry-watches/" class="sector-tag">Jewelry & Watches</a>
            <a href="{{ site.baseurl }}/sectors/honey-bee-products/" class="sector-tag">Honey and Bee Products</a>
            <a href="{{ site.baseurl }}/sectors/fashion-accessories/" class="sector-tag">Fashion & Accessories</a>
            <a href="{{ site.baseurl }}/sectors/mineral-waters/" class="sector-tag">Mineral Waters</a>
            <a href="{{ site.baseurl }}/sectors/natural-food-supplements/" class="sector-tag">Natural Food Supplements</a>
            <a href="{{ site.baseurl }}/sectors/fermented-dairy/" class="sector-tag">Fermented Dairy (Kefir)</a>
            <a href="{{ site.baseurl }}/sectors/porcelain-ceramics/" class="sector-tag">Artisan Porcelain and Ceramics</a>
            <a href="{{ site.baseurl }}/sectors/halal-food/" class="sector-tag">Halal Food Products</a>
            <a href="{{ site.baseurl }}/sectors/cured-meats/" class="sector-tag">Salami and Cured Meats</a>
            <a href="{{ site.baseurl }}/sectors/confectionery/" class="sector-tag">Artisan Confectionery</a>
          </div>
        </div>
        
        <!-- Attributes Tab -->
        <div class="discovery2-pane" id="attributes-pane">
          <p class="discovery2-intro">Discover brands based on their distinctive qualities and characteristics that shape their market position.</p>
          
          <div class="discovery2-tags">
            <a href="{{ site.baseurl }}/attributes/founder-led/" class="attribute-tag">Founder-Led</a>
            <a href="{{ site.baseurl }}/attributes/heritage-brand/" class="attribute-tag">Heritage Brand</a>
            <a href="{{ site.baseurl }}/attributes/artisanal-excellence/" class="attribute-tag">Artisanal Excellence</a>
            <a href="{{ site.baseurl }}/attributes/regional-icon/" class="attribute-tag">Regional Icon</a>
            <a href="{{ site.baseurl }}/attributes/innovation-leader/" class="attribute-tag">Innovation Leader</a>
            <a href="{{ site.baseurl }}/attributes/premium-positioning/" class="attribute-tag">Premium Positioning</a>
            <a href="{{ site.baseurl }}/attributes/cultural-ambassador/" class="attribute-tag">Cultural Ambassador</a>
            <a href="{{ site.baseurl }}/attributes/sustainability-pioneer/" class="attribute-tag">Sustainability Pioneer</a>
          </div>
        </div>
        
        <!-- Signals Tab -->
        <div class="discovery2-pane" id="signals-pane">
          <p class="discovery2-intro">Find brands with specific business readiness indicators for different partnership opportunities.</p>
          
          <div class="discovery2-tags">
            <a href="{{ site.baseurl }}/signals/export-ready/" class="signal-tag">Export Ready</a>
            <a href="{{ site.baseurl }}/signals/franchise-ready/" class="signal-tag">Franchise Ready</a>
            <a href="{{ site.baseurl }}/signals/investment-ready/" class="signal-tag">Investment Ready</a>
            <a href="{{ site.baseurl }}/signals/rapid-growth/" class="signal-tag">Rapid Growth</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Full-width Insights Section with Indigo Background -->
<div class="panel panel--insights">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">BRICS+ Market Insights</h2>
    
    <div class="insights-grid">
      <!-- Founder's Journeys -->
      <div class="insight-category-panel">
        <h3>Founder's Journeys</h3>
        <p>The stories behind the brands and the people who created them.</p>
        
        <div class="featured-insight">
          <div class="insight-image">
            <img src="{{ site.baseurl }}/assets/images/insights/teatime-founder-journey-400w.jpg" alt="TeaTime Founder's Journey">
          </div>
          <div class="insight-content">
            <span class="insight-category-label">Featured</span>
            <h4>From University Project to Market Leader: TeaTime's Story</h4>
            <p>How a passion for tea traditions evolved into Russia's most innovative tea brand.</p>
            <a href="{{ site.baseurl }}/insights/founders-journeys/teatime-story/" class="read-more">Read more</a>
          </div>
        </div>
        
        <a href="{{ site.baseurl }}/insights/founders-journeys/" class="view-all">View all</a>
      </div>
      
      <!-- Brand Spotlights -->
      <div class="insight-category-panel">
        <h3>Brand Spotlights</h3>
        <p>Introducing noteworthy BRICS+ brands gaining momentum.</p>
        
        <div class="featured-insight">
          <div class="insight-image">
            <img src="{{ site.baseurl }}/assets/images/insights/russian-hotel-luxury-400w.jpg" alt="Russian Hotel Luxury">
          </div>
          <div class="insight-content">
            <span class="insight-category-label">Featured</span>
            <h4>Rising Star: How This Boutique Moscow Hotel Is Redefining Luxury</h4>
            <p>A look at the fusion of traditional Russian hospitality with modern luxury concepts.</p>
            <a href="{{ site.baseurl }}/insights/brand-spotlights/moscow-hotel-luxury/" class="read-more">Read more</a>
          </div>
        </div>
        
        <a href="{{ site.baseurl }}/insights/brand-spotlights/" class="view-all">View all</a>
      </div>
      
      <!-- Market Milestones -->
      <div class="insight-category-panel">
        <h3>Market Milestones</h3>
        <p>Notable achievements and expansion moments for BRICS+ brands.</p>
        
        <div class="featured-insight">
          <div class="insight-image">
            <img src="{{ site.baseurl }}/assets/images/insights/spirits-distribution-400w.jpg" alt="Spirits Distribution Deal">
          </div>
          <div class="insight-content">
            <span class="insight-category-label">Featured</span>
            <h4>Russian Spirits Brand Secures Major European Distribution Deal</h4>
            <p>How persistence and quality craftsmanship opened doors to international markets.</p>
            <a href="{{ site.baseurl }}/insights/market-milestones/spirits-distribution-deal/" class="read-more">Read more</a>
          </div>
        </div>
        
        <a href="{{ site.baseurl }}/insights/market-milestones/" class="view-all">View all</a>
      </div>
      
      <!-- Cultural Signatures -->
      <div class="insight-category-panel">
        <h3>Cultural Signatures</h3>
        <p>Distinctive features that give BRICS+ brands their unique identity.</p>
        
        <div class="featured-insight">
          <div class="insight-image">
            <img src="{{ site.baseurl }}/assets/images/insights/samovar-tradition-400w.jpg" alt="Samovar Tradition">
          </div>
          <div class="insight-content">
            <span class="insight-category-label">Featured</span>
            <h4>The Art of the Samovar: How Russian Tea Brands Maintain Traditions</h4>
            <p>Exploring the cultural significance behind Russia's iconic tea brewing vessel.</p>
            <a href="{{ site.baseurl }}/insights/cultural-signatures/samovar-tradition/" class="read-more">Read more</a>
          </div>
        </div>
        
        <a href="{{ site.baseurl }}/insights/cultural-signatures/" class="view-all">View all</a>
      </div>
    </div>
  </div>
</div>


<script>
// Discovery2 Panel Tab Functionality
document.addEventListener('DOMContentLoaded', function() {
  const tabs = document.querySelectorAll('.discovery2-tab');
  const panes = document.querySelectorAll('.discovery2-pane');
  
  tabs.forEach(tab => {
    tab.addEventListener('click', function() {
      // Get the tab's data-tab attribute
      const tabId = this.getAttribute('data-tab');
      const targetPane = document.getElementById(tabId + '-pane');
      
      // Deactivate all tabs and panes
      tabs.forEach(t => t.classList.remove('active'));
      panes.forEach(p => p.classList.remove('active'));
      
      // Activate the clicked tab and its corresponding pane
      this.classList.add('active');
      if (targetPane) {
        targetPane.classList.add('active');
      }
    });
  });
});
</script>