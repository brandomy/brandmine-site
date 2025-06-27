---
layout: page
title: "Founders Card Layout Testing"
permalink: /en/dev/founders-test/
lang: en
---

<link rel="stylesheet" href="{{ '/assets/css/components/founder-test-cards.css' | relative_url }}">

<div class="container" style="max-width: 1200px; margin: 0 auto; padding: var(--space-8);">
  
  <header style="text-align: center; margin-bottom: var(--space-12);">
    <h1>Founders Card Layout Testing</h1>
    <p style="font-size: var(--text-lg); color: var(--neutral-600);">
      Testing side-panel portrait layouts for optimal psychological impact
    </p>
  </header>

  <!-- Section 1: Primary Recommendation Showcase -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="text-align: center; margin-bottom: var(--space-2);">
      Recommended Layout: Portrait LEFT + 50% Width
    </h2>
    <p style="text-align: center; color: var(--neutral-600); margin-bottom: var(--space-8);">
      Bold founder-focused storytelling with maximum visual impact
    </p>
    
    <div style="max-width: 900px; margin: 0 auto;">
      {% include components/cards/founder-test-card.html
         portrait_position="left"
         width_variant="-50"
         name="Eduardo Santos"
         location="Gonçalves, Brazil 🇧🇷"
         generation="3rd Gen"
         achievement="Restored 500+ hectares of Atlantic Forest"
         brand="Serra Verde Organics"
         tags="organic agriculture, sustainable farming, agroforestry, export development"
         description="Third-generation farmer who transformed his family's traditional operation into a pioneering organic network supporting 28 families across Brazil's Atlantic Forest region."
         portrait_image="/assets/images/founders/br-eduardo-santos/br-eduardo-santos-portrait-farming-800w.jpg" %}
    </div>
  </section>

  <!-- Section 2: Psychology Comparison -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="text-align: center; margin-bottom: var(--space-2);">
      Bold Founder-Focused Storytelling: 50% Portrait Impact
    </h2>
    <p style="text-align: center; color: var(--neutral-600); margin-bottom: var(--space-8);">
      Equal split creates bold founder-focused narrative: "The person behind the brand matters as much as their achievements"
    </p>
    
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-10); margin-bottom: var(--space-8);">
      <div>
        <h3 style="color: var(--primary-600); margin-bottom: var(--space-2);">50% Portrait Width (RECOMMENDED)</h3>
        <p style="font-size: var(--text-sm); color: var(--neutral-600); margin-bottom: var(--space-4);">
          Bold statement: Founders ARE the story | Maximum emotional impact
        </p>
        
        {% include components/cards/founder-test-card.html
           portrait_position="left"
           width_variant="-50"
           name="Eduardo Santos"
           location="Gonçalves, Brazil 🇧🇷"
           generation="3rd Gen"
           achievement="Restored 500+ hectares of Atlantic Forest"
           brand="Serra Verde Organics"
           tags="organic agriculture, sustainable farming, agroforestry, export development"
           description="Third-generation farmer who transformed his family's traditional operation into a pioneering organic network supporting 28 families across Brazil's Atlantic Forest region."
           portrait_image="/assets/images/founders/br-eduardo-santos/br-eduardo-santos-portrait-farming-400w.jpg" %}
      </div>
      
      <div>
        <h3 style="color: var(--neutral-600); margin-bottom: var(--space-2);">Portrait RIGHT</h3>
        <p style="font-size: var(--text-sm); color: var(--neutral-600); margin-bottom: var(--space-4);">
          Story → Face flow | Content-first approach
        </p>
        
        {% include components/cards/founder-test-card.html
           portrait_position="right"
           width_variant="-50"
           name="Eduardo Santos"
           location="Gonçalves, Brazil 🇧🇷"
           generation="3rd Gen"
           achievement="Restored 500+ hectares of Atlantic Forest"
           brand="Serra Verde Organics"
           tags="organic agriculture, sustainable farming, agroforestry, export development"
           description="Third-generation farmer who transformed his family's traditional operation into a pioneering organic network supporting 28 families across Brazil's Atlantic Forest region."
           portrait_image="/assets/images/founders/br-eduardo-santos/br-eduardo-santos-portrait-farming-400w.jpg" %}
      </div>
    </div>
  </section>

  <!-- Section 3: Width Proportion Testing -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="text-align: center; margin-bottom: var(--space-4);">Width Proportion Comparison</h2>
    <p style="text-align: center; color: var(--neutral-600); margin-bottom: var(--space-8);">
      Testing optimal balance between portrait impact and content readability
    </p>
    
    <h3 style="color: var(--primary-600); margin-bottom: var(--space-4);">Portrait LEFT Variations</h3>
    <div style="display: grid; gap: var(--space-6);">
      
      <div>
        <h4>40% Portrait Width</h4>
        {% include components/cards/founder-test-card.html
           portrait_position="left"
           width_variant="-40"
           name="Alexei Sokolov"
           location="Moscow, Russia 🇷🇺"
           generation="1st Gen"
           achievement="Featured in Harrods London"
           brand="TeaTime"
           tags="tea blending, beverage innovation, cultural ambassador, brand storytelling"
           description="Tea blending master who revolutionized Russia's premium tea market with unique botanical infusions, achieving 23-country international presence."
           portrait_image="/assets/images/founders/ru-alexei-sokolov/ru-alexei-sokolov-portrait-formal-400w.jpg" %}
      </div>
      
      <div>
        <h4>45% Portrait Width (Balanced)</h4>
        {% include components/cards/founder-test-card.html
           portrait_position="left"
           width_variant="-45"
           name="Maria Kuznetsova"
           location="Kazan, Russia 🇷🇺"
           generation="1st Gen"
           achievement="Gold at International Condiment Exhibition"
           brand="Seven Spices"
           tags="culinary arts, traditional preservation, sustainable sourcing, food artisan"
           description="Former chef rediscovering and reimagining Russia's rich condiment traditions through artisanal production and cultural preservation."
           portrait_image="/assets/images/founders/ru-maria-kuznetsova/ru-maria-kuznetsova-portrait-traditional-400w.jpg" %}
      </div>
      
      <div>
        <h4>50% Portrait Width (RECOMMENDED - Equal Split)</h4>
        {% include components/cards/founder-test-card.html
           portrait_position="left"
           width_variant="-50"
           name="Ivan Petrov"
           location="Belokurikha, Russia 🇷🇺"
           generation="1st Gen"
           achievement="International organic certification"
           brand="Altai Honey"
           tags="beekeeping, organic agriculture, sustainable harvesting, community development"
           description="Third-generation beekeeper modernizing ancestral craft while preserving traditional Altai harvesting techniques."
           portrait_image="/assets/images/founders/ru-ivan-petrov/ru-ivan-petrov-portrait-working-400w.jpg" %}
      </div>
    </div>
    
    <h3 style="color: var(--neutral-600); margin: var(--space-8) 0 var(--space-4) 0;">Portrait RIGHT Variations</h3>
    <div style="display: grid; gap: var(--space-6);">
      
      <div>
        <h4>40% Portrait Width</h4>
        {% include components/cards/founder-test-card.html
           portrait_position="right"
           width_variant="-40"
           name="Alexei Sokolov"
           location="Moscow, Russia 🇷🇺"
           generation="1st Gen"
           achievement="Featured in Harrods London"
           brand="TeaTime"
           tags="tea blending, beverage innovation, cultural ambassador, brand storytelling"
           description="Tea blending master who revolutionized Russia's premium tea market with unique botanical infusions."
           portrait_image="/assets/images/founders/ru-alexei-sokolov/ru-alexei-sokolov-portrait-formal-400w.jpg" %}
      </div>
      
      <div>
        <h4>45% Portrait Width</h4>
        {% include components/cards/founder-test-card.html
           portrait_position="right"
           width_variant="-45"
           name="Maria Kuznetsova"
           location="Kazan, Russia 🇷🇺"
           generation="1st Gen"
           achievement="Gold at International Condiment Exhibition"
           brand="Seven Spices"
           tags="culinary arts, traditional preservation, sustainable sourcing"
           description="Former chef rediscovering Russia's rich condiment traditions through artisanal production."
           portrait_image="/assets/images/founders/ru-maria-kuznetsova/ru-maria-kuznetsova-portrait-traditional-400w.jpg" %}
      </div>
    </div>
  </section>

  <!-- Section 3: Mobile Responsive Testing -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="text-align: center; margin-bottom: var(--space-4);">Mobile Behavior Testing</h2>
    <p style="text-align: center; color: var(--neutral-600); margin-bottom: var(--space-8);">
      Test on mobile devices or resize browser window below 768px
    </p>
    
    <div style="display: grid; gap: var(--space-6);">
      <div>
        <h4>Mobile: Portrait Top (Recommended)</h4>
        {% include components/cards/founder-test-card.html
           portrait_position="left"
           width_variant="-45"
           name="Eduardo Santos"
           location="Gonçalves, Brazil 🇧🇷"
           generation="3rd Gen"
           achievement="Restored 500+ hectares of Atlantic Forest"
           brand="Serra Verde Organics"
           tags="organic agriculture, sustainable farming, agroforestry"
           description="Third-generation farmer who transformed his family's traditional operation into a pioneering organic network."
           portrait_image="/assets/images/founders/br-eduardo-santos/br-eduardo-santos-portrait-farming-400w.jpg" %}
      </div>
    </div>
  </section>

  <!-- Summary and Recommendations -->
  <section style="background: var(--neutral-50); padding: var(--space-8); border-radius: var(--rounded-lg); margin-bottom: var(--space-16);">
    <h2 style="text-align: center; margin-bottom: var(--space-4);">Testing Observations</h2>
    
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-8);">
      <div>
        <h3 style="color: var(--primary-600);">Portrait LEFT Benefits</h3>
        <ul style="color: var(--neutral-600);">
          <li>Face-first emotional connection</li>
          <li>Natural reading flow (left-to-right)</li>
          <li>Immediate trust building</li>
          <li>Portrait acts as visual anchor</li>
        </ul>
      </div>
      
      <div>
        <h3 style="color: var(--neutral-600);">Portrait RIGHT Benefits</h3>
        <ul style="color: var(--neutral-600);">
          <li>Content-first information processing</li>
          <li>Achievement-led credibility</li>
          <li>Portrait as visual conclusion</li>
          <li>May work better for text-heavy content</li>
        </ul>
      </div>
    </div>
    
    <div style="margin-top: var(--space-6); text-align: center;">
      <h4 style="color: var(--primary-600);">Final Recommendation</h4>
      <p style="color: var(--neutral-600); font-size: var(--text-lg); font-weight: var(--font-medium);">
        <strong>50% Portrait Width + Left Position</strong><br>
        Bold founder-focused storytelling that makes the statement: "At Brandmine, we believe the founder IS the brand story worth telling."
      </p>
    </div>
  </section>

  <!-- Section 4: Interactive Founders Carousel -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="text-align: center; margin-bottom: var(--space-2);">
      Interactive Founders Carousel (Production Ready)
    </h2>
    <p style="text-align: center; color: var(--neutral-600); margin-bottom: var(--space-8);">
      50% portrait cards in engaging carousel format using existing Brandmine carousel system
    </p>
    
    {% include pages/founders/founders-carousel.html 
       title="Founders Leading Cultural Bridge Building"
       subtitle="Experience the power of 50% portrait layouts in an interactive carousel optimized for founder storytelling" %}
  </section>

  <!-- Section 5: Carousel Comparison -->
  <section style="margin-bottom: var(--space-16);">
    <h2 style="text-align: center; margin-bottom: var(--space-4);">
      Carousel Comparison: Single vs Dual Cards
    </h2>
    
    <div style="background: var(--neutral-100); padding: var(--space-6); border-radius: var(--rounded-lg); margin-bottom: var(--space-8);">
      <h3 style="color: var(--primary-600); margin-bottom: var(--space-2);">
        Single Card Carousel (Above)
      </h3>
      <p style="font-size: var(--text-sm); color: var(--neutral-600); margin-bottom: var(--space-4);">
        <strong>Pros:</strong> Maximum emotional impact, deep focus, founder-centric storytelling<br>
        <strong>Cons:</strong> Slower discovery, requires more interactions
      </p>
      
      <h3 style="color: var(--neutral-600); margin-bottom: var(--space-2);">
        Dual Card Carousel (Below)
      </h3>
      <p style="font-size: var(--text-sm); color: var(--neutral-600);">
        <strong>Pros:</strong> Efficient comparison, faster discovery, familiar pattern<br>
        <strong>Cons:</strong> Reduced individual impact, potential cognitive overload
      </p>
    </div>
    
    <h3 style="margin-bottom: var(--space-6); text-align: center;">Dual Card Approach</h3>
    {% include pages/founders/founders-carousel-dual.html %}
  </section>

</div>