---
layout: discover
title: 品牌特性
subtitle: 按照品牌的独特品质和特征发现品牌
permalink: /zh/discover/attributes/
ref: attributes
discovery_path: attributes
lang: zh
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary attributes__title">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- All Attributes Grid Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- All Attributes Grid -->
    <section class="attributes__section">
      <div class="attributes__section-header">
        <h2 class="attributes__section-title">
          <span class="attributes__icon attributes__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          所有品牌特性
        </h2>
        <p class="attributes__section-description">发现具有不同特性的品牌，从创始人领导到艺术卓越</p>
      </div>
      
      <div class="attributes__grid">
        {% for attribute in site.data.translations[page.lang].attributes %}
          {% assign slug = attribute[0] %}
          {% assign name = attribute[1] %}
          {% assign brand_count = site.brands | where: "lang", page.lang | where_exp: "brand", "brand.attributes contains name" | size %}
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="attributes__item attributes__item--attribute">
            <div class="attributes__item-content">
              <h3 class="attributes__item-title">{{ name }}</h3>
              <div class="attributes__item-meta">
                <span class="attributes__item-count">{{ brand_count }} 个品牌</span>
              </div>
              <div class="attributes__item-icon">
                {% if slug == "founder-led" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="7" r="4"></circle>
                    <path d="M12 11l-2 4 2 2 2-2-2-4z"></path>
                    <path d="M10 15l-2.5 2m8.5-2l2.5 2M5.5 21h13"></path>
                  </svg>
                {% elsif slug == "heritage-brand" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10"></circle>
                    <path d="M12 6v6l4 2"></path>
                  </svg>
                {% elsif slug == "artisanal-excellence" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M9 5H7a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-2M9 5a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2M9 5a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2"></path>
                    <path d="M9 14l2 2 4-4"></path>
                  </svg>
                {% elsif slug == "sustainability-pioneer" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 22c5 0 9-4 9-9a9 9 0 0 0-9-9c-5 0-9 7-9 7s4 11 9 11z"></path>
                    <path d="M12 16a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path>
                  </svg>
                {% else %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M4 7h16M4 12h16M4 17h10"></path>
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

<!-- Attribute Categories Panel -->
<div class="panel panel--secondary-soft">
  <div class="panel__content">
    <section class="attributes__section">
      <div class="attributes__section-header">
        <h2 class="attributes__section-title">
          <span class="attributes__icon attributes__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          特性类别
        </h2>
        <p class="attributes__section-description">按主题分类探索品牌特性</p>
      </div>
      
      <div class="attribute-category">
        <h3 class="attribute-category__title">商业特征</h3>
        <div class="attribute-category__tags">
          {% for attribute in site.data.translations[page.lang].attributes %}
            {% assign slug = attribute[0] %}
            {% assign name = attribute[1] %}
            {% if slug == "founder-led" or slug == "family-owned" or slug == "heritage-brand" or slug == "award-winning" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="tag tag--attribute">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
      
      <div class="attribute-category">
        <h3 class="attribute-category__title">可持续发展与道德</h3>
        <div class="attribute-category__tags">
          {% for attribute in site.data.translations[page.lang].attributes %}
            {% assign slug = attribute[0] %}
            {% assign name = attribute[1] %}
            {% if slug == "sustainable" or slug == "eco-friendly" or slug == "ethical-production" or slug == "fair-trade" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="tag tag--attribute">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
      
      <div class="attribute-category">
        <h3 class="attribute-category__title">生产方法</h3>
        <div class="attribute-category__tags">
          {% for attribute in site.data.translations[page.lang].attributes %}
            {% assign slug = attribute[0] %}
            {% assign name = attribute[1] %}
            {% if slug == "handcrafted" or slug == "small-batch" or slug == "traditional-methods" or slug == "artisanal" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/{{ slug }}/" class="tag tag--attribute">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
    </section>
  </div>
</div>

<!-- Featured Attributes Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <section class="attributes__section">
      <div class="attributes__section-header">
        <h2 class="attributes__section-title">
          <span class="attributes__icon attributes__icon--featured">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2l2.4 7.4h7.6l-6 4.6 2.3 7-6.3-4.6-6.3 4.6 2.3-7-6-4.6h7.6z"></path>
            </svg>
          </span>
          精选特性
        </h2>
        <p class="attributes__section-description">探索最具特色和突出的品牌特质</p>
      </div>
      
      <div class="attributes__featured">
        <div class="attributes__featured-grid">
          <!-- Featured Attribute 1: Founder-Led -->
          <div class="attributes__featured-item">
            <div class="attributes__featured-image">
              <img src="{{ site.baseurl }}/assets/images/attributes/founder-led.jpg" alt="创始人领导" class="attributes__featured-img">
            </div>
            <div class="attributes__featured-content">
              <h3 class="attributes__featured-title">创始人领导</h3>
              <p class="attributes__featured-description">由原始创始人仍积极参与管理的品牌，保持其初创愿景和价值观，通常在质量和真实性方面表现出更高的承诺。</p>
              <div class="attributes__featured-meta">
                {% assign founder_led_count = site.brands | where: "lang", page.lang | where_exp: "brand", "brand.attributes contains '创始人领导'" | size %}
                <span class="attributes__featured-count">{{ founder_led_count }} 个品牌</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/founder-led/" class="attributes__featured-link btn btn-outline">探索创始人领导的品牌</a>
            </div>
          </div>
          
          <!-- Featured Attribute 2: Heritage Brand -->
          <div class="attributes__featured-item">
            <div class="attributes__featured-image">
              <img src="{{ site.baseurl }}/assets/images/attributes/heritage-brand.jpg" alt="传统品牌" class="attributes__featured-img">
            </div>
            <div class="attributes__featured-content">
              <h3 class="attributes__featured-title">传统品牌</h3>
              <p class="attributes__featured-description">拥有悠久历史的品牌，通常持续数十年或数百年，传承丰富的文化遗产和工艺传统，在其所在地区具有深厚的文化意义。</p>
              <div class="attributes__featured-meta">
                {% assign heritage_count = site.brands | where: "lang", page.lang | where_exp: "brand", "brand.attributes contains '传统品牌'" | size %}
                <span class="attributes__featured-count">{{ heritage_count }} 个品牌</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/heritage-brand/" class="attributes__featured-link btn btn-outline">探索传统品牌</a>
            </div>
          </div>
          
          <!-- Featured Attribute 3: Artisanal Excellence -->
          <div class="attributes__featured-item">
            <div class="attributes__featured-image">
              <img src="{{ site.baseurl }}/assets/images/attributes/artisanal-excellence.jpg" alt="工艺卓越" class="attributes__featured-img">
            </div>
            <div class="attributes__featured-content">
              <h3 class="attributes__featured-title">工艺卓越</h3>
              <p class="attributes__featured-description">以卓越的手工艺和对细节的关注为特点的品牌，通常采用传统方法和技艺创造独特和高品质的产品。</p>
              <div class="attributes__featured-meta">
                {% assign artisanal_count = site.brands | where: "lang", page.lang | where_exp: "brand", "brand.attributes contains '工艺卓越'" | size %}
                <span class="attributes__featured-count">{{ artisanal_count }} 个品牌</span>
              </div>
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/artisanal-excellence/" class="attributes__featured-link btn btn-outline">探索工艺卓越的品牌</a>
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
    <section class="attributes__section">
      <div class="attributes__section-header">
        <h2 class="attributes__section-title">
          <span class="attributes__icon attributes__icon--insights">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2a3 3 0 0 0 0 6 3 3 0 0 0 0-6z"></path>
              <path d="M19 9H5a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2z"></path>
              <path d="M12 18v3M8 18v3M16 18v3"></path>
            </svg>
          </span>
          特性洞察
        </h2>
        <p class="attributes__section-description">阅读我们关于品牌特性和区别因素的最新分析和故事</p>
      </div>
      
      <div class="attributes__insights">
        {% assign attribute_insights = site.insights | where: "lang", page.lang | where: "category", "attribute" | sort: "date" | reverse | limit: 2 %}
        {% if attribute_insights.size > 0 %}
          <div class="attributes__insights-grid">
            {% for insight in attribute_insights %}
              {% include insight-card.html insight=insight %}
            {% endfor %}
          </div>
        {% else %}
          <div class="attributes__empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z"></path>
              <path d="M8 10h8M8 14h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].insights.no_insights }}</p>
          </div>
        {% endif %}
        
        <div class="attributes__section-action">
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/?category=attribute" class="btn btn-secondary">查看所有特性洞察</a>
        </div>
      </div>
    </section>
  </div>
</div>

<!-- All Categories Link Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <div class="attributes__navigation">
      <h3 class="attributes__navigation-title">探索其他维度</h3>
      <div class="attributes__navigation-links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="attributes__navigation-link attributes__navigation-link--sector">
          <span class="attributes__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          行业
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="attributes__navigation-link attributes__navigation-link--sector">
          <span class="attributes__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          俄罗斯行业
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="attributes__navigation-link attributes__navigation-link--market">
          <span class="attributes__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
            </svg>
          </span>
          市场
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/" class="attributes__navigation-link attributes__navigation-link--signal">
          <span class="attributes__navigation-icon">
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