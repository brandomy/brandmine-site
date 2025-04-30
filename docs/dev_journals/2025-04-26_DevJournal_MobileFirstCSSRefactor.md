# 📄 2025-04-26_DevJournal_MobileFirstCSSRefactor.md

---

## 1. Problem Statement
We identified inconsistency in the way breakpoints were handled across the Brandmine CSS files, particularly in discovery and navigation-related components.  
Specifically:
- Mixed use of `min-width` and `max-width` media queries.
- Some layouts depended on `max-width` shrinkage instead of `min-width` progressive enhancement.
- Risk of layout overlaps at critical device transition points (e.g., mobile to tablet).

✅ Goal: **Enforce a clean, mobile-first responsive CSS strategy** across all critical frontend files.

---

## 2. Approach
We agreed to:
- Audit all files containing `@media` queries.
- Standardize breakpoints according to Brandmine’s Component System:
  - `min-width: 480px`
  - `min-width: 768px`
  - `min-width: 992px`
- Eliminate dependency on `max-width` media queries for layout control (except for very tiny screen exceptions, e.g., 479px).
- Rewrite mobile defaults directly into base CSS.
- Use `min-width` only for enhancements as screen size increases.

---

## 3. Implementation Details

### 🔧 Corrected Breakpoint Structure:
```css
/* Base mobile-first layout */
.component {
  display: flex;
  flex-direction: column;
}

/* Small devices */
@media (min-width: 480px) {
  .component {
    gap: var(--space-4);
  }
}

/* Tablets */
@media (min-width: 768px) {
  .component {
    flex-direction: row;
  }
}

/* Desktops */
@media (min-width: 992px) {
  .component {
    padding: var(--space-8);
  }
}
```

---

### 🔧 Key CSS Files Refactored:
- `/assets/css/pages/dimension-specific/discover-attributes.css`
- `/assets/css/pages/dimension-specific/discover-markets.css`
- `/assets/css/pages/dimension-specific/discover-sectors.css`
- `/assets/css/pages/dimension-specific/discover-signals.css`
- `/assets/css/pages/dimension-specific/russian-sectors.css`
- `/assets/css/collections/dimensions/dimensions.css`
- `/assets/css/components/navigation/discovery-navigation.css`

---

### 🔧 Commands Used During Audit:
```bash
grep -r "@media (" assets/css/
grep -r "@media (min-width:" assets/css/ | wc -l
grep -r "@media (max-width:" assets/css/ | wc -l
diff -r assets/css assets/css-backup
```

---

## 4. Decisions Made

| Decision | Rationale |
|:---------|:----------|
| Replace `@media (max-width: 767px)` with `@media (min-width: 768px)` logic | Prevents overlap at breakpoint boundaries; true mobile-first expansion |
| Set default mobile styles directly without media queries | Reduces dependency on media queries; improves load performance |
| Retain `@media (max-width: 479px)` for tiny mobile device scrolling | Acceptable for very small screens; no need to enforce `min-width` there |
| Fully rewrite Discovery Navigation and Dimension Discovery layouts | Ensures navigation behaves predictably across screen sizes |

---

## 5. Resources

### 📚 Standard Breakpoints
| Label | Media Query |
|:------|:------------|
| Small devices | `@media (min-width: 480px)` |
| Medium devices (Tablet) | `@media (min-width: 768px)` |
| Large devices (Desktop) | `@media (min-width: 992px)` |

### 📚 Consistency Rules
- Mobile styles first.
- Use `min-width` media queries only to layer enhancements.
- Only use `max-width` at ultra-small device thresholds (≤479px).

---

## 6. Insights & Learning

- **Mobile-First CSS** means your base styles should assume small screens.
- **Min-width media queries** progressively enhance layouts for larger devices.
- **Avoid mixed min/max-width** strategies — they lead to maintenance problems and responsive glitches.
- **Base first, grow second**: design for constraints, not for luxury, then add luxuries.
- **Consistent Breakpoints** at exact pixel values (e.g., 767px/768px) prevent overlap.

---
✅ **Important Technique:**  
When fixing legacy CSS, always start by identifying if the base styles are mobile-appropriate.  
If not, *invert the logic*: make the smaller layout default, then add bigger layouts at breakpoints.

---

## 7. Next Actions

| Task | Priority | Notes |
|:-----|:--------:|:------|
| Final QA pass on mobile devices (≤480px, ≤768px, ≤992px) | High | Make sure navigation, discovery tabs, and grid layouts behave properly. |
| Document Brandmine frontend standards in project wiki | Medium | Summarize mobile-first strategy and CSS organization for future contributors. |
| Consider SCSS variables for breakpoints | Low | Easier future editing if breakpoint values change. |
| Explore using `clamp()` for font sizes | Optional | Smoother text scaling between breakpoints. |

---

# ✅ End of Journal
