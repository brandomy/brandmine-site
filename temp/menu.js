document.addEventListener('DOMContentLoaded', function () {
  const menuToggle = document.querySelector('.header__menu-toggle');
  const nav = document.querySelector('.header__nav');
  const dropdowns = document.querySelectorAll('.header__dropdown');

  if (menuToggle && nav) {
    menuToggle.addEventListener('click', function (e) {
      e.stopPropagation();
      this.classList.toggle('header__menu-toggle--active');
      nav.classList.toggle('header__nav--active');
    });
  }

  dropdowns.forEach(dropdown => {
    const toggle = dropdown.querySelector('.header__dropdown-toggle');
    if (toggle) {
      toggle.addEventListener('click', function (e) {
        if (window.innerWidth <= 768) {
          e.preventDefault();
          dropdown.classList.toggle('header__dropdown--open');
        }
      });
    }
  });

  document.addEventListener('click', function (e) {
    if (nav && nav.classList.contains('header__nav--active')) {
      if (!nav.contains(e.target) && !menuToggle.contains(e.target)) {
        nav.classList.remove('header__nav--active');
        menuToggle.classList.remove('header__menu-toggle--active');
      }
    }
  });

  window.addEventListener('resize', function () {
    if (window.innerWidth > 768) {
      dropdowns.forEach(dropdown => {
        dropdown.classList.remove('header__dropdown--open');
      });
    }
  });
});
