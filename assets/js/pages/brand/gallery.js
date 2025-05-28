// assets/js/pages/brand/gallery.js
document.addEventListener('DOMContentLoaded', function() {
  const galleryItems = document.querySelectorAll('.brand-gallery__item');

  // Add click interaction hint
  galleryItems.forEach(item => {
    item.style.cursor = 'pointer';
    item.setAttribute('tabindex', '0');

    // Simple click handler to open image in new tab
    item.addEventListener('click', function() {
      const img = this.querySelector('img');
      window.open(img.src, '_blank');
    });
  });
});
