
# 📦 Image Conversion Scripts for Brandmine Jekyll Site

This document provides two optimized shell scripts to convert flat SVG-based PNG illustrations into lighter web-friendly formats for your Jekyll site: **JPG** and **WebP**. These ensure fast load times and better SEO without compromising the clarity of your design language.

---

## ✅ Why Optimize?

| Format | Pros | When to Use |
|--------|------|-------------|
| **JPG** | High quality, small size | Best for flat, opaque images with no transparency |
| **WebP** | Next-gen, even smaller | Ideal for modern browsers, best performance |

---

## 🛠 JPG Conversion Script

**Filename:** `convert-to-jpg.sh`

```bash
#!/bin/bash

# Batch convert all PNGs in the current folder to optimized JPGs
# Requirements: imagemagick installed (`brew install imagemagick`)

mkdir -p jpg_output

for img in *.png; do
  base=$(basename "$img" .png)
  convert "$img" -strip -interlace Plane -quality 85 "jpg_output/$base.jpg"
  echo "Converted $img → jpg_output/$base.jpg"
done

echo "✅ All PNGs converted to JPGs in the jpg_output folder."
```

### 🔑 Features:
- Removes metadata (`-strip`)
- Progressive loading (`-interlace Plane`)
- Balanced quality and compression (`-quality 85`)

---

## 🖼 WebP Conversion Script

**Filename:** `convert-to-webp.sh`

```bash
#!/bin/bash

# Batch convert all PNGs in the current folder to WebP format
# Requirements: imagemagick with WebP support (`brew install imagemagick`)

mkdir -p webp_output

for img in *.png; do
  base=$(basename "$img" .png)
  convert "$img" -strip -quality 85 "webp_output/$base.webp"
  echo "Converted $img → webp_output/$base.webp"
done

echo "✅ All PNGs converted to WebP in the webp_output folder."
```

### 🔑 Features:
- WebP format: ~25–40% smaller than JPG with similar quality
- Ideal for modern browser performance

---

## 💡 Recommendation

Use **JPG** if you need wide compatibility.  
Use **WebP** if you're optimizing for modern browsers and max performance.  
You can even **generate both** and serve the best format with `<picture>` tags or `srcset` in your Jekyll templates.

