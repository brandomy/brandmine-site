// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
  // Get the menu toggle button
  const menuToggle = document.querySelector('.menu-toggle');
  const siteNav = document.querySelector('.site-nav');
  
  // Force menu closed state on page load
  document.body.classList.remove('menu-open');
  
  // Only proceed if the button exists
  if (menuToggle) {
    // Add click event listener to toggle button
    menuToggle.addEventListener('click', function() {
      // Toggle the menu-open class on the document body
      document.body.classList.toggle('menu-open');
      
      // Also toggle active classes for mobile styling
      siteNav.classList.toggle('active');
      menuToggle.classList.toggle('active');
      
      // Debug: Log when button is clicked
      console.log("Menu toggle clicked");
      console.log("Menu open state:", document.body.classList.contains('menu-open'));
      
      // Update aria-expanded attribute for accessibility
      const isExpanded = document.body.classList.contains('menu-open');
      menuToggle.setAttribute('aria-expanded', isExpanded);
    });
    
    // Initially set aria-expanded to false
    menuToggle.setAttribute('aria-expanded', 'false');
    
    // Close menu when clicking outside navigation
    document.addEventListener('click', function(event) {
      const isMenuOpen = document.body.classList.contains('menu-open');
      const isClickInsideNav = event.target.closest('.site-nav');
      const isClickOnToggle = event.target.closest('.menu-toggle');
      
      if (isMenuOpen && !isClickInsideNav && !isClickOnToggle) {
        document.body.classList.remove('menu-open');
        menuToggle.setAttribute('aria-expanded', 'false');
        siteNav.classList.remove('active');
        menuToggle.classList.remove('active');
      }
    });
    
    // Close menu when pressing Escape key
    document.addEventListener('keydown', function(event) {
      if (event.key === 'Escape' && document.body.classList.contains('menu-open')) {
        document.body.classList.remove('menu-open');
        menuToggle.setAttribute('aria-expanded', 'false');
        siteNav.classList.remove('active');
        menuToggle.classList.remove('active');
      }
    });
  }
  
  // Handle mobile dropdowns
  const dropdowns = document.querySelectorAll('.dropdown');

  // Function to close all dropdowns
  function closeAllDropdowns() {
    dropdowns.forEach(d => {
      d.classList.remove('open');
    });
  }

  dropdowns.forEach(dropdown => {
    const button = dropdown.querySelector('.dropbtn');
    if (button) {
      button.addEventListener('click', function(e) {
        // Only intercept clicks on mobile
        if (window.innerWidth <= 768) {
          e.preventDefault();
          e.stopPropagation(); // Important to prevent menu from closing
          
          // Check if this dropdown is already open
          const isOpen = dropdown.classList.contains('open');
          
          // Close all other dropdowns first
          closeAllDropdowns();
          
          // Toggle this dropdown (open if it was closed)
          if (!isOpen) {
            dropdown.classList.add('open');
            console.log("Dropdown opened:", dropdown);
          }
          
          // Create a click handler to close dropdown when clicking outside
          const dropdownClickHandler = function(clickEvent) {
            // Only close if click is outside the dropdown
            if (!dropdown.contains(clickEvent.target)) {
              dropdown.classList.remove('open');
              document.removeEventListener('click', dropdownClickHandler);
            }
          };
          
          // Add a slight delay before adding the click handler
          setTimeout(() => {
            // Only add handler if dropdown is open
            if (dropdown.classList.contains('open')) {
              document.addEventListener('click', dropdownClickHandler);
            }
          }, 10);
        }
      });
    }
  });
  
  // Ensure proper state when window is resized
  window.addEventListener('resize', function() {
    if (window.innerWidth > 768) {
      // Reset dropdown open states on larger screens
      dropdowns.forEach(dropdown => {
        dropdown.classList.remove('open');
      });
    }
  });
});