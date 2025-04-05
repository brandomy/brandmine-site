// Updated menu.js for BEM-based header

document.addEventListener('DOMContentLoaded', function () {
  const menuToggle = document.querySelector('.header__toggle');
  const nav = document.querySelector('.header__nav');
  const dropdowns = document.querySelectorAll('.header__dropdown');

  // Toggle the main nav menu on mobile
  if (menuToggle && nav) {
    menuToggle.addEventListener('click', function (e) {
      e.stopPropagation();
      this.classList.toggle('active');
      nav.classList.toggle('active');
    });
  }

  // Toggle dropdowns on mobile
  dropdowns.forEach(dropdown => {
    const dropbtn = dropdown.querySelector('.header__dropbtn');
    if (dropbtn) {
      dropbtn.addEventListener('click', function (e) {
        if (window.innerWidth <= 768) {
          e.preventDefault();
          dropdown.classList.toggle('open');
        }
      });
    }
  });

  // Close menu if clicking outside
  document.addEventListener('click', function (e) {
    if (nav && nav.classList.contains('active')) {
      if (!nav.contains(e.target) && !menuToggle.contains(e.target)) {
        nav.classList.remove('active');
        menuToggle.classList.remove('active');
      }
    }
  });

  // Clean up dropdown states on resize
  window.addEventListener('resize', function () {
    if (window.innerWidth > 768) {
      dropdowns.forEach(dropdown => dropdown.classList.remove('open'));
    }
  });
});

// Handle mobile dropdown toggles
dropdowns.forEach(dropdown => {
  const dropbtn = dropdown.querySelector('.dropbtn');
  if (dropbtn) {
    dropbtn.addEventListener('click', function(e) {
      if (window.innerWidth <= 768) {
        e.preventDefault();
        dropdown.classList.toggle('open');
      }
    });
  }
});