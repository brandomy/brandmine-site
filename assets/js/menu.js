// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
  // Get the menu toggle button
  const menuToggle = document.querySelector('.menu-toggle');
  
  // Force menu closed state on page load
  document.body.classList.remove('menu-open');
  
  // Only proceed if the button exists
  if (menuToggle) {
    // Add click event listener to toggle button
    menuToggle.addEventListener('click', function() {
      // Toggle the menu-open class on the document body
      document.body.classList.toggle('menu-open');
      
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
      }
    });
    
    // Close menu when pressing Escape key
    document.addEventListener('keydown', function(event) {
      if (event.key === 'Escape' && document.body.classList.contains('menu-open')) {
        document.body.classList.remove('menu-open');
        menuToggle.setAttribute('aria-expanded', 'false');
      }
    });
  }
});