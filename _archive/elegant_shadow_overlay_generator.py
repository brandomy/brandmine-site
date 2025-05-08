from PIL import Image, ImageDraw, ImageFilter, ImageChops

# === Settings ===
size = 2048
dpi = (300, 300)
shadow_color = (51, 51, 51, 45)  # #333333 with ~18% opacity
blur_radius = 150

# === Base transparent image ===
image = Image.new("RGBA", (size, size), (0, 0, 0, 0))
draw = ImageDraw.Draw(image)

# === Edge shadows (vignette effect) ===
for i in range(0, 200, 10):
    alpha = max(0, int(shadow_color[3] * (1 - i / 200)))
    color = (shadow_color[0], shadow_color[1], shadow_color[2], alpha)
    draw.rectangle([i, i, size - i, size - i], outline=color)

# === Interior shadow — create grayscale layer
interior = Image.new("L", (size, size), 0)
interior_draw = ImageDraw.Draw(interior)
interior_draw.ellipse([size//4, size//4, 3*size//4, 3*size//4], fill=40)
interior = interior.filter(ImageFilter.GaussianBlur(100))

# === Add interior shadow to alpha channel
r, g, b, a = image.split()
a = ImageChops.add(a, interior)
image = Image.merge("RGBA", (r, g, b, a))

# === Final softening
image = image.filter(ImageFilter.GaussianBlur(blur_radius))

# === Save as PNG with DPI
output_path = "shadow_overlay_2048x2048.png"
image.save(output_path, dpi=dpi)

print(f"✅ Saved: {output_path}")