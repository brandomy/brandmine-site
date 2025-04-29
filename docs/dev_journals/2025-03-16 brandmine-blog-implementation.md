# Brandmine Blog Implementation Guide: Value-Focused Categories

## Strategic Overview

This guide outlines the implementation of a value-focused blog category structure for Brandmine's MVP. With limited resources and a founder-led content strategy, this approach maximizes impact while minimizing production burden.

### Core Categories

1. **Brand Discoveries** - Introducing noteworthy BRICS+ brands with unique stories
2. **Export Opportunities** - Practical insights on brands ready for international expansion
3. **Cultural Context** - Understanding the cultural factors that shape BRICS+ consumer brands
4. **Success Stories** - Case studies of BRICS+ brands that have successfully expanded globally

## Implementation Roadmap

### Phase 1: Foundation (Weeks 1-2)

#### Technical Setup

1. **Create the blog directory structure in Jekyll**:
   ```bash
   mkdir -p _layouts _includes _posts/en _posts/ru _posts/zh blog/categories/en blog/categories/ru blog/categories/zh
   ```

2. **Create the category layout** in `_layouts/category.html`:
   ```html
   ---
   layout: default
   ---
   <div class="full-width-panel light-panel">
     <div class="panel-content">
       <h1>{{ page.title }}</h1>
       <div class="category-description">
         {{ content }}
       </div>
       
       <div class="post-grid">
         {% for post in site.categories[page.category] %}
           <div class="post-card">
             <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
             <p class="post-meta">{{ post.date | date: "%B %-d, %Y" }}</p>
             <p>{{ post.excerpt }}</p>
             <a href="{{ post.url | relative_url }}" class="read-more">Read more</a>
           </div>
         {% endfor %}
       </div>
     </div>
   </div>
   ```

3. **Create the post layout** in `_layouts/post.html`:
   ```html
   ---
   layout: default
   ---
   <div class="full-width-panel light-panel">
     <div class="panel-content blog-post">
       <h1>{{ page.title }}</h1>
       <p class="post-meta">
         {% if page.author %}{{ page.author }} • {% endif %}
         {{ page.date | date: "%B %-d, %Y" }}
         {% if page.categories.size > 0 %} • 
           <span class="post-category">
             <a href="{{ site.baseurl }}/{{ page.lang }}/blog/categories/{{ page.categories[0] | slugify }}/">
               {{ site.data.translations[page.lang].categories[page.categories[0]] }}
             </a>
           </span>
         {% endif %}
       </p>
       
       <div class="post-content">
         {{ content }}
       </div>
       
       <div class="post-navigation">
         <div class="post-nav-links">
           {% if page.previous.url and page.previous.lang == page.lang %}
           <a class="prev" href="{{ page.previous.url | relative_url }}">&laquo; {{ page.previous.title }}</a>
           {% endif %}
           
           {% if page.next.url and page.next.lang == page.lang %}
           <a class="next" href="{{ page.next.url | relative_url }}">{{ page.next.title }} &raquo;</a>
           {% endif %}
         </div>
       </div>
     </div>
   </div>
   ```

4. **Create category index files** for English (repeat for other languages):
   
   `blog/categories/en/brand-discoveries.md`:
   ```markdown
   ---
   layout: category
   title: Brand Discoveries
   category: brand-discoveries
   permalink: /en/blog/categories/brand-discoveries/
   lang: en
   ---
   Introducing noteworthy BRICS+ brands with unique stories, innovative products, and distinctive market positions. Discover the hidden gems of emerging markets.
   ```

5. **Create blog index page** at `blog/en/index.html`:
   ```html
   ---
   layout: default
   title: Brandmine Blog
   permalink: /en/blog/
   lang: en
   ---
   
   <div class="full-width-panel light-panel">
     <div class="panel-content">
       <h1>Brandmine Blog</h1>
       <p class="lead-text">Insights, analysis, and stories of BRICS+ consumer brands with global potential.</p>
       
       <div class="category-list">
         <h2>Categories</h2>
         <div class="category-grid">
           <div class="category-card">
             <h3><a href="{{ '/en/blog/categories/brand-discoveries/' | relative_url }}">Brand Discoveries</a></h3>
             <p>Introducing noteworthy BRICS+ brands with unique stories.</p>
           </div>
           
           <div class="category-card">
             <h3><a href="{{ '/en/blog/categories/export-opportunities/' | relative_url }}">Export Opportunities</a></h3>
             <p>Practical insights on brands ready for international expansion.</p>
           </div>
           
           <div class="category-card">
             <h3><a href="{{ '/en/blog/categories/cultural-context/' | relative_url }}">Cultural Context</a></h3>
             <p>Understanding the cultural factors that shape BRICS+ consumer brands.</p>
           </div>
           
           <div class="category-card">
             <h3><a href="{{ '/en/blog/categories/success-stories/' | relative_url }}">Success Stories</a></h3>
             <p>Case studies of BRICS+ brands that have successfully expanded globally.</p>
           </div>
         </div>
       </div>
       
       <h2>Recent Posts</h2>
       <div class="post-grid">
         {% assign posts = site.posts | where:"lang", page.lang %}
         {% for post in posts limit:6 %}
           <div class="post-card">
             <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
             <p class="post-meta">{{ post.date | date: "%B %-d, %Y" }}</p>
             <p>{{ post.excerpt }}</p>
             <a href="{{ post.url | relative_url }}" class="read-more">Read more</a>
           </div>
         {% endfor %}
       </div>
     </div>
   </div>
   ```

6. **Add blog CSS** to `assets/css/pages/blog.css`:
   ```css
   /* Blog main page styling */
   .category-grid {
     display: grid;
     grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
     gap: var(--space-6);
     margin: var(--space-8) 0;
   }
   
   .category-card {
     background-color: white;
     border-radius: 0.5rem;
     padding: var(--space-6);
     box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
     border: 1px solid var(--neutral-200);
   }
   
   .category-card h3 {
     margin-top: 0;
     color: var(--primary-600);
   }
   
   /* Post grid styling */
   .post-grid {
     display: grid;
     grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
     gap: var(--space-6);
     margin: var(--space-8) 0;
   }
   
   .post-card {
     background-color: white;
     border-radius: 0.5rem;
     padding: var(--space-6);
     box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
     border: 1px solid var(--neutral-200);
     height: 100%;
     display: flex;
     flex-direction: column;
   }
   
   .post-card h3 {
     margin-top: 0;
   }
   
   .post-meta {
     color: var(--neutral-500);
     font-size: 0.9rem;
     margin-bottom: var(--space-4);
   }
   
   .read-more {
     margin-top: auto;
     color: var(--primary-600);
     font-weight: 600;
     text-decoration: none;
   }
   
   .read-more:hover {
     color: var(--primary-400);
     text-decoration: underline;
   }
   
   /* Blog post styling */
   .blog-post {
     max-width: 760px;
     margin: 0 auto;
   }
   
   .blog-post h1 {
     font-size: 2.5rem;
     margin-bottom: var(--space-4);
   }
   
   .post-content {
     margin: var(--space-8) 0;
     line-height: 1.7;
   }
   
   .post-content h2 {
     margin-top: var(--space-12);
     margin-bottom: var(--space-4);
   }
   
   .post-content h3 {
     margin-top: var(--space-8);
     margin-bottom: var(--space-2);
   }
   
   .post-content img {
     max-width: 100%;
     border-radius: 0.5rem;
     margin: var(--space-6) 0;
   }
   
   .post-navigation {
     margin-top: var(--space-12);
     padding-top: var(--space-6);
     border-top: 1px solid var(--neutral-200);
   }
   
   .post-nav-links {
     display: flex;
     justify-content: space-between;
   }
   
   /* Responsive adjustments */
   @media (max-width: var(--breakpoint-md)) {
     .blog-post h1 {
       font-size: 2rem;
     }
     
     .category-grid,
     .post-grid {
       grid-template-columns: 1fr;
     }
   }
   ```

7. **Update `_config.yml`** to add blog-related configurations:
   ```yaml
   # Add to your existing config
   permalink: /:categories/:year/:month/:day/:title/
   
   # Blog settings
   paginate: 9
   paginate_path: "/blog/page:num/"
   ```

### Phase 2: Initial Content Creation (Weeks 3-4)

#### Launch Strategy: The Minimum Viable Blog

For an MVP blog launch, create **just one strong post per category** (4 total posts):

1. **Brand Discoveries Post**:
   Create a file in `_posts/en/2025-03-16-russian-craft-vodka-renaissance.md`:
   ```markdown
   ---
   layout: post
   title: "Russian Craft Vodka Renaissance: 5 Brands Redefining a Traditional Spirit"
   author: Founder Name
   date: 2025-03-16
   categories: [brand-discoveries]
   lang: en
   excerpt: "Discover how small-batch Russian distilleries are transforming vodka from commodity to craft, blending traditional methods with modern sensibilities."
   ---
   
   Russia's relationship with vodka spans centuries, but today's craft distilleries are writing a new chapter in this storied history. Moving beyond mass production, these artisanal producers are creating distinctive expressions that challenge international perceptions of this quintessential Russian spirit.

   ## The New Wave of Russian Craft Vodka

   While global consumers often associate Russian vodka with large commercial brands, a revolution has been quietly brewing. Small-batch distilleries across the country are reviving traditional production methods, emphasizing regional ingredients, and creating products with true terroir and character.

   These craft producers are not just making vodka—they're telling the story of Russian craftsmanship, agricultural heritage, and regional identity through their products.

   ## Five Standout Brands to Watch

   ### 1. Altai Spirit

   **Location:** Altai Republic  
   **Founded:** 2017  
   **Signature Product:** Altai Cedar Nut Vodka

   Based in the pristine Altai mountains, this distillery creates vodka using local spring water filtered through cedar forests. Their signature product incorporates cedar nuts harvested by local communities, creating a distinctive product with subtle nutty notes and exceptional smoothness.

   The beautiful hand-etched bottles feature traditional Altai patterns, making them as visually striking as they are delicious.

   ### 2. Northern Light Distillery

   **Location:** Arkhangelsk Oblast  
   **Founded:** 2015  
   **Signature Product:** Arctic Grain Vodka

   Using grain grown during the White Nights of the Russian north, when 24-hour sunlight creates uniquely sweet and robust barley, Northern Light produces a remarkably clean vodka with subtle mineral notes.

   Their sustainable approach includes traditional windmill-powered operations and plastic-free packaging, appealing to eco-conscious international consumers.

   ### 3. Sibirskaya Korona

   **Location:** Novosibirsk  
   **Founded:** 2012  
   **Signature Product:** Siberian Rye Vodka

   This distillery has revived a pre-Soviet recipe for rye-based vodka that was nearly lost during the 20th century. Using a slower, more labor-intensive distillation process, they create a character-rich spirit with subtle spice notes that pair exceptionally well with traditional Russian cuisine.

   Their recent limited batches aged in birch barrels have garnered attention from spirits connoisseurs worldwide.

   ### 4. Belomorskaya Distillery

   **Location:** Karelia  
   **Founded:** 2018  
   **Signature Product:** White Sea Vodka

   Located near the White Sea coast, this distillery incorporates filtering through Karelian limestone formations that are over 2 billion years old. The resulting vodka has a distinctive minerality and exceptional smoothness.

   Their bottle design features traditional Pomor folk art from the White Sea region, connecting the product to the area's rich cultural heritage.

   ### 5. Tsarskaya Kollektsiya

   **Location:** Moscow Region  
   **Founded:** 2014  
   **Signature Product:** Imperial Reserve Vodka

   This distillery combines imperial-era recipes with modern filtration technology. What sets them apart is their resurrection of pre-revolution wheat varietals from seed banks, creating a historically authentic foundation for their products.

   Their limited production and meticulous attention to detail have made them a favorite among high-end restaurants and collectors.

   ## Export Potential and International Reception

   These craft vodka producers represent a significant opportunity for international markets seeking authentic, story-rich products. While Russian vodka has always had global reach, these artisanal offerings are reaching new consumer segments:

   - **Craft Spirits Enthusiasts:** Consumers who have embraced craft gin, whiskey, and rum are discovering that vodka too can offer complexity and character
   - **Experience-Focused Buyers:** Those seeking authentic cultural connections through their purchases
   - **Premium Gift Market:** The distinctive packaging and stories make these products ideal for gifting
   - **Culinary Tourism Extensions:** These products allow consumers to experience Russian craftsmanship without travel

   ## The Craft Vodka Landscape in 2025

   Russia's craft vodka movement has grown from just a handful of producers in 2015 to over 60 small-batch distilleries today. With domestic consumption increasingly favoring quality over quantity, and international interest in authentic Russian products growing, these brands represent the future of Russian spirits on the global stage.

   For international partners looking to diversify their premium spirits portfolio, these craft vodkas offer a compelling combination of authentic heritage and contemporary appeal.
   ```

2. **Export Opportunities Post**:
   Focus on one specific aspect of export readiness, such as packaging design, certifications, or market entry strategies.

3. **Cultural Context Post**:
   Explore how a specific cultural factor (holiday traditions, design aesthetics, etc.) influences BRICS+ products.

4. **Success Stories Post**:
   Profile a BRICS+ brand that has successfully expanded internationally, analyzing key factors in their success.

#### Content Creation Strategy

For each post, follow this development process:

1. **Research Phase**:
   - Identify 3-5 key points you want to make
   - Gather specific examples and data points (even just a few)
   - Find 1-2 images that illustrate your points

2. **Content Development with Claude**:
   - Share your bullet points and examples with Claude
   - Ask Claude to help develop a structured post outline
   - Collaborate with Claude to draft the full post
   - Request Claude to help edit for clarity and flow

3. **Finalization**:
   - Add any necessary image references
   - Format properly for Jekyll
   - Review the final post in your development environment

### Phase 3: Growth Strategy (Weeks 5+)

#### Sustainable Content Development

After launching with one post per category, follow this approach to grow your blog efficiently:

1. **Create one new post every 2 weeks** (realistic for founder-led content)
2. **Rotate through categories** to ensure balanced coverage
3. **Develop a simple content calendar** 3 months ahead
4. **Leverage one piece of content across multiple formats**:
   - Convert blog posts into LinkedIn articles
   - Extract key points for social media content
   - Use the content as a foundation for email newsletters

#### Content Amplification

For each post you publish:

1. **Share on relevant LinkedIn groups** focused on international trade, BRICS markets, or specific product categories
2. **Send personal notes** to 5-10 potential Brandmine users who might find the content valuable
3. **Connect with brands mentioned** in your content, which may lead to relationship development
4. **Monitor analytics** to see which topics generate the most engagement

## Category-Specific Content Strategies

### 1. Brand Discoveries

**Content Approach**: 
Introduce 3-5 interesting brands from a specific country or sector in each post. Focus on what makes them unique and export-ready.

**Key Components**:
- Brief company background
- Unique selling propositions
- Product highlights
- Design/packaging approach
- Why they matter internationally

**Content Ideas**:
- "Russian Craft Vodka Renaissance: 5 Brands Redefining a Traditional Spirit"
- "India's New Luxury Textile Brands: Tradition Meets Contemporary Design"
- "Chinese Skincare Innovators: 4 Brands Blending TCM with Modern Science"

**Content Creation Tip**: 
For these posts, focus on visual elements and distinctive brand stories. Use bullet points and clear subheadings to make them scannable.

### 2. Export Opportunities

**Content Approach**:
Practical, actionable insights on specific aspects of international market access for BRICS+ brands.

**Key Components**:
- Clear focus on one specific export challenge or opportunity
- Concrete examples from real situations
- Practical action steps or considerations
- Expert perspectives where possible

**Content Ideas**:
- "Packaging Adaptation: How to Prepare Your Product for Western Retail Environments"
- "Certification Roadmap: Key Approvals BRICS Brands Need for EU Market Entry"
- "Price Positioning Strategies for Brazilian Gourmet Products in North America"

**Content Creation Tip**:
For these posts, focus on specific challenges and practical solutions rather than general information. Include at least one concrete example that illustrates your points.

### 3. Cultural Context

**Content Approach**:
Explore how cultural factors influence product development, design, and market reception for BRICS+ consumer brands.

**Key Components**:
- Focus on one specific cultural factor or tradition
- How it manifests in consumer products
- Why understanding this factor matters for international partners
- Visual examples where possible

**Content Ideas**:
- "The Cultural Significance of Red in Chinese Consumer Packaging"
- "How Indian Festival Traditions Shape Seasonal Product Development"
- "Understanding Russian Gifting Culture: Implications for Product Presentation"

**Content Creation Tip**:
For these posts, look for interesting cultural insights that might not be obvious to international audiences but would affect how products are received.

### 4. Success Stories

**Content Approach**:
Case studies of BRICS+ brands that have successfully expanded internationally, with analysis of their approach.

**Key Components**:
- Brand background and domestic position
- International expansion strategy
- Challenges encountered and how they were overcome
- Key success factors
- Current international standing

**Content Ideas**:
- "From São Paulo to Global Phenomenon: The Havaianas Expansion Story"
- "Xiaomi's Strategic Shift from Tech Brand to Lifestyle Ecosystem"
- "How Russian Chocolate Brand Korkunov Built International Credibility"

**Content Creation Tip**:
For these posts, try to include specific strategic decisions and their outcomes. Where possible, incorporate quotes or insights directly from company representatives.

## Technical Tips for Efficient Blog Management

### Jekyll-Specific Implementation

1. **Use Front Matter Effectively**:
   ```yaml
   ---
   layout: post
   title: "Russian Craft Vodka Renaissance"
   author: "Founder Name"
   date: 2025-03-16
   categories: [brand-discoveries]
   lang: en
   image: "/assets/images/blog/russian-vodka-brands.jpg"
   excerpt: "Discover how small-batch Russian distilleries are transforming vodka from commodity to craft."
   ---
   ```

2. **Create Post Includes for Common Elements**:
   Create `_includes/post-card.html`:
   ```html
   <div class="post-card">
     {% if include.post.image %}
     <div class="post-image">
       <img src="{{ include.post.image | relative_url }}" alt="{{ include.post.title }}">
     </div>
     {% endif %}
     <h3><a href="{{ include.post.url | relative_url }}">{{ include.post.title }}</a></h3>
     <p class="post-meta">{{ include.post.date | date: "%B %-d, %Y" }}</p>
     <p>{{ include.post.excerpt }}</p>
     <a href="{{ include.post.url | relative_url }}" class="read-more">Read more</a>
   </div>
   ```

3. **Simplify Multilingual Implementation**:
   Use conditional inclusion in your templates:
   ```html
   {% assign posts = site.posts | where:"lang", page.lang | where:"categories", "brand-discoveries" %}
   ```

### Image Management

1. **Create a consistent directory structure**:
   ```
   assets/images/blog/
   ├── brand-discoveries/
   ├── export-opportunities/
   ├── cultural-context/
   └── success-stories/
   ```

2. **Use responsive images** with the Jekyll Picture Tag plugin if needed

3. **Standardize image sizes** to maintain consistent layout:
   - Featured images: 1200×630px
   - In-content images: 800px wide

### Tracking and Analytics

1. **Add Google Analytics** to track page visits and user behavior

2. **Implement UTM parameters** for social sharing:
   ```
   https://brandmine.io/blog/post-title/?utm_source=linkedin&utm_medium=social&utm_campaign=blog
   ```

3. **Create a simple tracking spreadsheet** to monitor:
   - Post publication dates
   - Categories
   - Page views
   - Average time on page
   - Social shares

## Getting Started: Your First Week Action Plan

### Day 1: Technical Setup
- Create blog directory structure
- Set up layouts and includes
- Add CSS for blog styling

### Day 2: Category Structure
- Create category pages
- Set up blog index page
- Test the structure with a placeholder post

### Day 3-4: First Post Development
- Research for your first "Brand Discoveries" post
- Collaborate with Claude to draft the content
- Finalize and publish the post

### Day 5: Review and Planning
- Check analytics setup is working properly
- Plan your next three posts (one per remaining category)
- Create a simple 3-month content calendar

## Key Success Metrics for Your MVP Blog

Since this is an MVP focused on customer discovery, focus on these qualitative metrics rather than traffic numbers:

1. **Engagement quality**: Comments and direct responses from target users
2. **Relationship development**: New connections made through content sharing
3. **Content effectiveness**: Which posts generate the most meaningful conversations
4. **Problem validation**: Which pain points resonate most based on feedback
5. **Lead generation**: Inquiries and relationships developed from blog content

## Conclusion

This value-focused category structure allows you to launch a meaningful blog with minimal resources while still demonstrating Brandmine's unique value proposition. By starting with just one strong post per category and growing thoughtfully, you can build a valuable resource that supports your customer discovery goals without overwhelming your capacity.

Remember that an MVP blog should prioritize learning over perfection. Each post is an opportunity to test assumptions about your audience's interests and needs, helping you refine your overall business proposition while building relationships with potential users.
