// /assets/js/pages/dimension/dimension-filtering.js
document.addEventListener('DOMContentLoaded', function() {
  // Brand filtering functionality
  const searchInput = document.getElementById('brandsSearchInput');
  const sortSelect = document.getElementById('brandsSortSelect');
  const marketSelect = document.getElementById('brandsMarketSelect');
  const brandItems = document.querySelectorAll('.dimension-all-brands__list-item');
  const loadMoreBtn = document.getElementById('loadMoreBrands');

  let visibleCount = 20;

  // Initial setup - hide items beyond the initial count
  if (brandItems.length > visibleCount) {
    for (let i = visibleCount; i < brandItems.length; i++) {
      brandItems[i].style.display = 'none';
    }
  }

  // Load more function
  if (loadMoreBtn) {
    loadMoreBtn.addEventListener('click', function() {
      visibleCount += 20;

      // Show more items
      for (let i = 0; i < Math.min(visibleCount, brandItems.length); i++) {
        if (brandItems[i].classList.contains('filtered-in')) {
          brandItems[i].style.display = 'flex';
        }
      }

      // Hide button if all items are shown
      if (visibleCount >= brandItems.length) {
        loadMoreBtn.style.display = 'none';
      }
    });
  }

  // Filter function
  function filterBrands() {
    const searchTerm = searchInput ? searchInput.value.toLowerCase() : '';
    const sortValue = sortSelect ? sortSelect.value : 'name-asc';
    const marketValue = marketSelect ? marketSelect.value : 'all';

    // Reset visible count
    visibleCount = 20;

    // Show load more button if it exists
    if (loadMoreBtn) {
      loadMoreBtn.style.display = 'block';
    }

    // Filter items
    let filteredItems = Array.from(brandItems).filter(item => {
      const name = item.getAttribute('data-name').toLowerCase();
      const market = item.getAttribute('data-market').toLowerCase();

      const matchesSearch = !searchTerm || name.includes(searchTerm);
      const matchesMarket = marketValue === 'all' || market === marketValue;

      const showItem = matchesSearch && matchesMarket;

      // Add/remove filtered-in class
      if (showItem) {
        item.classList.add('filtered-in');
      } else {
        item.classList.remove('filtered-in');
      }

      return showItem;
    });

    // Sort items
    filteredItems.sort((a, b) => {
      const nameA = a.getAttribute('data-name');
      const nameB = b.getAttribute('data-name');

      if (sortValue === 'name-asc') {
        return nameA.localeCompare(nameB);
      } else if (sortValue === 'name-desc') {
        return nameB.localeCompare(nameA);
      }
      // Add more sorting options as needed
      return 0;
    });

    // Update DOM order based on sorting
    const container = document.querySelector('.dimension-all-brands__list');
    filteredItems.forEach(item => container.appendChild(item));

    // Update visibility based on count
    filteredItems.forEach((item, index) => {
      item.style.display = index < visibleCount ? 'flex' : 'none';
    });

    // Update load more button visibility
    if (loadMoreBtn) {
      loadMoreBtn.style.display = filteredItems.length > visibleCount ? 'block' : 'none';
    }
  }

  // Set up event listeners
  if (searchInput) {
    searchInput.addEventListener('input', filterBrands);
  }

  if (sortSelect) {
    sortSelect.addEventListener('change', filterBrands);
  }

  if (marketSelect) {
    marketSelect.addEventListener('change', filterBrands);
  }

  // Carousel functionality
  const carousel = document.querySelector('.dimension-related-brands__carousel');
  const dots = document.querySelectorAll('.dimension-related-brands__carousel-dot');

  if (carousel && dots.length) {
    dots.forEach((dot, index) => {
      dot.addEventListener('click', function() {
        // Calculate scroll position
        const cardWidth = 280; // Approximate width of a card
        const gapWidth = 16; // Approximate gap between cards
        const scrollAmount = index * (cardWidth + gapWidth) * 3; // 3 cards per page

        // Smooth scroll to position
        carousel.scrollTo({
          left: scrollAmount,
          behavior: 'smooth'
        });

        // Update active dot
        dots.forEach(d => d.classList.remove('dimension-related-brands__carousel-dot--active'));
        dot.classList.add('dimension-related-brands__carousel-dot--active');
      });
    });

    // Update dots on scroll
    carousel.addEventListener('scroll', function() {
      const scrollPosition = carousel.scrollLeft;
      const cardWidth = 280 + 16; // card + gap
      const visibleCards = 3;
      const pageWidth = cardWidth * visibleCards;

      const activePage = Math.floor(scrollPosition / pageWidth);

      dots.forEach((dot, index) => {
        if (index === activePage) {
          dot.classList.add('dimension-related-brands__carousel-dot--active');
        } else {
          dot.classList.remove('dimension-related-brands__carousel-dot--active');
        }
      });
    });
  }
});
