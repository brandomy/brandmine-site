// Updated menu.js for BEM-based header

document.addEventListener('DOMContentLoaded', function () {
  const menuToggle = document.querySelector('.header__toggle');
  const nav = document.querySelector('.header__nav');
  const dropdowns = document.querySelectorAll('.header__dropdown');

  // Toggle the main nav menu on mobile
  if (menuToggle && nav) {
    menuToggle.addEventListener('click', function (e) {
      e.stopPropagation();
      this.classList.toggle('is-open');
      nav.classList.toggle('is-open');
      menuToggle.setAttribute('aria-expanded', nav.classList.contains('is-open'));
    });
  }

  // Toggle dropdowns on mobile
  dropdowns.forEach(dropdown => {
    const dropbtn = dropdown.querySelector('a');
    const dropdownIcon = dropdown.querySelector('.header__dropdown-icon');
    
    if (dropbtn) {
      // Complete link behavior should be normal on desktop
      dropbtn.addEventListener('click', function (e) {
        if (window.innerWidth <= 768) { // --breakpoint-md
          // On mobile, prevent navigation for the entire dropdown button
          e.preventDefault();
        }
      });

      // Add keyboard support for dropdown navigation
      dropbtn.addEventListener('keydown', function(e) {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          dropdown.classList.toggle('open');
          dropbtn.setAttribute('aria-expanded', dropdown.classList.contains('open'));
        }
      });

      
      // Make the dropdown icon toggle the dropdown state
      if (dropdownIcon) {
        dropdownIcon.addEventListener('click', function (e) {
          if (window.innerWidth <= 768) { // --breakpoint-md
            e.preventDefault();
            e.stopPropagation(); // Prevent parent link click
            
            dropdown.classList.toggle('header__dropdown--open');
            
            // Set aria-expanded for accessibility
            const isExpanded = dropdown.classList.contains('open');
            dropbtn.setAttribute('aria-expanded', isExpanded);
            
            // Close other dropdowns when opening this one
            if (isExpanded) {
              dropdowns.forEach(otherDropdown => {
                if (otherDropdown !== dropdown && otherDropdown.classList.contains('open')) {
                  otherDropdown.classList.remove('open');
                  const otherBtn = otherDropdown.querySelector('a');
                  if (otherBtn) otherBtn.setAttribute('aria-expanded', 'false');
                }
              });
            }
          }
        });
      }
    }
  });

  // Close menu if clicking outside
  document.addEventListener('click', function (e) {
    if (nav && nav.classList.contains('is-open')) {
      if (!nav.contains(e.target) && !menuToggle.contains(e.target)) {
        nav.classList.remove('is-open');
        menuToggle.classList.remove('is-open');
      }
    }
  });

  // Clean up dropdown states on resize
  window.addEventListener('resize', function () {
    if (window.innerWidth > 768) { // --breakpoint-md
      dropdowns.forEach(dropdown => dropdown.classList.remove('open'));
    }
  });
});
