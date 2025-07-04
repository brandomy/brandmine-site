---
layout: default
title: "Insight Category Component Demo"
permalink: /test/insight-category-demo/
language: en
---

<style>
/* Demo page specific styles */
.demo-section {
  margin: 2rem 0;
  padding: 1.5rem;
  background-color: var(--gray-50);
  border-radius: 8px;
  border-left: 4px solid var(--primary-500);
}

.demo-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  margin: 1rem 0;
}

.demo-item {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  padding: 1rem;
  background: white;
  border-radius: 6px;
  border: 1px solid var(--gray-200);
}

.demo-title {
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--gray-900);
  margin-bottom: 0.5rem;
}

.demo-description {
  color: var(--gray-600);
  font-size: 0.875rem;
  margin-bottom: 1rem;
}

.component-code {
  background-color: var(--gray-100);
  padding: 0.75rem;
  border-radius: 4px;
  font-family: monospace;
  font-size: 0.875rem;
  margin-top: 0.5rem;
  overflow-x: auto;
  border: 1px solid var(--gray-300);
}

.status-badge {
  display: inline-block;
  padding: 0.25rem 0.75rem;
  background-color: #d4edda;
  color: #155724;
  border-radius: 4px;
  font-size: 0.875rem;
  font-weight: 600;
  margin-bottom: 1rem;
}

.official-colors-banner {
  background: #fff3cd;
  border: 2px solid #ffc107;
  padding: 1.5rem;
  border-radius: 8px;
  margin: 2rem 0;
}

.color-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  margin-top: 1rem;
}

.card-example {
  background: white;
  padding: 1rem;
  border-radius: 8px;
  border: 1px solid var(--gray-200);
  min-width: 280px;
}
</style>

# Insight Category Component Demo


## Standard Categories

<div class="demo-section">
  <div class="demo-title">All Four Categories</div>
  <div class="demo-description">Official Brandmine insight categories with correct colors and icons</div>

  <div class="demo-grid">
    <div class="demo-item">
      <strong>Brand Spotlight:</strong>
      {% include components/ui/insight-category-new.html category="brand-spotlight" %}
      <div class="component-code">category="brand-spotlight"</div>

      <!-- Specifications Box -->
      <div style="background: var(--gray-100); padding: 0.75rem; border-radius: 4px; margin-top: 0.75rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-300);">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
          <div>
            <strong>Background:</strong> var(--secondary-100)<br>
            <strong>Text:</strong> var(--secondary-800)<br>
            <strong>Icon:</strong> Star (Lucide)
          </div>
          <div>
            <strong>Font Size:</strong> 0.875rem<br>
            <strong>Padding:</strong> 0.25rem 0.75rem<br>
            <strong>Border Radius:</strong> 9999px
          </div>
        </div>
      </div>

      <!-- File Sources Box -->
      <div style="background: var(--gray-200); padding: 0.75rem; border-radius: 4px; margin-top: 0.5rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-400);">
        <div style="font-family: monospace; color: var(--gray-700);">
          <strong>Component:</strong> _includes/components/ui/insight-category-new.html<br>
          <strong>CSS:</strong> assets/css/components/ui/insight-category-new.scss<br>
          <strong>Integration:</strong> All card variants use this component
        </div>
      </div>
    </div>

    <div class="demo-item">
      <strong>Founder's Journey:</strong>
      {% include components/ui/insight-category-new.html category="founders-journey" %}
      <div class="component-code">category="founders-journey"</div>

      <!-- Specifications Box -->
      <div style="background: var(--gray-100); padding: 0.75rem; border-radius: 4px; margin-top: 0.75rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-300);">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
          <div>
            <strong>Background:</strong> var(--accent-100)<br>
            <strong>Text:</strong> var(--accent-800)<br>
            <strong>Icon:</strong> User (Lucide)
          </div>
          <div>
            <strong>Font Size:</strong> 0.875rem<br>
            <strong>Padding:</strong> 0.25rem 0.75rem<br>
            <strong>Border Radius:</strong> 9999px
          </div>
        </div>
      </div>

      <!-- File Sources Box -->
      <div style="background: var(--gray-200); padding: 0.75rem; border-radius: 4px; margin-top: 0.5rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-400);">
        <div style="font-family: monospace; color: var(--gray-700);">
          <strong>Component:</strong> _includes/components/ui/insight-category-new.html<br>
          <strong>CSS:</strong> assets/css/components/ui/insight-category-new.scss<br>
          <strong>Integration:</strong> All card variants use this component
        </div>
      </div>
    </div>

    <div class="demo-item">
      <strong>Location Intelligence:</strong>
      {% include components/ui/insight-category-new.html category="location-intelligence" %}
      <div class="component-code">category="location-intelligence"</div>

      <!-- Specifications Box -->
      <div style="background: var(--gray-100); padding: 0.75rem; border-radius: 4px; margin-top: 0.75rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-300);">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
          <div>
            <strong>Background:</strong> var(--sky-100)<br>
            <strong>Text:</strong> var(--sky-800)<br>
            <strong>Icon:</strong> MapPin (Lucide)
          </div>
          <div>
            <strong>Font Size:</strong> 0.875rem<br>
            <strong>Padding:</strong> 0.25rem 0.75rem<br>
            <strong>Border Radius:</strong> 9999px
          </div>
        </div>
      </div>

      <!-- File Sources Box -->
      <div style="background: var(--gray-200); padding: 0.75rem; border-radius: 4px; margin-top: 0.5rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-400);">
        <div style="font-family: monospace; color: var(--gray-700);">
          <strong>Component:</strong> _includes/components/ui/insight-category-new.html<br>
          <strong>CSS:</strong> assets/css/components/ui/insight-category-new.scss<br>
          <strong>Integration:</strong> All card variants use this component
        </div>
      </div>
    </div>

    <div class="demo-item">
      <strong>Market Momentum:</strong>
      {% include components/ui/insight-category-new.html category="market-momentum" %}
      <div class="component-code">category="market-momentum"</div>

      <!-- Specifications Box -->
      <div style="background: var(--gray-100); padding: 0.75rem; border-radius: 4px; margin-top: 0.75rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-300);">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
          <div>
            <strong>Background:</strong> var(--olive-100)<br>
            <strong>Text:</strong> var(--olive-800)<br>
            <strong>Icon:</strong> TrendingUp (Lucide)
          </div>
          <div>
            <strong>Font Size:</strong> 0.875rem<br>
            <strong>Padding:</strong> 0.25rem 0.75rem<br>
            <strong>Border Radius:</strong> 9999px
          </div>
        </div>
      </div>

      <!-- File Sources Box -->
      <div style="background: var(--gray-200); padding: 0.75rem; border-radius: 4px; margin-top: 0.5rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-400);">
        <div style="font-family: monospace; color: var(--gray-700);">
          <strong>Component:</strong> _includes/components/ui/insight-category-new.html<br>
          <strong>CSS:</strong> assets/css/components/ui/insight-category-new.scss<br>
          <strong>Integration:</strong> All card variants use this component
        </div>
      </div>
    </div>
  </div>
</div>

---

## Size Variants

<div class="demo-section">
  <div class="demo-title">Component Sizing Options</div>
  <div class="demo-description">Small, medium (default), and large variants for different layout contexts</div>

  <div class="demo-grid">
    <div class="demo-item">
      <strong>Small:</strong>
      {% include components/ui/insight-category-new.html category="brand-spotlight" size="sm" %}
      <div class="component-code">size="sm"</div>

      <!-- Specifications Box -->
      <div style="background: var(--gray-100); padding: 0.75rem; border-radius: 4px; margin-top: 0.75rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-300);">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
          <div>
            <strong>Font Size:</strong> 0.75rem<br>
            <strong>Padding:</strong> 0.2rem 0.5rem<br>
            <strong>Icon Size:</strong> 12px
          </div>
          <div>
            <strong>Use Case:</strong> Compact cards<br>
            <strong>Context:</strong> Secondary placement<br>
            <strong>Min Width:</strong> Auto
          </div>
        </div>
      </div>
    </div>

    <div class="demo-item">
      <strong>Medium (Default):</strong>
      {% include components/ui/insight-category-new.html category="brand-spotlight" %}
      <div class="component-code">(no size parameter)</div>

      <!-- Specifications Box -->
      <div style="background: var(--gray-100); padding: 0.75rem; border-radius: 4px; margin-top: 0.75rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-300);">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
          <div>
            <strong>Font Size:</strong> 0.875rem<br>
            <strong>Padding:</strong> 0.25rem 0.75rem<br>
            <strong>Icon Size:</strong> 16px
          </div>
          <div>
            <strong>Use Case:</strong> Standard cards<br>
            <strong>Context:</strong> Primary placement<br>
            <strong>Min Width:</strong> Auto
          </div>
        </div>
      </div>
    </div>

    <div class="demo-item">
      <strong>Large:</strong>
      {% include components/ui/insight-category-new.html category="brand-spotlight" size="lg" %}
      <div class="component-code">size="lg"</div>

      <!-- Specifications Box -->
      <div style="background: var(--gray-100); padding: 0.75rem; border-radius: 4px; margin-top: 0.75rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-300);">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
          <div>
            <strong>Font Size:</strong> 1rem<br>
            <strong>Padding:</strong> 0.375rem 1rem<br>
            <strong>Icon Size:</strong> 20px
          </div>
          <div>
            <strong>Use Case:</strong> Featured cards<br>
            <strong>Context:</strong> Hero placement<br>
            <strong>Min Width:</strong> Auto
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

---

## Real Card Context Examples

<div class="demo-section">
  <div class="demo-title">In Card Layouts</div>
  <div class="demo-description">How the component appears in actual card implementations</div>

  <div style="display: flex; gap: 1rem; flex-wrap: wrap; margin: 1rem 0;">
    <!-- Standard insight card header -->
    <div class="card-example">
      <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.75rem;">
        {% include components/ui/insight-category-new.html category="founders-journey" size="sm" %}
        <span style="color: var(--gray-500); font-size: 0.875rem;">8 min read</span>
      </div>
      <h3 style="margin: 0 0 0.5rem 0; font-size: 1.125rem;">Sample Insight Title</h3>
      <p style="margin: 0; color: var(--gray-600); font-size: 0.875rem;">Preview of how the category badge appears in insight card headers...</p>
    </div>

    <!-- Featured card with larger badge -->
    <div class="card-example">
      {% include components/ui/insight-category-new.html category="market-momentum" %}
      <h4 style="margin: 0.75rem 0 0.5rem 0; font-size: 1rem;">Featured Card Layout</h4>
      <p style="margin: 0; color: var(--gray-600); font-size: 0.875rem;">Category badge in standard size for featured content</p>
    </div>

    <!-- Compact card with small badge -->
    <div class="card-example">
      <div style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0.5rem;">
        {% include components/ui/insight-category-new.html category="location-intelligence" size="sm" %}
        <h4 style="margin: 0; font-size: 0.875rem;">Compact Layout</h4>
      </div>
      <p style="margin: 0; color: var(--gray-600); font-size: 0.8rem;">Small badge for compact card variants</p>
    </div>
  </div>
</div>

---

## Error Handling & Fallback

<div class="demo-section">
  <div class="demo-title">Graceful Fallback Behavior</div>
  <div class="demo-description">Component handles unknown categories with gray fallback</div>

  <div class="demo-item" style="max-width: 300px;">
    <strong>Unknown Category:</strong>
    {% include components/ui/insight-category-new.html category="unknown-test" %}
    <div class="component-code">category="unknown-test" → Gray fallback</div>

    <!-- Specifications Box -->
    <div style="background: var(--gray-100); padding: 0.75rem; border-radius: 4px; margin-top: 0.75rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-300);">
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
        <div>
          <strong>Background:</strong> var(--gray-100)<br>
          <strong>Text:</strong> var(--gray-800)<br>
          <strong>Icon:</strong> None (fallback)
        </div>
        <div>
          <strong>Behavior:</strong> Graceful fallback<br>
          <strong>Display:</strong> "Unknown"<br>
          <strong>Styling:</strong> Neutral gray
        </div>
      </div>
    </div>

    <!-- File Sources Box -->
    <div style="background: var(--gray-200); padding: 0.75rem; border-radius: 4px; margin-top: 0.5rem; font-size: 0.75rem; line-height: 1.4; border: 1px solid var(--gray-400);">
      <div style="font-family: monospace; color: var(--gray-700);">
        <strong>Fallback Logic:</strong> Line 15-20 in insight-category-new.html<br>
        <strong>Error Handling:</strong> No console errors, graceful degradation
      </div>
    </div>
  </div>
</div>

---

## Component Usage Reference

<div class="demo-section">
  <div class="demo-title">Implementation Syntax</div>

  ### Basic Usage
  ```liquid
  {% raw %}{% include components/ui/insight-category-new.html category="brand-spotlight" %}
  {% include components/ui/insight-category-new.html category="founders-journey" size="sm" %}
  {% include components/ui/insight-category-new.html category="location-intelligence" size="lg" %}{% endraw %}
  ```

  ### Parameters
  - **category** (required): `brand-spotlight`, `founders-journey`, `location-intelligence`, `market-momentum`
  - **size** (optional): `sm`, `lg` (default is medium)

  ### Component Architecture Details

  <div style="background: var(--gray-50); padding: 1rem; border-radius: 6px; margin: 1rem 0; border: 1px solid var(--gray-200);">
    <h4 style="margin: 0 0 0.75rem 0; color: var(--gray-800);">File Structure & Organization</h4>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1rem;">
      <!-- Component File -->
      <div style="background: white; padding: 0.75rem; border-radius: 4px; border: 1px solid var(--gray-300);">
        <h5 style="margin: 0 0 0.5rem 0; color: var(--gray-700); font-size: 0.875rem;">Main Component</h5>
        <div style="font-family: monospace; font-size: 0.75rem; color: var(--gray-600);">
          <strong>File:</strong> _includes/components/ui/insight-category-new.html<br>
          <strong>Purpose:</strong> BEM-structured atomic component<br>
          <strong>Approach:</strong> Inline styles + CSS classes<br>
          <strong>Dependencies:</strong> Lucide icons only
        </div>
      </div>

      <!-- CSS File -->
      <div style="background: white; padding: 0.75rem; border-radius: 4px; border: 1px solid var(--gray-300);">
        <h5 style="margin: 0 0 0.5rem 0; color: var(--gray-700); font-size: 0.875rem;">Component Styles</h5>
        <div style="font-family: monospace; font-size: 0.75rem; color: var(--gray-600);">
          <strong>File:</strong> assets/css/components/ui/insight-category-new.scss<br>
          <strong>Purpose:</strong> Size variants and hover states<br>
          <strong>Approach:</strong> Minimal CSS enhancement<br>
          <strong>Dependencies:</strong> Design tokens
        </div>
      </div>

      <!-- Integration Points -->
      <div style="background: white; padding: 0.75rem; border-radius: 4px; border: 1px solid var(--gray-300);">
        <h5 style="margin: 0 0 0.5rem 0; color: var(--gray-700); font-size: 0.875rem;">Integration Points</h5>
        <div style="font-family: monospace; font-size: 0.75rem; color: var(--gray-600);">
          <strong>Used in:</strong> _includes/components/cards/insight-card.html<br>
          <strong>Variants:</strong> Standard, tagged, featured, compact<br>
          <strong>Coverage:</strong> 100% of insight card displays<br>
          <strong>Status:</strong> Production ready
        </div>
      </div>
    </div>
  </div>

  ### Technical Implementation

  <div style="background: var(--gray-50); padding: 1rem; border-radius: 6px; margin: 1rem 0; border: 1px solid var(--gray-200);">
    <h4 style="margin: 0 0 0.75rem 0; color: var(--gray-800);">Component Parameters & Styling</h4>

    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
      <!-- Parameters -->
      <div style="background: white; padding: 0.75rem; border-radius: 4px; border: 1px solid var(--gray-300);">
        <h5 style="margin: 0 0 0.5rem 0; color: var(--gray-700); font-size: 0.875rem;">Available Parameters</h5>
        <div style="font-family: monospace; font-size: 0.75rem; color: var(--gray-600); line-height: 1.5;">
          <strong>category</strong> (required):<br>
          &nbsp;&nbsp;brand-spotlight | founders-journey |<br>
          &nbsp;&nbsp;location-intelligence | market-momentum<br><br>
          <strong>size</strong> (optional):<br>
          &nbsp;&nbsp;sm | md (default) | lg
        </div>
      </div>

      <!-- Styling Approach -->
      <div style="background: white; padding: 0.75rem; border-radius: 4px; border: 1px solid var(--gray-300);">
        <h5 style="margin: 0 0 0.5rem 0; color: var(--gray-700); font-size: 0.875rem;">Styling Strategy</h5>
        <div style="font-family: monospace; font-size: 0.75rem; color: var(--gray-600); line-height: 1.5;">
          <strong>Colors:</strong> Inline styles (guaranteed)<br>
          <strong>Sizing:</strong> CSS classes (responsive)<br>
          <strong>Icons:</strong> Embedded SVG (no dependencies)<br>
          <strong>Fallback:</strong> Gray styling for unknown categories
        </div>
      </div>
    </div>
  </div>
</div>

---

<div class="official-colors-banner">
  <h3 style="color: #856404; margin: 0 0 1rem 0;">🎨 Official Brandmine Color Standards</h3>
  <p style="color: #856404; margin: 0 0 1rem 0; font-weight: 600;">
    These are the OFFICIAL colors defined in Brandmine's design system. Never change these.
  </p>
  <div class="color-grid">
    <div>
      <h4 style="color: #856404; margin: 0 0 0.5rem 0;">Insight Categories</h4>
      <ul style="margin: 0; color: #856404; font-size: 0.9rem;">
        <li><strong>Brand Spotlight:</strong> Secondary Orange (#F97316)</li>
        <li><strong>Founder's Journey:</strong> Accent Indigo (#6366F1)</li>
        <li><strong>Location Intelligence:</strong> Sky Blue (#0EA5E9)</li>
        <li><strong>Market Momentum:</strong> Olive Green (#84CC16)</li>
      </ul>
    </div>
    <div>
      <h4 style="color: #856404; margin: 0 0 0.5rem 0;">Aligned with Dimensions</h4>
      <ul style="margin: 0; color: #856404; font-size: 0.9rem;">
        <li><strong>Brand Spotlight</strong> = Attributes (secondary)</li>
        <li><strong>Founder's Journey</strong> = Signals (accent)</li>
        <li><strong>Location Intelligence</strong> = Markets (sky)</li>
        <li><strong>Market Momentum</strong> = Sectors (olive)</li>
      </ul>
    </div>
  </div>
</div>

---
