/**
 * Hamburger Menu Toggle Script
 * 
 * This script provides the functionality for the mobile hamburger menu.
 * When the menu button is clicked, the navigation is shown or hidden.
 */
document.addEventListener('DOMContentLoaded', function() {
    // Get the menu toggle button and navigation element
    const menuToggle = document.querySelector('.menu-toggle');
    const siteNav = document.querySelector('.site-nav');
    
    // Only proceed if both elements exist
    if (menuToggle && siteNav) {
      // Add click event to toggle button
      menuToggle.addEventListener('click', function(event) {
        // Prevent default action
        event.preventDefault();
        
        // Toggle active class on navigation
        siteNav.classList.toggle('active');
        
        // Update ARIA expanded attribute for accessibility
        const isExpanded = siteNav.classList.contains('active');
        menuToggle.setAttribute('aria-expanded', isExpanded);
      });
      
      // Close menu when clicking outside
      document.addEventListener('click', function(event) {
        // Check if click was outside menu and toggle button
        if (!menuToggle.contains(event.target) && 
            !siteNav.contains(event.target) && 
            siteNav.classList.contains('active')) {
          // Close the menu
          siteNav.classList.remove('active');
          menuToggle.setAttribute('aria-expanded', 'false');
        }
      });
      
      // Prevent clicks inside the menu from closing it
      siteNav.addEventListener('click', function(event) {
        event.stopPropagation();
      });
    }
  });