---
layout: brands
title: 品牌
permalink: /zh/brands/
lang: zh
ref: brands
sections:
  - breadcrumbs
  - hero
  - intro
  - search
  - features
  - brands-grid
  - featured-brands
  - recent-brands
  - find-partner
  - contact-cta
---

<!-- Hero Panel -->
<div class="panel panel--hero">
  <div class="panel__content">
    <h1 class="panel__heading-primary brands__title">探索金砖国家+领先消费品牌</h1>
    <p class="panel__subtitle">突破障碍，发现您的下一个机遇</p>
  </div>
</div>

<!-- Introduction Panel -->
<div class="panel panel--light brands-panel">
  <div class="panel__content">
    <p class="panel__lead-text">Brandmine提供前所未有的访问渠道，让您了解那些在金砖国家+市场已证明成功但因语言、政治和文化障碍而在国际上尚未被发现的消费品牌。</p>
  </div>
</div>

<!-- Search Panel - NEW -->
<div class="panel panel--primary-soft brands-panel">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">搜索我们的品牌数据库</h2>
    <p class="panel__lead-text">正在寻找特定品牌？使用我们的搜索功能找到您需要的内容。</p>

    <div class="brands__search-container">
      <form action="{{ site.baseurl }}/{{ page.lang }}/search/" method="get" class="brands__search-form">
        <input type="text" name="q" class="brands__search-input" placeholder="{{ site.data.translations[page.lang].search.placeholder }}" aria-label="搜索品牌">
        <button type="submit" class="brands__search-button">
          <i class="fas fa-search"></i>
          {{ site.data.translations[page.lang].search.button }}
        </button>
      </form>
    </div>

    <div class="brands__search-suggestions">
      <p class="brands__search-suggestions-title">{{ site.data.translations[page.lang].search.popular_searches }}</p>
      <div class="brands__search-tags">
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=葡萄酒" class="brands__search-tag">葡萄酒</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=美容" class="brands__search-tag">美容</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=创始人" class="brands__search-tag">创始人领导</a>
        <a href="{{ site.baseurl }}/{{ page.lang }}/search/?q=莫斯科" class="brands__search-tag">莫斯科</a>
      </div>
    </div>
  </div>
</div>

<!-- Brand Profiles Panel -->
<div class="panel panel--primary-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">丰富的品牌简介</h2>
    <p class="panel__lead-text">我们精心策划的品牌简介超越基本公司信息，揭示：</p>

    <div class="brands__features-list">
      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><line x1="10" y1="9" x2="8" y2="9"></line></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">创立故事</h3>
          <p class="brands__feature-text">每个品牌背后的愿景和历程</p>
        </div>
      </div>

      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="4"></circle><line x1="21.17" y1="8" x2="12" y2="8"></line><line x1="3.95" y1="6.06" x2="8.54" y2="14"></line><line x1="10.88" y1="21.94" x2="15.46" y2="14"></line></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">视觉形象</h3>
          <p class="brands__feature-text">品牌资产、包装和产品图像</p>
        </div>

        </div>

      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="20" x2="12" y2="10"></line><line x1="18" y1="20" x2="18" y2="4"></line><line x1="6" y1="20" x2="6" y2="16"></line><rect x="2" y="20" width="20" height="2" rx="1"></rect></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">市场定位</h3>
          <p class="brands__feature-text">竞争格局和消费者关系</p>
        </div>
      </div>

      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">核心人员</h3>
          <p class="brands__feature-text">领导层和决策者</p>
        </div>
      </div>

      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"></path></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">增长轨迹</h3>
          <p class="brands__feature-text">历史里程碑和未来方向</p>
        </div>
      </div>

      <div class="brands__feature-item">
        <div class="brands__feature-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
        </div>
        <div class="brands__feature-content">
          <h3 class="brands__feature-title">市场布局</h3>
          <p class="brands__feature-text">位置情报与零售网点</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Featured Brands Panel -->
<div class="panel panel--light">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">精选品牌</h2>

    <div class="brands__grid">
      <!-- This will be populated dynamically in the future -->
      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">品牌名称</h3>
        <p>品牌简短描述，突出其独特卖点和起源。</p>
        <div class="brands__meta">
          <span class="brands__tag--country">俄罗斯</span>
          <span class="brands__tag--sector">手工食品</span>
        </div>
      </div>

      <!-- Add 2 more placeholder cards -->
      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">品牌名称</h3>
        <p>品牌简短描述，突出其独特卖点和起源。</p>
        <div class="brands__meta">
          <span class="brands__tag--country">巴西</span>
          <span class="brands__tag--sector">天然美容</span>
        </div>
      </div>

      <div class="brands__card">
        <div class="brands__logo-placeholder"></div>
        <h3 class="brands__card-title">品牌名称</h3>
        <p>品牌简短描述，突出其独特卖点和起源。</p>
        <div class="brands__meta">
          <span class="brands__tag--country">印度</span>
          <span class="brands__tag--sector">时尚</span>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Find Your Partner Panel -->
<div class="panel panel--accent-soft">
  <div class="panel__content">
    <h2 class="panel__heading-secondary">寻找您的下一个合作伙伴</h2>
    <p class="panel__lead-text">使用我们的高级搜索和过滤工具，按以下条件查找品牌：</p>

    <div class="brands__filters">
      <div class="brands__filter">原产地市场</div>
      <div class="brands__filter">行业领域</div>
      <div class="brands__filter">信号指标</div>
      <div class="brands__filter">品牌属性</div>
    </div>

    <div class="brands__cta">
      <button id="database-button" class="btn btn--primary-cta" onclick="trackButtonClick(this)">启动交互式数据库</button>
      <div id="button-feedback" class="brands__feedback" style="display: none; margin-top: var(--space-2); color: var(--primary-600);">
        即将推出！我们正在开发此功能。
      </div>
    </div>
  </div>
</div>

<!-- Contact CTA Panel -->
<div class="panel panel--cta">
  <div class="panel__content panel--centered">
    <h2 class="panel__heading-secondary">准备探索金砖国家+品牌？</h2>
    <p class="panel__lead-text">联系我们，了解更多关于我们精选品牌的信息或讨论您的具体需求。</p>
    <div class="cta-buttons">
      <a href="{{ site.baseurl }}/{{ page.lang }}/about/#contact" class="btn btn--secondary-cta">联系我们</a>
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
