---
layout: default
title: About
permalink: /en/about/
lang: en
ref: about
---

<!-- Hero Section with Gradient Background -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary">About Brandmine</h1>
    <p class="panel__subtitle">Illuminating and Elevating Founder-led Brands from the BRICS+</p>
  </div>
</div>

<!-- Mission Section - Keep as primary-soft -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">{{ site.data.translations[page.lang].about.mission }}</h2>
    <p class="panel__lead-text">{{ site.data.translations[page.lang].about.lead_text }}</p>
  </div>
</div>

<!-- Problem Section - Keep as light -->
<div class="panel panel--light problems-panel">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">The Problem We Solve</h2>
    <p class="panel__lead-text">
      Brand investors, distributors, importers, franchisors, and international partners face significant challenges when seeking opportunities in BRICS+ markets:
    </p>

    <!-- Problem cards in 2x2 grid -->
<div class="problem-grid">
  <div class="problem-card problem-card--1">
    <div class="problem-icon">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"></path></svg>
    </div>
    <h3>Information Fragmentation</h3>
    <p>Critical brand data scattered across multiple sources</p>
  </div>

  <div class="problem-card problem-card--2">
    <div class="problem-icon">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129"></path></svg>
    </div>
    <h3>Language Barriers</h3>
    <p>Essential information trapped in local languages</p>
  </div>

  <div class="problem-card problem-card--3">
    <div class="problem-icon">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
    </div>
    <h3>Cultural Context Gaps</h3>
    <p>Missing the "why" behind brand-consumer relationships</p>
  </div>

  <div class="problem-card problem-card--4">
    <div class="problem-icon">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 13a5 5 0 007.54.54l3-3a5 5 0 00-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 00-7.54-.54l-3 3a5 5 0 007.07 7.07l1.71-1.71"></path></svg>
    </div>
    <h3>Discovery Challenges</h3>
    <p>No efficient way to identify promising brands</p>
  </div>
</div>

  <p class="panel__conclusion-text">
    This fractured landscape creates a lose-lose scenario — international partners waste resources searching for hidden gems, while innovative founders with proven models struggle to access the partners and capital needed for global growth.
  </p>
  </div>
</div>

<!-- Solution Section - Changed to olive-soft to match sectors focus -->
<div class="panel panel--olive-soft solutions-panel">
  <div class="panel__content">
      <h2 class="panel__heading-secondary">Our Solution</h2>
      <p class="panel__lead-text">
        Brandmine's business intelligence hub brings clarity to this fragmented landscape by:
      </p>

    <div class="solutions-list">
      <div class="solution-item">
        <div class="solution-number">1</div>
        <div class="solution-content">
          <h3>Illuminating hidden brand ecosystems</h3>
          <p>Through comprehensive, multilingual profiles</p>
        </div>
      </div>

      <div class="solution-item">
        <div class="solution-number">2</div>
        <div class="solution-content">
          <h3>Decoding cultural significance</h3>
          <p>Beyond simple language translation</p>
        </div>
      </div>

      <div class="solution-item">
        <div class="solution-number">3</div>
        <div class="solution-content">
          <h3>Creating structured comparisons</h3>
          <p>With standardized metrics across regions</p>
        </div>
      </div>

      <div class="solution-item">
        <div class="solution-number">4</div>
        <div class="solution-content">
          <h3>Showcasing founder journeys</h3>
          <p>That resonate globally despite local origins</p>
        </div>
      </div>

      <div class="solution-item">
        <div class="solution-number">5</div>
        <div class="solution-content">
          <h3>Curating qualified opportunities</h3>
          <p>To streamline partnership pathways</p>
        </div>
      </div>
    </div>
  <p class="panel__conclusion-text">
    Through this comprehensive approach, we create a clear, accessible path to opportunity that benefits both visionary founders and the partners who can help them grow.
  </p>
  </div>
</div>

<!-- Team Section - Keep as light -->
<div class="panel panel--light team-panel">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Our Team</h2>

    <div class="team-section">
      <div class="team-member">
        {% include components/images/site-image.html
          category="people/team"
          image="randal-eastman"
          purpose="headshot"
          alt="Randal Eastman"
          class="team-photo" %}
        <h3>Randal Eastman</h3>
        <p class="team-title">Founder & CEO</p>
        <p>Randal combines over 25 years of international business experience across Asia and Europe with deep expertise in brand development and market entry strategy. His unique background includes:</p>
        <ul>
          <li>Nearly two decades building and scaling Dragonfly, an iconic spa brand in China, as Partner and CEO</li>
          <li>Extensive experience as a brand licensor, franchisor, and operator across multiple Asian markets</li>
          <li>Professional working proficiency in Russian and Chinese, with a BA in Russian and German from McMaster University</li>
          <li>MBA from Ivey Business School at Western University</li>
          <li>Direct experience connecting brands with international partners and capital across cultural and linguistic divides</li>
        </ul>
        <p>This blend of operational leadership, brand-building expertise, and cross-cultural fluency gives Randal an exceptional ability to identify promising brands and understand their international potential.</p>
        <!-- New LinkedIn Button -->
        <div class="team-member-linkedin">
          <a href="https://www.linkedin.com/in/randaleastman/" target="_blank" aria-label="Randal Eastman on LinkedIn">
            <i class="fab fa-linkedin"></i>
          </a>
        </div>
      </div>

      <div class="team-member">
        {% include components/images/site-image.html
          category="people/team"
          image="olya-eastman"
          purpose="headshot"
          alt="Olya Eastman"
          class="team-photo" %}
        <h3>Olya Eastman</h3>
        <p class="team-title">Co-Founder & Director of People and Partnerships</p>
        <p>Olya brings over 25 years of executive search experience with specialized expertise in connecting talent and opportunities across borders:</p>
        <ul>
          <li>Extensive experience placing senior executives in multinational companies throughout Greater China, Russia, and Southeast Asia</li>
          <li>Native Russian speaker with professional proficiency in Chinese and English, plus working knowledge of Japanese</li>
          <li>Master's degree in Japanese Language & Country Studies from Far Eastern Federal University</li>
          <li>Co-founder of multiple successful executive search firms focused on cross-border talent solutions</li>
          <li>Deep understanding of the people and relationships that drive successful brand growth</li>
        </ul>
        <p>Olya's unique ability to identify key talent and forge strategic partnerships is instrumental in connecting BRICS+ brands with the right international partners.</p>
        <div class="team-member-linkedin">
          <a href="https://www.linkedin.com/in/olya-eastman/" target="_blank" aria-label="Olya Eastman on LinkedIn">
            <i class="fab fa-linkedin"></i>
          </a>
        </div>
      </div>
    </div>
    <p class="panel__conclusion-text">
      With our combined expertise in brand development, market entry, and cross-cultural business, we're uniquely positioned to bridge the gap between visionary founders and the international partners they need to succeed.
    </p>
  </div>
</div>

<!-- Perspective Section - Changed to secondary-soft to highlight attributes/qualities -->
<div class="panel panel--secondary-soft">
  <div class="panel__content">
      <h2 class="panel__heading-secondary">Our Unique Perspective</h2>
      <p class="panel__lead-text">
        With over 25 years living and working across Asia—particularly in China and Russia—our founders bring a rare combination of linguistic capability, cultural insight, and business acumen to Brandmine:
      </p>

    <ul class="perspective-list">
        <li><span><strong>Firsthand founder experience</strong> building and scaling an iconic brand across Asian markets</span></li>
        <li><span><strong>Entrepreneur's perspective</strong> on the challenges of securing international investment and partnerships</span></li>
        <li><span><strong>Cultural bridging expertise</strong> that goes beyond language translation</span></li>
        <li><span><strong>Extensive networks</strong> across both BRICS+ countries and international markets</span></li>
        <li><span><strong>Focus on overlooked regions</strong> where extraordinary brands thrive without global recognition</span></li>
      </ul>

      <p class="panel__conclusion-text">
        This distinctive background enables us to see valuable opportunities where others see only barriers.
      </p>
  </div>
</div>

<!-- Services Section - Keep as light -->
<div class="panel panel--light services-panel">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">Our Services</h2>
    <p class="panel__lead-text">
      We offer services for BRICS+ Brands as well as for the Investors and Business Partners seeking to do business with them.
    </p>

    <div class="services-container">
      <!-- Left Column: For International Partners -->
      <div class="service-panel service-panel--international">
        <div class="service-panel__header">
          <h3 class="service-panel__title">For International Partners</h3>
        </div>
        <div class="service-panel__content">
          <ul class="service-list">
            <li class="service-item">
              <span class="service-item__bullet">•</span>
              <div class="service-item__content">
                <strong class="service-item__title">Brand Discovery Database:</strong>
                <p>Searchable collection of curated brand profiles</p>
              </div>
            </li>
            <li class="service-item">
              <span class="service-item__bullet">•</span>
              <div class="service-item__content">
                <strong class="service-item__title">Bespoke Research:</strong>
                <p>Tailored investigations into specific sectors or regions</p>
              </div>
            </li>
            <li class="service-item">
              <span class="service-item__bullet">•</span>
              <div class="service-item__content">
                <strong class="service-item__title">Market Entry Guidance:</strong>
                <p>Strategic support for navigating BRICS+ markets</p>
              </div>
            </li>
            <li class="service-item">
              <span class="service-item__bullet">•</span>
              <div class="service-item__content">
                <strong class="service-item__title">Connection Facilitation:</strong>
                <p>Introductions to vetted brand partners</p>
              </div>
            </li>
          </ul>
        </div>
      </div>

      <!-- Right Column: For BRICS+ Brands -->
      <div class="service-panel service-panel--brands">
        <div class="service-panel__header">
          <h3 class="service-panel__title">For BRICS+ Brands</h3>
        </div>
        <div class="service-panel__content">
          <ul class="service-list">
            <li class="service-item">
              <span class="service-item__bullet">•</span>
              <div class="service-item__content">
                <strong class="service-item__title">International Visibility:</strong>
                <p>Exposure to qualified global partners</p>
              </div>
            </li>
            <li class="service-item">
              <span class="service-item__bullet">•</span>
              <div class="service-item__content">
                <strong class="service-item__title">Founder Story Profiles:</strong>
                <p>Compelling narratives that showcase your journey</p>
              </div>
            </li>
            <li class="service-item">
              <span class="service-item__bullet">•</span>
              <div class="service-item__content">
                <strong class="service-item__title">Funding Round Visibility:</strong>
                <p>Showcase investment opportunities to targeted partners</p>
              </div>
            </li>
            <li class="service-item">
              <span class="service-item__bullet">•</span>
              <div class="service-item__content">
                <strong class="service-item__title">Founder Community:</strong>
                <p>Connect with peers across BRICS+ regions</p>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <p class="panel__conclusion-text">
      Our customized approach ensures both brands and partners find the right connections, with the right context, at the right time—creating value across borders through meaningful relationships.
    </p>
  </div>
</div>

<!-- Contact Section - Keep as cta -->
<div class="panel panel--cta">
  <div class="panel__content panel--centered">
    <h2 class="panel__heading-secondary">Contact Us</h2>
    <p class="panel__lead-text">
      Whether you're seeking new brand opportunities or looking to gain international visibility for your BRICS+ brand, we'd love to hear from you.
    </p>

    <div class="contact-info">
      <div class="contact-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="contact-icon"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
        <a href="mailto:info@brandmine.io">info@brandmine.io</a>
      </div>
      <div class="contact-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="contact-icon"><path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07 19.5 19.5 0 01-6-6 19.79 19.79 0 01-3.07-8.67A2 2 0 014.11 2h3a2 2 0 012 1.72 12.84 12.84 0 00.7 2.81 2 2 0 01-.45 2.11L8.09 9.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45 12.84 12.84 0 002.81.7A2 2 0 0122 16.92z"></path></svg>
        <a href="tel:+60163199439">+60 16 3199439</a>
      </div>
    </div>

   <!-- Contact Form Container with additional wrapper -->
    <div class="mobile-form-wrapper">
      <div class="contact-form-container">
        <iframe data-tally-src="https://tally.so/embed/3qvVaY?alignLeft=1&hideTitle=0&transparentBackground=0&dynamicHeight=1" loading="lazy" width="100%" height="400" frameborder="0" marginheight="0" marginwidth="0" title="Contact Form"></iframe>

        <script>var d=document,w="https://tally.so/widgets/embed.js",v=function(){"undefined"!=typeof Tally?Tally.loadEmbeds():d.querySelectorAll("iframe[data-tally-src]:not([src])").forEach((function(e){e.src=e.dataset.tallySrc}))};if("undefined"!=typeof Tally)v();else if(d.querySelector('script[src="'+w+'"]')==null){var s=d.createElement("script");s.src=w,s.onload=v,s.onerror=v,d.body.appendChild(s);}</script>
      </div>
    </div>
  </div>
</div>
<!-- End of contact section -->
