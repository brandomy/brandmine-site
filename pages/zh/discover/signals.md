---
layout: discover
title: 信号
subtitle: 识别具有特定业务就绪指标的品牌
permalink: /zh/discover/signals/
ref: signals
discovery_path: signals
lang: zh
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary signals__title">{{ page.title }}</h1>
    <p class="panel__subtitle">{{ page.subtitle }}</p>
  </div>
</div>

<!-- All Signals Grid Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <!-- About Growth Signals Section -->
    <section class="signals__section">
      <div class="signals__section-header">
        <h2 class="signals__section-title">
          <span class="signals__icon signals__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </span>
          了解增长信号
        </h2>
        <p class="signals__section-description">表明品牌已准备好进行国际扩张和投资的指标</p>
      </div>
      
      <div class="signals-about">
        <p class="signals-about__text">
          增长信号有助于识别具有强大国际扩张、投资或合作伙伴关系潜力的品牌。这些指标基于我们对市场就绪性、业务成熟度和跨境潜力的专有分析。
        </p>
        
        <div class="signals-about__premium">
          <div class="signals-about__premium-content">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 15V3m0 12l-4-4m4 4l4-4M2 17l.621 2.485A2 2 0 0 0 4.561 21h14.878a2 2 0 0 0 1.94-1.515L22 17"></path>
            </svg>
            <div>
              <h3 class="signals-about__premium-title">高级功能</h3>
              <p class="signals-about__premium-text">详细的增长信号数据和高级筛选功能需要高级访问权限。</p>
            </div>
          </div>
          <a href="{{ site.baseurl }}/{{ page.lang }}/premium/" class="btn btn-primary btn-sm">升级至高级版</a>
        </div>
      </div>
    </section>
    
    <!-- All Signals Grid -->
    <section class="signals__section">
      <div class="signals__section-header">
        <h2 class="signals__section-title">
          <span class="signals__icon signals__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </span>
          所有增长信号
        </h2>
        <p class="signals__section-description">根据品牌的增长指标进行探索</p>
      </div>
      
      <div class="signals__grid">
        {% for signal in site.data.translations[page.lang].signals %}
          {% assign slug = signal[0] %}
          {% assign name = signal[1] %}
          {% assign brand_count = site.brands | where: "lang", page.lang | where_exp: "brand", "brand.signals contains name" | size %}
          
          <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/{{ slug }}/" class="signals__item signals__item--signal">
            <div class="signals__item-content">
              <h3 class="signals__item-title">{{ name }}</h3>
              <div class="signals__item-meta">
                <span class="signals__item-count">{{ brand_count }} 个品牌</span>
              </div>
              <div class="signals__item-icon">
                {% if slug == "international-ready" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10"></circle>
                    <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
                  </svg>
                {% elsif slug == "investment-ready" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 2v4M12 18v4M4.93 4.93l2.83 2.83M16.24 16.24l2.83 2.83M2 12h4M18 12h4M4.93 19.07l2.83-2.83M16.24 7.76l2.83-2.83"></path>
                  </svg>
                {% elsif slug == "rapid-growth" %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M23 6l-9.5 9.5-5-5L1 18"></path>
                    <path d="M17 6h6v6"></path>
                  </svg>
                {% else %}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
                  </svg>
                {% endif %}
              </div>
            </div>
          </a>
        {% endfor %}
      </div>
    </section>
    
    <!-- Signal Categories Section -->
    <section class="signals__section">
      <div class="signals__section-header">
        <h2 class="signals__section-title">
          <span class="signals__icon signals__icon--all">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </span>
          信号类别
        </h2>
        <p class="signals__section-description">探索按类别分组的增长信号</p>
      </div>
      
      <!-- International Readiness -->
      <div class="signal-category">
        <h3 class="signal-category__title">国际准备度</h3>
        <div class="signal-category__tags">
          {% for signal in site.data.translations[page.lang].signals %}
            {% assign slug = signal[0] %}
            {% assign name = signal[1] %}
            {% if slug == "international-ready" or slug == "export-experience" or slug == "cross-cultural-appeal" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/{{ slug }}/" class="tag tag--signal">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
      
      <!-- Investment Potential -->
      <div class="signal-category">
        <h3 class="signal-category__title">投资潜力</h3>
        <div class="signal-category__tags">
          {% for signal in site.data.translations[page.lang].signals %}
            {% assign slug = signal[0] %}
            {% assign name = signal[1] %}
            {% if slug == "investment-ready" or slug == "expansion-phase" or slug == "acquisition-target" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/{{ slug }}/" class="tag tag--signal">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
      
      <!-- Market Performance -->
      <div class="signal-category">
        <h3 class="signal-category__title">市场表现</h3>
        <div class="signal-category__tags">
          {% for signal in site.data.translations[page.lang].signals %}
            {% assign slug = signal[0] %}
            {% assign name = signal[1] %}
            {% if slug == "rapid-growth" or slug == "award-winning" or slug == "market-leader" %}
              <a href="{{ site.baseurl }}/{{ page.lang }}/discover/signals/{{ slug }}/" class="tag tag--signal">
                {{ name }}
              </a>
            {% endif %}
          {% endfor %}
        </div>
      </div>
    </section>
    
    <!-- Related Insights Section -->
    <section class="signals__section">
      <div class="signals__section-header">
        <h2 class="signals__section-title">
          <span class="signals__icon signals__icon--insights">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2a3 3 0 0 0 0 6 3 3 0 0 0 0-6z"></path>
              <path d="M19 9H5a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2z"></path>
              <path d="M12 18v3M8 18v3M16 18v3"></path>
            </svg>
          </span>
          增长洞察
        </h2>
        <p class="signals__section-description">阅读我们关于品牌增长和扩张的最新分析</p>
      </div>
      
      <div class="signals__insights">
        {% assign signal_insights = site.insights | where: "lang", page.lang | where: "category", "signal" | sort: "date" | reverse | limit: 2 %}
        {% if signal_insights.size > 0 %}
          <div class="signals__insights-grid">
            {% for insight in signal_insights %}
              {% include insight-card.html insight=insight %}
            {% endfor %}
          </div>
        {% else %}
          <div class="signals__empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="1.5">
              <path d="M19 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z"></path>
              <path d="M8 10h8M8 14h8"></path>
            </svg>
            <p>{{ site.data.translations[page.lang].insights.no_insights }}</p>
          </div>
        {% endif %}
        
        <div class="signals__section-action">
          <a href="{{ site.baseurl }}/{{ page.lang }}/insights/?category=signal" class="btn btn-secondary">查看所有增长洞察</a>
        </div>
      </div>
    </section>
    
    <!-- All Categories Link Panel -->
    <div class="signals__navigation">
      <h3 class="signals__navigation-title">探索其他维度</h3>
      <div class="signals__navigation-links">
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/sectors/" class="signals__navigation-link signals__navigation-link--sector">
          <span class="signals__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M2 20h20M5 20V8h3m4 12V4h3m4 16v-6h3"></path>
            </svg>
          </span>
          行业
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/russian-sectors/" class="signals__navigation-link signals__navigation-link--sector">
          <span class="signals__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 3h18v18H3V3zm4 4h4v4H7V7zm0 6h4v4H7v-4zm6-6h4v4h-4V7zm6 0h2v2h-2V7zm-6 6h4v4h-4v-4z"></path>
            </svg>
          </span>
          俄罗斯行业
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/markets/" class="signals__navigation-link signals__navigation-link--market">
          <span class="signals__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10a15.3 15.3 0 0 1-4-10a15.3 15.3 0 0 1 4-10z"></path>
            </svg>
          </span>
          市场
        </a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/discover/attributes/" class="signals__navigation-link signals__navigation-link--attribute">
          <span class="signals__navigation-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 7h16M4 12h16M4 17h10"></path>
            </svg>
          </span>
          特性
        </a>
      </div>
    </div>
  </div>
</div>