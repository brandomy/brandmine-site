// assets/js/menu.js

document.addEventListener('DOMContentLoaded', function() {
  // Get essential elements
  const menuToggle = document.querySelector('.menu-toggle');
  const siteNav = document.querySelector('.site-nav');
  const dropdowns = document.querySelectorAll('.dropdown');
  
  // Toggle mobile menu
  if (menuToggle && siteNav) {
    menuToggle.addEventListener('click', function(e) {
      e.stopPropagation();
      this.classList.toggle('active');
      siteNav.classList.toggle('active');
      console.log("Menu toggle clicked, active:", siteNav.classList.contains('active'));
    });
  }
  
  // Handle mobile dropdown toggles
  dropdowns.forEach(dropdown => {
    const dropbtn = dropdown.querySelector('.dropbtn');
    if (dropbtn) {
      dropbtn.addEventListener('click', function(e) {
        // Only handle as toggle on mobile
        if (window.innerWidth <= 768) {
          e.preventDefault();
          dropdown.classList.toggle('open');
          console.log("Dropdown toggled:", dropdown.classList.contains('open'));
        }
      });
    }
  });
  
  // Close menu when clicking outside
  document.addEventListener('click', function(e) {
    if (siteNav && siteNav.classList.contains('active')) {
      if (!siteNav.contains(e.target) && !menuToggle.contains(e.target)) {
        siteNav.classList.remove('active');
        menuToggle.classList.remove('active');
        console.log("Closing menu from outside click");
      }
    }
  });
  
  // Reset menu state on window resize
  window.addEventListener('resize', function() {
    if (window.innerWidth > 768) {
      // Reset open states when returning to desktop
      dropdowns.forEach(dropdown => {
        dropdown.classList.remove('open');
      });
    }
  });
});