---
layout: discover
title: 行业
subtitle: 在各种行业类别和产品类型中寻找品牌
permalink: /zh/discover/sectors/
ref: sectors
discovery_path: sectors
lang: zh
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary sectors__title">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- All Sectors Grid Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- All Sectors Grid -->
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          所有行业
        </h2>
        <p class="sectors__section-description">探索我们数据库中所有可用的商业行业</p>
      </div>
      
      <div class="sectors__grid">
        {% for sector in site.data.translations[page.lang].sectors %}
          {% assign slug = sector[0] %}
          {% assign name = sector[1] %}
          {% assign brand_count = site.brands | where: "lang", page.lang | where: "sector", name | size %}
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/{{ slug }}/" class="sectors__item sectors__item--sector">
            <div class="sectors__item-content">
              <h3 class="sectors__item-title">{{ name }}</h3>
              <div class="sectors__item-meta">
                <span class="sectors__item-count">{{ brand_count }} 个品牌</span>
              </div>
              <div class="sectors__item-icon">
                {% if slug == "hotels-resorts" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 14h18M3 14v7h18v-7M3 21V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v9m0-9h10a2 2 0 0 1 2 2v9"></path>
                  </svg>
                {% elsif slug == "wine" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M8 22h8M12 11v11M7 1h10l-3 10H10L7 1z"></path>
                  </svg>
                {% elsif slug == "artisanal-spirits" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M8 22h8M12 11v11M10 7a4 4 0 0 0 4 0M6 2h12l-1.5 7A4 4 0 0 1 12 13a4 4 0 0 1-4.5-4L6 2z"></path>
                  </svg>
                {% elsif slug == "natural-beauty" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 2a9 9 0 0 1 9 9c0 3.9-2 7-5 9-3 2-4 3-4 6h-4c0-3-1-4-4-6-3-2-5-5.1-5-9a9 9 0 0 1 9-9z"></path>
                  </svg>
                {% else %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
                  </svg>
                {% endif %}
              </div>
            </div>
          </a>
        {% endfor %}
      </div>
    </section>
  </div>
</div>

<!-- Russian Sectors Special Focus Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--russian">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          俄罗斯行业特别关注
        </h2>
        <p class="sectors__section-description">探索我们对16个有前景的俄罗斯消费品行业的深入分析</p>
      </div>
      
      <div class="sectors__featured">
        <div class="sectors__featured-item sectors__featured-item--special">
          <div class="sectors__featured-image">
            <img src="{{ site.baseurl }}/assets/images/sectors/russian-overview.jpg" alt="俄罗斯行业概览" class="sectors__featured-img" onerror="this.src='{{ site.baseurl }}/assets/images/sectors/confectionery.jpg'">
          </div>
          <div class="sectors__featured-content">
            <h3 class="sectors__featured-title">俄罗斯消费品牌行业</h3>
            <p class="sectors__featured-description">探索我们精心挑选的16个有前景的俄罗斯消费行业，从手工烈酒和天然美容产品到美食和酒店业。每个行业都提供独特的投资和合作机会，并有引人入胜的品牌故事。</p>
            <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="sectors__featured-link btn btn-outline">探索俄罗斯行业</a>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Featured Sectors Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--featured">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2l2.4 7.4h7.6l-6 4.6 2.3 7-6.3-4.6-6.3 4.6 2.3-7-6-4.6h7.6z"></path>
            </svg>
          </span>
          精选行业
        </h2>
        <p class="sectors__section-description">探索我们最重要的商业行业和最有前景的品牌</p>
      </div>
      
      <div class="sectors__featured">
        <div class="sectors__featured-grid">
          <!-- Featured Sector 1: Hotels & Resorts -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/hotels-resorts.jpg" alt="酒店和度假村" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">酒店和度假村</h3>
              <p class="sectors__featured-description">从历史悠久的城市物业到偏远的自然度假村，俄罗斯精品酒店和度假村提供展示该国惊人多样性的独特文化体验。</p>
              <div class="sectors__featured-meta">
                {% assign hotel_count = site.brands | where: "lang", page.lang | where: "sector", "酒店和度假村" | size %}
                <span class="sectors__featured-count">{{ hotel_count }} 个品牌</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/hotels-resorts/" class="sectors__featured-link btn btn-outline">探索酒店和度假村</a>
            </div>
          </div>
          
          <!-- Featured Sector 2: Artisanal Spirits & Vodka -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/artisanal-spirits.jpg" alt="手工烈酒和伏特加" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">手工烈酒和伏特加</h3>
              <p class="sectors__featured-description">俄罗斯正经历手工烈酒的复兴：过去十年涌现了80多家新的高端酒厂，创造出具有引人入胜故事的独特产品。</p>
              <div class="sectors__featured-meta">
                {% assign spirits_count = site.brands | where: "lang", page.lang | where: "sector", "手工烈酒和伏特加" | size %}
                <span class="sectors__featured-count">{{ spirits_count }} 个品牌</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/artisanal-spirits/" class="sectors__featured-link btn btn-outline">探索手工烈酒</a>
            </div>
          </div>
          
          <!-- Featured Sector 3: Natural Beauty Products -->
          <div class="sectors__featured-item">
            <div class="sectors__featured-image">
              <img src="{{ site.baseurl }}/assets/images/sectors/natural-beauty.jpg" alt="天然美容产品" class="sectors__featured-img">
            </div>
            <div class="sectors__featured-content">
              <h3 class="sectors__featured-title">天然美容产品</h3>
              <p class="sectors__featured-description">俄罗斯天然美容行业利用该国丰富的植物资源，特别是来自西伯利亚和远东地区，那里的植物发展出强大的生物活性化合物。</p>
              <div class="sectors__featured-meta">
                {% assign beauty_count = site.brands | where: "lang", page.lang | where: "sector", "天然美容产品" | size %}
                <span class="sectors__featured-count">{{ beauty_count }} 个品牌</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/natural-beauty/" class="sectors__featured-link btn btn-outline">探索天然美容产品</a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Related Insights Panel -->
<div class="panel panel--accent-soft">
  <div class="panel__content">
    <section class="sectors__section">
      <div class="sectors__section-header">
        <h2 class="sectors__section-title">
          <span class="sectors__icon sectors__icon--insights">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2a3 3 0 0 0 0 6 3 3 0 0 0 0-6z"></path>
              <path d="M19 9H5a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2z"></path>
              <path d="M12 18v3M8 18v3M16 18v3"></path>
            </svg>
          </span>
          行业洞察
        </h2>
        <p class="sectors__section-description">阅读我们关于金砖+国家商业行业的最新分析和故事</p>
      </div>
      
      <div class="sectors__insights">
        {% assign all_insights = site.insights | default: empty %}
        {% assign sector_insights = all_insights | where: "lang", page.lang | where: "category", "sector" | sort: "date" | reverse | limit: 2 %}
        {% if sector_insights.size > 0 %}
          <div class="sectors__insights-grid">
            {% for insight in sector_insights %}
              {% include components/cards/insight-card.html insight=insight %}
            {% endfor %}
          </div>
        {% else %}
          <div class="sectors__empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z"></path>
              <path d="M8 10h8M8 14h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].insights.no_insights }}</p>
          </div>
        {% endif %}
        
        <div class="sectors__section-action">
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/?category=sector" class="btn btn--secondary-cta">查看所有行业洞察</a>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- All Categories Link Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <div class="sectors__navigation">
      <h3 class="sectors__navigation-title">探索其他维度</h3>
      <div class="sectors__navigation-links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="sectors__navigation-link sectors__navigation-link--russian-sectors">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          俄罗斯行业
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="sectors__navigation-link sectors__navigation-link--market">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10a15.3 15.3 0 0 1-4-10a15.3 15.3 0 0 1 4-10z"></path>
            </svg>
          </span>
          市场
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="sectors__navigation-link sectors__navigation-link--attribute">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          属性
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="sectors__navigation-link sectors__navigation-link--signal">
          <span class="sectors__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </span>
          增长信号
        </a>
      </div>
    </div>
  </div>
</div>