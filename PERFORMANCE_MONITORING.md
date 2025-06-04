# 🚀 Performance Monitoring Setup

**Status**: ✅ **FULLY CONFIGURED**

This document outlines the comprehensive performance monitoring implementation for the Brandmine Jekyll site.

## 📊 Overview

Performance monitoring has been implemented using **Lighthouse CI** with automated testing on every pull request. The system tracks key performance metrics and enforces performance budgets to catch regressions as the site scales.

## 🛠️ Configuration Files

### 1. Lighthouse CI Configuration (`.lighthouserc.json`)
**Purpose**: Main configuration for Lighthouse CI with performance budgets and assertions

**Key Features**:
- Tests 7 critical pages (home, brands, founders, discovery, insights, sample profiles)
- Runs 3 times per page for reliable results
- Enforces strict performance budgets
- Includes accessibility, SEO, and best practices checks

**Performance Budgets**:
- Performance Score: >90%
- First Contentful Paint: <2s
- Largest Contentful Paint: <3s
- Cumulative Layout Shift: <0.1
- Speed Index: <3.5s
- Total Blocking Time: <300ms

### 2. Resource Budgets (`lighthouse-budget.json`)
**Purpose**: Detailed resource size and count budgets per page type

**Budgets Include**:
- Total page weight: <1.6MB
- CSS files: <100KB
- JavaScript files: <200KB
- Images: <800KB
- Fonts: <200KB

### 3. GitHub Actions Workflows

#### **Lighthouse CI Workflow** (`.github/workflows/lighthouse-ci.yml`)
- **Triggers**: Pull requests, workflow dispatch
- **Matrix Strategy**: Mobile and desktop testing
- **Features**: 
  - Automatic Jekyll build
  - Lighthouse CI execution with proper throttling
  - Results uploaded as artifacts
  - PR comments with performance summary

#### **Performance Check Workflow** (`.github/workflows/performance-check.yml`)
- **Triggers**: Push to main, PR, weekly schedule
- **Features**:
  - Bundle size analysis
  - Image optimization check
  - Font loading analysis
  - HTML structure validation
  - Performance recommendations

## 📈 Performance Targets

### Core Web Vitals
| Metric | Target | Budget Level |
|--------|--------|--------------|
| **First Contentful Paint** | <2s | Error |
| **Largest Contentful Paint** | <3s | Error |
| **Cumulative Layout Shift** | <0.1 | Error |
| **Speed Index** | <3.5s | Error |
| **Total Blocking Time** | <300ms | Error |

### Overall Scores
| Category | Target | Budget Level |
|----------|--------|--------------|
| **Performance** | >90% | Error |
| **Accessibility** | >95% | Error |
| **Best Practices** | >90% | Error |
| **SEO** | >95% | Error |

### Resource Budgets
| Resource Type | Budget | Pages |
|---------------|--------|-------|
| **Total Size** | 1.6MB | All pages |
| **CSS** | 100KB | All pages |
| **JavaScript** | 200KB | All pages |
| **Images** | 800KB | All pages |
| **Fonts** | 200KB | All pages |

## 🔧 Local Testing

### Install Dependencies
```bash
npm install @lhci/cli
```

### Run Performance Audit
```bash
# Build site and run full Lighthouse audit
npm run perf:audit

# Run Lighthouse CI only
npm run lighthouse

# Build production version
npm run build:prod
```

### Test Configuration
```bash
# Test with relaxed budgets
lhci autorun --config=.lighthouserc.test.json
```

## 🎯 CI/CD Integration

### Pull Request Flow
1. **Trigger**: PR created/updated affecting performance-related files
2. **Build**: Jekyll site built in production mode
3. **Test**: Lighthouse CI runs on mobile and desktop
4. **Report**: Results posted as PR comment and uploaded as artifacts
5. **Gates**: Performance budgets must pass for PR approval

### Monitored File Paths
- `assets/**` - CSS, JS, images, fonts
- `_includes/**` - Layout components
- `_layouts/**` - Page layouts
- `pages/**` - Content pages
- `_brands/**`, `_founders/**`, `_insights/**` - Content collections
- `_config.yml` - Site configuration
- `Gemfile*` - Dependencies
- `.lighthouserc.json` - Performance configuration

### Artifacts
- Lighthouse reports (30-day retention)
- Performance metrics JSON
- Bundle size analysis
- Image optimization report

## 📱 Mobile vs Desktop Testing

### Mobile Configuration
- **Emulation**: Mobile device
- **Throttling**: 4x CPU slowdown, Slow 3G (1.6 Mbps)
- **Network**: 150ms RTT
- **Focus**: Touch interfaces, mobile-first design

### Desktop Configuration  
- **Emulation**: Desktop device
- **Throttling**: 1x CPU, Fast connection (10 Mbps)
- **Network**: 40ms RTT
- **Focus**: Large screen optimization, desktop features

## 🚨 Performance Budget Enforcement

### Error Level (Blocks PR)
- Performance score below 90%
- Core Web Vitals exceeding targets
- Unminified CSS/JavaScript
- Missing font-display optimization

### Warning Level (Requires Review)
- Unused CSS/JavaScript above thresholds
- Large images (>500KB)
- DOM size over 1,500 elements
- Total page weight approaching 1.6MB

## 📊 Monitoring Pages

The system monitors these critical user journeys:

1. **Homepage** (`/en/`) - First impression, hero content
2. **Brands Directory** (`/en/brands/`) - Main discovery page with filtering
3. **Founders Directory** (`/en/founders/`) - Founder profiles with search
4. **Discovery Hub** (`/en/discovery/`) - Dimension-based navigation
5. **Insights Hub** (`/en/insights/`) - Content and blog functionality
6. **Brand Profile** (`/en/brands/ru-teatime/`) - Detailed brand showcase
7. **Founder Profile** (`/en/founders/ru-alexei-sokolov/`) - Individual founder story

## 🔄 Weekly Reports

Automated weekly performance reports run every Sunday at 3 AM UTC, providing:
- Performance trend analysis
- Bundle size tracking
- Image optimization opportunities
- Font loading recommendations
- Overall site health metrics

## 🎯 Best Practices Integration

### Image Optimization
- Use `_scripts/core/process_images.sh` for image processing
- Maintain 3:2, 2:3, and 1:1 aspect ratios
- Target <500KB per image
- Implement responsive image sets

### CSS Optimization
- Follow BEM methodology for maintainable CSS
- Use CSS custom properties for consistent theming
- Monitor unused CSS with Lighthouse CI
- Consider critical CSS extraction for above-the-fold content

### JavaScript Performance
- Utilize the centralized main.js initialization system
- Implement conditional component loading
- Use intersection observers for lazy loading
- Monitor Total Blocking Time for JavaScript efficiency

## 🚀 Future Enhancements

### Immediate Opportunities
1. **Critical CSS**: Extract above-the-fold CSS for faster rendering
2. **Service Worker**: Implement caching for repeat visits
3. **Image Formats**: WebP/AVIF format adoption
4. **Code Splitting**: Dynamic imports for page-specific JavaScript

### Advanced Monitoring
1. **Real User Monitoring (RUM)**: Track actual user performance
2. **Performance Analytics**: User experience correlation
3. **Regional Testing**: Performance across BRICS+ markets
4. **A/B Testing**: Performance impact of design changes

## 📚 Resources

### Documentation
- [Lighthouse CI Documentation](https://github.com/GoogleChrome/lighthouse-ci)
- [Web Vitals Guide](https://web.dev/vitals/)
- [Performance Budgets](https://web.dev/performance-budgets-101/)

### Tools
- [PageSpeed Insights](https://pagespeed.web.dev/)
- [WebPageTest](https://www.webpagetest.org/)
- [Chrome DevTools Performance Panel](https://developer.chrome.com/docs/devtools/performance/)

---

**Implementation Date**: January 4, 2025  
**Last Updated**: January 4, 2025  
**Status**: Production Ready ✅